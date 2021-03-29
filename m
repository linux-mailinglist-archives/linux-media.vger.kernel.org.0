Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C394B34D0FF
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 15:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhC2NJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 09:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhC2NJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 09:09:31 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D167C061574;
        Mon, 29 Mar 2021 06:09:31 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id c3so5224900qvz.7;
        Mon, 29 Mar 2021 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/mDspVZYMUY7MFb45zx1e/ws22kCFlDS0arlsDuH6SQ=;
        b=qwOra3NAATT2b8FJivH6I2wNTgd4yKa0J40RIGsQi7x+Hg3kJAlGCk8kgt0EGf1jid
         5oFN3O4V0X70H+BO8xptE5sKZ26d8R1q63SSh+ZziR3rk6uxCWaWADjVLNkJ6Sf2cpYb
         fXdDbVfeDRldeFjRIYvNfM2du5mob43jq3ghuDIYwPCvQby+iYZimQ1JQUl7l+WcBA8W
         o8jSH6kuZNYrpVtwcDyU1HhD7oBrevd8Zv4uprZM+5rjHKeaRbEyO0VmFR/L5CmY9nry
         2U2juguPuQW+fx6UAYijWpzx3pnMEx9v1cdZEwSGIrbPuSL0wSfhaeHLrODMjUOGk4DV
         FPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=/mDspVZYMUY7MFb45zx1e/ws22kCFlDS0arlsDuH6SQ=;
        b=s72+odcY3MNaKFeFjGF93zNIX0SpyY9qBU4hVA61IFXrqSkfJv6asqrCSK+mreO1oc
         LSCXDhfExQZui030zdwXgp5XoPFv2Jd1efhIR79OnEpVjjEsoGy7B1o3ACj109throll
         TXka+fFtJmFkOaItW749Or9YBtW5VvOhe5/A0Ri+VuCHpUbwSF6nb5cHAAiNTlbeAMDA
         bHgfmfUov5z3nz1LYtqHwAwLPHdWWVsXkS/VsEklasnRhMMfS5/x9OPpYGpHJTh712J0
         K/9G2q49upXxM7fhaJoEfB/+NGI6VgKGmH5qSuPxW9cCPROyn9FjvOmmnQ/IzI+2HuJK
         +Msg==
X-Gm-Message-State: AOAM530ezFEzZIu0cQwtmtf9qWwe6BOveMvCHoTRyKqL9hgfqbly+XSY
        4ScGXbdTorCLzh2oCzy/jg2eUWWOePU=
X-Google-Smtp-Source: ABdhPJwte0tfe5gxRj6nRI3+jZC+Qh6c/Dev+r4iIDGAVPcac3p22TRHphwx/H8EpVe2lT6qEwSXZw==
X-Received: by 2002:a05:6214:4ae:: with SMTP id w14mr24737987qvz.45.1617023369865;
        Mon, 29 Mar 2021 06:09:29 -0700 (PDT)
Received: from [192.168.15.5] ([189.120.76.30])
        by smtp.gmail.com with ESMTPSA id n24sm10346961qtr.21.2021.03.29.06.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 06:09:28 -0700 (PDT)
From:   Igor Torrente <igormtorrente@gmail.com>
Subject: Help with a fix on em28xx driver
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org
Message-ID: <0a4cc050-8bac-8bb9-a4a2-65bc24480db7@gmail.com>
Date:   Mon, 29 Mar 2021 10:09:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Im working on a to fix a user-after-free bug in the em28xx driver 
discovered by the syzbot, but I'm having problems.

Link to the bug report: 
https://syzkaller.appspot.com/bug?id=0e3c97f1c4112e102c9988afd5eff079350eab7f


I think it is a race condition - For lack of better term - between the 
em28xx_v4l2_open() and em28xx_v4l2_init().

When we have a situation when a thread[1] - containing the 
em28xx_v4l2_init() code - calls the v4l2_mc_create_media_graph(), and it 
return a error, if a thread[2] - running v4l2_open() - pass the 
verification point and reaches the em28xx_v4l2_open() before the 
thread[1] finishes the deregistration of v4l2 subsystem, the thread[1] 
will free all the resources before the em28xx_v4l2_open() can process 
their things, because the em28xx_v4l2_init() has the dev->lock. And all 
this Lead the thread[2] to cause a user-after-free.


Threads:
                                     |
Thread[1]                           |
em28xx_v4l2_init()                  | Time
                                     |
Thread[1]                           |
mutex_lock(&dev->lock)              ∇

Thread[1]
video_register_device()

Thread[1]                  Thread[2]
Some code between register v4l2_open()
and unregister

Thread[1]                  Thread[2]
Some code between register if(vdev==NULL||!video_is_registered())
and unregister

Thread[1]                  Thread[2]
video_unregister_device()  mutex_lock_interruptible(&dev->lock)

Thread[1]                  Thread[2]
kref_put(&v4l2->ref,...)   mutex_lock_interruptible(&dev->lock)

Thread[1]                  Thread[2]
mutex_unlock(&dev->lock)   mutex_lock_interruptible(&dev->lock)

Thread[1]                  Thread[2]
return ret                 access freed resources


I'm trying to fix this issue but I'm having a lot of trouble because I'm 
not familiar with this driver nor the media/v4l2 subsystem.

Someone can help me to with this fix?

I'm not sure if it this the best approach, but Will embed the stack 
trace and my changes to this email.

Thanks in advance.

Stack trace:
  media_gobj_destroy+0x1c4/0x240 linux/drivers/media/mc/mc-entity.c:179
  __media_device_unregister_entity+0x200/0x300 
linux/drivers/media/mc/mc-device.c:601
  media_device_unregister_entity+0x49/0x70 
linux/drivers/media/mc/mc-device.c:689
  v4l2_device_release+0x363/0x470 
linux/drivers/media/v4l2-core/v4l2-dev.c:208
  device_release+0x9f/0x240 linux/drivers/base/core.c:2108
  kobject_cleanup linux/lib/kobject.c:705
  kobject_release linux/lib/kobject.c:736
  kref_put kref.h:65
  kobject_put+0x1c8/0x540 linux/lib/kobject.c:753
  put_device+0x1b/0x30 linux/drivers/base/core.c:3341
  video_put linux/drivers/media/v4l2-core/v4l2-dev.c:173
  v4l2_open+0x2e5/0x3f0 linux/drivers/media/v4l2-core/v4l2-dev.c:438
  chrdev_open+0x266/0x770 linux/fs/char_dev.c:414
  do_dentry_open+0x4b9/0x11b0 linux/fs/open.c:826
  do_open linux/fs/namei.c:3365
  path_openat+0x1c0e/0x27e0 linux/fs/namei.c:3498
  do_filp_open+0x17e/0x3c0 linux/fs/namei.c:3525
  do_sys_openat2+0x16d/0x420 linux/fs/open.c:1187
  do_sys_open linux/fs/open.c:1203
  __do_sys_open linux/fs/open.c:1211
  __se_sys_open linux/fs/open.c:1207
  __x64_sys_open+0x119/0x1c0 linux/fs/open.c:1207
  do_syscall_64+0x2d/0x70 linux/arch/x86/entry/common.c:46
  entry_SYSCALL_64_after_hwframe+0x44/0xae 
linux/arch/x86/entry/entry_64.S:112


My changes:
diff --git a/drivers/media/usb/em28xx/em28xx-camera.c 
b/drivers/media/usb/em28xx/em28xx-camera.c
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
diff --git a/drivers/media/usb/em28xx/em28xx-video.c 
b/drivers/media/usb/em28xx/em28xx-video.c
index 6b84c3413e83..d0640fff8c96 100644
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
@@ -976,7 +976,7 @@ static void em28xx_v4l2_create_entities(struct 
em28xx *dev)

  	/* Initialize Video, VBI and Radio pads */
  	v4l2->video_pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&v4l2->vdev.entity, 1, &v4l2->video_pad);
+	ret = media_entity_pads_init(&v4l2->vdev->entity, 1, &v4l2->video_pad);
  	if (ret < 0)
  		dev_err(&dev->intf->dev,
  			"failed to initialize video media entity!\n");
@@ -1132,11 +1132,11 @@ int em28xx_start_analog_streaming(struct 
vb2_queue *vq, unsigned int count)
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
@@ -1157,7 +1157,7 @@ static void em28xx_stop_streaming(struct vb2_queue 
*vq)

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
@@ -1565,7 +1565,7 @@ static int vidioc_querystd(struct file *file, void 
*priv, v4l2_std_id *norm)
  {
  	struct em28xx *dev = video_drvdata(file);

-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, video, querystd, norm);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, video, querystd, norm);

  	return 0;
  }
@@ -1596,7 +1596,7 @@ static int vidioc_s_std(struct file *file, void 
*priv, v4l2_std_id norm)
  		      &v4l2->hscale, &v4l2->vscale);

  	em28xx_resolution_set(dev);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);

  	return 0;
  }
@@ -1616,7 +1616,7 @@ static int vidioc_g_parm(struct file *file, void 
*priv,
  	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
  	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
  	if (dev->is_webcam) {
-		rc = v4l2_device_call_until_err(&v4l2->v4l2_dev, 0,
+		rc = v4l2_device_call_until_err(v4l2->v4l2_dev, 0,
  						video, g_frame_interval, &ival);
  		if (!rc)
  			p->parm.capture.timeperframe = ival.interval;
@@ -1648,7 +1648,7 @@ static int vidioc_s_parm(struct file *file, void 
*priv,
  	memset(&p->parm, 0, sizeof(p->parm));
  	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
  	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	rc = v4l2_device_call_until_err(&dev->v4l2->v4l2_dev, 0,
+	rc = v4l2_device_call_until_err(dev->v4l2->v4l2_dev, 0,
  					video, s_frame_interval, &ival);
  	if (!rc)
  		p->parm.capture.timeperframe = ival.interval;
@@ -1675,7 +1675,7 @@ static int vidioc_enum_input(struct file *file, 
void *priv,
  	if (INPUT(n)->type == EM28XX_VMUX_TELEVISION)
  		i->type = V4L2_INPUT_TYPE_TUNER;

-	i->std = dev->v4l2->vdev.tvnorms;
+	i->std = dev->v4l2->vdev->tvnorms;
  	/* webcams do not have the STD API */
  	if (dev->is_webcam)
  		i->capabilities = 0;
@@ -1839,7 +1839,7 @@ static int vidioc_g_tuner(struct file *file, void 
*priv,

  	strscpy(t->name, "Tuner", sizeof(t->name));

-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
  	return 0;
  }

@@ -1851,7 +1851,7 @@ static int vidioc_s_tuner(struct file *file, void 
*priv,
  	if (t->index != 0)
  		return -EINVAL;

-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
  	return 0;
  }

@@ -1878,8 +1878,8 @@ static int vidioc_s_frequency(struct file *file, 
void *priv,
  	if (f->tuner != 0)
  		return -EINVAL;

-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_frequency, f);
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_frequency, f);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, g_frequency, &new_freq);
  	v4l2->frequency = new_freq.frequency;

  	return 0;
@@ -1897,7 +1897,7 @@ static int vidioc_g_chip_info(struct file *file, 
void *priv,
  		strscpy(chip->name, "ac97", sizeof(chip->name));
  	else
  		strscpy(chip->name,
-			dev->v4l2->v4l2_dev.name, sizeof(chip->name));
+			dev->v4l2->v4l2_dev->name, sizeof(chip->name));
  	return 0;
  }

@@ -2095,7 +2095,7 @@ static int radio_g_tuner(struct file *file, void 
*priv,

  	strscpy(t->name, "Radio", sizeof(t->name));

-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, g_tuner, t);

  	return 0;
  }
@@ -2108,7 +2108,7 @@ static int radio_s_tuner(struct file *file, void 
*priv,
  	if (t->index != 0)
  		return -EINVAL;

-	v4l2_device_call_all(&dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);
+	v4l2_device_call_all(dev->v4l2->v4l2_dev, 0, tuner, s_tuner, t);

  	return 0;
  }
@@ -2160,11 +2160,16 @@ static int em28xx_v4l2_open(struct file *filp)
  	if (mutex_lock_interruptible(&dev->lock))
  		return -ERESTARTSYS;

+	if (dev->v4l2 == NULL) {
+		mutex_unlock(&dev->lock);
+		return -ENODEV;
+	}
+
  	ret = v4l2_fh_open(filp);
  	if (ret) {
  		dev_err(&dev->intf->dev,
  			"%s: v4l2_fh_open() returned error %d\n",
-		       __func__, ret);
+			__func__, ret);
  		mutex_unlock(&dev->lock);
  		return ret;
  	}
@@ -2184,7 +2189,7 @@ static int em28xx_v4l2_open(struct file *filp)

  	if (vdev->vfl_type == VFL_TYPE_RADIO) {
  		em28xx_videodbg("video_open: setting radio device\n");
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, s_radio);
  	}

  	kref_get(&dev->ref);
@@ -2222,7 +2227,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)

  	mutex_lock(&dev->lock);

-	v4l2_device_disconnect(&v4l2->v4l2_dev);
+	v4l2_device_disconnect(v4l2->v4l2_dev);

  	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);

@@ -2238,14 +2243,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
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
+	v4l2_device_unregister(v4l2->v4l2_dev);
+	v4l2_device_put(v4l2->v4l2_dev);

  	kref_put(&v4l2->ref, em28xx_free_v4l2);

@@ -2305,7 +2311,7 @@ static int em28xx_v4l2_close(struct file *filp)
  			goto exit;

  		/* Save some power by putting tuner to sleep */
-		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+		v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);

  		/* do this before setting alternate! */
  		em28xx_set_mode(dev, EM28XX_SUSPEND);
@@ -2387,7 +2393,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
  static const struct video_device em28xx_video_template = {
  	.fops		= &em28xx_v4l_fops,
  	.ioctl_ops	= &video_ioctl_ops,
-	.release	= video_device_release_empty,
+	.release	= video_device_release,
  	.tvnorms	= V4L2_STD_ALL,
  };

@@ -2445,7 +2451,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
  			     const char *type_name)
  {
  	*vfd		= *template;
-	vfd->v4l2_dev	= &dev->v4l2->v4l2_dev;
+	vfd->v4l2_dev	= dev->v4l2->v4l2_dev;
  	vfd->lock	= &dev->lock;
  	if (dev->is_webcam)
  		vfd->tvnorms = 0;
@@ -2459,7 +2465,7 @@ static void em28xx_vdev_init(struct em28xx *dev,
  static void em28xx_tuner_setup(struct em28xx *dev, unsigned short 
tuner_addr)
  {
  	struct em28xx_v4l2      *v4l2 = dev->v4l2;
-	struct v4l2_device      *v4l2_dev = &v4l2->v4l2_dev;
+	struct v4l2_device      *v4l2_dev = v4l2->v4l2_dev;
  	struct tuner_setup      tun_setup;
  	struct v4l2_frequency   f;

@@ -2517,6 +2523,12 @@ static void em28xx_tuner_setup(struct em28xx 
*dev, unsigned short tuner_addr)
  	v4l2_device_call_all(v4l2_dev, 0, tuner, s_frequency, &f);
  }

+
+void em28xx_v4l2_dev_release(struct v4l2_device *v4l2_dev)
+{
+	kfree(v4l2_dev);
+}
+
  static int em28xx_v4l2_init(struct em28xx *dev)
  {
  	u8 val;
@@ -2541,26 +2553,42 @@ static int em28xx_v4l2_init(struct em28xx *dev)

  	v4l2 = kzalloc(sizeof(*v4l2), GFP_KERNEL);
  	if (!v4l2) {
-		mutex_unlock(&dev->lock);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto v4l2_error;
+	}
+
+	v4l2->vdev = kzalloc(sizeof(struct video_device), GFP_KERNEL);
+	if (!v4l2->vdev) {
+		ret = -ENOMEM;
+		goto vdev_error;
  	}
+
+	v4l2->v4l2_dev = kzalloc(sizeof(struct v4l2_device), GFP_KERNEL);
+	if (!v4l2->v4l2_dev) {
+		ret = -ENOMEM;
+		kfree(v4l2->vdev);
+		goto err;
+	}
+
  	kref_init(&v4l2->ref);
  	v4l2->dev = dev;
  	dev->v4l2 = v4l2;

  #ifdef CONFIG_MEDIA_CONTROLLER
-	v4l2->v4l2_dev.mdev = dev->media_dev;
+	v4l2->v4l2_dev->mdev = dev->media_dev;
  #endif
-	ret = v4l2_device_register(&dev->intf->dev, &v4l2->v4l2_dev);
+	ret = v4l2_device_register(&dev->intf->dev, v4l2->v4l2_dev);
  	if (ret < 0) {
  		dev_err(&dev->intf->dev,
  			"Call to v4l2_device_register() failed!\n");
+		kfree(v4l2->vdev);
  		goto err;
  	}

  	hdl = &v4l2->ctrl_handler;
  	v4l2_ctrl_handler_init(hdl, 8);
-	v4l2->v4l2_dev.ctrl_handler = hdl;
+	v4l2->v4l2_dev->ctrl_handler = hdl;
+	v4l2->v4l2_dev->release = em28xx_v4l2_dev_release;

  	if (dev->is_webcam)
  		v4l2->progressive = true;
@@ -2575,22 +2603,22 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  	/* request some modules */

  	if (dev->has_msp34xx)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+		v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  				    &dev->i2c_adap[dev->def_i2c_bus],
  				    "msp3400", 0, msp3400_addrs);

  	if (dev->board.decoder == EM28XX_SAA711X)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+		v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  				    &dev->i2c_adap[dev->def_i2c_bus],
  				    "saa7115_auto", 0, saa711x_addrs);

  	if (dev->board.decoder == EM28XX_TVP5150)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+		v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  				    &dev->i2c_adap[dev->def_i2c_bus],
  				    "tvp5150", 0, tvp5150_addrs);

  	if (dev->board.adecoder == EM28XX_TVAUDIO)
-		v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+		v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  				    &dev->i2c_adap[dev->def_i2c_bus],
  				    "tvaudio", dev->board.tvaudio_addr, NULL);

@@ -2601,13 +2629,13 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  		int has_demod = (dev->board.tda9887_conf & TDA9887_PRESENT);

  		if (dev->board.radio.type)
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+			v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  					    &dev->i2c_adap[dev->def_i2c_bus],
  					    "tuner", dev->board.radio_addr,
  					    NULL);

  		if (has_demod)
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+			v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  					    &dev->i2c_adap[dev->def_i2c_bus],
  					    "tuner", 0,
  					    v4l2_i2c_tuner_addrs(ADDRS_DEMOD));
@@ -2616,7 +2644,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  				has_demod ? ADDRS_TV_WITH_DEMOD : ADDRS_TV;
  			struct v4l2_subdev *sd;

-			sd = v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+			sd = v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  						 &dev->i2c_adap[dev->def_i2c_bus],
  						 "tuner", 0,
  						 v4l2_i2c_tuner_addrs(type));
@@ -2624,7 +2652,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  			if (sd)
  				tuner_addr = v4l2_i2c_subdev_addr(sd);
  		} else {
-			v4l2_i2c_new_subdev(&v4l2->v4l2_dev,
+			v4l2_i2c_new_subdev(v4l2->v4l2_dev,
  					    &dev->i2c_adap[dev->def_i2c_bus],
  					    "tuner", tuner_addr, NULL);
  		}
@@ -2686,7 +2714,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)

  	/* set default norm */
  	v4l2->norm = V4L2_STD_PAL;
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, video, s_std, v4l2->norm);
  	v4l2->interlaced_fieldmode = EM28XX_INTERLACED_DEFAULT;

  	/* Analog specific initialization */
@@ -2756,40 +2784,40 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  		goto unregister_dev;

  	/* allocate and fill video video_device struct */
-	em28xx_vdev_init(dev, &v4l2->vdev, &em28xx_video_template, "video");
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
@@ -2863,7 +2891,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)

  	dev_info(&dev->intf->dev,
  		 "V4L2 video device registered as %s\n",
-		 video_device_node_name(&v4l2->vdev));
+		 video_device_node_name(v4l2->vdev));

  	if (video_is_registered(&v4l2->vbi_dev))
  		dev_info(&dev->intf->dev,
@@ -2871,7 +2899,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
  			 video_device_node_name(&v4l2->vbi_dev));

  	/* Save some power by putting tuner to sleep */
-	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
+	v4l2_device_call_all(v4l2->v4l2_dev, 0, tuner, standby);

  	/* initialize videobuf2 stuff */
  	em28xx_vb2_setup(dev);
@@ -2897,18 +2925,21 @@ static int em28xx_v4l2_init(struct em28xx *dev)
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
+	v4l2_device_unregister(v4l2->v4l2_dev);
+	v4l2_device_put(v4l2->v4l2_dev);
  err:
  	dev->v4l2 = NULL;
+vdev_error:
  	kref_put(&v4l2->ref, em28xx_free_v4l2);
+v4l2_error:
  	mutex_unlock(&dev->lock);
  	return ret;
  }
diff --git a/drivers/media/usb/em28xx/em28xx.h 
b/drivers/media/usb/em28xx/em28xx.h
index 6648e11f1271..d0feb1c7bb15 100644
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

