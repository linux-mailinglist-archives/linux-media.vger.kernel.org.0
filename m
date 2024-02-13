Return-Path: <linux-media+bounces-5101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89085399D
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 19:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04BC1C21793
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 18:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936F2605CC;
	Tue, 13 Feb 2024 18:13:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B31605C6;
	Tue, 13 Feb 2024 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847980; cv=none; b=f3hoWVK1A1WLxUzRx/73+hU3LPvlqvE0TpyeHfHTkkps7s0l5YBO2TAT3/KcNXv1YAqgMb272ggh8r/VJC00At4CJa7XYIW2XoCf5zdhdKNxEdfNDSaT6txwXlwAPBSkfeIFA6gxIaQFQiF62pNywt1OBbchziE8BnsqWk/3aR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847980; c=relaxed/simple;
	bh=fRI87WrwQIOmgfFAJyHYYf6ksjLPvYExFFQJpPsBMEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RIXEtqPwuOgNVWRFrkhnp0giBdww2WuTTwN+/H7XtALSnO7GxbX+Q7u2y7GxvqzBrLOGKAVX2+z2GOY8cCcy3E/PWwWIKeOJYcnTZPaFrH3HEWn0EUY4ZwlL8kCI0bD+ZDLmoMMd7jc3mBwaL539hYx0kSXcGaLr9rAzsec6o2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="193805261"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Feb 2024 03:12:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEDC74061790;
	Wed, 14 Feb 2024 03:12:53 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/5] media: platform: rzg2l-cru: rzg2l-csi2: Restructure vclk handling
Date: Tue, 13 Feb 2024 18:12:32 +0000
Message-Id: <20240213181233.242316-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
latest hardware manual (R01UH0914EJ0145 Rev.1.45) we need to disable the
vclk before enabling the LINK reception and enable the vclk after enabling
the link Reception. So restructure vclk handling as per the HW manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit header and description
 * Split the patch into 2. Restructuring of vclk for link reception is
   handled here and fixing start reception procedure is handled
   in the next patch.
v1->v2:
 * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
   not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.
---
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 --
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 28 +++++++++++--------
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 ++--------
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 10 -------
 4 files changed, 19 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 811603f18af0..a5a99b004322 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
 	struct v4l2_pix_format format;
 };
 
-void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru);
-int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
-
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e00d9379dd2c..e68fcdaea207 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -108,6 +108,7 @@ struct rzg2l_csi2 {
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
 	struct clk *sysclk;
+	struct clk *vclk;
 	unsigned long vclk_rate;
 
 	struct v4l2_subdev subdev;
@@ -361,7 +362,7 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 	return rzg2l_csi2_dphy_disable(csi2);
 }
 
-static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
+static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 {
 	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
 	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
@@ -386,11 +387,15 @@ static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
 	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
 	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
 
+	clk_disable_unprepare(csi2->vclk);
+
 	/* Enable LINK reception */
 	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
+
+	return clk_prepare_enable(csi2->vclk);
 }
 
-static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
+static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 {
 	unsigned int timeout = VSRSTS_RETRIES;
 
@@ -409,18 +414,21 @@ static void rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 
 	if (!timeout)
 		dev_err(csi2->dev, "Clearing CSI2nRTST.VSRSTS timed out\n");
+
+	return 0;
 }
 
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	int ret;
 
 	if (on)
-		rzg2l_csi2_mipi_link_enable(csi2);
+		ret = rzg2l_csi2_mipi_link_enable(csi2);
 	else
-		rzg2l_csi2_mipi_link_disable(csi2);
+		ret = rzg2l_csi2_mipi_link_disable(csi2);
 
-	return 0;
+	return ret;
 }
 
 static int rzg2l_csi2_s_stream(struct v4l2_subdev *sd, int enable)
@@ -731,7 +739,6 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
 	struct rzg2l_csi2 *csi2;
-	struct clk *vclk;
 	int ret;
 
 	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
@@ -757,12 +764,11 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	vclk = clk_get(&pdev->dev, "video");
-	if (IS_ERR(vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(vclk),
+	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	if (IS_ERR(csi2->vclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
-	csi2->vclk_rate = clk_get_rate(vclk);
-	clk_put(vclk);
+	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
 	csi2->dev = &pdev->dev;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 8466b4e55909..2d22c373588b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -80,20 +80,9 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 		}
 
-		rzg2l_cru_vclk_unprepare(cru);
-
 		ret = v4l2_subdev_call(cru->ip.remote, video, s_stream, enable);
-		if (ret == -ENOIOCTLCMD)
-			ret = 0;
-		if (!ret) {
-			ret = rzg2l_cru_vclk_prepare(cru);
-			if (!ret)
-				return 0;
-		} else {
-			/* enable back vclk so that s_stream in error path disables it */
-			if (rzg2l_cru_vclk_prepare(cru))
-				dev_err(cru->dev, "Failed to enable vclk\n");
-		}
+		if (!ret || (ret == -ENOIOCTLCMD))
+			return 0;
 
 		s_stream_ret = ret;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a7d6fe831d54..d15a9bfcc98b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -461,16 +461,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	return 0;
 }
 
-void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru)
-{
-	clk_disable_unprepare(cru->vclk);
-}
-
-int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru)
-{
-	return clk_prepare_enable(cru->vclk);
-}
-
 static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
 {
 	struct media_pipeline *pipe;
-- 
2.25.1


