Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3CAD35F89E
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351375AbhDNQFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 12:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351355AbhDNQFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 12:05:52 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3B4C061574;
        Wed, 14 Apr 2021 09:05:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id y2so15812403qtw.13;
        Wed, 14 Apr 2021 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFCIIFmTI90rK2WVondww5fM5BeDjaFerustwgUtqSs=;
        b=gOo3/GZQoz3scOADBT89tgWvFP5uDkZ8TkkyttpMDMGHwXy5lyMYlY3Wvl5/e+ya29
         TSR4gusZPtoC+wnn/uM/Ywt/mqsDE6bg2XIwuDSBKST73yGZJXm4fpIDXd0BY881AaUT
         p53tkUX6v+eIhawwbtGGPmdxmolXZCwN6J2lGOEpsRwaBUK2vj+MRxuKQZaSt7N3/7Mw
         E8/IE2WEiIHSIYX191F219DjGeZJ+NpV5oJf0Hm5yAoes8SjyyZuqzfMd0xdC75aOWSa
         gPteiRzy7jNV7LET/VaaAu76052KBvDhK3v6YKcnccNiF506Sdg0+D63aMbOqa0wtdVp
         rdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFCIIFmTI90rK2WVondww5fM5BeDjaFerustwgUtqSs=;
        b=E/yxT2hbR3P+OR2/knJcak2vNpJHDiMVMh5OEkDZs44EGM+Ly6EvGysQ86e/PHt11t
         024nceh8r4MTyv0neySMEv3NYSSAz+0dcpEaOq7KxhIixKy7o3Fn3+FIk4oghrABBM0/
         ktMoI+MkMLZeCz8khhhy2sTK8kQ5coSwwmT0OR+rjitdLuxiJbjT/FXFFC++dzEqnKD/
         mv/0ga7ohkxiUiEz+fMplGH21ijBNVboeouRPgO9UImCt70LhhRanmlLZ/S7CRB7ZZbI
         +1bd7MjMlLWeWVU3/DoET2tJPqjtM6DYFx5uPUtn/YmkhPG+VOB+lXmYNL9uMtisICcO
         1r+Q==
X-Gm-Message-State: AOAM531EdCoobRXmSlNfiYhoAFmKm5xYAWf/M1dVeNVfJOczm5uqZDjh
        AOUy7K+wCW7BVoffMfkX/8w=
X-Google-Smtp-Source: ABdhPJy3l2pRG38Joz1HR818ortQPEQr4Yr4ZFpXGKLTVQ+9Ou94Q4RfKa8vrKY4fd8ZEgfpAHTVHQ==
X-Received: by 2002:aed:2067:: with SMTP id 94mr4451166qta.90.1618416329563;
        Wed, 14 Apr 2021 09:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.googlemail.com with ESMTPSA id x13sm12438704qtf.32.2021.04.14.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:05:29 -0700 (PDT)
From:   Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To:     mchehab@kernel.org, skhan@linuxfoundation.org
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
Subject: [PATCH RFC v2] media: em28xx: Fix race condition between open and init function
Date:   Wed, 14 Apr 2021 13:04:53 -0300
Message-Id: <20210414160453.1391-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes a race condition - for lack of a more precise term - between
em28xx_v4l2_open and em28xx_v4l2_init, by detaching the v4l2_dev,
media_pad and vdev structs from the em28xx_v4l2, and managing the
lifetime of those objects more dynamicaly.

The race happens when a thread[1] - containing the em28xx_v4l2_init()
code - calls the v4l2_mc_create_media_graph(), and it return a error,
if a thread[2] - running v4l2_open() - pass the verification point
and reaches the em28xx_v4l2_open() before the thread[1] finishes
the deregistration of v4l2 subsystem, the thread[1] will free all
resources before the em28xx_v4l2_open() can process their things,
because the em28xx_v4l2_init() has the dev->lock. And all this lead
the thread[2] to cause a user-after-free.

Reported-and-tested-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---

V2: Add v4l2_i2c_new_subdev null check
    Deal with v4l2 subdevs dependencies

---
 drivers/media/usb/em28xx/em28xx-camera.c |   4 +-
 drivers/media/usb/em28xx/em28xx-video.c  | 298 +++++++++++++++--------
 drivers/media/usb/em28xx/em28xx.h        |   6 +-
 3 files changed, 208 insertions(+), 100 deletions(-)

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
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 6b84c3413e83..4147e556b623 100644
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
@@ -974,9 +974,17 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 	struct em28xx_v4l2 *v4l2 = dev->v4l2;
 	int ret, i;
 
+	v4l2->video_pad = kzalloc(sizeof(*v4l2->video_pad), GFP_KERNEL);
+	if (!v4l2->video_pad) {
+		dev_err(&dev->intf->dev,
+			"failed to allocate video pad memory!\n");
+		v4l2->vdev->entity.num_pads = 0;
+		return;
+	}
+
 	/* Initialize Video, VBI and Radio pads */
-	v4l2->video_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&v4l2->vdev.entity, 1, &v4l2->video_pad);
+	v4l2->video_pad->flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&v4l2->vdev->entity, 1, v4l2->video_pad);
 	if (ret < 0)
 		dev_err(&dev->intf->dev,
 			"failed to initialize video media entity!\n");
@@ -1132,11 +1140,11 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -1157,7 +1165,7 @@ static void em28xx_stop_streaming(struct vb2_queue *vq)
 
 	if (v4l2->streaming_users-- == 1) {
 		/* Disable video stream at TV decoder */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_stream, 0);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_stream, 0);
 
 		/* Last active user, so shutdown all the URBS */
 		em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -1192,7 +1200,7 @@ void em28xx_stop_vbi_streaming(struct vb2_queue *vq)
 
 	if (v4l2->streaming_users-- == 1) {
 		/* Disable video stream at TV decoder */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_stream, 0);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_stream, 0);
 
 		/* Last active user, so shutdown all the URBS */
 		em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -1286,7 +1294,7 @@ static int em28xx_vb2_setup(struct em28xx *dev)
 
 static void video_mux(struct em28xx *dev, int index)
 {
-	struct v4l2_device *v4l2_dev = &dev->v4l2->v4l2_dev;
+	struct v4l2_device *v4l2_dev = dev->v4l2->v4l2_dev;
 
 	dev->ctl_input = index;
 	dev->ctl_ainput = INPUT(index)->amux;
@@ -1565,7 +1573,7 @@ static int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *norm)
 {
 	struct em28xx *dev = video_drvdata(file);
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, video, querystd, norm);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, video, querystd, norm);
 
 	return 0;
 }
@@ -1596,7 +1604,7 @@ static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id norm)
 		      &v4l2->hscale, &v4l2->vscale);
 
 	em28xx_resolution_set(dev);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 
 	return 0;
 }
@@ -1616,7 +1624,7 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
 	if (dev->is_webcam) {
-		rc = v4l2_device_call_until_err(&v4l2->v4l2_dev, 0,
+		rc = v4l2_device_call_until_err(v4l2->v4l2_dev, 0,
 						video, g_frame_interval, &ival);
 		if (!rc)
 			p->parm.capture.timeperframe = ival.interval;
@@ -1648,7 +1656,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	memset(&p->parm, 0, sizeof(p->parm));
 	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	rc = v4l2_device_call_until_err(&dev->v4l2->v4l2_dev, 0,
+	rc = v4l2_device_call_until_err(dev->v4l2->v4l2_dev, 0,
 					video, s_frame_interval, &ival);
 	if (!rc)
 		p->parm.capture.timeperframe = ival.interval;
@@ -1675,7 +1683,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	if (INPUT(n)->type == EM28XX_VMUX_TELEVISION)
 		i->type = V4L2_INPUT_TYPE_TUNER;
 
-	i->std = dev->v4l2->vdev.tvnorms;
+	i->std = dev->v4l2->vdev->tvnorms;
 	/* webcams do not have the STD API */
 	if (dev->is_webcam)
 		i->capabilities = 0;
@@ -1839,7 +1847,7 @@ static int vidioc_g_tuner(struct file *file, void *priv,
 
 	strscpy(t->name, "Tuner", sizeof(t->name));
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
 	return 0;
 }
 
@@ -1851,7 +1859,7 @@ static int vidioc_s_tuner(struct file *file, void *priv,
 	if (t->index != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
 	return 0;
 }
 
@@ -1878,8 +1886,8 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 	if (f->tuner != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_frequency, f);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_frequency, f);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
 	v4l2->frequency = new_freq.frequency;
 
 	return 0;
@@ -1897,7 +1905,7 @@ static int vidioc_g_chip_info(struct file *file, void *priv,
 		strscpy(chip->name, "ac97", sizeof(chip->name));
 	else
 		strscpy(chip->name,
-			dev->v4l2->v4l2_dev.name, sizeof(chip->name));
+			dev->v4l2->v4l2_dev->name, sizeof(chip->name));
 	return 0;
 }
 
@@ -2095,7 +2103,7 @@ static int radio_g_tuner(struct file *file, void *priv,
 
 	strscpy(t->name, "Radio", sizeof(t->name));
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
 
 	return 0;
 }
@@ -2108,7 +2116,7 @@ static int radio_s_tuner(struct file *file, void *priv,
 	if (t->index != 0)
 		return -EINVAL;
 
-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
 
 	return 0;
 }
@@ -2160,6 +2168,11 @@ static int em28xx_v4l2_open(struct file *filp)
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
@@ -2184,9 +2197,10 @@ static int em28xx_v4l2_open(struct file *filp)
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO) {
 		em28xx_videodbg("video_open: setting radio device\n");
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_radio);
 	}
 
+	v4l2_device_get(v4l2->v4l2_dev);
 	kref_get(&dev->ref);
 	kref_get(&v4l2->ref);
 	v4l2->users++;
@@ -2222,7 +2236,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 
 	mutex_lock(&dev->lock);
 
-	v4l2_device_disconnect(&v4l2->v4l2_dev);
+	v4l2_device_disconnect(v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
 
@@ -2238,14 +2252,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 		video_unregister_device(&v4l2->vbi_dev);
 	}
-	if (video_is_registered(&v4l2->vdev)) {
+	if (video_is_registered(v4l2->vdev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
+			 video_device_node_name(v4l2->vdev));
+		video_unregister_device(v4l2->vdev);
 	}
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
+	v4l2_device_disconnect(v4l2->v4l2_dev);
+	v4l2_device_put(v4l2->v4l2_dev);
 
 	kref_put(&v4l2->ref, em28xx_free_v4l2);
 
@@ -2305,7 +2320,7 @@ static int em28xx_v4l2_close(struct file *filp)
 			goto exit;
 
 		/* Save some power by putting tuner to sleep */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);
 
 		/* do this before setting alternate! */
 		em28xx_set_mode(dev, EM28XX_SUSPEND);
@@ -2322,6 +2337,7 @@ static int em28xx_v4l2_close(struct file *filp)
 	}
 
 exit:
+	v4l2_device_put(v4l2->v4l2_dev);
 	v4l2->users--;
 	kref_put(&v4l2->ref, em28xx_free_v4l2);
 	mutex_unlock(&dev->lock);
@@ -2330,6 +2346,17 @@ static int em28xx_v4l2_close(struct file *filp)
 	return 0;
 }
 
+static void em28xx_vdev_release(struct video_device *vdev)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	int i;
+
+	for (i = 0; i < vdev->entity.num_pads; i++)
+		kfree(&vdev->entity.pads[i]);
+#endif
+	kfree(vdev);
+}
+
 static const struct v4l2_file_operations em28xx_v4l_fops = {
 	.owner         = THIS_MODULE,
 	.open          = em28xx_v4l2_open,
@@ -2387,7 +2414,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 static const struct video_device em28xx_video_template = {
 	.fops		= &em28xx_v4l_fops,
 	.ioctl_ops	= &video_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= em28xx_vdev_release,
 	.tvnorms	= V4L2_STD_ALL,
 };
 
@@ -2445,7 +2472,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
 			     const char *type_name)
 {
 	*vfd		= *template;
-	vfd->v4l2_dev	= &dev->v4l2->v4l2_dev;
+	vfd->v4l2_dev	= dev->v4l2->v4l2_dev;
 	vfd->lock	= &dev->lock;
 	if (dev->is_webcam)
 		vfd->tvnorms = 0;
@@ -2459,7 +2486,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
 static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
 {
 	struct em28xx_v4l2      *v4l2 = dev->v4l2;
-	struct v4l2_device      *v4l2_dev = &v4l2->v4l2_dev;
+	struct v4l2_device      *v4l2_dev = v4l2->v4l2_dev;
 	struct tuner_setup      tun_setup;
 	struct v4l2_frequency   f;
 
@@ -2517,6 +2544,22 @@ static void em28xx_tuner_setup(struct em28xx *dev, unsigned short tuner_addr)
 	v4l2_device_call_all(v4l2_dev, 0, tuner, s_frequency, &f);
 }
 
+static void em28xx_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd, *next;
+
+	/* Unregister subdevs */
+	list_for_each_entry_safe(sd, next, &v4l2_dev->subdevs, list) {
+		v4l2_device_unregister_subdev(sd);
+		if (sd->flags & V4L2_SUBDEV_FL_IS_I2C)
+			v4l2_i2c_subdev_unregister(sd);
+		else if (sd->flags & V4L2_SUBDEV_FL_IS_SPI)
+			v4l2_spi_subdev_unregister(sd);
+	}
+
+	kfree(v4l2_dev);
+}
+
 static int em28xx_v4l2_init(struct em28xx *dev)
 {
 	u8 val;
@@ -2524,6 +2567,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	unsigned int maxw;
 	struct v4l2_ctrl_handler *hdl;
 	struct em28xx_v4l2 *v4l2;
+	struct v4l2_subdev *sd;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2541,26 +2585,35 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	v4l2 = kzalloc(sizeof(*v4l2), GFP_KERNEL);
 	if (!v4l2) {
-		mutex_unlock(&dev->lock);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto v4l2_error;
 	}
+
 	kref_init(&v4l2->ref);
 	v4l2->dev = dev;
 	dev->v4l2 = v4l2;
 
+	v4l2->v4l2_dev = kzalloc(sizeof(*v4l2->v4l2_dev), GFP_KERNEL);
+	if (!v4l2->v4l2_dev) {
+		ret = -ENOMEM;
+		goto v4l2_dev_error;
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
-		goto err;
+		goto v4l2_device_register_error;
 	}
 
 	hdl = &v4l2->ctrl_handler;
 	v4l2_ctrl_handler_init(hdl, 8);
-	v4l2->v4l2_dev.ctrl_handler = hdl;
+	v4l2->v4l2_dev->ctrl_handler = hdl;
 
 	if (dev->is_webcam)
 		v4l2->progressive = true;
@@ -2574,25 +2627,49 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
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
+				"Error while registering msp34xx v4l2 subdevice!\n");
+			goto v4l2_subdev_register_error;
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
+				"Error while registering EM28XX_SAA711X v4l2 subdevice!\n");
+			goto v4l2_subdev_register_error;
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
+				"Error while registering EM28XX_TVP5150 v4l2 subdevice!\n");
+			goto v4l2_subdev_register_error;
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
+				"Error while registering EM28XX_TVAUDIO v4l2 subdevice!\n");
+			goto v4l2_subdev_register_error;
+		}
+	}
 
 	/* Initialize tuner and camera */
 
@@ -2600,33 +2677,55 @@ static int em28xx_v4l2_init(struct em28xx *dev)
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
+					"Error while registering <name1> v4l2 subdevice!\n");
+				goto v4l2_subdev_register_error;
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
+					"Error while registering <name2> v4l2 subdevice!\n");
+				goto v4l2_subdev_register_error;
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
 			if (sd)
 				tuner_addr = v4l2_i2c_subdev_addr(sd);
+			else {
+				dev_err(&dev->intf->dev,
+					"Error while registering <name3> v4l2 subdevice!\n");
+				goto v4l2_subdev_register_error;
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
+					"Error while registering <name4> v4l2 subdevice!\n");
+				goto v4l2_subdev_register_error;
+			}
 		}
 
 		em28xx_tuner_setup(dev, tuner_addr);
@@ -2686,7 +2785,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	/* set default norm */
 	v4l2->norm = V4L2_STD_PAL;
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
 	v4l2->interlaced_fieldmode = EM28XX_INTERLACED_DEFAULT;
 
 	/* Analog specific initialization */
@@ -2756,40 +2855,45 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		goto unregister_dev;
 
 	/* allocate and fill video video_device struct */
-	em28xx_vdev_init(dev, &v4l2->vdev, &em28xx_video_template, "video");
+	v4l2->vdev = kzalloc(sizeof(*v4l2->vdev), GFP_KERNEL);
+	if (!v4l2->vdev) {
+		ret = -ENOMEM;
+		goto unregister_dev;
+	}
+
+	em28xx_vdev_init(dev, v4l2->vdev, &em28xx_video_template, "video");
 	mutex_init(&v4l2->vb_queue_lock);
 	mutex_init(&v4l2->vb_vbi_queue_lock);
-	v4l2->vdev.queue = &v4l2->vb_vidq;
-	v4l2->vdev.queue->lock = &v4l2->vb_queue_lock;
-	v4l2->vdev.device_caps = V4L2_CAP_READWRITE | V4L2_CAP_VIDEO_CAPTURE |
+	v4l2->vdev->queue = &v4l2->vb_vidq;
+	v4l2->vdev->queue->lock = &v4l2->vb_queue_lock;
+	v4l2->vdev->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_VIDEO_CAPTURE |
 				 V4L2_CAP_STREAMING;
 	if (dev->int_audio_type != EM28XX_INT_AUDIO_NONE)
-		v4l2->vdev.device_caps |= V4L2_CAP_AUDIO;
+		v4l2->vdev->device_caps |= V4L2_CAP_AUDIO;
 	if (dev->tuner_type != TUNER_ABSENT)
-		v4l2->vdev.device_caps |= V4L2_CAP_TUNER;
-
+		v4l2->vdev->device_caps |= V4L2_CAP_TUNER;
 
 	/* disable inapplicable ioctls */
 	if (dev->is_webcam) {
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_QUERYSTD);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_STD);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_STD);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_QUERYSTD);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_G_STD);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_S_STD);
 	} else {
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_PARM);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_S_PARM);
 	}
 	if (dev->tuner_type == TUNER_ABSENT) {
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_TUNER);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_TUNER);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_FREQUENCY);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_S_FREQUENCY);
 	}
 	if (dev->int_audio_type == EM28XX_INT_AUDIO_NONE) {
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_G_AUDIO);
-		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(v4l2->vdev, VIDIOC_S_AUDIO);
 	}
 
 	/* register v4l2 video video_device */
-	ret = video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
+	ret = video_register_device(v4l2->vdev, VFL_TYPE_VIDEO,
 				    video_nr[dev->devno]);
 	if (ret) {
 		dev_err(&dev->intf->dev,
@@ -2863,7 +2967,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 
 	dev_info(&dev->intf->dev,
 		 "V4L2 video device registered as %s\n",
-		 video_device_node_name(&v4l2->vdev));
+		 video_device_node_name(v4l2->vdev));
 
 	if (video_is_registered(&v4l2->vbi_dev))
 		dev_info(&dev->intf->dev,
@@ -2871,7 +2975,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 
 	/* Save some power by putting tuner to sleep */
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);
 
 	/* initialize videobuf2 stuff */
 	em28xx_vb2_setup(dev);
@@ -2897,18 +3001,22 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 		video_unregister_device(&v4l2->vbi_dev);
 	}
-	if (video_is_registered(&v4l2->vdev)) {
+	if (video_is_registered(v4l2->vdev)) {
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
-			 video_device_node_name(&v4l2->vdev));
-		video_unregister_device(&v4l2->vdev);
+			 video_device_node_name(v4l2->vdev));
+		video_unregister_device(v4l2->vdev);
 	}
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
-err:
+v4l2_subdev_register_error:
+	v4l2_device_disconnect(v4l2->v4l2_dev);
+v4l2_device_register_error:
+	v4l2_device_put(v4l2->v4l2_dev);
+v4l2_dev_error:
 	dev->v4l2 = NULL;
 	kref_put(&v4l2->ref, em28xx_free_v4l2);
+v4l2_error:
 	mutex_unlock(&dev->lock);
 	return ret;
 }
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 6648e11f1271..dbcc297b5a0d 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -552,10 +552,10 @@ struct em28xx_v4l2 {
 	struct kref ref;
 	struct em28xx *dev;
 
-	struct v4l2_device v4l2_dev;
+	struct v4l2_device *v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
 
-	struct video_device vdev;
+	struct video_device *vdev;
 	struct video_device vbi_dev;
 	struct video_device radio_dev;
 
@@ -601,7 +601,7 @@ struct em28xx_v4l2 {
 	unsigned int field_count;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-	struct media_pad video_pad, vbi_pad;
+	struct media_pad *video_pad, vbi_pad;
 	struct media_entity *decoder;
 #endif
 };
-- 
2.20.1

