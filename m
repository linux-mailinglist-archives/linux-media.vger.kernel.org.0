Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2FD1AEBD8
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 12:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgDRKg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 06:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgDRKg4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95E59221F4;
        Sat, 18 Apr 2020 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587206215;
        bh=/TpfpEBagqOsEJz0Tq71ISju0tA9g/bdf5UxUTpyUx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZqgYfWE/8CKxXO/plonxY8pIWI43ryXJl2UhT9QzXcCdVZ855qDrQuXzcy09I10QF
         ta7GJ/3WBcFGdDGX+Vp9sBPS6r9oj+JlUE9n5WB1c5MvBCtOLW4rASRU2lYYn6GGG8
         p/gEzF9JhVMndkRI8RKWnU1sC/tV9VbtzLq6ORA0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPkqD-00838X-KC; Sat, 18 Apr 2020 12:36:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] media: admin-guide: reorganize the guide
Date:   Sat, 18 Apr 2020 12:36:51 +0200
Message-Id: <885538809ae84c6dd1f54d061787bbc39175b279.1587206071.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587206071.git.mchehab+huawei@kernel.org>
References: <cover.1587206071.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate the generic documentation from the driver-specific
parts, and use a better title for the documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/dvb.rst       | 12 +++++
 Documentation/admin-guide/media/index.rst     | 46 +++++++++++--------
 ...{v4l-with-ir.rst => remote-controller.rst} |  9 ++--
 3 files changed, 44 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/admin-guide/media/dvb.rst
 rename Documentation/admin-guide/media/{v4l-with-ir.rst => remote-controller.rst} (96%)

diff --git a/Documentation/admin-guide/media/dvb.rst b/Documentation/admin-guide/media/dvb.rst
new file mode 100644
index 000000000000..e5258bfa5cd9
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Digital TV
+==========
+
+.. toctree::
+
+	dvb_intro
+	ci
+	faq
+	dvb_references
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index dbe36e427e6b..05ddd4930699 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -2,9 +2,9 @@
 
 .. include:: <isonum.txt>
 
-============================
-Media subsystem usage guides
-============================
+====================================
+Media subsystem admin and user guide
+====================================
 
 This section contains usage information about media subsystem and
 its supported drivers.
@@ -18,11 +18,8 @@ Please see:
      for driver development information and Kernel APIs used by
      media devices;
 
-.. _uapi-v4l-drivers:
-
-################################################
-Video4Linux (V4L)  driver-specific documentation
-################################################
+The media subsystem
+===================
 
 .. only:: html
 
@@ -37,9 +34,27 @@ Video4Linux (V4L)  driver-specific documentation
 	intro
 	building
 
+	remote-controller
+
+	dvb
+
 	cardlist
 
-	v4l-with-ir
+
+.. _uapi-v4l-drivers:
+
+Video4Linux (V4L) driver-specific documentation
+===============================================
+
+.. only:: html
+
+    .. class:: toc-title
+
+        Table of Contents
+
+.. toctree::
+	:maxdepth: 5
+	:numbered:
 
 	bttv
 	cafe_ccic
@@ -64,9 +79,8 @@ Video4Linux (V4L)  driver-specific documentation
 	vimc
 	vivid
 
-##############################################
-Linux Digital TV driver-specific documentation
-##############################################
+Digital TV driver-specific documentation
+========================================
 
 .. only:: html
 
@@ -78,11 +92,6 @@ Linux Digital TV driver-specific documentation
 	:maxdepth: 5
 	:numbered:
 
-	dvb_intro
-	ci
-	faq
-	dvb_references
-
 	avermedia
 	bt8xx
 	lmedm04
@@ -91,9 +100,8 @@ Linux Digital TV driver-specific documentation
 	ttusb-dec
 	zr364xx
 
-#################################
 CEC driver-specific documentation
-#################################
+=================================
 
 .. only:: html
 
diff --git a/Documentation/admin-guide/media/v4l-with-ir.rst b/Documentation/admin-guide/media/remote-controller.rst
similarity index 96%
rename from Documentation/admin-guide/media/v4l-with-ir.rst
rename to Documentation/admin-guide/media/remote-controller.rst
index ce23c8a7bc93..fa05410c3cd5 100644
--- a/Documentation/admin-guide/media/v4l-with-ir.rst
+++ b/Documentation/admin-guide/media/remote-controller.rst
@@ -1,12 +1,13 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+======================================================
 Infrared remote control support in video4linux drivers
 ======================================================
 
 Authors: Gerd Hoffmann, Mauro Carvalho Chehab
 
 Basics
-------
+======
 
 Most analog and digital TV boards support remote controllers. Several of
 them have a microprocessor that receives the IR carriers, convert into
@@ -33,7 +34,7 @@ detected. However, for a few devices, you need to manually load the
 ir-kbd-i2c module.
 
 How it works
-------------
+============
 
 The modules register the remote as keyboard within the linux input
 layer, i.e. you'll see the keys of the remote as normal key strokes
@@ -55,7 +56,7 @@ the keymaps, like the input kbd utility.
 
 
 Using with lircd
-================
+----------------
 
 The latest versions of the lircd daemon supports reading events from the
 linux input layer (via event device). It also supports receiving IR codes
@@ -63,7 +64,7 @@ in lirc mode.
 
 
 Using without lircd
-===================
+-------------------
 
 Xorg recognizes several IR keycodes that have its numerical value lower
 than 247. With the advent of Wayland, the input driver got updated too,
-- 
2.25.2

