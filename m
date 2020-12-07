Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8A52D1BFB
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 22:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgLGVZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 16:25:06 -0500
Received: from retiisi.eu ([95.216.213.190]:34580 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgLGVZG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 16:25:06 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A8786634C90;
        Mon,  7 Dec 2020 23:23:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 06/24] Documentation: ccs: Add user documentation for the CCS driver
Date:   Mon,  7 Dec 2020 23:15:12 +0200
Message-Id: <20201207211530.21180-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
References: <20201207211530.21180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the CCS driver. This includes e.g. sub-devices
implemented by the driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 59 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 MAINTAINERS                                   |  1 +
 3 files changed, 61 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/ccs.rst

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
new file mode 100644
index 000000000000..9f507b0a79b5
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -0,0 +1,59 @@
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
+**Copyright** |copy| 2020 Intel Corporation
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 05a82f8c0c99..1a9038f5f9fa 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -31,6 +31,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
+	ccs
 	cx2341x-uapi
 	imx-uapi
 	max2175
diff --git a/MAINTAINERS b/MAINTAINERS
index e97d4d9d741e..ab0bf9b8dd72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11644,6 +11644,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
 F:	Documentation/driver-api/media/drivers/ccs/
+F:	Documentation/userspace-api/media/drivers/ccs.rst
 F:	drivers/media/i2c/ccs-pll.c
 F:	drivers/media/i2c/ccs-pll.h
 F:	drivers/media/i2c/ccs/
-- 
2.29.2

