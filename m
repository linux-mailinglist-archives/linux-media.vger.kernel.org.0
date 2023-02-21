Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1DAF69E2DD
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbjBUPAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjBUPAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9029D93D3
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4x6N2whcJOV+nra/btK61U4ViaLZtykMDude5qXOGL4=;
        b=DT2NhbIUJQEWY2RlwPOLHNELpipLAF2gs5q+TgIBraDqMlDFNplFvKngjM8639IwzstBoP
        PAGSIkCHZAzxKtRm8TwiSv740EZQXsSlS/xyhk15VEifNrk3bnFkjZR3nocUI7tCqoHdD6
        gf9ZUIog5jDtFxDgLFJn5sZPCj0/c9w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-yZN-1-bCOGeE6qIPUq48mw-1; Tue, 21 Feb 2023 09:59:25 -0500
X-MC-Unique: yZN-1-bCOGeE6qIPUq48mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D25F380611A;
        Tue, 21 Feb 2023 14:59:24 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0F62E2026D4B;
        Tue, 21 Feb 2023 14:59:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 02/10] media: atomisp: Remove continuous mode support
Date:   Tue, 21 Feb 2023 15:58:58 +0100
Message-Id: <20230221145906.8113-3-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Continues mode is a special mode where 2 /dev/video devices can be active
at the same time. Either the video-preview + video nodes or the
viewfinder (for still capture) + capture nodes.

For the video-preview + video-recording case modern userspace will
use a single stream multiplexed by pipewire.

The still-capture case is extra special only starting the preview
stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
ioctl to set things up followed by a second stream on to capture
the amount of configured still pictures. While running the sensor
at full resolution all the time. This case too is better handled
with dma-buf + GPU downscaling for the view-finder rather then all this
custom special code. Besises this the ioctl expects a bunch of special
non error checked conditions to be met otherwise things will crash/hang.

The continues mode also involves a special cases all over the code
getting in the way of further cleanups and simplifying the code to
using just 1 /dev/video# node. So lets remove it and the
related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.

Link: https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/include/linux/atomisp.h     |  23 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 574 ++----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   3 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  70 +--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  56 --
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  95 +--
 .../media/atomisp/pci/atomisp_subdev.c        |  32 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   4 -
 8 files changed, 79 insertions(+), 778 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index 1dc7ac2b90ba..290a6ed7237e 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -299,26 +299,6 @@ struct atomisp_3a_statistics {
 	u32 isp_config_id; /* isp config ID */
 };
 
-/**
- * struct atomisp_cont_capture_conf - continuous capture parameters
- * @num_captures: number of still images to capture
- * @skip_frames: number of frames to skip between 2 captures
- * @offset: offset in ring buffer to start capture
- *
- * For example, to capture 1 frame from past, current, and 1 from future
- * and skip one frame between each capture, parameters would be:
- * num_captures:3
- * skip_frames:1
- * offset:-2
- */
-
-struct atomisp_cont_capture_conf {
-	int num_captures;
-	unsigned int skip_frames;
-	int offset;
-	__u32 reserved[5];
-};
-
 struct atomisp_ae_window {
 	int x_left;
 	int x_right;
@@ -958,9 +938,6 @@ struct atomisp_sensor_ae_bracketing_lut {
 #define ATOMISP_IOC_S_PARAMETERS \
 	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters)
 
-#define ATOMISP_IOC_S_CONT_CAPTURE_CONFIG \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 33, struct atomisp_cont_capture_conf)
-
 #define ATOMISP_IOC_G_METADATA \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 34, struct atomisp_metadata)
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a89686ac2d97..fb8765fdefda 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -79,8 +79,6 @@ union host {
 	} ptr;
 };
 
-static int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id);
-
 /*
  * get sensor:dis71430/ov2720 related info from v4l2_subdev->priv data field.
  * subdev->priv is set in mrst.c
@@ -242,18 +240,6 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 	curr_rules.height = asd->fmt[asd->capture_pad].fmt.height;
 	curr_rules.fps = fps;
 	curr_rules.run_mode = asd->run_mode->val;
-	/*
-	 * For continuous mode, we need to make the capture setting applied
-	 * since preview mode, because there is no chance to do this when
-	 * starting image capture.
-	 */
-	if (asd->continuous_mode->val) {
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-			curr_rules.run_mode = ATOMISP_RUN_MODE_SDV;
-		else
-			curr_rules.run_mode =
-			    ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE;
-	}
 
 	/* search for the target frequency by looping freq rules*/
 	for (i = 0; i < dfs->dfs_table_size; i++) {
@@ -746,13 +732,7 @@ enum atomisp_metadata_type
 atomisp_get_metadata_type(struct atomisp_sub_device *asd,
 			  enum ia_css_pipe_id pipe_id)
 {
-	if (!asd->continuous_mode->val)
-		return ATOMISP_MAIN_METADATA;
-
-	if (pipe_id == IA_CSS_PIPE_ID_CAPTURE) /* online capture pipe */
-		return ATOMISP_SEC_METADATA;
-	else
-		return ATOMISP_MAIN_METADATA;
+	return ATOMISP_MAIN_METADATA;
 }
 
 void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
@@ -883,15 +863,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 		pipe = vb_to_pipe(&frame->vb.vb2_buf);
 
-		/* FIXME:
-		 * YUVPP doesn't set postview exp_id correctlly in SDV mode.
-		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
-		 */
-		if (IS_BYT && buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME &&
-		    asd->continuous_mode->val && ATOMISP_USE_YUVPP(asd))
-			frame->exp_id = (asd->postview_exp_id++) %
-					(ATOMISP_MAX_EXP_ID + 1);
-
 		dev_dbg(isp->dev, "%s: vf frame with exp_id %d is ready\n",
 			__func__, frame->exp_id);
 		if (asd->params.flash_state == ATOMISP_FLASH_ONGOING) {
@@ -908,18 +879,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 					__func__);
 		}
 		pipe->frame_config_id[frame->vb.vb2_buf.index] = frame->isp_config_id;
-		if (css_pipe_id == IA_CSS_PIPE_ID_CAPTURE &&
-		    asd->pending_capture_request > 0) {
-			err = atomisp_css_offline_capture_configure(asd,
-				asd->params.offline_parm.num_captures,
-				asd->params.offline_parm.skip_frames,
-				asd->params.offline_parm.offset);
-
-			asd->pending_capture_request--;
-
-			dev_dbg(isp->dev, "Trigger capture again for new buffer. err=%d\n",
-				err);
-		}
 		break;
 	case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 	case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
@@ -934,15 +893,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 		pipe = vb_to_pipe(&frame->vb.vb2_buf);
 
-		/* FIXME:
-		 * YUVPP doesn't set preview exp_id correctlly in ZSL mode.
-		 * This is a WORKAROUND to set exp_id. see HSDES-1503911606.
-		 */
-		if (IS_BYT && buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME &&
-		    asd->continuous_mode->val && ATOMISP_USE_YUVPP(asd))
-			frame->exp_id = (asd->preview_exp_id++) %
-					(ATOMISP_MAX_EXP_ID + 1);
-
 		dev_dbg(isp->dev, "%s: main frame with exp_id %d is ready\n",
 			__func__, frame->exp_id);
 
@@ -993,35 +943,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 
 		asd->params.last_frame_status = asd->frame_status[i];
 
-		if (asd->continuous_mode->val) {
-			if (css_pipe_id == IA_CSS_PIPE_ID_PREVIEW ||
-			    css_pipe_id == IA_CSS_PIPE_ID_VIDEO) {
-				asd->latest_preview_exp_id = frame->exp_id;
-			} else if (css_pipe_id ==
-				   IA_CSS_PIPE_ID_CAPTURE) {
-				if (asd->run_mode->val ==
-				    ATOMISP_RUN_MODE_VIDEO)
-					dev_dbg(isp->dev, "SDV capture raw buffer id: %u\n",
-						frame->exp_id);
-				else
-					dev_dbg(isp->dev, "ZSL capture raw buffer id: %u\n",
-						frame->exp_id);
-			}
-		}
-		/*
-		 * Only after enabled the raw buffer lock
-		 * and in continuous mode.
-		 * in preview/video pipe, each buffer will
-		 * be locked automatically, so record it here.
-		 */
-		if (((css_pipe_id == IA_CSS_PIPE_ID_PREVIEW) ||
-		     (css_pipe_id == IA_CSS_PIPE_ID_VIDEO)) &&
-		    asd->enable_raw_buffer_lock->val &&
-		    asd->continuous_mode->val) {
-			atomisp_set_raw_buffer_bitmap(asd, frame->exp_id);
-			WARN_ON(frame->exp_id > ATOMISP_MAX_EXP_ID);
-		}
-
 		if (asd->params.css_update_params_needed) {
 			atomisp_apply_css_parameters(asd,
 						     &asd->params.css_param);
@@ -1220,13 +1141,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		if (!stream_restart[i])
 			continue;
 
-		if (asd->continuous_mode->val &&
-		    asd->delayed_init == ATOMISP_DELAYED_INIT_NOT_QUEUED) {
-			reinit_completion(&asd->init_done);
-			asd->delayed_init = ATOMISP_DELAYED_INIT_QUEUED;
-			queue_work(asd->delayed_init_workq,
-				   &asd->delayed_init_work);
-		}
 		/*
 		 * dequeueing buffers is not needed. CSS will recycle
 		 * buffers that it has.
@@ -2027,132 +1941,27 @@ int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
 	bq_res->envelope_bq.width_bq = 0;
 	bq_res->envelope_bq.height_bq = 0;
 	/* the GDC input resolution */
-	if (!asd->continuous_mode->val) {
-		bq_res->source_bq.width_bq = bq_res->output_bq.width_bq +
-					     pipe_cfg->dvs_envelope.width / 2;
-		bq_res->source_bq.height_bq = bq_res->output_bq.height_bq +
-					      pipe_cfg->dvs_envelope.height / 2;
-		/*
-		 * Bad pixels caused by spatial filter processing
-		 * ISP filter resolution should be given by CSS/FW, but for now
-		 * there is not such API to query, and it is fixed value, so
-		 * hardcoded here.
-		 */
-		bq_res->ispfilter_bq.width_bq = 12 / 2;
-		bq_res->ispfilter_bq.height_bq = 12 / 2;
-		/* spatial filter shift, always 4 pixels */
-		bq_res->gdc_shift_bq.width_bq = 4 / 2;
-		bq_res->gdc_shift_bq.height_bq = 4 / 2;
-
-		if (asd->params.video_dis_en) {
-			bq_res->envelope_bq.width_bq = pipe_cfg->dvs_envelope.width
-						       / 2 - bq_res->ispfilter_bq.width_bq;
-			bq_res->envelope_bq.height_bq = pipe_cfg->dvs_envelope.height
-							/ 2 - bq_res->ispfilter_bq.height_bq;
-		}
-	} else {
-		unsigned int w_padding;
-		unsigned int gdc_effective_input = 0;
-
-		/* For GDC:
-		 * gdc_effective_input = effective_input + envelope
-		 *
-		 * From the comment and formula in BZ1786,
-		 * we see the source_bq should be:
-		 * effective_input / bayer_ds_ratio
-		 */
-		bq_res->source_bq.width_bq =
-		    (input_config->effective_res.width *
-		     pipe_cfg->bayer_ds_out_res.width /
-		     input_config->effective_res.width + 1) / 2;
-		bq_res->source_bq.height_bq =
-		    (input_config->effective_res.height *
-		     pipe_cfg->bayer_ds_out_res.height /
-		     input_config->effective_res.height + 1) / 2;
-
-		if (!asd->params.video_dis_en) {
-			/*
-			 * We adjust the ispfilter_bq to:
-			 * ispfilter_bq = 128/BDS
-			 * we still need firmware team to provide an offical
-			 * formula for SDV.
-			 */
-			bq_res->ispfilter_bq.width_bq = 128 *
-							pipe_cfg->bayer_ds_out_res.width /
-							input_config->effective_res.width / 2;
-			bq_res->ispfilter_bq.height_bq = 128 *
-							 pipe_cfg->bayer_ds_out_res.width /
-							 input_config->effective_res.width / 2;
-
-			if (IS_HWREVISION(asd->isp, ATOMISP_HW_REVISION_ISP2401)) {
-				/* No additional left padding for ISYS2401 */
-				bq_res->gdc_shift_bq.width_bq = 4 / 2;
-				bq_res->gdc_shift_bq.height_bq = 4 / 2;
-			} else {
-				/*
-				 * For the w_padding and gdc_shift_bq cacluation
-				 * Please see the BZ 1786 and 4358 for more info.
-				 * Just test that this formula can work now,
-				 * but we still have no offical formula.
-				 *
-				 * w_padding = ceiling(gdc_effective_input
-				 *             /128, 1) * 128 - effective_width
-				 * gdc_shift_bq = w_padding/BDS/2 + ispfilter_bq/2
-				 */
-				gdc_effective_input =
-				    input_config->effective_res.width +
-				    pipe_cfg->dvs_envelope.width;
-				w_padding = roundup(gdc_effective_input, 128) -
-					    input_config->effective_res.width;
-				w_padding = w_padding *
-					    pipe_cfg->bayer_ds_out_res.width /
-					    input_config->effective_res.width + 1;
-				w_padding = roundup(w_padding / 2, 1);
-
-				bq_res->gdc_shift_bq.width_bq = bq_res->ispfilter_bq.width_bq / 2
-								+ w_padding;
-				bq_res->gdc_shift_bq.height_bq = 4 / 2;
-			}
-		} else {
-			unsigned int dvs_w, dvs_h, dvs_w_max, dvs_h_max;
-
-			bq_res->ispfilter_bq.width_bq = 8 / 2;
-			bq_res->ispfilter_bq.height_bq = 8 / 2;
-
-			if (IS_HWREVISION(asd->isp, ATOMISP_HW_REVISION_ISP2401)) {
-				/* No additional left padding for ISYS2401 */
-				bq_res->gdc_shift_bq.width_bq = 4 / 2;
-				bq_res->gdc_shift_bq.height_bq = 4 / 2;
-			} else {
-				w_padding =
-				    roundup(input_config->effective_res.width, 128) -
-				    input_config->effective_res.width;
-				if (w_padding < 12)
-					w_padding = 12;
-				bq_res->gdc_shift_bq.width_bq = 4 / 2 +
-								((w_padding - 12) *
-								 pipe_cfg->bayer_ds_out_res.width /
-								 input_config->effective_res.width + 1) / 2;
-				bq_res->gdc_shift_bq.height_bq = 4 / 2;
-			}
+	bq_res->source_bq.width_bq = bq_res->output_bq.width_bq +
+				     pipe_cfg->dvs_envelope.width / 2;
+	bq_res->source_bq.height_bq = bq_res->output_bq.height_bq +
+				      pipe_cfg->dvs_envelope.height / 2;
+	/*
+	 * Bad pixels caused by spatial filter processing
+	 * ISP filter resolution should be given by CSS/FW, but for now
+	 * there is not such API to query, and it is fixed value, so
+	 * hardcoded here.
+	 */
+	bq_res->ispfilter_bq.width_bq = 12 / 2;
+	bq_res->ispfilter_bq.height_bq = 12 / 2;
+	/* spatial filter shift, always 4 pixels */
+	bq_res->gdc_shift_bq.width_bq = 4 / 2;
+	bq_res->gdc_shift_bq.height_bq = 4 / 2;
 
-			dvs_w = pipe_cfg->bayer_ds_out_res.width -
-				pipe_cfg->output_info[0].res.width;
-			dvs_h = pipe_cfg->bayer_ds_out_res.height -
-				pipe_cfg->output_info[0].res.height;
-			dvs_w_max = rounddown(
-					pipe_cfg->output_info[0].res.width / 5,
-					ATOM_ISP_STEP_WIDTH);
-			dvs_h_max = rounddown(
-					pipe_cfg->output_info[0].res.height / 5,
-					ATOM_ISP_STEP_HEIGHT);
-			bq_res->envelope_bq.width_bq =
-			    min((dvs_w / 2), (dvs_w_max / 2)) -
-			    bq_res->ispfilter_bq.width_bq;
-			bq_res->envelope_bq.height_bq =
-			    min((dvs_h / 2), (dvs_h_max / 2)) -
-			    bq_res->ispfilter_bq.height_bq;
-		}
+	if (asd->params.video_dis_en) {
+		bq_res->envelope_bq.width_bq = pipe_cfg->dvs_envelope.width / 2 -
+					       bq_res->ispfilter_bq.width_bq;
+		bq_res->envelope_bq.height_bq = pipe_cfg->dvs_envelope.height / 2 -
+						bq_res->ispfilter_bq.height_bq;
 	}
 
 	dev_dbg(asd->isp->dev,
@@ -3729,28 +3538,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 		}
 
 		/* update dvs envelop info */
-		if (!asd->continuous_mode->val) {
-			config->dvs_envelop.width = vp_cfg->dvs_envelope.width;
-			config->dvs_envelop.height =
-			    vp_cfg->dvs_envelope.height;
-		} else {
-			unsigned int dvs_w, dvs_h, dvs_w_max, dvs_h_max;
-
-			dvs_w = vp_cfg->bayer_ds_out_res.width -
-				vp_cfg->output_info[0].res.width;
-			dvs_h = vp_cfg->bayer_ds_out_res.height -
-				vp_cfg->output_info[0].res.height;
-			dvs_w_max = rounddown(
-					vp_cfg->output_info[0].res.width / 5,
-					ATOM_ISP_STEP_WIDTH);
-			dvs_h_max = rounddown(
-					vp_cfg->output_info[0].res.height / 5,
-					ATOM_ISP_STEP_HEIGHT);
-
-			config->dvs_envelop.width = min(dvs_w, dvs_w_max);
-			config->dvs_envelop.height = min(dvs_h, dvs_h_max);
-		}
-
+		config->dvs_envelop.width = vp_cfg->dvs_envelope.width;
+		config->dvs_envelop.height = vp_cfg->dvs_envelope.height;
 		return 0;
 	}
 
@@ -4417,43 +4206,6 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	return 0;
 }
 
-static int __enable_continuous_mode(struct atomisp_sub_device *asd,
-				    bool enable)
-{
-	struct atomisp_device *isp = asd->isp;
-
-	dev_dbg(isp->dev,
-		"continuous mode %d, raw buffers %d, stop preview %d\n",
-		enable, asd->continuous_raw_buffer_size->val,
-		!asd->continuous_viewfinder->val);
-
-	if (!IS_ISP2401)
-		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_PRIMARY);
-	else
-		atomisp_update_capture_mode(asd);
-
-	/* in case of ANR, force capture pipe to offline mode */
-	atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
-					  asd->params.low_light ? false : !enable);
-	atomisp_css_preview_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
-					  !enable);
-	atomisp_css_enable_continuous(asd, enable);
-	atomisp_css_enable_cvf(asd, asd->continuous_viewfinder->val);
-
-	atomisp_css_continuous_set_num_raw_frames(asd,
-		asd->continuous_raw_buffer_size->val);
-
-	if (!enable) {
-		atomisp_css_enable_raw_binning(asd, false);
-		atomisp_css_input_set_two_pixels_per_clock(asd, false);
-	}
-
-	if (isp->inputs[asd->input_curr].type != FILE_INPUT)
-		atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
-
-	return atomisp_update_run_mode(asd);
-}
-
 static int configure_pp_input_nop(struct atomisp_sub_device *asd,
 				  unsigned int width, unsigned int height)
 {
@@ -4495,17 +4247,6 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 	else
 		atomisp_css_input_set_two_pixels_per_clock(asd, true);
 
-	if (asd->continuous_mode->val) {
-		/* Note for all checks: ffmt includes pad_w+pad_h */
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
-		    (ffmt->width >= 2048 || ffmt->height >= 1536)) {
-			/*
-			 * For preview pipe, enable only if resolution
-			 * is >= 3M for ISP2400.
-			 */
-			atomisp_css_enable_raw_binning(asd, true);
-		}
-	}
 	/*
 	 * If sensor input changed, which means metadata resolution changed
 	 * together. Release all metadata buffers here to let it re-allocated
@@ -4648,12 +4389,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		}
 	}
 
-	if (asd->continuous_mode->val) {
-		ret = __enable_continuous_mode(asd, true);
-		if (ret)
-			return -EINVAL;
-	}
-
 	atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
 
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
@@ -4669,36 +4404,9 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		get_frame_info = atomisp_css_video_get_output_frame_info;
 		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		if (!asd->continuous_mode->val) {
-			configure_output = atomisp_css_video_configure_output;
-			get_frame_info =
-			    atomisp_css_video_get_output_frame_info;
-			pipe_id = IA_CSS_PIPE_ID_VIDEO;
-		} else {
-			if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW ||
-			    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
-				configure_output =
-				    atomisp_css_video_configure_output;
-				get_frame_info =
-				    atomisp_css_video_get_output_frame_info;
-				configure_pp_input =
-				    atomisp_css_video_configure_pp_input;
-				pipe_id = IA_CSS_PIPE_ID_VIDEO;
-			} else {
-				configure_output =
-				    atomisp_css_capture_configure_output;
-				get_frame_info =
-				    atomisp_css_capture_get_output_frame_info;
-				configure_pp_input =
-				    atomisp_css_capture_configure_pp_input;
-				pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-
-				atomisp_update_capture_mode(asd);
-				atomisp_css_capture_enable_online(asd,
-								  ATOMISP_INPUT_STREAM_GENERAL,
-								  false);
-			}
-		}
+		configure_output = atomisp_css_video_configure_output;
+		get_frame_info = atomisp_css_video_get_output_frame_info;
+		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	} else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
 		configure_output = atomisp_css_preview_configure_output;
 		get_frame_info = atomisp_css_preview_get_output_frame_info;
@@ -4719,26 +4427,23 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 			atomisp_update_capture_mode(asd);
 		}
 
-		if (!asd->continuous_mode->val)
-			/* in case of ANR, force capture pipe to offline mode */
-			atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
-							  asd->params.low_light ?
-							  false : asd->params.online_process);
+		/* in case of ANR, force capture pipe to offline mode */
+		atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
+						  asd->params.low_light ?
+						  false : asd->params.online_process);
 
 		configure_output = atomisp_css_capture_configure_output;
 		get_frame_info = atomisp_css_capture_get_output_frame_info;
 		configure_pp_input = atomisp_css_capture_configure_pp_input;
 		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 
-		if (!asd->params.online_process &&
-		    !asd->continuous_mode->val) {
+		if (!asd->params.online_process) {
 			ret = atomisp_css_capture_get_output_raw_frame_info(asd,
 				raw_output_info);
 			if (ret)
 				return ret;
 		}
-		if (!asd->continuous_mode->val && asd->run_mode->val
-		    != ATOMISP_RUN_MODE_STILL_CAPTURE) {
+		if (asd->run_mode->val != ATOMISP_RUN_MODE_STILL_CAPTURE) {
 			dev_err(isp->dev,
 				"Need to set the running mode first\n");
 			asd->run_mode->val = ATOMISP_RUN_MODE_STILL_CAPTURE;
@@ -4793,7 +4498,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	ia_css_frame_free(asd->raw_output_frame);
 	asd->raw_output_frame = NULL;
 
-	if (!asd->continuous_mode->val && !asd->params.online_process &&
+	if (!asd->params.online_process &&
 	    ia_css_frame_allocate_from_info(&asd->raw_output_frame,
 		    raw_output_info))
 		return -ENOMEM;
@@ -5144,7 +4849,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	}
 
 	/* construct resolution supported by isp */
-	if (res_overflow && !asd->continuous_mode->val) {
+	if (res_overflow) {
 		f->fmt.pix.width = rounddown(
 				       clamp_t(u32, f->fmt.pix.width - padding_w,
 					       ATOM_ISP_MIN_WIDTH,
@@ -5158,63 +4863,35 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
 
-	if (asd->continuous_mode->val) {
-		struct v4l2_rect *r;
+	asd->capture_pad = source_pad;
 
-		r = atomisp_subdev_get_rect(
-			&asd->subdev, NULL,
-			V4L2_SUBDEV_FORMAT_ACTIVE,
-			ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE,
-			V4L2_SEL_TGT_COMPOSE);
-		/*
-		 * The ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE should get resolutions
-		 * properly set otherwise, it should not be the capture_pad.
-		 */
-		if (r->width && r->height)
-			asd->capture_pad = ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE;
-		else
-			asd->capture_pad = source_pad;
-	} else {
-		asd->capture_pad = source_pad;
-	}
 	/*
-	 * set format info to sensor
-	 * In continuous mode, resolution is set only if it is higher than
-	 * existing value. This because preview pipe will be configured after
-	 * capture pipe and usually has lower resolution than capture pipe.
+	 * For jpeg or custom raw format the sensor will return constant
+	 * width and height. Because we already had quried try_mbus_fmt,
+	 * f->fmt.pix.width and f->fmt.pix.height has been changed to
+	 * this fixed width and height. So we cannot select the correct
+	 * resolution with that information. So use the original width
+	 * and height while set_mbus_fmt() so actual resolutions are
+	 * being used in while set media bus format.
 	 */
-	if (!asd->continuous_mode->val ||
-	    isp_sink_fmt->width < (f->fmt.pix.width + padding_w + dvs_env_w) ||
-	    isp_sink_fmt->height < (f->fmt.pix.height + padding_h +
-				    dvs_env_h)) {
-		/*
-		 * For jpeg or custom raw format the sensor will return constant
-		 * width and height. Because we already had quried try_mbus_fmt,
-		 * f->fmt.pix.width and f->fmt.pix.height has been changed to
-		 * this fixed width and height. So we cannot select the correct
-		 * resolution with that information. So use the original width
-		 * and height while set_mbus_fmt() so actual resolutions are
-		 * being used in while set media bus format.
-		 */
-		s_fmt = f->fmt.pix;
-		if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_JPEG ||
-		    f->fmt.pix.pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
-			s_fmt.width = backup_fmt.width;
-			s_fmt.height = backup_fmt.height;
-		}
-		ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
-					     f->fmt.pix.pixelformat, padding_w,
-					     padding_h, dvs_env_w, dvs_env_h);
-		if (ret) {
-			dev_warn(isp->dev,
-				 "Set format to sensor failed with %d\n", ret);
-			return -EINVAL;
-		}
-
-		atomisp_csi_lane_config(isp);
-		crop_needs_override = true;
+	s_fmt = f->fmt.pix;
+	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_JPEG ||
+	    f->fmt.pix.pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW) {
+		s_fmt.width = backup_fmt.width;
+		s_fmt.height = backup_fmt.height;
+	}
+	ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
+				     f->fmt.pix.pixelformat, padding_w,
+				     padding_h, dvs_env_w, dvs_env_h);
+	if (ret) {
+		dev_warn(isp->dev,
+			 "Set format to sensor failed with %d\n", ret);
+		return -EINVAL;
 	}
 
+	atomisp_csi_lane_config(isp);
+	crop_needs_override = true;
+
 	atomisp_check_copy_mode(asd, source_pad, &backup_fmt);
 	asd->yuvpp_mode = false;			/* Reset variable */
 
@@ -5228,27 +4905,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	if (isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
 	    (atomisp_subdev_format_conversion(asd, source_pad) &&
-	     ((asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-	       !asd->continuous_mode->val) ||
+	     (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
 	      asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER))) {
-		/* for continuous mode, preview size might be smaller than
-		 * still capture size. if preview size still needs crop,
-		 * pick the larger one between crop size of preview and
-		 * still capture.
-		 */
-		if (asd->continuous_mode->val
-		    && source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW
-		    && !crop_needs_override) {
-			isp_sink_crop.width =
-			    max_t(unsigned int, f->fmt.pix.width,
-				  isp_sink_crop.width);
-			isp_sink_crop.height =
-			    max_t(unsigned int, f->fmt.pix.height,
-				  isp_sink_crop.height);
-		} else {
-			isp_sink_crop.width = f->fmt.pix.width;
-			isp_sink_crop.height = f->fmt.pix.height;
-		}
+		isp_sink_crop.width = f->fmt.pix.width;
+		isp_sink_crop.height = f->fmt.pix.height;
 
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -5448,71 +5108,6 @@ int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 	return ret;
 }
 
-int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
-				      struct atomisp_cont_capture_conf *cvf_config)
-{
-	struct v4l2_ctrl *c;
-
-	lockdep_assert_held(&asd->isp->mutex);
-
-	/*
-	* In case of M10MO ZSL capture case, we need to issue a separate
-	* capture request to M10MO which will output captured jpeg image
-	*/
-	c = v4l2_ctrl_find(
-		asd->isp->inputs[asd->input_curr].camera->ctrl_handler,
-		V4L2_CID_START_ZSL_CAPTURE);
-	if (c) {
-		int ret;
-
-		dev_dbg(asd->isp->dev, "%s trigger ZSL capture request\n",
-			__func__);
-		/* TODO: use the cvf_config */
-		ret = v4l2_ctrl_s_ctrl(c, 1);
-		if (ret)
-			return ret;
-
-		return v4l2_ctrl_s_ctrl(c, 0);
-	}
-
-	asd->params.offline_parm = *cvf_config;
-
-	if (asd->params.offline_parm.num_captures) {
-		if (asd->streaming == ATOMISP_DEVICE_STREAMING_DISABLED) {
-			unsigned int init_raw_num;
-
-			if (asd->enable_raw_buffer_lock->val) {
-				init_raw_num =
-				    ATOMISP_CSS2_NUM_OFFLINE_INIT_CONTINUOUS_FRAMES_LOCK_EN;
-				if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-				    asd->params.video_dis_en)
-					init_raw_num +=
-					    ATOMISP_CSS2_NUM_DVS_FRAME_DELAY;
-			} else {
-				init_raw_num =
-				    ATOMISP_CSS2_NUM_OFFLINE_INIT_CONTINUOUS_FRAMES;
-			}
-
-			/* TODO: this can be removed once user-space
-			 *       has been updated to use control API */
-			asd->continuous_raw_buffer_size->val =
-			    max_t(int,
-				  asd->continuous_raw_buffer_size->val,
-				  asd->params.offline_parm.
-				  num_captures + init_raw_num);
-			asd->continuous_raw_buffer_size->val =
-			    min_t(int, ATOMISP_CONT_RAW_FRAMES,
-				  asd->continuous_raw_buffer_size->val);
-		}
-		asd->continuous_mode->val = true;
-	} else {
-		asd->continuous_mode->val = false;
-		__enable_continuous_mode(asd, false);
-	}
-
-	return 0;
-}
-
 /*
  * set auto exposure metering window to camera sensor
  */
@@ -5609,53 +5204,6 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd)
 	spin_unlock_irqrestore(&asd->raw_buffer_bitmap_lock, flags);
 }
 
-static int atomisp_set_raw_buffer_bitmap(struct atomisp_sub_device *asd, int exp_id)
-{
-	int *bitmap, bit;
-	unsigned long flags;
-
-	if (__checking_exp_id(asd, exp_id))
-		return -EINVAL;
-
-	bitmap = asd->raw_buffer_bitmap + exp_id / 32;
-	bit = exp_id % 32;
-	spin_lock_irqsave(&asd->raw_buffer_bitmap_lock, flags);
-	(*bitmap) |= (1 << bit);
-	asd->raw_buffer_locked_count++;
-	spin_unlock_irqrestore(&asd->raw_buffer_bitmap_lock, flags);
-
-	dev_dbg(asd->isp->dev, "%s: exp_id %d,  raw_buffer_locked_count %d\n",
-		__func__, exp_id, asd->raw_buffer_locked_count);
-
-	/* Check if the raw buffer after next is still locked!!! */
-	exp_id += 2;
-	if (exp_id > ATOMISP_MAX_EXP_ID)
-		exp_id -= ATOMISP_MAX_EXP_ID;
-	bitmap = asd->raw_buffer_bitmap + exp_id / 32;
-	bit = exp_id % 32;
-	if ((*bitmap) & (1 << bit)) {
-		int ret;
-
-		/* WORKAROUND unlock the raw buffer compulsively */
-		ret = atomisp_css_exp_id_unlock(asd, exp_id);
-		if (ret) {
-			dev_err(asd->isp->dev,
-				"%s exp_id is wrapping back to %d but force unlock failed, err %d.\n",
-				__func__, exp_id, ret);
-			return ret;
-		}
-
-		spin_lock_irqsave(&asd->raw_buffer_bitmap_lock, flags);
-		(*bitmap) &= ~(1 << bit);
-		asd->raw_buffer_locked_count--;
-		spin_unlock_irqrestore(&asd->raw_buffer_bitmap_lock, flags);
-		dev_warn(asd->isp->dev,
-			 "%s exp_id is wrapping back to %d but it is still locked so force unlock it, raw_buffer_locked_count %d\n",
-			 __func__, exp_id, asd->raw_buffer_locked_count);
-	}
-	return 0;
-}
-
 static int __is_raw_buffer_locked(struct atomisp_sub_device *asd, int exp_id)
 {
 	int *bitmap, bit;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 733b9f8cd06f..bea950a128a9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -268,9 +268,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
 int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 			      struct atomisp_shading_table *shading_table);
 
-int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
-				      struct atomisp_cont_capture_conf *cvf_config);
-
 void atomisp_free_internal_buffers(struct atomisp_sub_device *asd);
 
 int atomisp_s_ae_window(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 30bc49402d10..accae44ad72b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -651,13 +651,10 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 
 		return false;
 	case ATOMISP_RUN_MODE_PREVIEW:
-		if (!asd->continuous_mode->val) {
-			if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-				return true;
+		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
+			return true;
 
-			return false;
-		}
-		fallthrough;
+		return false;
 	case ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE:
 		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
 		    pipe_id == IA_CSS_PIPE_ID_PREVIEW)
@@ -665,14 +662,10 @@ static bool is_pipe_valid_to_current_run_mode(struct atomisp_sub_device *asd,
 
 		return false;
 	case ATOMISP_RUN_MODE_VIDEO:
-		if (!asd->continuous_mode->val) {
-			if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
-			    pipe_id == IA_CSS_PIPE_ID_YUVPP)
-				return true;
-			else
-				return false;
-		}
-		fallthrough;
+		if (pipe_id == IA_CSS_PIPE_ID_VIDEO || pipe_id == IA_CSS_PIPE_ID_YUVPP)
+			return true;
+
+		return false;
 	case ATOMISP_RUN_MODE_SDV:
 		if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
 		    pipe_id == IA_CSS_PIPE_ID_VIDEO)
@@ -2129,17 +2122,8 @@ static void __configure_video_preview_output(struct atomisp_sub_device *asd,
 	    __pipe_id_to_pipe_mode(asd, pipe_id);
 	stream_env->update_pipe[pipe_id] = true;
 
-	/*
-	 * second_output will be as video main output in SDV mode
-	 * with SOC camera. output will be as video main output in
-	 * normal video mode.
-	 */
-	if (asd->continuous_mode->val)
-		css_output_info = &stream_env->pipe_configs[pipe_id].
-				  output_info[ATOMISP_CSS_OUTPUT_SECOND_INDEX];
-	else
-		css_output_info = &stream_env->pipe_configs[pipe_id].
-				  output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
+	css_output_info =
+		&stream_env->pipe_configs[pipe_id].output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
 
 	css_output_info->res.width = width;
 	css_output_info->res.height = height;
@@ -2475,17 +2459,8 @@ static void __configure_video_vf_output(struct atomisp_sub_device *asd,
 	    __pipe_id_to_pipe_mode(asd, pipe_id);
 	stream_env->update_pipe[pipe_id] = true;
 
-	/*
-	 * second_vf_output will be as video viewfinder in SDV mode
-	 * with SOC camera. vf_output will be as video viewfinder in
-	 * normal video mode.
-	 */
-	if (asd->continuous_mode->val)
-		css_output_info = &stream_env->pipe_configs[pipe_id].
-				  vf_output_info[ATOMISP_CSS_OUTPUT_SECOND_INDEX];
-	else
-		css_output_info = &stream_env->pipe_configs[pipe_id].
-				  vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
+	css_output_info =
+		&stream_env->pipe_configs[pipe_id].vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
 
 	css_output_info->res.width = width;
 	css_output_info->res.height = height;
@@ -2626,12 +2601,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 		*frame_info = info.output_info[0];
 		break;
 	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
-		if (ATOMISP_USE_YUVPP(asd) && asd->continuous_mode->val)
-			*frame_info = info.
-				      output_info[ATOMISP_CSS_OUTPUT_SECOND_INDEX];
-		else
-			*frame_info = info.
-				      output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
+		*frame_info = info.output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
 		break;
 	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
 		if (stream_index == ATOMISP_INPUT_STREAM_POSTVIEW)
@@ -2643,15 +2613,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
 		    (pipe_index == IA_CSS_PIPE_ID_VIDEO ||
 		     pipe_index == IA_CSS_PIPE_ID_YUVPP))
-			if (ATOMISP_USE_YUVPP(asd) && asd->continuous_mode->val)
-				*frame_info = info.
-					      vf_output_info[ATOMISP_CSS_OUTPUT_SECOND_INDEX];
-			else
-				*frame_info = info.
-					      vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-		else if (ATOMISP_USE_YUVPP(asd) && asd->continuous_mode->val)
-			*frame_info =
-			    info.output_info[ATOMISP_CSS_OUTPUT_SECOND_INDEX];
+			*frame_info = info.vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
 		else
 			*frame_info =
 			    info.output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
@@ -2816,8 +2778,6 @@ int atomisp_css_video_get_viewfinder_frame_info(
 
 	if (ATOMISP_USE_YUVPP(asd)) {
 		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-		if (asd->continuous_mode->val)
-			frame_type = ATOMISP_CSS_SECOND_VF_FRAME;
 	} else {
 		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	}
@@ -2870,8 +2830,6 @@ int atomisp_css_preview_get_output_frame_info(
 
 	if (ATOMISP_USE_YUVPP(asd)) {
 		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-		if (asd->continuous_mode->val)
-			frame_type = ATOMISP_CSS_SECOND_OUTPUT_FRAME;
 	} else {
 		pipe_id = IA_CSS_PIPE_ID_PREVIEW;
 	}
@@ -2904,8 +2862,6 @@ int atomisp_css_video_get_output_frame_info(
 
 	if (ATOMISP_USE_YUVPP(asd)) {
 		pipe_id = IA_CSS_PIPE_ID_YUVPP;
-		if (asd->continuous_mode->val)
-			frame_type = ATOMISP_CSS_SECOND_OUTPUT_FRAME;
 	} else {
 		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index ce01479bdd68..280e8057676b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -348,31 +348,6 @@ static int atomisp_get_css_buf_type(struct atomisp_sub_device *asd,
 				    uint16_t source_pad)
 {
 	if (ATOMISP_USE_YUVPP(asd)) {
-		/* when run ZSL case */
-		if (asd->continuous_mode->val &&
-		    asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
-			if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE)
-				return IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-			else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW)
-				return IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME;
-			else
-				return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
-		}
-
-		/*when run SDV case*/
-		if (asd->continuous_mode->val &&
-		    asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-			if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE)
-				return IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-			else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW)
-				return IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME;
-			else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO)
-				return IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME;
-			else
-				return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
-		}
-
-		/*other case: default setting*/
 		if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE ||
 		    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO ||
 		    (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
@@ -414,22 +389,10 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		preview_pipe = &asd->video_out_capture;
 		css_preview_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		if (asd->continuous_mode->val) {
-			capture_pipe = &asd->video_out_capture;
-			vf_pipe = &asd->video_out_vf;
-			css_capture_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-		}
 		video_pipe = &asd->video_out_video_capture;
 		preview_pipe = &asd->video_out_preview;
 		css_video_pipe_id = IA_CSS_PIPE_ID_VIDEO;
 		css_preview_pipe_id = IA_CSS_PIPE_ID_VIDEO;
-	} else if (asd->continuous_mode->val) {
-		capture_pipe = &asd->video_out_capture;
-		vf_pipe = &asd->video_out_vf;
-		preview_pipe = &asd->video_out_preview;
-
-		css_preview_pipe_id = IA_CSS_PIPE_ID_PREVIEW;
-		css_capture_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
 		preview_pipe = &asd->video_out_preview;
 		css_preview_pipe_id = IA_CSS_PIPE_ID_PREVIEW;
@@ -545,7 +508,6 @@ static void atomisp_buf_queue(struct vb2_buffer *vb)
 	struct atomisp_video_pipe *pipe = vb_to_pipe(vb);
 	struct ia_css_frame *frame = vb_to_frame(vb);
 	struct atomisp_sub_device *asd = pipe->asd;
-	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
 	unsigned long irqflags;
 	int ret;
 
@@ -593,21 +555,6 @@ static void atomisp_buf_queue(struct vb2_buffer *vb)
 			atomisp_qbuffers_to_css(asd);
 	}
 
-	/*
-	 * Workaround: Due to the design of HALv3,
-	 * sometimes in ZSL or SDV mode HAL needs to
-	 * capture multiple images within one streaming cycle.
-	 * But the capture number cannot be determined by HAL.
-	 * So HAL only sets the capture number to be 1 and queue multiple
-	 * buffers. Atomisp driver needs to check this case and re-trigger
-	 * CSS to do capture when new buffer is queued.
-	 */
-	if (asd->continuous_mode->val && source_pad == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE &&
-	    !asd->enable_raw_buffer_lock->val && asd->params.offline_parm.num_captures == 1) {
-		asd->pending_capture_request++;
-		dev_dbg(asd->isp->dev, "Add one pending capture request.\n");
-	}
-
 out_unlock:
 	mutex_unlock(&asd->isp->mutex);
 }
@@ -667,9 +614,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 	/* s3a grid not enabled for any pipe */
 	asd->params.s3a_enabled_pipe = IA_CSS_PIPE_ID_NUM;
 
-	asd->params.offline_parm.num_captures = 1;
-	asd->params.offline_parm.skip_frames = 0;
-	asd->params.offline_parm.offset = 0;
 	asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	/* Add for channel */
 	asd->input_curr = 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d3b773bac5aa..cb6324510aca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1123,13 +1123,6 @@ enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
 	if (ATOMISP_USE_YUVPP(asd))
 		return IA_CSS_PIPE_ID_YUVPP;
 
-	if (asd->continuous_mode->val) {
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-			return IA_CSS_PIPE_ID_VIDEO;
-		else
-			return IA_CSS_PIPE_ID_PREVIEW;
-	}
-
 	/*
 	 * Disable vf_pp and run CSS in video mode. This allows using ISP
 	 * scaling but it has one frame delay due to CSS internal buffering.
@@ -1164,10 +1157,7 @@ static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
 
 	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
 	    (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE &&
-	     !atomisp_is_mbuscode_raw(
-		 asd->fmt[
-		  asd->capture_pad].fmt.code) &&
-	     !asd->continuous_mode->val))
+	     !atomisp_is_mbuscode_raw(asd->fmt[asd->capture_pad].fmt.code)))
 		return 2;
 	else
 		return 1;
@@ -1221,57 +1211,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 */
 	sensor_start_stream = atomisp_sensor_start_stream(asd);
 
-	/* Reset pending capture request count. */
-	asd->pending_capture_request = 0;
-
 	if (atomisp_subdev_streaming_count(asd) > sensor_start_stream) {
-		/* trigger still capture */
-		if (asd->continuous_mode->val &&
-		    atomisp_subdev_source_pad(vdev)
-		    == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE) {
-			if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-				dev_dbg(isp->dev, "SDV last video raw buffer id: %u\n",
-					asd->latest_preview_exp_id);
-			else
-				dev_dbg(isp->dev, "ZSL last preview raw buffer id: %u\n",
-					asd->latest_preview_exp_id);
-
-			if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED) {
-				flush_work(&asd->delayed_init_work);
-				mutex_unlock(&isp->mutex);
-				ret = wait_for_completion_interruptible(&asd->init_done);
-				mutex_lock(&isp->mutex);
-				if (ret) {
-					ret = -ERESTARTSYS;
-					goto out_unlock;
-				}
-			}
-
-			/* handle per_frame_setting parameter and buffers */
-			atomisp_handle_parameter_and_buffer(pipe);
-
-			/*
-			 * only ZSL/SDV capture request will be here, raise
-			 * the ISP freq to the highest possible to minimize
-			 * the S2S latency.
-			 */
-			atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, false);
-			/*
-			 * When asd->enable_raw_buffer_lock->val is true,
-			 * An extra IOCTL is needed to call
-			 * atomisp_css_exp_id_capture and trigger real capture
-			 */
-			if (!asd->enable_raw_buffer_lock->val) {
-				ret = atomisp_css_offline_capture_configure(asd,
-					asd->params.offline_parm.num_captures,
-					asd->params.offline_parm.skip_frames,
-					asd->params.offline_parm.offset);
-				if (ret) {
-					ret = -EINVAL;
-					goto out_unlock;
-				}
-			}
-		}
 		atomisp_qbuffers_to_css(asd);
 		ret = 0;
 		goto out_unlock;
@@ -1369,17 +1309,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto out_unlock;
 	}
 
-	if (asd->continuous_mode->val) {
-		atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				        V4L2_SUBDEV_FORMAT_ACTIVE,
-				        ATOMISP_SUBDEV_PAD_SINK);
-
-		reinit_completion(&asd->init_done);
-		asd->delayed_init = ATOMISP_DELAYED_INIT_QUEUED;
-		queue_work(asd->delayed_init_workq, &asd->delayed_init_work);
-	} else {
-		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
-	}
+	asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 
 out_unlock:
 	mutex_unlock(&isp->mutex);
@@ -1420,24 +1350,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	if (ret == 0)
 		dev_warn(isp->dev, "Warning timeout waiting for CSS to return buffers\n");
 
-	/*
-	 * do only videobuf_streamoff for capture & vf pipes in
-	 * case of continuous capture
-	 */
-	if (asd->continuous_mode->val &&
-	    atomisp_subdev_source_pad(vdev) != ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-	    atomisp_subdev_source_pad(vdev) != ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
-		if (atomisp_subdev_source_pad(vdev) == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE) {
-			/* stop continuous still capture if needed */
-			if (asd->params.offline_parm.num_captures == -1)
-				atomisp_css_offline_capture_configure(asd,
-								      0, 0, 0);
-			atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, false);
-		}
-
-		goto out_unlock;
-	}
-
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED)
 		first_streamoff = true;
 
@@ -2245,9 +2157,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		err = atomisp_set_parameters(vdev, arg);
 		break;
 
-	case ATOMISP_IOC_S_CONT_CAPTURE_CONFIG:
-		err = atomisp_offline_capture_configure(asd, arg);
-		break;
 	case ATOMISP_IOC_G_METADATA:
 		err = atomisp_get_metadata(asd, 0, arg);
 		break;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 4cbe900d3ca1..821f3204b759 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -427,8 +427,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			isp_sd->params.video_dis_en = 0;
 
 		if (isp_sd->params.video_dis_en &&
-		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-		    !isp_sd->continuous_mode->val) {
+		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 			/* This resolution contains 20 % of DVS slack
 			 * (of the desired captured image before
 			 * scaling, or 1 / 6 of what we get from the
@@ -459,8 +458,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			break;
 
 		if (isp_sd->params.video_dis_en &&
-		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-		    !isp_sd->continuous_mode->val) {
+		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 			dvs_w = rounddown(crop[pad]->width / 5,
 					  ATOM_ISP_STEP_WIDTH);
 			dvs_h = rounddown(crop[pad]->height / 5,
@@ -727,11 +725,7 @@ static int __atomisp_update_run_mode(struct atomisp_sub_device *asd)
 	struct v4l2_ctrl *c;
 	s32 mode;
 
-	if (ctrl->val != ATOMISP_RUN_MODE_VIDEO &&
-	    asd->continuous_mode->val)
-		mode = ATOMISP_RUN_MODE_PREVIEW;
-	else
-		mode = ctrl->val;
+	mode = ctrl->val;
 
 	c = v4l2_ctrl_find(
 		isp->inputs[asd->input_curr].camera->ctrl_handler,
@@ -816,24 +810,6 @@ static const struct v4l2_ctrl_config ctrl_vfpp = {
 	.qmenu = ctrl_vfpp_mode_menu,
 };
 
-/*
- * Control for ISP continuous mode
- *
- * When enabled, capture processing is possible without
- * stopping the preview pipeline. When disabled, ISP needs
- * to be restarted between preview and capture.
- */
-static const struct v4l2_ctrl_config ctrl_continuous_mode = {
-	.ops = &ctrl_ops,
-	.id = V4L2_CID_ATOMISP_CONTINUOUS_MODE,
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.name = "Continuous mode",
-	.min = 0,
-	.max = 1,
-	.step = 1,
-	.def = 0,
-};
-
 /*
  * Control for continuous mode raw buffer size
  *
@@ -1040,8 +1016,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 					     &ctrl_run_mode, NULL);
 	asd->vfpp = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 					 &ctrl_vfpp, NULL);
-	asd->continuous_mode = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-			       &ctrl_continuous_mode, NULL);
 	asd->continuous_viewfinder = v4l2_ctrl_new_custom(&asd->ctrl_handler,
 				     &ctrl_continuous_viewfinder,
 				     NULL);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 5cf8f3d9c916..141b93a6c0be 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -237,8 +237,6 @@ struct atomisp_subdev_params {
 	enum atomisp_flash_state flash_state;
 	enum atomisp_frame_status last_frame_status;
 
-	/* continuous capture */
-	struct atomisp_cont_capture_conf offline_parm;
 	/* Flag to check if driver needs to update params to css */
 	bool css_update_params_needed;
 };
@@ -267,7 +265,6 @@ struct atomisp_sub_device {
 	struct v4l2_ctrl *fmt_auto;
 	struct v4l2_ctrl *run_mode;
 	struct v4l2_ctrl *vfpp;
-	struct v4l2_ctrl *continuous_mode;
 	struct v4l2_ctrl *continuous_raw_buffer_size;
 	struct v4l2_ctrl *continuous_viewfinder;
 	struct v4l2_ctrl *enable_raw_buffer_lock;
@@ -351,7 +348,6 @@ struct atomisp_sub_device {
 
 	struct atomisp_resolution sensor_array_res;
 	bool high_speed_mode; /* Indicate whether now is a high speed mode */
-	int pending_capture_request; /* Indicates the number of pending capture requests. */
 
 	unsigned int preview_exp_id;
 	unsigned int postview_exp_id;
-- 
2.39.1

