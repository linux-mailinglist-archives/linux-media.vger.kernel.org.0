Return-Path: <linux-media+bounces-35743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87BAE622C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54F53BE732
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB832286D42;
	Tue, 24 Jun 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H3F0tmxN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285E285068;
	Tue, 24 Jun 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760500; cv=none; b=HKw3bVp9+o+5YYjWq4vInp69JXS71ctkCqN37Q3+JUQ5+WPdgUQzO5x/dZ9x0fiZfN1HTgdTDXqWI3lRtVQnfaJG1ANhNARAqxlkY5tU7GkntCsSIARKLQbp4IAIrrYVXnZIdPVmvIUMdpy6137a/gaZ4sNLB/yin5gjIQilZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760500; c=relaxed/simple;
	bh=hdH/34wFFVYyC7A4YfKC8agorO3hH02Yjwpr0Oau/Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFrFKda4oP0RJl8vn9QxfoBZb7bGYVkpijEdat9vHinWvJpP7iaG1UMnU3c6OoACgZzT/ttpHi7O/TKGpwn3sYjdLI7cftUOH+IBnW9vJDZj+K9WyXjlNrZcEWzT4yt49jPIjL1t9fYJoCRcpZtDRZxaPJrE89rmWxEAakG7pDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H3F0tmxN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AA37C72;
	Tue, 24 Jun 2025 12:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760475;
	bh=hdH/34wFFVYyC7A4YfKC8agorO3hH02Yjwpr0Oau/Tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H3F0tmxNDh5gHQPLzcPJ92TcGGk5jMeQ24QrRwGsPHjE1Bn3gR6hhDMLfVAhr5DOG
	 TMvQbtJk8ppr4wac8JTw3SAXucYUiqt/8U2E2Lb87NoJm1WruCpfesMaQrSaohX9Fh
	 av6ja3IHkbVraFXLGUqX26YlKU5EGo+R21yKmers=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:15 +0100
Subject: [PATCH v10 02/17] media: uapi: Add 20-bit bayer formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-2-54f3d4196990@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13467;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=hdH/34wFFVYyC7A4YfKC8agorO3hH02Yjwpr0Oau/Tg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwm+mxaIWRmfTiJJG1YSMjBCX7kiQzQrW6zS
 tDmHsO6S5SJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JgAKCRDISVd6bEV1
 MnKKD/kBJgZEVpArN/zCXbhwOJi8C8oQk0n/oLotgB6hD1lYtvWLH/9KTgKISEzMjr2XpjI7M2g
 shE3lrRSkNncskS8n7wsO7kaU+1WV1TxGtOoV0ARDKmqeI/18CgllAnRDNbd/8qKZSsW0JnpkUW
 QwhhLOUUPi+L4YeQhOPCFsa3oDxHWPXou/JM8OVBYQXkJLeLgAqRgE3uCq9EcgCJD4jW4tUisxD
 uy3KdYDw5w3fOpM9nly0U2WoBiSLcoGiS8d3nM0LwI2xJJAosO+ezvbbsSNImuNOf4TVYiqnJh/
 odRz4TRNk/Du/yayS0muu1ETLt8sZRyvA/o3U0Oc6DEOhET161t56Uzo5hqo520QCfCGpytv20D
 Z28cJaL85nsl+zmhhccA98qMsF+bxPgVZKuU4M3gISTYG8g8Hl9+3+91fKkyY1iJ2U5BHV+bJ9A
 eFzIhV8z8gdqc2U//ngLeDSLH8i+sKnu4ppMF5EcXJ4vOf8Jef55IDUt79/F9EDlYuC0uBwvg4J
 LZz2YiEwyTQSODczFwcxAzbbhp/4lPPYOppJ1J9onQG/WXYAdgN55wwI8UAMy8lMwBOkqGy4Okj
 kQ+/8XD5i6nuYNbQk5SZ0e87rG+4knfBxgf0C7ScMGb6UfhFo5quNXBdmNNOjdIDBsCe0FPcHKH
 WPi+xrnEHxqOwwQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The Mali-C55 requires input data be in 20-bit format, MSB aligned.
Add some new media bus format macros to represent that input format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- Fixed the table formatting

Changes in v5:

	- New patch
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 252 ++++++++++++++++++++-
 include/uapi/linux/media-bus-format.h              |   6 +-
 2 files changed, 255 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 57194180fe42f31f88aa0aeb4a4650bf4fb32bcc..ecbe83dcc4b716c77ce37f55fbb8a59b2eed17ab 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2816,7 +2816,7 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
@@ -2829,10 +2829,14 @@ organization is given as an example for the first pixel only.
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
@@ -2862,6 +2866,10 @@ organization is given as an example for the first pixel only.
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
@@ -2883,6 +2891,10 @@ organization is given as an example for the first pixel only.
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
@@ -2904,6 +2916,10 @@ organization is given as an example for the first pixel only.
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
@@ -2925,6 +2941,10 @@ organization is given as an example for the first pixel only.
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
@@ -2946,6 +2966,10 @@ organization is given as an example for the first pixel only.
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
@@ -2967,6 +2991,10 @@ organization is given as an example for the first pixel only.
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
@@ -2988,6 +3016,10 @@ organization is given as an example for the first pixel only.
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
@@ -3009,6 +3041,10 @@ organization is given as an example for the first pixel only.
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
@@ -3030,6 +3066,10 @@ organization is given as an example for the first pixel only.
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
@@ -3051,6 +3091,10 @@ organization is given as an example for the first pixel only.
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
@@ -3072,6 +3116,10 @@ organization is given as an example for the first pixel only.
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
@@ -3093,6 +3141,10 @@ organization is given as an example for the first pixel only.
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
@@ -3114,6 +3166,10 @@ organization is given as an example for the first pixel only.
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
@@ -3133,6 +3189,10 @@ organization is given as an example for the first pixel only.
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
@@ -3154,6 +3214,10 @@ organization is given as an example for the first pixel only.
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
@@ -3173,6 +3237,10 @@ organization is given as an example for the first pixel only.
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
@@ -3194,6 +3262,10 @@ organization is given as an example for the first pixel only.
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
@@ -3213,6 +3285,10 @@ organization is given as an example for the first pixel only.
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
@@ -3234,6 +3310,10 @@ organization is given as an example for the first pixel only.
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
@@ -3253,6 +3333,10 @@ organization is given as an example for the first pixel only.
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
@@ -3272,6 +3356,10 @@ organization is given as an example for the first pixel only.
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
@@ -3293,6 +3381,10 @@ organization is given as an example for the first pixel only.
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
@@ -3314,6 +3406,10 @@ organization is given as an example for the first pixel only.
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
@@ -3335,6 +3431,10 @@ organization is given as an example for the first pixel only.
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
@@ -3354,6 +3454,10 @@ organization is given as an example for the first pixel only.
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
@@ -3375,6 +3479,10 @@ organization is given as an example for the first pixel only.
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
@@ -3396,6 +3504,10 @@ organization is given as an example for the first pixel only.
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
@@ -3417,6 +3529,10 @@ organization is given as an example for the first pixel only.
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
@@ -3436,6 +3552,10 @@ organization is given as an example for the first pixel only.
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
@@ -3457,6 +3577,10 @@ organization is given as an example for the first pixel only.
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
@@ -3478,6 +3602,10 @@ organization is given as an example for the first pixel only.
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
@@ -3499,6 +3627,10 @@ organization is given as an example for the first pixel only.
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
@@ -3518,6 +3650,10 @@ organization is given as an example for the first pixel only.
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
@@ -3539,6 +3675,10 @@ organization is given as an example for the first pixel only.
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
@@ -3560,6 +3700,10 @@ organization is given as an example for the first pixel only.
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
@@ -3581,6 +3725,110 @@ organization is given as an example for the first pixel only.
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
index 62ad82fd285a8ce24bd16c207c51c0e75ea95070..6005f033e62c04bdd3dff7ac905f5b921341cd47 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3021 */
+/* Bayer - next is	0x3025 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -157,6 +157,10 @@
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


