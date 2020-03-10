Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAF917FF49
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgCJNpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:45:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726389AbgCJNnS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:18 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB1924677;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=Gb1IRoHX5zmIsy6mPei1A2ZN94UYuoYi38cNq7SdFPg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xHqL9QbdbGE4+K/dXK2cP6mjK1pj8fTv0NPwdnqBh+mYPYXmLPrqdryqe+1lPRSqr
         +SRA7ySC3Lkdhfy0VNQlQBdd2l2inX+TAnTtbz0z87dNrBzmvdmv+J5qJRiGmzAEi+
         A1yXkwUN9vMmZ8FZcRFhI1a0neQx0GvBEDfha/Ws=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vQ-0t; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 03/22] media: docs: split cpia2.rst on two files
Date:   Tue, 10 Mar 2020 14:42:54 +0100
Message-Id: <7f013c412e20cec66bf605bfccddc7f90fe187cd.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to be able to better organize the subsystem, split the
cpia2 information on two files: one user-facing and another one
from Kernel development PoV.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/cpia2.rst     | 46 ---------------
 .../media/v4l-drivers/cpia2_devel.rst         | 56 +++++++++++++++++++
 Documentation/media/v4l-drivers/index.rst     |  2 +
 3 files changed, 58 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/media/v4l-drivers/cpia2_devel.rst

diff --git a/Documentation/media/v4l-drivers/cpia2.rst b/Documentation/media/v4l-drivers/cpia2.rst
index a86baa1c83f1..6f4258aebbfe 100644
--- a/Documentation/media/v4l-drivers/cpia2.rst
+++ b/Documentation/media/v4l-drivers/cpia2.rst
@@ -147,49 +147,3 @@ We are providing a modified gqcam application to view the output. In
 order to avoid confusion, here it is called mview.  There is also the qx5view
 program which can also control the lights on the qx5 microscope. MJPEG Tools
 (http://mjpeg.sourceforge.net) can also be used to record from the camera.
-
-Notes to developers
-~~~~~~~~~~~~~~~~~~~
-
-   - This is a driver version stripped of the 2.4 back compatibility
-     and old MJPEG ioctl API. See cpia2.sf.net for 2.4 support.
-
-Programmer's overview of cpia2 driver
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Cpia2 is the second generation video coprocessor from VLSI Vision Ltd (now a
-division of ST Microelectronics).  There are two versions.  The first is the
-STV0672, which is capable of up to 30 frames per second (fps) in frame sizes
-up to CIF, and 15 fps for VGA frames.  The STV0676 is an improved version,
-which can handle up to 30 fps VGA.  Both coprocessors can be attached to two
-CMOS sensors - the vvl6410 CIF sensor and the vvl6500 VGA sensor.  These will
-be referred to as the 410 and the 500 sensors, or the CIF and VGA sensors.
-
-The two chipsets operate almost identically.  The core is an 8051 processor,
-running two different versions of firmware.  The 672 runs the VP4 video
-processor code, the 676 runs VP5.  There are a few differences in register
-mappings for the two chips.  In these cases, the symbols defined in the
-header files are marked with VP4 or VP5 as part of the symbol name.
-
-The cameras appear externally as three sets of registers. Setting register
-values is the only way to control the camera.  Some settings are
-interdependant, such as the sequence required to power up the camera. I will
-try to make note of all of these cases.
-
-The register sets are called blocks.  Block 0 is the system block.  This
-section is always powered on when the camera is plugged in.  It contains
-registers that control housekeeping functions such as powering up the video
-processor.  The video processor is the VP block.  These registers control
-how the video from the sensor is processed.  Examples are timing registers,
-user mode (vga, qvga), scaling, cropping, framerates, and so on.  The last
-block is the video compressor (VC).  The video stream sent from the camera is
-compressed as Motion JPEG (JPEGA).  The VC controls all of the compression
-parameters.  Looking at the file cpia2_registers.h, you can get a full view
-of these registers and the possible values for most of them.
-
-One or more registers can be set or read by sending a usb control message to
-the camera.  There are three modes for this.  Block mode requests a number
-of contiguous registers.  Random mode reads or writes random registers with
-a tuple structure containing address/value pairs.  The repeat mode is only
-used by VP4 to load a firmware patch.  It contains a starting address and
-a sequence of bytes to be written into a gpio port.
diff --git a/Documentation/media/v4l-drivers/cpia2_devel.rst b/Documentation/media/v4l-drivers/cpia2_devel.rst
new file mode 100644
index 000000000000..decaa4768c78
--- /dev/null
+++ b/Documentation/media/v4l-drivers/cpia2_devel.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The cpia2 driver
+================
+
+Authors: Peter Pregler <Peter_Pregler@email.com>,
+Scott J. Bertin <scottbertin@yahoo.com>, and
+Jarl Totland <Jarl.Totland@bdc.no> for the original cpia driver, which
+this one was modelled from.
+
+
+Notes to developers
+~~~~~~~~~~~~~~~~~~~
+
+   - This is a driver version stripped of the 2.4 back compatibility
+     and old MJPEG ioctl API. See cpia2.sf.net for 2.4 support.
+
+Programmer's overview of cpia2 driver
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Cpia2 is the second generation video coprocessor from VLSI Vision Ltd (now a
+division of ST Microelectronics).  There are two versions.  The first is the
+STV0672, which is capable of up to 30 frames per second (fps) in frame sizes
+up to CIF, and 15 fps for VGA frames.  The STV0676 is an improved version,
+which can handle up to 30 fps VGA.  Both coprocessors can be attached to two
+CMOS sensors - the vvl6410 CIF sensor and the vvl6500 VGA sensor.  These will
+be referred to as the 410 and the 500 sensors, or the CIF and VGA sensors.
+
+The two chipsets operate almost identically.  The core is an 8051 processor,
+running two different versions of firmware.  The 672 runs the VP4 video
+processor code, the 676 runs VP5.  There are a few differences in register
+mappings for the two chips.  In these cases, the symbols defined in the
+header files are marked with VP4 or VP5 as part of the symbol name.
+
+The cameras appear externally as three sets of registers. Setting register
+values is the only way to control the camera.  Some settings are
+interdependant, such as the sequence required to power up the camera. I will
+try to make note of all of these cases.
+
+The register sets are called blocks.  Block 0 is the system block.  This
+section is always powered on when the camera is plugged in.  It contains
+registers that control housekeeping functions such as powering up the video
+processor.  The video processor is the VP block.  These registers control
+how the video from the sensor is processed.  Examples are timing registers,
+user mode (vga, qvga), scaling, cropping, framerates, and so on.  The last
+block is the video compressor (VC).  The video stream sent from the camera is
+compressed as Motion JPEG (JPEGA).  The VC controls all of the compression
+parameters.  Looking at the file cpia2_registers.h, you can get a full view
+of these registers and the possible values for most of them.
+
+One or more registers can be set or read by sending a usb control message to
+the camera.  There are three modes for this.  Block mode requests a number
+of contiguous registers.  Random mode reads or writes random registers with
+a tuple structure containing address/value pairs.  The repeat mode is only
+used by VP4 to load a firmware patch.  It contains a starting address and
+a sequence of bytes to be written into a gpio port.
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index eca22b82de94..72fbb394f6a2 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -65,3 +65,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	vimc
 	vivid
 	zr364xx
+
+	cpia2_devel
-- 
2.24.1

