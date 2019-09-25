Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52CBBD9D1
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442741AbfIYI17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:27:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46652 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438134AbfIYI17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:27:59 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so2074352plr.13
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8sA7saWnmEgHkX4UvyGxzWSRT1fc8j7Gle80LfJ/3n8=;
        b=Lsxnjtm/g61p1TBx7E/XvAUjV9wGSzGMtnhY9IRalRrURGleVP2VX/a8/Z1XDqWLVr
         KpRXIzhrMzedbV8QHaEyi+dQtzmpluquCZTBiFvZm7wlLHFrKxhRut/osmOr0c+xL2EU
         FerVIMwyMQR5ezN9O8GrRNoAJ8DVtzFNn1hJyKa9WXPcGUWQiKFvUTYjRuBU5d3jwl02
         PuWAR2KCoNDXnad3UuQ1gBw0SEODLTfb/Bxg/IvKH+BSI6+MhQv4aFKanIFSgBfBZoyY
         EmPPrFRXy1hl2mvIkMAhDvG6CtfybyjqiUbXB8D29umq4IhGSbzZZOnXh9XYqhftfPsy
         jK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8sA7saWnmEgHkX4UvyGxzWSRT1fc8j7Gle80LfJ/3n8=;
        b=Xolirxw5Dtxu+MOjGcayHgYRp1kIsyb49+EEU2UP8/wbqzhUuR46nXRRBopOJE998P
         SQ1HRgZncYJ7ilg3dWerLLr80O+C3HohUbPCLhupKsEj2DGilqMIQKlr399SVAG15EcX
         cwxQhCpOE0Yo7e4YdnxmiQHuaSRjDkuQLkhSJRN7fAWwxRjqL6UBVPRhQln8TQYpnEAe
         Zy3ZhagZr+J/DrpTkd3uyREQQEL1hKDmpJiphP4qzcy3dcFednl8zPgdyc+g7+ATm01A
         Ea7guNgyrlmJNPPKFlqxUEt3B1rOCLlBj3J5Ocy/CIzppKY1rJd5Ybzqy3Kg8QW0MtSF
         0R6Q==
X-Gm-Message-State: APjAAAUvCrRVOBsyBYX4SbIchnEY0qxou9q5xj2wrgjjPDxNR4bFelFt
        arlWSXNadVxdFHn+YFYFJgmDhkEu
X-Google-Smtp-Source: APXvYqxwqV+fBOGw+eJ6rCNRh2cTmmAeFWN702YDio8j0n82ALE7PHAup8Y1gnUfEWJn0U+AhKmBZw==
X-Received: by 2002:a17:902:9308:: with SMTP id bc8mr7320246plb.73.1569400078451;
        Wed, 25 Sep 2019 01:27:58 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.88])
        by smtp.gmail.com with ESMTPSA id e10sm7789346pfh.77.2019.09.25.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 01:27:58 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v7 2/2] vivid: fixes for v4l2-compliance issues.
Date:   Wed, 25 Sep 2019 13:57:30 +0530
Message-Id: <20190925082730.15550-3-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925082730.15550-1-bnvandana@gmail.com>
References: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
 <20190925082730.15550-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil@xs4all.nl>

This patch fixes v4l2-compliance issues seen on metadata device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/vivid/vivid-core.c     | 16 +++++++++++++++-
 drivers/media/platform/vivid/vivid-meta-cap.c |  2 +-
 drivers/media/platform/vivid/vivid-vid-cap.c  |  5 ++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c7d317f45fc0..97ab197bdec0 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -897,9 +897,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 				     V4L2_CAP_READWRITE;
 
 	/* set up the capabilities of meta capture device */
-	if (dev->has_meta_cap)
+	if (dev->has_meta_cap) {
 		dev->meta_cap_caps = V4L2_CAP_META_CAPTURE |
 				     V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+		if (dev->has_audio_inputs)
+			dev->meta_cap_caps |= V4L2_CAP_AUDIO;
+		if (in_type_counter[TV])
+			dev->meta_cap_caps |= V4L2_CAP_TUNER;
+	}
 
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
@@ -960,6 +965,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_AUDIO);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_AUDIO);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_ENUMAUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
 	}
 	if (!dev->has_audio_outputs) {
 		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
@@ -985,12 +993,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_FREQUENCY);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_FREQUENCY);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
 	}
 	if (!has_tuner) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_G_TUNER);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
 	}
 	if (in_type_counter[HDMI] == 0) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
@@ -1016,6 +1028,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
@@ -1552,6 +1565,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		vfd->v4l2_dev = &dev->v4l2_dev;
 		vfd->queue = &dev->vb_meta_cap_q;
 		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_cap;
 		video_set_drvdata(vfd, dev);
 #ifdef CONFIG_MEDIA_CONTROLLER
 		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
diff --git a/drivers/media/platform/vivid/vivid-meta-cap.c b/drivers/media/platform/vivid/vivid-meta-cap.c
index e3241d602b7a..b2f42c09abe1 100644
--- a/drivers/media/platform/vivid/vivid-meta-cap.c
+++ b/drivers/media/platform/vivid/vivid-meta-cap.c
@@ -135,7 +135,7 @@ int vidioc_enum_fmt_meta_cap(struct file *file, void  *priv,
 	struct vivid_dev *dev = video_drvdata(file);
 
 	if (!vivid_is_webcam(dev))
-		return -ENODATA;
+		return -EINVAL;
 
 	if (f->index > 0)
 		return -EINVAL;
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 2d030732feac..e94beef008c8 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -1356,7 +1356,9 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	if (i == dev->input)
 		return 0;
 
-	if (vb2_is_busy(&dev->vb_vid_cap_q) || vb2_is_busy(&dev->vb_vbi_cap_q))
+	if (vb2_is_busy(&dev->vb_vid_cap_q) ||
+	    vb2_is_busy(&dev->vb_vbi_cap_q) ||
+	    vb2_is_busy(&dev->vb_meta_cap_q))
 		return -EBUSY;
 
 	dev->input = i;
@@ -1366,6 +1368,7 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 		dev->vid_cap_dev.tvnorms = V4L2_STD_ALL;
 	}
 	dev->vbi_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
+	dev->meta_cap_dev.tvnorms = dev->vid_cap_dev.tvnorms;
 	vivid_update_format_cap(dev, false);
 
 	if (dev->colorspace) {
-- 
2.17.1

