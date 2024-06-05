Return-Path: <linux-media+bounces-12595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E83368FD338
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0FE1F24918
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6828F18FC95;
	Wed,  5 Jun 2024 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ebZRhNws"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D53188CDE
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606517; cv=none; b=LPNG6gpa7jQ5KsgZJ2gG/KQzWmdXg2QjiWcXiSMPwlvxHrNVfBguYkZsKnCNk4qDlCIaYsN8TQXDOcn4ywci1jzAZvM0TUq0c5xUW7cB/q78ixfn6QX5vwEPIGSKz3o8Rnz3ceYqY4omh3BvfYr00GOBH9+k/HbxubKLRaQTVSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606517; c=relaxed/simple;
	bh=B+gf+ElSQkOiE14sk8bX0B0hGLpIcwUM9s1INqUD/x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfU81/fcB2AaREI8/b3nG9XnEu2Cj//VaJR+zGzT5wDgAXxyie0mKeWZYpXpthaaD8yo7Hz5xE3B7o2uoNs0oOLaD2dUVHCDY1stlTk596hLQi5ozwnXR4zLcuZYaU/oltNiUHEBvIfqs/PB4XqVXYnzGgwvmWLnD9fzmv6zwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ebZRhNws; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 224E37036;
	Wed,  5 Jun 2024 18:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606492;
	bh=B+gf+ElSQkOiE14sk8bX0B0hGLpIcwUM9s1INqUD/x0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebZRhNwsm7ScJx603OXQqFIV331ckA8PCGih54ZwzdZWev+EWkLw0BmE7Qd/PYfOd
	 rknvjJQn3FnJQouHjo0pTb6kdX7pzQZJqt2j0rLmm2TfrCupLNSG/6nsBfgWkUWlE7
	 RHpc4aY+WYyLKydA/0yMqLPc6bqzCY2iqnz2GxFE=
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
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 5/8] media: rkisp1: Implement extensible params support
Date: Wed,  5 Jun 2024 18:54:24 +0200
Message-ID: <20240605165434.432230-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support in the rkisp1-params for the extensible configuration
parameters format.

Create a list of handlers for each ISP block that wraps the existing
configuration functions and handles the ISP block enablement state.

Parse the configuration parameters buffer in __rkisp1_ext_params_config
and filter the enable blocks by group, to allow setting the 'other' and
'meas' groups separately from the 'lsc' group to support the
pre/post-configure operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 565 +++++++++++++++++-
 1 file changed, 544 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 6f99c7dad758..3d78e643d0b8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -33,6 +33,10 @@
 #define RKISP1_ISP_CC_COEFF(n) \
 			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
 
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS	BIT(1)
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(2)
+
 enum rkisp1_params_formats {
 	RKISP1_PARAMS_FIXED,
 	RKISP1_PARAMS_EXTENSIBLE,
@@ -1529,9 +1533,491 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	}
 }
 
+/*------------------------------------------------------------------------------
+ * Extensible parameters format handling
+ */
+
+static void rkisp1_ext_params_bls(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_bls_config *bls =
+		(struct rkisp1_ext_params_bls_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
+					RKISP1_CIF_ISP_BLS_ENA);
+		return;
+	}
+
+	rkisp1_bls_config(params, &bls->bls_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
+				      RKISP1_CIF_ISP_BLS_ENA);
+}
+
+static void rkisp1_ext_params_dpcc(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_dpcc_config *dpcc =
+		(struct rkisp1_ext_params_dpcc_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
+					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
+		return;
+	}
+
+	rkisp1_dpcc_config(params, &dpcc->dpcc_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
+				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
+}
+
+static void rkisp1_ext_params_sdg(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_sdg_config *sdg =
+		(struct rkisp1_ext_params_sdg_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+		return;
+	}
+
+	rkisp1_sdg_config(params, &sdg->sdg_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+}
+
+static void rkisp1_ext_params_lsc(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_lsc_config *lsc =
+		(struct rkisp1_ext_params_lsc_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+					RKISP1_CIF_ISP_LSC_CTRL_ENA);
+		return;
+	}
+
+	rkisp1_lsc_config(params, &lsc->lsc_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
+}
+
+static void rkisp1_ext_params_awbg(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_awb_gain_config *awbg =
+		(struct rkisp1_ext_params_awb_gain_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+		return;
+	}
+
+	params->ops->awb_gain_config(params, &awbg->awb_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+}
+
+static void rkisp1_ext_params_flt(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_flt_config *flt =
+		(struct rkisp1_ext_params_flt_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
+					RKISP1_CIF_ISP_FLT_ENA);
+		return;
+	}
+
+	rkisp1_flt_config(params, &flt->flt_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_FILT_MODE,
+				      RKISP1_CIF_ISP_FLT_ENA);
+}
+
+static void rkisp1_ext_params_bdm(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_bdm_config *bdm =
+		(struct rkisp1_ext_params_bdm_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		return;
+	}
+
+	rkisp1_bdm_config(params, &bdm->bdm_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+}
+
+static void rkisp1_ext_params_ctk(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_ctk_config *ctk =
+		(struct rkisp1_ext_params_ctk_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ctk_enable(params, false);
+		return;
+	}
+
+	rkisp1_ctk_config(params, &ctk->ctk_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_ctk_enable(params, true);
+}
+
+static void rkisp1_ext_params_goc(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_goc_config *goc =
+		(struct rkisp1_ext_params_goc_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+		return;
+	}
+
+	params->ops->goc_config(params, &goc->goc_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+}
+
+static void rkisp1_ext_params_dpf(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_dpf_config *dpf =
+		(struct rkisp1_ext_params_dpf_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+					RKISP1_CIF_ISP_DPF_MODE_EN);
+		return;
+	}
+
+	rkisp1_dpf_config(params, &dpf->dpf_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+				      RKISP1_CIF_ISP_DPF_MODE_EN);
+}
+
+static void rkisp1_ext_params_dpfs(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_dpf_strength_config *dpfs =
+		(struct rkisp1_ext_params_dpf_strength_config *)hdr;
+
+	rkisp1_dpf_strength_config(params, &dpfs->dpf_strength_config);
+}
+
+static void rkisp1_ext_params_cproc(struct rkisp1_params *params,
+				    struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_cproc_config *cproc =
+		(struct rkisp1_ext_params_cproc_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
+					RKISP1_CIF_C_PROC_CTR_ENABLE);
+		return;
+	}
+
+	rkisp1_cproc_config(params, &cproc->cproc_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
+				      RKISP1_CIF_C_PROC_CTR_ENABLE);
+}
+
+static void rkisp1_ext_params_ie(struct rkisp1_params *params,
+				 struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_ie_config *ie =
+		(struct rkisp1_ext_params_ie_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ie_enable(params, false);
+		return;
+	}
+
+	rkisp1_ie_config(params, &ie->ie_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_ie_enable(params, true);
+}
+
+static void rkisp1_ext_params_awbm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_awb_meas_config *awbm =
+		(struct rkisp1_ext_params_awb_meas_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
+					     false);
+		return;
+	}
+
+	params->ops->awb_meas_config(params, &awbm->awb_meas_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
+					     true);
+}
+
+static void rkisp1_ext_params_hstm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_hst_config *hst =
+		(struct rkisp1_ext_params_hst_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->hst_enable(params, &hst->hst_config, false);
+		return;
+	}
+
+	params->ops->hst_config(params, &hst->hst_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		params->ops->hst_enable(params, &hst->hst_config, true);
+}
+
+static void rkisp1_ext_params_aecm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_aec_config *aec =
+		(struct rkisp1_ext_params_aec_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
+					RKISP1_CIF_ISP_EXP_ENA);
+		return;
+	}
+
+	params->ops->aec_config(params, &aec->aec_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
+				      RKISP1_CIF_ISP_EXP_ENA);
+}
+
+static void rkisp1_ext_params_afcm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_afc_config *afc =
+		(struct rkisp1_ext_params_afc_config *)hdr;
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
+					RKISP1_CIF_ISP_AFM_ENA);
+		return;
+	}
+
+	params->ops->afm_config(params, &afc->afc_config);
+
+	if (hdr->state == RKISP1_EXT_PARAMS_BLOCK_ENABLE)
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
+				      RKISP1_CIF_ISP_AFM_ENA);
+}
+
+typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
+				     struct rkisp1_ext_params_block_header *hdr);
+
+static const struct rkisp1_ext_params_handler {
+	size_t size;
+	rkisp1_block_handler handler;
+	unsigned int group;
+} rkisp1_ext_params_handlers[] = {
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_bls_config),
+		.handler	= rkisp1_ext_params_bls,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
+		.handler	= rkisp1_ext_params_dpcc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
+		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
+		.handler	= rkisp1_ext_params_sdg,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS] = {
+		.size		=
+			sizeof(struct rkisp1_ext_params_awb_gain_config),
+		.handler	= rkisp1_ext_params_awbg,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
+		.size		= sizeof(struct rkisp1_ext_params_flt_config),
+		.handler	= rkisp1_ext_params_flt,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
+		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
+		.handler	= rkisp1_ext_params_bdm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
+		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
+		.handler	= rkisp1_ext_params_ctk,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
+		.size		= sizeof(struct rkisp1_ext_params_goc_config),
+		.handler	= rkisp1_ext_params_goc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
+		.handler	= rkisp1_ext_params_dpf,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT] = {
+		.size		=
+			sizeof(struct rkisp1_ext_params_dpf_strength_config),
+		.handler	= rkisp1_ext_params_dpfs,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
+		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
+		.handler	= rkisp1_ext_params_cproc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
+		.size		= sizeof(struct rkisp1_ext_params_ie_config),
+		.handler	= rkisp1_ext_params_ie,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
+		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
+		.handler	= rkisp1_ext_params_lsc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
+		.size		=
+			sizeof(struct rkisp1_ext_params_awb_meas_config),
+		.handler	= rkisp1_ext_params_awbm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_hst_config),
+		.handler	= rkisp1_ext_params_hstm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_aec_config),
+		.handler	= rkisp1_ext_params_aecm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_afc_config),
+		.handler	= rkisp1_ext_params_afcm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS
+	},
+};
+
+static int __rkisp1_ext_params_config(struct rkisp1_params *params,
+				      struct rkisp1_ext_params_cfg *cfg,
+				      u32 block_group_mask)
+{
+	size_t block_offset = 0;
+
+	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
+		dev_dbg(params->rkisp1->dev,
+			"Invalid parameters buffer size %llu\n",
+			cfg->total_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of parameter blocks and process them. */
+	while (block_offset < cfg->total_size) {
+		const struct rkisp1_ext_params_handler *block_handler;
+		struct rkisp1_ext_params_block_header *block;
+
+		block = (struct rkisp1_ext_params_block_header *)
+			&cfg->data[block_offset];
+		block_offset += block->size;
+
+		/*
+		 * Validate the block id and make sure the block group is in
+		 * the list of groups to configure.
+		 */
+		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block type\n");
+			return -EINVAL;
+		}
+
+		block_handler = &rkisp1_ext_params_handlers[block->type];
+		if (!(block_handler->group & block_group_mask))
+			continue;
+
+		if (block->size != block_handler->size) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block size\n");
+			return -EINVAL;
+		}
+
+		block_handler->handler(params, block);
+	}
+
+	return 0;
+}
+
+static int rkisp1_ext_params_config(struct rkisp1_params *params,
+				    struct rkisp1_ext_params_cfg *cfg)
+{
+	return __rkisp1_ext_params_config(params, cfg,
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
+}
+
+static int
+rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
+				    struct rkisp1_ext_params_cfg *cfg)
+{
+	return __rkisp1_ext_params_config(params, cfg,
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
+}
+
+static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
+					struct rkisp1_ext_params_cfg *cfg)
+{
+	return __rkisp1_ext_params_config(params, cfg,
+					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+}
+
 static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
 				     struct rkisp1_buffer **buf,
-				     struct rkisp1_params_cfg **cfg)
+				     void **cfg)
 {
 	if (list_empty(&params->params))
 		return false;
@@ -1544,28 +2030,37 @@ static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
 
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_buffer *buf,
-					  unsigned int frame_sequence)
+					  unsigned int frame_sequence,
+					  enum vb2_buffer_state state)
 {
 	list_del(&buf->queue);
 
 	buf->vb.sequence = frame_sequence;
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	vb2_buffer_done(&buf->vb.vb2_buf, state);
 }
 
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
-	struct rkisp1_params_cfg *new_params;
-	struct rkisp1_buffer *cur_buf;
+	struct rkisp1_buffer *buf;
+	int ret = 0;
+	void *cfg;
 
 	spin_lock(&params->config_lock);
 
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, new_params);
-	rkisp1_isp_isr_lsc_config(params, new_params);
-	rkisp1_isp_isr_meas_config(params, new_params);
+	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, cfg);
+		rkisp1_isp_isr_lsc_config(params, cfg);
+		rkisp1_isp_isr_meas_config(params, cfg);
+	} else {
+		ret = rkisp1_ext_params_config(params, cfg);
+	}
+
+	if (ret)
+		goto complete_and_unlock;
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1579,8 +2074,11 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	 * indicate to userspace on which frame these parameters are being
 	 * applied.
 	 */
-	rkisp1_params_complete_buffer(params, cur_buf,
-				      rkisp1->isp.frame_sequence + 1);
+complete_and_unlock:
+	rkisp1_params_complete_buffer(params, buf,
+				      rkisp1->isp.frame_sequence + 1,
+				      ret ? VB2_BUF_STATE_ERROR
+					  : VB2_BUF_STATE_DONE);
 
 unlock:
 	spin_unlock(&params->config_lock);
@@ -1631,8 +2129,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 				 enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
-	struct rkisp1_params_cfg *new_params;
-	struct rkisp1_buffer *cur_buf;
+	struct rkisp1_buffer *buf;
+	int ret = 0;
+	void *cfg;
 
 	params->quantization = quantization;
 	params->ycbcr_encoding = ycbcr_encoding;
@@ -1661,11 +2160,26 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 	/* apply the first buffer if there is one already */
 
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, new_params);
-	rkisp1_isp_isr_meas_config(params, new_params);
+	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, cfg);
+		rkisp1_isp_isr_meas_config(params, cfg);
+	} else {
+		ret = rkisp1_ext_params_other_meas_config(params, cfg);
+	}
+
+	if (ret) {
+		/*
+		 * Complete the buffer in error state immediately. In case of no
+		 * error, the buffer will be completed in
+		 * rkisp1_params_post_configure().
+		 */
+		rkisp1_params_complete_buffer(params, buf, 0,
+					      VB2_BUF_STATE_ERROR);
+		goto unlock;
+	}
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1677,8 +2191,9 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 void rkisp1_params_post_configure(struct rkisp1_params *params)
 {
-	struct rkisp1_params_cfg *new_params;
-	struct rkisp1_buffer *cur_buf;
+	struct rkisp1_buffer *buf;
+	int ret = 0;
+	void *cfg;
 
 	spin_lock_irq(&params->config_lock);
 
@@ -1691,16 +2206,24 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 	 * unconditionally.
 	 */
 
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	if (!rkisp1_params_get_buffer(params, &buf, &cfg))
 		goto unlock;
 
-	rkisp1_isp_isr_lsc_config(params, new_params);
+	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
+		rkisp1_isp_isr_lsc_config(params, cfg);
+	else
+		ret = rkisp1_ext_params_lsc_config(params, cfg);
+
+	if (ret)
+		goto complete_and_unlock;
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
 			      RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD);
 
-	rkisp1_params_complete_buffer(params, cur_buf, 0);
+complete_and_unlock:
+	rkisp1_params_complete_buffer(params, buf, 0, ret ? VB2_BUF_STATE_ERROR
+							  : VB2_BUF_STATE_DONE);
 
 unlock:
 	spin_unlock_irq(&params->config_lock);
-- 
2.45.1


