Return-Path: <linux-media+bounces-13943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1D912893
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 16:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44A21C20ACF
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2178347A4C;
	Fri, 21 Jun 2024 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nvXlzI0E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651CF374EA
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981681; cv=none; b=Ra7h4wkFFlwxfyxlzkTJ/Ahto7BJlUC8YR9zKBhEYDHJv0oazapTuBiYOkZco2Jq0dYZ1KPrwjG0Qe7EB4Ajg/gmb70hHUH7quT+1uz039Miq60NbBgiUeK77LZD8O/oTBVmYYYE1AwZTIUwytF2YUGG3n1cN8tgxYofq1w+508=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981681; c=relaxed/simple;
	bh=H4ti0ARU4UKh942fa6V0y+alSCXzKrevHX0Umgv4Xg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgzvH8fU1Dlrk2+WPKF4wsIsEAzuOrknOlOrecqvuGixBWaOxivRJWgBtiGZnszfzJI552F2ZuQ3vHekpTKykv+rhcWqtK0r81Pf4dHOmYZmxAdYtTeP5QVI4nlj59gvkhiTWq0YKr7PKtKMoLS4mQgMW8/1xkBHGWQn7x1I+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nvXlzI0E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18D17150E;
	Fri, 21 Jun 2024 16:54:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718981651;
	bh=H4ti0ARU4UKh942fa6V0y+alSCXzKrevHX0Umgv4Xg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nvXlzI0EVKzmiXFG67aJZfZGUeRZMLswjijJUrdRjDr2jkMTakX76mIE87cbq35/z
	 ry5srwaYVwqnfQUaidL6KC+3mM6eiy5YwRp2E9Kt/yzVcR00OnvIOemR8G/DY+BQ8p
	 H4OafTWBRUtC35dZqpopcTgJGGFQOA44upJdZW8k=
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
Subject: [PATCH 6/7] media: rkisp1: Implement extensible params support
Date: Fri, 21 Jun 2024 16:54:04 +0200
Message-ID: <20240621145406.119088-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
References: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
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

Implement the vb2 buf_out_validate() operation to validate the
extensible format buffer content at qbuf time.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   3 +
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 553 +++++++++++++++++-
 2 files changed, 540 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ccd2065351b4..bffd936f989a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -390,6 +390,7 @@ struct rkisp1_params_ops {
  * @quantization:	the quantization configured on the isp's src pad
  * @ycbcr_encoding	the YCbCr encoding
  * @raw_type:		the bayer pattern on the isp video sink pad
+ * @enabled_blocks:	bitmask of enabled ISP blocks
  */
 struct rkisp1_params {
 	struct rkisp1_vdev_node vnode;
@@ -404,6 +405,8 @@ struct rkisp1_params {
 	enum v4l2_quantization quantization;
 	enum v4l2_ycbcr_encoding ycbcr_encoding;
 	enum rkisp1_fmt_raw_pat_type raw_type;
+
+	u32 enabled_blocks;
 };
 
 /*
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index e38d2da994f5..f3ea70c7e0c1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -35,6 +35,9 @@
 #define RKISP1_ISP_CC_COEFF(n) \
 			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
 
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS	BIT(0)
+#define RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC	BIT(1)
+
 enum rkisp1_params_formats {
 	RKISP1_PARAMS_FIXED,
 	RKISP1_PARAMS_EXTENSIBLE,
@@ -1529,6 +1532,454 @@ rkisp1_params_get_buffer(struct rkisp1_params *params)
 				queue);
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
+					RKISP1_CIF_ISP_BLS_ENA);
+		return;
+	}
+
+	rkisp1_bls_config(params, &bls->bls_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
+					RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
+		return;
+	}
+
+	rkisp1_dpcc_config(params, &dpcc->dpcc_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+		return;
+	}
+
+	rkisp1_sdg_config(params, &sdg->sdg_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+					RKISP1_CIF_ISP_LSC_CTRL_ENA);
+		return;
+	}
+
+	rkisp1_lsc_config(params, &lsc->lsc_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+		return;
+	}
+
+	params->ops->awb_gain_config(params, &awbg->awb_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
+					RKISP1_CIF_ISP_FLT_ENA);
+		return;
+	}
+
+	rkisp1_flt_config(params, &flt->flt_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+					RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		return;
+	}
+
+	rkisp1_bdm_config(params, &bdm->bdm_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ctk_enable(params, false);
+		return;
+	}
+
+	rkisp1_ctk_config(params, &ctk->ctk_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK)))
+		rkisp1_ctk_enable(params, true);
+}
+
+static void rkisp1_ext_params_goc(struct rkisp1_params *params,
+				  struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_goc_config *goc =
+		(struct rkisp1_ext_params_goc_config *)hdr;
+
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+		return;
+	}
+
+	params->ops->goc_config(params, &goc->goc_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+					RKISP1_CIF_ISP_DPF_MODE_EN);
+		return;
+	}
+
+	rkisp1_dpf_config(params, &dpf->dpf_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
+					RKISP1_CIF_C_PROC_CTR_ENABLE);
+		return;
+	}
+
+	rkisp1_cproc_config(params, &cproc->cproc_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_ie_enable(params, false);
+		return;
+	}
+
+	rkisp1_ie_config(params, &ie->ie_config);
+
+	if (!(params->enabled_blocks & BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_IE)))
+		rkisp1_ie_enable(params, true);
+}
+
+static void rkisp1_ext_params_awbm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_awb_meas_config *awbm =
+		(struct rkisp1_ext_params_awb_meas_config *)hdr;
+
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->awb_meas_enable(params, &awbm->awb_meas_config,
+					     false);
+		return;
+	}
+
+	params->ops->awb_meas_config(params, &awbm->awb_meas_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		params->ops->hst_enable(params, &hst->hst_config, false);
+		return;
+	}
+
+	params->ops->hst_config(params, &hst->hst_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS)))
+		params->ops->hst_enable(params, &hst->hst_config, true);
+}
+
+static void rkisp1_ext_params_aecm(struct rkisp1_params *params,
+				   struct rkisp1_ext_params_block_header *hdr)
+{
+	struct rkisp1_ext_params_aec_config *aec =
+		(struct rkisp1_ext_params_aec_config *)hdr;
+
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_EXP_CTRL,
+					RKISP1_CIF_ISP_EXP_ENA);
+		return;
+	}
+
+	params->ops->aec_config(params, &aec->aec_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS)))
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
+	if (hdr->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AFM_CTRL,
+					RKISP1_CIF_ISP_AFM_ENA);
+		return;
+	}
+
+	params->ops->afm_config(params, &afc->afc_config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS)))
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
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH] = {
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
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_hst_config),
+		.handler	= rkisp1_ext_params_hstm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_aec_config),
+		.handler	= rkisp1_ext_params_aecm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_afc_config),
+		.handler	= rkisp1_ext_params_afcm,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS
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
+	while (block_offset < cfg->total_size) {
+		const struct rkisp1_ext_params_handler *block_handler;
+		struct rkisp1_ext_params_block_header *block;
+
+		block = (struct rkisp1_ext_params_block_header *)
+			&cfg->data[block_offset];
+		block_offset += block->size;
+
+		/* Make sure the block is in the list of groups to configure. */
+		block_handler = &rkisp1_ext_params_handlers[block->type];
+		if (!(block_handler->group & block_group_mask))
+			continue;
+
+		block_handler->handler(params, block);
+
+		if (block->enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE)
+			params->enabled_blocks &= ~BIT(block->type);
+		else
+			params->enabled_blocks |= BIT(block->type);
+	}
+}
+
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence)
@@ -1550,9 +2001,15 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
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
@@ -1651,8 +2108,13 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
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
@@ -1680,7 +2142,11 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
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
@@ -1874,10 +2340,6 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 {
-	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct rkisp1_params_buffer *params_buf =
-		container_of(vbuf, struct rkisp1_params_buffer, vb);
-	void *cfg = vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
 	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
 
 	if (vb2_plane_size(vb, 0) < params->metafmt->buffersize)
@@ -1885,12 +2347,6 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 
 	vb2_set_plane_payload(vb, 0, params->metafmt->buffersize);
 
-	/*
-	 * Copy the parameters buffer to the internal scratch buffer to avoid
-	 * userspace modifying the buffer content while the driver processes it.
-	 */
-	memcpy(params_buf->cfg, cfg, params->metafmt->buffersize);
-
 	return 0;
 }
 
@@ -1911,12 +2367,77 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+
+	params->enabled_blocks = 0;
+}
+
+static int rkisp1_params_validate_ext_params(struct rkisp1_params *params,
+					     struct rkisp1_ext_params_cfg *cfg)
+{
+	size_t block_offset = 0;
+
+	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
+		dev_dbg(params->rkisp1->dev,
+			"Invalid parameters buffer size %u\n",
+			cfg->total_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of parameter blocks and validate them. */
+	while (block_offset < cfg->total_size) {
+		const struct rkisp1_ext_params_handler *hdlr;
+		struct rkisp1_ext_params_block_header *block;
+
+		block = (struct rkisp1_ext_params_block_header *)
+			&cfg->data[block_offset];
+
+		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block type\n");
+			return -EINVAL;
+		}
+
+		hdlr = &rkisp1_ext_params_handlers[block->type];
+		if (block->size != hdlr->size) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block size\n");
+			return -EINVAL;
+		}
+
+		block_offset += block->size;
+	}
+
+	return 0;
+}
+
+static int rkisp1_params_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf =
+		container_of(vbuf, struct rkisp1_params_buffer, vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkisp1_params *params = vq->drv_priv;
+	struct rkisp1_ext_params_cfg *cfg =
+		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
+
+	/*
+	 * Copy the parameters buffer to the internal scratch buffer to avoid
+	 * userspace modifying the buffer content while the driver processes it.
+	 */
+	memcpy(params_buf->cfg, cfg, params->metafmt->buffersize);
+
+	/* Fixed parameters format doesn't require validation. */
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
+		return 0;
+
+	return rkisp1_params_validate_ext_params(params, cfg);
 }
 
 static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.queue_setup = rkisp1_params_vb2_queue_setup,
 	.buf_init = rkisp1_params_vb2_buf_init,
 	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
+	.buf_out_validate = rkisp1_params_vb2_buf_out_validate,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = rkisp1_params_vb2_buf_queue,
-- 
2.45.2


