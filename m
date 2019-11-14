Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7C6FCF15
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKNUE1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:27 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:65365
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726444AbfKNUE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:26 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 3A59D342133;
        Thu, 14 Nov 2019 20:04:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-169-194.trex.outbound.svc.cluster.local [100.96.169.194])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 975E43417AD;
        Thu, 14 Nov 2019 20:04:24 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:25 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Harmony-Descriptive: 565649b7612d3672_1573761865045_1004167813
X-MC-Loop-Signature: 1573761865045:2180476386
X-MC-Ingress-Time: 1573761865045
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 99A3582614;
        Thu, 14 Nov 2019 12:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        E2TntZjSHOkYP16XG+4FnBzB9To=; b=Y8l+zSWvprR9a2ScKlXO1gRAk3scrzFF
        d9T2hrkKyekrykJ2ATMKpP/Eq0Cm1tYr79Vy3pqdoueGraXLkPbc9lvqxPigR144
        3GB9qLffjCe9UqA59wVAnJloQl81fgBVlbouKwMqlwf4u5p433/V9qs2nexvzva1
        fgf1HTMTh/s=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id 3FE598260D;
        Thu, 14 Nov 2019 12:04:21 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 10/14] cx23885: Add i2c device analog tuner support
Date:   Thu, 14 Nov 2019 14:04:04 -0600
Message-Id: <20191114200408.28883-11-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hauppauge QuadHD/1265/5525 boards all use i2c device drivers and
have tuner_type equal TUNER_ABSENT. This means additional support
is required to enable the analog tuning capability, a case
statement is used to identify these models.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Fix capabilities and device caps

 drivers/media/pci/cx23885/cx23885-video.c | 87 +++++++++++++++++++----
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-video.c b/drivers/media/pc=
i/cx23885/cx23885-video.c
index e2062a0c4cf7..feb083600b1c 100644
--- a/drivers/media/pci/cx23885/cx23885-video.c
+++ b/drivers/media/pci/cx23885/cx23885-video.c
@@ -638,8 +638,18 @@ static int vidioc_querycap(struct file *file, void  =
*priv,
 			    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE |
 			    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VBI_CAPTURE |
 			    V4L2_CAP_DEVICE_CAPS;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 		cap->capabilities |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			cap->capabilities |=3D V4L2_CAP_TUNER;
+		break;
+	}
 	return 0;
 }
=20
@@ -885,8 +895,17 @@ static int vidioc_g_tuner(struct file *file, void *p=
riv,
 {
 	struct cx23885_dev *dev =3D video_drvdata(file);
=20
-	if (dev->tuner_type =3D=3D TUNER_ABSENT)
-		return -EINVAL;
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
+		break;
+	default:
+		if (dev->tuner_type =3D=3D TUNER_ABSENT)
+			return -EINVAL;
+		break;
+	}
 	if (0 !=3D t->index)
 		return -EINVAL;
=20
@@ -901,8 +920,17 @@ static int vidioc_s_tuner(struct file *file, void *p=
riv,
 {
 	struct cx23885_dev *dev =3D video_drvdata(file);
=20
-	if (dev->tuner_type =3D=3D TUNER_ABSENT)
-		return -EINVAL;
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
+		break;
+	default:
+		if (dev->tuner_type =3D=3D TUNER_ABSENT)
+			return -EINVAL;
+		break;
+	}
 	if (0 !=3D t->index)
 		return -EINVAL;
 	/* Update the A/V core */
@@ -916,9 +944,17 @@ static int vidioc_g_frequency(struct file *file, voi=
d *priv,
 {
 	struct cx23885_dev *dev =3D video_drvdata(file);
=20
-	if (dev->tuner_type =3D=3D TUNER_ABSENT)
-		return -EINVAL;
-
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
+		break;
+	default:
+		if (dev->tuner_type =3D=3D TUNER_ABSENT)
+			return -EINVAL;
+		break;
+	}
 	f->type =3D V4L2_TUNER_ANALOG_TV;
 	f->frequency =3D dev->freq;
=20
@@ -932,8 +968,17 @@ static int cx23885_set_freq(struct cx23885_dev *dev,=
 const struct v4l2_frequency
 	struct v4l2_ctrl *mute;
 	int old_mute_val =3D 1;
=20
-	if (dev->tuner_type =3D=3D TUNER_ABSENT)
-		return -EINVAL;
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
+		break;
+	default:
+		if (dev->tuner_type =3D=3D TUNER_ABSENT)
+			return -EINVAL;
+		break;
+	}
 	if (unlikely(f->tuner !=3D 0))
 		return -EINVAL;
=20
@@ -1310,8 +1355,17 @@ int cx23885_video_register(struct cx23885_dev *dev=
)
 	dev->video_dev->queue =3D &dev->vb2_vidq;
 	dev->video_dev->device_caps =3D V4L2_CAP_READWRITE | V4L2_CAP_STREAMING=
 |
 				      V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 		dev->video_dev->device_caps |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			dev->video_dev->device_caps |=3D V4L2_CAP_TUNER;
+	}
 	err =3D video_register_device(dev->video_dev, VFL_TYPE_GRABBER,
 				    video_nr[dev->nr]);
 	if (err < 0) {
@@ -1328,8 +1382,17 @@ int cx23885_video_register(struct cx23885_dev *dev=
)
 	dev->vbi_dev->queue =3D &dev->vb2_vbiq;
 	dev->vbi_dev->device_caps =3D V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				    V4L2_CAP_AUDIO | V4L2_CAP_VBI_CAPTURE;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
+	switch (dev->board) { /* i2c device tuners */
+	case CX23885_BOARD_HAUPPAUGE_HVR1265_K4:
+	case CX23885_BOARD_HAUPPAUGE_HVR5525:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_DVB:
+	case CX23885_BOARD_HAUPPAUGE_QUADHD_ATSC:
 		dev->vbi_dev->device_caps |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			dev->vbi_dev->device_caps |=3D V4L2_CAP_TUNER;
+	}
 	err =3D video_register_device(dev->vbi_dev, VFL_TYPE_VBI,
 				    vbi_nr[dev->nr]);
 	if (err < 0) {
--=20
2.23.0

