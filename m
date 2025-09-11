Return-Path: <linux-media+bounces-42259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58399B52B57
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC241C84583
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0AC2E03EC;
	Thu, 11 Sep 2025 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z8q1JUL5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887D261595;
	Thu, 11 Sep 2025 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578516; cv=none; b=sV72aEUv75Ux+ZJXKt81WWvTp8Z3+/K7wWGijCVNuXcDIjJPn92n3DTNegSrw2yTEXWFCmtBW1UTmJHdrHgcdXer4g5czbVkRcufIM91s6XKldejRlje5THDzWdONUiFoMeNOyjqnLsrLXQQOltBzFDXBY5uSbzIct/XNrkrJIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578516; c=relaxed/simple;
	bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlaQbyibwmONi1m0jF81QJw6QmO8nzl23m/qW9KlDC0kIP63VeKrThTsGvFoU1R9+DKgaOEaG9lH4STzD6IjwnSEegxZ/CYd6F+AEaQBx4/cJGPRGCxZGgBOmPBqNQOXTI132yzB+qW27iefJAeUU+JTuH833t52beymn80PyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z8q1JUL5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A31ED4A4;
	Thu, 11 Sep 2025 10:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578438;
	bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z8q1JUL5eZqUCKQZ84WVsKHdRMGVc5Vnjc+b0dRmqWGNh/1Qpq/d+EhRprBFF9B1p
	 LapDL5Ha9px78K5YS5Jm2gxSBYeTxRtsyasXnxP7cRftyxKmMsyjVsLe3cYiduQ+dN
	 t0yfcRMdMpxOphepYTR8q7xzrOqycpL7lVeRhRf4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:19 +0530
Subject: [PATCH v2 3/8] media: imx335: Update the native pixel array width
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-3-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=SODWfKHrsBZ5W0y5gSSZAR/KbjGtpSDwc8JyvXaGars=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTu3Zwdpj9/oTaHOt45kabP1ltCZUMeDiLyU
 i5kxvlkLa2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE7gAKCRBD3pH5JJpx
 Rb7JEACM5vpVZKTVQFQOvi1BmldpqgeZlg6/DUr5qEsJse5v898yilbFgZaaPTiRAlkE0LGCpx6
 NNf4LX0AS+XmeENotTnfbKzRSwLT8WQfhCBpe0r5xDXqa7bV8pb97d5Z/DQU5kbB1vaHmHVDAFW
 p/sgDFbADK3G+q7rmZuMshzMnlvF80RM6zydBx6iO0YAeTRdOcli/g347p31HfUPVnXsO4Ak/D1
 GC5dKDVVUgTguewMSdZVVzy7ulSclQfnPH+PX8aRD/lSwf0ik+JN8LihlZ6SUrpQ1EULfe06zib
 /JJAcej8vgZuR1EIuOo5zl7r9MMGEsa4S2BIY/MLkLF+gOvHT65ww0rMhtaATzbFF/6DaVxjIJZ
 +YPaVx/o01o/A6AdRqjtKF5JXL6JqdQSkmPCJrf4K3T5Ih72V9AyGzgtdn71a3aLOIF8KXgUKQt
 1/UME5kwVptXD/tFgAel99wFvrdILYtNnwEVCRXZupGMX75VNtLr/KVxSGp39x2bW8pYC3KRVDI
 v5h9XqA1IBNoWi5QPDKOv1HTBGrqj3w0kVfjMktQoBdtoFNxvc/q3h6qByFqqV1XmnMHleORCNZ
 jfLCVjo51Np1v9LaE3RahYGWlu9szxtWm4kkw/Nb2/VpecmnDXmnHtZNIv9ujaOzQ15OnG7Wo+G
 KvuZ1MgMp/3XqlA==
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


