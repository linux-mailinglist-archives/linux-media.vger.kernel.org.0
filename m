Return-Path: <linux-media+bounces-15955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7794B217
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 23:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14B51F23E93
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 21:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B4715575E;
	Wed,  7 Aug 2024 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KH5Dvxh9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252515572F
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723065809; cv=none; b=kPiItLt5CJd8MRibnntFBcq/bCDjZBNnO41yL9GCiBG8ZQX3tKiO+L3JWdgRwmFisR0+sXnduH5Ity1FWAR1Ln6jZdoQviZ9lF5RIHMejw0HxmXFa+DhitGzlGPQsmPP2aGDKMovHP7nAcgxPyj+ZdR2rJswJCpkN/4JyMP2wok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723065809; c=relaxed/simple;
	bh=BFjXsC6QzC+OOWgAbNy9UBXQ8CTEj+13thguJ5gZa+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcYGjU8hZYpfvdf9i6bOMIsbZI4BF9OKvF6d5Q8vRBuqN2LV1I6xgolg5CzB6raIKnGUDFX8jEKe+9u+bd7E3F+TOaywAxofKBmUiwMziUBiDz/+6C1r71BQQ5B7OnNujYbhSqui7dRzozpic5q6PsL5Ej9jtEv8C40N6XFFTmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KH5Dvxh9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-150-234-175.cust.dsl.teletu.it [93.150.234.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A446D6E;
	Wed,  7 Aug 2024 23:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723065753;
	bh=BFjXsC6QzC+OOWgAbNy9UBXQ8CTEj+13thguJ5gZa+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KH5Dvxh9Npp2dcpQR5DGYHnypu+B5pdZRjOFOlE0b5eeEGgbyl73CV+qGHRudBwIW
	 Przph9zLoAdg8vwlID90lNNR2qocWuZEGKK/lKYN116XdBko+PsYrIAAeV6VzDI0v3
	 A6UCC/4QM39Ka4CWhxRWedawqTAxmH3d4T9pLcxc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 11/12] media: rkisp1: Add feature flags for BLS and compand
Date: Wed,  7 Aug 2024 23:22:51 +0200
Message-ID: <20240807212253.1667847-12-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
References: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

Add feature flags for the dedicated black level subtraction hardware
block and for the compand hardware block. The companding feature flag is
added on its own (as opposed to "the absence of BLS") because we will
need it later for when we add support for the companding block.

Skip BLS configuration when the BLS feature flag is unset, as devices
without the dedicated BLS block cannot configure a hardware block that
doesn't exist.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 4 ++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 9 ++++++---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 7 +++++++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 6fbc69128b55..964d1d200d0b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -115,6 +115,8 @@ enum rkisp1_isp_pad {
  * @RKISP1_FEATURE_SELF_PATH: The ISP has a self path
  * @RKISP1_FEATURE_DUAL_CROP: The ISP has the dual crop block at the resizer input
  * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
+ * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
+ * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
  *
  * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
  * the driver to implement support for features present in some ISP versions
@@ -126,6 +128,8 @@ enum rkisp1_feature {
 	RKISP1_FEATURE_SELF_PATH = BIT(2),
 	RKISP1_FEATURE_DUAL_CROP = BIT(3),
 	RKISP1_FEATURE_DMA_34BIT = BIT(4),
+	RKISP1_FEATURE_BLS = BIT(5),
+	RKISP1_FEATURE_COMPAND = BIT(6),
 };
 
 #define rkisp1_has_feature(rkisp1, feature) \
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index bb0202386c70..823814d8e687 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -509,7 +509,8 @@ static const struct rkisp1_info px30_isp_info = {
 	.isp_ver = RKISP1_V12,
 	.features = RKISP1_FEATURE_MIPI_CSI2
 		  | RKISP1_FEATURE_SELF_PATH
-		  | RKISP1_FEATURE_DUAL_CROP,
+		  | RKISP1_FEATURE_DUAL_CROP
+		  | RKISP1_FEATURE_BLS,
 };
 
 static const char * const rk3399_isp_clks[] = {
@@ -530,7 +531,8 @@ static const struct rkisp1_info rk3399_isp_info = {
 	.isp_ver = RKISP1_V10,
 	.features = RKISP1_FEATURE_MIPI_CSI2
 		  | RKISP1_FEATURE_SELF_PATH
-		  | RKISP1_FEATURE_DUAL_CROP,
+		  | RKISP1_FEATURE_DUAL_CROP
+		  | RKISP1_FEATURE_BLS,
 };
 
 static const char * const imx8mp_isp_clks[] = {
@@ -550,7 +552,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
 	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
 	.isp_ver = RKISP1_V_IMX8MP,
 	.features = RKISP1_FEATURE_MAIN_STRIDE
-		  | RKISP1_FEATURE_DMA_34BIT,
+		  | RKISP1_FEATURE_DMA_34BIT
+		  | RKISP1_FEATURE_COMPAND,
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 4ea7f1ec654e..4a4f15e9fbbc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1268,6 +1268,12 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 	module_cfg_update = new_params->module_cfg_update;
 	module_ens = new_params->module_ens;
 
+	if (!rkisp1_has_feature(params->rkisp1, BLS)) {
+		module_en_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
+		module_cfg_update &= ~RKISP1_CIF_ISP_MODULE_BLS;
+		module_ens &= ~RKISP1_CIF_ISP_MODULE_BLS;
+	}
+
 	/* update dpc config */
 	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
 		rkisp1_dpcc_config(params,
@@ -1862,6 +1868,7 @@ static const struct rkisp1_ext_params_handler {
 		.size		= sizeof(struct rkisp1_ext_params_bls_config),
 		.handler	= rkisp1_ext_params_bls,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features       = RKISP1_FEATURE_BLS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
 		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
-- 
2.45.2


