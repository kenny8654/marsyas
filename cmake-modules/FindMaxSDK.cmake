# Clean all variables first!!
set(MAXSDK_MAX_INCLUDE_DIR NOTFOUND)
set(MAXSDK_MSP_INCLUDE_DIR NOTFOUND)
set(MAXSDK_API_LIBRARY NOTFOUND)
set(MAXSDK_AUDIO_LIBRARY NOTFOUND)
set(MAXSDK_CRT_LIBRARY NOTFOUND)

find_path(MAXSDK_MAINPATH "c74support/max-includes/MaxAPI.lib" DOC "Insert main path to MaxSDK (download it from http://cycling74.com/products/sdk/ for both MacOSX and Windows)")

# Just to test if Max/MSP found!!
if(MAXSDK_MAINPATH)
	find_path(MAXSDK_MAX_INCLUDE_DIR MaxAPI.lib HINTS "${MAXSDK_MAINPATH}/c74support/max-includes/")
	if(MAXSDK_MAX_INCLUDE_DIR)
		set(MAXSDK_FOUND TRUE)
		message (STATUS "Max/MSP SDK Found at: ${MAXSDK_MAINPATH}")
	else(MAXSDK_MAX_INCLUDE_DIR)
		message (SEND_ERROR "Couldn't find: MAXSDK")
	endif(MAXSDK_MAX_INCLUDE_DIR)
endif(MAXSDK_MAINPATH)


if (MAXSDK_FOUND)
	
	find_path(MAXSDK_MAX_INCLUDE_DIR MaxAPI.lib HINTS "${MAXSDK_MAINPATH}/c74support/max-includes/")
	find_path(MAXSDK_MSP_INCLUDE_DIR MaxAudio.lib HINTS "${MAXSDK_MAINPATH}/c74support/msp-includes/")

	if(MAXSDK_MAX_INCLUDE_DIR AND MAXSDK_MSP_INCLUDE_DIR)
		message (STATUS "Found Max/MSP SDK Headers at: ${MAXSDK_MAX_INCLUDE_DIR}; ${MAXSDK_MSP_INCLUDE_DIR}")
	else(MAXSDK_MAX_INCLUDE_DIR AND MAXSDK_MSP_INCLUDE_DIR)
		message (SEND_ERROR "${MAXSDK_MAX_INCLUDE_DIR}; ${MAXSDK_MSP_INCLUDE_DIR}")
	endif(MAXSDK_MAX_INCLUDE_DIR AND MAXSDK_MSP_INCLUDE_DIR)


	if(MARSYAS_MACOSX)	

		#find frameworks on MacOSX
		find_library(MAXSDK_API_LIBRARY NAMES MaxAPI HINTS "${MAXSDK_MAINPATH}/c74support/max-includes/")
		find_library(MAXSDK_AUDIO_LIBRARY NAMES MaxAudioAPI HINTS "${MAXSDK_MAINPATH}/c74support/msp-includes/")

		if(MAXSDK_API_LIBRARY AND MAXSDK_AUDIO_LIBRARY)
			message (STATUS "Found Max/MSP SDK Frameworks at: ${MAXSDK_API_LIBRARY}; ${MAXSDK_AUDIO_LIBRARY}")
		else(MAXSDK_MAX_INCLUDE_DIR AND MAXSDK_MSP_INCLUDE_DIR)
			message (SEND_ERROR "${MAXSDK_API_LIBRARY}; ${MAXSDK_AUDIO_LIBRARY}")
		endif(MAXSDK_API_LIBRARY AND MAXSDK_AUDIO_LIBRARY)


	elseif(MARSYAS_WIN32)
	
		find_library(MAXSDK_API_LIBRARY NAMES MaxAPI.lib HINTS "${MAXSDK_MAINPATH}/c74support/max-includes/")
		find_library(MAXSDK_AUDIO_LIBRARY NAMES MaxAudio.lib HINTS "${MAXSDK_MAINPATH}/c74support/msp-includes/")
		find_library(MAXSDK_CRT_LIBRARY NAMES maxcrt.lib HINTS "${MAXSDK_MAINPATH}/c74support/max-includes/")

		if(MAXSDK_API_LIBRARY AND MAXSDK_AUDIO_LIBRARY AND MAXSDK_CRT_LIBRARY)
			message (STATUS "Found Max/MSP SDK Headers at: ${MAXSDK_API_LIBRARY}; ${MAXSDK_AUDIO_LIBRARY}; ${MAXSDK_CRT_LIBRARY}")
		else(MAXSDK_MAX_INCLUDE_DIR AND MAXSDK_MSP_INCLUDE_DIR AND MAXSDK_CRT_LIBRARY)
			message (SEND_ERROR "${MAXSDK_API_LIBRARY}; ${MAXSDK_AUDIO_LIBRARY}; ${MAXSDK_CRT_LIBRARY}")
		endif(MAXSDK_API_LIBRARY AND MAXSDK_AUDIO_LIBRARY AND MAXSDK_CRT_LIBRARY)

	endif(MARSYAS_MACOSX)

endif (MAXSDK_FOUND)