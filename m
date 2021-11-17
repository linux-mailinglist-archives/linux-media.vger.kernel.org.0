Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E824543A6
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbhKQJ27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:58820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235006AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D791B63222;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141142;
        bh=GfwVqnQr426C/xl10GP8U+3s5uK4txcrX0yMgIeYv1w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P46yX4wh9vNNfN0wW7Up1UW7YCm8/u9/l1QkXhDEaLXhPQU7TNbLgkb/Ta6Q3JRbT
         i/nXcndxggefY5m2LqEega67WWMbEVAO0vkZTX6WPUW/UnipRzFA8QYEtRFoq87XeE
         h8yhPOI3VN/eJZzSVF7fu+MpIDnTq9wKe0C+VvKMWAzPQGgwaEraeJ45f8gPWjUveY
         yhpQSlD4+4hZWq3uVzl7+oSCvNBBoMNHVDNtWyTONLtbm/6QEEDJHcGU3OhIZe3At5
         bHILAKU5+R4SxsrZkWg7YHaYEVTUk9+u5P7iHNLLa1aehHOKjJtNEXyRRydJSEePxn
         8ioPeOuyrKZPw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb5s-91; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 06/13] media: atomisp: sh_css_params: cleanup the code
Date:   Wed, 17 Nov 2021 09:25:31 +0000
Message-Id: <aa06055ecb0aa7c57eb08819fb25dbf62e58791b.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the tests for the new ISP2401 input system were
dropped, simplify the code, making it closer to the Intel
Aero device driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c    |  6 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 92 +++----------------
 .../staging/media/atomisp/pci/sh_css_params.h |  8 --
 3 files changed, 15 insertions(+), 91 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index acaa4c8b1884..1d605e533e29 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2250,8 +2250,10 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 		break;
 	}
 
-	sh_css_params_free_gdc_lut(pipe->scaler_pp_lut);
-	pipe->scaler_pp_lut = mmgr_NULL;
+	if (pipe->scaler_pp_lut != mmgr_NULL) {
+		hmm_free(pipe->scaler_pp_lut);
+		pipe->scaler_pp_lut = mmgr_NULL;
+	}
 
 	my_css.active_pipes[ia_css_pipe_get_pipe_num(pipe)] = NULL;
 	sh_css_pipe_free_shading_table(pipe);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 68d8f54473ea..f3f8d99c84a4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1020,16 +1020,6 @@ sh_css_params_set_binning_factor(struct ia_css_stream *stream,
 	return params->sc_table_changed;
 }
 
-static void
-sh_css_update_shading_table_status(struct ia_css_pipe *pipe,
-				   struct ia_css_isp_parameters *params)
-{
-	if (params && pipe && (pipe->pipe_num != params->sc_table_last_pipe_num)) {
-		params->sc_table_dirty = true;
-		params->sc_table_last_pipe_num = pipe->pipe_num;
-	}
-}
-
 static void
 sh_css_set_shading_table(struct ia_css_stream *stream,
 			 struct ia_css_isp_parameters *params,
@@ -1043,10 +1033,9 @@ sh_css_set_shading_table(struct ia_css_stream *stream,
 	if (!table->enable)
 		table = NULL;
 
-	if ((table != params->sc_table) || params->sc_table_dirty) {
+	if (table != params->sc_table) {
 		params->sc_table = table;
 		params->sc_table_changed = true;
-		params->sc_table_dirty = false;
 		/* Not very clean, this goes to sh_css.c to invalidate the
 		 * shading table for all pipes. Should replaced by a loop
 		 * and a pipe-specific call.
@@ -1608,45 +1597,6 @@ ia_css_set_param_exceptions(const struct ia_css_pipe *pipe,
 	params->dp_config.gb = params->wb_config.gb;
 }
 
-/* ISP2401 */
-static void
-sh_css_set_dp_config(const struct ia_css_pipe *pipe,
-		     struct ia_css_isp_parameters *params,
-		     const struct ia_css_dp_config *config)
-{
-	if (!config)
-		return;
-
-	assert(params);
-	assert(pipe);
-	assert(pipe->mode < IA_CSS_PIPE_ID_NUM);
-
-	IA_CSS_ENTER_PRIVATE("config=%p", config);
-	ia_css_dp_debug_dtrace(config, IA_CSS_DEBUG_TRACE_PRIVATE);
-	if (pipe->mode < IA_CSS_PIPE_ID_NUM) {
-		params->pipe_dp_config[pipe->mode] = *config;
-		params->pipe_dpc_config_changed[pipe->mode] = true;
-	}
-	IA_CSS_LEAVE_PRIVATE("void");
-}
-
-static void
-sh_css_get_dp_config(const struct ia_css_pipe *pipe,
-		     const struct ia_css_isp_parameters *params,
-		     struct ia_css_dp_config *config)
-{
-	if (!config)
-		return;
-
-	assert(params);
-	assert(pipe);
-	IA_CSS_ENTER_PRIVATE("config=%p", config);
-
-	*config = params->pipe_dp_config[pipe->mode];
-
-	IA_CSS_LEAVE_PRIVATE("void");
-}
-
 static void
 sh_css_set_nr_config(struct ia_css_isp_parameters *params,
 		     const struct ia_css_nr_config *config)
@@ -1718,9 +1668,7 @@ sh_css_set_pipe_dvs_6axis_config(const struct ia_css_pipe *pipe,
 
 	copy_dvs_6axis_table(params->pipe_dvs_6axis_config[pipe->mode], dvs_config);
 
-#if !defined(HAS_NO_DVS_6AXIS_CONFIG_UPDATE)
 	params->pipe_dvs_6axis_config_changed[pipe->mode] = true;
-#endif
 
 	IA_CSS_LEAVE_PRIVATE("void");
 }
@@ -2039,7 +1987,6 @@ sh_css_init_isp_params_from_config(struct ia_css_pipe *pipe,
 		sh_css_set_pipe_dvs_6axis_config(pipe, params, config->dvs_6axis_config);
 	sh_css_set_dz_config(params, config->dz_config);
 	sh_css_set_motion_vector(params, config->motion_vector);
-	sh_css_update_shading_table_status(pipe_in, params);
 	sh_css_set_shading_table(pipe->stream, params, config->shading_table);
 	sh_css_set_morph_table(params, config->morph_table);
 	sh_css_set_macc_table(params, config->macc_table);
@@ -2104,7 +2051,6 @@ ia_css_pipe_get_isp_config(struct ia_css_pipe *pipe,
 	sh_css_get_ee_config(params, config->ee_config);
 	sh_css_get_baa_config(params, config->baa_config);
 	sh_css_get_pipe_dvs_6axis_config(pipe, params, config->dvs_6axis_config);
-	sh_css_get_dp_config(pipe, params, config->dp_config);
 	sh_css_get_macc_table(params, config->macc_table);
 	sh_css_get_gamma_table(params, config->gamma_table);
 	sh_css_get_ctc_table(params, config->ctc_table);
@@ -2523,8 +2469,6 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 
 		params->sc_table = NULL;
 		params->sc_table_changed = true;
-		params->sc_table_dirty = false;
-		params->sc_table_last_pipe_num = 0;
 
 		ia_css_sdis2_clear_coefficients(&params->dvs2_coefs);
 		params->dvs2_coef_table_changed = true;
@@ -2582,11 +2526,8 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 				 * BDS is enabled by the user. But we do not return
 				 * the value immediately to enable internal firmware
 				 * feature testing. */
-
-				if (is_dp_10bpp) {
-					retval = false;
-					/* FIXME: should it ignore this error? */
-				}
+				retval = !is_dp_10bpp;
+				/* FIXME: should it ignore this error? */
 			} else {
 				retval = false;
 				goto exit;
@@ -2604,13 +2545,10 @@ sh_css_init_isp_params_from_global(struct ia_css_stream *stream,
 		sh_css_set_morph_table(params, stream_params->morph_table);
 
 		if (stream_params->sc_table) {
-			sh_css_update_shading_table_status(pipe_in, params);
 			sh_css_set_shading_table(stream, params, stream_params->sc_table);
 		} else {
 			params->sc_table = NULL;
 			params->sc_table_changed = true;
-			params->sc_table_dirty = false;
-			params->sc_table_last_pipe_num = 0;
 		}
 
 		/* Only IA_CSS_PIPE_ID_VIDEO & IA_CSS_PIPE_ID_CAPTURE will support dvs_6axis_config*/
@@ -2703,18 +2641,6 @@ static void host_lut_store(const void *lut)
 		gdc_lut_store((gdc_ID_t)i, (const int (*)[HRT_GDC_N]) lut);
 }
 
-/* Note that allocation is in ipu address space. */
-inline ia_css_ptr sh_css_params_alloc_gdc_lut(void)
-{
-	return hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
-}
-
-inline void sh_css_params_free_gdc_lut(ia_css_ptr addr)
-{
-	if (addr != mmgr_NULL)
-		hmm_free(addr);
-}
-
 int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 	const void *lut)
 {
@@ -2741,8 +2667,10 @@ int ia_css_pipe_set_bci_scaler_lut(struct ia_css_pipe *pipe,
 	}
 
 	/* Free any existing tables. */
-	sh_css_params_free_gdc_lut(pipe->scaler_pp_lut);
-	pipe->scaler_pp_lut = mmgr_NULL;
+	if (pipe->scaler_pp_lut != mmgr_NULL) {
+		hmm_free(pipe->scaler_pp_lut);
+		pipe->scaler_pp_lut = mmgr_NULL;
+	}
 
 	if (!stream_started) {
 		pipe->scaler_pp_lut = hmm_alloc(sizeof(zoom_table), HMM_BO_PRIVATE, 0, NULL, 0);
@@ -2805,8 +2733,10 @@ void sh_css_params_free_default_gdc_lut(void)
 {
 	IA_CSS_ENTER_PRIVATE("void");
 
-	sh_css_params_free_gdc_lut(default_gdc_lut);
-	default_gdc_lut = mmgr_NULL;
+	if (default_gdc_lut != mmgr_NULL) {
+		hmm_free(default_gdc_lut);
+		default_gdc_lut = mmgr_NULL;
+	}
 
 	IA_CSS_LEAVE_PRIVATE("void");
 }
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.h b/drivers/staging/media/atomisp/pci/sh_css_params.h
index 62a7b6ada237..bbca19d0e8fc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.h
@@ -121,8 +121,6 @@ struct ia_css_isp_parameters {
 	bool dvs2_coef_table_changed;
 	bool morph_table_changed;
 	bool sc_table_changed;
-	bool sc_table_dirty;
-	unsigned int sc_table_last_pipe_num;
 	bool anr_thres_changed;
 	/* ---- deprecated: replaced with pipe_dvs_6axis_config_changed ---- */
 	bool dvs_6axis_config_changed;
@@ -168,12 +166,6 @@ ia_css_params_alloc_convert_sctbl(
 struct ia_css_isp_config *
 sh_css_pipe_isp_config_get(struct ia_css_pipe *pipe);
 
-/* ipu address allocation/free for gdc lut */
-ia_css_ptr
-sh_css_params_alloc_gdc_lut(void);
-void
-sh_css_params_free_gdc_lut(ia_css_ptr addr);
-
 int
 sh_css_params_map_and_store_default_gdc_lut(void);
 
-- 
2.33.1

