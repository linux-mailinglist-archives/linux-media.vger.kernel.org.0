Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A94F7016A0
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238458AbjEMMdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238351AbjEMMdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C4E35AD
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ibCteOXmiKokLNO+WmNhtH9B7unOCl7Rzmto+UMSNc=;
        b=Lwa+NpI7ZRYPwDL0X08QyRdz6VJoMTbo4R2aRxEEIXLSEiUjtD9gSOtmSZ3RHyzGnoGuVQ
        eDjHaqoCXV4GgSZCafxFPcMNq1Q8U1deGvNtDd1deLiNNJH7FtGE9sRLtGqqM13wDAfXDx
        syPCsQR/43ajfx81yGemDcSOti6xqXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-ephvlO8CPHaZrYY-n7jGHQ-1; Sat, 13 May 2023 08:32:18 -0400
X-MC-Unique: ephvlO8CPHaZrYY-n7jGHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EAA2802A95;
        Sat, 13 May 2023 12:32:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAA8F40C2076;
        Sat, 13 May 2023 12:32:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 09/30] media: atomisp: Remove source_pad parameter from functions and structs
Date:   Sat, 13 May 2023 14:31:38 +0200
Message-Id: <20230513123159.33234-10-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that there is only 1 source-pad for an asd there is no need
to have a parameter for this in various places.

Remove the source_pad function parameter and
atomisp_sub_device.capture_pad data member.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 44 ++++++++-----------
 .../media/atomisp/pci/atomisp_compat.h        |  4 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |  4 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  7 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 13 +++---
 .../media/atomisp/pci/atomisp_subdev.c        | 25 ++---------
 .../media/atomisp/pci/atomisp_subdev.h        |  5 +--
 7 files changed, 33 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8cd94189052f..3dcf81e431cb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -229,8 +229,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 		goto done;
 	}
 
-	curr_rules.width = isp->asd.fmt[isp->asd.capture_pad].fmt.width;
-	curr_rules.height = isp->asd.fmt[isp->asd.capture_pad].fmt.height;
+	curr_rules.width = isp->asd.fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.width;
+	curr_rules.height = isp->asd.fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.height;
 	curr_rules.fps = fps;
 	curr_rules.run_mode = isp->asd.run_mode->val;
 
@@ -1548,13 +1548,12 @@ void atomisp_free_internal_buffers(struct atomisp_sub_device *asd)
 }
 
 static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
-				     enum ia_css_pipe_id pipe_id,
-				     int source_pad)
+				     enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	int err;
 
-	if (atomisp_css_get_grid_info(asd, pipe_id, source_pad))
+	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
 	/* We must free all buffers because they no longer match
@@ -4105,8 +4104,7 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 
 static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 				  struct ia_css_frame_info *output_info,
-				  struct v4l2_pix_format *pix,
-				  unsigned int source_pad)
+				  struct v4l2_pix_format *pix)
 {
 	struct camera_mipi_info *mipi_info;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
@@ -4279,7 +4277,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		return ret;
 	}
 
-	atomisp_update_grid_info(asd, pipe_id, source_pad);
+	atomisp_update_grid_info(asd, pipe_id);
 	return 0;
 }
 
@@ -4303,7 +4301,7 @@ static void atomisp_get_dis_envelop(struct atomisp_sub_device *asd,
 }
 
 static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
-				    int source_pad, const struct v4l2_pix_format *f)
+				    const struct v4l2_pix_format *f)
 {
 	struct v4l2_mbus_framefmt *sink, *src;
 
@@ -4316,7 +4314,7 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 	sink = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
 				       V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SINK);
 	src = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				      V4L2_SUBDEV_FORMAT_ACTIVE, source_pad);
+				      V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SOURCE);
 
 	if (sink->code == src->code && sink->width == f->width && sink->height == f->height)
 		asd->copy_mode = true;
@@ -4439,7 +4437,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	struct v4l2_rect isp_sink_crop;
-	u16 source_pad = atomisp_subdev_source_pad(vdev);
 	struct v4l2_subdev_fh fh;
 	int ret;
 
@@ -4447,12 +4444,9 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	if (ret)
 		return ret;
 
-	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
-		return -EINVAL;
-
 	dev_dbg(isp->dev,
-		"setting resolution %ux%u on pad %u bytesperline %u\n",
-		f->fmt.pix.width, f->fmt.pix.height, source_pad, f->fmt.pix.bytesperline);
+		"setting resolution %ux%u bytesperline %u\n",
+		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.bytesperline);
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
@@ -4501,9 +4495,9 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	isp_source_fmt.code = format_bridge->mbus_code;
 	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
-				source_pad, &isp_source_fmt);
+				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
-	if (!atomisp_subdev_format_conversion(asd, source_pad)) {
+	if (!atomisp_subdev_format_conversion(asd)) {
 		padding_w = 0;
 		padding_h = 0;
 	}
@@ -4511,8 +4505,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
 
-	asd->capture_pad = source_pad;
-
 	ret = atomisp_set_fmt_to_snr(vdev, &f->fmt.pix,
 				     padding_w, padding_h, dvs_env_w, dvs_env_h);
 	if (ret) {
@@ -4523,7 +4515,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 	atomisp_csi_lane_config(isp);
 
-	atomisp_check_copy_mode(asd, source_pad, &f->fmt.pix);
+	atomisp_check_copy_mode(asd, &f->fmt.pix);
 
 	isp_sink_crop = *atomisp_subdev_get_rect(&asd->subdev, NULL,
 			V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -4534,7 +4526,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	 * width or height) bigger than the desired result. */
 	if (isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-	    (atomisp_subdev_format_conversion(asd, source_pad) &&
+	    (atomisp_subdev_format_conversion(asd) &&
 	     (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
 	      asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER))) {
 		isp_sink_crop.width = f->fmt.pix.width;
@@ -4548,7 +4540,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 					     &isp_sink_crop);
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     source_pad, V4L2_SEL_TGT_COMPOSE,
+					     ATOMISP_SUBDEV_PAD_SOURCE, V4L2_SEL_TGT_COMPOSE,
 					     0, &isp_sink_crop);
 	} else if (IS_MOFD) {
 		struct v4l2_rect main_compose = {0};
@@ -4567,7 +4559,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     source_pad,
+					     ATOMISP_SUBDEV_PAD_SOURCE,
 					     V4L2_SEL_TGT_COMPOSE, 0,
 					     &main_compose);
 	} else {
@@ -4605,12 +4597,12 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 
 		atomisp_subdev_set_selection(&asd->subdev, fh.state,
 					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     source_pad,
+					     ATOMISP_SUBDEV_PAD_SOURCE,
 					     V4L2_SEL_TGT_COMPOSE, 0,
 					     &main_compose);
 	}
 
-	ret = atomisp_set_fmt_to_isp(vdev, &output_info, &f->fmt.pix, source_pad);
+	ret = atomisp_set_fmt_to_isp(vdev, &output_info, &f->fmt.pix);
 	if (ret) {
 		dev_warn(isp->dev, "Can't set format on ISP. Error %d\n", ret);
 		return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 218e8ac276c8..168c42956c29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -113,8 +113,7 @@ void atomisp_css_free_metadata_buffer(struct atomisp_metadata_buf
 				      *metadata_buf);
 
 int atomisp_css_get_grid_info(struct atomisp_sub_device *asd,
-			      enum ia_css_pipe_id pipe_id,
-			      int source_pad);
+			      enum ia_css_pipe_id pipe_id);
 
 int atomisp_alloc_3a_output_buf(struct atomisp_sub_device *asd);
 
@@ -276,7 +275,6 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
 				       enum ia_css_frame_format format);
 
 int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
-			       u16 source_pad,
 			       struct ia_css_frame_info *frame_info);
 
 int atomisp_css_video_configure_viewfinder(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index d5b9c0fda69a..416cc45bd472 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1328,8 +1328,7 @@ void atomisp_css_free_stat_buffers(struct atomisp_sub_device *asd)
 }
 
 int atomisp_css_get_grid_info(struct atomisp_sub_device *asd,
-			      enum ia_css_pipe_id pipe_id,
-			      int source_pad)
+			      enum ia_css_pipe_id pipe_id)
 {
 	struct ia_css_pipe_info p_info;
 	struct ia_css_grid_info old_info;
@@ -2432,7 +2431,6 @@ static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd)
 }
 
 int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
-			       u16 source_pad,
 			       struct ia_css_frame_info *frame_info)
 {
 	struct ia_css_pipe_info info;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index ccd96464ebfa..39eba99feee0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -47,7 +47,6 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 			       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct atomisp_video_pipe *pipe = container_of(vq, struct atomisp_video_pipe, vb_queue);
-	u16 source_pad = atomisp_subdev_source_pad(&pipe->vdev);
 	int ret;
 
 	mutex_lock(&pipe->asd->isp->mutex); /* for get_css_frame_info() / set_fmt() */
@@ -56,7 +55,7 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 	 * When VIDIOC_S_FMT has not been called before VIDIOC_REQBUFS, then
 	 * this will fail. Call atomisp_set_fmt() ourselves and try again.
 	 */
-	ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
+	ret = atomisp_get_css_frame_info(pipe->asd, &pipe->frame_info);
 	if (ret) {
 		struct v4l2_format f = {
 			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,
@@ -68,7 +67,7 @@ static int atomisp_queue_setup(struct vb2_queue *vq,
 		if (ret)
 			goto out;
 
-		ret = atomisp_get_css_frame_info(pipe->asd, source_pad, &pipe->frame_info);
+		ret = atomisp_get_css_frame_info(pipe->asd, &pipe->frame_info);
 		if (ret)
 			goto out;
 	}
@@ -654,7 +653,7 @@ static int atomisp_release(struct file *file)
 done:
 	atomisp_subdev_set_selection(&asd->subdev, fh.state,
 				     V4L2_SUBDEV_FORMAT_ACTIVE,
-				     atomisp_subdev_source_pad(vdev),
+				     ATOMISP_SUBDEV_PAD_SOURCE,
 				     V4L2_SEL_TGT_COMPOSE, 0,
 				     &clear_compose);
 	mutex_unlock(&isp->mutex);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1684ea6ad735..8e2b5b647670 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1131,7 +1131,7 @@ static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
 
 	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
 	    (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE &&
-	     !atomisp_is_mbuscode_raw(asd->fmt[asd->capture_pad].fmt.code)))
+	     !atomisp_is_mbuscode_raw(asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.code)))
 		return 2;
 	else
 		return 1;
@@ -1159,7 +1159,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct video_device *vdev = &pipe->vdev;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
@@ -1167,9 +1166,9 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long irqflags;
 	int ret;
 
-	mutex_lock(&isp->mutex);
+	dev_dbg(isp->dev, "Start stream\n");
 
-	dev_dbg(isp->dev, "Start stream on pad %d\n", atomisp_subdev_source_pad(vdev));
+	mutex_lock(&isp->mutex);
 
 	ret = atomisp_pipe_check(pipe, false);
 	if (ret)
@@ -1291,7 +1290,6 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 {
 	struct atomisp_video_pipe *pipe = vq_to_pipe(vq);
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct video_device *vdev = &pipe->vdev;
 	struct atomisp_device *isp = asd->isp;
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	enum ia_css_pipe_id css_pipe_id;
@@ -1300,10 +1298,9 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	int ret;
 
+	dev_dbg(isp->dev, "Stop stream\n");
+
 	mutex_lock(&isp->mutex);
-
-	dev_dbg(isp->dev, "Stop stream on pad %d\n", atomisp_subdev_source_pad(vdev));
-
 	/*
 	 * There is no guarantee that the buffers queued to / owned by the ISP
 	 * will properly be returned to the queue when stopping. Set a flag to
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index fb145044e9a4..1c5e489b4405 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -117,35 +117,19 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
 	return NULL;
 }
 
-bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd,
-				      unsigned int source_pad)
+bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd)
 {
 	struct v4l2_mbus_framefmt *sink, *src;
 
 	sink = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				       V4L2_SUBDEV_FORMAT_ACTIVE,
-				       ATOMISP_SUBDEV_PAD_SINK);
+				       V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SINK);
 	src = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
-				      V4L2_SUBDEV_FORMAT_ACTIVE, source_pad);
+				      V4L2_SUBDEV_FORMAT_ACTIVE, ATOMISP_SUBDEV_PAD_SOURCE);
 
 	return atomisp_is_mbuscode_raw(sink->code)
 	       && !atomisp_is_mbuscode_raw(src->code);
 }
 
-uint16_t atomisp_subdev_source_pad(struct video_device *vdev)
-{
-	struct media_link *link;
-	u16 ret = 0;
-
-	list_for_each_entry(link, &vdev->entity.links, list) {
-		if (link->source) {
-			ret = link->source->index;
-			break;
-		}
-	}
-	return ret;
-}
-
 /*
  * V4L2 subdev operations
  */
@@ -404,8 +388,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			padding_h = 12;
 		}
 
-		if (atomisp_subdev_format_conversion(isp_sd,
-						     isp_sd->capture_pad)
+		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
 			crop[pad]->width -= padding_w;
 			crop[pad]->height -= padding_h;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index c4f312c55a4a..ee7d0ee5d6e4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -241,7 +241,6 @@ struct atomisp_sub_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
-	u16 capture_pad; /* main capture pad; defines much of isp config */
 
 	unsigned int output;
 	struct atomisp_video_pipe video_out;
@@ -340,9 +339,7 @@ const struct atomisp_in_fmt_conv
 	atomisp_in_fmt);
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
-bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd,
-				      unsigned int source_pad);
-uint16_t atomisp_subdev_source_pad(struct video_device *vdev);
+bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 
 /* Get pointer to appropriate format */
 struct v4l2_mbus_framefmt
-- 
2.40.1

