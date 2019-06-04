Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1B234544
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfFDLUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:47401 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbfFDLUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:06 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U2hwRnr; Tue, 04 Jun 2019 13:20:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/7] media/radio: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:52 +0200
Message-Id: <20190604111958.22331-2-hverkuil-cisco@xs4all.nl>
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
all radio drivers in this patch.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/radio/dsbr100.c                 |  3 +--
 drivers/media/radio/radio-cadet.c             |  5 ++---
 drivers/media/radio/radio-isa.c               |  4 +---
 drivers/media/radio/radio-keene.c             |  3 +--
 drivers/media/radio/radio-ma901.c             |  3 +--
 drivers/media/radio/radio-miropcm20.c         |  4 ++--
 drivers/media/radio/radio-mr800.c             |  5 ++---
 drivers/media/radio/radio-raremono.c          |  3 +--
 drivers/media/radio/radio-sf16fmi.c           |  3 +--
 drivers/media/radio/radio-si476x.c            | 21 +++++++------------
 drivers/media/radio/radio-tea5764.c           |  3 +--
 drivers/media/radio/radio-tea5777.c           |  5 ++---
 drivers/media/radio/radio-timb.c              |  3 +--
 drivers/media/radio/radio-wl1273.c            | 12 ++++-------
 drivers/media/radio/si470x/radio-si470x-i2c.c |  7 +++----
 drivers/media/radio/si470x/radio-si470x-usb.c |  6 +++---
 .../radio/si4713/radio-platform-si4713.c      |  4 +---
 drivers/media/radio/si4713/radio-usb-si4713.c |  4 +---
 drivers/media/radio/tea575x.c                 |  7 +++----
 drivers/media/radio/wl128x/fmdrv_v4l2.c       | 10 +++------
 20 files changed, 42 insertions(+), 73 deletions(-)

diff --git a/drivers/media/radio/dsbr100.c b/drivers/media/radio/dsbr100.c
index c9d51a5f2838..76a21b9d9ad6 100644
--- a/drivers/media/radio/dsbr100.c
+++ b/drivers/media/radio/dsbr100.c
@@ -177,8 +177,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "dsbr100", sizeof(v->driver));
 	strscpy(v->card, "D-Link R-100 USB FM Radio", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -387,6 +385,7 @@ static int usb_dsbr100_probe(struct usb_interface *intf,
 	radio->videodev.release = video_device_release_empty;
 	radio->videodev.lock = &radio->v4l2_lock;
 	radio->videodev.ctrl_handler = &radio->hdl;
+	radio->videodev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 
 	radio->usbdev = interface_to_usbdev(intf);
 	radio->curfreq = FREQ_MIN * FREQ_MUL;
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
index 12160894839c..a5db9b4dc3de 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -357,9 +357,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "ADS Cadet", sizeof(v->driver));
 	strscpy(v->card, "ADS Cadet", sizeof(v->card));
 	strscpy(v->bus_info, "ISA:radio-cadet", sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
-			  V4L2_CAP_READWRITE | V4L2_CAP_RDS_CAPTURE;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -646,6 +643,8 @@ static int __init cadet_init(void)
 	dev->vdev.ioctl_ops = &cadet_ioctl_ops;
 	dev->vdev.release = video_device_release_empty;
 	dev->vdev.lock = &dev->lock;
+	dev->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+				V4L2_CAP_READWRITE | V4L2_CAP_RDS_CAPTURE;
 	video_set_drvdata(&dev->vdev, dev);
 
 	res = video_register_device(&dev->vdev, VFL_TYPE_RADIO, radio_nr);
diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
index 551de8a45b95..f9255ada9d87 100644
--- a/drivers/media/radio/radio-isa.c
+++ b/drivers/media/radio/radio-isa.c
@@ -45,9 +45,6 @@ static int radio_isa_querycap(struct file *file, void  *priv,
 	strscpy(v->driver, isa->drv->driver.driver.name, sizeof(v->driver));
 	strscpy(v->card, isa->drv->card, sizeof(v->card));
 	snprintf(v->bus_info, sizeof(v->bus_info), "ISA:%s", isa->v4l2_dev.name);
-
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -248,6 +245,7 @@ static int radio_isa_common_probe(struct radio_isa_card *isa,
 	isa->vdev.fops = &radio_isa_fops;
 	isa->vdev.ioctl_ops = &radio_isa_ioctl_ops;
 	isa->vdev.release = video_device_release_empty;
+	isa->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 	video_set_drvdata(&isa->vdev, isa);
 	isa->freq = FREQ_LOW;
 	isa->stereo = drv->has_stereo;
diff --git a/drivers/media/radio/radio-keene.c b/drivers/media/radio/radio-keene.c
index e9484b013073..40a051fcd761 100644
--- a/drivers/media/radio/radio-keene.c
+++ b/drivers/media/radio/radio-keene.c
@@ -177,8 +177,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "radio-keene", sizeof(v->driver));
 	strscpy(v->card, "Keene FM Transmitter", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_RADIO | V4L2_CAP_MODULATOR;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -370,6 +368,7 @@ static int usb_keene_probe(struct usb_interface *intf,
 	radio->vdev.lock = &radio->lock;
 	radio->vdev.release = video_device_release_empty;
 	radio->vdev.vfl_dir = VFL_DIR_TX;
+	radio->vdev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_MODULATOR;
 
 	radio->usbdev = interface_to_usbdev(intf);
 	radio->intf = intf;
diff --git a/drivers/media/radio/radio-ma901.c b/drivers/media/radio/radio-ma901.c
index 5cb153727841..33aa29748dbb 100644
--- a/drivers/media/radio/radio-ma901.c
+++ b/drivers/media/radio/radio-ma901.c
@@ -200,8 +200,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "radio-ma901", sizeof(v->driver));
 	strscpy(v->card, "Masterkit MA901 USB FM Radio", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -407,6 +405,7 @@ static int usb_ma901radio_probe(struct usb_interface *intf,
 	radio->vdev.ioctl_ops = &usb_ma901radio_ioctl_ops;
 	radio->vdev.release = video_device_release_empty;
 	radio->vdev.lock = &radio->lock;
+	radio->vdev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER;
 
 	radio->usbdev = interface_to_usbdev(intf);
 	radio->intf = intf;
diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
index 95d12cbff5c9..99788834c646 100644
--- a/drivers/media/radio/radio-miropcm20.c
+++ b/drivers/media/radio/radio-miropcm20.c
@@ -204,8 +204,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "Miro PCM20", sizeof(v->driver));
 	strscpy(v->card, "Miro PCM20", sizeof(v->card));
 	snprintf(v->bus_info, sizeof(v->bus_info), "ISA:%s", dev->v4l2_dev.name);
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -481,6 +479,8 @@ static int __init pcm20_init(void)
 	dev->vdev.ioctl_ops = &pcm20_ioctl_ops;
 	dev->vdev.release = video_device_release_empty;
 	dev->vdev.lock = &dev->lock;
+	dev->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+				V4L2_CAP_RDS_CAPTURE;
 	video_set_drvdata(&dev->vdev, dev);
 	snd_aci_cmd(dev->aci, ACI_SET_TUNERMONO,
 			dev->audmode == V4L2_TUNER_MODE_MONO, -1);
diff --git a/drivers/media/radio/radio-mr800.c b/drivers/media/radio/radio-mr800.c
index ab1324f68199..f090a3f56d86 100644
--- a/drivers/media/radio/radio-mr800.c
+++ b/drivers/media/radio/radio-mr800.c
@@ -269,9 +269,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "radio-mr800", sizeof(v->driver));
 	strscpy(v->card, "AverMedia MR 800 USB FM Radio", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER |
-					V4L2_CAP_HW_FREQ_SEEK;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -554,6 +551,8 @@ static int usb_amradio_probe(struct usb_interface *intf,
 	radio->vdev.ioctl_ops = &usb_amradio_ioctl_ops;
 	radio->vdev.release = video_device_release_empty;
 	radio->vdev.lock = &radio->lock;
+	radio->vdev.device_caps = V4L2_CAP_RADIO | V4L2_CAP_TUNER |
+				  V4L2_CAP_HW_FREQ_SEEK;
 
 	radio->usbdev = interface_to_usbdev(intf);
 	radio->intf = intf;
diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
index 5e782b3c2fa9..606f588e1edf 100644
--- a/drivers/media/radio/radio-raremono.c
+++ b/drivers/media/radio/radio-raremono.c
@@ -184,8 +184,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "radio-raremono", sizeof(v->driver));
 	strscpy(v->card, "Thanko's Raremono", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -345,6 +343,7 @@ static int usb_raremono_probe(struct usb_interface *intf,
 	radio->vdev.ioctl_ops = &usb_raremono_ioctl_ops;
 	radio->vdev.lock = &radio->lock;
 	radio->vdev.release = video_device_release_empty;
+	radio->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 
 	usb_set_intfdata(intf, &radio->v4l2_dev);
 
diff --git a/drivers/media/radio/radio-sf16fmi.c b/drivers/media/radio/radio-sf16fmi.c
index 434c03338d7f..54a40d60e4fd 100644
--- a/drivers/media/radio/radio-sf16fmi.c
+++ b/drivers/media/radio/radio-sf16fmi.c
@@ -133,8 +133,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(v->driver, "radio-sf16fmi", sizeof(v->driver));
 	strscpy(v->card, "SF16-FMI/FMP/FMD radio", sizeof(v->card));
 	strscpy(v->bus_info, "ISA:radio-sf16fmi", sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -345,6 +343,7 @@ static int __init fmi_init(void)
 	fmi->vdev.fops = &fmi_fops;
 	fmi->vdev.ioctl_ops = &fmi_ioctl_ops;
 	fmi->vdev.release = video_device_release_empty;
+	fmi->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 	video_set_drvdata(&fmi->vdev, fmi);
 
 	mutex_init(&fmi->lock);
diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 0261f4d28f16..0d5187410853 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -345,19 +345,6 @@ static int si476x_radio_querycap(struct file *file, void *priv,
 	strscpy(capability->card,   DRIVER_CARD, sizeof(capability->card));
 	snprintf(capability->bus_info, sizeof(capability->bus_info),
 		 "platform:%s", radio->v4l2dev.name);
-
-	capability->device_caps = V4L2_CAP_TUNER
-		| V4L2_CAP_RADIO
-		| V4L2_CAP_HW_FREQ_SEEK;
-
-	si476x_core_lock(radio->core);
-	if (!si476x_core_is_a_secondary_tuner(radio->core))
-		capability->device_caps |= V4L2_CAP_RDS_CAPTURE
-			| V4L2_CAP_READWRITE;
-	si476x_core_unlock(radio->core);
-
-	capability->capabilities = capability->device_caps
-		| V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -1468,6 +1455,14 @@ static int si476x_radio_probe(struct platform_device *pdev)
 
 	radio->videodev.v4l2_dev  = &radio->v4l2dev;
 	radio->videodev.ioctl_ops = &si4761_ioctl_ops;
+	radio->videodev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+				      V4L2_CAP_HW_FREQ_SEEK;
+
+	si476x_core_lock(radio->core);
+	if (!si476x_core_is_a_secondary_tuner(radio->core))
+		radio->videodev.device_caps |= V4L2_CAP_RDS_CAPTURE |
+					       V4L2_CAP_READWRITE;
+	si476x_core_unlock(radio->core);
 
 	video_set_drvdata(&radio->videodev, radio);
 	platform_set_drvdata(pdev, radio);
diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radio-tea5764.c
index 6632be648cea..fc8afbc0fb22 100644
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -291,8 +291,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(v->card, dev->name, sizeof(v->card));
 	snprintf(v->bus_info, sizeof(v->bus_info),
 		 "I2C:%s", dev_name(&dev->dev));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -474,6 +472,7 @@ static int tea5764_i2c_probe(struct i2c_client *client,
 	video_set_drvdata(&radio->vdev, radio);
 	radio->vdev.lock = &radio->mutex;
 	radio->vdev.v4l2_dev = v4l2_dev;
+	radio->vdev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 
 	/* initialize and power off the chip */
 	tea5764_i2c_read(radio);
diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
index 61f751cf1aa4..17f9e21ff3c5 100644
--- a/drivers/media/radio/radio-tea5777.c
+++ b/drivers/media/radio/radio-tea5777.c
@@ -270,9 +270,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(v->card, tea->card, sizeof(v->card));
 	strlcat(v->card, " TEA5777", sizeof(v->card));
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->device_caps |= V4L2_CAP_HW_FREQ_SEEK;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -563,6 +560,8 @@ int radio_tea5777_init(struct radio_tea5777 *tea, struct module *owner)
 	strscpy(tea->vd.name, tea->v4l2_dev->name, sizeof(tea->vd.name));
 	tea->vd.lock = &tea->mutex;
 	tea->vd.v4l2_dev = tea->v4l2_dev;
+	tea->vd.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+			      V4L2_CAP_HW_FREQ_SEEK;
 	tea->fops = tea575x_fops;
 	tea->fops.owner = owner;
 	tea->vd.fops = &tea->fops;
diff --git a/drivers/media/radio/radio-timb.c b/drivers/media/radio/radio-timb.c
index 0eda863124e9..d92352005d3d 100644
--- a/drivers/media/radio/radio-timb.c
+++ b/drivers/media/radio/radio-timb.c
@@ -42,8 +42,6 @@ static int timbradio_vidioc_querycap(struct file *file, void  *priv,
 	strscpy(v->driver, DRIVER_NAME, sizeof(v->driver));
 	strscpy(v->card, "Timberdale Radio", sizeof(v->card));
 	snprintf(v->bus_info, sizeof(v->bus_info), "platform:"DRIVER_NAME);
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -122,6 +120,7 @@ static int timbradio_probe(struct platform_device *pdev)
 	tr->video_dev.release = video_device_release_empty;
 	tr->video_dev.minor = -1;
 	tr->video_dev.lock = &tr->lock;
+	tr->video_dev.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
 
 	strscpy(tr->v4l2_dev.name, DRIVER_NAME, sizeof(tr->v4l2_dev.name));
 	err = v4l2_device_register(NULL, &tr->v4l2_dev);
diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/radio-wl1273.c
index b95704f3cb8b..a1a36ce396ee 100644
--- a/drivers/media/radio/radio-wl1273.c
+++ b/drivers/media/radio/radio-wl1273.c
@@ -1292,14 +1292,6 @@ static int wl1273_fm_vidioc_querycap(struct file *file, void *priv,
 		sizeof(capability->card));
 	strscpy(capability->bus_info, radio->bus_type,
 		sizeof(capability->bus_info));
-
-	capability->device_caps = V4L2_CAP_HW_FREQ_SEEK |
-		V4L2_CAP_TUNER | V4L2_CAP_RADIO | V4L2_CAP_AUDIO |
-		V4L2_CAP_RDS_CAPTURE | V4L2_CAP_MODULATOR |
-		V4L2_CAP_RDS_OUTPUT;
-	capability->capabilities = capability->device_caps |
-		V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -1988,6 +1980,10 @@ static const struct video_device wl1273_viddev_template = {
 	.name			= WL1273_FM_DRIVER_NAME,
 	.release		= wl1273_vdev_release,
 	.vfl_dir		= VFL_DIR_TX,
+	.device_caps		= V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER |
+				  V4L2_CAP_RADIO | V4L2_CAP_AUDIO |
+				  V4L2_CAP_RDS_CAPTURE | V4L2_CAP_MODULATOR |
+				  V4L2_CAP_RDS_OUTPUT,
 };
 
 static int wl1273_fm_radio_remove(struct platform_device *pdev)
diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
index 15eea2b2c90f..6b42a189b271 100644
--- a/drivers/media/radio/si470x/radio-si470x-i2c.c
+++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
@@ -232,10 +232,6 @@ static int si470x_vidioc_querycap(struct file *file, void *priv,
 {
 	strscpy(capability->driver, DRIVER_NAME, sizeof(capability->driver));
 	strscpy(capability->card, DRIVER_CARD, sizeof(capability->card));
-	capability->device_caps = V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_READWRITE |
-		V4L2_CAP_TUNER | V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE;
-	capability->capabilities = capability->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -391,6 +387,9 @@ static int si470x_i2c_probe(struct i2c_client *client,
 	radio->videodev.lock = &radio->lock;
 	radio->videodev.v4l2_dev = &radio->v4l2_dev;
 	radio->videodev.release = video_device_release_empty;
+	radio->videodev.device_caps =
+		V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_READWRITE | V4L2_CAP_TUNER |
+		V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE;
 	video_set_drvdata(&radio->videodev, radio);
 
 	radio->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index 91d6ef5579f7..398e4149f219 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -523,9 +523,6 @@ static int si470x_vidioc_querycap(struct file *file, void *priv,
 	strscpy(capability->card, DRIVER_CARD, sizeof(capability->card));
 	usb_make_path(radio->usbdev, capability->bus_info,
 			sizeof(capability->bus_info));
-	capability->device_caps = V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_READWRITE |
-		V4L2_CAP_TUNER | V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE;
-	capability->capabilities = capability->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -679,6 +676,9 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	radio->videodev.lock = &radio->lock;
 	radio->videodev.v4l2_dev = &radio->v4l2_dev;
 	radio->videodev.release = video_device_release_empty;
+	radio->videodev.device_caps =
+		V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_READWRITE | V4L2_CAP_TUNER |
+		V4L2_CAP_RADIO | V4L2_CAP_RDS_CAPTURE;
 	video_set_drvdata(&radio->videodev, radio);
 
 	/* get device and chip versions */
diff --git a/drivers/media/radio/si4713/radio-platform-si4713.c b/drivers/media/radio/si4713/radio-platform-si4713.c
index 733fcf3933e4..9a012a2012c8 100644
--- a/drivers/media/radio/si4713/radio-platform-si4713.c
+++ b/drivers/media/radio/si4713/radio-platform-si4713.c
@@ -72,9 +72,6 @@ static int radio_si4713_querycap(struct file *file, void *priv,
 		sizeof(capability->card));
 	strscpy(capability->bus_info, "platform:radio-si4713",
 		sizeof(capability->bus_info));
-	capability->device_caps = V4L2_CAP_MODULATOR | V4L2_CAP_RDS_OUTPUT;
-	capability->capabilities = capability->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -184,6 +181,7 @@ static int radio_si4713_pdriver_probe(struct platform_device *pdev)
 	rsdev->radio_dev.ctrl_handler = sd->ctrl_handler;
 	/* Serialize all access to the si4713 */
 	rsdev->radio_dev.lock = &rsdev->lock;
+	rsdev->radio_dev.device_caps = V4L2_CAP_MODULATOR | V4L2_CAP_RDS_OUTPUT;
 	video_set_drvdata(&rsdev->radio_dev, rsdev);
 	if (video_register_device(&rsdev->radio_dev, VFL_TYPE_RADIO, radio_nr)) {
 		dev_err(&pdev->dev, "Could not register video device.\n");
diff --git a/drivers/media/radio/si4713/radio-usb-si4713.c b/drivers/media/radio/si4713/radio-usb-si4713.c
index 23065ecce979..33274189c83c 100644
--- a/drivers/media/radio/si4713/radio-usb-si4713.c
+++ b/drivers/media/radio/si4713/radio-usb-si4713.c
@@ -70,9 +70,6 @@ static int vidioc_querycap(struct file *file, void *priv,
 	strscpy(v->driver, "radio-usb-si4713", sizeof(v->driver));
 	strscpy(v->card, "Si4713 FM Transmitter", sizeof(v->card));
 	usb_make_path(radio->usbdev, v->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_MODULATOR | V4L2_CAP_RDS_OUTPUT;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -475,6 +472,7 @@ static int usb_si4713_probe(struct usb_interface *intf,
 	radio->vdev.lock = &radio->lock;
 	radio->vdev.release = video_device_release_empty;
 	radio->vdev.vfl_dir = VFL_DIR_TX;
+	radio->vdev.device_caps = V4L2_CAP_MODULATOR | V4L2_CAP_RDS_OUTPUT;
 
 	video_set_drvdata(&radio->vdev, radio);
 
diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
index f89f83e04741..1cfae4646e45 100644
--- a/drivers/media/radio/tea575x.c
+++ b/drivers/media/radio/tea575x.c
@@ -237,10 +237,6 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	strscpy(v->card, tea->card, sizeof(v->card));
 	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
-	v->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
-	if (!tea->cannot_read_data)
-		v->device_caps |= V4L2_CAP_HW_FREQ_SEEK;
-	v->capabilities = v->device_caps | V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -540,6 +536,9 @@ int snd_tea575x_init(struct snd_tea575x *tea, struct module *owner)
 	strscpy(tea->vd.name, tea->v4l2_dev->name, sizeof(tea->vd.name));
 	tea->vd.lock = &tea->mutex;
 	tea->vd.v4l2_dev = tea->v4l2_dev;
+	tea->vd.device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO;
+	if (!tea->cannot_read_data)
+		tea->vd.device_caps |= V4L2_CAP_HW_FREQ_SEEK;
 	tea->fops = tea575x_fops;
 	tea->fops.owner = owner;
 	tea->vd.fops = &tea->fops;
diff --git a/drivers/media/radio/wl128x/fmdrv_v4l2.c b/drivers/media/radio/wl128x/fmdrv_v4l2.c
index a1eaea19a81c..6ed48e498989 100644
--- a/drivers/media/radio/wl128x/fmdrv_v4l2.c
+++ b/drivers/media/radio/wl128x/fmdrv_v4l2.c
@@ -194,13 +194,6 @@ static int fm_v4l2_vidioc_querycap(struct file *file, void *priv,
 	strscpy(capability->card, FM_DRV_CARD_SHORT_NAME,
 		sizeof(capability->card));
 	sprintf(capability->bus_info, "UART");
-	capability->device_caps = V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER |
-		V4L2_CAP_RADIO | V4L2_CAP_MODULATOR |
-		V4L2_CAP_AUDIO | V4L2_CAP_READWRITE |
-		V4L2_CAP_RDS_CAPTURE;
-	capability->capabilities = capability->device_caps |
-		V4L2_CAP_DEVICE_CAPS;
-
 	return 0;
 }
 
@@ -524,6 +517,9 @@ static const struct video_device fm_viddev_template = {
 	 * but that would affect applications using this driver.
 	 */
 	.vfl_dir = VFL_DIR_M2M,
+	.device_caps = V4L2_CAP_HW_FREQ_SEEK | V4L2_CAP_TUNER | V4L2_CAP_RADIO |
+		       V4L2_CAP_MODULATOR | V4L2_CAP_AUDIO |
+		       V4L2_CAP_READWRITE | V4L2_CAP_RDS_CAPTURE,
 };
 
 int fm_v4l2_init_video_device(struct fmdev *fmdev, int radio_nr)
-- 
2.20.1

