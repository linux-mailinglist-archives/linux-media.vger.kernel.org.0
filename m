Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0CAB5B502A
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIKRRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiIKRRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102122610F
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MpfpnngY8xJA21vivoYJfkHMf7xjyv0hCejhKICi13I=;
        b=VjlB9GQ4RzYyG1gnGPH0dXyMKLbvUa0OSDdIVjFc7ya2+nC3ZpdjGUhvDDA4zVVr3e8rJg
        qIbc7EEBpj4ay/+j5FInJSPvwjn0wb3fr5d2RGJCs3mrQa60aDfyOUG2pACrYSdl7yr8jT
        spMakigzuaBtbZUIWfhnX99l3HcJDwc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-5zjlwUB5Ps6bw3bwIqZmlw-1; Sun, 11 Sep 2022 13:17:06 -0400
X-MC-Unique: 5zjlwUB5Ps6bw3bwIqZmlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433F41C05156;
        Sun, 11 Sep 2022 17:17:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BEB3B492C3B;
        Sun, 11 Sep 2022 17:17:04 +0000 (UTC)
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
Subject: [PATCH 05/17] media: atomisp: Add atomisp_pipe_check() helper
Date:   Sun, 11 Sep 2022 19:16:41 +0200
Message-Id: <20220911171653.568932-6-hdegoede@redhat.com>
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

Several of the ioctl handlers all do the same checks
(isp->fatal_error and asd->streaming errors) add
an atomisp_pipe_check() helper for this.

Note this changes the vidioc_s_fmt_vid_cap and vidioc_s_input handlers
to now reject calls made while asd->streaming==STOPPING. This fixes
a possible race where one thread can make this ioctls while
vidioc_streamoff is running from another thread and it has
temporarily released isp->mutex to kill the watchdog timers / work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  9 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 89 +++++++++----------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  2 +
 3 files changed, 48 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 087078900415..7945852ecd13 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5549,16 +5549,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct v4l2_subdev_fh fh;
 	int ret;
 
-	lockdep_assert_held(&isp->mutex);
+	ret = atomisp_pipe_check(pipe, true);
+	if (ret)
+		return ret;
 
 	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
 		return -EINVAL;
 
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
-		dev_warn(isp->dev, "ISP does not support set format while at streaming!\n");
-		return -EBUSY;
-	}
-
 	dev_dbg(isp->dev,
 		"setting resolution %ux%u on pad %u for asd%d, bytesperline %u\n",
 		f->fmt.pix.width, f->fmt.pix.height, source_pad,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 9c7022be3a06..9b50f637c46a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -535,6 +535,32 @@ atomisp_get_format_bridge_from_mbus(u32 mbus_code)
 	return NULL;
 }
 
+int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
+{
+	lockdep_assert_held(&pipe->isp->mutex);
+
+	if (pipe->isp->isp_fatal_error)
+		return -EIO;
+
+	switch (pipe->asd->streaming) {
+	case ATOMISP_DEVICE_STREAMING_DISABLED:
+		break;
+	case ATOMISP_DEVICE_STREAMING_ENABLED:
+		if (settings_change) {
+			dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
+			return -EBUSY;
+		}
+		break;
+	case ATOMISP_DEVICE_STREAMING_STOPPING:
+		dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
+		return -EBUSY;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * v4l2 ioctls
  * return ISP capabilities
@@ -646,12 +672,18 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_subdev *camera = NULL;
 	struct v4l2_subdev *motor;
 	int ret;
 
 	mutex_lock(&isp->mutex);
+
+	ret = atomisp_pipe_check(pipe, true);
+	if (ret)
+		goto error;
+
 	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
 		ret = -EINVAL;
@@ -678,13 +710,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		goto error;
 	}
 
-	if (atomisp_subdev_streaming_count(asd)) {
-		dev_err(isp->dev,
-			"ISP is still streaming, stop first\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
 	/* power off the current owned sensor, as it is not used this time */
 	if (isp->inputs[asd->input_curr].asd == asd &&
 	    asd->input_curr != input) {
@@ -976,11 +1001,6 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 	int ret;
 
 	mutex_lock(&isp->mutex);
-	if (isp->isp_fatal_error) {
-		ret = -EIO;
-		mutex_unlock(&isp->mutex);
-		return ret;
-	}
 	ret = atomisp_set_fmt(vdev, f);
 	mutex_unlock(&isp->mutex);
 	return ret;
@@ -1236,20 +1256,13 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct ia_css_frame *handle = NULL;
 	u32 length;
 	u32 pgnr;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&isp->mutex);
-	if (isp->isp_fatal_error) {
-		ret = -EIO;
-		goto error;
-	}
 
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
-		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
-			__func__);
-		ret = -EIO;
+	ret = atomisp_pipe_check(pipe, false);
+	if (ret)
 		goto error;
-	}
 
 	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
 	    !pipe->capq.bufs[buf->index]) {
@@ -1418,23 +1431,13 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&isp->mutex);
-
-	if (isp->isp_fatal_error) {
-		mutex_unlock(&isp->mutex);
-		return -EIO;
-	}
-
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
-		mutex_unlock(&isp->mutex);
-		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
-			__func__);
-		return -EIO;
-	}
-
+	ret = atomisp_pipe_check(pipe, false);
 	mutex_unlock(&isp->mutex);
+	if (ret)
+		return ret;
 
 	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
 	if (ret) {
@@ -1668,8 +1671,8 @@ static int atomisp_streamon(struct file *file, void *fh,
 	enum ia_css_pipe_id css_pipe_id;
 	unsigned int sensor_start_stream;
 	unsigned int wdt_duration = ATOMISP_ISP_TIMEOUT_DURATION;
-	int ret = 0;
 	unsigned long irqflags;
+	int ret;
 
 	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
 		atomisp_subdev_source_pad(vdev), asd->index);
@@ -1680,15 +1683,9 @@ static int atomisp_streamon(struct file *file, void *fh,
 	}
 
 	mutex_lock(&isp->mutex);
-	if (isp->isp_fatal_error) {
-		ret = -EIO;
-		goto out;
-	}
-
-	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
-		ret = -EBUSY;
+	ret = atomisp_pipe_check(pipe, false);
+	if (ret)
 		goto out;
-	}
 
 	if (pipe->capq.streaming)
 		goto out;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 382b78275240..61a6148a6ad5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -34,6 +34,8 @@ atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
 const struct
 atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
 
+int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
+
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id);
 
-- 
2.37.3

