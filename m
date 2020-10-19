Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2B5293026
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 23:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732473AbgJSVAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 17:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732455AbgJSVAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 17:00:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C06EC0613CE
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 14:00:07 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf435b00546912335c7d1654.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:5469:1233:5c7d:1654])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7AA0C1F44FD0;
        Mon, 19 Oct 2020 22:00:05 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 4/4] media: staging: rkisp1: params: remove extra 'if' conditions
Date:   Mon, 19 Oct 2020 22:59:56 +0200
Message-Id: <20201019205956.6980-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a repeating code pattern:

if (a || b) {
	if (a)
		...
	if (b)
		...
}

In this pattern, the first 'if' is redundant.
The code can be replaced with:

if (a)
	...
if (b)
	...

In addition, the patch corrects alignment issues
reported by checkpatch.
This solves the TODO item
"Fix checkpatch errors."

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/TODO            |   1 -
 drivers/staging/media/rkisp1/rkisp1-params.c | 420 ++++++++-----------
 2 files changed, 175 insertions(+), 246 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index e7c8398fc2ce..647ab482d032 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,5 +1,4 @@
 * Fix pad format size for statistics and parameters entities.
-* Fix checkpatch errors.
 * Add uapi docs. Remember to add documentation of how quantization is handled.
 * streaming paths (mainpath and selfpath) check if the other path is streaming
 in several places of the code, review this, specially that it doesn't seem it
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index a2df6b50c109..c8585b6ee918 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -186,7 +186,7 @@ static void rkisp1_bls_config(struct rkisp1_params *params,
 /* ISP LS correction interface function */
 static void
 rkisp1_lsc_correct_matrix_config(struct rkisp1_params *params,
-				const struct rkisp1_cif_isp_lsc_config *pconfig)
+				 const struct rkisp1_cif_isp_lsc_config *pconfig)
 {
 	unsigned int isp_lsc_status, sram_addr, isp_lsc_table_sel, i, j, data;
 
@@ -434,7 +434,7 @@ static void rkisp1_ctk_enable(struct rkisp1_params *params, bool en)
 
 /* ISP White Balance Mode */
 static void rkisp1_awb_meas_config(struct rkisp1_params *params,
-			const struct rkisp1_cif_isp_awb_meas_config *arg)
+				   const struct rkisp1_cif_isp_awb_meas_config *arg)
 {
 	u32 reg_val = 0;
 	/* based on the mode,configure the awb module */
@@ -888,226 +888,171 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 	module_cfg_update = new_params->module_cfg_update;
 	module_ens = new_params->module_ens;
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)) {
-		/*update dpc config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
-			rkisp1_dpcc_config(params,
-					   &new_params->others.dpcc_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
-				rkisp1_param_set_bits(params,
-						      RKISP1_CIF_ISP_DPCC_MODE,
-						      RKISP1_CIF_ISP_DPCC_ENA);
-			else
-				rkisp1_param_clear_bits(params,
+	/*update dpc config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPCC)
+		rkisp1_dpcc_config(params,
+				   &new_params->others.dpcc_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
+			rkisp1_param_set_bits(params,
+					      RKISP1_CIF_ISP_DPCC_MODE,
+					      RKISP1_CIF_ISP_DPCC_ENA);
+		else
+			rkisp1_param_clear_bits(params,
 						RKISP1_CIF_ISP_DPCC_MODE,
 						RKISP1_CIF_ISP_DPCC_ENA);
-		}
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_BLS) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)) {
-		/* update bls config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)
-			rkisp1_bls_config(params,
-					  &new_params->others.bls_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
-				rkisp1_param_set_bits(params,
-						      RKISP1_CIF_ISP_BLS_CTRL,
-						      RKISP1_CIF_ISP_BLS_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-							RKISP1_CIF_ISP_BLS_CTRL,
-							RKISP1_CIF_ISP_BLS_ENA);
-		}
+	/* update bls config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BLS)
+		rkisp1_bls_config(params,
+				  &new_params->others.bls_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
+			rkisp1_param_set_bits(params,
+					      RKISP1_CIF_ISP_BLS_CTRL,
+					      RKISP1_CIF_ISP_BLS_ENA);
+		else
+			rkisp1_param_clear_bits(params,
+						RKISP1_CIF_ISP_BLS_CTRL,
+						RKISP1_CIF_ISP_BLS_ENA);
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_SDG) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG)) {
-		/* update sdg config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG)
-			rkisp1_sdg_config(params,
-					  &new_params->others.sdg_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_SDG) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_SDG)
-				rkisp1_param_set_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
-		}
+	/* update sdg config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_SDG)
+		rkisp1_sdg_config(params,
+				  &new_params->others.sdg_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_SDG) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_SDG)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+					      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+						RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_LSC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)) {
-		/* update lsc config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)
-			rkisp1_lsc_config(params,
-					  &new_params->others.lsc_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
-				rkisp1_param_set_bits(params,
-						RKISP1_CIF_ISP_LSC_CTRL,
-						RKISP1_CIF_ISP_LSC_CTRL_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-						RKISP1_CIF_ISP_LSC_CTRL,
+	/* update lsc config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_LSC)
+		rkisp1_lsc_config(params,
+				  &new_params->others.lsc_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
+					      RKISP1_CIF_ISP_LSC_CTRL_ENA);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
 						RKISP1_CIF_ISP_LSC_CTRL_ENA);
-		}
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)) {
-		/* update awb gains */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
-			rkisp1_awb_gain_config(params,
-					&new_params->others.awb_gain_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
-				rkisp1_param_set_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
-		}
+	/* update awb gains */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
+		rkisp1_awb_gain_config(params, &new_params->others.awb_gain_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+					      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+						RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_BDM) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM)) {
-		/* update bdm config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM)
-			rkisp1_bdm_config(params,
-					  &new_params->others.bdm_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_BDM) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_BDM)
-				rkisp1_param_set_bits(params,
-						RKISP1_CIF_ISP_DEMOSAIC,
-						RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
-			else
-				rkisp1_param_clear_bits(params,
-						RKISP1_CIF_ISP_DEMOSAIC,
+	/* update bdm config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_BDM)
+		rkisp1_bdm_config(params,
+				  &new_params->others.bdm_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_BDM) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_BDM)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
+					      RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DEMOSAIC,
 						RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
-		}
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_FLT) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT)) {
-		/* update filter config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT)
-			rkisp1_flt_config(params,
-					  &new_params->others.flt_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_FLT) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_FLT)
-				rkisp1_param_set_bits(params,
-						      RKISP1_CIF_ISP_FILT_MODE,
-						      RKISP1_CIF_ISP_FLT_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-						RKISP1_CIF_ISP_FILT_MODE,
+	/* update filter config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_FLT)
+		rkisp1_flt_config(params,
+				  &new_params->others.flt_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_FLT) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_FLT)
+			rkisp1_param_set_bits(params,
+					      RKISP1_CIF_ISP_FILT_MODE,
+					      RKISP1_CIF_ISP_FLT_ENA);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_FILT_MODE,
 						RKISP1_CIF_ISP_FLT_ENA);
-		}
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_CTK) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK)) {
-		/* update ctk config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK)
-			rkisp1_ctk_config(params,
-					  &new_params->others.ctk_config);
+	/* update ctk config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CTK)
+		rkisp1_ctk_config(params,
+				  &new_params->others.ctk_config);
 
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_CTK)
-			rkisp1_ctk_enable(params,
-				!!(module_ens & RKISP1_CIF_ISP_MODULE_CTK));
-	}
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_CTK)
+		rkisp1_ctk_enable(params, !!(module_ens & RKISP1_CIF_ISP_MODULE_CTK));
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_GOC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)) {
-		/* update goc config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)
-			rkisp1_goc_config(params,
-					  &new_params->others.goc_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
-				rkisp1_param_set_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-					RKISP1_CIF_ISP_CTRL,
-					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
-		}
+	/* update goc config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_GOC)
+		rkisp1_goc_config(params,
+				  &new_params->others.goc_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
+					      RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
+						RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC)) {
-		/* update cproc config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC) {
-			rkisp1_cproc_config(params,
-					    &new_params->others.cproc_config);
-		}
+	/* update cproc config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_CPROC) {
+		rkisp1_cproc_config(params,
+				    &new_params->others.cproc_config);
+	}
 
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_CPROC)
-				rkisp1_param_set_bits(params,
-						RKISP1_CIF_C_PROC_CTRL,
-						RKISP1_CIF_C_PROC_CTR_ENABLE);
-			else
-				rkisp1_param_clear_bits(params,
-						RKISP1_CIF_C_PROC_CTRL,
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_CPROC)
+			rkisp1_param_set_bits(params, RKISP1_CIF_C_PROC_CTRL,
+					      RKISP1_CIF_C_PROC_CTR_ENABLE);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
 						RKISP1_CIF_C_PROC_CTR_ENABLE);
-		}
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_IE) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_IE)) {
-		/* update ie config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_IE)
-			rkisp1_ie_config(params,
-					 &new_params->others.ie_config);
+	/* update ie config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_IE)
+		rkisp1_ie_config(params,
+				 &new_params->others.ie_config);
 
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_IE)
-			rkisp1_ie_enable(params,
-				!!(module_ens & RKISP1_CIF_ISP_MODULE_IE));
-	}
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_IE)
+		rkisp1_ie_enable(params, !!(module_ens & RKISP1_CIF_ISP_MODULE_IE));
+
+	/* update dpf  config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF)
+		rkisp1_dpf_config(params,
+				  &new_params->others.dpf_config);
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_DPF) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF)) {
-		/* update dpf  config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF)
-			rkisp1_dpf_config(params,
-					  &new_params->others.dpf_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPF) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_DPF)
-				rkisp1_param_set_bits(params,
-						   RKISP1_CIF_ISP_DPF_MODE,
-						   RKISP1_CIF_ISP_DPF_MODE_EN);
-			else
-				rkisp1_param_clear_bits(params,
-						RKISP1_CIF_ISP_DPF_MODE,
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_DPF) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_DPF)
+			rkisp1_param_set_bits(params, RKISP1_CIF_ISP_DPF_MODE,
+					      RKISP1_CIF_ISP_DPF_MODE_EN);
+		else
+			rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
 						RKISP1_CIF_ISP_DPF_MODE_EN);
-		}
 	}
 
 	if ((module_en_update & RKISP1_CIF_ISP_MODULE_DPF_STRENGTH) ||
 	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_DPF_STRENGTH)) {
 		/* update dpf strength config */
-		rkisp1_dpf_strength_config(params,
-				&new_params->others.dpf_strength_config);
+		rkisp1_dpf_strength_config(params, &new_params->others.dpf_strength_config);
 	}
 }
 
@@ -1120,68 +1065,53 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	module_cfg_update = new_params->module_cfg_update;
 	module_ens = new_params->module_ens;
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AWB) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)) {
-		/* update awb config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)
-			rkisp1_awb_meas_config(params,
-					&new_params->meas.awb_meas_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB)
-			rkisp1_awb_meas_enable(params,
-				&new_params->meas.awb_meas_config,
-				!!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
-	}
+	/* update awb config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AWB)
+		rkisp1_awb_meas_config(params, &new_params->meas.awb_meas_config);
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AFC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)) {
-		/* update afc config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)
-			rkisp1_afm_config(params,
-					  &new_params->meas.afc_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_AFC)
-				rkisp1_param_set_bits(params,
-						      RKISP1_CIF_ISP_AFM_CTRL,
-						      RKISP1_CIF_ISP_AFM_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-							RKISP1_CIF_ISP_AFM_CTRL,
-							RKISP1_CIF_ISP_AFM_ENA);
-		}
-	}
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB)
+		rkisp1_awb_meas_enable(params, &new_params->meas.awb_meas_config,
+				       !!(module_ens & RKISP1_CIF_ISP_MODULE_AWB));
+
+	/* update afc config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AFC)
+		rkisp1_afm_config(params,
+				  &new_params->meas.afc_config);
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_HST) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)) {
-		/* update hst config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)
-			rkisp1_hst_config(params,
-					  &new_params->meas.hst_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_HST)
-			rkisp1_hst_enable(params,
-				&new_params->meas.hst_config,
-				!!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_AFC)
+			rkisp1_param_set_bits(params,
+					      RKISP1_CIF_ISP_AFM_CTRL,
+					      RKISP1_CIF_ISP_AFM_ENA);
+		else
+			rkisp1_param_clear_bits(params,
+						RKISP1_CIF_ISP_AFM_CTRL,
+						RKISP1_CIF_ISP_AFM_ENA);
 	}
 
-	if ((module_en_update & RKISP1_CIF_ISP_MODULE_AEC) ||
-	    (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)) {
-		/* update aec config */
-		if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)
-			rkisp1_aec_config(params,
-					  &new_params->meas.aec_config);
-
-		if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
-			if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
-				rkisp1_param_set_bits(params,
-						      RKISP1_CIF_ISP_EXP_CTRL,
-						      RKISP1_CIF_ISP_EXP_ENA);
-			else
-				rkisp1_param_clear_bits(params,
-							RKISP1_CIF_ISP_EXP_CTRL,
-							RKISP1_CIF_ISP_EXP_ENA);
-		}
+	/* update hst config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_HST)
+		rkisp1_hst_config(params,
+				  &new_params->meas.hst_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_HST)
+		rkisp1_hst_enable(params, &new_params->meas.hst_config,
+				  !!(module_ens & RKISP1_CIF_ISP_MODULE_HST));
+
+	/* update aec config */
+	if (module_cfg_update & RKISP1_CIF_ISP_MODULE_AEC)
+		rkisp1_aec_config(params,
+				  &new_params->meas.aec_config);
+
+	if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
+		if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
+			rkisp1_param_set_bits(params,
+					      RKISP1_CIF_ISP_EXP_CTRL,
+					      RKISP1_CIF_ISP_EXP_ENA);
+		else
+			rkisp1_param_clear_bits(params,
+						RKISP1_CIF_ISP_EXP_CTRL,
+						RKISP1_CIF_ISP_EXP_ENA);
 	}
 }
 
-- 
2.17.1

