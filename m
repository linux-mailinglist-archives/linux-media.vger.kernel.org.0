Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C51F454468
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhKQKAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:00:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:35352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235780AbhKQJ74 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4938861C32;
        Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637143017;
        bh=cOHNPRljCx70ZxxdMzVwTvVmVM3KMeVN9oY3o6+dXks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CgpLwzjJh+JtOa+x6/Y3eKE1BvEVUnjLWbkfTZi0TFnbKmczsNvRZ093ifsU0r4Hx
         FlYdrUokrkqtGKBHGhz9c15cP0DvhFSR86HUQMd8p2SJ9/njKWxe0u/wwE4r5bnHxW
         NxDJI7UM4kjhA9wSCKh7u/dzf+ZpTdTFGLcYmLIUrwYUrZetLLVSQfxA5jLw4f9nbB
         XGs6PG7/ib1smwG+mzYJLZ1JR/xJnJrpBpA5KtgQnZnMbYyRO3zK9UAK2NPLTzBfI9
         jSPVCrMytdamjH1KIMVkGKEGzHQoQx++/kK6K3t5muATjcPBrQO7vbrD2NG175gq09
         rdjTpOUMVj6pQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHgV-00DIUd-6a; Wed, 17 Nov 2021 09:56:55 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 05/12] media: atomisp: sh_css_params: remove tests for ISP2401
Date:   Wed, 17 Nov 2021 09:56:47 +0000
Message-Id: <037de9f2b2c1a1c250f166134b9aec47c1298f83.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those tests are related to the input system, which is the same
for the chosen firmware, so both ISP2400 and ISP2401 will be
identical with that regards.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/sh_css_params.c | 117 ++----------------
 1 file changed, 8 insertions(+), 109 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 448b07162382..68d8f54473ea 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -104,15 +104,10 @@
 	(sizeof(char) * (binary)->in_frame_info.res.height * \
 	 (binary)->in_frame_info.padded_width)
 
-#define ISP2400_SCTBL_BYTES(binary) \
+#define SCTBL_BYTES(binary) \
 	(sizeof(unsigned short) * (binary)->sctbl_height * \
 	 (binary)->sctbl_aligned_width_per_color * IA_CSS_SC_NUM_COLORS)
 
-#define ISP2401_SCTBL_BYTES(binary) \
-	(sizeof(unsigned short) * max((binary)->sctbl_height, (binary)->sctbl_legacy_height) * \
-			/* height should be the larger height between new api and legacy api */ \
-	 (binary)->sctbl_aligned_width_per_color * IA_CSS_SC_NUM_COLORS)
-
 #define MORPH_PLANE_BYTES(binary) \
 	(SH_CSS_MORPH_TABLE_ELEM_BYTES * (binary)->morph_tbl_aligned_width * \
 	 (binary)->morph_tbl_height)
@@ -1611,18 +1606,6 @@ ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
 	params->dp_config.r  = params->wb_config.r;
 	params->dp_config.b  = params->wb_config.b;
 	params->dp_config.gb = params->wb_config.gb;
-
-	if (IS_ISP2401) {
-		assert(pipe);
-		assert(pipe->mode < IA_CSS_PIPE_ID_NUM);
-
-		if (pipe->mode < IA_CSS_PIPE_ID_NUM) {
-			params->pipe_dp_config[pipe->mode].gr = params->wb_config.gr;
-			params->pipe_dp_config[pipe->mode].r  = params->wb_config.r;
-			params->pipe_dp_config[pipe->mode].b  = params->wb_config.b;
-			params->pipe_dp_config[pipe->mode].gb = params->wb_config.gb;
-		}
-	}
 }
 
 /* ISP2401 */
@@ -2072,16 +2055,6 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 	params->output_frame = config->output_frame;
 	params->isp_parameters_id = config->isp_config_id;
 
-	/* Currently we do not offer CSS interface to set different
-	 * configurations for DPC, i.e. depending on DPC being enabled
-	 * before (NORM+OBC) or after. The folllowing code to set the
-	 * DPC configuration should be updated when this interface is made
-	 * available */
-	if (IS_ISP2401) {
-		sh_css_set_dp_config(pipe, params, config->dp_config);
-		ia_css_set_param_exceptions(pipe, params);
-	}
-
 	if (0 ==
 	    sh_css_select_dp_10bpp_config(pipe, &is_dp_10bpp)) {
 		/* return an error when both DPC and BDS is enabled by the
@@ -2096,8 +2069,7 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		goto exit;
 	}
 
-	if (!IS_ISP2401)
-		ia_css_set_param_exceptions(pipe, params);
+	ia_css_set_param_exceptions(pipe, params);
 
 exit:
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -2514,29 +2486,7 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 		ia_css_set_ob_config(params, &default_ob_config);
 		ia_css_set_dp_config(params, &default_dp_config);
 
-		if (!IS_ISP2401) {
-			ia_css_set_param_exceptions(pipe_in, params);
-		} else {
-			for (i = 0; i < stream->num_pipes; i++) {
-				if (sh_css_select_dp_10bpp_config(stream->pipes[i],
-								&is_dp_10bpp) == 0) {
-					/* set the return value as false if both DPC and
-					* BDS is enabled by the user. But we do not return
-					* the value immediately to enable internal firmware
-					* feature testing. */
-					if (is_dp_10bpp) {
-						sh_css_set_dp_config(stream->pipes[i], params, &default_dp_10bpp_config);
-					} else {
-						sh_css_set_dp_config(stream->pipes[i], params, &default_dp_config);
-					}
-				} else {
-					retval = false;
-					goto exit;
-				}
-
-				ia_css_set_param_exceptions(stream->pipes[i], params);
-			}
-		}
+		ia_css_set_param_exceptions(pipe_in, params);
 
 		ia_css_set_de_config(params, &default_de_config);
 		ia_css_set_gc_config(params, &default_gc_config);
@@ -2641,20 +2591,9 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 				retval = false;
 				goto exit;
 			}
-			if (IS_ISP2401) {
-				if (stream->pipes[i]->mode < IA_CSS_PIPE_ID_NUM) {
-					sh_css_set_dp_config(stream->pipes[i], params,
-							    &stream_params->pipe_dp_config[stream->pipes[i]->mode]);
-					ia_css_set_param_exceptions(stream->pipes[i], params);
-				} else {
-					retval = false;
-					goto exit;
-				}
-			}
 		}
 
-		if (!IS_ISP2401)
-			ia_css_set_param_exceptions(pipe_in, params);
+		ia_css_set_param_exceptions(pipe_in, params);
 
 		params->fpn_config.data = stream_params->fpn_config.data;
 		params->config_changed[IA_CSS_FPN_ID] =
@@ -2806,10 +2745,7 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 	pipe->scaler_pp_lut = mmgr_NULL;
 
 	if (!stream_started) {
-		if (!IS_ISP2401)
-			pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
-		else
-			pipe->scaler_pp_lut = sh_css_params_alloc_gdc_lut();
+		pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 
 		if (pipe->scaler_pp_lut == mmgr_NULL) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
@@ -2851,10 +2787,7 @@ int sh_css_params_map_and_store_default_gdc_lut(void)
 
 	host_lut_store((void *)zoom_table);
 
-	if (!IS_ISP2401)
-		default_gdc_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
-	else
-		default_gdc_lut = sh_css_params_alloc_gdc_lut();
+	default_gdc_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
 
 	if (default_gdc_lut == mmgr_NULL)
 		return -ENOMEM;
@@ -3450,18 +3383,12 @@ sh_css_params_write_to_ddr_internal(
 
 	if (binary->info->sp.enable.sc) {
 		u32 enable_conv;
-		size_t bytes;
-
-		if (!IS_ISP2401)
-			bytes = ISP2400_SCTBL_BYTES(binary);
-		else
-			bytes = ISP2401_SCTBL_BYTES(binary);
 
 		enable_conv = params->shading_settings.enable_shading_table_conversion;
 
 		buff_realloced = reallocate_buffer(&ddr_map->sc_tbl,
 						   &ddr_map_size->sc_tbl,
-						   bytes,
+						   SCTBL_BYTES(binary),
 						   params->sc_table_changed,
 						   &err);
 		if (err) {
@@ -3546,28 +3473,6 @@ sh_css_params_write_to_ddr_internal(
 		}
 	}
 
-	/* DPC configuration is made pipe specific to allow flexibility in positioning of the
-	 * DPC kernel. The code below sets the pipe specific configuration to
-	 * individual binaries. */
-	if (IS_ISP2401 &&
-	    params->pipe_dpc_config_changed[pipe_id] && binary->info->sp.enable.dpc) {
-		unsigned int size   =
-		    stage->binary->info->mem_offsets.offsets.param->dmem.dp.size;
-
-		unsigned int offset =
-		    stage->binary->info->mem_offsets.offsets.param->dmem.dp.offset;
-
-		if (size) {
-			ia_css_dp_encode((struct sh_css_isp_dp_params *)
-					 &binary->mem_params.params[IA_CSS_PARAM_CLASS_PARAM][IA_CSS_ISP_DMEM].address[offset],
-					 &params->pipe_dp_config[pipe_id], size);
-
-			params->isp_params_changed = true;
-			params->isp_mem_params_changed[pipe_id][stage->stage_num][IA_CSS_ISP_DMEM] =
-			    true;
-		}
-	}
-
 	if (params->config_changed[IA_CSS_MACC_ID] && binary->info->sp.enable.macc) {
 		unsigned int i, j, idx;
 		unsigned int idx_map[] = {
@@ -3649,13 +3554,7 @@ sh_css_params_write_to_ddr_internal(
 			if (!params->pipe_dvs_6axis_config[pipe_id]) {
 				struct ia_css_resolution dvs_offset = {0};
 
-				if (!IS_ISP2401) {
-					dvs_offset.width = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
-				} else {
-					if (binary->dvs_envelope.width || binary->dvs_envelope.height) {
-						dvs_offset.width  = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
-					}
-				}
+				dvs_offset.width = (PIX_SHIFT_FILTER_RUN_IN_X + binary->dvs_envelope.width) / 2;
 				dvs_offset.height = (PIX_SHIFT_FILTER_RUN_IN_Y + binary->dvs_envelope.height) / 2;
 
 				params->pipe_dvs_6axis_config[pipe_id] =
-- 
2.33.1

