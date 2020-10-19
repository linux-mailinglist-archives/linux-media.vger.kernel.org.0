Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6502B293024
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 23:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732464AbgJSVAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 17:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732455AbgJSVAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 17:00:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D868C0613CE
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 14:00:06 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf435b00546912335c7d1654.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:5469:1233:5c7d:1654])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 91FC41F44FC3;
        Mon, 19 Oct 2020 22:00:04 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 2/4] media: staging: rkisp1: params: remove unnecessary "!!"
Date:   Mon, 19 Oct 2020 22:59:54 +0200
Message-Id: <20201019205956.6980-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several 'if' conditions of the form:

if (!!(module_ens & SOME_FLAG))

Those can be replaced with:

if (module_ens & SOME_FLAG)

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-params.c | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 986d293201e6..4ac401bc2164 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -896,7 +896,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					   &new_params->others.dpcc_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPCC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_DPCC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
 				rkisp1_param_set_bits(params,
 						      RKISP1_CIF_ISP_DPCC_MODE,
 						      RKISP1_CIF_ISP_DPCC_ENA);
@@ -915,7 +915,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.bls_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_BLS) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_BLS))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_BLS)
 				rkisp1_param_set_bits(params,
 						      RKISP1_CIF_ISP_BLS_CTRL,
 						      RKISP1_CIF_ISP_BLS_ENA);
@@ -934,7 +934,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.sdg_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_SDG) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_SDG))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_SDG)
 				rkisp1_param_set_bits(params,
 					RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA);
@@ -953,7 +953,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.lsc_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_LSC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_LSC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_LSC)
 				rkisp1_param_set_bits(params,
 						RKISP1_CIF_ISP_LSC_CTRL,
 						RKISP1_CIF_ISP_LSC_CTRL_ENA);
@@ -972,7 +972,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					&new_params->others.awb_gain_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_AWB_GAIN) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_AWB_GAIN)
 				rkisp1_param_set_bits(params,
 					RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
@@ -991,7 +991,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.bdm_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_BDM) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_BDM))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_BDM)
 				rkisp1_param_set_bits(params,
 						RKISP1_CIF_ISP_DEMOSAIC,
 						RKISP1_CIF_ISP_DEMOSAIC_BYPASS);
@@ -1010,7 +1010,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.flt_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_FLT) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_FLT))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_FLT)
 				rkisp1_param_set_bits(params,
 						      RKISP1_CIF_ISP_FILT_MODE,
 						      RKISP1_CIF_ISP_FLT_ENA);
@@ -1041,7 +1041,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.goc_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_GOC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_GOC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_GOC)
 				rkisp1_param_set_bits(params,
 					RKISP1_CIF_ISP_CTRL,
 					RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA);
@@ -1061,7 +1061,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 		}
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_CPROC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_CPROC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_CPROC)
 				rkisp1_param_set_bits(params,
 						RKISP1_CIF_C_PROC_CTRL,
 						RKISP1_CIF_C_PROC_CTR_ENABLE);
@@ -1092,7 +1092,7 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 					  &new_params->others.dpf_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_DPF) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_DPF))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_DPF)
 				rkisp1_param_set_bits(params,
 						   RKISP1_CIF_ISP_DPF_MODE,
 						   RKISP1_CIF_ISP_DPF_MODE_EN);
@@ -1141,7 +1141,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 					  &new_params->meas.afc_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_AFC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AFC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_AFC)
 				rkisp1_param_set_bits(params,
 						      RKISP1_CIF_ISP_AFM_CTRL,
 						      RKISP1_CIF_ISP_AFM_ENA);
@@ -1173,7 +1173,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 					  &new_params->meas.aec_config);
 
 		if (module_en_update & RKISP1_CIF_ISP_MODULE_AEC) {
-			if (!!(module_ens & RKISP1_CIF_ISP_MODULE_AEC))
+			if (module_ens & RKISP1_CIF_ISP_MODULE_AEC)
 				rkisp1_param_set_bits(params,
 						      RKISP1_CIF_ISP_EXP_CTRL,
 						      RKISP1_CIF_ISP_EXP_ENA);
-- 
2.17.1

