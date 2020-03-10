Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5906A17FF35
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgCJNpI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:45:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726954AbgCJNnS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AB6E24694;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=YFxh4gCEyUdXHNHdjE6NHjvKyb7QlycTTF2BSlym6EU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dzunMG5PAaD7QeuSmchttyv3vEUEx77z/qnBcAUTjKg/fJfupeGMk8PqblPf0jku6
         v0uz1rB49K8Lsj82CA+1aqkz/8TtQ7VIfzmKGItg2tlG3x+eAq4eylK6Er3oq6qur0
         OJPc9d5GGftvUwkzhNzZbxHxB4hc5hzeJYjQzkCQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005w2-AS; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 11/22] media: docs: split uAPI info from davinci-vpbe.rst
Date:   Tue, 10 Mar 2020 14:43:02 +0100
Message-Id: <8f1e3d79ee2b6b3c1bf451e68edfffe87811ecb8.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both driver develompent documentation and
userspace API.

Split on two, as they're usually read by different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/v4l-drivers/davinci-vpbe-devel.rst  | 39 +++++++++++++++++
 .../media/v4l-drivers/davinci-vpbe.rst        | 42 +++----------------
 Documentation/media/v4l-drivers/index.rst     |  1 +
 3 files changed, 45 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/davinci-vpbe-devel.rst

diff --git a/Documentation/media/v4l-drivers/davinci-vpbe-devel.rst b/Documentation/media/v4l-drivers/davinci-vpbe-devel.rst
new file mode 100644
index 000000000000..f0961672e6a3
--- /dev/null
+++ b/Documentation/media/v4l-drivers/davinci-vpbe-devel.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The VPBE V4L2 driver design
+===========================
+
+File partitioning
+-----------------
+
+ V4L2 display device driver
+         drivers/media/platform/davinci/vpbe_display.c
+         drivers/media/platform/davinci/vpbe_display.h
+
+ VPBE display controller
+         drivers/media/platform/davinci/vpbe.c
+         drivers/media/platform/davinci/vpbe.h
+
+ VPBE venc sub device driver
+         drivers/media/platform/davinci/vpbe_venc.c
+         drivers/media/platform/davinci/vpbe_venc.h
+         drivers/media/platform/davinci/vpbe_venc_regs.h
+
+ VPBE osd driver
+         drivers/media/platform/davinci/vpbe_osd.c
+         drivers/media/platform/davinci/vpbe_osd.h
+         drivers/media/platform/davinci/vpbe_osd_regs.h
+
+To be done
+----------
+
+vpbe display controller
+    - Add support for external encoders.
+    - add support for selecting external encoder as default at probe time.
+
+vpbe venc sub device
+    - add timings for supporting ths8200
+    - add support for LogicPD LCD.
+
+FB drivers
+    - Add support for fbdev drivers.- Ready and part of subsequent patches.
diff --git a/Documentation/media/v4l-drivers/davinci-vpbe.rst b/Documentation/media/v4l-drivers/davinci-vpbe.rst
index 0fde433e5c71..9e6360fd02db 100644
--- a/Documentation/media/v4l-drivers/davinci-vpbe.rst
+++ b/Documentation/media/v4l-drivers/davinci-vpbe.rst
@@ -3,38 +3,18 @@
 The VPBE V4L2 driver design
 ===========================
 
-File partitioning
------------------
-
- V4L2 display device driver
-         drivers/media/platform/davinci/vpbe_display.c
-         drivers/media/platform/davinci/vpbe_display.h
-
- VPBE display controller
-         drivers/media/platform/davinci/vpbe.c
-         drivers/media/platform/davinci/vpbe.h
-
- VPBE venc sub device driver
-         drivers/media/platform/davinci/vpbe_venc.c
-         drivers/media/platform/davinci/vpbe_venc.h
-         drivers/media/platform/davinci/vpbe_venc_regs.h
-
- VPBE osd driver
-         drivers/media/platform/davinci/vpbe_osd.c
-         drivers/media/platform/davinci/vpbe_osd.h
-         drivers/media/platform/davinci/vpbe_osd_regs.h
-
 Functional partitioning
 -----------------------
 
-Consists of the following (in the same order as the list under file
-partitioning):
+Consists of the following:
 
  1. V4L2 display driver
+
     Implements creation of video2 and video3 device nodes and
     provides v4l2 device interface to manage VID0 and VID1 layers.
 
  2. Display controller
+
     Loads up VENC, OSD and external encoders such as ths8200. It provides
     a set of API calls to V4L2 drivers to set the output/standards
     in the VENC or external sub devices. It also provides
@@ -54,6 +34,7 @@ partitioning):
     encoders is not present, and would be a part of the next patch series.
 
  3. VENC subdevice module
+
     Responsible for setting outputs provided through internal DACs and also
     setting timings at LCD controller port when external encoders are connected
     at the port or LCD panel timings required. When external encoder/LCD panel
@@ -72,6 +53,7 @@ partitioning):
     patch series.
 
  4. OSD module
+
     OSD module implements all OSD layer management and hardware specific
     features. The VPBE module interacts with the OSD for enabling and
     disabling appropriate features of the OSD.
@@ -81,17 +63,3 @@ Current status
 
 A fully functional working version of the V4L2 driver is available. This
 driver has been tested with NTSC and PAL standards and buffer streaming.
-
-To be done
-----------
-
-vpbe display controller
-    - Add support for external encoders.
-    - add support for selecting external encoder as default at probe time.
-
-vpbe venc sub device
-    - add timings for supporting ths8200
-    - add support for LogicPD LCD.
-
-FB drivers
-    - Add support for fbdev drivers.- Ready and part of subsequent patches.
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index f3e34ccaf365..2d782a40a7b6 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -69,6 +69,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cpia2_devel
 	cx2341x-devel
 	cx88-devel
+	davinci-vpbe-devel
 	vimc-devel
 
 	cx2341x-uapi
-- 
2.24.1

