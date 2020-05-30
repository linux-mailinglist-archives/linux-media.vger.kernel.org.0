Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4361E8E8A
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbgE3G5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:57:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728871AbgE3G4J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57D08221EF;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=kxbnh+AHRTOvRY1iUp5etxq7vK91dVI1mcWZd/pGJQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U6dqpeHINmZO5qpFXCZ9uBQVP80pZNehoDKvhHOoP1VkB3WhHXLeCBB5mg/PzEnic
         LlXH7lRuaBs1/t/0bB0cW6xyt1FxXl2ncNBZmWKu98NKb1EHZswW3hwYhaCibWExyp
         9eSL5pEq4SOTrfvb3TImJRli5zoU8JTIG8zq5Cj0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hqj-5n; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/41] media: atomisp: get rid of a bunch of other wrappers
Date:   Sat, 30 May 2020 08:55:50 +0200
Message-Id: <d3ef30d5f639c06a32f5a48093c6983f2b5c5090.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are too many wrapper functions at atomisp_compat_css20.c.

Get rid of another set of such wrappers.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 156 +++++-----
 .../media/atomisp/pci/atomisp_compat.h        |  79 -----
 .../media/atomisp/pci/atomisp_compat_css20.c  | 281 ------------------
 .../media/atomisp/pci/atomisp_compat_css20.h  |  12 -
 .../staging/media/atomisp/pci/atomisp_file.c  |   7 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   3 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  15 +-
 7 files changed, 93 insertions(+), 460 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 75cbc46f4a07..f3548e741cc5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1170,8 +1170,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 			atomisp_apply_css_parameters(asd,
 						     &asd->params.css_param);
 			if (asd->params.css_param.update_flag.dz_config)
-				atomisp_css_set_dz_config(asd,
-							  &asd->params.css_param.dz_config);
+				asd->params.config.dz_config = &asd->params.css_param.dz_config;
 			/* New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
@@ -1262,9 +1261,15 @@ void atomisp_delayed_init_work(struct work_struct *work)
 	 */
 	if (!ATOMISP_USE_YUVPP(asd)) {
 		struct v4l2_event event = {0};
+		struct ia_css_stream *stream;
 
-		atomisp_css_allocate_continuous_frames(false, asd);
-		atomisp_css_update_continuous_frames(asd);
+		stream = asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream;
+
+
+		if (ia_css_alloc_continuous_frame_remain(stream))
+			return;
+
+		ia_css_update_continuous_frames(stream);
 
 		event.type = V4L2_EVENT_ATOMISP_RAW_BUFFERS_ALLOC_DONE;
 		v4l2_event_queue(asd->subdev.devnode, &event);
@@ -1823,7 +1828,8 @@ void atomisp_setup_flash(struct atomisp_sub_device *asd)
 			return;
 		}
 
-		atomisp_css_request_flash(asd);
+		ia_css_stream_request_flash(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream);
+
 		asd->params.flash_state = ATOMISP_FLASH_ONGOING;
 	} else {
 		asd->params.flash_state = ATOMISP_FLASH_IDLE;
@@ -2107,10 +2113,9 @@ int atomisp_gdc_cac(struct atomisp_sub_device *asd, int flag,
 
 	asd->params.gdc_cac_en = !!*value;
 	if (asd->params.gdc_cac_en) {
-		atomisp_css_set_morph_table(asd,
-					    asd->params.css_param.morph_table);
+		asd->params.config.morph_table = asd->params.css_param.morph_table;
 	} else {
-		atomisp_css_set_morph_table(asd, NULL);
+		asd->params.config.morph_table = NULL;
 	}
 	asd->params.css_update_params_needed = true;
 	atomisp_update_capture_mode(asd);
@@ -2164,7 +2169,7 @@ int atomisp_nr(struct atomisp_sub_device *asd, int flag,
 		/* Set nr config to isp parameters */
 		memcpy(&asd->params.css_param.nr_config, arg,
 		       sizeof(struct ia_css_nr_config));
-		atomisp_css_set_nr_config(asd, &asd->params.css_param.nr_config);
+		asd->params.config.nr_config = &asd->params.css_param.nr_config;
 		asd->params.css_update_params_needed = true;
 	}
 	return 0;
@@ -2185,7 +2190,7 @@ int atomisp_tnr(struct atomisp_sub_device *asd, int flag,
 		/* Set tnr config to isp parameters */
 		memcpy(&asd->params.css_param.tnr_config, config,
 		       sizeof(struct ia_css_tnr_config));
-		atomisp_css_set_tnr_config(asd, &asd->params.css_param.tnr_config);
+		asd->params.config.tnr_config = &asd->params.css_param.tnr_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -2206,7 +2211,7 @@ int atomisp_black_level(struct atomisp_sub_device *asd, int flag,
 		/* Set ob config to isp parameters */
 		memcpy(&asd->params.css_param.ob_config, config,
 		       sizeof(struct ia_css_ob_config));
-		atomisp_css_set_ob_config(asd, &asd->params.css_param.ob_config);
+		asd->params.config.ob_config = &asd->params.css_param.ob_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -2227,7 +2232,7 @@ int atomisp_ee(struct atomisp_sub_device *asd, int flag,
 		/* Set ee config to isp parameters */
 		memcpy(&asd->params.css_param.ee_config, config,
 		       sizeof(asd->params.css_param.ee_config));
-		atomisp_css_set_ee_config(asd, &asd->params.css_param.ee_config);
+		asd->params.config.ee_config = &asd->params.css_param.ee_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -2248,7 +2253,7 @@ int atomisp_gamma(struct atomisp_sub_device *asd, int flag,
 		/* Set gamma table to isp parameters */
 		memcpy(&asd->params.css_param.gamma_table, config,
 		       sizeof(asd->params.css_param.gamma_table));
-		atomisp_css_set_gamma_table(asd, &asd->params.css_param.gamma_table);
+		asd->params.config.gamma_table = &asd->params.css_param.gamma_table;
 	}
 
 	return 0;
@@ -2288,7 +2293,7 @@ int atomisp_gamma_correction(struct atomisp_sub_device *asd, int flag,
 		/* Set gamma correction params to isp parameters */
 		memcpy(&asd->params.css_param.gc_config, config,
 		       sizeof(asd->params.css_param.gc_config));
-		atomisp_css_set_gc_config(asd, &asd->params.css_param.gc_config);
+		asd->params.config.gc_config = &asd->params.css_param.gc_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -2309,7 +2314,7 @@ int atomisp_formats(struct atomisp_sub_device *asd, int flag,
 		/* Set narrow gamma flag to isp parameters */
 		memcpy(&asd->params.css_param.formats_config, config,
 		       sizeof(asd->params.css_param.formats_config));
-		atomisp_css_set_formats_config(asd, &asd->params.css_param.formats_config);
+		asd->params.config.formats_config = &asd->params.css_param.formats_config;
 	}
 
 	return 0;
@@ -2320,7 +2325,7 @@ void atomisp_free_internal_buffers(struct atomisp_sub_device *asd)
 	atomisp_free_css_parameters(&asd->params.css_param);
 
 	if (asd->raw_output_frame) {
-		atomisp_css_frame_free(asd->raw_output_frame);
+		ia_css_frame_free(asd->raw_output_frame);
 		asd->raw_output_frame = NULL;
 	}
 }
@@ -2472,7 +2477,7 @@ int atomisp_gdc_cac_table(struct atomisp_sub_device *asd, int flag,
 		}
 		asd->params.css_param.morph_table = tab;
 		if (asd->params.gdc_cac_en)
-			atomisp_css_set_morph_table(asd, tab);
+			asd->params.config.morph_table = tab;
 	}
 
 	return 0;
@@ -2514,7 +2519,7 @@ int atomisp_macc_table(struct atomisp_sub_device *asd, int flag,
 		memcpy(macc_table, &config->table,
 		       sizeof(struct ia_css_macc_table));
 		if (config->color_effect == asd->params.color_effect)
-			atomisp_css_set_macc_table(asd, macc_table);
+			asd->params.config.macc_table = macc_table;
 	}
 
 	return 0;
@@ -3151,84 +3156,82 @@ void atomisp_apply_css_parameters(
     struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
-		atomisp_css_set_wb_config(asd, &css_param->wb_config);
+		asd->params.config.wb_config = &css_param->wb_config;
 
 	if (css_param->update_flag.ob_config)
-		atomisp_css_set_ob_config(asd, &css_param->ob_config);
+		asd->params.config.ob_config = &css_param->ob_config;
 
 	if (css_param->update_flag.dp_config)
-		atomisp_css_set_dp_config(asd, &css_param->dp_config);
+		asd->params.config.dp_config = &css_param->dp_config;
 
 	if (css_param->update_flag.nr_config)
-		atomisp_css_set_nr_config(asd, &css_param->nr_config);
+		asd->params.config.nr_config = &css_param->nr_config;
 
 	if (css_param->update_flag.ee_config)
-		atomisp_css_set_ee_config(asd, &css_param->ee_config);
+		asd->params.config.ee_config = &css_param->ee_config;
 
 	if (css_param->update_flag.tnr_config)
-		atomisp_css_set_tnr_config(asd, &css_param->tnr_config);
+		asd->params.config.tnr_config = &css_param->tnr_config;
 
 	if (css_param->update_flag.a3a_config)
-		atomisp_css_set_3a_config(asd, &css_param->s3a_config);
+		asd->params.config.s3a_config = &css_param->s3a_config;
 
 	if (css_param->update_flag.ctc_config)
-		atomisp_css_set_ctc_config(asd, &css_param->ctc_config);
+		asd->params.config.ctc_config = &css_param->ctc_config;
 
 	if (css_param->update_flag.cnr_config)
-		atomisp_css_set_cnr_config(asd, &css_param->cnr_config);
+		asd->params.config.cnr_config = &css_param->cnr_config;
 
 	if (css_param->update_flag.ecd_config)
-		atomisp_css_set_ecd_config(asd, &css_param->ecd_config);
+		asd->params.config.ecd_config = &css_param->ecd_config;
 
 	if (css_param->update_flag.ynr_config)
-		atomisp_css_set_ynr_config(asd, &css_param->ynr_config);
+		asd->params.config.ynr_config = &css_param->ynr_config;
 
 	if (css_param->update_flag.fc_config)
-		atomisp_css_set_fc_config(asd, &css_param->fc_config);
+		asd->params.config.fc_config = &css_param->fc_config;
 
 	if (css_param->update_flag.macc_config)
-		atomisp_css_set_macc_config(asd, &css_param->macc_config);
+		asd->params.config.macc_config = &css_param->macc_config;
 
 	if (css_param->update_flag.aa_config)
-		atomisp_css_set_aa_config(asd, &css_param->aa_config);
+		asd->params.config.aa_config = &css_param->aa_config;
 
 	if (css_param->update_flag.anr_config)
-		atomisp_css_set_anr_config(asd, &css_param->anr_config);
+		asd->params.config.anr_config = &css_param->anr_config;
 
 	if (css_param->update_flag.xnr_config)
-		atomisp_css_set_xnr_config(asd, &css_param->xnr_config);
+		asd->params.config.xnr_config = &css_param->xnr_config;
 
 	if (css_param->update_flag.yuv2rgb_cc_config)
-		atomisp_css_set_yuv2rgb_cc_config(asd,
-						  &css_param->yuv2rgb_cc_config);
+		asd->params.config.yuv2rgb_cc_config = &css_param->yuv2rgb_cc_config;
 
 	if (css_param->update_flag.rgb2yuv_cc_config)
-		atomisp_css_set_rgb2yuv_cc_config(asd,
-						  &css_param->rgb2yuv_cc_config);
+		asd->params.config.rgb2yuv_cc_config = &css_param->rgb2yuv_cc_config;
 
 	if (css_param->update_flag.macc_table)
-		atomisp_css_set_macc_table(asd, &css_param->macc_table);
+		asd->params.config.macc_table = &css_param->macc_table;
 
 	if (css_param->update_flag.xnr_table)
-		atomisp_css_set_xnr_table(asd, &css_param->xnr_table);
+		asd->params.config.xnr_table = &css_param->xnr_table;
 
 	if (css_param->update_flag.r_gamma_table)
-		atomisp_css_set_r_gamma_table(asd, &css_param->r_gamma_table);
+		asd->params.config.r_gamma_table = &css_param->r_gamma_table;
 
 	if (css_param->update_flag.g_gamma_table)
-		atomisp_css_set_g_gamma_table(asd, &css_param->g_gamma_table);
+		asd->params.config.g_gamma_table = &css_param->g_gamma_table;
 
 	if (css_param->update_flag.b_gamma_table)
-		atomisp_css_set_b_gamma_table(asd, &css_param->b_gamma_table);
+		asd->params.config.b_gamma_table = &css_param->b_gamma_table;
 
 	if (css_param->update_flag.anr_thres)
 		atomisp_css_set_anr_thres(asd, &css_param->anr_thres);
 
 	if (css_param->update_flag.shading_table)
-		atomisp_css_set_shading_table(asd, css_param->shading_table);
+		asd->params.config.shading_table = css_param->shading_table;
 
 	if (css_param->update_flag.morph_table && asd->params.gdc_cac_en)
-		atomisp_css_set_morph_table(asd, css_param->morph_table);
+		asd->params.config.morph_table = css_param->morph_table;
 
 	if (css_param->update_flag.dvs2_coefs) {
 		struct ia_css_dvs_grid_info *dvs_grid_info =
@@ -4363,18 +4366,18 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 	    asd->params.color_effect != V4L2_COLORFX_BW) {
 		memcpy(&asd->params.css_param.cc_config, &config->cc_config,
 		       sizeof(struct ia_css_cc_config));
-		atomisp_css_set_cc_config(asd, &asd->params.css_param.cc_config);
+		asd->params.config.cc_config = &asd->params.css_param.cc_config;
 	}
 
-	atomisp_css_set_wb_config(asd, &asd->params.css_param.wb_config);
-	atomisp_css_set_ob_config(asd, &asd->params.css_param.ob_config);
-	atomisp_css_set_de_config(asd, &asd->params.css_param.de_config);
-	atomisp_css_set_dz_config(asd, &asd->params.css_param.dz_config);
-	atomisp_css_set_ce_config(asd, &asd->params.css_param.ce_config);
-	atomisp_css_set_dp_config(asd, &asd->params.css_param.dp_config);
-	atomisp_css_set_nr_config(asd, &asd->params.css_param.nr_config);
-	atomisp_css_set_ee_config(asd, &asd->params.css_param.ee_config);
-	atomisp_css_set_tnr_config(asd, &asd->params.css_param.tnr_config);
+	asd->params.config.wb_config = &asd->params.css_param.wb_config;
+	asd->params.config.ob_config = &asd->params.css_param.ob_config;
+	asd->params.config.de_config = &asd->params.css_param.de_config;
+	asd->params.config.dz_config = &asd->params.css_param.dz_config;
+	asd->params.config.ce_config = &asd->params.css_param.ce_config;
+	asd->params.config.dp_config = &asd->params.css_param.dp_config;
+	asd->params.config.nr_config = &asd->params.css_param.nr_config;
+	asd->params.config.ee_config = &asd->params.css_param.ee_config;
+	asd->params.config.tnr_config = &asd->params.css_param.tnr_config;
 	asd->params.css_update_params_needed = true;
 
 	return 0;
@@ -4463,9 +4466,9 @@ int atomisp_color_effect(struct atomisp_sub_device *asd, int flag,
 	atomisp_update_capture_mode(asd);
 
 	if (cc_config)
-		atomisp_css_set_cc_config(asd, cc_config);
+		asd->params.config.cc_config = cc_config;
 	if (macc_table)
-		atomisp_css_set_macc_table(asd, macc_table);
+		asd->params.config.macc_table = macc_table;
 	if (ctc_table)
 		atomisp_css_set_ctc_table(asd, ctc_table);
 	asd->params.color_effect = (u32)*effect;
@@ -4502,7 +4505,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 		/* Set bad pixel to isp parameters */
 		memcpy(&asd->params.css_param.dp_config, config,
 		       sizeof(asd->params.css_param.dp_config));
-		atomisp_css_set_dp_config(asd, &asd->params.css_param.dp_config);
+		asd->params.config.dp_config = &asd->params.css_param.dp_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -4595,7 +4598,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	/* Note: the padded width on an ia_css_frame is in elements, not in
 	   bytes. The RAW frame we use here should always be a 16bit RAW
 	   frame. This is why we bytesperline/2 is equal to the padded with */
-	if (atomisp_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
+	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
 		goto err;
@@ -4619,7 +4622,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 
 err:
 	if (ret && res)
-		atomisp_css_frame_free(res);
+		ia_css_frame_free(res);
 	if (tmp_buf)
 		vfree(tmp_buf);
 	if (ret == 0)
@@ -4642,10 +4645,12 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_device *asd,
 	ret = atomisp_v4l2_framebuffer_to_css_frame(arg, &raw_black_frame);
 	if (ret)
 		return ret;
-	if (atomisp_css_set_black_frame(asd, raw_black_frame))
-		ret = -ENOMEM;
 
-	atomisp_css_frame_free(raw_black_frame);
+	if (sh_css_set_black_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
+				   raw_black_frame) != 0)
+		return -ENOMEM;
+
+	ia_css_frame_free(raw_black_frame);
 	return ret;
 }
 
@@ -4663,10 +4668,10 @@ int atomisp_false_color(struct atomisp_sub_device *asd, int flag,
 
 	/* Set nr config to isp parameters */
 	if (*value) {
-		atomisp_css_set_default_de_config(asd);
+		asd->params.config.de_config = NULL;
 	} else {
 		asd->params.css_param.de_config.pixelnoise = 0;
-		atomisp_css_set_de_config(asd, &asd->params.css_param.de_config);
+		asd->params.config.de_config = &asd->params.css_param.de_config;
 	}
 	asd->params.css_update_params_needed = true;
 	asd->params.false_color = *value;
@@ -4687,7 +4692,7 @@ int atomisp_false_color_param(struct atomisp_sub_device *asd, int flag,
 		/* Set false color to isp parameters */
 		memcpy(&asd->params.css_param.de_config, config,
 		       sizeof(asd->params.css_param.de_config));
-		atomisp_css_set_de_config(asd, &asd->params.css_param.de_config);
+		asd->params.config.de_config = &asd->params.css_param.de_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -4708,7 +4713,7 @@ int atomisp_white_balance_param(struct atomisp_sub_device *asd, int flag,
 		/* Set white balance to isp parameters */
 		memcpy(&asd->params.css_param.wb_config, config,
 		       sizeof(asd->params.css_param.wb_config));
-		atomisp_css_set_wb_config(asd, &asd->params.css_param.wb_config);
+		asd->params.config.wb_config = &asd->params.css_param.wb_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -4730,7 +4735,7 @@ int atomisp_3a_config_param(struct atomisp_sub_device *asd, int flag,
 		/* Set white balance to isp parameters */
 		memcpy(&asd->params.css_param.s3a_config, config,
 		       sizeof(asd->params.css_param.s3a_config));
-		atomisp_css_set_3a_config(asd, &asd->params.css_param.s3a_config);
+		asd->params.config.s3a_config = &asd->params.css_param.s3a_config;
 		asd->params.css_update_params_needed = true;
 	}
 
@@ -5191,7 +5196,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 				      configure_pp_input_nop;
 	u16 stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
 	const struct atomisp_in_fmt_conv *fc;
-	int ret;
+	int ret, i;
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
@@ -5288,8 +5293,9 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	}
 
 	atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
-	atomisp_css_disable_vf_pp(asd,
-				  asd->vfpp->val != ATOMISP_VFPP_ENABLE);
+
+	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
+		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].pipe_extra_configs[i].disable_vf_pp = asd->vfpp->val != ATOMISP_VFPP_ENABLE;
 
 	/* ISP2401 new input system need to use copy pipe */
 	if (asd->copy_mode) {
@@ -5434,12 +5440,12 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	atomisp_update_grid_info(asd, pipe_id, source_pad);
 
 	/* Free the raw_dump buffer first */
-	atomisp_css_frame_free(asd->raw_output_frame);
+	ia_css_frame_free(asd->raw_output_frame);
 	asd->raw_output_frame = NULL;
 
 	if (!asd->continuous_mode->val &&
 	    !asd->params.online_process && !isp->sw_contex.file_input &&
-	    atomisp_css_frame_allocate_from_info(&asd->raw_output_frame,
+	    ia_css_frame_allocate_from_info(&asd->raw_output_frame,
 		    raw_output_info))
 		return -ENOMEM;
 
@@ -6086,7 +6092,7 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 		return -EINVAL;
 
 	if (!user_shading_table->enable) {
-		atomisp_css_set_shading_table(asd, NULL);
+		asd->params.config.shading_table = NULL;
 		asd->params.sc_en = false;
 		return 0;
 	}
@@ -6131,7 +6137,7 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 
 	free_table = asd->params.css_param.shading_table;
 	asd->params.css_param.shading_table = shading_table;
-	atomisp_css_set_shading_table(asd, shading_table);
+	asd->params.config.shading_table = shading_table;
 	asd->params.sc_en = true;
 
 out:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 87677e1117ff..2a4d1b469ebf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -243,30 +243,6 @@ int atomisp_css_input_configure_port(struct atomisp_sub_device *asd,
 				     unsigned int metadata_width,
 				     unsigned int metadata_height);
 
-int atomisp_css_frame_allocate(struct ia_css_frame **frame,
-			       unsigned int width, unsigned int height,
-			       enum ia_css_frame_format format,
-			       unsigned int padded_width,
-			       unsigned int raw_bit_depth);
-
-int atomisp_css_frame_allocate_from_info(struct ia_css_frame **frame,
-	const struct ia_css_frame_info *info);
-
-void atomisp_css_frame_free(struct ia_css_frame *frame);
-
-int atomisp_css_frame_map(struct ia_css_frame **frame,
-			  const struct ia_css_frame_info *info,
-			  const void __user *data, uint16_t attribute,
-			  unsigned int pgnr);
-
-int atomisp_css_set_black_frame(struct atomisp_sub_device *asd,
-				const struct ia_css_frame *raw_black_frame);
-
-int atomisp_css_allocate_continuous_frames(bool init_time,
-	struct atomisp_sub_device *asd);
-
-void atomisp_css_update_continuous_frames(struct atomisp_sub_device *asd);
-
 void atomisp_create_pipes_stream(struct atomisp_sub_device *asd);
 void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd);
 
@@ -277,9 +253,6 @@ int atomisp_css_continuous_set_num_raw_frames(
     struct atomisp_sub_device *asd,
     int num_frames);
 
-void atomisp_css_disable_vf_pp(struct atomisp_sub_device *asd,
-			       bool disable);
-
 int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 				      unsigned int stream_index,
 				      unsigned int width, unsigned int height,
@@ -388,61 +361,9 @@ int atomisp_css_exp_id_unlock(struct atomisp_sub_device *asd, int exp_id);
 int atomisp_css_capture_enable_xnr(struct atomisp_sub_device *asd,
 				   bool enable);
 
-void atomisp_css_send_input_frame(struct atomisp_sub_device *asd,
-				  unsigned short *data, unsigned int width,
-				  unsigned int height);
-
-bool atomisp_css_isp_has_started(void);
-
-void atomisp_css_request_flash(struct atomisp_sub_device *asd);
-
-void atomisp_css_set_wb_config(struct atomisp_sub_device *asd,
-			       struct ia_css_wb_config *wb_config);
-
-void atomisp_css_set_ob_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ob_config *ob_config);
-
-void atomisp_css_set_dp_config(struct atomisp_sub_device *asd,
-			       struct ia_css_dp_config *dp_config);
-
-void atomisp_css_set_de_config(struct atomisp_sub_device *asd,
-			       struct ia_css_de_config *de_config);
-
-void atomisp_css_set_dz_config(struct atomisp_sub_device *asd,
-			       struct ia_css_dz_config *dz_config);
-
-void atomisp_css_set_default_de_config(struct atomisp_sub_device *asd);
-
-void atomisp_css_set_ce_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ce_config *ce_config);
-
-void atomisp_css_set_nr_config(struct atomisp_sub_device *asd,
-			       struct ia_css_nr_config *nr_config);
-
-void atomisp_css_set_ee_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ee_config *ee_config);
-
-void atomisp_css_set_tnr_config(struct atomisp_sub_device *asd,
-				struct ia_css_tnr_config *tnr_config);
-
-void atomisp_css_set_cc_config(struct atomisp_sub_device *asd,
-			       struct ia_css_cc_config *cc_config);
-
-void atomisp_css_set_macc_table(struct atomisp_sub_device *asd,
-				struct ia_css_macc_table *macc_table);
-
-void atomisp_css_set_gamma_table(struct atomisp_sub_device *asd,
-				 struct ia_css_gamma_table *gamma_table);
-
 void atomisp_css_set_ctc_table(struct atomisp_sub_device *asd,
 			       struct ia_css_ctc_table *ctc_table);
 
-void atomisp_css_set_gc_config(struct atomisp_sub_device *asd,
-			       struct ia_css_gc_config *gc_config);
-
-void atomisp_css_set_3a_config(struct atomisp_sub_device *asd,
-			       struct ia_css_3a_config *s3a_config);
-
 void atomisp_css_video_set_dis_vector(struct atomisp_sub_device *asd,
 				      struct atomisp_dis_vector *vector);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 3dc5c4eeb8d3..76e5eda0a8a8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2099,72 +2099,6 @@ int atomisp_css_input_configure_port(
 	return 0;
 }
 
-int atomisp_css_frame_allocate(struct ia_css_frame **frame,
-			       unsigned int width, unsigned int height,
-			       enum ia_css_frame_format format,
-			       unsigned int padded_width,
-			       unsigned int raw_bit_depth)
-{
-	if (ia_css_frame_allocate(frame, width, height, format,
-				  padded_width, raw_bit_depth) != 0)
-		return -ENOMEM;
-
-	return 0;
-}
-
-int atomisp_css_frame_allocate_from_info(struct ia_css_frame **frame,
-	const struct ia_css_frame_info *info)
-{
-	if (ia_css_frame_allocate_from_info(frame, info))
-		return -ENOMEM;
-
-	return 0;
-}
-
-void atomisp_css_frame_free(struct ia_css_frame *frame)
-{
-	ia_css_frame_free(frame);
-}
-
-int atomisp_css_frame_map(struct ia_css_frame **frame,
-			  const struct ia_css_frame_info *info,
-			  const void __user *data, uint16_t attribute,
-			  unsigned int pgnr)
-{
-	if (ia_css_frame_map(frame, info, data, attribute, pgnr)
-	    != 0)
-		return -ENOMEM;
-
-	return 0;
-}
-
-int atomisp_css_set_black_frame(struct atomisp_sub_device *asd,
-				const struct ia_css_frame *raw_black_frame)
-{
-	if (sh_css_set_black_frame(
-		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
-		raw_black_frame) != 0)
-		return -ENOMEM;
-
-	return 0;
-}
-
-int atomisp_css_allocate_continuous_frames(bool init_time,
-	struct atomisp_sub_device *asd)
-{
-	if (ia_css_alloc_continuous_frame_remain(
-		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream)
-	    != 0)
-		return -EINVAL;
-	return 0;
-}
-
-void atomisp_css_update_continuous_frames(struct atomisp_sub_device *asd)
-{
-	ia_css_update_continuous_frames(
-	    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream);
-}
-
 int atomisp_css_stop(struct atomisp_sub_device *asd,
 		     enum ia_css_pipe_id pipe_id, bool in_reset)
 {
@@ -2287,16 +2221,6 @@ int atomisp_css_continuous_set_num_raw_frames(
 	return 0;
 }
 
-void atomisp_css_disable_vf_pp(struct atomisp_sub_device *asd,
-			       bool disable)
-{
-	int i;
-
-	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
-		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
-		.pipe_extra_configs[i].disable_vf_pp = !!disable;
-}
-
 static enum ia_css_pipe_mode __pipe_id_to_pipe_mode(
     struct atomisp_sub_device *asd,
     enum ia_css_pipe_id pipe_id)
@@ -3298,199 +3222,6 @@ int atomisp_css_capture_enable_xnr(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-void atomisp_css_send_input_frame(struct atomisp_sub_device *asd,
-				  unsigned short *data, unsigned int width,
-				  unsigned int height)
-{
-	ia_css_stream_send_input_frame(
-	    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
-	    data, width, height);
-}
-
-bool atomisp_css_isp_has_started(void)
-{
-	return ia_css_isp_has_started();
-}
-
-void atomisp_css_request_flash(struct atomisp_sub_device *asd)
-{
-	ia_css_stream_request_flash(
-	    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream);
-}
-
-void atomisp_css_set_wb_config(struct atomisp_sub_device *asd,
-			       struct ia_css_wb_config *wb_config)
-{
-	asd->params.config.wb_config = wb_config;
-}
-
-void atomisp_css_set_ob_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ob_config *ob_config)
-{
-	asd->params.config.ob_config = ob_config;
-}
-
-void atomisp_css_set_dp_config(struct atomisp_sub_device *asd,
-			       struct ia_css_dp_config *dp_config)
-{
-	asd->params.config.dp_config = dp_config;
-}
-
-void atomisp_css_set_de_config(struct atomisp_sub_device *asd,
-			       struct ia_css_de_config *de_config)
-{
-	asd->params.config.de_config = de_config;
-}
-
-void atomisp_css_set_dz_config(struct atomisp_sub_device *asd,
-			       struct ia_css_dz_config *dz_config)
-{
-	asd->params.config.dz_config = dz_config;
-}
-
-void atomisp_css_set_default_de_config(struct atomisp_sub_device *asd)
-{
-	asd->params.config.de_config = NULL;
-}
-
-void atomisp_css_set_ce_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ce_config *ce_config)
-{
-	asd->params.config.ce_config = ce_config;
-}
-
-void atomisp_css_set_nr_config(struct atomisp_sub_device *asd,
-			       struct ia_css_nr_config *nr_config)
-{
-	asd->params.config.nr_config = nr_config;
-}
-
-void atomisp_css_set_ee_config(struct atomisp_sub_device *asd,
-			       struct ia_css_ee_config *ee_config)
-{
-	asd->params.config.ee_config = ee_config;
-}
-
-void atomisp_css_set_tnr_config(struct atomisp_sub_device *asd,
-				struct ia_css_tnr_config *tnr_config)
-{
-	asd->params.config.tnr_config = tnr_config;
-}
-
-void atomisp_css_set_cc_config(struct atomisp_sub_device *asd,
-			       struct ia_css_cc_config *cc_config)
-{
-	asd->params.config.cc_config = cc_config;
-}
-
-void atomisp_css_set_macc_table(struct atomisp_sub_device *asd,
-				struct ia_css_macc_table *macc_table)
-{
-	asd->params.config.macc_table = macc_table;
-}
-
-void atomisp_css_set_macc_config(struct atomisp_sub_device *asd,
-				 struct ia_css_macc_config *macc_config)
-{
-	asd->params.config.macc_config = macc_config;
-}
-
-void atomisp_css_set_ecd_config(struct atomisp_sub_device *asd,
-				struct ia_css_ecd_config *ecd_config)
-{
-	asd->params.config.ecd_config = ecd_config;
-}
-
-void atomisp_css_set_ynr_config(struct atomisp_sub_device *asd,
-				struct ia_css_ynr_config *ynr_config)
-{
-	asd->params.config.ynr_config = ynr_config;
-}
-
-void atomisp_css_set_fc_config(struct atomisp_sub_device *asd,
-			       struct ia_css_fc_config *fc_config)
-{
-	asd->params.config.fc_config = fc_config;
-}
-
-void atomisp_css_set_ctc_config(struct atomisp_sub_device *asd,
-				struct ia_css_ctc_config *ctc_config)
-{
-	asd->params.config.ctc_config = ctc_config;
-}
-
-void atomisp_css_set_cnr_config(struct atomisp_sub_device *asd,
-				struct ia_css_cnr_config *cnr_config)
-{
-	asd->params.config.cnr_config = cnr_config;
-}
-
-void atomisp_css_set_aa_config(struct atomisp_sub_device *asd,
-			       struct ia_css_aa_config *aa_config)
-{
-	asd->params.config.aa_config = aa_config;
-}
-
-void atomisp_css_set_baa_config(struct atomisp_sub_device *asd,
-				struct ia_css_aa_config *baa_config)
-{
-	asd->params.config.baa_config = baa_config;
-}
-
-void atomisp_css_set_anr_config(struct atomisp_sub_device *asd,
-				struct ia_css_anr_config *anr_config)
-{
-	asd->params.config.anr_config = anr_config;
-}
-
-void atomisp_css_set_xnr_config(struct atomisp_sub_device *asd,
-				struct ia_css_xnr_config *xnr_config)
-{
-	asd->params.config.xnr_config = xnr_config;
-}
-
-void atomisp_css_set_yuv2rgb_cc_config(struct atomisp_sub_device *asd,
-				       struct ia_css_cc_config *yuv2rgb_cc_config)
-{
-	asd->params.config.yuv2rgb_cc_config = yuv2rgb_cc_config;
-}
-
-void atomisp_css_set_rgb2yuv_cc_config(struct atomisp_sub_device *asd,
-				       struct ia_css_cc_config *rgb2yuv_cc_config)
-{
-	asd->params.config.rgb2yuv_cc_config = rgb2yuv_cc_config;
-}
-
-void atomisp_css_set_xnr_table(struct atomisp_sub_device *asd,
-			       struct ia_css_xnr_table *xnr_table)
-{
-	asd->params.config.xnr_table = xnr_table;
-}
-
-void atomisp_css_set_r_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *r_gamma_table)
-{
-	asd->params.config.r_gamma_table = r_gamma_table;
-}
-
-void atomisp_css_set_g_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *g_gamma_table)
-{
-	asd->params.config.g_gamma_table = g_gamma_table;
-}
-
-void atomisp_css_set_b_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *b_gamma_table)
-{
-	asd->params.config.b_gamma_table = b_gamma_table;
-}
-
-void atomisp_css_set_gamma_table(struct atomisp_sub_device *asd,
-				 struct ia_css_gamma_table *gamma_table)
-{
-	asd->params.config.gamma_table = gamma_table;
-}
-
 void atomisp_css_set_ctc_table(struct atomisp_sub_device *asd,
 			       struct ia_css_ctc_table *ctc_table)
 {
@@ -3530,18 +3261,6 @@ void atomisp_css_set_dvs_6axis(struct atomisp_sub_device *asd,
 	asd->params.config.dvs_6axis_config = dvs_6axis;
 }
 
-void atomisp_css_set_gc_config(struct atomisp_sub_device *asd,
-			       struct ia_css_gc_config *gc_config)
-{
-	asd->params.config.gc_config = gc_config;
-}
-
-void atomisp_css_set_3a_config(struct atomisp_sub_device *asd,
-			       struct ia_css_3a_config *s3a_config)
-{
-	asd->params.config.s3a_config = s3a_config;
-}
-
 void atomisp_css_video_set_dis_vector(struct atomisp_sub_device *asd,
 				      struct atomisp_dis_vector *vector)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index e8b330dacba9..05f0d6aa72d1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -140,18 +140,6 @@ void atomisp_css_set_yuv2rgb_cc_config(struct atomisp_sub_device *asd,
 void atomisp_css_set_rgb2yuv_cc_config(struct atomisp_sub_device *asd,
 				       struct ia_css_cc_config *rgb2yuv_cc_config);
 
-void atomisp_css_set_xnr_table(struct atomisp_sub_device *asd,
-			       struct ia_css_xnr_table *xnr_table);
-
-void atomisp_css_set_r_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *r_gamma_table);
-
-void atomisp_css_set_g_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *g_gamma_table);
-
-void atomisp_css_set_b_gamma_table(struct atomisp_sub_device *asd,
-				   struct ia_css_rgb_gamma_table *b_gamma_table);
-
 void atomisp_css_set_anr_thres(struct atomisp_sub_device *asd,
 			       struct ia_css_anr_thres *anr_thres);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_file.c b/drivers/staging/media/atomisp/pci/atomisp_file.c
index 4ab0390316cf..ac2da7c34645 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_file.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_file.c
@@ -50,11 +50,12 @@ static void file_work(struct work_struct *work)
 						V4L2_SUBDEV_FORMAT_ACTIVE,
 						ATOMISP_SUBDEV_PAD_SINK);
 
-	while (!atomisp_css_isp_has_started())
+	while (!ia_css_isp_has_started())
 		usleep_range(1000, 1500);
 
-	atomisp_css_send_input_frame(asd, buf, isp_sink_fmt.width,
-				     isp_sink_fmt.height);
+	ia_css_stream_send_input_frame(asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream,
+				       buf, isp_sink_fmt.width,
+				       isp_sink_fmt.height);
 	dev_dbg(isp->dev, "<%s: streaming done\n", __func__);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 3e5806403b31..8d85b3884ed2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -252,8 +252,7 @@ int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 				err = atomisp_calculate_real_zoom_region(asd,
 					&param->params.dz_config, css_pipe_id);
 				if (!err)
-					atomisp_css_set_dz_config(asd,
-								  &param->params.dz_config);
+					asd->params.config.dz_config = &param->params.dz_config;
 			}
 			atomisp_css_set_isp_config_applied_frame(asd,
 				vm_mem->vaddr);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index e5ade03e4749..72c953a6116e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -891,7 +891,7 @@ void atomisp_videobuf_free_buf(struct videobuf_buffer *vb)
 
 	vm_mem = vb->priv;
 	if (vm_mem && vm_mem->vaddr) {
-		atomisp_css_frame_free(vm_mem->vaddr);
+		ia_css_frame_free(vm_mem->vaddr);
 		vm_mem->vaddr = NULL;
 	}
 }
@@ -1067,7 +1067,7 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 	 * memory management function
 	 */
 	for (i = 0; i < req->count; i++) {
-		if (atomisp_css_frame_allocate_from_info(&frame, &frame_info))
+		if (ia_css_frame_allocate_from_info(&frame, &frame_info))
 			goto error;
 		vm_mem = pipe->capq.bufs[i]->priv;
 		vm_mem->vaddr = frame;
@@ -1078,11 +1078,11 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 error:
 	while (i--) {
 		vm_mem = pipe->capq.bufs[i]->priv;
-		atomisp_css_frame_free(vm_mem->vaddr);
+		ia_css_frame_free(vm_mem->vaddr);
 	}
 
 	if (asd->vf_frame)
-		atomisp_css_frame_free(asd->vf_frame);
+		ia_css_frame_free(asd->vf_frame);
 
 	return -ENOMEM;
 }
@@ -1200,7 +1200,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			goto error;
 		}
 
-		ret = atomisp_css_frame_map(&handle, &frame_info,
+		ret = ia_css_frame_map(&handle, &frame_info,
 					    (void __user *)buf->m.userptr,
 					    0, pgnr);
 		if (ret) {
@@ -1210,7 +1210,7 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 
 		if (vm_mem->vaddr) {
 			mutex_lock(&pipe->capq.vb_lock);
-			atomisp_css_frame_free(vm_mem->vaddr);
+			ia_css_frame_free(vm_mem->vaddr);
 			vm_mem->vaddr = NULL;
 			vb->state = VIDEOBUF_NEEDS_INIT;
 			mutex_unlock(&pipe->capq.vb_lock);
@@ -1758,8 +1758,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 	if (asd->params.css_update_params_needed) {
 		atomisp_apply_css_parameters(asd, &asd->params.css_param);
 		if (asd->params.css_param.update_flag.dz_config)
-			atomisp_css_set_dz_config(asd,
-						  &asd->params.css_param.dz_config);
+			asd->params.config.dz_config = &asd->params.css_param.dz_config;
 		atomisp_css_update_isp_params(asd);
 		asd->params.css_update_params_needed = false;
 		memset(&asd->params.css_param.update_flag, 0,
-- 
2.26.2

