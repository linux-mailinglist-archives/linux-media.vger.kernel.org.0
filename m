Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B76150590
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgBCLmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:42:32 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:33265 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726884AbgBCLmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:42:31 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya7UiS6YMn7E5ya7Yi3UgY; Mon, 03 Feb 2020 12:42:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730148; bh=6xg/da71Bcr3KtlkYrCee9nwT4VlLKmaUurtBuZcRJ0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=RwpuE+RUZK9H3WNzKacaHNsO/OD4P427jYu7cIhvlFhaxQU7YSxKdgl0Qh00150N6
         kSYa/gyo8VnynT17z+EiZgIBzqiS9RgMkH7RaIiBkfS6/+pF8Koi7SYSGNVZKujVmH
         seYn58dkWfUi21oRDiY5MiU7AIiJSOE7R3xxMdFldYRLyzgTo9QQCIoQveEptE88fk
         0zDOufLEgkQ3Njmx5npQuTXyZdYhoY75XMZ7yJrPMDzNv6VwnuWSx/eoqbZK26cP32
         QMsE6D+/QTmFFt2nDr9decmqtd5R941al9tiZy5CopbxiJaGGzqS8kozKZj0MXCCFY
         0XJx75uw5cY+w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/11] media/usb: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:14 +0100
Message-Id: <20200203114119.1177490-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBlm7j4ipVFsMKZB5UP8rL6vsDJFKc+XUHKEXnXCviY/Cv3BJy3qjHKnit9fCljxAR0+Nwtb7KTuELdz7IrElv6I9eyk4LfVVXdnN9FlC5bq5/fVzAvR
 Yrr5Kcanwk8MeQeVh7T2woIPtqPgogRHAwlMBwWmbREFH3aFAwQyQJjUIU7BwMjtx/r2l5ziK7DQNtXN0m4BFuMoYfsD6DFVn5vopZJUqrBKh96IK4QNQTI7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/au0828/au0828-video.c       |  4 ++--
 drivers/media/usb/cpia2/cpia2_v4l.c           |  2 +-
 drivers/media/usb/cx231xx/cx231xx-417.c       |  2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c     |  2 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c      | 12 ++++++------
 drivers/media/usb/em28xx/em28xx-video.c       |  4 ++--
 drivers/media/usb/go7007/go7007-v4l2.c        |  2 +-
 drivers/media/usb/gspca/gspca.c               |  2 +-
 drivers/media/usb/hdpvr/hdpvr-video.c         |  2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |  4 ++--
 drivers/media/usb/pwc/pwc-if.c                |  2 +-
 drivers/media/usb/s2255/s2255drv.c            |  4 ++--
 drivers/media/usb/stk1160/stk1160-v4l.c       |  2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c      |  2 +-
 drivers/media/usb/tm6000/tm6000-video.c       |  4 ++--
 drivers/media/usb/usbtv/usbtv-video.c         |  2 +-
 drivers/media/usb/usbvision/usbvision-video.c |  2 +-
 drivers/media/usb/uvc/uvc_driver.c            |  2 +-
 drivers/media/usb/zr364xx/zr364xx.c           |  2 +-
 19 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index d1895334cbbf..51b8d14fb4dc 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1042,7 +1042,7 @@ static int au0828_v4l2_close(struct file *filp)
 		dev->streaming_users, dev->users);
 
 	mutex_lock(&dev->lock);
-	if (vdev->vfl_type == VFL_TYPE_GRABBER && dev->vid_timeout_running) {
+	if (vdev->vfl_type == VFL_TYPE_VIDEO && dev->vid_timeout_running) {
 		/* Cancel timeout thread in case they didn't call streamoff */
 		dev->vid_timeout_running = 0;
 		del_timer_sync(&dev->vid_timeout);
@@ -2007,7 +2007,7 @@ int au0828_analog_register(struct au0828_dev *dev,
 
 	/* Register the v4l2 device */
 	video_set_drvdata(&dev->vdev, dev);
-	retval = video_register_device(&dev->vdev, VFL_TYPE_GRABBER, -1);
+	retval = video_register_device(&dev->vdev, VFL_TYPE_VIDEO, -1);
 	if (retval != 0) {
 		dprintk(1, "unable to register video device (error = %d).\n",
 			retval);
diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 9d3d05125d7b..e488e7870f42 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -1134,7 +1134,7 @@ int cpia2_register_camera(struct camera_data *cam)
 	reset_camera_struct_v4l(cam);
 
 	/* register v4l device */
-	if (video_register_device(&cam->vdev, VFL_TYPE_GRABBER, video_nr) < 0) {
+	if (video_register_device(&cam->vdev, VFL_TYPE_VIDEO, video_nr) < 0) {
 		ERR("video_register_device failed\n");
 		return -ENODEV;
 	}
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 1aec4459f50a..b0cd51134654 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1790,7 +1790,7 @@ int cx231xx_417_register(struct cx231xx *dev)
 	dev->v4l_device.queue = q;
 
 	err = video_register_device(&dev->v4l_device,
-		VFL_TYPE_GRABBER, -1);
+		VFL_TYPE_VIDEO, -1);
 	if (err < 0) {
 		dprintk(3, "%s: can't register mpeg device\n", dev->name);
 		v4l2_ctrl_handler_free(&dev->mpeg_ctrl_handler.hdl);
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 69abafaebbf3..8bff7d8a0310 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1785,7 +1785,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev->vdev.device_caps |= V4L2_CAP_TUNER;
 
 	/* register v4l2 video video_device */
-	ret = video_register_device(&dev->vdev, VFL_TYPE_GRABBER,
+	ret = video_register_device(&dev->vdev, VFL_TYPE_VIDEO,
 				    video_nr[dev->devno]);
 	if (ret) {
 		dev_err(dev->dev,
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 0699f718d052..001cae648797 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1223,7 +1223,7 @@ static int cxusb_medion_g_tuner(struct file *file, void *fh,
 	if (tuner->index != 0)
 		return -EINVAL;
 
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_type == VFL_TYPE_VIDEO)
 		tuner->type = V4L2_TUNER_ANALOG_TV;
 	else
 		tuner->type = V4L2_TUNER_RADIO;
@@ -1259,7 +1259,7 @@ static int cxusb_medion_g_tuner(struct file *file, void *fh,
 	if (ret != 0)
 		return ret;
 
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_type == VFL_TYPE_VIDEO)
 		strscpy(tuner->name, "TV tuner", sizeof(tuner->name));
 	else
 		strscpy(tuner->name, "Radio tuner", sizeof(tuner->name));
@@ -1292,7 +1292,7 @@ static int cxusb_medion_s_tuner(struct file *file, void *fh,
 	 * make sure that cx25840 is in a correct TV / radio mode,
 	 * since calls above may have changed it for tuner / IF demod
 	 */
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_type == VFL_TYPE_VIDEO)
 		v4l2_subdev_call(cxdev->cx25840, video, s_std, cxdev->norm);
 	else
 		v4l2_subdev_call(cxdev->cx25840, tuner, s_radio);
@@ -1335,7 +1335,7 @@ static int cxusb_medion_s_frequency(struct file *file, void *fh,
 	 * make sure that cx25840 is in a correct TV / radio mode,
 	 * since calls above may have changed it for tuner / IF demod
 	 */
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_type == VFL_TYPE_VIDEO)
 		v4l2_subdev_call(cxdev->cx25840, video, s_std, cxdev->norm);
 	else
 		v4l2_subdev_call(cxdev->cx25840, tuner, s_radio);
@@ -1564,7 +1564,7 @@ static int cxusb_videoradio_release(struct file *f)
 
 	cxusb_vprintk(dvbdev, OPS, "got release\n");
 
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
+	if (vdev->vfl_type == VFL_TYPE_VIDEO)
 		ret = vb2_fop_release(f);
 	else
 		ret = v4l2_fh_release(f);
@@ -1663,7 +1663,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
 	cxdev->videodev->lock = &cxdev->dev_lock;
 	video_set_drvdata(cxdev->videodev, dvbdev);
 
-	ret = video_register_device(cxdev->videodev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(cxdev->videodev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(&dvbdev->udev->dev,
 			"video device register failed, ret = %d\n", ret);
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index b0f7390e4b4f..6b84c3413e83 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2141,7 +2141,7 @@ static int em28xx_v4l2_open(struct file *filp)
 	int ret;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		fh_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		break;
 	case VFL_TYPE_VBI:
@@ -2789,7 +2789,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	}
 
 	/* register v4l2 video video_device */
-	ret = video_register_device(&v4l2->vdev, VFL_TYPE_GRABBER,
+	ret = video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
 				    video_nr[dev->devno]);
 	if (ret) {
 		dev_err(&dev->intf->dev,
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index 0b3d185f3cb0..b2edc4deaca3 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -1138,7 +1138,7 @@ int go7007_v4l2_init(struct go7007 *go)
 	go7007_s_input(go);
 	if (go->board_info->sensor_flags & GO7007_SENSOR_TV)
 		go7007_s_std(go);
-	rv = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	rv = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (rv < 0)
 		return rv;
 	dev_info(go->dev, "registered device %s [v4l2]\n",
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index c1b307bbe540..0566e00d6fea 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1555,7 +1555,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
 
 	/* init video stuff */
 	ret = video_register_device(&gspca_dev->vdev,
-				  VFL_TYPE_GRABBER,
+				  VFL_TYPE_VIDEO,
 				  -1);
 	if (ret < 0) {
 		pr_err("video_register_device err %d\n", ret);
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index bad71d863d39..563128d11731 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -1238,7 +1238,7 @@ int hdpvr_register_videodev(struct hdpvr_device *dev, struct device *parent,
 	dev->video_dev.v4l2_dev = &dev->v4l2_dev;
 	video_set_drvdata(&dev->video_dev, dev);
 
-	res = video_register_device(&dev->video_dev, VFL_TYPE_GRABBER, devnum);
+	res = video_register_device(&dev->video_dev, VFL_TYPE_VIDEO, devnum);
 	if (res < 0) {
 		v4l2_err(&dev->v4l2_dev, "video_device registration failed\n");
 		goto error;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index eaa08c7999d4..9657c1883311 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1196,7 +1196,7 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 	hdw = vp->channel.mc_head->hdw;
 	dip->v4l_type = v4l_type;
 	switch (v4l_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		dip->stream = &vp->channel.mc_head->video_stream;
 		dip->config = pvr2_config_mpeg;
 		dip->minor_type = pvr2_v4l_type_video;
@@ -1276,7 +1276,7 @@ struct pvr2_v4l2 *pvr2_v4l2_create(struct pvr2_context *mnp)
 	/* register streams */
 	vp->dev_video = kzalloc(sizeof(*vp->dev_video),GFP_KERNEL);
 	if (!vp->dev_video) goto fail;
-	pvr2_v4l2_dev_init(vp->dev_video,vp,VFL_TYPE_GRABBER);
+	pvr2_v4l2_dev_init(vp->dev_video,vp,VFL_TYPE_VIDEO);
 	if (pvr2_hdw_get_input_available(vp->channel.mc_head->hdw) &
 	    (1 << PVR2_CVAL_INPUT_RADIO)) {
 		vp->dev_radio = kzalloc(sizeof(*vp->dev_radio),GFP_KERNEL);
diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 9b76cf133d52..d57b8b786506 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -1116,7 +1116,7 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 	pdev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 				 V4L2_CAP_READWRITE;
 
-	rc = video_register_device(&pdev->vdev, VFL_TYPE_GRABBER, -1);
+	rc = video_register_device(&pdev->vdev, VFL_TYPE_VIDEO, -1);
 	if (rc < 0) {
 		PWC_ERROR("Failed to register as video device (%d).\n", rc);
 		goto err_unregister_v4l2_dev;
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 329ec8089592..4af55e2478be 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -1649,11 +1649,11 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		video_set_drvdata(&vc->vdev, vc);
 		if (video_nr == -1)
 			ret = video_register_device(&vc->vdev,
-						    VFL_TYPE_GRABBER,
+						    VFL_TYPE_VIDEO,
 						    video_nr);
 		else
 			ret = video_register_device(&vc->vdev,
-						    VFL_TYPE_GRABBER,
+						    VFL_TYPE_VIDEO,
 						    cur_nr + i);
 
 		if (ret) {
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index bcd14c66e8df..6a4eb616d516 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -830,7 +830,7 @@ int stk1160_video_register(struct stk1160 *dev)
 			dev->norm);
 
 	video_set_drvdata(&dev->vdev, dev);
-	rc = video_register_device(&dev->vdev, VFL_TYPE_GRABBER, -1);
+	rc = video_register_device(&dev->vdev, VFL_TYPE_VIDEO, -1);
 	if (rc < 0) {
 		stk1160_err("video_register_device failed (%d)\n", rc);
 		return rc;
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index b22501f76b78..a45d464427c4 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1254,7 +1254,7 @@ static int stk_register_video_device(struct stk_camera *dev)
 	dev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 				V4L2_CAP_STREAMING;
 	video_set_drvdata(&dev->vdev, dev);
-	err = video_register_device(&dev->vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&dev->vdev, VFL_TYPE_VIDEO, -1);
 	if (err)
 		pr_err("v4l registration failed\n");
 	else
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index c07a81a6cbe2..bfba06ea60e9 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -1300,7 +1300,7 @@ static int __tm6000_open(struct file *file)
 		video_device_node_name(vdev));
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		break;
 	case VFL_TYPE_VBI:
@@ -1639,7 +1639,7 @@ int tm6000_v4l2_register(struct tm6000_core *dev)
 	INIT_LIST_HEAD(&dev->vidq.active);
 	INIT_LIST_HEAD(&dev->vidq.queued);
 
-	ret = video_register_device(&dev->vfd, VFL_TYPE_GRABBER, video_nr);
+	ret = video_register_device(&dev->vfd, VFL_TYPE_VIDEO, video_nr);
 
 	if (ret < 0) {
 		printk(KERN_INFO "%s: can't register video device\n",
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 3d9284a09ee5..9f5553473d6e 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -940,7 +940,7 @@ int usbtv_video_init(struct usbtv *usbtv)
 	usbtv->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 				  V4L2_CAP_STREAMING;
 	video_set_drvdata(&usbtv->vdev, usbtv);
-	ret = video_register_device(&usbtv->vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&usbtv->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_warn(usbtv->dev, "Could not register video device\n");
 		goto vdev_fail;
diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 5ca2c2f35fe2..3ea25fdcf767 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -1271,7 +1271,7 @@ static int usbvision_register_video(struct usb_usbvision *usbvision)
 	if (usbvision->have_tuner)
 		usbvision->vdev.device_caps |= V4L2_CAP_TUNER;
 
-	if (video_register_device(&usbvision->vdev, VFL_TYPE_GRABBER, video_nr) < 0)
+	if (video_register_device(&usbvision->vdev, VFL_TYPE_VIDEO, video_nr) < 0)
 		goto err_exit;
 	printk(KERN_INFO "USBVision[%d]: registered USBVision Video device %s [v4l2]\n",
 	       usbvision->nr, video_device_node_name(&usbvision->vdev));
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 99883550375e..431d86e1c94b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2014,7 +2014,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	 */
 	video_set_drvdata(vdev, stream);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
 			   v4l2_type_names[type], ret);
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 57dbcc8083bf..8c670934d920 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -1516,7 +1516,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 				    V4L2_FIELD_NONE,
 				    sizeof(struct zr364xx_buffer), cam, &cam->lock);
 
-	err = video_register_device(&cam->vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		dev_err(&udev->dev, "video_register_device failed\n");
 		goto fail;
-- 
2.24.0

