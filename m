Return-Path: <linux-media+bounces-5395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E564E859959
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0F1BB20FE1
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33B973183;
	Sun, 18 Feb 2024 20:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BuCX2QPZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA971B54
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 20:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289050; cv=none; b=IMLLu2848AT6Rg+MKo0moZNFKSODBup9zdxwqWgM1vdglYdbb8xg5j93cAaC/j4ifiFW+w5NOs2t1xNVRR0tkpYtYy9RMPq/EdT5buha6mANXqUV68/+L/9vQvCPomRTC7nvxgQMqLOGrDQoGgJsfJwbXWlhVH0vOi5JqyxfHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289050; c=relaxed/simple;
	bh=uY18LmVaD9U4Xn/DcLvxP/q2FLdcBxSb4RSefAPUYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCyO+kOCyGbLYvspjcIYZYuXZw38pVee42d2ZKcM20iIrOM5hvvMsXwObi59st2yIDxFDvURYWjL6NK05bjNqucCbmhRZeSQh2hWkuswd5IVOJSu2ss3nMjNYzfnQqKUcm/YSk+dcLb9PYWH5a0yHz3be5lu+X3m5abnwHYi9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BuCX2QPZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A09511FAA;
	Sun, 18 Feb 2024 21:43:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289036;
	bh=uY18LmVaD9U4Xn/DcLvxP/q2FLdcBxSb4RSefAPUYDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BuCX2QPZgElwJtcbBJizlSywBUZhx1lh1JtbpWisBiYO3+XbCAHiZAKj0j3XfVdWh
	 6NeX47R8sR3WwZEGWlYulkAkSM3dQcZCAUMnKwDs7AuNlqjCcHcJdojQJaNfD13XS1
	 cQv+t19cymoRmFsh1aXzGdGx0rvrOPpIUYNY3eVc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 12/12] media: rkisp1: Add match data for i.MX8MP ISP
Date: Sun, 18 Feb 2024 22:43:50 +0200
Message-ID: <20240218204350.10916-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

Add match data to the rkisp1 driver to match the i.MX8MP ISP.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v6:

- Move out adding the version enum
---
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index ff4ba0682068..e6cd4b8604bc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -511,6 +511,26 @@ static const struct rkisp1_info rk3399_isp_info = {
 		  | RKISP1_FEATURE_DUAL_CROP,
 };
 
+static const char * const imx8mp_isp_clks[] = {
+	"isp",
+	"hclk",
+	"aclk",
+};
+
+static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
+	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) },
+};
+
+static const struct rkisp1_info imx8mp_isp_info = {
+	.clks = imx8mp_isp_clks,
+	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
+	.isrs = imx8mp_isp_isrs,
+	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
+	.isp_ver = RKISP1_V_IMX8MP,
+	.features = RKISP1_FEATURE_MAIN_STRIDE
+		  | RKISP1_FEATURE_DMA_34BIT,
+};
+
 static const struct of_device_id rkisp1_of_match[] = {
 	{
 		.compatible = "rockchip,px30-cif-isp",
@@ -520,6 +540,10 @@ static const struct of_device_id rkisp1_of_match[] = {
 		.compatible = "rockchip,rk3399-cif-isp",
 		.data = &rk3399_isp_info,
 	},
+	{
+		.compatible = "fsl,imx8mp-isp",
+		.data = &imx8mp_isp_info,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, rkisp1_of_match);
-- 
Regards,

Laurent Pinchart


