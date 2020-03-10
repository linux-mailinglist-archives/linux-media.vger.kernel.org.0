Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A24417FEF4
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgCJNnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:43:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E75924685;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=5q/CzOOsYllK0uZT25tyGHbJBrmagjGBbvBIeR7M0w8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=koyWg2VW4qb+jhP25yJa09C7jYYheRvIL1Y72h6YbVpKr5H2AnKJRkrj3HlcN3seM
         eLjDc2cJNZpbZlLMueFb2uYFXsJS9db3Cr/ekShdwwws8o7NUL3pLMMS5I7AN/UNF3
         VVcay0NG+SdLRBiNAfuGxSgf05t7IznnkDDjfeF4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vY-3D; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 05/22] media: docs: split meye.rst into admin and uAPI docs
Date:   Tue, 10 Mar 2020 14:42:56 +0100
Message-Id: <c16f22752f9c8b0e1cb9ddc26b4a46b3bc7b4ed6.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of placing both info from admin PoV and uAPI at the
same place, split into two separate documents.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst     |  1 +
 Documentation/media/v4l-drivers/meye-uapi.rst | 53 +++++++++++++++++++
 Documentation/media/v4l-drivers/meye.rst      | 41 --------------
 3 files changed, 54 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/meye-uapi.rst

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 72fbb394f6a2..5a87bd1da9bd 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -67,3 +67,4 @@ For more details see the file COPYING in the source distribution of Linux.
 	zr364xx
 
 	cpia2_devel
+	meye-uapi
diff --git a/Documentation/media/v4l-drivers/meye-uapi.rst b/Documentation/media/v4l-drivers/meye-uapi.rst
new file mode 100644
index 000000000000..66b1c142f920
--- /dev/null
+++ b/Documentation/media/v4l-drivers/meye-uapi.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+Vaio Picturebook Motion Eye Camera Driver
+=========================================
+
+Copyright |copy| 2001-2004 Stelian Pop <stelian@popies.net>
+
+Copyright |copy| 2001-2002 Alcôve <www.alcove.com>
+
+Copyright |copy| 2000 Andrew Tridgell <tridge@samba.org>
+
+Private API
+-----------
+
+The driver supports frame grabbing with the video4linux API,
+so all video4linux tools (like xawtv) should work with this driver.
+
+Besides the video4linux interface, the driver has a private interface
+for accessing the Motion Eye extended parameters (camera sharpness,
+agc, video framerate), the snapshot and the MJPEG capture facilities.
+
+This interface consists of several ioctls (prototypes and structures
+can be found in include/linux/meye.h):
+
+MEYEIOC_G_PARAMS and MEYEIOC_S_PARAMS
+	Get and set the extended parameters of the motion eye camera.
+	The user should always query the current parameters with
+	MEYEIOC_G_PARAMS, change what he likes and then issue the
+	MEYEIOC_S_PARAMS call (checking for -EINVAL). The extended
+	parameters are described by the meye_params structure.
+
+
+MEYEIOC_QBUF_CAPT
+	Queue a buffer for capture (the buffers must have been
+	obtained with a VIDIOCGMBUF call and mmap'ed by the
+	application). The argument to MEYEIOC_QBUF_CAPT is the
+	buffer number to queue (or -1 to end capture). The first
+	call to MEYEIOC_QBUF_CAPT starts the streaming capture.
+
+MEYEIOC_SYNC
+	Takes as an argument the buffer number you want to sync.
+	This ioctl blocks until the buffer is filled and ready
+	for the application to use. It returns the buffer size.
+
+MEYEIOC_STILLCAPT and MEYEIOC_STILLJCAPT
+	Takes a snapshot in an uncompressed or compressed jpeg format.
+	This ioctl blocks until the snapshot is done and returns (for
+	jpeg snapshot) the size of the image. The image data is
+	available from the first mmap'ed buffer.
+
+Look at the 'motioneye' application code for an actual example.
diff --git a/Documentation/media/v4l-drivers/meye.rst b/Documentation/media/v4l-drivers/meye.rst
index dc57a6a91b43..9098a1e65f8b 100644
--- a/Documentation/media/v4l-drivers/meye.rst
+++ b/Documentation/media/v4l-drivers/meye.rst
@@ -87,47 +87,6 @@ Usage:
 	motioneye (<http://popies.net/meye/>)
 		for getting ppm or jpg snapshots, mjpeg video
 
-Private API
------------
-
-The driver supports frame grabbing with the video4linux API,
-so all video4linux tools (like xawtv) should work with this driver.
-
-Besides the video4linux interface, the driver has a private interface
-for accessing the Motion Eye extended parameters (camera sharpness,
-agc, video framerate), the snapshot and the MJPEG capture facilities.
-
-This interface consists of several ioctls (prototypes and structures
-can be found in include/linux/meye.h):
-
-MEYEIOC_G_PARAMS and MEYEIOC_S_PARAMS
-	Get and set the extended parameters of the motion eye camera.
-	The user should always query the current parameters with
-	MEYEIOC_G_PARAMS, change what he likes and then issue the
-	MEYEIOC_S_PARAMS call (checking for -EINVAL). The extended
-	parameters are described by the meye_params structure.
-
-
-MEYEIOC_QBUF_CAPT
-	Queue a buffer for capture (the buffers must have been
-	obtained with a VIDIOCGMBUF call and mmap'ed by the
-	application). The argument to MEYEIOC_QBUF_CAPT is the
-	buffer number to queue (or -1 to end capture). The first
-	call to MEYEIOC_QBUF_CAPT starts the streaming capture.
-
-MEYEIOC_SYNC
-	Takes as an argument the buffer number you want to sync.
-	This ioctl blocks until the buffer is filled and ready
-	for the application to use. It returns the buffer size.
-
-MEYEIOC_STILLCAPT and MEYEIOC_STILLJCAPT
-	Takes a snapshot in an uncompressed or compressed jpeg format.
-	This ioctl blocks until the snapshot is done and returns (for
-	jpeg snapshot) the size of the image. The image data is
-	available from the first mmap'ed buffer.
-
-Look at the 'motioneye' application code for an actual example.
-
 Bugs / Todo
 -----------
 
-- 
2.24.1

