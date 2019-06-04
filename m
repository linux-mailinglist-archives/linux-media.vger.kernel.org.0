Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D86E34547
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfFDLUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:10 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58987 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727332AbfFDLUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:10 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U3hwRo3; Tue, 04 Jun 2019 13:20:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/7] media/usb: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:53 +0200
Message-Id: <20190604111958.22331-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNXflZfKsX1jYcVAlD942UrGn+kiyHuHj6hWxbkWPPybWSHphyf5W7P1zXK9b5vnrEPGBjHqbkGry2GxS2JB/eZKLw/+sHTR4G/nCzJHYWCjTPVbIAzZ
 Ejkdb7ir/i6R/PFyIETQsJngpJ+b91T4gjwnjP6MAu8CYQZ2iLazjdXJ91TLyv5BvFZmS69U5AOsvO3mJuxu9HE9sRc8ZETh0LHNx9UDiPC40XgTUaH8P9b/
 Pfhw+dZ1CdRgsODGx0gXdTvQr5p/P8+UGVR4PvaUQU0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
all usb drivers in this patch.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/airspy/airspy.c             |  6 ++--
 drivers/media/usb/au0828/au0828-video.c       | 21 ++++++------
 drivers/media/usb/cpia2/cpia2_v4l.c           |  9 ++----
 drivers/media/usb/cx231xx/cx231xx-video.c     | 28 ++++++++--------
 drivers/media/usb/em28xx/em28xx-video.c       | 32 +++++++++----------
 drivers/media/usb/go7007/go7007-v4l2.c        | 15 ++++-----
 drivers/media/usb/gspca/gspca.c               |  6 ++--
 drivers/media/usb/hackrf/hackrf.c             | 14 ++++----
 drivers/media/usb/hdpvr/hdpvr-video.c         |  5 ++-
 drivers/media/usb/msi2500/msi2500.c           |  5 ++-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      | 17 ++++------
 drivers/media/usb/pwc/pwc-if.c                |  2 ++
 drivers/media/usb/pwc/pwc-v4l.c               |  3 --
 drivers/media/usb/s2255/s2255drv.c            |  5 ++-
 drivers/media/usb/stk1160/stk1160-v4l.c       |  7 ++--
 drivers/media/usb/stkwebcam/stk-webcam.c      |  6 ++--
 drivers/media/usb/tm6000/tm6000-video.c       | 20 ++++++------
 drivers/media/usb/usbtv/usbtv-video.c         |  5 ++-
 drivers/media/usb/usbvision/usbvision-video.c | 20 ++++++------
 drivers/media/usb/zr364xx/zr364xx.c           |  7 ++--
 20 files changed, 100 insertions(+), 133 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 41fa0f93143d..6a3e8be95697 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -622,10 +622,6 @@ static int airspy_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, s->vdev.name, sizeof(cap->card));
 	usb_make_path(s->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
-			V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1066,6 +1062,8 @@ static int airspy_probe(struct usb_interface *intf,
 	s->v4l2_dev.ctrl_handler = &s->hdl;
 	s->vdev.v4l2_dev = &s->v4l2_dev;
 	s->vdev.lock = &s->v4l2_lock;
+	s->vdev.device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
+			      V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
 
 	ret = video_register_device(&s->vdev, VFL_TYPE_SDR, -1);
 	if (ret) {
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 4bde3db83aa2..981ee08fb05f 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1191,7 +1191,6 @@ static int au0828_set_format(struct au0828_dev *dev, unsigned int cmd,
 static int vidioc_querycap(struct file *file, void  *priv,
 			   struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct au0828_dev *dev = video_drvdata(file);
 
 	dprintk(1, "%s called std_set %d dev_state %ld\n", __func__,
@@ -1202,16 +1201,10 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	usb_make_path(dev->usbdev, cap->bus_info, sizeof(cap->bus_info));
 
 	/* set the device capabilities */
-	cap->device_caps = V4L2_CAP_AUDIO |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_STREAMING |
-		V4L2_CAP_TUNER;
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-	else
-		cap->device_caps |= V4L2_CAP_VBI_CAPTURE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS |
-		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_VIDEO_CAPTURE;
+	cap->capabilities =
+		V4L2_CAP_AUDIO | V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+		V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE | V4L2_CAP_VIDEO_CAPTURE |
+		V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -2000,6 +1993,9 @@ int au0828_analog_register(struct au0828_dev *dev,
 	dev->vdev.lock = &dev->lock;
 	dev->vdev.queue = &dev->vb_vidq;
 	dev->vdev.queue->lock = &dev->vb_queue_lock;
+	dev->vdev.device_caps =
+		V4L2_CAP_AUDIO | V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+		V4L2_CAP_TUNER | V4L2_CAP_VIDEO_CAPTURE;
 	strscpy(dev->vdev.name, "au0828a video", sizeof(dev->vdev.name));
 
 	/* Setup the VBI device */
@@ -2008,6 +2004,9 @@ int au0828_analog_register(struct au0828_dev *dev,
 	dev->vbi_dev.lock = &dev->lock;
 	dev->vbi_dev.queue = &dev->vb_vbiq;
 	dev->vbi_dev.queue->lock = &dev->vb_vbi_queue_lock;
+	dev->vbi_dev.device_caps =
+		V4L2_CAP_AUDIO | V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+		V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE;
 	strscpy(dev->vbi_dev.name, "au0828a vbi", sizeof(dev->vbi_dev.name));
 
 	/* Init entities at the Media Controller */
diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 45caf78119c4..d3533e9f32a3 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -259,13 +259,6 @@ static int cpia2_querycap(struct file *file, void *fh, struct v4l2_capability *v
 
 	if (usb_make_path(cam->dev, vc->bus_info, sizeof(vc->bus_info)) <0)
 		memset(vc->bus_info,0, sizeof(vc->bus_info));
-
-	vc->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-			   V4L2_CAP_READWRITE |
-			   V4L2_CAP_STREAMING;
-	vc->capabilities = vc->device_caps |
-			   V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1161,6 +1154,8 @@ int cpia2_register_camera(struct camera_data *cam)
 	cam->vdev.lock = &cam->v4l2_lock;
 	cam->vdev.ctrl_handler = hdl;
 	cam->vdev.v4l2_dev = &cam->v4l2_dev;
+	cam->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				V4L2_CAP_STREAMING;
 
 	reset_camera_struct_v4l(cam);
 
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index f8820478d46b..b651ac7713ea 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1555,30 +1555,19 @@ static int vidioc_streamoff(struct file *file, void *priv,
 int cx231xx_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct cx231xx_fh *fh = priv;
 	struct cx231xx *dev = fh->dev;
 
 	strscpy(cap->driver, "cx231xx", sizeof(cap->driver));
 	strscpy(cap->card, cx231xx_boards[dev->model].name, sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-
-	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		cap->device_caps = V4L2_CAP_RADIO;
-	else {
-		cap->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-		if (vdev->vfl_type == VFL_TYPE_VBI)
-			cap->device_caps |= V4L2_CAP_VBI_CAPTURE;
-		else
-			cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-	}
-	if (dev->tuner_type != TUNER_ABSENT)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_READWRITE |
+	cap->capabilities = V4L2_CAP_READWRITE |
 		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_VIDEO_CAPTURE |
 		V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	if (video_is_registered(&dev->radio_dev))
 		cap->capabilities |= V4L2_CAP_RADIO;
+	if (dev->tuner_type != TUNER_ABSENT)
+		cap->capabilities |= V4L2_CAP_TUNER;
 
 	return 0;
 }
@@ -2234,6 +2223,11 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev_err(dev->dev, "failed to initialize video media entity!\n");
 #endif
 	dev->vdev.ctrl_handler = &dev->ctrl_handler;
+	dev->vdev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				V4L2_CAP_VIDEO_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->vdev.device_caps |= V4L2_CAP_TUNER;
+
 	/* register v4l2 video video_device */
 	ret = video_register_device(&dev->vdev, VFL_TYPE_GRABBER,
 				    video_nr[dev->devno]);
@@ -2262,6 +2256,11 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev_err(dev->dev, "failed to initialize vbi media entity!\n");
 #endif
 	dev->vbi_dev.ctrl_handler = &dev->ctrl_handler;
+	dev->vbi_dev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				   V4L2_CAP_VBI_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->vbi_dev.device_caps |= V4L2_CAP_TUNER;
+
 	/* register v4l2 vbi video_device */
 	ret = video_register_device(&dev->vbi_dev, VFL_TYPE_VBI,
 				    vbi_nr[dev->devno]);
@@ -2277,6 +2276,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		cx231xx_vdev_init(dev, &dev->radio_dev,
 				&cx231xx_radio_template, "radio");
 		dev->radio_dev.ctrl_handler = &dev->radio_ctrl_handler;
+		dev->radio_dev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 		ret = video_register_device(&dev->radio_dev, VFL_TYPE_RADIO,
 					    radio_nr[dev->devno]);
 		if (ret < 0) {
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index f43717ea831d..0512e1959394 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1984,7 +1984,6 @@ static int vidioc_s_register(struct file *file, void *priv,
 static int vidioc_querycap(struct file *file, void  *priv,
 			   struct v4l2_capability *cap)
 {
-	struct video_device   *vdev = video_devdata(file);
 	struct em28xx         *dev  = video_drvdata(file);
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
 	struct usb_device *udev = interface_to_usbdev(dev->intf);
@@ -1993,23 +1992,12 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, em28xx_boards[dev->model].name, sizeof(cap->card));
 	usb_make_path(udev, cap->bus_info, sizeof(cap->bus_info));
 
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		cap->device_caps = V4L2_CAP_READWRITE |
-			V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	else if (vdev->vfl_type == VFL_TYPE_RADIO)
-		cap->device_caps = V4L2_CAP_RADIO;
-	else
-		cap->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
-
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_READWRITE |
+			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
-		cap->device_caps |= V4L2_CAP_AUDIO;
-
+		cap->capabilities |= V4L2_CAP_AUDIO;
 	if (dev->tuner_type != TUNER_ABSENT)
-		cap->device_caps |= V4L2_CAP_TUNER;
-
-	cap->capabilities = cap->device_caps |
-			    V4L2_CAP_DEVICE_CAPS | V4L2_CAP_READWRITE |
-			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		cap->capabilities |= V4L2_CAP_TUNER;
 	if (video_is_registered(&v4l2->vbi_dev))
 		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
 	if (video_is_registered(&v4l2->radio_dev))
@@ -2782,6 +2770,13 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	mutex_init(&v4l2->vb_vbi_queue_lock);
 	v4l2->vdev.queue = &v4l2->vb_vidq;
 	v4l2->vdev.queue->lock = &v4l2->vb_queue_lock;
+	v4l2->vdev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_VIDEO_CAPTURE |
+				 V4L2_CAP_STREAMING;
+	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
+		v4l2->vdev.device_caps |= V4L2_CAP_AUDIO;
+	if (dev->tuner_type != TUNER_ABSENT)
+		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
+
 
 	/* disable inapplicable ioctls */
 	if (dev->is_webcam) {
@@ -2818,6 +2813,10 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 		v4l2->vbi_dev.queue = &v4l2->vb_vbiq;
 		v4l2->vbi_dev.queue->lock = &v4l2->vb_vbi_queue_lock;
+		v4l2->vbi_dev.device_caps = V4L2_CAP_STREAMING |
+			V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
+		if (dev->tuner_type != TUNER_ABSENT)
+			v4l2->vbi_dev.device_caps |= V4L2_CAP_TUNER;
 
 		/* disable inapplicable ioctls */
 		v4l2_disable_ioctl(&v4l2->vbi_dev, VIDIOC_S_PARM);
@@ -2845,6 +2844,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (em28xx_boards[dev->model].radio.type == EM28XX_RADIO) {
 		em28xx_vdev_init(dev, &v4l2->radio_dev, &em28xx_radio_template,
 				 "radio");
+		v4l2->radio_dev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 		ret = video_register_device(&v4l2->radio_dev, VFL_TYPE_RADIO,
 					    radio_nr[dev->devno]);
 		if (ret < 0) {
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index bebdfcecf600..ffbbd393bc7e 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -287,15 +287,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, "go7007", sizeof(cap->driver));
 	strscpy(cap->card, go->name, sizeof(cap->card));
 	strscpy(cap->bus_info, go->bus_info, sizeof(cap->bus_info));
-
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
-				V4L2_CAP_STREAMING;
-
-	if (go->board_info->num_aud_inputs)
-		cap->device_caps |= V4L2_CAP_AUDIO;
-	if (go->board_info->flags & GO7007_BOARD_HAS_TUNER)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1122,6 +1113,12 @@ int go7007_v4l2_init(struct go7007 *go)
 	*vdev = go7007_template;
 	vdev->lock = &go->serialize_lock;
 	vdev->queue = &go->vidq;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_STREAMING;
+	if (go->board_info->num_aud_inputs)
+		vdev->device_caps |= V4L2_CAP_AUDIO;
+	if (go->board_info->flags & GO7007_BOARD_HAS_TUNER)
+		vdev->device_caps |= V4L2_CAP_TUNER;
 	video_set_drvdata(vdev, go);
 	vdev->v4l2_dev = &go->v4l2_dev;
 	if (!v4l2_device_has_op(&go->v4l2_dev, 0, video, querystd))
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 4d7517411cc2..d389020b50f9 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1218,10 +1218,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	}
 	usb_make_path(gspca_dev->dev, (char *) cap->bus_info,
 			sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE
-			  | V4L2_CAP_STREAMING
-			  | V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1517,6 +1513,8 @@ int gspca_dev_probe2(struct usb_interface *intf,
 	gspca_dev->empty_packet = -1;	/* don't check the empty packets */
 	gspca_dev->vdev = gspca_template;
 	gspca_dev->vdev.v4l2_dev = &gspca_dev->v4l2_dev;
+	gspca_dev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				      V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 	video_set_drvdata(&gspca_dev->vdev, gspca_dev);
 	gspca_dev->module = module;
 
diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index d43785206622..d625263f4984 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -905,19 +905,13 @@ static int hackrf_querycap(struct file *file, void *fh,
 {
 	struct hackrf_dev *dev = video_drvdata(file);
 	struct usb_interface *intf = dev->intf;
-	struct video_device *vdev = video_devdata(file);
 
 	dev_dbg(&intf->dev, "\n");
 
-	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-	if (vdev->vfl_dir == VFL_DIR_RX)
-		cap->device_caps |= V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER;
-	else
-		cap->device_caps |= V4L2_CAP_SDR_OUTPUT | V4L2_CAP_MODULATOR;
-
 	cap->capabilities = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER |
 			    V4L2_CAP_SDR_OUTPUT | V4L2_CAP_MODULATOR |
-			    V4L2_CAP_DEVICE_CAPS | cap->device_caps;
+			    V4L2_CAP_STREAMING | V4L2_CAP_READWRITE |
+			    V4L2_CAP_DEVICE_CAPS;
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, dev->rx_vdev.name, sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
@@ -1496,6 +1490,8 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->rx_vdev.ctrl_handler = &dev->rx_ctrl_handler;
 	dev->rx_vdev.lock = &dev->v4l2_lock;
 	dev->rx_vdev.vfl_dir = VFL_DIR_RX;
+	dev->rx_vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE |
+				   V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER;
 	video_set_drvdata(&dev->rx_vdev, dev);
 	ret = video_register_device(&dev->rx_vdev, VFL_TYPE_SDR, -1);
 	if (ret) {
@@ -1514,6 +1510,8 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->tx_vdev.ctrl_handler = &dev->tx_ctrl_handler;
 	dev->tx_vdev.lock = &dev->v4l2_lock;
 	dev->tx_vdev.vfl_dir = VFL_DIR_TX;
+	dev->tx_vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE |
+				   V4L2_CAP_SDR_OUTPUT | V4L2_CAP_MODULATOR;
 	video_set_drvdata(&dev->tx_vdev, dev);
 	ret = video_register_device(&dev->tx_vdev, VFL_TYPE_SDR, -1);
 	if (ret) {
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 3804aa3fb50f..a675506e8939 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -581,9 +581,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->driver, "hdpvr", sizeof(cap->driver));
 	strscpy(cap->card, "Hauppauge HD PVR", sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO |
-			    V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1154,6 +1151,8 @@ static const struct video_device hdpvr_video_template = {
 	.release		= hdpvr_device_release,
 	.ioctl_ops		= &hdpvr_ioctl_ops,
 	.tvnorms		= V4L2_STD_ALL,
+	.device_caps		= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO |
+				  V4L2_CAP_READWRITE,
 };
 
 static const struct v4l2_ctrl_ops hdpvr_ctrl_ops = {
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 10b5b95bee34..384d9bbd6495 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -607,9 +607,6 @@ static int msi2500_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
 	strscpy(cap->card, dev->vdev.name, sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
-			V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1283,6 +1280,8 @@ static int msi2500_probe(struct usb_interface *intf,
 	dev->v4l2_dev.ctrl_handler = &dev->hdl;
 	dev->vdev.v4l2_dev = &dev->v4l2_dev;
 	dev->vdev.lock = &dev->v4l2_lock;
+	dev->vdev.device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_STREAMING |
+				V4L2_CAP_READWRITE | V4L2_CAP_TUNER;
 
 	ret = video_register_device(&dev->vdev, VFL_TYPE_SDR, -1);
 	if (ret) {
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index cb6668580d77..30701ecc84c5 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -128,17 +128,6 @@ static int pvr2_querycap(struct file *file, void *priv, struct v4l2_capability *
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
 			    V4L2_CAP_AUDIO | V4L2_CAP_RADIO |
 			    V4L2_CAP_READWRITE | V4L2_CAP_DEVICE_CAPS;
-	switch (fh->pdi->devbase.vfl_type) {
-	case VFL_TYPE_GRABBER:
-		cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO;
-		break;
-	case VFL_TYPE_RADIO:
-		cap->device_caps = V4L2_CAP_RADIO;
-		break;
-	default:
-		return -EINVAL;
-	}
-	cap->device_caps |= V4L2_CAP_TUNER | V4L2_CAP_READWRITE;
 	return 0;
 }
 
@@ -1205,6 +1194,8 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 	int unit_number;
 	struct pvr2_hdw *hdw;
 	int *nr_ptr = NULL;
+	u32 caps = V4L2_CAP_TUNER | V4L2_CAP_READWRITE;
+
 	dip->v4lp = vp;
 
 	hdw = vp->channel.mc_head->hdw;
@@ -1215,6 +1206,7 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 		dip->config = pvr2_config_mpeg;
 		dip->minor_type = pvr2_v4l_type_video;
 		nr_ptr = video_nr;
+		caps |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_AUDIO;
 		if (!dip->stream) {
 			pr_err(KBUILD_MODNAME
 				": Failed to set up pvrusb2 v4l video dev due to missing stream instance\n");
@@ -1225,12 +1217,14 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 		dip->config = pvr2_config_vbi;
 		dip->minor_type = pvr2_v4l_type_vbi;
 		nr_ptr = vbi_nr;
+		caps |= V4L2_CAP_VBI_CAPTURE;
 		break;
 	case VFL_TYPE_RADIO:
 		dip->stream = &vp->channel.mc_head->video_stream;
 		dip->config = pvr2_config_mpeg;
 		dip->minor_type = pvr2_v4l_type_radio;
 		nr_ptr = radio_nr;
+		caps |= V4L2_CAP_RADIO;
 		break;
 	default:
 		/* Bail out (this should be impossible) */
@@ -1241,6 +1235,7 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_dev *dip,
 	dip->devbase = vdev_template;
 	dip->devbase.release = pvr2_video_device_release;
 	dip->devbase.ioctl_ops = &pvr2_ioctl_ops;
+	dip->devbase.device_caps = caps;
 	{
 		int val;
 		pvr2_ctrl_get_value(
diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 4e94197094ad..a1bd1cb5924b 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -1125,6 +1125,8 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 	pdev->v4l2_dev.ctrl_handler = &pdev->ctrl_handler;
 	pdev->vdev.v4l2_dev = &pdev->v4l2_dev;
 	pdev->vdev.lock = &pdev->v4l2_lock;
+	pdev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_READWRITE;
 
 	rc = video_register_device(&pdev->vdev, VFL_TYPE_GRABBER, -1);
 	if (rc < 0) {
diff --git a/drivers/media/usb/pwc/pwc-v4l.c b/drivers/media/usb/pwc/pwc-v4l.c
index bef6e4ef8a7e..85efb433c004 100644
--- a/drivers/media/usb/pwc/pwc-v4l.c
+++ b/drivers/media/usb/pwc/pwc-v4l.c
@@ -495,9 +495,6 @@ static int pwc_querycap(struct file *file, void *fh, struct v4l2_capability *cap
 	strscpy(cap->driver, PWC_NAME, sizeof(cap->driver));
 	strscpy(cap->card, pdev->vdev.name, sizeof(cap->card));
 	usb_make_path(pdev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-					V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 5b3e54b76e9a..15c1cf18266a 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -733,9 +733,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "s2255", sizeof(cap->driver));
 	strscpy(cap->card, "s2255", sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-		V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1666,6 +1663,8 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		vc->vdev.ctrl_handler = &vc->hdl;
 		vc->vdev.lock = &dev->lock;
 		vc->vdev.v4l2_dev = &dev->v4l2_dev;
+		vc->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				       V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		video_set_drvdata(&vc->vdev, vc);
 		if (video_nr == -1)
 			ret = video_register_device(&vc->vdev,
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 701ed3d4afe6..166e867b2001 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -347,11 +347,6 @@ static int vidioc_querycap(struct file *file,
 	strscpy(cap->driver, "stk1160", sizeof(cap->driver));
 	strscpy(cap->card, "stk1160", sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps =
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_STREAMING |
-		V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -831,6 +826,8 @@ int stk1160_video_register(struct stk1160 *dev)
 
 	/* This will be used to set video_device parent */
 	dev->vdev.v4l2_dev = &dev->v4l2_dev;
+	dev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				V4L2_CAP_READWRITE;
 
 	/* NTSC is default */
 	dev->norm = V4L2_STD_NTSC_M;
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index cb7d6454bbe1..be8041e3e6b8 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -798,10 +798,6 @@ static int stk_vidioc_querycap(struct file *filp,
 	strscpy(cap->driver, "stk", sizeof(cap->driver));
 	strscpy(cap->card, "stk", sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE
-		| V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1261,6 +1257,8 @@ static int stk_register_video_device(struct stk_camera *dev)
 	dev->vdev = stk_v4l_data;
 	dev->vdev.lock = &dev->lock;
 	dev->vdev.v4l2_dev = &dev->v4l2_dev;
+	dev->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				V4L2_CAP_STREAMING;
 	video_set_drvdata(&dev->vdev, dev);
 	err = video_register_device(&dev->vdev, VFL_TYPE_GRABBER, -1);
 	if (err)
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index 072210f5f92f..85fcddfb0202 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -854,22 +854,17 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *cap)
 {
 	struct tm6000_core *dev = ((struct tm6000_fh *)priv)->dev;
-	struct video_device *vdev = video_devdata(file);
 
 	strscpy(cap->driver, "tm6000", sizeof(cap->driver));
 	strscpy(cap->card, "Trident TVMaster TM5600/6000/6010",
 		sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_DEVICE_CAPS;
 	if (dev->tuner_type != TUNER_ABSENT)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE |
-				V4L2_CAP_STREAMING |
-				V4L2_CAP_READWRITE;
-	else
-		cap->device_caps |= V4L2_CAP_RADIO;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS |
-		V4L2_CAP_RADIO | V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE;
+		cap->capabilities |= V4L2_CAP_TUNER;
+	if (dev->caps.has_radio)
+		cap->capabilities |= V4L2_CAP_RADIO;
 
 	return 0;
 }
@@ -1639,6 +1634,10 @@ int tm6000_v4l2_register(struct tm6000_core *dev)
 	vdev_init(dev, &dev->vfd, &tm6000_template, "video");
 
 	dev->vfd.ctrl_handler = &dev->ctrl_handler;
+	dev->vfd.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			       V4L2_CAP_READWRITE;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->vfd.device_caps |= V4L2_CAP_TUNER;
 
 	/* init video dma queues */
 	INIT_LIST_HEAD(&dev->vidq.active);
@@ -1659,6 +1658,7 @@ int tm6000_v4l2_register(struct tm6000_core *dev)
 		vdev_init(dev, &dev->radio_dev, &tm6000_radio_template,
 							   "radio");
 		dev->radio_dev.ctrl_handler = &dev->radio_ctrl_handler;
+		dev->radio_dev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 		ret = video_register_device(&dev->radio_dev, VFL_TYPE_RADIO,
 					    radio_nr);
 		if (ret < 0) {
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 4a1eab711bdc..51f784479e91 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -603,9 +603,6 @@ static int usbtv_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, "usbtv", sizeof(cap->driver));
 	strscpy(cap->card, "usbtv", sizeof(cap->card));
 	usb_make_path(dev->udev, cap->bus_info, sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE;
-	cap->device_caps |= V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -942,6 +939,8 @@ int usbtv_video_init(struct usbtv *usbtv)
 	usbtv->vdev.tvnorms = USBTV_TV_STD;
 	usbtv->vdev.queue = &usbtv->vb2q;
 	usbtv->vdev.lock = &usbtv->v4l2_lock;
+	usbtv->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING;
 	video_set_drvdata(&usbtv->vdev, usbtv);
 	ret = video_register_device(&usbtv->vdev, VFL_TYPE_GRABBER, -1);
 	if (ret < 0) {
diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index e611052ebf59..bd216c9ff3d1 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -465,24 +465,18 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *vc)
 {
 	struct usb_usbvision *usbvision = video_drvdata(file);
-	struct video_device *vdev = video_devdata(file);
 
 	strscpy(vc->driver, "USBVision", sizeof(vc->driver));
 	strscpy(vc->card,
 		usbvision_device_data[usbvision->dev_model].model_string,
 		sizeof(vc->card));
 	usb_make_path(usbvision->dev, vc->bus_info, sizeof(vc->bus_info));
-	vc->device_caps = usbvision->have_tuner ? V4L2_CAP_TUNER : 0;
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		vc->device_caps |= V4L2_CAP_VIDEO_CAPTURE |
-			V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	else
-		vc->device_caps |= V4L2_CAP_RADIO;
-
-	vc->capabilities = vc->device_caps | V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE | V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
+	vc->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			   V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	if (usbvision_device_data[usbvision->dev_model].radio)
 		vc->capabilities |= V4L2_CAP_RADIO;
+	if (usbvision->have_tuner)
+		vc->capabilities |= V4L2_CAP_TUNER;
 	return 0;
 }
 
@@ -1280,6 +1274,11 @@ static int usbvision_register_video(struct usb_usbvision *usbvision)
 		v4l2_disable_ioctl(&usbvision->vdev, VIDIOC_G_FREQUENCY);
 		v4l2_disable_ioctl(&usbvision->vdev, VIDIOC_S_TUNER);
 	}
+	usbvision->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				      V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+	if (usbvision->have_tuner)
+		usbvision->vdev.device_caps |= V4L2_CAP_TUNER;
+
 	if (video_register_device(&usbvision->vdev, VFL_TYPE_GRABBER, video_nr) < 0)
 		goto err_exit;
 	printk(KERN_INFO "USBVision[%d]: registered USBVision Video device %s [v4l2]\n",
@@ -1290,6 +1289,7 @@ static int usbvision_register_video(struct usb_usbvision *usbvision)
 		/* usbvision has radio */
 		usbvision_vdev_init(usbvision, &usbvision->rdev,
 			      &usbvision_radio_template, "USBVision Radio");
+		usbvision->rdev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 		if (video_register_device(&usbvision->rdev, VFL_TYPE_RADIO, radio_nr) < 0)
 			goto err_exit;
 		printk(KERN_INFO "USBVision[%d]: registered USBVision Radio device %s [v4l2]\n",
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index cd2bc9ed0cd9..87c5663e28bb 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -707,11 +707,6 @@ static int zr364xx_vidioc_querycap(struct file *file, void *priv,
 		strscpy(cap->card, cam->udev->product, sizeof(cap->card));
 	strscpy(cap->bus_info, dev_name(&cam->udev->dev),
 		sizeof(cap->bus_info));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-			    V4L2_CAP_READWRITE |
-			    V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1338,6 +1333,8 @@ static const struct video_device zr364xx_template = {
 	.fops = &zr364xx_fops,
 	.ioctl_ops = &zr364xx_ioctl_ops,
 	.release = video_device_release_empty,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+		       V4L2_CAP_STREAMING,
 };
 
 
-- 
2.20.1

