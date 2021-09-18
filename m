Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F0C4108D5
	for <lists+linux-media@lfdr.de>; Sun, 19 Sep 2021 00:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240349AbhIRW2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 18:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbhIRW2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 18:28:34 -0400
X-Greylist: delayed 132 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 18 Sep 2021 15:27:10 PDT
Received: from SpacedOut.fries.net (SpacedOut.fries.net [IPv6:2001:470:3832:200::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5B0C061574
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 15:27:10 -0700 (PDT)
Received: from SpacedOut.fries.net (ip6-localhost [IPv6:0:0:0:0:0:0:0:1])
        by SpacedOut.fries.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTPS id 18IMOuMN018810
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 17:24:56 -0500
Received: (from david@localhost)
        by SpacedOut.fries.net (8.15.2/8.15.2/Submit) id 18IMOucH018809
        for linux-media@vger.kernel.org; Sat, 18 Sep 2021 17:24:56 -0500
Date:   Sat, 18 Sep 2021 17:24:56 -0500
From:   David Fries <David@Fries.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH] qv4l2: Add capture toggle and close hotkeys to CaptureWin
Message-ID: <20210918222456.GA18760@spacedout.fries.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.5.11 (SpacedOut.fries.net [IPv6:::1]); Sat, 18 Sep 2021 17:24:56 -0500 (CDT)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It can be inconvenient to stop or start the stream when the capture
window obscures most or all of the application window.  Register the
current application window stream toggle QAction to the capture
window as well.  Register a more standard Control-W to close the
window.  Add both to the context menu to allow them to be visible and
discovered.

Signed-off-by: David Fries <David@Fries.net>
---
 utils/qv4l2/capture-win.cpp | 23 +++++++++++++++++++----
 utils/qv4l2/capture-win.h   |  2 +-
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/utils/qv4l2/capture-win.cpp b/utils/qv4l2/capture-win.cpp
index 5667e7e7..8add18f8 100644
--- a/utils/qv4l2/capture-win.cpp
+++ b/utils/qv4l2/capture-win.cpp
@@ -44,9 +44,6 @@ CaptureWin::CaptureWin(ApplicationWindow *aw) :
 	m_appWin(aw)
 {
 	setWindowTitle("V4L2 Capture");
-	m_hotkeyClose = new QShortcut(Qt::CTRL+Qt::Key_W, this);
-	connect(m_hotkeyClose, SIGNAL(activated()), this, SLOT(close()));
-	connect(new QShortcut(Qt::Key_Q, this), SIGNAL(activated()), this, SLOT(close()));
 	m_hotkeyScaleReset = new QShortcut(Qt::CTRL+Qt::Key_F, this);
 	connect(m_hotkeyScaleReset, SIGNAL(activated()), this, SLOT(resetSize()));
 	connect(aw->m_resetScalingAct, SIGNAL(triggered()), this, SLOT(resetSize()));
@@ -55,9 +52,25 @@ CaptureWin::CaptureWin(ApplicationWindow *aw) :
 	m_hotkeyToggleFullscreen = new QShortcut(Qt::Key_F, this);
 	connect(m_hotkeyToggleFullscreen, SIGNAL(activated()), aw->m_makeFullScreenAct, SLOT(toggle()));
 	m_exitFullScreen = new QAction(QIcon(":/fullscreenexit.png"), "Exit Fullscreen", this);
+	m_exitFullScreen->setShortcut(m_hotkeyToggleFullscreen->key());
 	connect(m_exitFullScreen, SIGNAL(triggered()), this, SLOT(escape()));
 	m_enterFullScreen = new QAction(QIcon(":/fullscreen.png"), "Show Fullscreen", this);
+	m_enterFullScreen ->setShortcut(m_hotkeyToggleFullscreen->key());
 	connect(m_enterFullScreen, SIGNAL(triggered()), this, SLOT(fullScreen()));
+	// Add the action to allow the hotkey to start/stop the stream
+	addAction(m_appWin->m_capStartAct);
+
+	m_closeWindowAct = new QAction(QIcon(":/fileclose.png"), "&Close Window", this);
+	m_closeWindowAct->setStatusTip("Close");
+	QList<QKeySequence> shortcuts;
+	// More standard close window shortcut
+	shortcuts << Qt::CTRL+Qt::Key_W;
+	// Historic qv4l2 shortcut
+	shortcuts << Qt::Key_Q;
+	m_closeWindowAct->setShortcuts(shortcuts);
+	addAction(m_closeWindowAct);
+	connect(m_closeWindowAct, SIGNAL(triggered()), this, SLOT(close()));
+
 	m_frame.format = 0;
 	m_frame.size.setWidth(0);
 	m_frame.size.setHeight(0);
@@ -84,7 +97,6 @@ CaptureWin::~CaptureWin()
 
 	layout()->removeWidget(this);
 	delete layout();
-	delete m_hotkeyClose;
 	delete m_hotkeyScaleReset;
 }
 
@@ -365,6 +377,8 @@ void CaptureWin::customMenuRequested(QPoint pos)
 		menu->addAction(m_enterFullScreen);
 	}
 	
+	menu->addAction(m_appWin->m_capStartAct);
+	menu->addAction(m_appWin->m_capStepAct);
 	menu->addAction(m_appWin->m_resetScalingAct);
 	if (m_appWin->m_useBlendingAct)
 		menu->addAction(m_appWin->m_useBlendingAct);
@@ -376,6 +390,7 @@ void CaptureWin::customMenuRequested(QPoint pos)
 	menu->addMenu(m_appWin->m_overrideXferFuncMenu);
 	menu->addMenu(m_appWin->m_overrideYCbCrEncMenu);
 	menu->addMenu(m_appWin->m_overrideQuantizationMenu);
+	menu->addAction(m_closeWindowAct);
 	
 	menu->popup(mapToGlobal(pos));
 }
diff --git a/utils/qv4l2/capture-win.h b/utils/qv4l2/capture-win.h
index c16fa7ce..f6ca6f2b 100644
--- a/utils/qv4l2/capture-win.h
+++ b/utils/qv4l2/capture-win.h
@@ -78,6 +78,7 @@ public:
 	void makeFullScreen(bool);
 	QAction *m_exitFullScreen;
 	QAction *m_enterFullScreen;
+	QAction *m_closeWindowAct;
 
 	/**
 	 * @brief Set a frame into the capture window.
@@ -214,7 +215,6 @@ private:
 	ApplicationWindow *m_appWin;
 	static double m_pixelAspectRatio;
 	static CropMethod m_cropMethod;
-	QShortcut *m_hotkeyClose;
 	QShortcut *m_hotkeyScaleReset;
 	QShortcut *m_hotkeyExitFullscreen;
 	QShortcut *m_hotkeyToggleFullscreen;
-- 
2.20.1

