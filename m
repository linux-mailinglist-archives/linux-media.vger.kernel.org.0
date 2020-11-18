Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F148A2B7CC6
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 12:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgKRLi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 06:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgKRLi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 06:38:28 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C048C0613D6
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 03:38:28 -0800 (PST)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C3D6E634C95;
        Wed, 18 Nov 2020 13:38:16 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH 02/29] Documentation: ccs: Add CCS driver documentation
Date:   Wed, 18 Nov 2020 13:30:44 +0200
Message-Id: <20201118113111.2548-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
References: <20201118113111.2548-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the MIPI CCS driver and the C register definition generator.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/drivers/ccs/ccs.rst      | 82 +++++++++++++++++++
 .../driver-api/media/drivers/index.rst        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/driver-api/media/drivers/ccs/ccs.rst

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
new file mode 100644
index 000000000000..93537307c6cd
--- /dev/null
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
+
+.. include:: <isonum.txt>
+
+MIPI CCS camera sensor driver
+=============================
+
+The MIPI CCS camera sensor driver is a generic driver for `MIPI CCS
+<https://www.mipi.org/specifications/camera-command-set>`_ compliant
+camera sensors. It exposes three sub-devices representing the pixel array,
+the binner and the scaler.
+
+As the capabilities of individual devices vary, the driver exposes
+interfaces based on the capabilities that exist in hardware.
+
+Pixel Array sub-device
+----------------------
+
+The pixel array sub-device represents the camera sensor's pixel matrix, as well
+as analogue crop functionality present in many compliant devices. The analogue
+crop is configured using the ``V4L2_SEL_TGT_CROP`` on the source pad (0) of the
+entity. The size of the pixel matrix can be obtained by getting the
+``V4L2_SEL_TGT_NATIVE_SIZE`` target.
+
+Binner
+------
+
+The binner sub-device represents the binning functionality on the sensor. For
+that purpose, selection target ``V4L2_SEL_TGT_COMPOSE`` is supported on the
+sink pad (0).
+
+Additionally, if a device has no scaler or digital crop functionality, the
+source pad (1) expses another digital crop selection rectangle that can only
+crop at the end of the lines and frames.
+
+Scaler
+------
+
+The scaler sub-device represents the digital crop and scaling functionality of
+the sensor. The V4L2 selection target ``V4L2_SEL_TGT_CROP`` is used to
+configure the digital crop on the sink pad (0) when digital crop is supported.
+Scaling is configured using selection target ``V4L2_SEL_TGT_COMPOSE`` on the
+sink pad (0) as well.
+
+Additionally, if the scaler sub-device exists, its source pad (1) exposes
+another digital crop selection rectangle that can only crop at the end of the
+lines and frames.
+
+Digital and analogue crop
+-------------------------
+
+Digital crop functionality is referred to as cropping that effectively works by
+dropping some data on the floor. Analogue crop, on the other hand, means that
+the cropped information is never retrieved. In case of camera sensors, the
+analogue data is never read from the pixel matrix that are outside the
+configured selection rectangle that designates crop. The difference has an
+effect in device timing and likely also in power consumption.
+
+Register definition generator
+-----------------------------
+
+The ccs-regs.txt file contains MIPI CCS register definitions that are used
+to produce C source code files for definitions that can be better used by
+programs written in C language. As there are many dependencies between the
+produced files, please do not modify them manually as it's error-prone and
+in vain, but instead change the script producing them.
+
+Usage
+~~~~~
+
+Conventionally the script is called this way to update the CCS driver
+definitions:
+
+.. code-block:: none
+
+	$ Documentation/driver-api/media/drivers/ccs/mk-ccs-regs \
+		-e drivers/media/i2c/ccs/ccs-regs.h \
+		-L drivers/media/i2c/ccs/ccs-limits.h \
+		-l drivers/media/i2c/ccs/ccs-limits.c \
+		-c Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
+
+**Copyright** |copy| 2020 Intel Corporation
diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index eb7011782863..426cda633bf0 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -26,6 +26,7 @@ Video4Linux (V4L) drivers
 	tuners
 	vimc-devel
 	zoran
+	ccs/ccs
 
 
 Digital TV drivers
-- 
2.27.0

