Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3DDA5B5034
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIKRRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiIKRRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCB227CF5
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=39qZncBhU3VnPFbCe85U2CoGLAppNQKmkcs8c+nLEz8=;
        b=EGM+aNKtsj/oqbBFSS3MaXu60n27FrvNk9C+f6LfbUqoub3EW8sIVsLT2miRn7hBm9FXoN
        kawMNX4WdoOzXmv3y4HFHRIqNyjc/oTbZkrPaivMxlhapWYYItpGzT8sdmn3z55S+VTcxJ
        LooPHRULD0wOP89gE6akMSCkgq6Cynk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-BVy8C64MOXSqhHTgrTRX9g-1; Sun, 11 Sep 2022 13:17:24 -0400
X-MC-Unique: BVy8C64MOXSqhHTgrTRX9g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778A529AB3FA;
        Sun, 11 Sep 2022 17:17:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03047492C3B;
        Sun, 11 Sep 2022 17:17:21 +0000 (UTC)
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
Subject: [PATCH 15/17] media: atomisp: Remove const/fixed camera_caps
Date:   Sun, 11 Sep 2022 19:16:51 +0200
Message-Id: <20220911171653.568932-16-hdegoede@redhat.com>
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

The code checks a camera_caps struct in various places, but this always
points to the same const camera_caps struct.

Remove the checks, keeping the code paths which would be taken with
the fixed camera caps struct still in place and remove the camera_caps
struct itself.

Note this completely removes atomisp_pause_buffer_event() because that
only ever does something if camera_caps.sensors[0].is_slave is true and
that never is true.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |  18 ---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 111 +-----------------
 .../staging/media/atomisp/pci/atomisp_fops.c  |  44 -------
 .../media/atomisp/pci/atomisp_gmin_platform.c |  18 ---
 .../media/atomisp/pci/atomisp_internal.h      |   5 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  81 ++-----------
 .../media/atomisp/pci/atomisp_subdev.h        |   3 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  18 ---
 8 files changed, 17 insertions(+), 281 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index 8c65733e0255..0253661d4332 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -141,23 +141,6 @@ struct atomisp_platform_data {
 	struct intel_v4l2_subdev_table *subdevs;
 };
 
-/* Describe the capacities of one single sensor. */
-struct atomisp_sensor_caps {
-	/* The number of streams this sensor can output. */
-	int stream_num;
-	bool is_slave;
-};
-
-/* Describe the capacities of sensors connected to one camera port. */
-struct atomisp_camera_caps {
-	/* The number of sensors connected to this camera port. */
-	int sensor_num;
-	/* The capacities of each sensor. */
-	struct atomisp_sensor_caps sensor[MAX_SENSORS_PER_PORT];
-	/* Define whether stream control is required for multiple streams. */
-	bool multi_stream_ctrl;
-};
-
 /*
  *  Sensor of external ISP can send multiple steams with different mipi data
  * type in the same virtual channel. This information needs to come from the
@@ -235,7 +218,6 @@ struct camera_mipi_info {
 };
 
 const struct atomisp_platform_data *atomisp_get_platform_data(void);
-const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void);
 
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8cc8ee64fb44..b01cacb8d2a8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -770,24 +770,6 @@ static struct atomisp_video_pipe *__atomisp_get_pipe(
     enum ia_css_pipe_id css_pipe_id,
     enum ia_css_buffer_type buf_type)
 {
-	struct atomisp_device *isp = asd->isp;
-
-	if (css_pipe_id == IA_CSS_PIPE_ID_COPY &&
-	    isp->inputs[asd->input_curr].camera_caps->
-	    sensor[asd->sensor_curr].stream_num > 1) {
-		switch (stream_id) {
-		case ATOMISP_INPUT_STREAM_PREVIEW:
-			return &asd->video_out_preview;
-		case ATOMISP_INPUT_STREAM_POSTVIEW:
-			return &asd->video_out_vf;
-		case ATOMISP_INPUT_STREAM_VIDEO:
-			return &asd->video_out_video_capture;
-		case ATOMISP_INPUT_STREAM_CAPTURE:
-		default:
-			return &asd->video_out_capture;
-		}
-	}
-
 	/* video is same in online as in continuouscapture mode */
 	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 		/*
@@ -5051,12 +5033,7 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 	src = atomisp_subdev_get_ffmt(&asd->subdev, NULL,
 				      V4L2_SUBDEV_FORMAT_ACTIVE, source_pad);
 
-	if ((sink->code == src->code &&
-	     sink->width == f->width &&
-	     sink->height == f->height) ||
-	    ((asd->isp->inputs[asd->input_curr].type == SOC_CAMERA) &&
-	     (asd->isp->inputs[asd->input_curr].camera_caps->
-	      sensor[asd->sensor_curr].stream_num > 1)))
+	if (sink->code == src->code && sink->width == f->width && sink->height == f->height)
 		asd->copy_mode = true;
 	else
 		asd->copy_mode = false;
@@ -5282,58 +5259,7 @@ int atomisp_set_fmt(struct file *file, void *unused, struct v4l2_format *f)
 			f->fmt.pix.height = r.height;
 		}
 
-		if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-		    (asd->isp->inputs[asd->input_curr].type == SOC_CAMERA) &&
-		    (asd->isp->inputs[asd->input_curr].camera_caps->
-		     sensor[asd->sensor_curr].stream_num > 1)) {
-			/* For M10MO outputing YUV preview images. */
-			u16 video_index =
-			    atomisp_source_pad_to_stream_id(asd,
-							    ATOMISP_SUBDEV_PAD_SOURCE_VIDEO);
-
-			ret = atomisp_css_copy_get_output_frame_info(asd,
-				video_index, &output_info);
-			if (ret) {
-				dev_err(isp->dev,
-					"copy_get_output_frame_info ret %i", ret);
-				return -EINVAL;
-			}
-			if (!asd->yuvpp_mode) {
-				/*
-				 * If viewfinder was configured into copy_mode,
-				 * we switch to using yuvpp pipe instead.
-				 */
-				asd->yuvpp_mode = true;
-				ret = atomisp_css_copy_configure_output(
-					  asd, video_index, 0, 0, 0, 0);
-				if (ret) {
-					dev_err(isp->dev,
-						"failed to disable copy pipe");
-					return -EINVAL;
-				}
-				ret = atomisp_css_yuvpp_configure_output(
-					  asd, video_index,
-					  output_info.res.width,
-					  output_info.res.height,
-					  output_info.padded_width,
-					  output_info.format);
-				if (ret) {
-					dev_err(isp->dev,
-						"failed to set up yuvpp pipe\n");
-					return -EINVAL;
-				}
-				atomisp_css_video_enable_online(asd, false);
-				atomisp_css_preview_enable_online(asd,
-								  ATOMISP_INPUT_STREAM_GENERAL, false);
-			}
-			atomisp_css_yuvpp_configure_viewfinder(asd, video_index,
-							       f->fmt.pix.width, f->fmt.pix.height,
-							       format_bridge->planar ? f->fmt.pix.bytesperline
-							       : f->fmt.pix.bytesperline * 8
-							       / format_bridge->depth, format_bridge->sh_fmt);
-			atomisp_css_yuvpp_get_viewfinder_frame_info(
-			    asd, video_index, &output_info);
-		} else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
+		if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
 			atomisp_css_video_configure_viewfinder(asd,
 							       f->fmt.pix.width, f->fmt.pix.height,
 							       format_bridge->planar ? f->fmt.pix.bytesperline
@@ -5918,31 +5844,7 @@ int atomisp_flash_enable(struct atomisp_sub_device *asd, int num_frames)
 int atomisp_source_pad_to_stream_id(struct atomisp_sub_device *asd,
 				    uint16_t source_pad)
 {
-	int stream_id;
-	struct atomisp_device *isp = asd->isp;
-
-	if (isp->inputs[asd->input_curr].camera_caps->
-	    sensor[asd->sensor_curr].stream_num == 1)
-		return ATOMISP_INPUT_STREAM_GENERAL;
-
-	switch (source_pad) {
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
-		stream_id = ATOMISP_INPUT_STREAM_CAPTURE;
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-		stream_id = ATOMISP_INPUT_STREAM_POSTVIEW;
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
-		stream_id = ATOMISP_INPUT_STREAM_PREVIEW;
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
-		stream_id = ATOMISP_INPUT_STREAM_VIDEO;
-		break;
-	default:
-		stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-	}
-
-	return stream_id;
+	return ATOMISP_INPUT_STREAM_GENERAL;
 }
 
 bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe)
@@ -6217,13 +6119,6 @@ int atomisp_get_invalid_frame_num(struct video_device *vdev,
 	struct ia_css_pipe_info p_info;
 	int ret;
 
-	if (asd->isp->inputs[asd->input_curr].camera_caps->
-	    sensor[asd->sensor_curr].stream_num > 1) {
-		/* External ISP */
-		*invalid_frame_num = 0;
-		return 0;
-	}
-
 	pipe_id = atomisp_get_pipe_id(pipe);
 	if (!asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].pipes[pipe_id]) {
 		dev_warn(asd->isp->dev,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 047e1180e35f..84a84e0cdeef 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -369,45 +369,6 @@ static int atomisp_get_css_buf_type(struct atomisp_sub_device *asd,
 		return IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME;
 }
 
-static int atomisp_qbuffers_to_css_for_all_pipes(struct atomisp_sub_device *asd)
-{
-	enum ia_css_buffer_type buf_type;
-	enum ia_css_pipe_id css_capture_pipe_id = IA_CSS_PIPE_ID_COPY;
-	enum ia_css_pipe_id css_preview_pipe_id = IA_CSS_PIPE_ID_COPY;
-	enum ia_css_pipe_id css_video_pipe_id = IA_CSS_PIPE_ID_COPY;
-	enum atomisp_input_stream_id input_stream_id;
-	struct atomisp_video_pipe *capture_pipe;
-	struct atomisp_video_pipe *preview_pipe;
-	struct atomisp_video_pipe *video_pipe;
-
-	capture_pipe = &asd->video_out_capture;
-	preview_pipe = &asd->video_out_preview;
-	video_pipe = &asd->video_out_video_capture;
-
-	buf_type = atomisp_get_css_buf_type(
-		       asd, css_preview_pipe_id,
-		       atomisp_subdev_source_pad(&preview_pipe->vdev));
-	input_stream_id = ATOMISP_INPUT_STREAM_PREVIEW;
-	atomisp_q_video_buffers_to_css(asd, preview_pipe,
-				       input_stream_id,
-				       buf_type, css_preview_pipe_id);
-
-	buf_type = atomisp_get_css_buf_type(asd, css_capture_pipe_id,
-					    atomisp_subdev_source_pad(&capture_pipe->vdev));
-	input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-	atomisp_q_video_buffers_to_css(asd, capture_pipe,
-				       input_stream_id,
-				       buf_type, css_capture_pipe_id);
-
-	buf_type = atomisp_get_css_buf_type(asd, css_video_pipe_id,
-					    atomisp_subdev_source_pad(&video_pipe->vdev));
-	input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
-	atomisp_q_video_buffers_to_css(asd, video_pipe,
-				       input_stream_id,
-				       buf_type, css_video_pipe_id);
-	return 0;
-}
-
 /* queue all available buffers to css */
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 {
@@ -423,11 +384,6 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 	bool raw_mode = atomisp_is_mbuscode_raw(
 			    asd->fmt[asd->capture_pad].fmt.code);
 
-	if (asd->isp->inputs[asd->input_curr].camera_caps->
-	    sensor[asd->sensor_curr].stream_num == 2 &&
-	    !asd->yuvpp_mode)
-		return atomisp_qbuffers_to_css_for_all_pipes(asd);
-
 	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
 		video_pipe = &asd->video_out_video_capture;
 		css_video_pipe_id = IA_CSS_PIPE_ID_VIDEO;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index f7fc5137199c..254e8c97f71f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -134,24 +134,6 @@ static DEFINE_MUTEX(vcm_lock);
 
 static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev);
 
-/*
- * Legacy/stub behavior copied from upstream platform_camera.c.  The
- * atomisp driver relies on these values being non-NULL in a few
- * places, even though they are hard-coded in all current
- * implementations.
- */
-const struct atomisp_camera_caps *atomisp_get_default_camera_caps(void)
-{
-	static const struct atomisp_camera_caps caps = {
-		.sensor_num = 1,
-		.sensor = {
-			{ .stream_num = 1, },
-		},
-	};
-	return &caps;
-}
-EXPORT_SYMBOL_GPL(atomisp_get_default_camera_caps);
-
 const struct atomisp_platform_data *atomisp_get_platform_data(void)
 {
 	return &pdata;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index f3ef840c640a..d9d158cdf09e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -127,9 +127,7 @@
  * Moorefield/Baytrail platform.
  */
 #define ATOMISP_SOC_CAMERA(asd)  \
-	(asd->isp->inputs[asd->input_curr].type == SOC_CAMERA \
-	&& asd->isp->inputs[asd->input_curr].camera_caps-> \
-	   sensor[asd->sensor_curr].stream_num == 1)
+	(asd->isp->inputs[asd->input_curr].type == SOC_CAMERA)
 
 #define ATOMISP_USE_YUVPP(asd)  \
 	(ATOMISP_SOC_CAMERA(asd) && ATOMISP_CSS_SUPPORT_YUVPP && \
@@ -162,7 +160,6 @@ struct atomisp_input_subdev {
 	 */
 	struct atomisp_sub_device *asd;
 
-	const struct atomisp_camera_caps *camera_caps;
 	int sensor_index;
 };
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 77c0d55ab409..cbbb25d3e5fe 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1431,16 +1431,6 @@ enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device *asd)
 
 static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
 {
-	struct atomisp_device *isp = asd->isp;
-
-	if (isp->inputs[asd->input_curr].camera_caps->
-	    sensor[asd->sensor_curr].stream_num > 1) {
-		if (asd->high_speed_mode)
-			return 1;
-		else
-			return 2;
-	}
-
 	if (asd->vfpp->val != ATOMISP_VFPP_ENABLE ||
 	    asd->copy_mode)
 		return 1;
@@ -1459,31 +1449,15 @@ static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
 int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
 	bool isp_timeout)
 {
-	unsigned int master = -1, slave = -1, delay_slave = 0;
-	int i, ret;
-
-	/*
-	 * ISP only support 2 streams now so ignore multiple master/slave
-	 * case to reduce the delay between 2 stream_on calls.
-	 */
-	for (i = 0; i < isp->num_of_streams; i++) {
-		int sensor_index = isp->asd[i].input_curr;
-
-		if (isp->inputs[sensor_index].camera_caps->
-		    sensor[isp->asd[i].sensor_curr].is_slave)
-			slave = sensor_index;
-		else
-			master = sensor_index;
-	}
+	unsigned int master, slave, delay_slave = 0;
+	int ret;
 
-	if (master == -1 || slave == -1) {
-		master = ATOMISP_DEPTH_DEFAULT_MASTER_SENSOR;
-		slave = ATOMISP_DEPTH_DEFAULT_SLAVE_SENSOR;
-		dev_warn(isp->dev,
-			 "depth mode use default master=%s.slave=%s.\n",
-			 isp->inputs[master].camera->name,
-			 isp->inputs[slave].camera->name);
-	}
+	master = ATOMISP_DEPTH_DEFAULT_MASTER_SENSOR;
+	slave = ATOMISP_DEPTH_DEFAULT_SLAVE_SENSOR;
+	dev_warn(isp->dev,
+		 "depth mode use default master=%s.slave=%s.\n",
+		 isp->inputs[master].camera->name,
+		 isp->inputs[slave].camera->name);
 
 	ret = v4l2_subdev_call(isp->inputs[master].camera, core,
 			       ioctl, ATOMISP_IOC_G_DEPTH_SYNC_COMP,
@@ -1517,24 +1491,6 @@ int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
 	return 0;
 }
 
-static void atomisp_pause_buffer_event(struct atomisp_device *isp)
-{
-	struct v4l2_event event = {0};
-	int i;
-
-	event.type = V4L2_EVENT_ATOMISP_PAUSE_BUFFER;
-
-	for (i = 0; i < isp->num_of_streams; i++) {
-		int sensor_index = isp->asd[i].input_curr;
-
-		if (isp->inputs[sensor_index].camera_caps->
-		    sensor[isp->asd[i].sensor_curr].is_slave) {
-			v4l2_event_queue(isp->asd[i].subdev.devnode, &event);
-			break;
-		}
-	}
-}
-
 /* Input system HW workaround */
 /* Input system address translation corrupts burst during */
 /* invalidate. SW workaround for this is to set burst length */
@@ -1608,8 +1564,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 	/* Reset pending capture request count. */
 	asd->pending_capture_request = 0;
 
-	if ((atomisp_subdev_streaming_count(asd) > sensor_start_stream) &&
-	    (!isp->inputs[asd->input_curr].camera_caps->multi_stream_ctrl)) {
+	if (atomisp_subdev_streaming_count(asd) > sensor_start_stream) {
 		/* trigger still capture */
 		if (asd->continuous_mode->val &&
 		    atomisp_subdev_source_pad(vdev)
@@ -1651,9 +1606,6 @@ static int atomisp_streamon(struct file *file, void *fh,
 					asd->params.offline_parm.offset);
 				if (ret)
 					return -EINVAL;
-
-				if (asd->depth_mode->val)
-					atomisp_pause_buffer_event(isp);
 			}
 		}
 		atomisp_qbuffers_to_css(asd);
@@ -1809,17 +1761,10 @@ int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * do only videobuf_streamoff for capture & vf pipes in
 	 * case of continuous capture
 	 */
-	if ((asd->continuous_mode->val ||
-	     isp->inputs[asd->input_curr].camera_caps->multi_stream_ctrl) &&
-	    atomisp_subdev_source_pad(vdev) !=
-	    ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
-	    atomisp_subdev_source_pad(vdev) !=
-	    ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
-		if (isp->inputs[asd->input_curr].camera_caps->multi_stream_ctrl) {
-			v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					 video, s_stream, 0);
-		} else if (atomisp_subdev_source_pad(vdev)
-			   == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE) {
+	if (asd->continuous_mode->val &&
+	    atomisp_subdev_source_pad(vdev) != ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW &&
+	    atomisp_subdev_source_pad(vdev) != ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
+		if (atomisp_subdev_source_pad(vdev) == ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE) {
 			/* stop continuous still capture if needed */
 			if (asd->params.offline_parm.num_captures == -1)
 				atomisp_css_offline_capture_configure(asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 43e6a1d1e410..a1f4da35235d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -313,9 +313,6 @@ struct atomisp_sub_device {
 
 	/* This field specifies which camera (v4l2 input) is selected. */
 	int input_curr;
-	/* This field specifies which sensor is being selected when there
-	   are multiple sensors connected to the same MIPI port. */
-	int sensor_curr;
 
 	atomic_t sof_count;
 	atomic_t sequence;      /* Sequence value that is assigned to buffer. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 026ff3ca5c04..d5bb9906ca6f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1007,7 +1007,6 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			    &subdevs->v4l2_subdev.board_info;
 		struct i2c_adapter *adapter =
 		    i2c_get_adapter(subdevs->v4l2_subdev.i2c_adapter_id);
-		int sensor_num, i;
 
 		dev_info(isp->dev, "Probing Subdev %s\n", board_info->type);
 
@@ -1066,22 +1065,7 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 			 * pixel_format.
 			 */
 			isp->inputs[isp->input_cnt].frame_size.pixel_format = 0;
-			isp->inputs[isp->input_cnt].camera_caps =
-			    atomisp_get_default_camera_caps();
-			sensor_num = isp->inputs[isp->input_cnt]
-				     .camera_caps->sensor_num;
 			isp->input_cnt++;
-			for (i = 1; i < sensor_num; i++) {
-				if (isp->input_cnt >= ATOM_ISP_MAX_INPUTS) {
-					dev_warn(isp->dev,
-						 "atomisp inputs out of range\n");
-					break;
-				}
-				isp->inputs[isp->input_cnt] =
-				    isp->inputs[isp->input_cnt - 1];
-				isp->inputs[isp->input_cnt].sensor_index = i;
-				isp->input_cnt++;
-			}
 			break;
 		case CAMERA_MOTOR:
 			if (isp->motor) {
@@ -1239,8 +1223,6 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 			"TPG detected, camera_cnt: %d\n", isp->input_cnt);
 		isp->inputs[isp->input_cnt].type = TEST_PATTERN;
 		isp->inputs[isp->input_cnt].port = -1;
-		isp->inputs[isp->input_cnt].camera_caps =
-		    atomisp_get_default_camera_caps();
 		isp->inputs[isp->input_cnt++].camera = &isp->tpg.sd;
 	} else {
 		dev_warn(isp->dev, "too many atomisp inputs, TPG ignored.\n");
-- 
2.37.3

