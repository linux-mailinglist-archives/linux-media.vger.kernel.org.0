Return-Path: <linux-media+bounces-42514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D92B5707C
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 034E63A0F69
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E6A287511;
	Mon, 15 Sep 2025 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G0g7uSOW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4391280308;
	Mon, 15 Sep 2025 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918389; cv=none; b=VagYnWLUzH8Smc8C3R6x4DkbJ1UF2nnL9pTj9/eMa+P8PNrjBAaB3gR7uhRKAiEjz1CsuPSsQM63XNVeYq34HzvZuNT/Yxo4Sz2TR36g+MD360EkIwCRFqoa+gj9t8iWR4Vf6q6Fx5A9PbyfCxTdXNECfuZDX5ZwG+g29KnVBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918389; c=relaxed/simple;
	bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIzwNfxYPkA16uImU2knK99xEoDLgQ4XD12JMF57sxmK1J14i92UNHRaEbJpj6+J5f6rXcg4QhURIDqkY4+41WolLO4LJwn2j1Auve8gTNxEVzw7/LviznyLzCuQu1BSQYlb8k+K43Sl7qtgwrMaN93dSS574VPvJAT1pvVfYeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G0g7uSOW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9227C71;
	Mon, 15 Sep 2025 08:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918309;
	bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G0g7uSOW+5JSQxo3+kr9KyWUHgfuIfscdNYAXj4c3DeMzqcFRx/SXBDanuoBThIK6
	 QuPZW7XQOubWikMtFGgd/ZQ3qqQLEtIXzh7iXfzAAhtJ1NTXys+kwLQPjS0Df61Q3w
	 3UWJEjbhmQe47OAXRBsDQhLzSr1IV3fRdJPhWzfY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:09 +0530
Subject: [PATCH v3 3/8] media: imx335: Update the native pixel array width
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-3-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SSamT5gv0hTuhM8craEg1Aat/RgPmNyn82Y
 Dg37CApKkuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0kgAKCRBD3pH5JJpx
 RTFRD/wJO6SsYudXs5NNnsJzOpPaG39xN6CPEVbgWFvCq8k1Yk/yi+ACZ2ieI+bHiljMeMrIrII
 orIB30KBO+xSx87vSX9pRA6SU8RVSTSmvY2tuQAQAZNWRZTAUXgCZYkZJ5kTJtex11Kwj+63W9U
 b0lN2ZNVa+dKYE0x54sZXdBGy44NSsUxEOcybVGO4rUvcDvzq3f66DsMTq6YZSnOXZbfUsMcU7X
 6I+3aL+eSRCpLsH3xSgmW7TC+hQp4YUC06MfemtGPHIsFioO44Hb0ECn8MGuF1/iiuV13TPfcfL
 6hrVMaV0aOSvwru9PlnGUbesUP8CU5Ku1Gt8uk3ZPtXWvHINr+uXgR6p4pX1Vlw7mdcXfsjgbUL
 b2TgQ0ks8nbHXAabIH7LgTgPXLGe6mrHbHltSSO7JeMfTaEUHUzF1L9naiMCanogqLeu3Whq5bX
 nOMu7XE1B3AKA+3mDxVvMEKnJCHeEkvsfcCw+pc94M/VJBRQGuAXT13wH9vS4EM6GLphU4a8X2n
 qKo7Rs3Z88u7GUfL8VpcFbD8wp4BfsC0SyoMMf87gUf3ZEDn5h/2KGsglM9KK7x/G6e/KBoh59O
 CNA8iSp/dx7JpUOCD+vhm3i29L/bBdkW+NBoaTt/5O0SF77q3WP4Y/O0xYbiWXSWHCS9BhCqFCy
 1FeX+4oPjDznVIQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The sensor datasheet reports actual total number of pixels as 2696x2044.

This becomes important for supporting 2x2 binning modes that can go
beyond the current maximum pixel array width set here.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 27baf6c9b426a324632db7e393514463611a5ae7..3522a6b1ca14e27c46a55e18e5bf51240ea5a6ee 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -124,12 +124,20 @@
 #define IMX335_NUM_DATA_LANES	4
 
 /* IMX335 native and active pixel array size. */
-#define IMX335_NATIVE_WIDTH		2616U
-#define IMX335_NATIVE_HEIGHT		1964U
-#define IMX335_PIXEL_ARRAY_LEFT		12U
-#define IMX335_PIXEL_ARRAY_TOP		12U
-#define IMX335_PIXEL_ARRAY_WIDTH	2592U
-#define IMX335_PIXEL_ARRAY_HEIGHT	1944U
+static const struct v4l2_rect imx335_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 2696,
+	.height = 2044,
+};
+
+static const struct v4l2_rect imx335_active_area = {
+	.top = 50,
+	.left = 52,
+	.width = 2592,
+	.height = 1944,
+};
+
 
 /**
  * struct imx335_reg_list - imx335 sensor register list
@@ -869,21 +877,13 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = IMX335_NATIVE_WIDTH;
-		sel->r.height = IMX335_NATIVE_HEIGHT;
-
+		sel->r = imx335_native_area;
 		return 0;
 
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = IMX335_PIXEL_ARRAY_TOP;
-		sel->r.left = IMX335_PIXEL_ARRAY_LEFT;
-		sel->r.width = IMX335_PIXEL_ARRAY_WIDTH;
-		sel->r.height = IMX335_PIXEL_ARRAY_HEIGHT;
-
+		sel->r = imx335_active_area;
 		return 0;
 	}
 

-- 
2.51.0


