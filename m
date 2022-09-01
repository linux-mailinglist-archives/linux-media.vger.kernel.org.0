Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5F25A9383
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbiIAJrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbiIAJrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2611110DE54
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OE4weXk7St4JnHhudnyzzX5zLdiB6aoiQ7WPII8himM=;
        b=XptxlMMMin07kG0r6hUv2TKOFCRxYnHpX28ackxtjnSP9zvcx+I6A7dRJuGu+nxZhhmPi9
        kxmThOce0r1n41FVKvk6QubZZjfodqjs4aJEjbWJaMxPj9LjTEdeFGktZ8u65NdQ6EWu/Q
        9Hzwbx57tgKZQ41Qjun7lxQA4rtyuws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-v_WKnFUlNBmquGoPqziqXQ-1; Thu, 01 Sep 2022 05:47:03 -0400
X-MC-Unique: v_WKnFUlNBmquGoPqziqXQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DABD10A5CDC;
        Thu,  1 Sep 2022 09:46:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DD721403344;
        Thu,  1 Sep 2022 09:46:45 +0000 (UTC)
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
Subject: [PATCH 06/14] media: atomisp: Remove the ACC device node
Date:   Thu,  1 Sep 2022 11:46:18 +0200
Message-Id: <20220901094626.11513-7-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
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

The ACC /dev/video# device node uses a struct video_device embedded in
an atomisp_acc_pipe struct instead of in an atomisp_video_pipe struct.
Yet it uses the same file-ops and ioctl-ops even though it does not have
a videobuf queue, which makes e.g. the mmap fop nonsense.

Worse the only file-ops / ioctls which differentiate between
the 2 types and correctly do container_of on the right type
are the open/release fops and the vidioc_default handler.

The mmap and poll fops and *all* other ioctl handlers unconditionally
do container_of on the passed in struct video_device blindly assuming
they are dealing with the one embedded in the atomisp_video_pipe struct.

This makes it trivial for userspace to cause all sort of undefined behavior
by calling mmap, poll or the other ioctls on the ACC device node!

Presumably the use of the ACC device node was to allow making the special
ioctls to load custom programs while the other /dev/video# nodes were
already open, since the /dev/video# nodes can currently all be opened
only once (which needs to be fixed).

commit 4bbca788b6eb ("media: atomisp: remove private acceleration ioctls")
has removed the custom ATOMISP_ACC_* ioctls, so there no longer is any
reason to keep the ACC device node.

As explained above its presence can easily cause the kernel to crash,
so remove the ACC device node and the code for handling it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  9 ---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  1 -
 .../staging/media/atomisp/pci/atomisp_fops.c  | 69 ++++---------------
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  9 +--
 .../media/atomisp/pci/atomisp_subdev.c        | 18 -----
 .../media/atomisp/pci/atomisp_subdev.h        |  9 ---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 18 -----
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |  3 -
 8 files changed, 16 insertions(+), 120 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8e6c10f25318..1c4748b7186e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -98,15 +98,6 @@ struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev)
 	       container_of(dev, struct atomisp_video_pipe, vdev);
 }
 
-/*
- * get struct atomisp_acc_pipe from v4l2 video_device
- */
-struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device *dev)
-{
-	return (struct atomisp_acc_pipe *)
-	       container_of(dev, struct atomisp_acc_pipe, vdev);
-}
-
 static unsigned short atomisp_get_sensor_fps(struct atomisp_sub_device *asd)
 {
 	struct v4l2_subdev_frame_interval fi = { 0 };
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index ed1ad5389104..c4472516487b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -54,7 +54,6 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 		  unsigned int size);
 struct camera_mipi_info *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd);
 struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
-struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device *dev);
 int atomisp_reset(struct atomisp_device *isp);
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
 void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index ab767b585011..3fa3c28b1a80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -684,8 +684,7 @@ static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
 	return asd->video_out_preview.users +
 	       asd->video_out_vf.users +
 	       asd->video_out_capture.users +
-	       asd->video_out_video_capture.users +
-	       asd->video_acc.users;
+	       asd->video_out_video_capture.users;
 }
 
 unsigned int atomisp_dev_users(struct atomisp_device *isp)
@@ -702,10 +701,8 @@ static int atomisp_open(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = NULL;
-	struct atomisp_acc_pipe *acc_pipe = NULL;
-	struct atomisp_sub_device *asd;
-	bool acc_node = false;
+	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+	struct atomisp_sub_device *asd = pipe->asd;
 	int ret;
 
 	dev_dbg(isp->dev, "open device %s\n", vdev->name);
@@ -736,14 +733,6 @@ static int atomisp_open(struct file *file)
 
 	rt_mutex_lock(&isp->mutex);
 
-	acc_node = !strcmp(vdev->name, "ATOMISP ISP ACC");
-	if (acc_node) {
-		acc_pipe = atomisp_to_acc_pipe(vdev);
-		asd = acc_pipe->asd;
-	} else {
-		pipe = atomisp_to_video_pipe(vdev);
-		asd = pipe->asd;
-	}
 	asd->subdev.devnode = vdev;
 	/* Deferred firmware loading case. */
 	if (isp->css_env.isp_css_fw.bytes == 0) {
@@ -765,14 +754,6 @@ static int atomisp_open(struct file *file)
 		isp->css_env.isp_css_fw.data = NULL;
 	}
 
-	if (acc_node && acc_pipe->users) {
-		dev_dbg(isp->dev, "acc node already opened\n");
-		rt_mutex_unlock(&isp->mutex);
-		return -EBUSY;
-	} else if (acc_node) {
-		goto dev_init;
-	}
-
 	if (!isp->input_cnt) {
 		dev_err(isp->dev, "no camera attached\n");
 		ret = -EINVAL;
@@ -792,7 +773,6 @@ static int atomisp_open(struct file *file)
 	if (ret)
 		goto error;
 
-dev_init:
 	if (atomisp_dev_users(isp)) {
 		dev_dbg(isp->dev, "skip init isp in open\n");
 		goto init_subdev;
@@ -827,16 +807,11 @@ static int atomisp_open(struct file *file)
 	atomisp_subdev_init_struct(asd);
 
 done:
-
-	if (acc_node)
-		acc_pipe->users++;
-	else
-		pipe->users++;
+	pipe->users++;
 	rt_mutex_unlock(&isp->mutex);
 
 	/* Ensure that a mode is set */
-	if (!acc_node)
-		v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
+	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 	return 0;
 
@@ -852,10 +827,8 @@ static int atomisp_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe;
-	struct atomisp_acc_pipe *acc_pipe;
-	struct atomisp_sub_device *asd;
-	bool acc_node;
+	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
+	struct atomisp_sub_device *asd = pipe->asd;
 	struct v4l2_requestbuffers req;
 	struct v4l2_subdev_fh fh;
 	struct v4l2_rect clear_compose = {0};
@@ -871,19 +844,9 @@ static int atomisp_release(struct file *file)
 	rt_mutex_lock(&isp->mutex);
 
 	dev_dbg(isp->dev, "release device %s\n", vdev->name);
-	acc_node = !strcmp(vdev->name, "ATOMISP ISP ACC");
-	if (acc_node) {
-		acc_pipe = atomisp_to_acc_pipe(vdev);
-		asd = acc_pipe->asd;
-	} else {
-		pipe = atomisp_to_video_pipe(vdev);
-		asd = pipe->asd;
-	}
+
 	asd->subdev.devnode = vdev;
-	if (acc_node) {
-		acc_pipe->users--;
-		goto subdev_uninit;
-	}
+
 	pipe->users--;
 
 	if (pipe->capq.streaming)
@@ -921,7 +884,7 @@ static int atomisp_release(struct file *file)
 					V4L2_SUBDEV_FORMAT_ACTIVE,
 					ATOMISP_SUBDEV_PAD_SINK, &isp_sink_fmt);
 	}
-subdev_uninit:
+
 	if (atomisp_subdev_users(asd))
 		goto done;
 
@@ -956,13 +919,11 @@ static int atomisp_release(struct file *file)
 		dev_err(isp->dev, "Failed to power off device\n");
 
 done:
-	if (!acc_node) {
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
-					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     atomisp_subdev_source_pad(vdev),
-					     V4L2_SEL_TGT_COMPOSE, 0,
-					     &clear_compose);
-	}
+	atomisp_subdev_set_selection(&asd->subdev, fh.state,
+				     V4L2_SUBDEV_FORMAT_ACTIVE,
+				     atomisp_subdev_source_pad(vdev),
+				     V4L2_SEL_TGT_COMPOSE, 0,
+				     &clear_compose);
 	rt_mutex_unlock(&isp->mutex);
 	mutex_unlock(&isp->streamoff_mutex);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 7f89226c858a..bdbb9dbbceec 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -2773,17 +2773,10 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_sub_device *asd;
+	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct v4l2_subdev *motor;
-	bool acc_node;
 	int err;
 
-	acc_node = !strcmp(vdev->name, "ATOMISP ISP ACC");
-	if (acc_node)
-		asd = atomisp_to_acc_pipe(vdev)->asd;
-	else
-		asd = atomisp_to_video_pipe(vdev)->asd;
-
 	if (!IS_ISP2401)
 		motor = isp->inputs[asd->input_curr].motor;
 	else
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index e05aeb0ca86b..5e66d6a69556 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1075,13 +1075,6 @@ static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 	       sizeof(struct atomisp_css_params_with_list *));
 }
 
-static void atomisp_init_acc_pipe(struct atomisp_sub_device *asd,
-				  struct atomisp_acc_pipe *pipe)
-{
-	pipe->asd = asd;
-	pipe->isp = asd->isp;
-}
-
 /*
  * isp_subdev_init_entities - Initialize V4L2 subdev and media entity
  * @asd: ISP CCDC module
@@ -1137,8 +1130,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
 				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	atomisp_init_acc_pipe(asd, &asd->video_acc);
-
 	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
 				 ATOMISP_RUN_MODE_STILL_CAPTURE);
 	if (ret < 0)
@@ -1159,8 +1150,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret < 0)
 		return ret;
 
-	atomisp_acc_init(&asd->video_acc, "ACC");
-
 	ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, 1);
 	if (ret)
 		return ret;
@@ -1290,7 +1279,6 @@ void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 	atomisp_video_unregister(&asd->video_out_vf);
 	atomisp_video_unregister(&asd->video_out_capture);
 	atomisp_video_unregister(&asd->video_out_video_capture);
-	atomisp_acc_unregister(&asd->video_acc);
 }
 
 int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
@@ -1336,12 +1324,6 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
-	asd->video_acc.vdev.v4l2_dev = vdev;
-	asd->video_acc.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_acc.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
 
 	return 0;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index d89ae3274180..e36e112c3b29 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -119,14 +119,6 @@ struct atomisp_video_pipe {
 	atomic_t wdt_count;
 };
 
-struct atomisp_acc_pipe {
-	struct video_device vdev;
-	unsigned int users;
-	bool running;
-	struct atomisp_sub_device *asd;
-	struct atomisp_device *isp;
-};
-
 struct atomisp_pad_format {
 	struct v4l2_mbus_framefmt fmt;
 	struct v4l2_rect crop;
@@ -299,7 +291,6 @@ struct atomisp_sub_device {
 	struct atomisp_video_pipe video_out_capture; /* capture output */
 	struct atomisp_video_pipe video_out_vf;      /* viewfinder output */
 	struct atomisp_video_pipe video_out_preview; /* preview output */
-	struct atomisp_acc_pipe video_acc;
 	/* video pipe main output */
 	struct atomisp_video_pipe video_out_video_capture;
 	/* struct isp_subdev_params params; */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 672b3b68c613..bb48c74c0c07 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -460,18 +460,6 @@ int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
 	return 0;
 }
 
-void atomisp_acc_init(struct atomisp_acc_pipe *video, const char *name)
-{
-	video->vdev.fops = &atomisp_fops;
-	video->vdev.ioctl_ops = &atomisp_ioctl_ops;
-
-	/* Initialize the video device. */
-	snprintf(video->vdev.name, sizeof(video->vdev.name),
-		 "ATOMISP ISP %s", name);
-	video->vdev.release = video_device_release_empty;
-	video_set_drvdata(&video->vdev, video->isp);
-}
-
 void atomisp_video_unregister(struct atomisp_video_pipe *video)
 {
 	if (video_is_registered(&video->vdev)) {
@@ -480,12 +468,6 @@ void atomisp_video_unregister(struct atomisp_video_pipe *video)
 	}
 }
 
-void atomisp_acc_unregister(struct atomisp_acc_pipe *video)
-{
-	if (video_is_registered(&video->vdev))
-		video_unregister_device(&video->vdev);
-}
-
 static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
index 72611b8286a4..ccf1c0ac17b2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
@@ -22,16 +22,13 @@
 #define __ATOMISP_V4L2_H__
 
 struct atomisp_video_pipe;
-struct atomisp_acc_pipe;
 struct v4l2_device;
 struct atomisp_device;
 struct firmware;
 
 int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
 		       unsigned int run_mode);
-void atomisp_acc_init(struct atomisp_acc_pipe *video, const char *name);
 void atomisp_video_unregister(struct atomisp_video_pipe *video);
-void atomisp_acc_unregister(struct atomisp_acc_pipe *video);
 const struct firmware *atomisp_load_firmware(struct atomisp_device *isp);
 int atomisp_csi_lane_config(struct atomisp_device *isp);
 
-- 
2.37.2

