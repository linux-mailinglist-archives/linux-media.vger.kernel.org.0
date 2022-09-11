Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7BA5B5036
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiIKRRh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiIKRRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B0427CD2
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=82bIn5n0jWkm0+6VHpYjPZZwnCHHYvIU+VbLzJZ1JR0=;
        b=GovL9CXMZIGk6OrQrkftnjH2IcoufsqHRx6cXvdJEyvwaQKU111cTiz2XtfkYuY7IKYb2k
        CbgbsdprRRoqulXMp9UiCOCvRRBIO71ETGdJlhS/rq2yHWBmQ/GHBsHyeOS7nTg+y2aAkC
        Z4Okq8ZBJbGAab1L3HtfGjsj4u5dT08=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-NeZ4HTdLNzS0hTzVg3rJNw-1; Sun, 11 Sep 2022 13:17:26 -0400
X-MC-Unique: NeZ4HTdLNzS0hTzVg3rJNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D320101A54E;
        Sun, 11 Sep 2022 17:17:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC5B9492C3B;
        Sun, 11 Sep 2022 17:17:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 16/17] media: atomisp: Remove atomisp_source_pad_to_stream_id()
Date:   Sun, 11 Sep 2022 19:16:52 +0200
Message-Id: <20220911171653.568932-17-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_source_pad_to_stream_id() returns ATOMISP_INPUT_STREAM_GENERAL
unconditionally now. Drop it and directly use ATOMISP_INPUT_STREAM_GENERAL
in its callers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 38 ++++++-------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  7 ++--
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  5 +--
 .../media/atomisp/pci/atomisp_subdev.c        | 25 +++++-------
 5 files changed, 25 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index b01cacb8d2a8..431defa30acf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1938,7 +1938,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 {
 	struct atomisp_device *isp = asd->isp;
 	int err;
-	u16 stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
 
 	if (atomisp_css_get_grid_info(asd, pipe_id, source_pad))
 		return;
@@ -1947,7 +1946,7 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	   the grid size. */
 	atomisp_css_free_stat_buffers(asd);
 
-	err = atomisp_alloc_css_stat_bufs(asd, stream_id);
+	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
 	if (err) {
 		dev_err(isp->dev, "stat_buf allocate error\n");
 		goto err;
@@ -4431,8 +4430,6 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt;
 	struct atomisp_input_stream_info *stream_info =
 	    (struct atomisp_input_stream_info *)snr_mbus_fmt->reserved;
-	u16 stream_index;
-	int source_pad = atomisp_subdev_source_pad(vdev);
 	int ret;
 
 	if (!asd) {
@@ -4444,7 +4441,6 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	if (!isp->inputs[asd->input_curr].camera)
 		return -EINVAL;
 
-	stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
 	fmt = atomisp_get_format_bridge(f->pixelformat);
 	if (!fmt) {
 		dev_err(isp->dev, "unsupported pixelformat!\n");
@@ -4458,7 +4454,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	snr_mbus_fmt->width = f->width;
 	snr_mbus_fmt->height = f->height;
 
-	__atomisp_init_stream_info(stream_index, stream_info);
+	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
 
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		snr_mbus_fmt->width, snr_mbus_fmt->height);
@@ -4743,7 +4739,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	int (*configure_pp_input)(struct atomisp_sub_device *asd,
 				  unsigned int width, unsigned int height) =
 				      configure_pp_input_nop;
-	u16 stream_index;
 	const struct atomisp_in_fmt_conv *fc;
 	int ret, i;
 
@@ -4752,7 +4747,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 			__func__, vdev->name);
 		return -EINVAL;
 	}
-	stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
@@ -4772,7 +4766,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 			dev_err(isp->dev, "mipi_info is NULL\n");
 			return -EINVAL;
 		}
-		if (atomisp_set_sensor_mipi_to_isp(asd, stream_index,
+		if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
 						   mipi_info))
 			return -EINVAL;
 		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
@@ -4856,7 +4850,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	/* ISP2401 new input system need to use copy pipe */
 	if (asd->copy_mode) {
 		pipe_id = IA_CSS_PIPE_ID_COPY;
-		atomisp_css_capture_enable_online(asd, stream_index, false);
+		atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL, false);
 	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
 		/* video same in continuouscapture and online modes */
 		configure_output = atomisp_css_video_configure_output;
@@ -4888,7 +4882,8 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 				pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 
 				atomisp_update_capture_mode(asd);
-				atomisp_css_capture_enable_online(asd, stream_index, false);
+				atomisp_css_capture_enable_online(
+					asd, ATOMISP_INPUT_STREAM_GENERAL, false);
 			}
 		}
 	} else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
@@ -4913,7 +4908,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 
 		if (!asd->continuous_mode->val)
 			/* in case of ANR, force capture pipe to offline mode */
-			atomisp_css_capture_enable_online(asd, stream_index,
+			atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
 							  asd->params.low_light ?
 							  false : asd->params.online_process);
 
@@ -4944,7 +4939,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		pipe_id = IA_CSS_PIPE_ID_YUVPP;
 
 	if (asd->copy_mode)
-		ret = atomisp_css_copy_configure_output(asd, stream_index,
+		ret = atomisp_css_copy_configure_output(asd, ATOMISP_INPUT_STREAM_GENERAL,
 							pix->width, pix->height,
 							format->planar ? pix->bytesperline :
 							pix->bytesperline * 8 / format->depth,
@@ -4968,8 +4963,8 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		return -EINVAL;
 	}
 	if (asd->copy_mode)
-		ret = atomisp_css_copy_get_output_frame_info(asd, stream_index,
-			output_info);
+		ret = atomisp_css_copy_get_output_frame_info(
+			asd, ATOMISP_INPUT_STREAM_GENERAL, output_info);
 	else
 		ret = get_frame_info(asd, output_info);
 	if (ret) {
@@ -5061,7 +5056,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	struct atomisp_device *isp;
 	struct atomisp_input_stream_info *stream_info =
 	    (struct atomisp_input_stream_info *)ffmt->reserved;
-	u16 stream_index = ATOMISP_INPUT_STREAM_GENERAL;
 	int source_pad = atomisp_subdev_source_pad(vdev);
 	struct v4l2_subdev_fh fh;
 	int ret;
@@ -5076,8 +5070,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
-	stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
-
 	format = atomisp_get_format_bridge(pixelformat);
 	if (!format)
 		return -EINVAL;
@@ -5090,7 +5082,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 		ffmt->width, ffmt->height, padding_w, padding_h,
 		dvs_env_w, dvs_env_h);
 
-	__atomisp_init_stream_info(stream_index, stream_info);
+	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
 
 	req_ffmt = ffmt;
 
@@ -5122,7 +5114,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	if (ret)
 		return ret;
 
-	__atomisp_update_stream_env(asd, stream_index, stream_info);
+	__atomisp_update_stream_env(asd, ATOMISP_INPUT_STREAM_GENERAL, stream_info);
 
 	dev_dbg(isp->dev, "sensor width: %d, height: %d\n",
 		ffmt->width, ffmt->height);
@@ -5841,12 +5833,6 @@ int atomisp_flash_enable(struct atomisp_sub_device *asd, int num_frames)
 	return 0;
 }
 
-int atomisp_source_pad_to_stream_id(struct atomisp_sub_device *asd,
-				    uint16_t source_pad)
-{
-	return ATOMISP_INPUT_STREAM_GENERAL;
-}
-
 bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_sub_device *asd = pipe->asd;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index ba3433a63595..c9f92f1326b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -297,8 +297,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		      bool q_buffers, enum atomisp_input_stream_id stream_id);
 
 void atomisp_css_flush(struct atomisp_device *isp);
-int atomisp_source_pad_to_stream_id(struct atomisp_sub_device *asd,
-				    uint16_t source_pad);
 
 /* Events. Only one event has to be exported for now. */
 void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 64dd63ddc29c..fdc05548d972 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1427,7 +1427,6 @@ int atomisp_css_get_grid_info(struct atomisp_sub_device *asd,
 	struct ia_css_pipe_info p_info;
 	struct ia_css_grid_info old_info;
 	struct atomisp_device *isp = asd->isp;
-	int stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
 	int md_width = asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
 		       stream_config.metadata_config.resolution.width;
 
@@ -1435,7 +1434,7 @@ int atomisp_css_get_grid_info(struct atomisp_sub_device *asd,
 	memset(&old_info, 0, sizeof(struct ia_css_grid_info));
 
 	if (ia_css_pipe_get_info(
-		asd->stream_env[stream_index].pipes[pipe_id],
+		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].pipes[pipe_id],
 		&p_info) != 0) {
 		dev_err(isp->dev, "ia_css_pipe_get_info failed\n");
 		return -EINVAL;
@@ -2680,11 +2679,11 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 	struct atomisp_device *isp = asd->isp;
 
 	if (ATOMISP_SOC_CAMERA(asd)) {
-		stream_index = atomisp_source_pad_to_stream_id(asd, source_pad);
+		stream_index = ATOMISP_INPUT_STREAM_GENERAL;
 	} else {
 		stream_index = (pipe_index == IA_CSS_PIPE_ID_YUVPP) ?
 			       ATOMISP_INPUT_STREAM_VIDEO :
-			       atomisp_source_pad_to_stream_id(asd, source_pad);
+			       ATOMISP_INPUT_STREAM_GENERAL;
 	}
 
 	if (0 != ia_css_pipe_get_info(asd->stream_env[stream_index]
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index cbbb25d3e5fe..aefa7c07242a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1112,11 +1112,8 @@ int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req
 	struct ia_css_frame *frame;
 	struct videobuf_vmalloc_memory *vm_mem;
 	u16 source_pad = atomisp_subdev_source_pad(vdev);
-	u16 stream_id;
 	int ret = 0, i = 0;
 
-	stream_id = atomisp_source_pad_to_stream_id(asd, source_pad);
-
 	if (req->count == 0) {
 		mutex_lock(&pipe->capq.vb_lock);
 		if (!list_empty(&pipe->capq.stream))
@@ -1137,7 +1134,7 @@ int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req
 	if (ret)
 		return ret;
 
-	atomisp_alloc_css_stat_bufs(asd, stream_id);
+	atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
 
 	/*
 	 * for user pointer type, buffers are not really allocated here,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 88bf693f4c50..27a7cd98f935 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -373,16 +373,12 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 	struct atomisp_device *isp = isp_sd->isp;
 	struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
-	u16 vdev_pad = atomisp_subdev_source_pad(sd->devnode);
 	struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 		       *comp[ATOMISP_SUBDEV_PADS_NUM];
-	enum atomisp_input_stream_id stream_id;
 	unsigned int i;
 	unsigned int padding_w = pad_w;
 	unsigned int padding_h = pad_h;
 
-	stream_id = atomisp_source_pad_to_stream_id(isp_sd, vdev_pad);
-
 	isp_get_fmt_rect(sd, sd_state, which, ffmt, crop, comp);
 
 	dev_dbg(isp->dev,
@@ -478,7 +474,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			dvs_w = dvs_h = 0;
 		}
 		atomisp_css_video_set_dis_envelope(isp_sd, dvs_w, dvs_h);
-		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
+		atomisp_css_input_set_effective_resolution(
+			isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 			crop[pad]->width, crop[pad]->height);
 
 		break;
@@ -523,14 +520,14 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		if (r->width * crop[ATOMISP_SUBDEV_PAD_SINK]->height <
 		    crop[ATOMISP_SUBDEV_PAD_SINK]->width * r->height)
 			atomisp_css_input_set_effective_resolution(isp_sd,
-				stream_id,
+				ATOMISP_INPUT_STREAM_GENERAL,
 				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->
 					  height * r->width / r->height,
 					  ATOM_ISP_STEP_WIDTH),
 				crop[ATOMISP_SUBDEV_PAD_SINK]->height);
 		else
 			atomisp_css_input_set_effective_resolution(isp_sd,
-				stream_id,
+				ATOMISP_INPUT_STREAM_GENERAL,
 				crop[ATOMISP_SUBDEV_PAD_SINK]->width,
 				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->
 					  width * r->height / r->width,
@@ -620,16 +617,12 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 	struct atomisp_device *isp = isp_sd->isp;
 	struct v4l2_mbus_framefmt *__ffmt =
 	    atomisp_subdev_get_ffmt(sd, sd_state, which, pad);
-	u16 vdev_pad = atomisp_subdev_source_pad(sd->devnode);
-	enum atomisp_input_stream_id stream_id;
 
 	dev_dbg(isp->dev, "ffmt: pad %s w %d h %d code 0x%8.8x which %s\n",
 		atomisp_pad_str(pad), ffmt->width, ffmt->height, ffmt->code,
 		which == V4L2_SUBDEV_FORMAT_TRY ? "V4L2_SUBDEV_FORMAT_TRY"
 		: "V4L2_SUBDEV_FORMAT_ACTIVE");
 
-	stream_id = atomisp_source_pad_to_stream_id(isp_sd, vdev_pad);
-
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK: {
 		const struct atomisp_in_fmt_conv *fc =
@@ -649,15 +642,15 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			atomisp_css_input_set_resolution(isp_sd,
-							 stream_id, ffmt);
+							 ATOMISP_INPUT_STREAM_GENERAL, ffmt);
 			atomisp_css_input_set_binning_factor(isp_sd,
-							     stream_id,
+							     ATOMISP_INPUT_STREAM_GENERAL,
 							     atomisp_get_sensor_bin_factor(isp_sd));
-			atomisp_css_input_set_bayer_order(isp_sd, stream_id,
+			atomisp_css_input_set_bayer_order(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 							  fc->bayer_order);
-			atomisp_css_input_set_format(isp_sd, stream_id,
+			atomisp_css_input_set_format(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 						     fc->atomisp_in_fmt);
-			atomisp_css_set_default_isys_config(isp_sd, stream_id,
+			atomisp_css_set_default_isys_config(isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
 							    ffmt);
 		}
 
-- 
2.37.3

