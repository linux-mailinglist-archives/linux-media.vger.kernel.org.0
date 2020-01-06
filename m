Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9584D1312C6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 14:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgAFN0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 08:26:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFN0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 08:26:00 -0500
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 765AC52F;
        Mon,  6 Jan 2020 14:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578317158;
        bh=ofZPijIR8ecYEwO2gxOKaASjlKLd8pAxV64+E7oe5SU=;
        h=From:To:Cc:Subject:Date:From;
        b=YXZbZSIh3bADYqLHVeJfaqLwHHCXSvkAlKaPzaEkSUwXCI3c/8msPpRM7xu7UQ6j6
         6yh9+lhIy8/np9lJv3VaQd4qnnGHroTrtZXTheia+1kb3DF8OQ4kwKEg+Q3VNZGj4/
         /oTNIF/5AuGAXdbBM/qwhkoWBOGqDXrH1wXZ7znA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [v4l-utils] [PATCH] qv4l2: Use C library file operations with v4lconvert for raw mode devices
Date:   Mon,  6 Jan 2020 15:25:43 +0200
Message-Id: <20200106132544.9991-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

qv4l2 uses libv4l2 to access the V4L2 device by default, and supports a
raw open mode for direct access to the device through C library file
operations. It also uses libv4lconvert to perform format conversion, and
libv4lconvert accesses the V4L2 device through direct syscalls by
default.

Usage of raw open mode is useful to test direct access to the device,
but also to test LD_PRELOAD wrappers that intercept the C library calls,
such as the libcamera V4L2 compatibility wrapper. The usage of syscalls
in libv4lconvert prevents the latter case from working properly. Fix it
by providing file operations to libv4lconvert that use the C library
file operations when opening the device in raw mode.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/qv4l2/qv4l2.cpp | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/utils/qv4l2/qv4l2.cpp b/utils/qv4l2/qv4l2.cpp
index d42ce9a4bf74..b57178e4237b 100644
--- a/utils/qv4l2/qv4l2.cpp
+++ b/utils/qv4l2/qv4l2.cpp
@@ -60,11 +60,45 @@ extern "C" {
 #include "capture-win-qt.h"
 #include "capture-win-gl.h"
 
+#include <libv4l-plugin.h>
 #include <libv4lconvert.h>
 
 #define SDR_WIDTH 1024
 #define SDR_HEIGHT 512
 
+static void *rawDevInit(int fd)
+{
+	return NULL;
+}
+
+static void rawDevClose(void *dev_ops_priv)
+{
+}
+
+static int rawDevIoctl(void *dev_ops_priv, int fd, unsigned long cmd, void *arg)
+{
+	return ioctl(fd, cmd, arg);
+}
+
+static ssize_t rawDevRead(void *dev_ops_priv, int fd, void *buf, size_t len)
+{
+	return read(fd, buf, len);
+}
+
+static ssize_t rawDevWrite(void *dev_ops_priv, int fd, const void *buf,
+                         size_t len)
+{
+	return write(fd, buf, len);
+}
+
+static const struct libv4l_dev_ops rawDevOps = {
+	.init = rawDevInit,
+	.close = rawDevClose,
+	.ioctl = rawDevIoctl,
+	.read = rawDevRead,
+	.write = rawDevWrite,
+};
+
 static QAction *addSubMenuItem(QActionGroup *grp, QMenu *menu, const QString &text, int val)
 {
 	QAction *a = grp->addAction(menu->addAction(text));
@@ -417,7 +451,10 @@ void ApplicationWindow::setDevice(const QString &device, bool rawOpen)
 	statusBar()->clearMessage();
 	m_tabs->show();
 	m_tabs->setFocus();
-	m_convertData = v4lconvert_create(g_fd());
+	if (rawOpen)
+		m_convertData = v4lconvert_create_with_dev_ops(g_fd(), NULL, &rawDevOps);
+	else
+		m_convertData = v4lconvert_create(g_fd());
 	bool canStream = has_rw() || has_streaming();
 	bool isCapture = v4l_type_is_capture(g_type());
 	m_capStartAct->setEnabled(canStream);
-- 
Regards,

Laurent Pinchart

