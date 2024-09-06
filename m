Return-Path: <linux-media+bounces-17792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F091F96F843
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810741F24F8D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C21D3190;
	Fri,  6 Sep 2024 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kqv6hPDm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1C381C2;
	Fri,  6 Sep 2024 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636867; cv=none; b=MaKz7arvpa+7S5/knhA3BrgH8rPIUO5OkPk17nWGi/iJb7F4aSVKUDAk68J56sutVhU6Hn91YB3H8NwqpttaqodDVNsoVyWlmdFIqO6N6CCAxRHAv4KdZPKYNlige52nOMgzi/CPVTuNerzk2GUsuY67AXF9lALZB6u4XNR71oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636867; c=relaxed/simple;
	bh=0KOMeaHzTarJ/YF7sxhXE14YVR8ldc3ne/+uK9qzsiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EaNKG/WLpSy1pzab+qW0S8UCAiHG5aW0Fh3Qrud/ZWaV6ceHqRX28wFJQiTzgk2Z7/4TCgDKSRCD5TCo3YLgpT6sYBkZllm4Y7ghJnSzOOwBPP5Ol5UVoFVJGTJSRzvoU90an0uSkaiLPp5nVWJJVPsibJDgVQ1I0b1heEbbIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kqv6hPDm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21E73DB2;
	Fri,  6 Sep 2024 17:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725636784;
	bh=0KOMeaHzTarJ/YF7sxhXE14YVR8ldc3ne/+uK9qzsiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kqv6hPDmoTv/9mnISoWEsaZCao9tTprGyyWvXvX1vxVwMPlbIH3oMo8C6wBC3/MEa
	 t/pQLmbpm1wNsiN4HtM/BhtndiTDDLXCDZW7hLtQ1fNJpL0LUlBx15w0jhU54v0WQY
	 xXlGQKpzVC6UvFk6w40QxjP1SvVBECMchWlYKyPM=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v7 02/17] media: uapi: Add 20-bit bayer formats
Date: Fri,  6 Sep 2024 16:33:51 +0100
Message-Id: <20240906153406.650105-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906153406.650105-1-dan.scally@ideasonboard.com>
References: <20240906153406.650105-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mali-C55 requires input data be in 20-bit format, MSB aligned.
Add some new media bus format macros to represent that input format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v7:

	- None

Changes in v6:

	- Fixed the table formatting

Changes in v5:

	- New patch

 .../media/v4l/subdev-formats.rst              | 252 +++++++++++++++++-
 include/uapi/linux/media-bus-format.h         |   6 +-
 2 files changed, 255 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 5dbf8c9b18fb..ff328eb485e8 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2664,7 +2664,7 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
@@ -2677,10 +2677,14 @@ organization is given as an example for the first pixel only.
     * - Identifier
       - Code
       -
-      - :cspan:`15` Data organization
+      - :cspan:`19` Data organization
     * -
       -
       - Bit
+      - 19
+      - 18
+      - 17
+      - 16
       - 15
       - 14
       - 13
@@ -2710,6 +2714,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2731,6 +2739,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2752,6 +2764,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2773,6 +2789,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2794,6 +2814,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2815,6 +2839,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2836,6 +2864,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2857,6 +2889,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2878,6 +2914,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2899,6 +2939,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2920,6 +2964,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2941,6 +2989,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2962,6 +3014,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -2981,6 +3037,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3002,6 +3062,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3021,6 +3085,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3042,6 +3110,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3061,6 +3133,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3082,6 +3158,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3101,6 +3181,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3120,6 +3204,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3141,6 +3229,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3162,6 +3254,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3183,6 +3279,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
@@ -3202,6 +3302,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`11`
       - b\ :sub:`10`
       - b\ :sub:`9`
@@ -3223,6 +3327,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3244,6 +3352,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3265,6 +3377,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`11`
       - r\ :sub:`10`
       - r\ :sub:`9`
@@ -3284,6 +3400,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`13`
       - b\ :sub:`12`
       - b\ :sub:`11`
@@ -3305,6 +3425,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3326,6 +3450,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3347,6 +3475,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`13`
       - r\ :sub:`12`
       - r\ :sub:`11`
@@ -3366,6 +3498,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SBGGR16_1X16
       - 0x301d
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`15`
       - b\ :sub:`14`
       - b\ :sub:`13`
@@ -3387,6 +3523,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGBRG16_1X16
       - 0x301e
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3408,6 +3548,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGRBG16_1X16
       - 0x301f
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3429,6 +3573,110 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SRGGB16_1X16
       - 0x3020
       -
+      -
+      -
+      -
+      -
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR20-1X20:
+
+      - MEDIA_BUS_FMT_SBGGR20_1X20
+      - 0x3021
+      -
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGBRG20-1X20:
+
+      - MEDIA_BUS_FMT_SGBRG20_1X20
+      - 0x3022
+      -
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGRBG20-1X20:
+
+      - MEDIA_BUS_FMT_SGRBG20_1X20
+      - 0x3023
+      -
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SRGGB20-1X20:
+
+      - MEDIA_BUS_FMT_SRGGB20_1X20
+      - 0x3024
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
       - r\ :sub:`15`
       - r\ :sub:`14`
       - r\ :sub:`13`
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 49be328d9a3b..b6acf8c8e383 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -122,7 +122,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3021 */
+/* Bayer - next is	0x3025 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -155,6 +155,10 @@
 #define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
 #define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
 #define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
+#define MEDIA_BUS_FMT_SBGGR20_1X20		0x3021
+#define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
+#define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
+#define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
-- 
2.34.1


