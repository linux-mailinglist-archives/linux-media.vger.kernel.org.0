Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A863376AC3
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 21:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhEGThF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 15:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbhEGThF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 15:37:05 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015A9C061574;
        Fri,  7 May 2021 12:36:04 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id x8so9677092qkl.2;
        Fri, 07 May 2021 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flu2XxLdLDqUhp2N4Y9xSPBEmSo/xZkMSbMfDPIx4L0=;
        b=TpvG9hMUZ0+D0uXPM0ScE9wDQ0Mdz4jJ++PoJ1e63EYEzz/fk/Py39dO3E9ELfqi1L
         nj5S5D19H1YOFZeftM3S/0REKFOPk33tIb1+C7eYezWAv4By1bekbaxeR89B4g4AO3M8
         ur08q6FKgE4iPCJYEhYuH9PuLr2euRBLZh9mUafSzB8K9nvGZdFT/AtScJwjA93YIvf0
         AN73KqACSRnTujGXNpyWUXIqcqx5UA/DCuntlZjtd7KLUvLotqQWzIVSMApYBx2V4rsx
         R8sNViNbpkc3NwRJCcSEyBdEI4j0czPsFrtmXIz0dprww6Q5EkoopSYVdJgokmzPG2LA
         3mcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flu2XxLdLDqUhp2N4Y9xSPBEmSo/xZkMSbMfDPIx4L0=;
        b=kgLPIb8CD1w9Bps849J1SOELaFbhc4pumAdqgA3fDszqIrWbAyEgNGAW1V3HTR6NGf
         p1IWZZNcreADFSq6E9HFgSnzrzzlR45PRocdrlPdEokI9+xMcMae1lGL5Rk+7aia/yf3
         YsSEIE4C2bCpr0L6x6AK7ZXS4louwkdVz7Bsy/Bj3hGoL4NAYRS8/dEb9Em0ji7wB5gG
         h/jvmsqll52DMXDkl0YcuaUoPXNXuLGONIsUmZhMTBUbLq0DIFOzkce4V9ikTLRYnCAz
         /80TtPNj12q4aSiXAfQ7hGgif+Y20iy50Q0gMXopKRVURwgVb3sDmEo0LbiHD8Ft5gNd
         1hNQ==
X-Gm-Message-State: AOAM532EZvm1utV1g6xBrQ+hPzlZ0m6drlrZN0asJDy/c7eSKuzvChqi
        L8A/ulsKRvnUS3OLifMjYPU=
X-Google-Smtp-Source: ABdhPJyj7Hg4ITiZ91yjSzrEQVuPUL7YIrXLVxeOAqPnSTI/affWkzxHDyNXJto3ILmnPoS9oiN9jg==
X-Received: by 2002:a37:b945:: with SMTP id j66mr11071316qkf.270.1620416163147;
        Fri, 07 May 2021 12:36:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:811b::1003])
        by smtp.googlemail.com with ESMTPSA id u190sm5745815qkc.18.2021.05.07.12.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 12:36:02 -0700 (PDT)
From:   Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To:     mchehab@kernel.org, skhan@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
Subject: [PATCH v5] media: em28xx: Fix race condition between open and init function
Date:   Fri,  7 May 2021 16:34:57 -0300
Message-Id: <20210507193457.14819-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes a race condition - for lack of a more precise term - between
em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev
struct from the em28xx_v4l2, and managing the em28xx_v4l2 and v4l2_dev
life-time with the v4l2_dev->release() callback.

The race happens when a thread[1] - containing the em28xx_v4l2_init()
code - calls the v4l2_mc_create_media_graph(), and it return a error,
if a thread[2] - running v4l2_open() - pass the verification point
and reaches the em28xx_v4l2_open() before the thread[1] finishes
the deregistration of v4l2 subsystem, the thread[1] will free all
resources before the em28xx_v4l2_open() can process their things,
because the em28xx_v4l2_init() has the dev->lock. And all this lead
the thread[2] to cause a user-after-free.

Reported-by: kernel test robot <lkp@intel.com>
Reported-and-tested-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---

V2: Add v4l2_i2c_new_subdev null check
    Deal with v4l2 subdevs dependencies

V3: Fix link error when compiled as a module

V4: Remove duplicated v4l2_device_disconnect
    in the em28xx_v4l2_fini

V5: Move all the v4l2 resources management
    to the v4l2_dev->release() callback.

---
 drivers/media/usb/em28xx/em28xx-camera.c |   4 +-
 drivers/media/usb/em28xx/em28xx-cards.c  |   3 +-
 drivers/media/usb/em28xx/em28xx-video.c  | 310 +++++++++++++----------
 drivers/media/usb/em28xx/em28xx.h        |   3 +-
 4 files changed, 181 insertions(+), 139 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-camera.c b/drivers/media/usb/em28xx/em28xx-camera.c
index d1e66b503f4d..436c5a8cbbb6 100644
--- a/drivers/media/usb/em28xx/em28xx-camera.c
+++ b/drivers/media/usb/em28xx/em28xx-camera.c
@@ -340,7 +340,7 @@ int em28xx_init_camera(struct em28xx *dev)
 		v4l2->sensor_xtal = 4300000;
 		pdata.xtal = v4l2->sensor_xtal;
 		if (NULL ==
-		    v4l2_i2c_new_subdev_board(&v4l2->v4l2_dev, adap,
+		    v4l2_i2c_new_subdev_board(v4l2->v4l2_dev, adap,
 					      &mt9v011_info, NULL))
 			return -ENODEV;
 		v4l2->vinmode = EM28XX_VINMODE_RGB8_GRBG;
@@ -394,7 +394,7 @@ int em28xx_init_camera(struct em28xx *dev)
 		v4l2->sensor_yres = 480;
 
 		subdev =
-		     v4l2_i2c_new_subdev_board(&v4l2->v4l2_dev, adap,
+		     v4l2_i2c_new_subdev_board(v4l2->v4l2_dev, adap,
 					       &ov2640_info, NULL);
 		if (!subdev)
 			return -ENODEV;
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index ba9292e2a587..6e67cf0a1e04 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4120,7 +4120,6 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 	struct em28xx *dev;
 
 	dev = usb_get_intfdata(intf);
-	usb_set_intfdata(intf, NULL);
 
 	if (!dev)
 		return;
@@ -4148,6 +4147,8 @@ static void em28xx_usb_disconnect(struct usb_interface *intf)
 		dev->dev_next = NULL;
 	}
 	kref_put(&dev->ref, em28xx_free_device);
+
+	usb_set_intfdata(intf, NULL);
 }
 
 static int em28xx_usb_suspend(struct usb_interface *intf,
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 6b84c3413e83..519bbd458b06 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -184,7 +184,7 @@ static int em28xx_vbi_supported(struct em28xx *dev)
  */
 static void em28xx_wake_i2c(struct em28xx *dev)
 {
-	struct v4l2_device *v4l2_dev = &dev->v4l2->v4l2_dev;
+	struct v4l2_device *v4l2_dev = dev->v4l2->v4l2_dev;
 
 	v4l2_device_call_all(v4l2_dev, 0, core,  reset, 0);
 	v4l2_device_call_all(v4l2_dev, 0, video, s_routing,
@@ -1132,11 +1132,11 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 			f.type = V4L2_TUNER_RADIO;
 		else
 			f.type = V4L2_TUNER_ANALOG_TV;
-		v4l2_device_call_all(&v4l2->v4l2_dev,
+		v4l2_device_call_all(v4l2->v4l2_dev,
 				     0, tuner, s_frequency, &f);
 
 		/* Enable video stream at TV decoder */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_stream, 1);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_stream, 1);
 	}
 
 	v4l2->streaming_users++;
@@ -1157,7 +1157,7 @@ static void em28xx_stop_streaming(struct vb2_queue *vq)
 
 	if (v4l2->streaming_users-- == 1) {
 		/* Disable video stream at TV decoder */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_stream, 0);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_stream, 0);
 
 		/* Last active user, so shutdown all the URBS */
 		em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -1192,7 +1192,7 @@ void em28xx_stop_vbi_streaming(struct vb2_queue *vq)
 
 	if (v4l2->streaming_users-- == 1) {
 		/* Disable video stream at TV decoder */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_stream, 0);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_stream, 0);
 
 		/* Last active user, so shutdown all the URBS */
 		em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -1286,7 +1286,7 @@ static int em28xx_vb2_setup(struct em28xx *dev)
 
 static void video_mux(struct em28xx *dev, int index)
 {
-	struct v4l2_device *v4l2_dev = &dev->v4l2->v4l2_dev;
+	struct v4l2_device *v4l2_dev = dev->v4l2->v4l2_dev;
 
 	dev->ctl_input = index;
 	dev->ctl_ainput = INPUT(index)->amux;
@@ -1565,7 +1565,7 @@ static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *norm)
 {
 	struct em28xx *dev = video_drvdata(file);
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, video, querystd, norm);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, video, querystd, norm);
 
 	return 0;
 }
@@ -1596,7 +1596,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 		      &v4l2->hscale, &v4l2->vscale);
 
 	em28xx_resolution_set(dev);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 
 	return 0;
 }
@@ -1616,7 +1616,7 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
 	if (dev->is_webcam) {
-		rc = v4l2_device_call_until_err(&v4l2->v4l2_dev, 0,
+		rc = v4l2_device_call_until_err(v4l2->v4l2_dev, 0,
 						video, g_frame_interval, &ival);
 		if (!rc)
 			p->parm.capture.timeperframe = ival.interval;
@@ -1648,7 +1648,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	memset(&p->parm, 0, sizeof(p->parm));
 	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	rc = v4l2_device_call_until_err(&dev->v4l2->v4l2_dev, 0,
+	rc = v4l2_device_call_until_err(dev->v4l2->v4l2_dev, 0,
 					video, s_frame_interval, &ival);
 	if (!rc)
 		p->parm.capture.timeperframe = ival.interval;
@@ -1839,7 +1839,7 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 
 	strscpy(t->name, "Tuner", sizeof(t->name));
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
 	return 0;
 }
 
@@ -1851,7 +1851,7 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	if (t->index != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
 	return 0;
 }
 
@@ -1878,8 +1878,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	if (f->tuner != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_frequency, f);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_frequency, f);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
 	v4l2->frequency = new_freq.frequency;
 
 	return 0;
@@ -1897,7 +1897,7 @@ static int vidioc_g_chip_info(struct file *file, void *priv,
 		strscpy(chip->name, "ac97", sizeof(chip->name));
 	else
 		strscpy(chip->name,
-			dev->v4l2->v4l2_dev.name, sizeof(chip->name));
+			dev->v4l2->v4l2_dev->name, sizeof(chip->name));
 	return 0;
 }
 
@@ -2095,7 +2095,7 @@ static int radio_g_tuner(struct file *file, void *priv,
 
 	strscpy(t->name, "Radio", sizeof(t->name));
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
 
 	return 0;
 }
@@ -2108,26 +2108,11 @@ static int radio_s_tuner(struct file *file, void *priv,
 	if (t->index != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
 
 	return 0;
 }
 
-/*
- * em28xx_free_v4l2() - Free struct em28xx_v4l2
- *
- * @ref: struct kref for struct em28xx_v4l2
- *
- * Called when all users of struct em28xx_v4l2 are gone
- */
-static void em28xx_free_v4l2(struct kref *ref)
-{
-	struct em28xx_v4l2 *v4l2 = container_of(ref, struct em28xx_v4l2, ref);
-
-	v4l2->dev->v4l2 = NULL;
-	kfree(v4l2);
-}
-
 /*
  * em28xx_v4l2_open()
  * inits the device and starts isoc transfer
@@ -2160,6 +2145,11 @@ static int em28xx_v4l2_open(struct file *filp)
 	if (mutex_lock_interruptible(&dev->lock))
 		return -ERESTARTSYS;
 
+	if (!dev->v4l2) {
+		mutex_unlock(&dev->lock);
+		return -ENODEV;
+	}
+
 	ret = v4l2_fh_open(filp);
 	if (ret) {
 		dev_err(&dev->intf->dev,
@@ -2184,11 +2174,10 @@ static int em28xx_v4l2_open(struct file *filp)
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO) {
 		em28xx_videodbg("video_open: setting radio device\n");
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_radio);
 	}
 
-	kref_get(&dev->ref);
-	kref_get(&v4l2->ref);
+	v4l2_device_get(v4l2->v4l2_dev);
 	v4l2->users++;
 
 	mutex_unlock(&dev->lock);
@@ -2221,34 +2210,8 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
-
-	v4l2_device_disconnect(&v4l2->v4l2_dev);
-
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
-
-	em28xx_v4l2_media_release(dev);
-
-	if (video_is_registered(&v4l2->radio_dev)) {
-		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->radio_dev));
-		video_unregister_device(&v4l2->radio_dev);
-	}
-	if (video_is_registered(&v4l2->vbi_dev)) {
-		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vbi_dev));
-		video_unregister_device(&v4l2->vbi_dev);
-	}
-	if (video_is_registered(&v4l2->vdev)) {
-		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
-	}
-
-	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
-
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
-
+	v4l2_device_put(v4l2->v4l2_dev);
 	mutex_unlock(&dev->lock);
 
 	kref_put(&dev->ref, em28xx_free_device);
@@ -2305,7 +2268,7 @@ static int em28xx_v4l2_close(struct file *filp)
 			goto exit;
 
 		/* Save some power by putting tuner to sleep */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);
 
 		/* do this before setting alternate! */
 		em28xx_set_mode(dev, EM28XX_SUSPEND);
@@ -2322,10 +2285,9 @@ static int em28xx_v4l2_close(struct file *filp)
 	}
 
 exit:
+	v4l2_device_put(v4l2->v4l2_dev);
 	v4l2->users--;
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
 	mutex_unlock(&dev->lock);
-	kref_put(&dev->ref, em28xx_free_device);
 
 	return 0;
 }
@@ -2445,7 +2407,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
 			     const char *type_name)
 {
 	*vfd		= *template;
-	vfd->v4l2_dev	= &dev->v4l2->v4l2_dev;
+	vfd->v4l2_dev	= dev->v4l2->v4l2_dev;
 	vfd->lock	= &dev->lock;
 	if (dev->is_webcam)
 		vfd->tvnorms = 0;
@@ -2459,7 +2421,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
 static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
 {
 	struct em28xx_v4l2      *v4l2 = dev->v4l2;
-	struct v4l2_device      *v4l2_dev = &v4l2->v4l2_dev;
+	struct v4l2_device      *v4l2_dev = v4l2->v4l2_dev;
 	struct tuner_setup      tun_setup;
 	struct v4l2_frequency   f;
 
@@ -2517,6 +2479,40 @@ static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
 	v4l2_device_call_all(v4l2_dev, 0, tuner, s_frequency, &f);
 }
 
+static void em28xx_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct em28xx *dev = v4l2_dev->dev->driver_data;
+	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+
+	v4l2_device_unregister(v4l2->v4l2_dev);
+	em28xx_v4l2_media_release(dev);
+
+	if (video_is_registered(&v4l2->radio_dev)) {
+		dev_info(&dev->intf->dev,
+			 "V4L2 device %s deregistered\n",
+			 video_device_node_name(&v4l2->radio_dev));
+		vb2_video_unregister_device(&v4l2->radio_dev);
+	}
+	if (video_is_registered(&v4l2->vbi_dev)) {
+		dev_info(&dev->intf->dev,
+			 "V4L2 device %s deregistered\n",
+			 video_device_node_name(&v4l2->vbi_dev));
+		vb2_video_unregister_device(&v4l2->vbi_dev);
+	}
+	if (video_is_registered(&v4l2->vdev)) {
+		dev_info(&dev->intf->dev,
+			 "V4L2 device %s deregistered\n",
+			 video_device_node_name(&v4l2->vdev));
+		vb2_video_unregister_device(&v4l2->vdev);
+	}
+
+	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
+
+	kfree(v4l2_dev);
+	kfree(v4l2);
+	dev->v4l2 = NULL;
+}
+
 static int em28xx_v4l2_init(struct em28xx *dev)
 {
 	u8 val;
@@ -2524,6 +2520,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	unsigned int maxw;
 	struct v4l2_ctrl_handler *hdl;
 	struct em28xx_v4l2 *v4l2;
+	struct v4l2_subdev *sd;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2541,26 +2538,37 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	v4l2 = kzalloc(sizeof(*v4l2), GFP_KERNEL);
 	if (!v4l2) {
-		mutex_unlock(&dev->lock);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err;
 	}
-	kref_init(&v4l2->ref);
+
 	v4l2->dev = dev;
 	dev->v4l2 = v4l2;
 
+	v4l2->v4l2_dev = kzalloc(sizeof(*v4l2->v4l2_dev), GFP_KERNEL);
+	if (!v4l2->v4l2_dev) {
+		ret = -ENOMEM;
+		kfree(v4l2);
+		goto err;
+	}
+
+	v4l2->v4l2_dev->release = em28xx_v4l2_dev_release;
+
 #ifdef CONFIG_MEDIA_CONTROLLER
-	v4l2->v4l2_dev.mdev = dev->media_dev;
+	v4l2->v4l2_dev->mdev = dev->media_dev;
 #endif
-	ret = v4l2_device_register(&dev->intf->dev, &v4l2->v4l2_dev);
+	ret = v4l2_device_register(&dev->intf->dev, v4l2->v4l2_dev);
 	if (ret < 0) {
 		dev_err(&dev->intf->dev,
 			"Call to v4l2_device_register() failed!\n");
+		kfree(v4l2->v4l2_dev);
+		kfree(v4l2);
 		goto err;
 	}
 
 	hdl = &v4l2->ctrl_handler;
 	v4l2_ctrl_handler_init(hdl, 8);
-	v4l2->v4l2_dev.ctrl_handler = hdl;
+	v4l2->v4l2_dev->ctrl_handler = hdl;
 
 	if (dev->is_webcam)
 		v4l2->progressive = true;
@@ -2574,25 +2582,53 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	/* request some modules */
 
-	if (dev->has_msp34xx)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-				    &dev->i2c_adap[dev->def_i2c_bus],
-				    "msp3400", 0, msp3400_addrs);
+	if (dev->has_msp34xx) {
+		sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+					 &dev->i2c_adap[dev->def_i2c_bus],
+					 "msp3400", 0, msp3400_addrs);
+		if (!sd) {
+			dev_err(&dev->intf->dev,
+				"Error while registering 'msp34xx' v4l2 subdevice!\n");
+			ret = -EINVAL;
+			goto unregister_dev;
+		}
+	}
 
-	if (dev->board.decoder == EM28XX_SAA711X)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-				    &dev->i2c_adap[dev->def_i2c_bus],
-				    "saa7115_auto", 0, saa711x_addrs);
+	if (dev->board.decoder == EM28XX_SAA711X) {
+		sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+					 &dev->i2c_adap[dev->def_i2c_bus],
+					 "saa7115_auto", 0, saa711x_addrs);
+		if (!sd) {
+			dev_err(&dev->intf->dev,
+				"Error while registering 'EM28XX_SAA711X' v4l2 subdevice!\n");
+			ret = -EINVAL;
+			goto unregister_dev;
+		}
+	}
 
-	if (dev->board.decoder == EM28XX_TVP5150)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-				    &dev->i2c_adap[dev->def_i2c_bus],
-				    "tvp5150", 0, tvp5150_addrs);
+	if (dev->board.decoder == EM28XX_TVP5150) {
+		sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+					 &dev->i2c_adap[dev->def_i2c_bus],
+					 "tvp5150", 0, tvp5150_addrs);
+		if (!sd) {
+			dev_err(&dev->intf->dev,
+				"Error while registering 'EM28XX_TVP5150' v4l2 subdevice!\n");
+			ret = -EINVAL;
+			goto unregister_dev;
+		}
+	}
 
-	if (dev->board.adecoder == EM28XX_TVAUDIO)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-				    &dev->i2c_adap[dev->def_i2c_bus],
-				    "tvaudio", dev->board.tvaudio_addr, NULL);
+	if (dev->board.adecoder == EM28XX_TVAUDIO) {
+		sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+					 &dev->i2c_adap[dev->def_i2c_bus],
+					 "tvaudio", dev->board.tvaudio_addr, NULL);
+		if (!sd) {
+			dev_err(&dev->intf->dev,
+				"Error while registering 'EM28XX_TVAUDIO' v4l2 subdevice!\n");
+			ret = -EINVAL;
+			goto unregister_dev;
+		}
+	}
 
 	/* Initialize tuner and camera */
 
@@ -2600,33 +2636,63 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		unsigned short tuner_addr = dev->board.tuner_addr;
 		int has_demod = (dev->board.tda9887_conf & TDA9887_PRESENT);
 
-		if (dev->board.radio.type)
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-					    &dev->i2c_adap[dev->def_i2c_bus],
-					    "tuner", dev->board.radio_addr,
-					    NULL);
-
-		if (has_demod)
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-					    &dev->i2c_adap[dev->def_i2c_bus],
-					    "tuner", 0,
-					    v4l2_i2c_tuner_addrs(ADDRS_DEMOD));
+		if (dev->board.radio.type) {
+			sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 "tuner", dev->board.radio_addr,
+						 NULL);
+			if (!sd) {
+				dev_err(&dev->intf->dev,
+					"Error while registering '%s' v4l2 subdevice!\n",
+					 dev->board.name);
+				ret = -EINVAL;
+				goto unregister_dev;
+			}
+		}
+
+		if (has_demod) {
+			sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 "tuner", 0,
+						 v4l2_i2c_tuner_addrs(ADDRS_DEMOD));
+			if (!sd) {
+				dev_err(&dev->intf->dev,
+					"Error while registering '%s' v4l2 subdevice!\n",
+					 dev->i2c_adap[dev->def_i2c_bus].name);
+				ret = -EINVAL;
+				goto unregister_dev;
+			}
+		}
+
 		if (tuner_addr == 0) {
 			enum v4l2_i2c_tuner_type type =
 				has_demod ? ADDRS_TV_WITH_DEMOD : ADDRS_TV;
-			struct v4l2_subdev *sd;
 
-			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+			sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
 						 &dev->i2c_adap[dev->def_i2c_bus],
 						 "tuner", 0,
 						 v4l2_i2c_tuner_addrs(type));
-
-			if (sd)
+			if (sd) {
 				tuner_addr = v4l2_i2c_subdev_addr(sd);
+			} else {
+				dev_err(&dev->intf->dev,
+					"Error while registering '%s' v4l2 subdevice!\n",
+					 dev->i2c_adap[dev->def_i2c_bus].name);
+				ret = -EINVAL;
+				goto unregister_dev;
+			}
+
 		} else {
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
-					    &dev->i2c_adap[dev->def_i2c_bus],
-					    "tuner", tuner_addr, NULL);
+			sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
+						 &dev->i2c_adap[dev->def_i2c_bus],
+						 "tuner", tuner_addr, NULL);
+			if (!sd) {
+				dev_err(&dev->intf->dev,
+					"Error while registering '%s' v4l2 subdevice!\n",
+					 dev->i2c_adap[dev->def_i2c_bus].name);
+				ret = -EINVAL;
+				goto unregister_dev;
+			}
 		}
 
 		em28xx_tuner_setup(dev, tuner_addr);
@@ -2686,7 +2752,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	/* set default norm */
 	v4l2->norm = V4L2_STD_PAL;
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 	v4l2->interlaced_fieldmode = EM28XX_INTERLACED_DEFAULT;
 
 	/* Analog specific initialization */
@@ -2755,7 +2821,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (ret)
 		goto unregister_dev;
 
-	/* allocate and fill video video_device struct */
 	em28xx_vdev_init(dev, &v4l2->vdev, &em28xx_video_template, "video");
 	mutex_init(&v4l2->vb_queue_lock);
 	mutex_init(&v4l2->vb_vbi_queue_lock);
@@ -2768,7 +2833,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (dev->tuner_type != TUNER_ABSENT)
 		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
 
-
 	/* disable inapplicable ioctls */
 	if (dev->is_webcam) {
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
@@ -2871,7 +2935,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 
 	/* Save some power by putting tuner to sleep */
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);
 
 	/* initialize videobuf2 stuff */
 	em28xx_vb2_setup(dev);
@@ -2885,30 +2949,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	return 0;
 
 unregister_dev:
-	if (video_is_registered(&v4l2->radio_dev)) {
-		dev_info(&dev->intf->dev,
-			 "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->radio_dev));
-		video_unregister_device(&v4l2->radio_dev);
-	}
-	if (video_is_registered(&v4l2->vbi_dev)) {
-		dev_info(&dev->intf->dev,
-			 "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vbi_dev));
-		video_unregister_device(&v4l2->vbi_dev);
-	}
-	if (video_is_registered(&v4l2->vdev)) {
-		dev_info(&dev->intf->dev,
-			 "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
-	}
-
-	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
+	v4l2_device_put(v4l2->v4l2_dev);
 err:
-	dev->v4l2 = NULL;
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
 	mutex_unlock(&dev->lock);
 	return ret;
 }
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index ab167cd1f400..e300a9f7936a 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -549,10 +549,9 @@ struct em28xx_eeprom {
 #define EM28XX_RESOURCE_VBI   0x02
 
 struct em28xx_v4l2 {
-	struct kref ref;
 	struct em28xx *dev;
 
-	struct v4l2_device v4l2_dev;
+	struct v4l2_device *v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	struct video_device vdev;
-- 
2.20.1

