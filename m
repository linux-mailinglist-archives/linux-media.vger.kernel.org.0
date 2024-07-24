Return-Path: <linux-media+bounces-15310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585E93AE15
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 10:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A021C226A6
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 08:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA3E14EC6E;
	Wed, 24 Jul 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TQbuN4nB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E914B977
	for <linux-media@vger.kernel.org>; Wed, 24 Jul 2024 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721811045; cv=none; b=LwSvtJ48Boamivp/XxrCw++sdDTlwytsv4Hd1Exau7UmNCX9/tWV6sfBmJMYQosXKPDgQQy6JJZ3HzMxxHaKk8VVGMcGHgnyPpmDQk5pxyb+Cq59tJ3edMnfRRqMR6iQpjJ4VLTN2eMNntFZQd3sxgezvnx9UWaaTkg4ITePyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721811045; c=relaxed/simple;
	bh=kwnFYt1iQ7yAapGPyYuo+5rif/hHVCClafJWMaLo9ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3Z/Ede/4SFtN732LVySCE1hcDK1xNWcVNpz9Ko3pYkgv5189kZB0nQaQKOsQq9hoUFxxIe7ii88JxDpGrp2xrY+WEn/Ww/EVfvnNhkBe1BsRqiq4l6m6K/kwQ21sgPdWNba3qGSRZwTx0SiKjwmCEzLOQMwuTmoP//9egjNYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TQbuN4nB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:24bf:30c5:c4f3:c9fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24A291E7A;
	Wed, 24 Jul 2024 10:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721810991;
	bh=kwnFYt1iQ7yAapGPyYuo+5rif/hHVCClafJWMaLo9ho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQbuN4nBQcg0YEgOIfQdBbQK4TEIM45DxO4A4YqlOunIDSAxqvUgGhuEEmhPd/T62
	 AwtrGz+k4G6djXV8PHlNnBlXVnHRtTiPKeve9A9Hf+1ay/105V2zSHBqm9VpoGSKtP
	 14u9hbG5AlUe7S1q8S2Dx1vYGHxCRJIgFhywC06Q=
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
Subject: [PATCH v7 06/12] media: rkisp1: Implement extensible params support
Date: Wed, 24 Jul 2024 10:49:57 +0200
Message-ID: <20240724085004.82694-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support in rkisp1-params for the extensible configuration
parameters format.

Create a list of handlers for each ISP block that wraps the existing
configuration functions and handles the ISP block enablement.

Parse the configuration parameters buffer in rkisp1_ext_params_config
and filter the enable blocks by group, to allow setting the 'other'
groups separately from the 'lsc' group to support the pre/post-configure
operations.

Implement parameter buffer validation for the extensible format at
.buf_prepare() time.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   3 +
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 605 +++++++++++++++++-
 2 files changed, 597 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 43cc727a628d..2f4bf7e97927 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -396,6 +396,7 @@ struct rkisp1_params_ops {
  * @quantization:	the quantization configured on the isp's src pad
  * @ycbcr_encoding	the YCbCr encoding
  * @raw_type:		the bayer pattern on the isp video sink pad
+ * @enabled_blocks:	bitmask of enabled ISP blocks
  */
 struct rkisp1_params {
 	struct rkisp1_vdev_node vnode;
@@ -410,6 +411,8 @@ struct rkisp1_params {
 	enum v4l2_quantization quantization;
 	enum v4l2_ycbcr_encoding ycbcr_encoding;
 	enum rkisp1_fmt_raw_pat_type raw_type;
+
+	u32 enabled_blocks;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 45c4b1bcee63..1c84b82f26b1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -35,6 +35,30 @@
 #define RKISP1_ISP_CC_COEFF(n) \
 			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
 
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(1)
+
+union rkisp1_ext_params_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_ext_params_bls_config bls;
+	struct rkisp1_ext_params_dpcc_config dpcc;
+	struct rkisp1_ext_params_sdg_config sdg;
+	struct rkisp1_ext_params_lsc_config lsc;
+	struct rkisp1_ext_params_awb_gain_config awbg;
+	struct rkisp1_ext_params_flt_config flt;
+	struct rkisp1_ext_params_bdm_config bdm;
+	struct rkisp1_ext_params_ctk_config ctk;
+	struct rkisp1_ext_params_goc_config goc;
+	struct rkisp1_ext_params_dpf_config dpf;
+	struct rkisp1_ext_params_dpf_strength_config dpfs;
+	struct rkisp1_ext_params_cproc_config cproc;
+	struct rkisp1_ext_params_ie_config ie;
+	struct rkisp1_ext_params_awb_meas_config awbm;
+	struct rkisp1_ext_params_hst_config hst;
+	struct rkisp1_ext_params_aec_config aec;
+	struct rkisp1_ext_params_afc_config afc;
+};
+
 enum rkisp1_params_formats {
 	RKISP1_PARAMS_FIXED,
 	RKISP1_PARAMS_EXTENSIBLE,
@@ -1519,6 +1543,454 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	}
 }
 
+/*------------------------------------------------------------------------------
+ * Extensible parameters format handling
+ */
+
+static void
+rkisp1_ext_params_bls(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_bls_config *bls = &block->bls;
+
+	if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
+					RKISP1_CIF_ISP_BLS_ENA);
+		return;
+	}
+
+	rkisp1_bls_config(params, &bls->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
+				      RKISP1_CIF_ISP_BLS_ENA);
+}
+
+static void
+rkisp1_ext_params_dpcc(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_dpcc_config *dpcc = &block->dpcc;
+
+	if (dpcc->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
+					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
+		return;
+	}
+
+	rkisp1_dpcc_config(params, &dpcc->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
+				      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
+}
+
+static void
+rkisp1_ext_params_sdg(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_sdg_config *sdg = &block->sdg;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+		return;
+	}
+
+	rkisp1_sdg_config(params, &sdg->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+				      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+}
+
+static void
+rkisp1_ext_params_lsc(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_lsc_config *lsc = &block->lsc;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+					RKISP1_CIF_ISP_LSC_CTRL_ENA);
+		return;
+	}
+
+	rkisp1_lsc_config(params, &lsc->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+				      RKISP1_CIF_ISP_LSC_CTRL_ENA);
+}
+
+static void
+rkisp1_ext_params_awbg(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_awb_gain_config *awbg = &block->awbg;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+		return;
+	}
+
+	params->ops->awb_gain_config(params, &awbg->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+}
+
+static void
+rkisp1_ext_params_flt(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_flt_config *flt = &block->flt;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
+					RKISP1_CIF_ISP_FLT_ENA);
+		return;
+	}
+
+	rkisp1_flt_config(params, &flt->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_FILT_MODE,
+				      RKISP1_CIF_ISP_FLT_ENA);
+}
+
+static void
+rkisp1_ext_params_bdm(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_bdm_config *bdm = &block->bdm;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		return;
+	}
+
+	rkisp1_bdm_config(params, &bdm->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+				      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+}
+
+static void
+rkisp1_ext_params_ctk(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_ctk_config *ctk = &block->ctk;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ctk_enable(params, false);
+		return;
+	}
+
+	rkisp1_ctk_config(params, &ctk->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK)))
+		rkisp1_ctk_enable(params, true);
+}
+
+static void
+rkisp1_ext_params_goc(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_goc_config *goc = &block->goc;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+		return;
+	}
+
+	params->ops->goc_config(params, &goc->config);
+
+	/*
+	 * Unconditionally re-enable the GOC module which gets disabled by
+	 * goc_config().
+	 */
+	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+			      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+}
+
+static void
+rkisp1_ext_params_dpf(struct rkisp1_params *params,
+		      const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_dpf_config *dpf = &block->dpf;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+					RKISP1_CIF_ISP_DPF_MODE_EN);
+		return;
+	}
+
+	rkisp1_dpf_config(params, &dpf->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+				      RKISP1_CIF_ISP_DPF_MODE_EN);
+}
+
+static void
+rkisp1_ext_params_dpfs(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_dpf_strength_config *dpfs = &block->dpfs;
+
+	rkisp1_dpf_strength_config(params, &dpfs->config);
+}
+
+static void
+rkisp1_ext_params_cproc(struct rkisp1_params *params,
+			const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_cproc_config *cproc = &block->cproc;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
+					RKISP1_CIF_C_PROC_CTR_ENABLE);
+		return;
+	}
+
+	rkisp1_cproc_config(params, &cproc->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
+				      RKISP1_CIF_C_PROC_CTR_ENABLE);
+}
+
+static void
+rkisp1_ext_params_ie(struct rkisp1_params *params,
+		     const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_ie_config *ie = &block->ie;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ie_enable(params, false);
+		return;
+	}
+
+	rkisp1_ie_config(params, &ie->config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_IE)))
+		rkisp1_ie_enable(params, true);
+}
+
+static void
+rkisp1_ext_params_awbm(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_awb_meas_config *awbm = &block->awbm;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->awb_meas_enable(params, &awbm->config,
+					     false);
+		return;
+	}
+
+	params->ops->awb_meas_config(params, &awbm->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS)))
+		params->ops->awb_meas_enable(params, &awbm->config,
+					     true);
+}
+
+static void
+rkisp1_ext_params_hstm(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_hst_config *hst = &block->hst;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->hst_enable(params, &hst->config, false);
+		return;
+	}
+
+	params->ops->hst_config(params, &hst->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS)))
+		params->ops->hst_enable(params, &hst->config, true);
+}
+
+static void
+rkisp1_ext_params_aecm(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_aec_config *aec = &block->aec;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
+					RKISP1_CIF_ISP_EXP_ENA);
+		return;
+	}
+
+	params->ops->aec_config(params, &aec->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
+				      RKISP1_CIF_ISP_EXP_ENA);
+}
+
+static void
+rkisp1_ext_params_afcm(struct rkisp1_params *params,
+		       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_afc_config *afc = &block->afc;
+
+	if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
+					RKISP1_CIF_ISP_AFM_ENA);
+		return;
+	}
+
+	params->ops->afm_config(params, &afc->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
+				      RKISP1_CIF_ISP_AFM_ENA);
+}
+
+typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
+			     const union rkisp1_ext_params_config *config);
+
+static const struct rkisp1_ext_params_handler {
+	size_t size;
+	rkisp1_block_handler handler;
+	unsigned int group;
+} rkisp1_ext_params_handlers[] = {
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_bls_config),
+		.handler	= rkisp1_ext_params_bls,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpcc_config),
+		.handler	= rkisp1_ext_params_dpcc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG] = {
+		.size		= sizeof(struct rkisp1_ext_params_sdg_config),
+		.handler	= rkisp1_ext_params_sdg,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb_gain_config),
+		.handler	= rkisp1_ext_params_awbg,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT] = {
+		.size		= sizeof(struct rkisp1_ext_params_flt_config),
+		.handler	= rkisp1_ext_params_flt,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM] = {
+		.size		= sizeof(struct rkisp1_ext_params_bdm_config),
+		.handler	= rkisp1_ext_params_bdm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK] = {
+		.size		= sizeof(struct rkisp1_ext_params_ctk_config),
+		.handler	= rkisp1_ext_params_ctk,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC] = {
+		.size		= sizeof(struct rkisp1_ext_params_goc_config),
+		.handler	= rkisp1_ext_params_goc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpf_config),
+		.handler	= rkisp1_ext_params_dpf,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
+		.size		= sizeof(struct rkisp1_ext_params_dpf_strength_config),
+		.handler	= rkisp1_ext_params_dpfs,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC] = {
+		.size		= sizeof(struct rkisp1_ext_params_cproc_config),
+		.handler	= rkisp1_ext_params_cproc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_IE] = {
+		.size		= sizeof(struct rkisp1_ext_params_ie_config),
+		.handler	= rkisp1_ext_params_ie,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC] = {
+		.size		= sizeof(struct rkisp1_ext_params_lsc_config),
+		.handler	= rkisp1_ext_params_lsc,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb_meas_config),
+		.handler	= rkisp1_ext_params_awbm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_hst_config),
+		.handler	= rkisp1_ext_params_hstm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_aec_config),
+		.handler	= rkisp1_ext_params_aecm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_afc_config),
+		.handler	= rkisp1_ext_params_afcm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+	},
+};
+
+static void rkisp1_ext_params_config(struct rkisp1_params *params,
+				     struct rkisp1_ext_params_cfg *cfg,
+				     u32 block_group_mask)
+{
+	size_t block_offset = 0;
+
+	if (WARN_ON(!cfg))
+		return;
+
+	/* Walk the list of parameter blocks and process them. */
+	while (block_offset < cfg->data_size) {
+		const struct rkisp1_ext_params_handler *block_handler;
+		const union rkisp1_ext_params_config *block;
+
+		block = (const union rkisp1_ext_params_config *)
+			&cfg->data[block_offset];
+		block_offset += block->header.size;
+
+		/* Make sure the block is in the list of groups to configure. */
+		block_handler = &rkisp1_ext_params_handlers[block->header.type];
+		if (!(block_handler->group & block_group_mask))
+			continue;
+
+		block_handler->handler(params, block);
+
+		if (block->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
+			params->enabled_blocks &= ~BIT(block->header.type);
+		else
+			params->enabled_blocks |= BIT(block->header.type);
+	}
+}
+
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence)
@@ -1541,9 +2013,15 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
-	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
-	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+	} else {
+		rkisp1_ext_params_config(params, cur_buf->cfg,
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+	}
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1643,8 +2121,13 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
-	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, cur_buf->cfg);
+		rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
+	} else {
+		rkisp1_ext_params_config(params, cur_buf->cfg,
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS);
+	}
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1673,7 +2156,11 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
+		rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
+	else
+		rkisp1_ext_params_config(params, cur_buf->cfg,
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1862,21 +2349,116 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 	spin_unlock_irq(&params->config_lock);
 }
 
+static int rkisp1_params_prepare_ext_params(struct rkisp1_params *params,
+					    struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
+	size_t header_size = offsetof(struct rkisp1_ext_params_cfg, data);
+	struct rkisp1_ext_params_cfg *cfg = params_buf->cfg;
+	size_t payload_size = vb2_get_plane_payload(vb, 0);
+	struct rkisp1_ext_params_cfg *usr_cfg =
+		vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+	size_t block_offset = 0;
+	size_t cfg_size;
+
+	/*
+	 * Validate the buffer payload size before copying the parameters. The
+	 * payload has to be smaller than the destination buffer size and larger
+	 * than the header size.
+	 */
+	if (payload_size > params->metafmt->buffersize) {
+		dev_dbg(params->rkisp1->dev,
+			"Too large buffer payload size %lu\n", payload_size);
+		return -EINVAL;
+	}
+
+	if (payload_size < header_size) {
+		dev_dbg(params->rkisp1->dev,
+			"Buffer payload %lu smaller than header size %lu\n",
+			payload_size, header_size);
+		return -EINVAL;
+	}
+
+	/*
+	 * Copy the parameters buffer to the internal scratch buffer to avoid
+	 * userspace modifying the buffer content while the driver processes it.
+	 */
+	memcpy(cfg, usr_cfg, payload_size);
+
+	/* Validate the size reported in the parameters buffer header. */
+	cfg_size = header_size + cfg->data_size;
+	if (cfg_size != payload_size) {
+		dev_dbg(params->rkisp1->dev,
+			"Data size %lu different than buffer payload size %lu\n",
+			cfg_size, payload_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of parameter blocks and validate them. */
+	cfg_size = cfg->data_size;
+	while (cfg_size >= sizeof(struct rkisp1_ext_params_block_header)) {
+		const struct rkisp1_ext_params_block_header *block;
+		const struct rkisp1_ext_params_handler *handler;
+
+		block = (const struct rkisp1_ext_params_block_header *)
+			&cfg->data[block_offset];
+
+		if (block->type >= ARRAY_SIZE(rkisp1_ext_params_handlers)) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block type\n");
+			return -EINVAL;
+		}
+
+		if (block->size > cfg_size) {
+			dev_dbg(params->rkisp1->dev,
+				"Premature end of parameters data\n");
+			return -EINVAL;
+		}
+
+		handler = &rkisp1_ext_params_handlers[block->type];
+		if (block->size != handler->size) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block size\n");
+			return -EINVAL;
+		}
+
+		block_offset += block->size;
+		cfg_size -= block->size;
+	}
+
+	if (cfg_size) {
+		dev_dbg(params->rkisp1->dev,
+			"Unexpected data after the parameters buffer end\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 {
+	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
-	struct rkisp1_params_cfg *cfg =
-		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
+	struct rkisp1_params_cfg *cfg = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+	size_t payload = vb2_get_plane_payload(vb, 0);
 
-	if (vb2_get_plane_payload(vb, 0) != sizeof(*cfg))
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_EXT_PARAMS)
+		return rkisp1_params_prepare_ext_params(params, vb);
+
+	/*
+	 * For the fixed parameters format the payload size must be exactly the
+	 * size of the parameters structure.
+	 */
+	if (payload != sizeof(*cfg))
 		return -EINVAL;
 
 	/*
 	 * Copy the parameters buffer to the internal scratch buffer to avoid
 	 * userspace modifying the buffer content while the driver processes it.
 	 */
-	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
+	memcpy(params_buf->cfg, cfg, payload);
 
 	return 0;
 }
@@ -1898,6 +2480,8 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+
+	params->enabled_blocks = 0;
 }
 
 static const struct vb2_ops rkisp1_params_vb2_ops = {
@@ -1909,7 +2493,6 @@ static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.buf_queue = rkisp1_params_vb2_buf_queue,
 	.buf_prepare = rkisp1_params_vb2_buf_prepare,
 	.stop_streaming = rkisp1_params_vb2_stop_streaming,
-
 };
 
 static const struct v4l2_file_operations rkisp1_params_fops = {
-- 
2.45.2


