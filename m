Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F1935FACD
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 20:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352228AbhDNS2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 14:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352047AbhDNS2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 14:28:23 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A844BC061574;
        Wed, 14 Apr 2021 11:28:00 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id h3so9625322qve.13;
        Wed, 14 Apr 2021 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=bkCnPyijGf6102CFQmgNiT4dWq+AxqQZ3pCXHQt/lVg=;
        b=ZyrnoXw5aVY1+QnuIab4bxD9nixmwCdalQ7qXLu7Wdqooi+qUA+6mNn5bpKWgMHQqJ
         9b00u29jLXEfIkQ64RLQMZittvOdDsPFt+tnDx4ObSmVX3gUHrR4aA1A8nERSckqdqjb
         x2g2au8KXlgmyV7eFyi+6NnMbu/JZdj9c25t/UI5p/1rRzs9cqfxgMox95ELo90qwN8u
         GYvFFtcakH4aFCcMFOiCfFIPRmotJ5NZS3bjZ+nvEwoPaZZqghBFoXyC+C0sCnDxib33
         QK0VsIFFukTqSs8ppzQX3MBJSeeBMP05aGNQ2mn//Ak5HlYpsnt1Xt+qm5aBGbbX88sH
         7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=bkCnPyijGf6102CFQmgNiT4dWq+AxqQZ3pCXHQt/lVg=;
        b=ijvChJt4KC6F8upa3V3bZ3cPTo1dehuvK8qHqwHAmCuWTHP3+STEuMKIdwlbTrA+0n
         N76zppccHmhyyi6eJ+e89toipJJ7Go3gL9RVYrO6aOlkOWMGolVPt4RnEP4p/70DmFIX
         jWfLqfXbytq7NzaS3ADPn1I3rBCtmMsYI15rksx6TN2lEFvhZ5aASsGo37vJaWSKorul
         OMv1sRo8MFGN2bvq+er4fa1AjvjRf9Sc6nFvSJep+lvndf0y39PGAgq49qMLij4YFGMn
         Lpe7+T86x3yxqm7oI4JB9GncMJ0z3e0FKbGLct1VRhQNFXbB4lIeqWPC7958xsZAGHl+
         3P7g==
X-Gm-Message-State: AOAM533gblGzPKq5tUl33FWHi2nfr4/IgOiVGoFUAnWLtJ+r4f4yjKEo
        IUeCzDUt7aDqCjeGtps8eE8=
X-Google-Smtp-Source: ABdhPJydNHvwLG2pBRGn58y3bPBoq+CHxSSDYQKn9vyjLDFQp1IVCID8JMaSE135IR3ivRZfd/n/MQ==
X-Received: by 2002:a05:6214:165:: with SMTP id y5mr39309142qvs.59.1618424879314;
        Wed, 14 Apr 2021 11:27:59 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:66e0:478a:8197:7396])
        by smtp.gmail.com with ESMTPSA id v6sm143429qkf.132.2021.04.14.11.27.58
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 11:27:58 -0700 (PDT)
Date:   Wed, 14 Apr 2021 15:27:55 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: atomisp: pci: Format multi-line comments
 according to coding-style in file atomisp_cmd.c
Message-ID: <20210414182755.GA2799@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format multi-line comments according to the coding-style.
Issue detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 109 ++++++++++++++----------
 1 file changed, 65 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea99..6113785 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -67,7 +67,8 @@
  * At 15fps this means 133ms. We set the timeout a bit longer.
  * Each flash driver is supposed to set its own timeout, but
  * just in case someone else changed the timeout, we set it
- * here to make sure we don't damage the flash hardware. */
+ * here to make sure we don't damage the flash hardware.
+ */
 #define FLASH_TIMEOUT 800 /* ms */
 
 union host {
@@ -562,7 +563,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 			 * and driver needs to keep old sequence_temp value.
 			 * NOTE: There is assumption here that ISP will not
 			 * start processing next frame from sensor before old
-			 * one is completely done. */
+			 * one is completely done.
+			 */
 			if (atomic_read(&asd->sequence) == atomic_read(
 				&asd->sequence_temp))
 				atomic_set(&asd->sequence_temp,
@@ -1247,7 +1249,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 	if (IS_ISP2401) {
 		/* If there are no buffers queued then
-		* delete wdt timer. */
+		 * delete wdt timer.
+		 */
 		if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
 			return;
 		if (!atomisp_buffers_queued_pipe(pipe))
@@ -1312,10 +1315,10 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
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
@@ -2350,8 +2353,9 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id, source_pad))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/* We must free all buffers because
+	 * they no longer match the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, stream_id);
@@ -2364,7 +2368,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -2766,9 +2771,10 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		return -EINVAL;
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
-		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		/* If the grid info in the argument differs
+		 * from the current grid info, we tell the
+		 * caller to reset the grid size and try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2822,16 +2828,18 @@ int atomisp_get_metadata(struct atomisp_sub_device *asd, int flag,
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
+	/* We always return the resolution and stride even if there
+	 * is no valid metadata. This allows the caller to get the
+	 * information needed to allocate user-space buffers.
+	 */
 	md->width  = stream_info->metadata_info.resolution.width;
 	md->height = stream_info->metadata_info.resolution.height;
 	md->stride = stream_info->metadata_info.stride;
 
 	/* sanity check to avoid writing into unallocated memory.
 	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
+	 * for applications to detect that metadata is not enabled.
+	 */
 	if (md->width == 0 || md->height == 0 || !md->data)
 		return 0;
 
@@ -2898,16 +2906,18 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 	stream_info = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		      stream_info;
 
-	/* We always return the resolution and stride even if there is
-	 * no valid metadata. This allows the caller to get the information
-	 * needed to allocate user-space buffers. */
+	/* We always return the resolution and stride even if there
+	 * is no valid metadata. This allows the caller to get the
+	 * information needed to allocate user-space buffers.
+	 */
 	md->width  = stream_info->metadata_info.resolution.width;
 	md->height = stream_info->metadata_info.resolution.height;
 	md->stride = stream_info->metadata_info.stride;
 
 	/* sanity check to avoid writing into unallocated memory.
 	 * This does not return an error because it is a valid way
-	 * for applications to detect that metadata is not enabled. */
+	 * for applications to detect that metadata is not enabled.
+	 */
 	if (md->width == 0 || md->height == 0 || !md->data)
 		return 0;
 
@@ -3705,9 +3715,10 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/* If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3761,9 +3772,10 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/* If the grid info in the argument differs
+			 * from the current grid info, we tell the
+			 * caller to reset the grid size and try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -4184,8 +4196,8 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 }
 
 /*
-* Function to configure ISP parameters
-*/
+ * Function to configure ISP parameters
+ */
 int atomisp_set_parameters(struct video_device *vdev,
 			   struct atomisp_parameters *arg)
 {
@@ -4289,9 +4301,10 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		atomisp_curr_user_grid_info(asd, &config->info);
 
-		/* We always return the resolution and stride even if there is
-		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		/* We always return the resolution and stride even if there
+		 * is no valid metadata. This allows the caller to get the
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -4561,8 +4574,9 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 		return bytesperline / 2;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
-	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	/* The following cases could be removed, but we leave
+	 * them in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -4599,8 +4613,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -5017,8 +5032,9 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		    asd->stream_env[stream_id].isys_info[1].height);
 	}
 
-	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	/* Compatibility for sensors which provide no media bus
+	 * code in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -5255,7 +5271,8 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		}
 
 		/* FIXME: proper format name for this one. See
-		   atomisp_output_fmts[] in atomisp_v4l2.c */
+		 * atomisp_output_fmts[] in atomisp_v4l2.c
+		 */
 		vf_ffmt.code = V4L2_MBUS_FMT_CUSTOM_YUV420;
 
 		atomisp_subdev_set_selection(&asd->subdev, fh.pad,
@@ -5410,8 +5427,9 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (asd->continuous_mode->val &&
 	    (configure_pp_input == atomisp_css_preview_configure_pp_input ||
 	     configure_pp_input == atomisp_css_video_configure_pp_input)) {
-		/* for isp 2.2, configure pp input is available for continuous
-		 * mode */
+		/* for isp 2.2, configure pp input is
+		 * available for continuous mode
+		 */
 		ret = configure_pp_input(asd, isp_sink_crop->width,
 					 isp_sink_crop->height);
 		if (ret) {
@@ -5893,7 +5911,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
 	    (atomisp_subdev_format_conversion(asd, source_pad) &&
@@ -5960,7 +5979,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		 * GMIN to work around a CTS failures (GMINL-539)
 		 * which appears to be related by a hardware
 		 * performance limitation.  It's unclear why this
-		 * particular code triggers the issue. */
+		 * particular code triggers the issue.
+		 */
 		if (!IS_ISP2401 || crop_needs_override) {
 			if (isp_sink_crop.width * main_compose.height >
 			    isp_sink_crop.height * main_compose.width) {
@@ -6275,7 +6295,8 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
 			}
 
 			/* TODO: this can be removed once user-space
-			 *       has been updated to use control API */
+			 *       has been updated to use control API
+			 */
 			asd->continuous_raw_buffer_size->val =
 			    max_t(int,
 				  asd->continuous_raw_buffer_size->val,
-- 
2.7.4

