Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE82D16C3
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 17:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgLGQr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 11:47:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgLGQr4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 11:47:56 -0500
Date:   Mon, 7 Dec 2020 17:47:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607359635;
        bh=WcdOsNuKeMvdD97qjOLJlLjaDKkTuzP98XaF2CP3RYI=;
        h=From:To:Cc:Subject:From;
        b=IIrhefoQZ/ZxayO2m3a9KW0KGdid0gZ1NR20g8WzmKbnulF5e18K3ACabamLkdb/J
         Q6oD4zdMM4IfjG8QbEjewclmdmO33aMszE34cjZxXmae+jFz3mC8cmFZ4yOL0socxM
         jOqJr7KhwBSm9lb8Q1StyRWYbKIJegy0D0+2ILPoV3Dn3S9pxX9t8KnTEAhEAGzHQ+
         uzs+sPyjISOfeL2brCshrkipBnQ6uEnrNfE2IoOLM4t8QahyKWfLr6wz4J+StxX7Hj
         UHurdO8dO+q+nfpJpBcY9pnZgFpNGT4jF5cXt+IHFlK//3H0wa9mbxnNWnO1tK5rnm
         vPeE99Sr1DQkg==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Bug on qv4l2
Message-ID: <20201207174711.4ec44c8d@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

While trying to use the upstream version of qv4l2, I got a crash when trying to
stream:

Thread 1 "qv4l2" received signal SIGSEGV, Segmentation fault.
0x00007ffff741e350 in QScreen::availableSize() const () from /lib64/libQt5Gui.so.5
(gdb) bt
#0  0x00007ffff741e350 in QScreen::availableSize() const () at /lib64/libQt5Gui.so.5
#1  0x0000000000442e48 in CaptureWin::setWindowSize(QSize) (this=0x671060, frameSize=frameSize@entry=...) at capture-win.cpp:247
#2  0x000000000041c057 in ApplicationWindow::capStart(bool) (this=0x936800, start=<optimized out>) at qv4l2.cpp:1588
#3  0x00007ffff7036290 in void doActivate<false>(QObject*, int, void**) () at /lib64/libQt5Core.so.5
#4  0x00007ffff79f6bc2 in QAction::toggled(bool) () at /lib64/libQt5Widgets.so.5
#5  0x00007ffff79f9272 in QAction::setChecked(bool) () at /lib64/libQt5Widgets.so.5
#6  0x00007ffff79f9373 in QAction::activate(QAction::ActionEvent) () at /lib64/libQt5Widgets.so.5
#7  0x00007ffff7aebfe2 in QAbstractButtonPrivate::click() () at /lib64/libQt5Widgets.so.5
#8  0x00007ffff7aec101 in QAbstractButton::mouseReleaseEvent(QMouseEvent*) () at /lib64/libQt5Widgets.so.5
#9  0x00007ffff7bdbada in QToolButton::mouseReleaseEvent(QMouseEvent*) () at /lib64/libQt5Widgets.so.5
#10 0x00007ffff7a3cfbe in QWidget::event(QEvent*) () at /lib64/libQt5Widgets.so.5
#11 0x00007ffff79fd15f in QApplicationPrivate::notify_helper(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#12 0x00007ffff7a0404b in QApplication::notify(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#13 0x00007ffff7007be8 in QCoreApplication::notifyInternal2(QObject*, QEvent*) () at /lib64/libQt5Core.so.5
#14 0x00007ffff7a03076 in QApplicationPrivate::sendMouseEvent(QWidget*, QMouseEvent*, QWidget*, QWidget*, QWidget**, QPointer<QWidget>&, bool, bool) () at /lib64/libQt5Widgets.so.5
#15 0x00007ffff7a55021 in QWidgetWindow::handleMouseEvent(QMouseEvent*) () at /lib64/libQt5Widgets.so.5
#16 0x00007ffff7a5834e in QWidgetWindow::event(QEvent*) () at /lib64/libQt5Widgets.so.5
#17 0x00007ffff79fd15f in QApplicationPrivate::notify_helper(QObject*, QEvent*) () at /lib64/libQt5Widgets.so.5
#18 0x00007ffff7007be8 in QCoreApplication::notifyInternal2(QObject*, QEvent*) () at /lib64/libQt5Core.so.5
#19 0x00007ffff73fb8f0 in QGuiApplicationPrivate::processMouseEvent(QWindowSystemInterfacePrivate::MouseEvent*) () at /lib64/libQt5Gui.so.5
#20 0x00007ffff73dd94b in QWindowSystemInterface::sendWindowSystemEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at /lib64/libQt5Gui.so.5
#21 0x00007fffe65852aa in xcbSourceDispatch(_GSource*, int (*)(void*), void*) () at /lib64/libQt5XcbQpa.so.5
#22 0x00007ffff5da67ef in g_main_dispatch (context=0x7fffe0005000) at ../glib/gmain.c:3325
#23 g_main_context_dispatch (context=0x7fffe0005000) at ../glib/gmain.c:4043
#24 0x00007ffff5df85d8 in g_main_context_iterate.constprop.0 (context=context@entry=0x7fffe0005000, block=block@entry=1, dispatch=dispatch@entry=1, self=<optimized out>) at ../glib/gmain.c:4119
#25 0x00007ffff5da3bc3 in g_main_context_iteration (context=0x7fffe0005000, may_block=1) at ../glib/gmain.c:4184
#26 0x00007ffff7052a2f in QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at /lib64/libQt5Core.so.5
#27 0x00007ffff700664b in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at /lib64/libQt5Core.so.5
#28 0x00007ffff700e010 in QCoreApplication::exec() () at /lib64/libQt5Core.so.5
#29 0x0000000000414555 in main(int, char**) (argc=<optimized out>, argv=<optimized out>) at qv4l2.cpp:1930

Qt version is 5.15.

The problem is here:

	QScreen *screen = QGuiApplication::screenAt(mapToGlobal({width() / 2, 0}));

Basically, it returns nothing. I'm using two monitors here.

With the enclosed patch, it works. The patch prints the available
screens there as:

	1 QRect(0,360 1920x1080)
	2 QRect(1920,0 2560x1440)
	1 QRect(0,360 1920x1080)
	2 QRect(1920,0 2560x1440)

not sure why it reports twice... perhaps setWindowSize() is called
twice?

The enclosed patch is actually a quick hack: if screen is NULL, it
just use the first one unconditionally.

Funny enough, the capture window always appear at the same screen as
the main window.

I suspect that you may need a more complex logic there, in order to
use the right one, specially when using resolutions that are bigger
than the smallest screen, but would fit fine at the big one.

Regards,
Mauro


diff --git a/utils/qv4l2/capture-win.cpp b/utils/qv4l2/capture-win.cpp
index 8d9692b5b69a..3012317e1a3e 100644
--- a/utils/qv4l2/capture-win.cpp
+++ b/utils/qv4l2/capture-win.cpp
@@ -29,6 +29,7 @@
 #include <QApplication>
 #include <QDesktopWidget>
 #include <QScreen>
+#include <QDebug>
 
 #include <math.h>
 
@@ -244,6 +245,13 @@ void CaptureWin::setWindowSize(QSize frameSize)
 	QRect resolution = screen->screenGeometry();
 #else
 	QScreen *screen = QGuiApplication::screenAt(mapToGlobal({width() / 2, 0}));
+	if (!screen) {
+		const auto screens = QGuiApplication::screens();
+		for (int ii = 0; ii < screens.count(); ++ii) {
+			qInfo() << ii + 1 << screens[ii]->geometry();
+		}
+		screen = screens[0];
+	}
 	QSize resolution = screen->availableSize();
 #endif
 
