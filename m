Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1D1150591
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbgBCLmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:42:32 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44019 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727170AbgBCLmc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:42:32 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya7UiS6YMn7E5ya7Zi3Uh0; Mon, 03 Feb 2020 12:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730149; bh=Ua1oFW4PVBSN0rXHqBcPSN7yFXpAVY2c/p5bksKDkK8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Y6nIk3IXMo5OKS3AZjhXx/IoXndh+HdJogGG0Z/PNfdyy9u66TkRqRR4/rHSIbcKW
         k8DwiIPzrnMzAAw3aowANWlU54OkOVz02LrG7A0m5ZfN1omVNHesjgKMiXIfLhblvg
         Vl81a7eGxvqQMFtxEru1WEUPZOgiqnsNT44aCRa1rFv8HSZEFvrr08XIMb0CxYyGTn
         NuuDmGECSdBANfblCSPLIkeSeKc1R79n21ec6xesByRMoqWcuH7MTprUpnVTDOL0Lg
         9Vy3Dt3bnkrszMN6aB3Mra8dn3f451AYdoI4sXuqgPY0cygSyhyp3uH+ecxHWjYatO
         afuBMxYL8n0kQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/11] media/pci: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:17 +0100
Message-Id: <20200203114119.1177490-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNA7tlWQO9+VYXzSmWAQtZnLv9cm1mfpXXL3Diz9gMU3P6deIqCz8FLWdIPuuYQVnddVmc7sYMQIaZKq5HC/CgUtOtvlz0LIA4qdCtjpSDk4ZBIZJKcQ
 XsJTeLs02zjKb5qacGz/PciiWvcDaWM2kKtlfF+4h4g1cVPUEyWvSIIaM/bEzN58hNVfPVjM0PZK2uHeLyN1cIAAoqMqbbKDkZ0wRFMiST/4p35r+B6TYQ/S
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'GRABBER' is a weird name, all other types map to the /dev
device names. Rename to 'VIDEO' to be consistent with the
other types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/bt8xx/bttv-driver.c          |  4 ++--
 drivers/media/pci/cobalt/cobalt-v4l2.c         |  2 +-
 drivers/media/pci/cx18/cx18-streams.c          | 12 ++++++------
 drivers/media/pci/cx23885/cx23885-417.c        |  2 +-
 drivers/media/pci/cx23885/cx23885-video.c      |  2 +-
 drivers/media/pci/cx25821/cx25821-video.c      |  2 +-
 drivers/media/pci/cx88/cx88-blackbird.c        |  2 +-
 drivers/media/pci/cx88/cx88-video.c            |  2 +-
 drivers/media/pci/dt3155/dt3155.c              |  2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c       |  2 +-
 drivers/media/pci/ivtv/ivtv-streams.c          | 12 ++++++------
 drivers/media/pci/meye/meye.c                  |  2 +-
 drivers/media/pci/saa7134/saa7134-core.c       |  2 +-
 drivers/media/pci/saa7134/saa7134-empress.c    |  2 +-
 drivers/media/pci/saa7146/hexium_gemini.c      |  2 +-
 drivers/media/pci/saa7146/hexium_orion.c       |  2 +-
 drivers/media/pci/saa7146/mxb.c                |  2 +-
 drivers/media/pci/saa7164/saa7164-encoder.c    |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c |  2 +-
 drivers/media/pci/solo6x10/solo6x10-v4l2.c     |  2 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c        |  2 +-
 drivers/media/pci/ttpci/av7110_v4l.c           |  2 +-
 drivers/media/pci/ttpci/budget-av.c            |  2 +-
 drivers/media/pci/tw5864/tw5864-video.c        |  2 +-
 drivers/media/pci/tw68/tw68-video.c            |  2 +-
 drivers/media/pci/tw686x/tw686x-video.c        |  2 +-
 26 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index a359da7773a9..9144f795fb93 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -2964,7 +2964,7 @@ static int bttv_open(struct file *file)
 
 	dprintk("open dev=%s\n", video_device_node_name(vdev));
 
-	if (vdev->vfl_type == VFL_TYPE_GRABBER) {
+	if (vdev->vfl_type == VFL_TYPE_VIDEO) {
 		type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	} else if (vdev->vfl_type == VFL_TYPE_VBI) {
 		type = V4L2_BUF_TYPE_VBI_CAPTURE;
@@ -3905,7 +3905,7 @@ static int bttv_register_video(struct bttv *btv)
 	if (no_overlay <= 0)
 		btv->video_dev.device_caps |= V4L2_CAP_VIDEO_OVERLAY;
 
-	if (video_register_device(&btv->video_dev, VFL_TYPE_GRABBER,
+	if (video_register_device(&btv->video_dev, VFL_TYPE_VIDEO,
 				  video_nr[btv->c.nr]) < 0)
 		goto err;
 	pr_info("%d: registered device %s\n",
diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index c5207501d5e0..0ff37496c9ab 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -1272,7 +1272,7 @@ static int cobalt_node_register(struct cobalt *cobalt, int node)
 	video_set_drvdata(vdev, s);
 	ret = vb2_queue_init(q);
 	if (!s->is_audio && ret == 0)
-		ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	else if (!s->is_dummy)
 		ret = cobalt_alsa_init(s);
 
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index b79718519b9b..3178df3c4922 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -48,19 +48,19 @@ static struct {
 } cx18_stream_info[] = {
 	{	/* CX18_ENC_STREAM_TYPE_MPG */
 		"encoder MPEG",
-		VFL_TYPE_GRABBER, 0,
+		VFL_TYPE_VIDEO, 0,
 		PCI_DMA_FROMDEVICE,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 		V4L2_CAP_AUDIO | V4L2_CAP_TUNER
 	},
 	{	/* CX18_ENC_STREAM_TYPE_TS */
 		"TS",
-		VFL_TYPE_GRABBER, -1,
+		VFL_TYPE_VIDEO, -1,
 		PCI_DMA_FROMDEVICE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_YUV */
 		"encoder YUV",
-		VFL_TYPE_GRABBER, CX18_V4L2_ENC_YUV_OFFSET,
+		VFL_TYPE_VIDEO, CX18_V4L2_ENC_YUV_OFFSET,
 		PCI_DMA_FROMDEVICE,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
 		V4L2_CAP_STREAMING | V4L2_CAP_AUDIO | V4L2_CAP_TUNER
@@ -74,13 +74,13 @@ static struct {
 	},
 	{	/* CX18_ENC_STREAM_TYPE_PCM */
 		"encoder PCM audio",
-		VFL_TYPE_GRABBER, CX18_V4L2_ENC_PCM_OFFSET,
+		VFL_TYPE_VIDEO, CX18_V4L2_ENC_PCM_OFFSET,
 		PCI_DMA_FROMDEVICE,
 		V4L2_CAP_TUNER | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_IDX */
 		"encoder IDX",
-		VFL_TYPE_GRABBER, -1,
+		VFL_TYPE_VIDEO, -1,
 		PCI_DMA_FROMDEVICE,
 	},
 	{	/* CX18_ENC_STREAM_TYPE_RAD */
@@ -434,7 +434,7 @@ static int cx18_reg_dev(struct cx18 *cx, int type)
 	name = video_device_node_name(&s->video_dev);
 
 	switch (vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		CX18_INFO("Registered device %s for %s (%d x %d.%02d kB)\n",
 			  name, s->name, cx->stream_buffers[type],
 			  cx->stream_buf_size[type] / 1024,
diff --git a/drivers/media/pci/cx23885/cx23885-417.c b/drivers/media/pci/cx23885/cx23885-417.c
index 2327fe612610..434677bd4ad1 100644
--- a/drivers/media/pci/cx23885/cx23885-417.c
+++ b/drivers/media/pci/cx23885/cx23885-417.c
@@ -1545,7 +1545,7 @@ int cx23885_417_register(struct cx23885_dev *dev)
 	if (dev->tuner_type != TUNER_ABSENT)
 		dev->v4l_device->device_caps |= V4L2_CAP_TUNER;
 	err = video_register_device(dev->v4l_device,
-		VFL_TYPE_GRABBER, -1);
+		VFL_TYPE_VIDEO, -1);
 	if (err < 0) {
 		pr_info("%s: can't register mpeg device\n", dev->name);
 		return err;
diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pci/cx23885/cx23885-video.c
index 7fc408ee4934..000c108b94fd 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -1304,7 +1304,7 @@ int cx23885_video_register(struct cx23885_dev *dev)
 				      V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
 	if (dev->tuner_type != TUNER_ABSENT)
 		dev->video_dev->device_caps |= V4L2_CAP_TUNER;
-	err = video_register_device(dev->video_dev, VFL_TYPE_GRABBER,
+	err = video_register_device(dev->video_dev, VFL_TYPE_VIDEO,
 				    video_nr[dev->nr]);
 	if (err < 0) {
 		pr_info("%s: can't register video device\n",
diff --git a/drivers/media/pci/cx25821/cx25821-video.c b/drivers/media/pci/cx25821/cx25821-video.c
index a10261da0db6..1b80c990cb94 100644
--- a/drivers/media/pci/cx25821/cx25821-video.c
+++ b/drivers/media/pci/cx25821/cx25821-video.c
@@ -757,7 +757,7 @@ int cx25821_video_register(struct cx25821_dev *dev)
 		snprintf(vdev->name, sizeof(vdev->name), "%s #%d", dev->name, i);
 		video_set_drvdata(vdev, chan);
 
-		err = video_register_device(vdev, VFL_TYPE_GRABBER,
+		err = video_register_device(vdev, VFL_TYPE_VIDEO,
 					    video_nr[dev->nr]);
 
 		if (err < 0)
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index d3da7f4297af..fa4ca002ed19 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -1138,7 +1138,7 @@ static int blackbird_register_video(struct cx8802_dev *dev)
 				    V4L2_CAP_VIDEO_CAPTURE;
 	if (dev->core->board.tuner_type != UNSET)
 		dev->mpeg_dev.device_caps |= V4L2_CAP_TUNER;
-	err = video_register_device(&dev->mpeg_dev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&dev->mpeg_dev, VFL_TYPE_VIDEO, -1);
 	if (err < 0) {
 		pr_info("can't register mpeg device\n");
 		return err;
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index b8abcd550604..6aabc45aa93c 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1451,7 +1451,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
 				     V4L2_CAP_VIDEO_CAPTURE;
 	if (core->board.tuner_type != UNSET)
 		dev->video_dev.device_caps |= V4L2_CAP_TUNER;
-	err = video_register_device(&dev->video_dev, VFL_TYPE_GRABBER,
+	err = video_register_device(&dev->video_dev, VFL_TYPE_VIDEO,
 				    video_nr[core->nr]);
 	if (err < 0) {
 		pr_err("can't register video device\n");
diff --git a/drivers/media/pci/dt3155/dt3155.c b/drivers/media/pci/dt3155/dt3155.c
index 7480f0d3ad0f..82581aa5a2a3 100644
--- a/drivers/media/pci/dt3155/dt3155.c
+++ b/drivers/media/pci/dt3155/dt3155.c
@@ -550,7 +550,7 @@ static int dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					IRQF_SHARED, DT3155_NAME, pd);
 	if (err)
 		goto err_iounmap;
-	err = video_register_device(&pd->vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(&pd->vdev, VFL_TYPE_VIDEO, -1);
 	if (err)
 		goto err_free_irq;
 	dev_info(&pdev->dev, "/dev/video%i is ready\n", pd->vdev.minor);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 1adfdc7ab0db..92f5eadf2c99 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1647,7 +1647,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 	vdev->queue = &q->vbq;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING;
 	video_set_drvdata(vdev, cio2);
-	r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	r = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (r) {
 		dev_err(&cio2->pci_dev->dev,
 			"failed to register video device (%d)\n", r);
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index f7de9118f609..f04ee84bab5f 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -99,7 +99,7 @@ static struct {
 } ivtv_stream_info[] = {
 	{	/* IVTV_ENC_STREAM_TYPE_MPG */
 		"encoder MPG",
-		VFL_TYPE_GRABBER, 0,
+		VFL_TYPE_VIDEO, 0,
 		PCI_DMA_FROMDEVICE, 0,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
 			V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
@@ -107,7 +107,7 @@ static struct {
 	},
 	{	/* IVTV_ENC_STREAM_TYPE_YUV */
 		"encoder YUV",
-		VFL_TYPE_GRABBER, IVTV_V4L2_ENC_YUV_OFFSET,
+		VFL_TYPE_VIDEO, IVTV_V4L2_ENC_YUV_OFFSET,
 		PCI_DMA_FROMDEVICE, 0,
 		V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_TUNER |
 			V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
@@ -123,7 +123,7 @@ static struct {
 	},
 	{	/* IVTV_ENC_STREAM_TYPE_PCM */
 		"encoder PCM",
-		VFL_TYPE_GRABBER, IVTV_V4L2_ENC_PCM_OFFSET,
+		VFL_TYPE_VIDEO, IVTV_V4L2_ENC_PCM_OFFSET,
 		PCI_DMA_FROMDEVICE, 0,
 		V4L2_CAP_TUNER | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 		&ivtv_v4l2_enc_fops
@@ -137,7 +137,7 @@ static struct {
 	},
 	{	/* IVTV_DEC_STREAM_TYPE_MPG */
 		"decoder MPG",
-		VFL_TYPE_GRABBER, IVTV_V4L2_DEC_MPG_OFFSET,
+		VFL_TYPE_VIDEO, IVTV_V4L2_DEC_MPG_OFFSET,
 		PCI_DMA_TODEVICE, 0,
 		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 		&ivtv_v4l2_dec_fops
@@ -158,7 +158,7 @@ static struct {
 	},
 	{	/* IVTV_DEC_STREAM_TYPE_YUV */
 		"decoder YUV",
-		VFL_TYPE_GRABBER, IVTV_V4L2_DEC_YUV_OFFSET,
+		VFL_TYPE_VIDEO, IVTV_V4L2_DEC_YUV_OFFSET,
 		PCI_DMA_TODEVICE, 0,
 		V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_AUDIO | V4L2_CAP_READWRITE,
 		&ivtv_v4l2_dec_fops
@@ -318,7 +318,7 @@ static int ivtv_reg_dev(struct ivtv *itv, int type)
 	name = video_device_node_name(&s->vdev);
 
 	switch (vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		IVTV_INFO("Registered device %s for %s (%d kB)\n",
 			name, s->name, itv->options.kilobytes[type]);
 		break;
diff --git a/drivers/media/pci/meye/meye.c b/drivers/media/pci/meye/meye.c
index 3a4c29bc0ba5..73e064e6f56d 100644
--- a/drivers/media/pci/meye/meye.c
+++ b/drivers/media/pci/meye/meye.c
@@ -1711,7 +1711,7 @@ static int meye_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
 	v4l2_ctrl_handler_setup(&meye.hdl);
 	meye.vdev.ctrl_handler = &meye.hdl;
 
-	if (video_register_device(&meye.vdev, VFL_TYPE_GRABBER,
+	if (video_register_device(&meye.vdev, VFL_TYPE_VIDEO,
 				  video_nr) < 0) {
 		v4l2_err(v4l2_dev, "video_register_device failed\n");
 		goto outvideoreg;
diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 2d582c02adbf..e4623ed2f831 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1214,7 +1214,7 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	if (saa7134_no_overlay <= 0)
 		dev->video_dev->device_caps |= V4L2_CAP_VIDEO_OVERLAY;
 
-	err = video_register_device(dev->video_dev,VFL_TYPE_GRABBER,
+	err = video_register_device(dev->video_dev,VFL_TYPE_VIDEO,
 				    video_nr[dev->nr]);
 	if (err < 0) {
 		pr_info("%s: can't register video device\n",
diff --git a/drivers/media/pci/saa7134/saa7134-empress.c b/drivers/media/pci/saa7134/saa7134-empress.c
index cb65d345fd3e..8ad7879bd840 100644
--- a/drivers/media/pci/saa7134/saa7134-empress.c
+++ b/drivers/media/pci/saa7134/saa7134-empress.c
@@ -291,7 +291,7 @@ static int empress_init(struct saa7134_dev *dev)
 		dev->empress_dev->device_caps |= V4L2_CAP_TUNER;
 
 	video_set_drvdata(dev->empress_dev, dev);
-	err = video_register_device(dev->empress_dev,VFL_TYPE_GRABBER,
+	err = video_register_device(dev->empress_dev,VFL_TYPE_VIDEO,
 				    empress_nr[dev->nr]);
 	if (err < 0) {
 		pr_info("%s: can't register video device\n",
diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index f96226930670..2214c74bbbf1 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -289,7 +289,7 @@ static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
 	vv_data.vid_ops.vidioc_enum_input = vidioc_enum_input;
 	vv_data.vid_ops.vidioc_g_input = vidioc_g_input;
 	vv_data.vid_ops.vidioc_s_input = vidioc_s_input;
-	ret = saa7146_register_device(&hexium->video_dev, dev, "hexium gemini", VFL_TYPE_GRABBER);
+	ret = saa7146_register_device(&hexium->video_dev, dev, "hexium gemini", VFL_TYPE_VIDEO);
 	if (ret < 0) {
 		pr_err("cannot register capture v4l2 device. skipping.\n");
 		saa7146_vv_release(dev);
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index bf5e55348f15..39d14c179d22 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -362,7 +362,7 @@ static int hexium_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_d
 	vv_data.vid_ops.vidioc_enum_input = vidioc_enum_input;
 	vv_data.vid_ops.vidioc_g_input = vidioc_g_input;
 	vv_data.vid_ops.vidioc_s_input = vidioc_s_input;
-	if (0 != saa7146_register_device(&hexium->video_dev, dev, "hexium orion", VFL_TYPE_GRABBER)) {
+	if (0 != saa7146_register_device(&hexium->video_dev, dev, "hexium orion", VFL_TYPE_VIDEO)) {
 		pr_err("cannot register capture v4l2 device. skipping.\n");
 		return -1;
 	}
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index e6a71c17566d..129a1f8ebe1a 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -707,7 +707,7 @@ static int mxb_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data
 	vv_data.vid_ops.vidioc_g_register = vidioc_g_register;
 	vv_data.vid_ops.vidioc_s_register = vidioc_s_register;
 #endif
-	if (saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_GRABBER)) {
+	if (saa7146_register_device(&mxb->video_dev, dev, "mxb", VFL_TYPE_VIDEO)) {
 		ERR("cannot register capture v4l2 device. skipping.\n");
 		saa7146_vv_release(dev);
 		return -1;
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 3fca7257a720..11e1eb6a6809 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -1087,7 +1087,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 	v4l2_ctrl_handler_setup(hdl);
 	video_set_drvdata(port->v4l_device, port);
 	result = video_register_device(port->v4l_device,
-		VFL_TYPE_GRABBER, -1);
+		VFL_TYPE_VIDEO, -1);
 	if (result < 0) {
 		printk(KERN_INFO "%s: can't register mpeg device\n",
 			dev->name);
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 476d7f3b32d6..cbf85231b708 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -1304,7 +1304,7 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
 	solo_enc->vfd->queue = &solo_enc->vidq;
 	solo_enc->vfd->lock = &solo_enc->lock;
 	video_set_drvdata(solo_enc->vfd, solo_enc);
-	ret = video_register_device(solo_enc->vfd, VFL_TYPE_GRABBER, nr);
+	ret = video_register_device(solo_enc->vfd, VFL_TYPE_VIDEO, nr);
 	if (ret < 0)
 		goto vdev_release;
 
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
index 78792067e920..54434f3c428d 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
@@ -692,7 +692,7 @@ int solo_v4l2_init(struct solo_dev *solo_dev, unsigned nr)
 	while (erase_off(solo_dev))
 		/* Do nothing */;
 
-	ret = video_register_device(solo_dev->vfd, VFL_TYPE_GRABBER, nr);
+	ret = video_register_device(solo_dev->vfd, VFL_TYPE_VIDEO, nr);
 	if (ret < 0)
 		goto fail;
 
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index fd3de3bb0c89..798574cfad35 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -1069,7 +1069,7 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 	vip->video_dev.lock = &vip->v4l_lock;
 	video_set_drvdata(&vip->video_dev, vip);
 
-	ret = video_register_device(&vip->video_dev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&vip->video_dev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto vrelease;
 
diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
index f3d6c3cdb872..cabe006658dd 100644
--- a/drivers/media/pci/ttpci/av7110_v4l.c
+++ b/drivers/media/pci/ttpci/av7110_v4l.c
@@ -831,7 +831,7 @@ int av7110_init_v4l(struct av7110 *av7110)
 	if (FW_VERSION(av7110->arm_app) < 0x2623)
 		vv_data->capabilities &= ~V4L2_CAP_SLICED_VBI_OUTPUT;
 
-	if (saa7146_register_device(&av7110->v4l_dev, dev, "av7110", VFL_TYPE_GRABBER)) {
+	if (saa7146_register_device(&av7110->v4l_dev, dev, "av7110", VFL_TYPE_VIDEO)) {
 		ERR("cannot register capture device. skipping\n");
 		saa7146_vv_release(dev);
 		return -ENODEV;
diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
index e2d482af2367..38cac508bd72 100644
--- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -1470,7 +1470,7 @@ static int budget_av_attach(struct saa7146_dev *dev, struct saa7146_pci_extensio
 		vv_data.vid_ops.vidioc_g_input = vidioc_g_input;
 		vv_data.vid_ops.vidioc_s_input = vidioc_s_input;
 
-		if ((err = saa7146_register_device(&budget_av->vd, dev, "knc1", VFL_TYPE_GRABBER))) {
+		if ((err = saa7146_register_device(&budget_av->vd, dev, "knc1", VFL_TYPE_VIDEO))) {
 			/* fixme: proper cleanup here */
 			ERR("cannot register capture v4l2 device\n");
 			saa7146_vv_release(dev);
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 09732eed7eb4..ec1e06da7e4f 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -1156,7 +1156,7 @@ static int tw5864_video_input_init(struct tw5864_input *input, int video_nr)
 	input->gop = GOP_SIZE;
 	input->frame_interval = 1;
 
-	ret = video_register_device(&input->vdev, VFL_TYPE_GRABBER, video_nr);
+	ret = video_register_device(&input->vdev, VFL_TYPE_VIDEO, video_nr);
 	if (ret)
 		goto free_v4l2_hdl;
 
diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
index 2fb82d50c53e..10986fcd66a5 100644
--- a/drivers/media/pci/tw68/tw68-video.c
+++ b/drivers/media/pci/tw68/tw68-video.c
@@ -962,7 +962,7 @@ int tw68_video_init2(struct tw68_dev *dev, int video_nr)
 	dev->vdev.lock = &dev->lock;
 	dev->vdev.queue = &dev->vidq;
 	video_set_drvdata(&dev->vdev, dev);
-	return video_register_device(&dev->vdev, VFL_TYPE_GRABBER, video_nr);
+	return video_register_device(&dev->vdev, VFL_TYPE_VIDEO, video_nr);
 }
 
 /*
diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
index 9be8c6e4fb69..1ced2b0ddb24 100644
--- a/drivers/media/pci/tw686x/tw686x-video.c
+++ b/drivers/media/pci/tw686x/tw686x-video.c
@@ -1282,7 +1282,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
 		vc->device = vdev;
 		video_set_drvdata(vdev, vc);
 
-		err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+		err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (err < 0)
 			goto error;
 		vc->num = vdev->num;
-- 
2.24.0

