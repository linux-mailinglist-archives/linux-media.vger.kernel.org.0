Return-Path: <linux-media+bounces-35740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5377AE6226
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F424C1746
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515AA28467B;
	Tue, 24 Jun 2025 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdHtAuzq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07087280A58;
	Tue, 24 Jun 2025 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760496; cv=none; b=fuXAxGHDCvcAQ072Q+Y9NFliDOMfE6QUylKrTUf2r819AoJpBS+fYdxNkhsHWB7iFuNPiDASP1hT03b+P0yhI5d6g6oa1crxGXvT1NI5IfNCIgpDCfr3TxfQyv6+wroRnSq6xMHzLi7VS9+sT7q+r5UMWWq+DaG1RDAgh2baejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760496; c=relaxed/simple;
	bh=qfMoN70CVxfoRzskiRmPzGcwtf4lxcBnDokgX74Xreo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ey/NsCuRrwJdOwkJv3+ZKvNw+JEo06RB9G58a1lJWgj/gbQmzQbX7HZkKWV99xdzWNE9sTtGZaXnLeplzyiL85EoYxxKYhOcIjFXnR9kqoq0m5/9IgU5mAEpTWj1EckPFvOPP2CIqZQZgGadC2BH/qfydi5RcxJHmevOPGL1r20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdHtAuzq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A5387F0;
	Tue, 24 Jun 2025 12:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760475;
	bh=qfMoN70CVxfoRzskiRmPzGcwtf4lxcBnDokgX74Xreo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdHtAuzqzZBYTc4bv71m3/9Ez8d/ulBdCLK9r0bdnO03zyk2XeAo8g3pdRAXaJHLn
	 wntsPzIaoBZFojOdaM1rzRX5w5mLuyx37d0VBQ6m595aw5sun2oXGbUpDYmgTgKgO5
	 dtLO0wvUycQYU6yttf4hvDHgM+i5DQ+cPD4LUdhg=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:14 +0100
Subject: [PATCH v10 01/17] media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60
 format code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-1-54f3d4196990@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5749;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=qfMoN70CVxfoRzskiRmPzGcwtf4lxcBnDokgX74Xreo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwmFxo3TT7qIUjT+bTvv2tRve8AoM5fnPhMh
 OsTfZuLcPmJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JgAKCRDISVd6bEV1
 MsldD/9e0QYuKC2WHU+WEsny9h2F7oSCH+6Br8KfKpytmBAPFRxOv+En/3eYKCL1Y7zt4Gn93RJ
 4vgi4uXSPFJlpQ0PdGktyUiN6ehNEDwN0M8k6RVIHumEajxRXCERJ5qciqXqMqt0VuIl3csikH2
 rlRu+5GAJiXOSEKp4majdTsnr7ick5qiFmdZXOwRCv8IydAacNb8WsKV1DxmMqLNh7jt30y/3bn
 /NNv1J+G1iVapSgKi0ni8P+BpH3SDYQvXSrddUWmwEkQraIlL+k7gt/9SEgzIqCitkHGkYEKUTB
 dvGZNsKSB/e2eLer+Hx1/r1qZkDGsmeJyYs/OqGPQnHffMLOg9KmoTEz2LjGbCZEKDv7OuhBphZ
 2lXY3OBFvAsnrRZVKBukEPTcLg+x5xVg+yc2KI9xoa6MOrqJvPQOPU7q/bTUML0+fH3a26SGJPm
 HOJzfkCNshdsl8NsXX28/M72ykO7MXfj/yXgp7YUmuAHO5RyE/7//bjG8Tvduhdb9FZV2mjJrJZ
 TZO7Ela2TISiEDPIweVtmoEm6+q2N2kwS9lFAjb1/gefiHLoMsroY+A2HP++RSRjVlEPJKiGEl4
 VRVaMGEgxPN2Wbejr75CX/yUxodI+H2mZZRG6aj5a8tF4KHMqCLNpjagR+UAjm/aoGRDJ1ykMRe
 qHiM/kfVuVSqsyQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The Mali-C55 ISP by ARM requires 20-bits per colour channel input on
the bus. Add a new media bus format code to represent it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
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

	- none

Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- none
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 168 +++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |   3 +-
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 2a94371448dc07e5c7097421bd82f42dcd7e21aa..57194180fe42f31f88aa0aeb4a4650bf4fb32bcc 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2224,6 +2224,174 @@ The following table list existing packed 48bit wide RGB formats.
 
     \endgroup
 
+The following table list existing packed 60bit wide RGB formats.
+
+.. tabularcolumns:: |p{4.0cm}|p{0.7cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+
+.. _v4l2-mbus-pixelcode-rgb-60:
+
+.. raw:: latex
+
+    \begingroup
+    \tiny
+    \setlength{\tabcolsep}{2pt}
+
+.. flat-table:: 60bit RGB formats
+    :header-rows:  3
+    :stub-columns: 0
+    :widths: 36 7 3 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
+
+    * - Identifier
+      - Code
+      -
+      - :cspan:`31` Data organization
+    * -
+      -
+      - Bit
+      -
+      -
+      -
+      -
+      - 59
+      - 58
+      - 57
+      - 56
+      - 55
+      - 54
+      - 53
+      - 52
+      - 51
+      - 50
+      - 49
+      - 48
+      - 47
+      - 46
+      - 45
+      - 44
+      - 43
+      - 42
+      - 41
+      - 40
+      - 39
+      - 38
+      - 37
+      - 36
+      - 35
+      - 34
+      - 33
+      - 32
+    * -
+      -
+      -
+      - 31
+      - 30
+      - 29
+      - 28
+      - 27
+      - 26
+      - 25
+      - 24
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * .. _MEDIA-BUS-FMT-RGB202020-1X60:
+
+      - MEDIA_BUS_FMT_RGB202020_1X60
+      - 0x1026
+      -
+      -
+      -
+      -
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
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
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+    * -
+      -
+      -
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
+
+.. raw:: latex
+
+    \endgroup
+
 On LVDS buses, usually each sample is transferred serialized in seven
 time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
 differential data pairs at the same time. The remaining bits are used
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ff62056feed5b6588bfcfdff178f5b68eecd3a26..62ad82fd285a8ce24bd16c207c51c0e75ea95070 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1028 */
+/* RGB - next is	0x1029 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -74,6 +74,7 @@
 #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
+#define MEDIA_BUS_FMT_RGB202020_1X60		0x1028
 
 /* YUV (including grey) - next is	0x202f */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001

-- 
2.34.1


