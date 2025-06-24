Return-Path: <linux-media+bounces-35746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44462AE6232
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF10A4C1687
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BE828030E;
	Tue, 24 Jun 2025 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J65NmTez"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6639286D5C;
	Tue, 24 Jun 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760506; cv=none; b=Pr8xuKvouETqtA7uVknj0GIBxAfi9SL5FSODaUKaCYiP66llJrddOHq3bSy2pT+VrBqGCItpYK2hzVZ+7jCAt8ZN0g2nEgDBVdoRTPK7U3NBocMmVeNmB8vL2DC+yAVAlcqq+or9H/CO2z0gHKfwwQugneooxgLLSSEHVrsdy4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760506; c=relaxed/simple;
	bh=ckOBFBNFbarv/jw2bNjiwduRQVJMz9MPGCyJ2CBi1iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCGf4oTKITfyQClbePqP189fZYXVFaTY0yCxKjx6KROSpHM+cjwEb79HN95i+zQh5RRHCrNmf9/KWrmHPKl1cLJII67n+a3QMnBLdfbDMsWIO+6jEDEIS0cBHMbGsh9CkzYMsh6ArRNxgBnc2Wivg3BI6hR293L0GDXF3kD2YsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J65NmTez; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A68131838;
	Tue, 24 Jun 2025 12:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760478;
	bh=ckOBFBNFbarv/jw2bNjiwduRQVJMz9MPGCyJ2CBi1iI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J65NmTezW60NJKuXUtWBZtMBLk0UfPtW+5V7xL01QEOCck0EI7MH5gXYasW99w0Sl
	 W6I3OMc4F0TepvFOpvw35HOAX3zUGOzJbKuzHdfe5FkTi2WkofQFp5xUxTBbHWZSfo
	 WiVREdBHFynQlF5qSRIWW37DMsMA90Jg0VR+vyok=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:19 +0100
Subject: [PATCH v10 06/17] media: uapi: Add controls for Mali-C55 ISP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-6-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5495;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ckOBFBNFbarv/jw2bNjiwduRQVJMz9MPGCyJ2CBi1iI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwnaWsx5PRyOvZpc7SyC29IbjVXr8c7rNK9T
 GpAaz5uDSiJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JwAKCRDISVd6bEV1
 Mlt6D/9a3cfpOu9777x+p/qvaWHRS9QQpM5CEKlrQzc9xHYIqfNcCJKqNQEtYHYmHrb95Xh5qXk
 u/2d1p/YUoWJkFRM7yo925hG4a1s3PWgVjqzrbRPsBLW++9aJhd3ron4MPDqgOQ+cA2j5iBT/Qa
 pXgguI9z6QusH7qFd3lNXxFqsxnG1Q27+NCg2cl9BgcPAAYLup6d0GMEFa94oxnyOUCRgkuD5Za
 G54AknuVlmxTLkNAFCbi+9flCZvaNOB0xOhOd6GZDsEEhGdGQMBUGDwVJaQEMrCILaPm/rDpKh/
 UPGaYhJaxMA5uWaQEjDUgabWjr4eIy3U/3Q/3p4ac1RO4UIvsk6B54PdbGM0l9SEj8mPFtlWMf2
 6yVSMYMxmg1XOFLpvgTYTxGy41t+OpbZ4w/z4glteSkvADaNYSRY2ALJB3qDlVGadBI+do2JTBR
 oLeWef99Dcq7DW8+7iOQDogbQxKmekBktLKN9uAxMywMGqQoV9j7Zt1PpW2REqFc45QEWzJUXBE
 tOOQbCVVBnx8pRwhaPZgKUo1GQ5cw/YB2Vbr1dXftHSMKsC4GpP7s61wkbOHAJjgHweKHz40Tz8
 gbeUOcfEFwj3cNPJIEmT3Zi82mTmewpjFZ27jOofC7WLV0Nx5eY5c6DpTWLtW1cIFeKQfXXWd0l
 +atsb5rlGaiQwig==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add definitions and documentation for the custom control that will
be needed by the Mali-C55 ISP driver. This will be a read only
bitmask of the driver's capabilities, informing userspace of which
blocks are fitted and which are absent.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- New patch
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++++++++
 include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
 include/uapi/linux/v4l2-controls.h                 |  6 +++
 4 files changed, 88 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc1329c09bffee895e68 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	cx2341x-uapi
 	dw100
 	imx-uapi
+	mali-c55
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e8519da77d737b91a931bbe47920af707eebf110
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Arm Mali-C55 ISP driver
+=======================
+
+The Arm Mali-C55 ISP driver implements a single driver-specific control:
+
+``V4L2_CID_MALI_C55_CAPABILITIES``
+    Detail the capabilities of the ISP by giving detail about the fitted blocks.
+
+    .. flat-table:: Bitmask meaning definitions
+	:header-rows: 1
+	:widths: 2 4 8
+
+	* - Bit
+	  - Macro
+	  - Meaning
+        * - 0
+          - MALI_C55_GPS_PONG_FITTED
+          - Pong configuration space is fitted in the ISP
+        * - 1
+          - MALI_C55_GPS_WDR_FITTED
+          - WDR Framestitch, offset and gain is fitted in the ISP
+        * - 2
+          - MALI_C55_GPS_COMPRESSION_FITTED
+          - Temper compression is fitted in the ISP
+        * - 3
+          - MALI_C55_GPS_TEMPER_FITTED
+          - Temper is fitted in the ISP
+        * - 4
+          - MALI_C55_GPS_SINTER_LITE_FITTED
+          - Sinter Lite is fitted in the ISP instead of the full Sinter version
+        * - 5
+          - MALI_C55_GPS_SINTER_FITTED
+          - Sinter is fitted in the ISP
+        * - 6
+          - MALI_C55_GPS_IRIDIX_LTM_FITTED
+          - Iridix local tone mappine is fitted in the ISP
+        * - 7
+          - MALI_C55_GPS_IRIDIX_GTM_FITTED
+          - Iridix global tone mapping is fitted in the ISP
+        * - 8
+          - MALI_C55_GPS_CNR_FITTED
+          - Colour noise reduction is fitted in the ISP
+        * - 9
+          - MALI_C55_GPS_FRSCALER_FITTED
+          - The full resolution pipe scaler is fitted in the ISP
+        * - 10
+          - MALI_C55_GPS_DS_PIPE_FITTED
+          - The downscale pipe is fitted in the ISP
+
+    The Mali-C55 ISP can be configured in a number of ways to include or exclude
+    blocks which may not be necessary. This control provides a way for the
+    driver to communicate to userspace which of the blocks are fitted in the
+    design.
\ No newline at end of file
diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..2bd60a0d78786be368c2e51b1a0a63fd2a5f690b
--- /dev/null
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * ARM Mali-C55 ISP Driver - Userspace API
+ *
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#ifndef __UAPI_MALI_C55_CONFIG_H
+#define __UAPI_MALI_C55_CONFIG_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
+#define MALI_C55_GPS_PONG_FITTED		BIT(0)
+#define MALI_C55_GPS_WDR_FITTED			BIT(1)
+#define MALI_C55_GPS_COMPRESSION_FITTED		BIT(2)
+#define MALI_C55_GPS_TEMPER_FITTED		BIT(3)
+#define MALI_C55_GPS_SINTER_LITE_FITTED		BIT(4)
+#define MALI_C55_GPS_SINTER_FITTED		BIT(5)
+#define MALI_C55_GPS_IRIDIX_LTM_FITTED		BIT(6)
+#define MALI_C55_GPS_IRIDIX_GTM_FITTED		BIT(7)
+#define MALI_C55_GPS_CNR_FITTED			BIT(8)
+#define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
+#define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
+
+#endif /* __UAPI_MALI_C55_CONFIG_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 72e32814ea83dee5f1202c1249eac7cf3b85a22a..a31105115410bd041a3ac492ce86becd93a62d87 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -222,6 +222,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
 
+/*
+ * The base for the Arm Mali-C55 ISP driver controls.
+ * We reserve 8 controls for this driver
+ */
+#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1220)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1


