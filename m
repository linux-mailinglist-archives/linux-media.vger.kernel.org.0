Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49466FCF19
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 21:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKNUE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 15:04:29 -0500
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:30519
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726474AbfKNUE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 15:04:27 -0500
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 1D1235A0666;
        Thu, 14 Nov 2019 20:04:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (100-96-6-183.trex.outbound.svc.cluster.local [100.96.6.183])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 9720E5A0B51;
        Thu, 14 Nov 2019 20:04:25 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@nextdimension.ws
Received: from pdx1-sub0-mail-a96.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.18.5);
        Thu, 14 Nov 2019 20:04:26 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@nextdimension.ws
X-MailChannels-Auth-Id: dreamhost
X-Left-Ruddy: 15020d7624a40afa_1573761865891_3185931003
X-MC-Loop-Signature: 1573761865891:3698987506
X-MC-Ingress-Time: 1573761865891
Received: from pdx1-sub0-mail-a96.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTP id 32A1F8259B;
        Thu, 14 Nov 2019 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=nextdimension.cc; bh=
        X/3UzQBL4KoonpJBNR8bXWOWDZo=; b=D9l6LJMG0c8sBqSFfFIsPDkI4fZyeWS3
        PGhkvYNl0CtIhQ0LhbnYE8ru1/kLFEtBCQLfj5IeX1dFqt/ckQ8sbep3y+uXLE3G
        BZN+j9MzjPNLM9h9vSJvOnCYT2fP42FdcVU68KQz5/Wrovm5alzivscA3iHGhpZR
        82P7zRMMM7A=
Received: from localhost.localdomain (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@nextdimension.ws)
        by pdx1-sub0-mail-a96.g.dreamhost.com (Postfix) with ESMTPSA id C587282616;
        Thu, 14 Nov 2019 12:04:21 -0800 (PST)
X-DH-BACKEND: pdx1-sub0-mail-a96
From:   Brad Love <brad@nextdimension.cc>
To:     linux-media@vger.kernel.org
Cc:     Brad Love <brad@nextdimension.cc>
Subject: [PATCH v3 11/14] cx231xx: Add i2c device analog tuner support
Date:   Thu, 14 Nov 2019 14:04:05 -0600
Message-Id: <20191114200408.28883-12-brad@nextdimension.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114200408.28883-1-brad@nextdimension.cc>
References: <20191114200408.28883-1-brad@nextdimension.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The boards listed below use i2c device drivers and have
tuner_type equal TUNER_ABSENT. This means additional support
is required to enable the analog tuning capability, a case
statement is used to identify these models.

Models with analog tuning enabled:
- CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx (tested)
- CX231XX_BOARD_HAUPPAUGE_935C (tested)
- CX231XX_BOARD_HAUPPAUGE_955Q (tested)
- CX231XX_BOARD_HAUPPAUGE_975 (tested)
- CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD (untested)

The EvroMedia model was added, since it uses the si2157
tuner and the board profile claims it has analog inputs.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
Since v2:
- Fix capabilities and device caps
Changes since v1:
- remove __func__ from dev_dbg macros

 drivers/media/usb/cx231xx/cx231xx-avcore.c | 35 +++++++--
 drivers/media/usb/cx231xx/cx231xx-video.c  | 85 ++++++++++++++++++----
 2 files changed, 101 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/u=
sb/cx231xx/cx231xx-avcore.c
index 0974965e848f..d6117093491b 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -587,14 +587,27 @@ int cx231xx_set_video_input_mux(struct cx231xx *dev=
, u8 input)
 				return status;
 			}
 		}
-		if (dev->tuner_type =3D=3D TUNER_NXP_TDA18271)
+		switch (dev->model) { /* i2c device tuners */
+		case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+		case CX231XX_BOARD_HAUPPAUGE_935C:
+		case CX231XX_BOARD_HAUPPAUGE_955Q:
+		case CX231XX_BOARD_HAUPPAUGE_975:
+		case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
 			status =3D cx231xx_set_decoder_video_input(dev,
 							CX231XX_VMUX_TELEVISION,
 							INPUT(input)->vmux);
-		else
-			status =3D cx231xx_set_decoder_video_input(dev,
+			break;
+		default:
+			if (dev->tuner_type =3D=3D TUNER_NXP_TDA18271)
+				status =3D cx231xx_set_decoder_video_input(dev,
+							CX231XX_VMUX_TELEVISION,
+							INPUT(input)->vmux);
+			else
+				status =3D cx231xx_set_decoder_video_input(dev,
 							CX231XX_VMUX_COMPOSITE1,
 							INPUT(input)->vmux);
+			break;
+		};
=20
 		break;
 	default:
@@ -1193,12 +1206,22 @@ int cx231xx_set_audio_decoder_input(struct cx231x=
x *dev,
 					cx231xx_set_field(FLD_SIF_EN, 0));
 			break;
 		default:
+			switch (dev->model) { /* i2c device tuners */
+			case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+			case CX231XX_BOARD_HAUPPAUGE_935C:
+			case CX231XX_BOARD_HAUPPAUGE_955Q:
+			case CX231XX_BOARD_HAUPPAUGE_975:
+			case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
+			/* TODO: Normal mode: SIF passthrough at 14.32 MHz?? */
+				break;
+			default:
 			/* This is just a casual suggestion to people adding
 			   new boards in case they use a tuner type we don't
 			   currently know about */
-			dev_info(dev->dev,
-				 "Unknown tuner type configuring SIF");
-			break;
+				dev_info(dev->dev,
+					 "Unknown tuner type configuring SIF");
+				break;
+			}
 		}
 		break;
=20
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/us=
b/cx231xx/cx231xx-video.c
index 69abafaebbf3..e6b89706a4df 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1129,7 +1129,7 @@ int cx231xx_s_frequency(struct file *file, void *pr=
iv,
 {
 	struct cx231xx *dev =3D video_drvdata(file);
 	struct v4l2_frequency new_freq =3D *f;
-	int rc;
+	int rc, need_if_freq =3D 0;
 	u32 if_frequency =3D 5400000;
=20
 	dev_dbg(dev->dev,
@@ -1142,14 +1142,30 @@ int cx231xx_s_frequency(struct file *file, void *=
priv,
 	/* set pre channel change settings in DIF first */
 	rc =3D cx231xx_tuner_pre_channel_change(dev);
=20
-	call_all(dev, tuner, s_frequency, f);
-	call_all(dev, tuner, g_frequency, &new_freq);
-	dev->ctl_freq =3D new_freq.frequency;
+	switch (dev->model) { /* i2c device tuners */
+	case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+	case CX231XX_BOARD_HAUPPAUGE_935C:
+	case CX231XX_BOARD_HAUPPAUGE_955Q:
+	case CX231XX_BOARD_HAUPPAUGE_975:
+	case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
+		if (dev->cx231xx_set_analog_freq)
+			dev->cx231xx_set_analog_freq(dev, f->frequency);
+		dev->ctl_freq =3D f->frequency;
+		need_if_freq =3D 1;
+		break;
+	default:
+		call_all(dev, tuner, s_frequency, f);
+		call_all(dev, tuner, g_frequency, &new_freq);
+		dev->ctl_freq =3D new_freq.frequency;
+		break;
+	}
+
+	pr_debug("%s() %u  :  %u\n", __func__, f->frequency, dev->ctl_freq);
=20
 	/* set post channel change settings in DIF first */
 	rc =3D cx231xx_tuner_post_channel_change(dev);
=20
-	if (dev->tuner_type =3D=3D TUNER_NXP_TDA18271) {
+	if (need_if_freq || dev->tuner_type =3D=3D TUNER_NXP_TDA18271) {
 		if (dev->norm & (V4L2_STD_MN | V4L2_STD_NTSC_443))
 			if_frequency =3D 5400000;  /*5.4MHz	*/
 		else if (dev->norm & V4L2_STD_B)
@@ -1362,9 +1378,20 @@ int cx231xx_querycap(struct file *file, void *priv=
,
 		V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
 	if (video_is_registered(&dev->radio_dev))
 		cap->capabilities |=3D V4L2_CAP_RADIO;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
-		cap->capabilities |=3D V4L2_CAP_TUNER;
=20
+	switch (dev->model) {
+	case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+	case CX231XX_BOARD_HAUPPAUGE_935C:
+	case CX231XX_BOARD_HAUPPAUGE_955Q:
+	case CX231XX_BOARD_HAUPPAUGE_975:
+	case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
+		cap->capabilities |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			cap->capabilities |=3D V4L2_CAP_TUNER;
+		break;
+	}
 	return 0;
 }
=20
@@ -1708,10 +1735,20 @@ static void cx231xx_vdev_init(struct cx231xx *dev=
,
=20
 	video_set_drvdata(vfd, dev);
 	if (dev->tuner_type =3D=3D TUNER_ABSENT) {
-		v4l2_disable_ioctl(vfd, VIDIOC_G_FREQUENCY);
-		v4l2_disable_ioctl(vfd, VIDIOC_S_FREQUENCY);
-		v4l2_disable_ioctl(vfd, VIDIOC_G_TUNER);
-		v4l2_disable_ioctl(vfd, VIDIOC_S_TUNER);
+		switch (dev->model) {
+		case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+		case CX231XX_BOARD_HAUPPAUGE_935C:
+		case CX231XX_BOARD_HAUPPAUGE_955Q:
+		case CX231XX_BOARD_HAUPPAUGE_975:
+		case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
+			break;
+		default:
+			v4l2_disable_ioctl(vfd, VIDIOC_G_FREQUENCY);
+			v4l2_disable_ioctl(vfd, VIDIOC_S_FREQUENCY);
+			v4l2_disable_ioctl(vfd, VIDIOC_G_TUNER);
+			v4l2_disable_ioctl(vfd, VIDIOC_S_TUNER);
+			break;
+		}
 	}
 }
=20
@@ -1781,8 +1818,20 @@ int cx231xx_register_analog_devices(struct cx231xx=
 *dev)
 	dev->vdev.queue =3D q;
 	dev->vdev.device_caps =3D V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				V4L2_CAP_VIDEO_CAPTURE;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
+
+	switch (dev->model) { /* i2c device tuners */
+	case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+	case CX231XX_BOARD_HAUPPAUGE_935C:
+	case CX231XX_BOARD_HAUPPAUGE_955Q:
+	case CX231XX_BOARD_HAUPPAUGE_975:
+	case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
 		dev->vdev.device_caps |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			dev->vdev.device_caps |=3D V4L2_CAP_TUNER;
+		break;
+	}
=20
 	/* register v4l2 video video_device */
 	ret =3D video_register_device(&dev->vdev, VFL_TYPE_GRABBER,
@@ -1829,8 +1878,18 @@ int cx231xx_register_analog_devices(struct cx231xx=
 *dev)
 	dev->vbi_dev.queue =3D q;
 	dev->vbi_dev.device_caps =3D V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
 				   V4L2_CAP_VBI_CAPTURE;
-	if (dev->tuner_type !=3D TUNER_ABSENT)
+	switch (dev->model) { /* i2c device tuners */
+	case CX231XX_BOARD_HAUPPAUGE_930C_HD_1114xx:
+	case CX231XX_BOARD_HAUPPAUGE_935C:
+	case CX231XX_BOARD_HAUPPAUGE_955Q:
+	case CX231XX_BOARD_HAUPPAUGE_975:
+	case CX231XX_BOARD_EVROMEDIA_FULL_HYBRID_FULLHD:
 		dev->vbi_dev.device_caps |=3D V4L2_CAP_TUNER;
+		break;
+	default:
+		if (dev->tuner_type !=3D TUNER_ABSENT)
+			dev->vbi_dev.device_caps |=3D V4L2_CAP_TUNER;
+	}
=20
 	/* register v4l2 vbi video_device */
 	ret =3D video_register_device(&dev->vbi_dev, VFL_TYPE_VBI,
--=20
2.23.0

