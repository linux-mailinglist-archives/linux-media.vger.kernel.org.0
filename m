Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8E75B502F
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiIKRRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIKRRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8010727CD1
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9RE/Hin1IiWsyuRAlXgx83+pTxhEfwb2z+DtVy8bnmQ=;
        b=JRCtNOUrBpdVY7yVu+ayxdh+xe7YdypgheNEDkcD13lOV4BueFZ2RH+IL+5hszn6q+RCJ8
        UaFQ31Q8xxUA8gvV8CnLSyqYM/3ScIaPC7oqrNHv8/RkGrT7xR54rgdHEfuQ4YcRi98u+P
        JCzMcAxDl8+6Ql/yE9a0EWwXImot7xA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-FByNztNuNVKq1cqXvNCGJA-1; Sun, 11 Sep 2022 13:17:15 -0400
X-MC-Unique: FByNztNuNVKq1cqXvNCGJA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2C629AB3FA;
        Sun, 11 Sep 2022 17:17:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 798EC492C3B;
        Sun, 11 Sep 2022 17:17:13 +0000 (UTC)
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
Subject: [PATCH 10/17] media: atomisp: Use video_dev.lock for ioctl locking
Date:   Sun, 11 Sep 2022 19:16:46 +0200
Message-Id: <20220911171653.568932-11-hdegoede@redhat.com>
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

Set video_dev.lock to point to isp->mutex so that the core does
the locking surroundig ioctls for us and drop all the now no longer
necessary (and conflicting) locking from the ioctl handling code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 203 ++++--------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
 2 files changed, 42 insertions(+), 162 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6d84a7e9cb57..42d8d1267553 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -655,13 +655,9 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp)
 static int atomisp_g_input(struct file *file, void *fh, unsigned int *input)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 
-	mutex_lock(&isp->mutex);
 	*input = asd->input_curr;
-	mutex_unlock(&isp->mutex);
-
 	return 0;
 }
 
@@ -678,16 +674,13 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	struct v4l2_subdev *motor;
 	int ret;
 
-	mutex_lock(&isp->mutex);
-
 	ret = atomisp_pipe_check(pipe, true);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
-		ret = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 
 	/*
@@ -699,15 +692,13 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		dev_err(isp->dev,
 			"%s, camera is already used by stream: %d\n", __func__,
 			isp->inputs[input].asd->index);
-		ret = -EBUSY;
-		goto error;
+		return -EBUSY;
 	}
 
 	camera = isp->inputs[input].camera;
 	if (!camera) {
 		dev_err(isp->dev, "%s, no camera\n", __func__);
-		ret = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 
 	/* power off the current owned sensor, as it is not used this time */
@@ -726,7 +717,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	ret = v4l2_subdev_call(isp->inputs[input].camera, core, s_power, 1);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power-on sensor\n");
-		goto error;
+		return ret;
 	}
 	/*
 	 * Some sensor driver resets the run mode during power-on, thus force
@@ -739,7 +730,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 			       0, isp->inputs[input].sensor_index, 0);
 	if (ret && (ret != -ENOIOCTLCMD)) {
 		dev_err(isp->dev, "Failed to select sensor\n");
-		goto error;
+		return ret;
 	}
 
 	if (!IS_ISP2401) {
@@ -756,14 +747,8 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	asd->input_curr = input;
 	/* mark this camera is used by the current stream */
 	isp->inputs[input].asd = asd;
-	mutex_unlock(&isp->mutex);
 
 	return 0;
-
-error:
-	mutex_unlock(&isp->mutex);
-
-	return ret;
 }
 
 static int atomisp_enum_framesizes(struct file *file, void *priv,
@@ -838,15 +823,12 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
-
 	rval = v4l2_subdev_call(camera, pad, enum_mbus_code, NULL, &code);
 	if (rval == -ENOIOCTLCMD) {
 		dev_warn(isp->dev,
 			 "enum_mbus_code pad op not supported by %s. Please fix your sensor driver!\n",
 			 camera->name);
 	}
-	mutex_unlock(&isp->mutex);
 
 	if (rval)
 		return rval;
@@ -949,7 +931,6 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 			       struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
 	/*
@@ -959,10 +940,7 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	f->fmt.pix.width += pad_w;
 	f->fmt.pix.height += pad_h;
 
-	mutex_lock(&isp->mutex);
 	ret = atomisp_try_fmt(vdev, &f->fmt.pix, NULL);
-	mutex_unlock(&isp->mutex);
-
 	if (ret)
 		return ret;
 
@@ -973,12 +951,9 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe;
 
-	mutex_lock(&isp->mutex);
 	pipe = atomisp_to_video_pipe(vdev);
-	mutex_unlock(&isp->mutex);
 
 	f->fmt.pix = pipe->pix;
 
@@ -997,13 +972,8 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int ret;
 
-	mutex_lock(&isp->mutex);
-	ret = atomisp_set_fmt(vdev, f);
-	mutex_unlock(&isp->mutex);
-	return ret;
+	return atomisp_set_fmt(vdev, f);
 }
 
 /*
@@ -1217,15 +1187,7 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 int atomisp_reqbufs(struct file *file, void *fh,
 		    struct v4l2_requestbuffers *req)
 {
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int ret;
-
-	mutex_lock(&isp->mutex);
-	ret = __atomisp_reqbufs(file, fh, req);
-	mutex_unlock(&isp->mutex);
-
-	return ret;
+	return __atomisp_reqbufs(file, fh, req);
 }
 
 /* application query the status of a buffer */
@@ -1258,17 +1220,14 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	u32 pgnr;
 	int ret;
 
-	mutex_lock(&isp->mutex);
-
 	ret = atomisp_pipe_check(pipe, false);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
 	    !pipe->capq.bufs[buf->index]) {
 		dev_err(isp->dev, "Invalid index for qbuf.\n");
-		ret = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 
 	/*
@@ -1278,16 +1237,13 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	if (buf->memory == V4L2_MEMORY_USERPTR) {
 		if (offset_in_page(buf->m.userptr)) {
 			dev_err(isp->dev, "Error userptr is not page aligned.\n");
-			ret = -EINVAL;
-			goto error;
+			return -EINVAL;
 		}
 
 		vb = pipe->capq.bufs[buf->index];
 		vm_mem = vb->priv;
-		if (!vm_mem) {
-			ret = -EINVAL;
-			goto error;
-		}
+		if (!vm_mem)
+			return -EINVAL;
 
 		length = vb->bsize;
 		pgnr = (length + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
@@ -1296,17 +1252,15 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			goto done;
 
 		if (atomisp_get_css_frame_info(asd,
-					       atomisp_subdev_source_pad(vdev), &frame_info)) {
-			ret = -EIO;
-			goto error;
-		}
+					       atomisp_subdev_source_pad(vdev), &frame_info))
+			return -EIO;
 
 		ret = ia_css_frame_map(&handle, &frame_info,
 					    (void __user *)buf->m.userptr,
 					    pgnr);
 		if (ret) {
 			dev_err(isp->dev, "Failed to map user buffer\n");
-			goto error;
+			return ret;
 		}
 
 		if (vm_mem->vaddr) {
@@ -1351,11 +1305,10 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	pipe->frame_params[buf->index] = NULL;
 
 	mutex_unlock(&isp->mutex);
-
 	ret = videobuf_qbuf(&pipe->capq, buf);
 	mutex_lock(&isp->mutex);
 	if (ret)
-		goto error;
+		return ret;
 
 	/* TODO: do this better, not best way to queue to css */
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
@@ -1384,16 +1337,11 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 			asd->pending_capture_request++;
 			dev_dbg(isp->dev, "Add one pending capture request.\n");
 	}
-	mutex_unlock(&isp->mutex);
 
 	dev_dbg(isp->dev, "qbuf buffer %d (%s) for asd%d\n", buf->index,
 		vdev->name, asd->index);
 
-	return ret;
-
-error:
-	mutex_unlock(&isp->mutex);
-	return ret;
+	return 0;
 }
 
 static int __get_frame_exp_id(struct atomisp_video_pipe *pipe,
@@ -1424,19 +1372,19 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	int ret;
 
-	mutex_lock(&isp->mutex);
 	ret = atomisp_pipe_check(pipe, false);
-	mutex_unlock(&isp->mutex);
 	if (ret)
 		return ret;
 
+	mutex_unlock(&isp->mutex);
 	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
+	mutex_lock(&isp->mutex);
 	if (ret) {
 		if (ret != -EAGAIN)
 			dev_dbg(isp->dev, "<%s: %d\n", __func__, ret);
 		return ret;
 	}
-	mutex_lock(&isp->mutex);
+
 	buf->bytesused = pipe->pix.sizeimage;
 	buf->reserved = asd->frame_status[buf->index];
 
@@ -1450,7 +1398,6 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
 		buf->reserved |= __get_frame_exp_id(pipe, buf) << 16;
 	buf->reserved2 = pipe->frame_config_id[buf->index];
-	mutex_unlock(&isp->mutex);
 
 	dev_dbg(isp->dev,
 		"dqbuf buffer %d (%s) for asd%d with exp_id %d, isp_config_id %d\n",
@@ -1645,13 +1592,12 @@ static int atomisp_streamon(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
 	ret = atomisp_pipe_check(pipe, false);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (pipe->capq.streaming)
-		goto out;
+		return 0;
 
 	/* Input system HW workaround */
 	atomisp_dma_burst_len_cfg(asd);
@@ -1666,14 +1612,13 @@ static int atomisp_streamon(struct file *file, void *fh,
 	if (list_empty(&pipe->capq.stream)) {
 		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 		dev_dbg(isp->dev, "no buffer in the queue\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
 
 	ret = videobuf_streamon(&pipe->capq);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* Reset pending capture request count. */
 	asd->pending_capture_request = 0;
@@ -1694,10 +1639,10 @@ static int atomisp_streamon(struct file *file, void *fh,
 			if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED) {
 				flush_work(&asd->delayed_init_work);
 				mutex_unlock(&isp->mutex);
-				if (wait_for_completion_interruptible(
-					&asd->init_done) != 0)
-					return -ERESTARTSYS;
+				ret = wait_for_completion_interruptible(&asd->init_done);
 				mutex_lock(&isp->mutex);
+				if (ret != 0)
+					return -ERESTARTSYS;
 			}
 
 			/* handle per_frame_setting parameter and buffers */
@@ -1719,16 +1664,15 @@ static int atomisp_streamon(struct file *file, void *fh,
 					asd->params.offline_parm.num_captures,
 					asd->params.offline_parm.skip_frames,
 					asd->params.offline_parm.offset);
-				if (ret) {
-					ret = -EINVAL;
-					goto out;
-				}
+				if (ret)
+					return -EINVAL;
+
 				if (asd->depth_mode->val)
 					atomisp_pause_buffer_event(isp);
 			}
 		}
 		atomisp_qbuffers_to_css(asd);
-		goto out;
+		return 0;
 	}
 
 	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
@@ -1754,7 +1698,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	ret = atomisp_css_start(asd, css_pipe_id, false);
 	if (ret)
-		goto out;
+		return ret;
 
 	spin_lock_irqsave(&isp->lock, irqflags);
 	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
@@ -1775,7 +1719,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 
 	/* Only start sensor when the last streaming instance started */
 	if (atomisp_subdev_streaming_count(asd) < sensor_start_stream)
-		goto out;
+		return 0;
 
 start_sensor:
 	if (isp->flash) {
@@ -1806,7 +1750,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		ret = atomisp_stream_on_master_slave_sensor(isp, false);
 		if (ret) {
 			dev_err(isp->dev, "master slave sensor stream on failed!\n");
-			goto out;
+			return ret;
 		}
 		goto start_delay_wq;
 	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
@@ -1828,8 +1772,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 		spin_lock_irqsave(&isp->lock, irqflags);
 		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
 		spin_unlock_irqrestore(&isp->lock, irqflags);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 start_delay_wq:
@@ -1846,9 +1789,8 @@ static int atomisp_streamon(struct file *file, void *fh,
 	} else {
 		asd->delayed_init = ATOMISP_DELAYED_INIT_NOT_QUEUED;
 	}
-out:
-	mutex_unlock(&isp->mutex);
-	return ret;
+
+	return 0;
 }
 
 int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
@@ -2076,15 +2018,7 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 static int atomisp_streamoff(struct file *file, void *fh,
 			     enum v4l2_buf_type type)
 {
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int rval;
-
-	mutex_lock(&isp->mutex);
-	rval = __atomisp_streamoff(file, fh, type);
-	mutex_unlock(&isp->mutex);
-
-	return rval;
+	return __atomisp_streamoff(file, fh, type);
 }
 
 /*
@@ -2110,8 +2044,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	mutex_lock(&isp->mutex);
-
 	switch (control->id) {
 	case V4L2_CID_IRIS_ABSOLUTE:
 	case V4L2_CID_EXPOSURE_ABSOLUTE:
@@ -2133,7 +2065,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 	case V4L2_CID_TEST_PATTERN_COLOR_GR:
 	case V4L2_CID_TEST_PATTERN_COLOR_GB:
 	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		mutex_unlock(&isp->mutex);
 		return v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
 				   ctrl_handler, control);
 	case V4L2_CID_COLORFX:
@@ -2162,7 +2093,6 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
 		break;
 	}
 
-	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -2189,7 +2119,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	mutex_lock(&isp->mutex);
 	switch (control->id) {
 	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
 	case V4L2_CID_EXPOSURE:
@@ -2210,7 +2139,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 	case V4L2_CID_TEST_PATTERN_COLOR_GR:
 	case V4L2_CID_TEST_PATTERN_COLOR_GB:
 	case V4L2_CID_TEST_PATTERN_COLOR_B:
-		mutex_unlock(&isp->mutex);
 		return v4l2_s_ctrl(NULL,
 				   isp->inputs[asd->input_curr].camera->
 				   ctrl_handler, control);
@@ -2242,7 +2170,6 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 		ret = -EINVAL;
 		break;
 	}
-	mutex_unlock(&isp->mutex);
 	return ret;
 }
 
@@ -2355,9 +2282,7 @@ static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
 						&ctrl);
 			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
-			mutex_lock(&isp->mutex);
 			ret = atomisp_digital_zoom(asd, 0, &ctrl.value);
-			mutex_unlock(&isp->mutex);
 			break;
 		case V4L2_CID_G_SKIP_FRAMES:
 			ret = v4l2_subdev_call(
@@ -2464,7 +2389,6 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 		case V4L2_CID_FLASH_STROBE:
 		case V4L2_CID_FLASH_MODE:
 		case V4L2_CID_FLASH_STATUS_REGISTER:
-			mutex_lock(&isp->mutex);
 			if (isp->flash) {
 				ret =
 				    v4l2_s_ctrl(NULL, isp->flash->ctrl_handler,
@@ -2479,12 +2403,9 @@ static int atomisp_camera_s_ext_ctrls(struct file *file, void *fh,
 					asd->params.num_flash_frames = 0;
 				}
 			}
-			mutex_unlock(&isp->mutex);
 			break;
 		case V4L2_CID_ZOOM_ABSOLUTE:
-			mutex_lock(&isp->mutex);
 			ret = atomisp_digital_zoom(asd, 1, &ctrl.value);
-			mutex_unlock(&isp->mutex);
 			break;
 		default:
 			ctr = v4l2_ctrl_find(&asd->ctrl_handler, ctrl.id);
@@ -2546,9 +2467,7 @@ static int atomisp_g_parm(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
 	parm->parm.capture.capturemode = asd->run_mode->val;
-	mutex_unlock(&isp->mutex);
 
 	return 0;
 }
@@ -2568,8 +2487,6 @@ static int atomisp_s_parm(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
-	mutex_lock(&isp->mutex);
-
 	asd->high_speed_mode = false;
 	switch (parm->parm.capture.capturemode) {
 	case CI_MODE_NONE: {
@@ -2588,7 +2505,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 				asd->high_speed_mode = true;
 		}
 
-		goto out;
+		return rval == -ENOIOCTLCMD ? 0 : rval;
 	}
 	case CI_MODE_VIDEO:
 		mode = ATOMISP_RUN_MODE_VIDEO;
@@ -2603,15 +2520,11 @@ static int atomisp_s_parm(struct file *file, void *fh,
 		mode = ATOMISP_RUN_MODE_PREVIEW;
 		break;
 	default:
-		rval = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rval = v4l2_ctrl_s_ctrl(asd->run_mode, mode);
 
-out:
-	mutex_unlock(&isp->mutex);
-
 	return rval == -ENOIOCTLCMD ? 0 : rval;
 }
 
@@ -2629,24 +2542,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 	else
 		motor = isp->motor;
 
-	switch (cmd) {
-	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-	case ATOMISP_IOC_S_EXPOSURE:
-	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
-	case ATOMISP_IOC_EXT_ISP_CTRL:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_INFO:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT:
-	case ATOMISP_IOC_S_SENSOR_EE_CONFIG:
-	case ATOMISP_IOC_G_UPDATE_EXPOSURE:
-		/* we do not need take isp->mutex for these IOCTLs */
-		break;
-	default:
-		mutex_lock(&isp->mutex);
-		break;
-	}
 	switch (cmd) {
 	case ATOMISP_IOC_S_SENSOR_RUNMODE:
 		if (IS_ISP2401)
@@ -2893,22 +2788,6 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 		break;
 	}
 
-	switch (cmd) {
-	case ATOMISP_IOC_G_MOTOR_PRIV_INT_DATA:
-	case ATOMISP_IOC_S_EXPOSURE:
-	case ATOMISP_IOC_G_SENSOR_CALIBRATION_GROUP:
-	case ATOMISP_IOC_G_SENSOR_PRIV_INT_DATA:
-	case ATOMISP_IOC_EXT_ISP_CTRL:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_INFO:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_G_SENSOR_AE_BRACKETING_MODE:
-	case ATOMISP_IOC_S_SENSOR_AE_BRACKETING_LUT:
-	case ATOMISP_IOC_G_UPDATE_EXPOSURE:
-		break;
-	default:
-		mutex_unlock(&isp->mutex);
-		break;
-	}
 	return err;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 4ab91858d308..026ff3ca5c04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -441,6 +441,7 @@ int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
 		video->pad.flags = MEDIA_PAD_FL_SINK;
 		video->vdev.fops = &atomisp_fops;
 		video->vdev.ioctl_ops = &atomisp_ioctl_ops;
+		video->vdev.lock = &video->isp->mutex;
 		break;
 	default:
 		return -EINVAL;
-- 
2.37.3

