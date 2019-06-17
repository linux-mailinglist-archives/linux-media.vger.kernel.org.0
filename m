Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC35547E95
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 11:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbfFQJgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 05:36:22 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51317 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbfFQJgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 05:36:22 -0400
Received: from [IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6] ([IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6])
        by smtp-cloud8.xs4all.net with ESMTPA
        id co3lhpHtH41bFco3mhcGaL; Mon, 17 Jun 2019 11:36:18 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] media/pci: set device_caps in struct video_device
Message-ID: <6ab93ea9-a1c7-4c1b-464f-e15f6bb4bb19@xs4all.nl>
Date:   Mon, 17 Jun 2019 11:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL3lqO42BGvWM+JdGIGVFVzxVoEXyhqOBTX4+IsPcgOFsJcs/0anb8piG2DiQW6845CBNAJLzryHK9i1CEwjYAawfxyxCFldY5F8HCpxT1CuG+oq2akO
 cEPrvFTqaD8DqhmynCeFDEGhnZ8srdpQGox8B1eBYRCtb7H2xOcmcYiaVyJYm0JHxT9BWybshP3vlomRAhy7lq7MTEbWacLZexiVikQ/IthRv/ekeORS7QL9
 LWVFKsgFKfkgPAkPOH1KDvWkx+OSml0culM4GqMbetM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
all pci drivers in this patch.

Tested with cx88-blackbird and ivtv PVR-350.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v2:

- added missing device_caps for cx88-blackbird.c
- dropped OUTPUT_OVERLAY from ivtv decoder cards (it's now set when
  the ivtvfb framebuffer module connects to the ivtv driver).
---
 drivers/media/common/saa7146/saa7146_fops.c   |  9 ++++
 drivers/media/common/saa7146/saa7146_video.c  | 18 ++-----
 drivers/media/pci/bt8xx/bttv-driver.c         | 50 ++++++++-----------
 drivers/media/pci/cobalt/cobalt-v4l2.c        | 14 +++---
 drivers/media/pci/cx18/cx18-ioctl.c           |  5 +-
 drivers/media/pci/cx18/cx18-streams.c         |  1 +
 drivers/media/pci/cx23885/cx23885-417.c       | 13 +++--
 drivers/media/pci/cx23885/cx23885-video.c     | 22 ++++----
 drivers/media/pci/cx25821/cx25821-video.c     | 14 +++---
 drivers/media/pci/cx88/cx88-blackbird.c       |  4 ++
 drivers/media/pci/cx88/cx88-video.c           | 32 +++++-------
 drivers/media/pci/dt3155/dt3155.c             |  5 +-
 drivers/media/pci/ivtv/ivtv-cards.h           |  3 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  7 ---
 drivers/media/pci/ivtv/ivtv-streams.c         | 14 ++++--
 drivers/media/pci/ivtv/ivtvfb.c               | 10 ++++
 drivers/media/pci/meye/meye.c                 |  6 +--
 drivers/media/pci/saa7134/saa7134-core.c      | 15 ++++++
 drivers/media/pci/saa7134/saa7134-empress.c   |  4 ++
 drivers/media/pci/saa7134/saa7134-video.c     | 46 +++--------------
 drivers/media/pci/saa7164/saa7164-encoder.c   | 15 ++----
 drivers/media/pci/saa7164/saa7164-vbi.c       | 15 ++----
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  5 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c    |  5 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c       |  6 +--
 drivers/media/pci/tw68/tw68-video.c           |  8 +--
 drivers/media/pci/tw686x/tw686x-video.c       |  5 +-
 27 files changed, 159 insertions(+), 192 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index be4f80a40214..aabb830e7468 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -608,6 +608,15 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 	for (i = 0; i < dev->ext_vv_data->num_stds; i++)
 		vfd->tvnorms |= dev->ext_vv_data->stds[i].id;
 	strscpy(vfd->name, name, sizeof(vfd->name));
+	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
+			   V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+	vfd->device_caps |= dev->ext_vv_data->capabilities;
+	if (type == VFL_TYPE_GRABBER)
+		vfd->device_caps &=
+			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
+	else
+		vfd->device_caps &=
+			~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY | V4L2_CAP_AUDIO);
 	video_set_drvdata(vfd, dev);

 	err = video_register_device(vfd, type, -1);
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
index a0f0b5eef0bd..4c399a42e874 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -448,25 +448,15 @@ static int video_end(struct saa7146_fh *fh, struct file *file)

 static int vidioc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct saa7146_dev *dev = ((struct saa7146_fh *)fh)->dev;

 	strscpy((char *)cap->driver, "saa7146 v4l2", sizeof(cap->driver));
 	strscpy((char *)cap->card, dev->ext->name, sizeof(cap->card));
 	sprintf((char *)cap->bus_info, "PCI:%s", pci_name(dev->pci));
-	cap->device_caps =
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_VIDEO_OVERLAY |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_STREAMING;
-	cap->device_caps |= dev->ext_vv_data->capabilities;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		cap->device_caps &=
-			~(V4L2_CAP_VBI_CAPTURE | V4L2_CAP_SLICED_VBI_OUTPUT);
-	else
-		cap->device_caps &=
-			~(V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY | V4L2_CAP_AUDIO);
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OVERLAY |
+			    V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_DEVICE_CAPS;
+	cap->capabilities |= dev->ext_vv_data->capabilities;
 	return 0;
 }

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 636e6a2549a9..612d1c0010c1 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2453,7 +2453,6 @@ static int bttv_s_fmt_vid_overlay(struct file *file, void *priv,
 static int bttv_querycap(struct file *file, void  *priv,
 				struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
 	struct bttv_fh *fh = priv;
 	struct bttv *btv = fh->btv;

@@ -2464,17 +2463,17 @@ static int bttv_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, btv->video_dev.name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "PCI:%s", pci_name(btv->c.pci));
-	cap->capabilities =
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_STREAMING |
-		V4L2_CAP_DEVICE_CAPS;
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	if (no_overlay <= 0)
 		cap->capabilities |= V4L2_CAP_VIDEO_OVERLAY;
 	if (video_is_registered(&btv->vbi_dev))
 		cap->capabilities |= V4L2_CAP_VBI_CAPTURE;
-	if (video_is_registered(&btv->radio_dev))
+	if (video_is_registered(&btv->radio_dev)) {
 		cap->capabilities |= V4L2_CAP_RADIO;
+		if (btv->has_tea575x)
+			cap->capabilities |= V4L2_CAP_HW_FREQ_SEEK;
+	}

 	/*
 	 * No need to lock here: those vars are initialized during board
@@ -2484,27 +2483,6 @@ static int bttv_querycap(struct file *file, void  *priv,
 		cap->capabilities |= V4L2_CAP_RDS_CAPTURE;
 	if (btv->tuner_type != TUNER_ABSENT)
 		cap->capabilities |= V4L2_CAP_TUNER;
-	if (vdev->vfl_type == VFL_TYPE_GRABBER)
-		cap->device_caps = cap->capabilities &
-			(V4L2_CAP_VIDEO_CAPTURE |
-			 V4L2_CAP_READWRITE |
-			 V4L2_CAP_STREAMING |
-			 V4L2_CAP_VIDEO_OVERLAY |
-			 V4L2_CAP_TUNER);
-	else if (vdev->vfl_type == VFL_TYPE_VBI)
-		cap->device_caps = cap->capabilities &
-			(V4L2_CAP_VBI_CAPTURE |
-			 V4L2_CAP_READWRITE |
-			 V4L2_CAP_STREAMING |
-			 V4L2_CAP_TUNER);
-	else {
-		cap->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
-		if (btv->has_saa6588)
-			cap->device_caps |= V4L2_CAP_READWRITE |
-						V4L2_CAP_RDS_CAPTURE;
-		if (btv->has_tea575x)
-			cap->device_caps |= V4L2_CAP_HW_FREQ_SEEK;
-	}
 	return 0;
 }

@@ -3939,6 +3917,12 @@ static int bttv_register_video(struct bttv *btv)

 	/* video */
 	vdev_init(btv, &btv->video_dev, &bttv_video_template, "video");
+	btv->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
+				     V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+	if (btv->tuner_type != TUNER_ABSENT)
+		btv->video_dev.device_caps |= V4L2_CAP_TUNER;
+	if (no_overlay <= 0)
+		btv->video_dev.device_caps |= V4L2_CAP_VIDEO_OVERLAY;

 	if (video_register_device(&btv->video_dev, VFL_TYPE_GRABBER,
 				  video_nr[btv->c.nr]) < 0)
@@ -3953,6 +3937,10 @@ static int bttv_register_video(struct bttv *btv)

 	/* vbi */
 	vdev_init(btv, &btv->vbi_dev, &bttv_video_template, "vbi");
+	btv->vbi_dev.device_caps = V4L2_CAP_VBI_CAPTURE | V4L2_CAP_READWRITE |
+				   V4L2_CAP_STREAMING | V4L2_CAP_TUNER;
+	if (btv->tuner_type != TUNER_ABSENT)
+		btv->vbi_dev.device_caps |= V4L2_CAP_TUNER;

 	if (video_register_device(&btv->vbi_dev, VFL_TYPE_VBI,
 				  vbi_nr[btv->c.nr]) < 0)
@@ -3964,6 +3952,12 @@ static int bttv_register_video(struct bttv *btv)
 		return 0;
 	/* radio */
 	vdev_init(btv, &btv->radio_dev, &radio_template, "radio");
+	btv->radio_dev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
+	if (btv->has_saa6588)
+		btv->radio_dev.device_caps |= V4L2_CAP_READWRITE |
+					      V4L2_CAP_RDS_CAPTURE;
+	if (btv->has_tea575x)
+		btv->radio_dev.device_caps |= V4L2_CAP_HW_FREQ_SEEK;
 	btv->radio_dev.ctrl_handler = &btv->radio_ctrl_handler;
 	if (video_register_device(&btv->radio_dev, VFL_TYPE_RADIO,
 				  radio_nr[btv->c.nr]) < 0)
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index f9fa3a7c3b8f..39dabd4da60f 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -483,13 +483,8 @@ static int cobalt_querycap(struct file *file, void *priv_fh,
 	strscpy(vcap->card, "cobalt", sizeof(vcap->card));
 	snprintf(vcap->bus_info, sizeof(vcap->bus_info),
 		 "PCIe:%s", pci_name(cobalt->pci_dev));
-	vcap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-	if (s->is_output)
-		vcap->device_caps |= V4L2_CAP_VIDEO_OUTPUT;
-	else
-		vcap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-	vcap->capabilities = vcap->device_caps | V4L2_CAP_DEVICE_CAPS |
-		V4L2_CAP_VIDEO_CAPTURE;
+	vcap->capabilities = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE |
+		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_DEVICE_CAPS;
 	if (cobalt->have_hsma_tx)
 		vcap->capabilities |= V4L2_CAP_VIDEO_OUTPUT;
 	return 0;
@@ -1274,6 +1269,11 @@ static int cobalt_node_register(struct cobalt *cobalt, int node)
 	q->lock = &s->lock;
 	q->dev = &cobalt->pci_dev->dev;
 	vdev->queue = q;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+	if (s->is_output)
+		vdev->device_caps |= V4L2_CAP_VIDEO_OUTPUT;
+	else
+		vdev->device_caps |= V4L2_CAP_VIDEO_CAPTURE;

 	video_set_drvdata(vdev, s);
 	ret = vb2_queue_init(q);
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 8c54b17f382a..ecacd5f2c155 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -394,16 +394,13 @@ static int cx18_querycap(struct file *file, void *fh,
 				struct v4l2_capability *vcap)
 {
 	struct cx18_open_id *id = fh2id(fh);
-	struct cx18_stream *s = video_drvdata(file);
 	struct cx18 *cx = id->cx;

 	strscpy(vcap->driver, CX18_DRIVER_NAME, sizeof(vcap->driver));
 	strscpy(vcap->card, cx->card_name, sizeof(vcap->card));
 	snprintf(vcap->bus_info, sizeof(vcap->bus_info),
 		 "PCI:%s", pci_name(cx->pci_dev));
-	vcap->capabilities = cx->v4l2_cap;	/* capabilities */
-	vcap->device_caps = s->v4l2_dev_caps;	/* device capabilities */
-	vcap->capabilities |= V4L2_CAP_DEVICE_CAPS;
+	vcap->capabilities = cx->v4l2_cap | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index b36f4ce25d22..6565ce83a9ed 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -420,6 +420,7 @@ static int cx18_reg_dev(struct cx18 *cx, int type)
 		return 0;

 	num = s->video_dev.num;
+	s->video_dev.device_caps = s->v4l2_dev_caps;	/* device capabilities */
 	/* card number + user defined offset + device offset */
 	if (type != CX18_ENC_STREAM_TYPE_MPG) {
 		struct cx18_stream *s_mpg = &cx->streams[CX18_ENC_STREAM_TYPE_MPG];
diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 4863bd4ea5d0..b0640eba385c 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1333,12 +1333,11 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, cx23885_boards[tsport->dev->board].name,
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCIe:%s", pci_name(dev->pci));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
-			   V4L2_CAP_STREAMING;
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_AUDIO | V4L2_CAP_DEVICE_CAPS;
 	if (dev->tuner_type != TUNER_ABSENT)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	cap->capabilities = cap->device_caps | V4L2_CAP_VBI_CAPTURE |
-		V4L2_CAP_AUDIO | V4L2_CAP_DEVICE_CAPS;
+		cap->capabilities |= V4L2_CAP_TUNER;

 	return 0;
 }
@@ -1551,6 +1550,10 @@ int cx23885_417_register(struct cx23885_dev *dev)
 	video_set_drvdata(dev->v4l_device, dev);
 	dev->v4l_device->lock = &dev->lock;
 	dev->v4l_device->queue = q;
+	dev->v4l_device->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				       V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->v4l_device->device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(dev->v4l_device,
 		VFL_TYPE_GRABBER, -1);
 	if (err < 0) {
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 168178c1e574..c55165f73b5f 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -637,21 +637,17 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	struct v4l2_capability *cap)
 {
 	struct cx23885_dev *dev = video_drvdata(file);
-	struct video_device *vdev = video_devdata(file);

 	strscpy(cap->driver, "cx23885", sizeof(cap->driver));
 	strscpy(cap->card, cx23885_boards[dev->board].name,
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCIe:%s", pci_name(dev->pci));
-	cap->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING | V4L2_CAP_AUDIO;
+	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_DEVICE_CAPS;
 	if (dev->tuner_type != TUNER_ABSENT)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	if (vdev->vfl_type == VFL_TYPE_VBI)
-		cap->device_caps |= V4L2_CAP_VBI_CAPTURE;
-	else
-		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_VBI_CAPTURE |
-		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_DEVICE_CAPS;
+		cap->capabilities |= V4L2_CAP_TUNER;
 	return 0;
 }

@@ -1316,6 +1312,10 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	dev->video_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_video_template, "video");
 	dev->video_dev->queue = &dev->vb2_vidq;
+	dev->video_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				      V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->video_dev->device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(dev->video_dev, VFL_TYPE_GRABBER,
 				    video_nr[dev->nr]);
 	if (err < 0) {
@@ -1330,6 +1330,10 @@ int cx23885_video_register(struct cx23885_dev *dev)
 	dev->vbi_dev = cx23885_vdev_init(dev, dev->pci,
 		&cx23885_vbi_template, "vbi");
 	dev->vbi_dev->queue = &dev->vb2_vbiq;
+	dev->vbi_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT)
+		dev->vbi_dev->device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(dev->vbi_dev, VFL_TYPE_VBI,
 				    vbi_nr[dev->nr]);
 	if (err < 0) {
diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index 3d23c2e64102..352185c1c279 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -437,18 +437,13 @@ static int cx25821_vidioc_querycap(struct file *file, void *priv,
 {
 	struct cx25821_channel *chan = video_drvdata(file);
 	struct cx25821_dev *dev = chan->dev;
-	const u32 cap_input = V4L2_CAP_VIDEO_CAPTURE |
-			V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	const u32 cap_output = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE;

 	strscpy(cap->driver, "cx25821", sizeof(cap->driver));
 	strscpy(cap->card, cx25821_boards[dev->board].name, sizeof(cap->card));
 	sprintf(cap->bus_info, "PCIe:%s", pci_name(dev->pci));
-	if (chan->id >= VID_CHANNEL_NUM)
-		cap->device_caps = cap_output;
-	else
-		cap->device_caps = cap_input;
-	cap->capabilities = cap_input | cap_output | V4L2_CAP_DEVICE_CAPS;
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
+			    V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -635,6 +630,8 @@ static const struct video_device cx25821_video_device = {
 	.minor = -1,
 	.ioctl_ops = &video_ioctl_ops,
 	.tvnorms = CX25821_NORMS,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+		       V4L2_CAP_STREAMING,
 };

 static const struct v4l2_file_operations video_out_fops = {
@@ -668,6 +665,7 @@ static const struct video_device cx25821_video_out_device = {
 	.minor = -1,
 	.ioctl_ops = &video_out_ioctl_ops,
 	.tvnorms = CX25821_NORMS,
+	.device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_READWRITE,
 };

 void cx25821_video_unregister(struct cx25821_dev *dev, int chan_num)
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index 6c0bb9fe4a31..d26faad676c7 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -1145,6 +1145,10 @@ static int blackbird_register_video(struct cx8802_dev *dev)
 	dev->mpeg_dev.ctrl_handler = &dev->cxhdl.hdl;
 	video_set_drvdata(&dev->mpeg_dev, dev);
 	dev->mpeg_dev.queue = &dev->vb2_mpegq;
+	dev->mpeg_dev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_VIDEO_CAPTURE;
+	if (dev->core->board.tuner_type != UNSET)
+		dev->mpeg_dev.device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(&dev->mpeg_dev, VFL_TYPE_GRABBER, -1);
 	if (err < 0) {
 		pr_info("can't register mpeg device\n");
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index e1549d352f70..422dbe0cc9de 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -809,27 +809,12 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 int cx88_querycap(struct file *file, struct cx88_core *core,
 		  struct v4l2_capability *cap)
 {
-	struct video_device *vdev = video_devdata(file);
-
 	strscpy(cap->card, core->board.name, sizeof(cap->card));
-	cap->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
+	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_DEVICE_CAPS;
 	if (core->board.tuner_type != UNSET)
-		cap->device_caps |= V4L2_CAP_TUNER;
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_RADIO:
-		cap->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
-		break;
-	case VFL_TYPE_GRABBER:
-		cap->device_caps |= V4L2_CAP_VIDEO_CAPTURE;
-		break;
-	case VFL_TYPE_VBI:
-		cap->device_caps |= V4L2_CAP_VBI_CAPTURE;
-		break;
-	default:
-		return -EINVAL;
-	}
-	cap->capabilities = cap->device_caps | V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_VBI_CAPTURE | V4L2_CAP_DEVICE_CAPS;
+		cap->capabilities |= V4L2_CAP_TUNER;
 	if (core->board.radio.type == CX88_RADIO)
 		cap->capabilities |= V4L2_CAP_RADIO;
 	return 0;
@@ -1482,6 +1467,10 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 	video_set_drvdata(&dev->video_dev, dev);
 	dev->video_dev.ctrl_handler = &core->video_hdl;
 	dev->video_dev.queue = &dev->vb2_vidq;
+	dev->video_dev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				     V4L2_CAP_VIDEO_CAPTURE;
+	if (core->board.tuner_type != UNSET)
+		dev->video_dev.device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(&dev->video_dev, VFL_TYPE_GRABBER,
 				    video_nr[core->nr]);
 	if (err < 0) {
@@ -1495,6 +1484,10 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 		       &cx8800_vbi_template, "vbi");
 	video_set_drvdata(&dev->vbi_dev, dev);
 	dev->vbi_dev.queue = &dev->vb2_vbiq;
+	dev->vbi_dev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				   V4L2_CAP_VBI_CAPTURE;
+	if (core->board.tuner_type != UNSET)
+		dev->vbi_dev.device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(&dev->vbi_dev, VFL_TYPE_VBI,
 				    vbi_nr[core->nr]);
 	if (err < 0) {
@@ -1509,6 +1502,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 			       &cx8800_radio_template, "radio");
 		video_set_drvdata(&dev->radio_dev, dev);
 		dev->radio_dev.ctrl_handler = &core->audio_hdl;
+		dev->radio_dev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 		err = video_register_device(&dev->radio_dev, VFL_TYPE_RADIO,
 					    radio_nr[core->nr]);
 		if (err < 0) {
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 49677ee889e3..f4d3a64de4c3 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -305,9 +305,6 @@ static int dt3155_querycap(struct file *filp, void *p,
 	strscpy(cap->driver, DT3155_NAME, sizeof(cap->driver));
 	strscpy(cap->card, DT3155_NAME " frame grabber", sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(pd->pdev));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -498,6 +495,8 @@ static const struct video_device dt3155_vdev = {
 	.minor = -1,
 	.release = video_device_release_empty,
 	.tvnorms = V4L2_STD_ALL,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+		       V4L2_CAP_READWRITE,
 };

 static int dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/media/pci/ivtv/ivtv-cards.h b/drivers/media/pci/ivtv/ivtv-cards.h
index 1557a6ea4dd9..60209d612bdd 100644
--- a/drivers/media/pci/ivtv/ivtv-cards.h
+++ b/drivers/media/pci/ivtv/ivtv-cards.h
@@ -168,8 +168,7 @@
 #define IVTV_CAP_ENCODER (V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER | \
 			  V4L2_CAP_AUDIO | V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE | \
 			  V4L2_CAP_SLICED_VBI_CAPTURE)
-#define IVTV_CAP_DECODER (V4L2_CAP_VIDEO_OUTPUT | \
-			  V4L2_CAP_SLICED_VBI_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_OVERLAY)
+#define IVTV_CAP_DECODER (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT)

 struct ivtv_card_video_input {
 	u8  video_type;		/* video input type */
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 6c269ecd8d05..eab6ef6498b1 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -746,18 +746,11 @@ static int ivtv_querycap(struct file *file, void *fh, struct v4l2_capability *vc
 {
 	struct ivtv_open_id *id = fh2id(file->private_data);
 	struct ivtv *itv = id->itv;
-	struct ivtv_stream *s = &itv->streams[id->type];

 	strscpy(vcap->driver, IVTV_DRIVER_NAME, sizeof(vcap->driver));
 	strscpy(vcap->card, itv->card_name, sizeof(vcap->card));
 	snprintf(vcap->bus_info, sizeof(vcap->bus_info), "PCI:%s", pci_name(itv->pdev));
 	vcap->capabilities = itv->v4l2_cap | V4L2_CAP_DEVICE_CAPS;
-	vcap->device_caps = s->caps;
-	if ((s->caps & V4L2_CAP_VIDEO_OUTPUT_OVERLAY) &&
-	    !itv->osd_video_pbase) {
-		vcap->capabilities &= ~V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
-		vcap->device_caps &= ~V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
-	}
 	return 0;
 }

diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index a641f20e3f86..f7de9118f609 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -139,8 +139,7 @@ static struct {
 		"decoder MPG",
 		VFL_TYPE_GRABBER, IVTV_V4L2_DEC_MPG_OFFSET,
 		PCI_DMA_TODEVICE, 0,
-		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE |
-		V4L2_CAP_VIDEO_OUTPUT_OVERLAY,
+		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 		&ivtv_v4l2_dec_fops
 	},
 	{	/* IVTV_DEC_STREAM_TYPE_VBI */
@@ -161,8 +160,7 @@ static struct {
 		"decoder YUV",
 		VFL_TYPE_GRABBER, IVTV_V4L2_DEC_YUV_OFFSET,
 		PCI_DMA_TODEVICE, 0,
-		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE |
-		V4L2_CAP_VIDEO_OUTPUT_OVERLAY,
+		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 		&ivtv_v4l2_dec_fops
 	}
 };
@@ -301,6 +299,14 @@ static int ivtv_reg_dev(struct ivtv *itv, int type)
 		if (s_mpg->vdev.v4l2_dev)
 			num = s_mpg->vdev.num + ivtv_stream_info[type].num_offset;
 	}
+	s->vdev.device_caps = s->caps;
+	if (itv->osd_video_pbase) {
+		itv->streams[IVTV_DEC_STREAM_TYPE_YUV].vdev.device_caps |=
+			V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+		itv->streams[IVTV_DEC_STREAM_TYPE_MPG].vdev.device_caps |=
+			V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+		itv->v4l2_cap |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+	}
 	video_set_drvdata(&s->vdev, s);

 	/* Register device. First try the desired minor, then any free one. */
diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index cfd21040d0e3..b1241ec84a2e 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -1232,6 +1232,11 @@ static int ivtvfb_init_card(struct ivtv *itv)

 	/* Allocate DMA */
 	ivtv_udma_alloc(itv);
+	itv->streams[IVTV_DEC_STREAM_TYPE_YUV].vdev.device_caps |=
+		V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+	itv->streams[IVTV_DEC_STREAM_TYPE_MPG].vdev.device_caps |=
+		V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+	itv->v4l2_cap |= V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
 	return 0;

 }
@@ -1258,6 +1263,11 @@ static int ivtvfb_callback_cleanup(struct device *dev, void *p)
 	struct osd_info *oi = itv->osd_info;

 	if (itv->v4l2_cap & V4L2_CAP_VIDEO_OUTPUT) {
+		itv->streams[IVTV_DEC_STREAM_TYPE_YUV].vdev.device_caps &=
+			~V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+		itv->streams[IVTV_DEC_STREAM_TYPE_MPG].vdev.device_caps &=
+			~V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
+		itv->v4l2_cap &= ~V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
 		if (unregister_framebuffer(&itv->osd_info->ivtvfb_info)) {
 			IVTVFB_WARN("Framebuffer %d is in use, cannot unload\n",
 				       itv->instance);
diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 896d2d856795..e437712bae15 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1022,11 +1022,6 @@ static int vidioc_querycap(struct file *file, void *fh,
 	strscpy(cap->driver, "meye", sizeof(cap->driver));
 	strscpy(cap->card, "meye", sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(meye.mchip_dev));
-
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-			    V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }

@@ -1538,6 +1533,7 @@ static const struct video_device meye_template = {
 	.fops		= &meye_fops,
 	.ioctl_ops	= &meye_ioctl_ops,
 	.release	= video_device_release_empty,
+	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
 };

 static const struct v4l2_ctrl_ops meye_ctrl_ops = {
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index aa98ea49558c..559602c8fbbf 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1215,6 +1215,14 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	dev->video_dev->ctrl_handler = &dev->ctrl_handler;
 	dev->video_dev->lock = &dev->lock;
 	dev->video_dev->queue = &dev->video_vbq;
+	dev->video_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				      V4L2_CAP_VIDEO_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT && dev->tuner_type != UNSET)
+		dev->video_dev->device_caps |= V4L2_CAP_TUNER;
+
+	if (saa7134_no_overlay <= 0)
+		dev->video_dev->device_caps |= V4L2_CAP_VIDEO_OVERLAY;
+
 	err = video_register_device(dev->video_dev,VFL_TYPE_GRABBER,
 				    video_nr[dev->nr]);
 	if (err < 0) {
@@ -1229,6 +1237,10 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	dev->vbi_dev->ctrl_handler = &dev->ctrl_handler;
 	dev->vbi_dev->lock = &dev->lock;
 	dev->vbi_dev->queue = &dev->vbi_vbq;
+	dev->vbi_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+				    V4L2_CAP_VBI_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT && dev->tuner_type != UNSET)
+		dev->vbi_dev->device_caps |= V4L2_CAP_TUNER;

 	err = video_register_device(dev->vbi_dev,VFL_TYPE_VBI,
 				    vbi_nr[dev->nr]);
@@ -1241,6 +1253,9 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 		dev->radio_dev = vdev_init(dev,&saa7134_radio_template,"radio");
 		dev->radio_dev->ctrl_handler = &dev->radio_ctrl_handler;
 		dev->radio_dev->lock = &dev->lock;
+		dev->radio_dev->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
+		if (dev->has_rds)
+			dev->radio_dev->device_caps |= V4L2_CAP_RDS_CAPTURE;
 		err = video_register_device(dev->radio_dev,VFL_TYPE_RADIO,
 					    radio_nr[dev->nr]);
 		if (err < 0)
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index 9735bbb908e3..e069ec809cc0 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -296,6 +296,10 @@ static int empress_init(struct saa7134_dev *dev)
 	if (err)
 		return err;
 	dev->empress_dev->queue = q;
+	dev->empress_dev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+					V4L2_CAP_VIDEO_CAPTURE;
+	if (dev->tuner_type != TUNER_ABSENT && dev->tuner_type != UNSET)
+		dev->empress_dev->device_caps |= V4L2_CAP_TUNER;

 	video_set_drvdata(dev->empress_dev, dev);
 	err = video_register_device(dev->empress_dev,VFL_TYPE_GRABBER,
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 5bc4b8fc8ebf..7b18eea1b660 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -1498,50 +1498,20 @@ int saa7134_querycap(struct file *file, void *priv,
 					struct v4l2_capability *cap)
 {
 	struct saa7134_dev *dev = video_drvdata(file);
-	struct video_device *vdev = video_devdata(file);
-	u32 radio_caps, video_caps, vbi_caps;
-
-	unsigned int tuner_type = dev->tuner_type;

 	strscpy(cap->driver, "saa7134", sizeof(cap->driver));
 	strscpy(cap->card, saa7134_boards[dev->board].name,
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
-
-	cap->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	if ((tuner_type != TUNER_ABSENT) && (tuner_type != UNSET))
-		cap->device_caps |= V4L2_CAP_TUNER;
-
-	radio_caps = V4L2_CAP_RADIO;
+	cap->capabilities = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_RADIO | V4L2_CAP_VIDEO_CAPTURE |
+			    V4L2_CAP_VBI_CAPTURE | V4L2_CAP_DEVICE_CAPS;
+	if (dev->tuner_type != TUNER_ABSENT && dev->tuner_type != UNSET)
+		cap->capabilities |= V4L2_CAP_TUNER;
 	if (dev->has_rds)
-		radio_caps |= V4L2_CAP_RDS_CAPTURE;
-
-	video_caps = V4L2_CAP_VIDEO_CAPTURE;
-	if (saa7134_no_overlay <= 0 && !is_empress(file))
-		video_caps |= V4L2_CAP_VIDEO_OVERLAY;
-
-	vbi_caps = V4L2_CAP_VBI_CAPTURE;
-
-	switch (vdev->vfl_type) {
-	case VFL_TYPE_RADIO:
-		cap->device_caps |= radio_caps;
-		break;
-	case VFL_TYPE_GRABBER:
-		cap->device_caps |= video_caps;
-		break;
-	case VFL_TYPE_VBI:
-		cap->device_caps |= vbi_caps;
-		break;
-	default:
-		return -EINVAL;
-	}
-	cap->capabilities = radio_caps | video_caps | vbi_caps |
-		cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-	if (vdev->vfl_type == VFL_TYPE_RADIO) {
-		cap->device_caps &= ~V4L2_CAP_STREAMING;
-		if (!dev->has_rds)
-			cap->device_caps &= ~V4L2_CAP_READWRITE;
-	}
+		cap->capabilities |= V4L2_CAP_RDS_CAPTURE;
+	if (saa7134_no_overlay <= 0)
+		cap->capabilities |= V4L2_CAP_VIDEO_OVERLAY;

 	return 0;
 }
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index adec2bab8352..81d419951b44 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -501,16 +501,9 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, saa7164_boards[dev->board].name,
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
-
-	cap->device_caps =
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_TUNER;
-
-	cap->capabilities = cap->device_caps |
-		V4L2_CAP_VBI_CAPTURE |
-		V4L2_CAP_DEVICE_CAPS;
-
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -983,6 +976,8 @@ static struct video_device saa7164_mpeg_template = {
 	.ioctl_ops     = &mpeg_ioctl_ops,
 	.minor         = -1,
 	.tvnorms       = SAA7164_NORMS,
+	.device_caps   = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			 V4L2_CAP_TUNER,
 };

 static struct video_device *saa7164_encoder_alloc(
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index 841c7e94405d..bee84b3c6019 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -212,16 +212,9 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, saa7164_boards[dev->board].name,
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
-
-	cap->device_caps =
-		V4L2_CAP_VBI_CAPTURE |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_TUNER;
-
-	cap->capabilities = cap->device_caps |
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_DEVICE_CAPS;
-
+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+			    V4L2_CAP_TUNER | V4L2_CAP_VBI_CAPTURE |
+			    V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -685,6 +678,8 @@ static struct video_device saa7164_vbi_template = {
 	.ioctl_ops     = &vbi_ioctl_ops,
 	.minor         = -1,
 	.tvnorms       = SAA7164_NORMS,
+	.device_caps   = V4L2_CAP_VBI_CAPTURE | V4L2_CAP_READWRITE |
+			 V4L2_CAP_TUNER,
 };

 static struct video_device *saa7164_vbi_alloc(
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 9d27e7463070..b0e3da9a8e84 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -780,9 +780,6 @@ static int solo_enc_querycap(struct file *file, void  *priv,
 		 solo_enc->ch);
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
 		 pci_name(solo_dev->pdev));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-			V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -1200,6 +1197,8 @@ static const struct video_device solo_enc_template = {
 	.minor			= -1,
 	.release		= video_device_release,
 	.tvnorms		= V4L2_STD_NTSC_M | V4L2_STD_PAL,
+	.device_caps		= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING,
 };

 static const struct v4l2_ctrl_ops solo_ctrl_ops = {
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 69fc939fd3d9..a5880a0d7bae 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -387,9 +387,6 @@ static int solo_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, "Softlogic 6x10", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
 		 pci_name(solo_dev->pdev));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE |
-			V4L2_CAP_READWRITE | V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -637,6 +634,8 @@ static const struct video_device solo_v4l2_template = {
 	.minor			= -1,
 	.release		= video_device_release,
 	.tvnorms		= V4L2_STD_NTSC_M | V4L2_STD_PAL,
+	.device_caps		= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING,
 };

 static const struct v4l2_ctrl_ops solo_ctrl_ops = {
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 2452d8f59cb0..c1ecc744957d 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -423,10 +423,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
 		 pci_name(vip->pdev));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
-			   V4L2_CAP_STREAMING;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }

@@ -775,6 +771,8 @@ static const struct video_device video_dev_template = {
 	.fops = &vip_fops,
 	.ioctl_ops = &vip_ioctl_ops,
 	.tvnorms = V4L2_STD_ALL,
+	.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+		       V4L2_CAP_STREAMING,
 };

 /**
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 4f74b14c3b4f..700e6db8162a 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -738,12 +738,6 @@ static int tw68_querycap(struct file *file, void  *priv,
 	strscpy(cap->card, "Techwell Capture Card",
 		sizeof(cap->card));
 	sprintf(cap->bus_info, "PCI:%s", pci_name(dev->pci));
-	cap->device_caps =
-		V4L2_CAP_VIDEO_CAPTURE |
-		V4L2_CAP_READWRITE |
-		V4L2_CAP_STREAMING;
-
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -922,6 +916,8 @@ static const struct video_device tw68_video_template = {
 	.ioctl_ops		= &video_ioctl_ops,
 	.release		= video_device_release_empty,
 	.tvnorms		= TW68_NORMS,
+	.device_caps		= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING,
 };

 /* ------------------------------------------------------------------ */
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 4890b7f1248b..75c11ff7b837 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -769,9 +769,6 @@ static int tw686x_querycap(struct file *file, void *priv,
 	strscpy(cap->card, dev->name, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "PCI:%s", pci_name(dev->pci_dev));
-	cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-			   V4L2_CAP_READWRITE;
-	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }

@@ -1284,6 +1281,8 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		vdev->minor = -1;
 		vdev->lock = &vc->vb_mutex;
 		vdev->ctrl_handler = &vc->ctrl_handler;
+		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+				    V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 		vc->device = vdev;
 		video_set_drvdata(vdev, vc);

-- 
2.18.0

