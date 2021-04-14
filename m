Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2619635FCD2
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 22:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234277AbhDNUnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 16:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhDNUnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 16:43:10 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996B4C061574;
        Wed, 14 Apr 2021 13:42:48 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id d15so9956661qkc.9;
        Wed, 14 Apr 2021 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=P1OjxNhc4TTVruP2t3RM+caNB6aEdRIHfFu/PSKa/mc=;
        b=DOjNJXLhnSy8I/Vw2pYfzmSz89ggJy1MOXG/UmUxWayUNCn5AF8dRqrtgdYAIyoOp5
         m0Qzndqw2pbfolFqnFXiAXIDsNLJbl3HSDYfUINf2Moc2sPs36pKZPWyh2leNphAOw5i
         gVsHbdg4ArYQIhhyjKw2iwLn045qv2qicHxPKHw5j+a3P+ffwaFlypPauCwZ7KUygN0p
         oofvcXoF/bF0n74MAoeq5HkVyLfJk09SPp83yG9BI0WDhJr6epHLMwwpABv/HyJ0ji7e
         R4rj4hZtMqMHaK7zDK/5Kvp2JG1kP2Kea72StsgluaMDyQ1VPBPl1M/+L/y1egf2prk3
         WYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=P1OjxNhc4TTVruP2t3RM+caNB6aEdRIHfFu/PSKa/mc=;
        b=a0hnR+5sAQOIxEpJf0g79cl7PLJ6nsq9dePD2Jk8BNyNZtDO1whFAPB7JNcz8dc+jS
         slq2Leh1y8pXSVtYbHPll9uwV7U9vUNsVzh4eeJKqb1+/QoM/Qy2VHf1UuombjPpeSIm
         HSzGI7+A2gx0Dxj9RKQXqa76aUzueArTlg0Bm9fMHx+fexXxT0i9xpARKgD8lmWGghFb
         GK/8B/U+0ZX8bAwVEmAhXoueYg26v+WiThMnB8QxFqbYs060/JlQmqYFHe6rG0ns7tKG
         38M90BOAkZ+CTSoU1dpgWR6vqpmn/cXPEG+7FYEkZi6ub6G/jPkvd3qAl9bLs4V6rLGs
         Y3dw==
X-Gm-Message-State: AOAM530BVpDae3L5rlWecfGOiADprggGB0ChyoiBItPaoqbAeqpEBqQz
        a4zpXMGXpzjxBXBvX3uuRcQ=
X-Google-Smtp-Source: ABdhPJxPElEv2EwC16X4DOa0C/c56IqgWfoKIDRKrjB/n+WcSjZyR9QjdQ/aUl6zaxOGbntITM0qjw==
X-Received: by 2002:a37:f505:: with SMTP id l5mr227005qkk.382.1618432967464;
        Wed, 14 Apr 2021 13:42:47 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id i6sm455330qkf.96.2021.04.14.13.42.46
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 13:42:46 -0700 (PDT)
Date:   Wed, 14 Apr 2021 17:42:44 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: atomisp: pci: Format comments according
 to coding-style in file atomisp_cmd.c
Message-ID: <20210414204244.GA8287@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format all comments according to the coding-style.
Issue detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Stantardize all the multi-line and single-line comments
  
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 377 +++++++++++-------------
 1 file changed, 169 insertions(+), 208 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea99..abc17ec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -63,11 +63,13 @@
 #include "ia_css_debug.h"
 #include "bits.h"
 
-/* We should never need to run the flash for more than 2 frames.
+/*
+ * We should never need to run the flash for more than 2 frames.
  * At 15fps this means 133ms. We set the timeout a bit longer.
  * Each flash driver is supposed to set its own timeout, but
  * just in case someone else changed the timeout, we set it
- * here to make sure we don't damage the flash hardware. */
+ * here to make sure we don't damage the flash hardware.
+ */
 #define FLASH_TIMEOUT 800 /* ms */
 
 union host {
@@ -90,18 +92,14 @@ struct camera_mipi_info *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd)
 	return (struct camera_mipi_info *)v4l2_get_subdev_hostdata(sd);
 }
 
-/*
- * get struct atomisp_video_pipe from v4l2 video_device
- */
+/* get struct atomisp_video_pipe from v4l2 video_device */
 struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev)
 {
 	return (struct atomisp_video_pipe *)
 	       container_of(dev, struct atomisp_video_pipe, vdev);
 }
 
-/*
- * get struct atomisp_acc_pipe from v4l2 video_device
- */
+/* get struct atomisp_acc_pipe from v4l2 video_device */
 struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device *dev)
 {
 	return (struct atomisp_acc_pipe *)
@@ -269,7 +267,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 			    ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE;
 	}
 
-	/* search for the target frequency by looping freq rules*/
+	/* search for the target frequency by looping freq rules */
 	for (i = 0; i < dfs->dfs_table_size; i++) {
 		if (curr_rules.width != dfs->dfs_table[i].width &&
 		    dfs->dfs_table[i].width != ISP_FREQ_RULE_ANY)
@@ -307,9 +305,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	return ret;
 }
 
-/*
- * reset and restore ISP
- */
+/* reset and restore ISP */
 int atomisp_reset(struct atomisp_device *isp)
 {
 	/* Reset ISP by power-cycling it */
@@ -338,9 +334,7 @@ int atomisp_reset(struct atomisp_device *isp)
 	return ret;
 }
 
-/*
- * interrupt disable functions
- */
+/* interrupt disable functions */
 static void disable_isp_irq(enum hrt_isp_css_irq irq)
 {
 	irq_disable_channel(IRQ0_ID, irq);
@@ -351,9 +345,7 @@ static void disable_isp_irq(enum hrt_isp_css_irq irq)
 	cnd_sp_irq_enable(SP0_ID, false);
 }
 
-/*
- * interrupt clean function
- */
+/* interrupt clean function */
 static void clear_isp_irq(enum hrt_isp_css_irq irq)
 {
 	irq_clear_all(IRQ0_ID);
@@ -514,7 +506,7 @@ __get_asd_from_port(struct atomisp_device *isp, enum mipi_port_id port)
 	return NULL;
 }
 
-/* interrupt handling function*/
+/* interrupt handling function */
 irqreturn_t atomisp_isr(int irq, void *dev)
 {
 	struct atomisp_device *isp = (struct atomisp_device *)dev;
@@ -555,14 +547,16 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 			atomic_inc(&asd->sof_count);
 			atomisp_sof_event(asd);
 
-			/* If sequence_temp and sequence are the same
+			/*
+			 * If sequence_temp and sequence are the same
 			 * there where no frames lost so we can increase
 			 * sequence_temp.
 			 * If not then processing of frame is still in progress
 			 * and driver needs to keep old sequence_temp value.
 			 * NOTE: There is assumption here that ISP will not
 			 * start processing next frame from sensor before old
-			 * one is completely done. */
+			 * one is completely done.
+			 */
 			if (atomic_read(&asd->sequence) == atomic_read(
 				&asd->sequence_temp))
 				atomic_set(&asd->sequence_temp,
@@ -812,9 +806,7 @@ static struct atomisp_video_pipe *__atomisp_get_pipe(
 		 */
 		return &asd->video_out_video_capture;
 	} else if (css_pipe_id == IA_CSS_PIPE_ID_YUVPP) {
-		/*
-		 * to SOC camera, yuvpp pipe is run for capture/video/SDV/ZSL.
-		 */
+		/* to SOC camera, yuvpp pipe is run for capture/video/SDV/ZSL. */
 		if (asd->continuous_mode->val) {
 			if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 				/* SDV case */
@@ -1009,7 +1001,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		if (!frame->valid)
 			error = true;
 
-		/* FIXME:
+		/*
+		 * FIXME:
 		 * YUVPP doesn't set postview exp_id correctlly in SDV mode.
 		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
 		 */
@@ -1070,7 +1063,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		if (!frame->valid)
 			error = true;
 
-		/* FIXME:
+		/*
+		 * FIXME:
 		 * YUVPP doesn't set preview exp_id correctlly in ZSL mode.
 		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
 		 */
@@ -1181,7 +1175,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 						     &asd->params.css_param);
 			if (asd->params.css_param.update_flag.dz_config)
 				asd->params.config.dz_config = &asd->params.css_param.dz_config;
-			/* New global dvs 6axis config should be blocked
+			/*
+			 * New global dvs 6axis config should be blocked
 			 * here if there's a buffer with per-frame parameters
 			 * pending in CSS frame buffer queue.
 			 * This is to aviod zooming vibration since global
@@ -1194,7 +1189,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 							  asd->params.dvs_6axis);
 			else
 				asd->params.css_update_params_needed = false;
-			/* The update flag should not be cleaned here
+			/*
+			 * The update flag should not be cleaned here
 			 * since it is still going to be used to make up
 			 * following per-frame parameters.
 			 * This will introduce more copy work since each
@@ -1214,7 +1210,7 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 	if (vb) {
 		vb->ts = ktime_get_ns();
 		vb->field_count = atomic_read(&asd->sequence) << 1;
-		/*mark videobuffer done for dequeue*/
+		/* mark videobuffer done for dequeue */
 		spin_lock_irqsave(&pipe->irq_lock, irqflags);
 		vb->state = !error ? VIDEOBUF_DONE : VIDEOBUF_ERROR;
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
@@ -1246,8 +1242,10 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		atomisp_qbuffers_to_css(asd);
 
 	if (IS_ISP2401) {
-		/* If there are no buffers queued then
-		* delete wdt timer. */
+		/*
+		 * If there are no buffers queued then
+		 * delete wdt timer.
+		 */
 		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
 			return;
 		if (!atomisp_buffers_queued_pipe(pipe))
@@ -1264,9 +1262,7 @@ void atomisp_delayed_init_work(struct work_struct *work)
 	struct atomisp_sub_device *asd = container_of(work,
 					 struct atomisp_sub_device,
 					 delayed_init_work);
-	/*
-	 * to SOC camera, use yuvpp pipe and no support continuous mode.
-	 */
+	/* to SOC camera, use yuvpp pipe and no support continuous mode. */
 	if (!ATOMISP_USE_YUVPP(asd)) {
 		struct v4l2_event event = {0};
 		struct ia_css_stream *stream;
@@ -1312,10 +1308,10 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 			continue;
 
 		/*
-		* AtomISP::waitStageUpdate is blocked when WDT happens.
-		* By calling acc_done() for all loaded fw_handles,
-		* HAL will be unblocked.
-		*/
+		 * AtomISP::waitStageUpdate is blocked when WDT happens.
+		 * By calling acc_done() for all loaded fw_handles,
+		 * HAL will be unblocked.
+		 */
 		acc_pipe = asd->stream_env[i].pipes[IA_CSS_PIPE_ID_ACC];
 		if (acc_pipe) {
 			acc_pipeline = ia_css_pipe_get_pipeline(acc_pipe);
@@ -1593,8 +1589,8 @@ void atomisp_wdt_work(struct work_struct *work)
 			}
 		}
 
-		/*sh_css_dump_sp_state();*/
-		/*sh_css_dump_isp_state();*/
+		/* sh_css_dump_sp_state(); */
+		/* sh_css_dump_isp_state(); */
 	} else {
 		for (i = 0; i < isp->num_of_streams; i++) {
 			struct atomisp_sub_device *asd = &isp->asd[i];
@@ -1918,10 +1914,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
 	return IRQ_HANDLED;
 }
 
-/*
- * utils for buffer allocation/free
- */
-
+/* utils for buffer allocation/free */
 int atomisp_get_frame_pgnr(struct atomisp_device *isp,
 			   const struct ia_css_frame *frame, u32 *p_pgnr)
 {
@@ -1934,9 +1927,7 @@ int atomisp_get_frame_pgnr(struct atomisp_device *isp,
 	return 0;
 }
 
-/*
- * Get internal fmt according to V4L2 fmt
- */
+/* Get internal fmt according to V4L2 fmt */
 static enum ia_css_frame_format
 v4l2_fmt_to_sh_fmt(u32 fmt)
 {
@@ -1989,9 +1980,7 @@ v4l2_fmt_to_sh_fmt(u32 fmt)
 	}
 }
 
-/*
- * raw format match between SH format and V4L2 format
- */
+/* raw format match between SH format and V4L2 format */
 static int raw_output_format_match_input(u32 input, u32 output)
 {
 	if ((input == ATOMISP_INPUT_FORMAT_RAW_12) &&
@@ -2067,13 +2056,8 @@ bool atomisp_is_mbuscode_raw(uint32_t code)
 	return code >= 0x3000 && code < 0x4000;
 }
 
-/*
- * ISP features control function
- */
-
-/*
- * Set ISP capture mode based on current settings
- */
+/* ISP features control function */
+/* Set ISP capture mode based on current settings */
 static void atomisp_update_capture_mode(struct atomisp_sub_device *asd)
 {
 	if (asd->params.gdc_cac_en)
@@ -2131,9 +2115,7 @@ int atomisp_gdc_cac(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to enable/disable low light mode including ANR
- */
+/* Function to enable/disable low light mode including ANR */
 int atomisp_low_light(struct atomisp_sub_device *asd, int flag,
 		      __s32 *value)
 {
@@ -2164,9 +2146,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure bayer noise reduction
- */
+/* Function to configure bayer noise reduction */
 int atomisp_nr(struct atomisp_sub_device *asd, int flag,
 	       struct atomisp_nr_config *arg)
 {
@@ -2184,9 +2164,7 @@ int atomisp_nr(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure temporal noise reduction (TNR)
- */
+/* Function to configure temporal noise reduction (TNR) */
 int atomisp_tnr(struct atomisp_sub_device *asd, int flag,
 		struct atomisp_tnr_config *config)
 {
@@ -2206,9 +2184,7 @@ int atomisp_tnr(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure black level compensation
- */
+/* Function to configure black level compensation */
 int atomisp_black_level(struct atomisp_sub_device *asd, int flag,
 			struct atomisp_ob_config *config)
 {
@@ -2227,9 +2203,7 @@ int atomisp_black_level(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure edge enhancement
- */
+/* Function to configure edge enhancement */
 int atomisp_ee(struct atomisp_sub_device *asd, int flag,
 	       struct atomisp_ee_config *config)
 {
@@ -2248,9 +2222,7 @@ int atomisp_ee(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to update Gamma table for gamma, brightness and contrast config
- */
+/* Function to update Gamma table for gamma, brightness and contrast config */
 int atomisp_gamma(struct atomisp_sub_device *asd, int flag,
 		  struct atomisp_gamma_table *config)
 {
@@ -2268,9 +2240,7 @@ int atomisp_gamma(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to update Ctc table for Chroma Enhancement
- */
+/* Function to update Ctc table for Chroma Enhancement */
 int atomisp_ctc(struct atomisp_sub_device *asd, int flag,
 		struct atomisp_ctc_table *config)
 {
@@ -2288,9 +2258,7 @@ int atomisp_ctc(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to update gamma correction parameters
- */
+/* Function to update gamma correction parameters */
 int atomisp_gamma_correction(struct atomisp_sub_device *asd, int flag,
 			     struct atomisp_gc_config *config)
 {
@@ -2309,9 +2277,7 @@ int atomisp_gamma_correction(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to update narrow gamma flag
- */
+/* Function to update narrow gamma flag  */
 int atomisp_formats(struct atomisp_sub_device *asd, int flag,
 		    struct atomisp_formats_config *config)
 {
@@ -2350,8 +2316,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id, source_pad))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because
+	 * they no longer match the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, stream_id);
@@ -2363,8 +2331,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_alloc_3a_output_buf(asd)) {
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
-			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			/*
+			 * For SOC sensor happens s3a_output_bytes == 0,
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -2404,9 +2374,7 @@ int atomisp_compare_grid(struct atomisp_sub_device *asd,
 	return memcmp(atomgrid, &tmp, sizeof(tmp));
 }
 
-/*
- * Function to update Gdc table for gdc
- */
+/* Function to update Gdc table for gdc */
 int atomisp_gdc_cac_table(struct atomisp_sub_device *asd, int flag,
 			  struct atomisp_morph_table *config)
 {
@@ -2544,18 +2512,14 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-/*
- * Function to set/get image stablization statistics
- */
+/* Function to set/get image stablization statistics */
 int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 			 struct atomisp_dis_statistics *stats)
 {
 	return atomisp_css_get_dis_stat(asd, stats);
 }
 
-/*
- * Function  set camrea_prefiles.xml current sensor pixel array size
- */
+/* Function  set camrea_prefiles.xml current sensor pixel array size */
 int atomisp_set_array_res(struct atomisp_sub_device *asd,
 			  struct atomisp_resolution  *config)
 {
@@ -2570,9 +2534,7 @@ int atomisp_set_array_res(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-/*
- * Function to get DVS2 BQ resolution settings
- */
+/* Function to get DVS2 BQ resolution settings */
 int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
 				    struct atomisp_dvs2_bq_resolutions *bq_res)
 {
@@ -2630,7 +2592,8 @@ int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
 		unsigned int w_padding;
 		unsigned int gdc_effective_input = 0;
 
-		/* For GDC:
+		/*
+		 * For GDC:
 		 * gdc_effective_input = effective_input + envelope
 		 *
 		 * From the comment and formula in BZ1786,
@@ -2748,9 +2711,7 @@ int atomisp_set_dis_coefs(struct atomisp_sub_device *asd,
 	return atomisp_css_set_dis_coefs(asd, coefs);
 }
 
-/*
- * Function to set/get 3A stat from isp
- */
+/* Function to set/get 3A stat from isp */
 int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		    struct atomisp_3a_statistics *config)
 {
@@ -2766,9 +2727,11 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		return -EINVAL;
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
-		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		/*
+		 * If the grid info in the argument differs
+		 * from the current grid info, we tell the
+		 * caller to reset the grid size and try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2822,16 +2785,20 @@ int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
+	/*
+	 * We always return the resolution and stride even if there
+	 * is no valid metadata. This allows the caller to get the
+	 * information needed to allocate user-space buffers.
+	 */
 	md->width  = stream_info->metadata_info.resolution.width;
 	md->height = stream_info->metadata_info.resolution.height;
 	md->stride = stream_info->metadata_info.stride;
 
-	/* sanity check to avoid writing into unallocated memory.
+	/*
+	 * sanity check to avoid writing into unallocated memory.
 	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
+	 * for applications to detect that metadata is not enabled.
+	 */
 	if (md->width == 0 || md->height == 0 || !md->data)
 		return 0;
 
@@ -2898,16 +2865,20 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
+	/*
+	 * We always return the resolution and stride even if there
+	 * is no valid metadata. This allows the caller to get the
+	 * information needed to allocate user-space buffers.
+	 */
 	md->width  = stream_info->metadata_info.resolution.width;
 	md->height = stream_info->metadata_info.resolution.height;
 	md->stride = stream_info->metadata_info.stride;
 
-	/* sanity check to avoid writing into unallocated memory.
+	/*
+	 * sanity check to avoid writing into unallocated memory.
 	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
+	 * for applications to detect that metadata is not enabled.
+	 */
 	if (md->width == 0 || md->height == 0 || !md->data)
 		return 0;
 
@@ -2961,9 +2932,7 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to calculate real zoom region for every pipe
- */
+/* Function to calculate real zoom region for every pipe */
 int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 				       struct ia_css_dz_config   *dz_config,
 				       enum ia_css_pipe_id css_pipe_id)
@@ -3001,7 +2970,7 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	    == asd->sensor_array_res.width
 	    || dz_config->zoom_region.resolution.height
 	    == asd->sensor_array_res.height) {
-		/*no need crop region*/
+		/* no need crop region */
 		dz_config->zoom_region.origin.x = 0;
 		dz_config->zoom_region.origin.y = 0;
 		dz_config->zoom_region.resolution.width = eff_res.width;
@@ -3009,7 +2978,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 		return 0;
 	}
 
-	/* FIXME:
+	/*
+	 * FIXME:
 	 * This is not the correct implementation with Google's definition, due
 	 * to firmware limitation.
 	 * map real crop region base on above calculating base max crop region.
@@ -3116,9 +3086,7 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-/*
- * Function to check the zoom region whether is effective
- */
+/* Function to check the zoom region whether is effective */
 static bool atomisp_check_zoom_region(
     struct atomisp_sub_device *asd,
     struct ia_css_dz_config *dz_config)
@@ -3705,9 +3673,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3761,9 +3731,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -4183,9 +4155,7 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 	}
 }
 
-/*
-* Function to configure ISP parameters
-*/
+/* Function to configure ISP parameters */
 int atomisp_set_parameters(struct video_device *vdev,
 			   struct atomisp_parameters *arg)
 {
@@ -4271,9 +4241,7 @@ int atomisp_set_parameters(struct video_device *vdev,
 	return ret;
 }
 
-/*
- * Function to set/get isp parameters to isp
- */
+/* Function to set/get isp parameters to isp */
 int atomisp_param(struct atomisp_sub_device *asd, int flag,
 		  struct atomisp_parm *config)
 {
@@ -4289,9 +4257,11 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		atomisp_curr_user_grid_info(asd, &config->info);
 
-		/* We always return the resolution and stride even if there is
-		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		/*
+		 * We always return the resolution and stride even if there
+		 * is no valid metadata. This allows the caller to get the
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -4386,9 +4356,7 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure color effect of the image
- */
+/* Function to configure color effect of the image */
 int atomisp_color_effect(struct atomisp_sub_device *asd, int flag,
 			 __s32 *effect)
 {
@@ -4421,9 +4389,7 @@ int atomisp_color_effect(struct atomisp_sub_device *asd, int flag,
 	if (*effect == asd->params.color_effect)
 		return 0;
 
-	/*
-	 * isp_subdev->params.macc_en should be set to false.
-	 */
+	/* isp_subdev->params.macc_en should be set to false. */
 	asd->params.macc_en = false;
 
 	switch (*effect) {
@@ -4479,9 +4445,7 @@ int atomisp_color_effect(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure bad pixel correction
- */
+/* Function to configure bad pixel correction */
 int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 		      __s32 *value)
 {
@@ -4494,9 +4458,7 @@ int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure bad pixel correction params
- */
+/* Function to configure bad pixel correction params */
 int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 			    struct atomisp_dp_config *config)
 {
@@ -4515,9 +4477,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to enable/disable video image stablization
- */
+/* Function to enable/disable video image stablization */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
 {
@@ -4529,9 +4489,7 @@ int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure fixed pattern noise
- */
+/* Function to configure fixed pattern noise */
 int atomisp_fixed_pattern(struct atomisp_sub_device *asd, int flag,
 			  __s32 *value)
 {
@@ -4561,8 +4519,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 		return bytesperline / 2;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
-	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	/*
+	 * The following cases could be removed, but we leave
+	 * them in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -4598,9 +4558,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	padded_width = atomisp_bytesperline_to_padded_width(
 			   arg->fmt.bytesperline, sh_format);
 
-	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	/*
+	 * Note: the padded width on an ia_css_frame is in elements, not in
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -4633,9 +4595,7 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	return ret;
 }
 
-/*
- * Function to configure fixed pattern noise table
- */
+/* Function to configure fixed pattern noise table */
 int atomisp_fixed_pattern_table(struct atomisp_sub_device *asd,
 				struct v4l2_framebuffer *arg)
 {
@@ -4657,9 +4617,7 @@ int atomisp_fixed_pattern_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-/*
- * Function to configure false color correction
- */
+/* Function to configure false color correction */
 int atomisp_false_color(struct atomisp_sub_device *asd, int flag,
 			__s32 *value)
 {
@@ -4681,9 +4639,7 @@ int atomisp_false_color(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure bad pixel correction params
- */
+/* Function to configure bad pixel correction params */
 int atomisp_false_color_param(struct atomisp_sub_device *asd, int flag,
 			      struct atomisp_de_config *config)
 {
@@ -4702,9 +4658,7 @@ int atomisp_false_color_param(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to configure white balance params
- */
+/* Function to configure white balance params */
 int atomisp_white_balance_param(struct atomisp_sub_device *asd, int flag,
 				struct atomisp_wb_config *config)
 {
@@ -4746,9 +4700,7 @@ int atomisp_3a_config_param(struct atomisp_sub_device *asd, int flag,
 	return 0;
 }
 
-/*
- * Function to setup digital zoom
- */
+/* Function to setup digital zoom */
 int atomisp_digital_zoom(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
 {
@@ -4911,7 +4863,8 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_format *f,
 	    && snr_mbus_fmt->height < f->fmt.pix.height) {
 		f->fmt.pix.width = snr_mbus_fmt->width;
 		f->fmt.pix.height = snr_mbus_fmt->height;
-		/* Set the flag when resolution requested is
+		/*
+		 * Set the flag when resolution requested is
 		 * beyond the max value supported by sensor
 		 */
 		if (res_overflow)
@@ -5017,8 +4970,10 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		    asd->stream_env[stream_id].isys_info[1].height);
 	}
 
-	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	/*
+	 * Compatibility for sensors which provide no media bus
+	 * code in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -5254,8 +5209,10 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 			vf_size.height = 480;
 		}
 
-		/* FIXME: proper format name for this one. See
-		   atomisp_output_fmts[] in atomisp_v4l2.c */
+		/*
+		 * FIXME: proper format name for this one. See
+		 * atomisp_output_fmts[] in atomisp_v4l2.c
+		 */
 		vf_ffmt.code = V4L2_MBUS_FMT_CUSTOM_YUV420;
 
 		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
@@ -5344,7 +5301,8 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		configure_pp_input = atomisp_css_preview_configure_pp_input;
 		pipe_id = IA_CSS_PIPE_ID_PREVIEW;
 	} else {
-		/* CSS doesn't support low light mode on SOC cameras, so disable
+		/*
+		 * CSS doesn't support low light mode on SOC cameras, so disable
 		 * it. FIXME: if this is done elsewhere, it gives corrupted
 		 * colors into thumbnail image.
 		 */
@@ -5384,9 +5342,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		}
 	}
 
-	/*
-	 * to SOC camera, use yuvpp pipe.
-	 */
+	/* to SOC camera, use yuvpp pipe. */
 	if (ATOMISP_USE_YUVPP(asd))
 		pipe_id = IA_CSS_PIPE_ID_YUVPP;
 
@@ -5410,8 +5366,10 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (asd->continuous_mode->val &&
 	    (configure_pp_input == atomisp_css_preview_configure_pp_input ||
 	     configure_pp_input == atomisp_css_video_configure_pp_input)) {
-		/* for isp 2.2, configure pp input is available for continuous
-		 * mode */
+		/*
+		 * for isp 2.2, configure pp input is
+		 * available for continuous mode
+		 */
 		ret = configure_pp_input(asd, isp_sink_crop->width,
 					 isp_sink_crop->height);
 		if (ret) {
@@ -5885,22 +5843,25 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	}
 
 	atomisp_check_copy_mode(asd, source_pad, &backup_fmt);
-	asd->yuvpp_mode = false;			/* Reset variable */
+	asd->yuvpp_mode = false;	/* Reset variable */
 
 	isp_sink_crop = *atomisp_subdev_get_rect(&asd->subdev, NULL,
 			V4L2_SUBDEV_FORMAT_ACTIVE,
 			ATOMISP_SUBDEV_PAD_SINK,
 			V4L2_SEL_TGT_CROP);
 
-	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	/*
+	 * Try to enable YUV downscaling if ISP input is 10 % (either
+	 * width or height) bigger than the desired result.
+	 */
 	if (isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
 	    (atomisp_subdev_format_conversion(asd, source_pad) &&
 	     ((asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
 	       !asd->continuous_mode->val) ||
 	      asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER))) {
-		/* for continuous mode, preview size might be smaller than
+		/*
+		 * for continuous mode, preview size might be smaller than
 		 * still capture size. if preview size still needs crop,
 		 * pick the larger one between crop size of preview and
 		 * still capture.
@@ -5956,11 +5917,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		main_compose.width = f->fmt.pix.width;
 		main_compose.height = f->fmt.pix.height;
 
-		/* WORKAROUND: this override is universally enabled in
+		/*
+		 * WORKAROUND: this override is universally enabled in
 		 * GMIN to work around a CTS failures (GMINL-539)
 		 * which appears to be related by a hardware
 		 * performance limitation.  It's unclear why this
-		 * particular code triggers the issue. */
+		 * particular code triggers the issue.
+		 */
 		if (!IS_ISP2401 || crop_needs_override) {
 			if (isp_sink_crop.width * main_compose.height >
 			    isp_sink_crop.height * main_compose.width) {
@@ -6028,9 +5991,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 	pipe->capq.field = f->fmt.pix.field;
 
-	/*
-	 * If in video 480P case, no GFX throttle
-	 */
+	/* If in video 480P case, no GFX throttle */
 	if (asd->run_mode->val == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO &&
 	    f->fmt.pix.width == 720 && f->fmt.pix.height == 480)
 		isp->need_gfx_throttle = false;
@@ -6150,7 +6111,7 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-/*Turn off ISP dphy */
+/* Turn off ISP dphy */
 int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
@@ -6181,7 +6142,7 @@ int atomisp_ospm_dphy_down(struct atomisp_device *isp)
 	return 0;
 }
 
-/*Turn on ISP dphy */
+/* Turn on ISP dphy */
 int atomisp_ospm_dphy_up(struct atomisp_device *isp)
 {
 	unsigned long flags;
@@ -6237,9 +6198,9 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 	struct v4l2_ctrl *c;
 
 	/*
-	* In case of M10MO ZSL capture case, we need to issue a separate
-	* capture request to M10MO which will output captured jpeg image
-	*/
+	 * In case of M10MO ZSL capture case, we need to issue a separate
+	 * capture request to M10MO which will output captured jpeg image
+	 */
 	c = v4l2_ctrl_find(
 		asd->isp->inputs[asd->input_curr].camera->ctrl_handler,
 		V4L2_CID_START_ZSL_CAPTURE);
@@ -6274,8 +6235,10 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 				    ATOMISP_CSS2_NUM_OFFLINE_INIT_CONTINUOUS_FRAMES;
 			}
 
-			/* TODO: this can be removed once user-space
-			 *       has been updated to use control API */
+			/*
+			 * TODO: this can be removed once user-space
+			 *       has been updated to use control API
+			 */
 			asd->continuous_raw_buffer_size->val =
 			    max_t(int,
 				  asd->continuous_raw_buffer_size->val,
@@ -6294,9 +6257,7 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 	return 0;
 }
 
-/*
- * set auto exposure metering window to camera sensor
- */
+/* set auto exposure metering window to camera sensor */
 int atomisp_s_ae_window(struct atomisp_sub_device *asd,
 			struct atomisp_ae_window *arg)
 {
-- 
2.7.4

