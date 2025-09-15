Return-Path: <linux-media+bounces-42586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104CB58357
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCC333BC8A3
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F582E7F3D;
	Mon, 15 Sep 2025 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BdXYK76J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6102BE043;
	Mon, 15 Sep 2025 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956731; cv=none; b=SsmL5WiZvlYkuEn97ccUMPsjHDq+8o4a4De0NEIiTSkJoLZD8OiHbvl7DWRrKOwgLYMHwzxwqU7vWOjzLoOzier0/54Z6O4OTBEBRzODEUI0EPEcSVUK2qMbzIVTfTWb483FbaXmCfUUidrKY8v9txzgEDFckTROOHIVYestN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956731; c=relaxed/simple;
	bh=S+MftF0bejoTCtSOL1QHBAYUyqL0Wv5jyt43AvZ3OyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAuA60IMP/FSrKdmiH8KWXlbITB51nRxQAf1Y4ebMfhTagQkwMgTE9nVYQFiOmHn9en2em2mhuLMfLIr8p1xJVwTpWXJ2viDcD2vyUEiMWKMLxaVximzzd3Lq90IyJouh0TUwpuTD/wrQooZaKxdJAPSwfWMRRJD1e1Ks4JY7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BdXYK76J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D1DCB0B;
	Mon, 15 Sep 2025 19:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956645;
	bh=S+MftF0bejoTCtSOL1QHBAYUyqL0Wv5jyt43AvZ3OyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BdXYK76JzGngyDMdtgTiWo5pJpu6aUUsKOIKM9q2WSZu0e5lGFV9HRSc7dVL2p3BW
	 2uyfyoLQIXAmvvX1X8uDSAdGnHPjIUS6aGi5I9E6Kctj/XtkweezOjOlHzHRZRrI1+
	 kORoeVAoRlQnaHnTMO2ldC7Zkbl/cRXiYMxkrm/A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:15 +0200
Subject: [PATCH v5 6/8] media: rkisp1: Use v4l2-isp for validation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-6-e6db94468af3@ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=31552;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=S+MftF0bejoTCtSOL1QHBAYUyqL0Wv5jyt43AvZ3OyM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEppg4mIJU8gINfQ9H+KzBSalB1sew3Wl05qJ
 cGUJGIfmiqJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKaQAKCRByNAaPFqFW
 PFYzD/4lbRL31i32arywN793jsMzh6uJvGZvt4J8f3sZeBd+C+s2P23VAeLzcNlLHa3h40bZ8xG
 +5syaVT3Gabsn8WLWOH93FwkHK+cWcuIYdLRF15ukSG1saTJwBhPmZFVEk+lPyPQV5S68FjGx/v
 YP9PrED01263iCPePmDLi5JxcjyEjT8+MuHfnUimXWSeGZ8C27XoyCi/KK4uGz3ymVN+rese1Ch
 n4fKqdAiB17qcX4I1irP6hn8ulzj1iD7RRdK0GZuBAB5qIe6zssBGpmRE2yO6KAEf/OVnpGMCiV
 ScFcbvT3jLT5c+A46hQ+bGYuBpSsb9fUXq6uq/6zkixezmzHTz+8wzdTqN6qR9y+HYNFRU/zq8o
 Yq/ynfQ4kAKhyxlIdjJ/LB2LvWjtk7KBftUX7aZuMYF3fP+fkT7xHCLv2Fc01+9zxnSj3ML92Sv
 Kthzg9QeD7ISTfJ9dJYxC7oNStcKuc3KQMYeRml27Xl47efUc+k7L+yEMOEYRzTdxBJkV4PyImV
 8RPWZwt6W2BEK8uJVBBGToND72pOQWS0xeVtVWe44/+g8QavHUe9CHEXXuGF1eHe751GpJlxGWP
 5fDD6tsXY7b+Jrt5YEtgqBeAdOZzC1qxtrvgt3KoTJthZGEn74MFGJ0IiJhQqFXXErftqKkShnp
 kb/fOScd35bOPCA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Convert rkisp1-params.c to use the new types for block handlers
defined in v4l2-isp.h and use the new helpers from v4l2-isp.c
to remove bolierplate code from the driver.

Break out from the handlers enumeration the 'group' and 'feature' flags
to a separate array and perform driver specific validation of these
fields separately.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/Kconfig     |   1 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 441 ++++++++++-----------
 2 files changed, 209 insertions(+), 233 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index 731c9acbf6efa33188617204d441fb0ea59adebc..f53eb1f3f3e7003d8e02c9236aeabb5ae8844f7b 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_ROCKCHIP_ISP1
 	select VIDEOBUF2_VMALLOC
 	select V4L2_FWNODE
 	select GENERIC_PHY_MIPI_DPHY
+	select V4L2_ISP
 	default n
 	help
 	  Enable this to support the Image Signal Processing (ISP) module
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index f1585f8fa0f478304f74317fd9dd09199c94ec82..de4e459fb556afb08891558dbf9d55b1973af8da 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>	/* for ISP params */
 
@@ -40,30 +41,6 @@
 #define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
 #define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(1)
 
-union rkisp1_ext_params_config {
-	struct rkisp1_ext_params_block_header header;
-	struct rkisp1_ext_params_bls_config bls;
-	struct rkisp1_ext_params_dpcc_config dpcc;
-	struct rkisp1_ext_params_sdg_config sdg;
-	struct rkisp1_ext_params_lsc_config lsc;
-	struct rkisp1_ext_params_awb_gain_config awbg;
-	struct rkisp1_ext_params_flt_config flt;
-	struct rkisp1_ext_params_bdm_config bdm;
-	struct rkisp1_ext_params_ctk_config ctk;
-	struct rkisp1_ext_params_goc_config goc;
-	struct rkisp1_ext_params_dpf_config dpf;
-	struct rkisp1_ext_params_dpf_strength_config dpfs;
-	struct rkisp1_ext_params_cproc_config cproc;
-	struct rkisp1_ext_params_ie_config ie;
-	struct rkisp1_ext_params_awb_meas_config awbm;
-	struct rkisp1_ext_params_hst_config hst;
-	struct rkisp1_ext_params_aec_config aec;
-	struct rkisp1_ext_params_afc_config afc;
-	struct rkisp1_ext_params_compand_bls_config compand_bls;
-	struct rkisp1_ext_params_compand_curve_config compand_curve;
-	struct rkisp1_ext_params_wdr_config wdr;
-};
-
 enum rkisp1_params_formats {
 	RKISP1_PARAMS_FIXED,
 	RKISP1_PARAMS_EXTENSIBLE,
@@ -1689,11 +1666,12 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
  * Extensible parameters format handling
  */
 
-static void
-rkisp1_ext_params_bls(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_bls(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_bls_config *bls = &block->bls;
+	const struct rkisp1_ext_params_bls_config *bls =
+		(const struct rkisp1_ext_params_bls_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (bls->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
@@ -1709,11 +1687,12 @@ rkisp1_ext_params_bls(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_BLS_ENA);
 }
 
-static void
-rkisp1_ext_params_dpcc(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_dpcc(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_dpcc_config *dpcc = &block->dpcc;
+	const struct rkisp1_ext_params_dpcc_config *dpcc =
+		(const struct rkisp1_ext_params_dpcc_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (dpcc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
@@ -1729,11 +1708,12 @@ rkisp1_ext_params_dpcc(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
 }
 
-static void
-rkisp1_ext_params_sdg(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_sdg(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_sdg_config *sdg = &block->sdg;
+	const struct rkisp1_ext_params_sdg_config *sdg =
+		(const struct rkisp1_ext_params_sdg_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (sdg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1749,11 +1729,12 @@ rkisp1_ext_params_sdg(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
 }
 
-static void
-rkisp1_ext_params_lsc(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_lsc(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_lsc_config *lsc = &block->lsc;
+	const struct rkisp1_ext_params_lsc_config *lsc =
+		(const struct rkisp1_ext_params_lsc_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (lsc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
@@ -1769,11 +1750,12 @@ rkisp1_ext_params_lsc(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
 }
 
-static void
-rkisp1_ext_params_awbg(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_awbg(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_awb_gain_config *awbg = &block->awbg;
+	const struct rkisp1_ext_params_awb_gain_config *awbg =
+		(const struct rkisp1_ext_params_awb_gain_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (awbg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1789,11 +1771,12 @@ rkisp1_ext_params_awbg(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 }
 
-static void
-rkisp1_ext_params_flt(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_flt(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_flt_config *flt = &block->flt;
+	const struct rkisp1_ext_params_flt_config *flt =
+		(const struct rkisp1_ext_params_flt_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (flt->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
@@ -1809,11 +1792,12 @@ rkisp1_ext_params_flt(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_FLT_ENA);
 }
 
-static void
-rkisp1_ext_params_bdm(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_bdm(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
+	const struct rkisp1_ext_params_bdm_config *bdm =
+		(const struct rkisp1_ext_params_bdm_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (bdm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
@@ -1829,11 +1813,12 @@ rkisp1_ext_params_bdm(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
 }
 
-static void
-rkisp1_ext_params_ctk(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_ctk(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_ctk_config *ctk = &block->ctk;
+	const struct rkisp1_ext_params_ctk_config *ctk =
+		(const struct rkisp1_ext_params_ctk_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (ctk->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_ctk_enable(params, false);
@@ -1847,11 +1832,12 @@ rkisp1_ext_params_ctk(struct rkisp1_params *params,
 		rkisp1_ctk_enable(params, true);
 }
 
-static void
-rkisp1_ext_params_goc(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_goc(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_goc_config *goc = &block->goc;
+	const struct rkisp1_ext_params_goc_config *goc =
+		(const struct rkisp1_ext_params_goc_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (goc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1869,11 +1855,12 @@ rkisp1_ext_params_goc(struct rkisp1_params *params,
 			      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
 }
 
-static void
-rkisp1_ext_params_dpf(struct rkisp1_params *params,
-		      const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_dpf(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_dpf_config *dpf = &block->dpf;
+	const struct rkisp1_ext_params_dpf_config *dpf =
+		(const struct rkisp1_ext_params_dpf_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (dpf->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
@@ -1889,20 +1876,22 @@ rkisp1_ext_params_dpf(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_DPF_MODE_EN);
 }
 
-static void
-rkisp1_ext_params_dpfs(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_dpfs(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_dpf_strength_config *dpfs = &block->dpfs;
+	const struct rkisp1_ext_params_dpf_strength_config *dpfs =
+		(const struct rkisp1_ext_params_dpf_strength_config *)block;
+	struct rkisp1_params *params = dev;
 
 	rkisp1_dpf_strength_config(params, &dpfs->config);
 }
 
-static void
-rkisp1_ext_params_cproc(struct rkisp1_params *params,
-			const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_cproc(void *dev,
+				    const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_cproc_config *cproc = &block->cproc;
+	const struct rkisp1_ext_params_cproc_config *cproc =
+		(const struct rkisp1_ext_params_cproc_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (cproc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
@@ -1918,11 +1907,12 @@ rkisp1_ext_params_cproc(struct rkisp1_params *params,
 				      RKISP1_CIF_C_PROC_CTR_ENABLE);
 }
 
-static void
-rkisp1_ext_params_ie(struct rkisp1_params *params,
-		     const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_ie(void *dev,
+				 const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_ie_config *ie = &block->ie;
+	const struct rkisp1_ext_params_ie_config *ie =
+		(const struct rkisp1_ext_params_ie_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (ie->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_ie_enable(params, false);
@@ -1936,11 +1926,12 @@ rkisp1_ext_params_ie(struct rkisp1_params *params,
 		rkisp1_ie_enable(params, true);
 }
 
-static void
-rkisp1_ext_params_awbm(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_awbm(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_awb_meas_config *awbm = &block->awbm;
+	const struct rkisp1_ext_params_awb_meas_config *awbm =
+		(const struct rkisp1_ext_params_awb_meas_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (awbm->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		params->ops->awb_meas_enable(params, &awbm->config,
@@ -1956,11 +1947,12 @@ rkisp1_ext_params_awbm(struct rkisp1_params *params,
 					     true);
 }
 
-static void
-rkisp1_ext_params_hstm(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_hstm(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_hst_config *hst = &block->hst;
+	const struct rkisp1_ext_params_hst_config *hst =
+		(const struct rkisp1_ext_params_hst_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (hst->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		params->ops->hst_enable(params, &hst->config, false);
@@ -1974,11 +1966,12 @@ rkisp1_ext_params_hstm(struct rkisp1_params *params,
 		params->ops->hst_enable(params, &hst->config, true);
 }
 
-static void
-rkisp1_ext_params_aecm(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_aecm(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_aec_config *aec = &block->aec;
+	const struct rkisp1_ext_params_aec_config *aec =
+		(const struct rkisp1_ext_params_aec_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (aec->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
@@ -1994,11 +1987,12 @@ rkisp1_ext_params_aecm(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_EXP_ENA);
 }
 
-static void
-rkisp1_ext_params_afcm(struct rkisp1_params *params,
-		       const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_afcm(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_afc_config *afc = &block->afc;
+	const struct rkisp1_ext_params_afc_config *afc =
+		(const struct rkisp1_ext_params_afc_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (afc->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
@@ -2014,11 +2008,12 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_AFM_ENA);
 }
 
-static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
-					  const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_compand_bls(void *dev,
+					  const struct v4l2_params_block_header *block)
 {
 	const struct rkisp1_ext_params_compand_bls_config *bls =
-		&block->compand_bls;
+		(const struct rkisp1_ext_params_compand_bls_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (bls->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
@@ -2034,11 +2029,13 @@ static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
 }
 
-static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
-					     const union rkisp1_ext_params_config *block)
+static void
+rkisp1_ext_params_compand_expand(void *dev,
+				 const struct v4l2_params_block_header *block)
 {
 	const struct rkisp1_ext_params_compand_curve_config *curve =
-		&block->compand_curve;
+		(const struct rkisp1_ext_params_compand_curve_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (curve->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
@@ -2054,11 +2051,13 @@ static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
 }
 
-static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
-					       const union rkisp1_ext_params_config *block)
+static void
+rkisp1_ext_params_compand_compress(void *dev,
+				   const struct v4l2_params_block_header *block)
 {
 	const struct rkisp1_ext_params_compand_curve_config *curve =
-		&block->compand_curve;
+		(const struct rkisp1_ext_params_compand_curve_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (curve->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
@@ -2074,10 +2073,12 @@ static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
 }
 
-static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
-				  const union rkisp1_ext_params_config *block)
+static void rkisp1_ext_params_wdr(void *dev,
+				  const struct v4l2_params_block_header *block)
 {
-	const struct rkisp1_ext_params_wdr_config *wdr = &block->wdr;
+	const struct rkisp1_ext_params_wdr_config *wdr =
+		(const struct rkisp1_ext_params_wdr_config *)block;
+	struct rkisp1_params *params = dev;
 
 	if (wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
@@ -2093,123 +2094,163 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
 }
 
-typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
-			     const union rkisp1_ext_params_config *config);
-
-static const struct rkisp1_ext_params_handler {
-	size_t size;
-	rkisp1_block_handler handler;
+static const struct rkisp1_params_block_feature {
 	unsigned int group;
 	unsigned int features;
-} rkisp1_ext_params_handlers[] = {
+} rkisp1_ext_params_features[] = {
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
-		.size		= sizeof(struct rkisp1_ext_params_bls_config),
-		.handler	= rkisp1_ext_params_bls,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features       = RKISP1_FEATURE_BLS,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+};
+
+static const struct v4l2_params_handler rkisp1_ext_params_handlers[] = {
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_bls_config),
+		.handler	= rkisp1_ext_params_bls,
+	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
 		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
 		.handler	= rkisp1_ext_params_dpcc,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
 		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
 		.handler	= rkisp1_ext_params_sdg,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
 		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
 		.handler	= rkisp1_ext_params_awbg,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
 		.size		= sizeof(struct rkisp1_ext_params_flt_config),
 		.handler	= rkisp1_ext_params_flt,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
 		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
 		.handler	= rkisp1_ext_params_bdm,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
 		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
 		.handler	= rkisp1_ext_params_ctk,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
 		.size		= sizeof(struct rkisp1_ext_params_goc_config),
 		.handler	= rkisp1_ext_params_goc,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
 		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
 		.handler	= rkisp1_ext_params_dpf,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
 		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
 		.handler	= rkisp1_ext_params_dpfs,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
 		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
 		.handler	= rkisp1_ext_params_cproc,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
 		.size		= sizeof(struct rkisp1_ext_params_ie_config),
 		.handler	= rkisp1_ext_params_ie,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
 		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
 		.handler	= rkisp1_ext_params_lsc,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
 		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
 		.handler	= rkisp1_ext_params_awbm,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
 		.size		= sizeof(struct rkisp1_ext_params_hst_config),
 		.handler	= rkisp1_ext_params_hstm,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
 		.size		= sizeof(struct rkisp1_ext_params_aec_config),
 		.handler	= rkisp1_ext_params_aecm,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
 		.size		= sizeof(struct rkisp1_ext_params_afc_config),
 		.handler	= rkisp1_ext_params_afcm,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
 		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
 		.handler	= rkisp1_ext_params_compand_bls,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
-		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
 		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
 		.handler	= rkisp1_ext_params_compand_expand,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
-		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
 		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
 		.handler	= rkisp1_ext_params_compand_compress,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
-		.features	= RKISP1_FEATURE_COMPAND,
 	},
 	[RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] = {
 		.size		= sizeof(struct rkisp1_ext_params_wdr_config),
 		.handler	= rkisp1_ext_params_wdr,
-		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
 };
 
@@ -2224,31 +2265,33 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 
 	/* Walk the list of parameter blocks and process them. */
 	while (block_offset < cfg->data_size) {
-		const struct rkisp1_ext_params_handler *block_handler;
-		const union rkisp1_ext_params_config *block;
+		const struct rkisp1_params_block_feature *block_features;
+		const struct v4l2_params_handler *block_handler;
+		const struct v4l2_params_block_header *block;
 
-		block = (const union rkisp1_ext_params_config *)
+		block = (const struct v4l2_params_block_header *)
 			&cfg->data[block_offset];
-		block_offset += block->header.size;
+		block_offset += block->size;
 
 		/*
 		 * Make sure the block is supported by the platform and in the
 		 * list of groups to configure.
 		 */
-		block_handler = &rkisp1_ext_params_handlers[block->header.type];
-		if (!(block_handler->group & block_group_mask))
+		block_features = &rkisp1_ext_params_features[block->type];
+		if (!(block_features->group & block_group_mask))
 			continue;
 
-		if ((params->rkisp1->info->features & block_handler->features) !=
-		    block_handler->features)
+		if ((params->rkisp1->info->features & block_features->features)
+		     != block_features->features)
 			continue;
 
+		block_handler = &rkisp1_ext_params_handlers[block->type];
 		block_handler->handler(params, block);
 
-		if (block->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
-			params->enabled_blocks &= ~BIT(block->header.type);
-		else if (block->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE)
-			params->enabled_blocks |= BIT(block->header.type);
+		if (block->flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
+			params->enabled_blocks &= ~BIT(block->type);
+		else if (block->flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE)
+			params->enabled_blocks |= BIT(block->type);
 	}
 }
 
@@ -2646,31 +2689,24 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
-	size_t header_size = offsetof(struct rkisp1_ext_params_cfg, data);
 	struct rkisp1_ext_params_cfg *cfg = params_buf->cfg;
 	size_t payload_size = vb2_get_plane_payload(vb, 0);
 	struct rkisp1_ext_params_cfg *usr_cfg =
 		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-	size_t block_offset = 0;
-	size_t cfg_size;
+	int ret;
 
-	/*
-	 * Validate the buffer payload size before copying the parameters. The
-	 * payload has to be smaller than the destination buffer size and larger
-	 * than the header size.
-	 */
-	if (payload_size > params->metafmt->buffersize) {
+	/* Only v1 is supported at the moment. */
+	if (usr_cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
 		dev_dbg(params->rkisp1->dev,
-			"Too large buffer payload size %zu\n", payload_size);
+			"Unsupported extensible parameters version: %u\n",
+			usr_cfg->version);
 		return -EINVAL;
 	}
 
-	if (payload_size < header_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Buffer payload %zu smaller than header size %zu\n",
-			payload_size, header_size);
-		return -EINVAL;
-	}
+	ret = v4l2_params_buffer_validate(params->rkisp1->dev, vb,
+					  params->metafmt->buffersize);
+	if (ret)
+		return ret;
 
 	/*
 	 * Copy the parameters buffer to the internal scratch buffer to avoid
@@ -2678,71 +2714,10 @@ static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
 	 */
 	memcpy(cfg, usr_cfg, payload_size);
 
-	/* Only v1 is supported at the moment. */
-	if (cfg->version != RKISP1_EXT_PARAM_BUFFER_V1) {
-		dev_dbg(params->rkisp1->dev,
-			"Unsupported extensible format version: %u\n",
-			cfg->version);
-		return -EINVAL;
-	}
-
-	/* Validate the size reported in the parameters buffer header. */
-	cfg_size = header_size + cfg->data_size;
-	if (cfg_size != payload_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Data size %zu different than buffer payload size %zu\n",
-			cfg_size, payload_size);
-		return -EINVAL;
-	}
-
-	/* Walk the list of parameter blocks and validate them. */
-	cfg_size = cfg->data_size;
-	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
-		const struct rkisp1_ext_params_block_header *block;
-		const struct rkisp1_ext_params_handler *handler;
-
-		block = (const struct rkisp1_ext_params_block_header *)
-			&cfg->data[block_offset];
-
-		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block type\n");
-			return -EINVAL;
-		}
-
-		if (block->size > cfg_size) {
-			dev_dbg(params->rkisp1->dev,
-				"Premature end of parameters data\n");
-			return -EINVAL;
-		}
-
-		if ((block->flags & (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
-				     RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) ==
-		   (RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE |
-		    RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block flags\n");
-			return -EINVAL;
-		}
-
-		handler = &rkisp1_ext_params_handlers[block->type];
-		if (block->size != handler->size) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block size\n");
-			return -EINVAL;
-		}
-
-		block_offset += block->size;
-		cfg_size -= block->size;
-	}
-
-	if (cfg_size) {
-		dev_dbg(params->rkisp1->dev,
-			"Unexpected data after the parameters buffer end\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	return v4l2_params_blocks_validate(params->rkisp1->dev,
+					   (struct v4l2_params_buffer *)cfg,
+					   rkisp1_ext_params_handlers,
+					   ARRAY_SIZE(rkisp1_ext_params_handlers));
 }
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
@@ -2842,13 +2817,13 @@ static int rkisp1_params_ctrl_init(struct rkisp1_params *params)
 	v4l2_ctrl_handler_init(&params->ctrls, 1);
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
-		const struct rkisp1_ext_params_handler *block_handler;
+		const struct rkisp1_params_block_feature *block_features;
 
-		block_handler = &rkisp1_ext_params_handlers[i];
+		block_features = &rkisp1_ext_params_features[i];
 		ctrl_config.max |= BIT(i);
 
-		if ((params->rkisp1->info->features & block_handler->features) !=
-		    block_handler->features)
+		if ((params->rkisp1->info->features & block_features->features)
+		    != block_features->features)
 			continue;
 
 		ctrl_config.def |= BIT(i);

-- 
2.51.0


