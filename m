Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046368F12D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbfHOQsR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:48:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38910 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfHOQsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:48:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B8ABE28CF69
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 1/6] media: v4l2-core: Module re-organization
Date:   Thu, 15 Aug 2019 13:48:01 -0300
Message-Id: <20190815164806.19248-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815164806.19248-1-ezequiel@collabora.com>
References: <20190815164806.19248-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

videodev.ko and v4l2-common.ko driver are built under
the same conditions. Therefore, it doesn't make much sense
to split them in two different modules.

Splitting v4l2-common to its own driver was done many years ago:

  commit a9254475bbfbed5f0596d952c6a3c9806e19dd0b
  Author: Mauro Carvalho Chehab <mchehab@infradead.org>
  Date:   Tue Jan 29 18:32:35 2008 -0300

      V4L/DVB (7115): Fix bug #9833: regression when compiling V4L without I2C

Back then, the subsystem organization was different and the module split
was needed. However, with the current organization, there is no issue
compiling V4L2 with I2C as y/m/n.

This commit makes v4l2-common part of our V4L2 core driver (videodev.ko).

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes v2:
* Fix MODULE_xxx macros, combining all the authors
  and amending the description.
---
 drivers/media/v4l2-core/Makefile      | 3 +--
 drivers/media/v4l2-core/v4l2-common.c | 4 ----
 drivers/media/v4l2-core/v4l2-dev.c    | 4 ++--
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 4d42418e603e..8e2f52f7800b 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -7,14 +7,13 @@ tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o v4l2-clk.o \
-			v4l2-async.o
+			v4l2-async.o v4l2-common.o
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
-obj-$(CONFIG_VIDEO_V4L2) += v4l2-common.o
 obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index ab4a792a3bc1..5cbb51864fbb 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -54,10 +54,6 @@
 
 #include <linux/videodev2.h>
 
-MODULE_AUTHOR("Bill Dirks, Justin Schoeman, Gerd Knorr");
-MODULE_DESCRIPTION("misc helper functions for v4l2 device drivers");
-MODULE_LICENSE("GPL");
-
 /*
  *
  *	V 4 L 2   D R I V E R   H E L P E R   A P I
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index a1c61d6f3b9b..4037689a945a 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1092,7 +1092,7 @@ static void __exit videodev_exit(void)
 subsys_initcall(videodev_init);
 module_exit(videodev_exit)
 
-MODULE_AUTHOR("Alan Cox, Mauro Carvalho Chehab <mchehab@kernel.org>");
-MODULE_DESCRIPTION("Device registrar for Video4Linux drivers v2");
+MODULE_AUTHOR("Alan Cox, Mauro Carvalho Chehab <mchehab@kernel.org>, Bill Dirks, Justin Schoeman, Gerd Knorr");
+MODULE_DESCRIPTION("Video4Linux2 core driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CHARDEV_MAJOR(VIDEO_MAJOR);
-- 
2.22.0

