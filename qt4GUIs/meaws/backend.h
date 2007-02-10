/*
** Copyright (C) 2007 Graham Percival <gperciva@uvic.ca>
**  
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
** 
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
** 
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software 
** Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

#include <QObject>
#include "MarSystemManager.h"
#include "../MarSystemQtWrapper.h"
#include "EvExpr.h"
#include "ExVal.h"
#include "ExCommon.h"

using namespace Marsyas;

class MarBackend: public QObject {
	Q_OBJECT

public:
	MarBackend();
	~MarBackend();
// "constructor"
	void startGraham();
	void startMathieu();

// communication with the QT front-end
public slots:
  void setTempo(int tempo);
	void stopMetro();
	void startMetro();

private:
	MarSystemQtWrapper *mrsWrapper;

// "constructor"
	void startCommon();

// metronome stuff
  EvExpr *e;
  MarSystem *metroNet;
  MarControlPtr filenamePtr;

// pitch extracting stuff  (INCOMPLETE)
	void startPitchNet(string sfName);
	void stopPitchNet();
	MarSystem *pitchExtractor;
};

