Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE0EAFA06
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 12:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfIKKKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 06:10:43 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39681 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfIKKKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 06:10:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so11276987pgi.6
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2019 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NcrM/XW8VSdE6ZMchudPpWPmZdQmTaSIJ4Stsr3drdA=;
        b=eejGZIuz2oKUgfj8/+KpRuWUioymZI6c7eHuIyKH75/0ATwHMR3cz6DeRbPioNRD52
         68LZnjr20CZSERV2Ui8GH4RSPI0Ej3HKJ6e3B8+mql2tTEvZo/8d/edz9Kj8LneI2pk4
         /NU0TsoHMG2gzOU5bbrsE83zbtHEVBiMrfvw2bB9iomMTPG5x182gR7uluayUcDl4Mcx
         sTRRcSurcHtsEZSF3dtBtgfrADQHgkTE0Lrvp5GHxXwuNLAzQU3jvGzdjQPm2vlJovEP
         onh3otE/SrcpmRTBvrhsmc7VhYALZf8Av6yxPrKN19fjm1j5WzwExpRRcXiDVVlPGzfH
         aB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NcrM/XW8VSdE6ZMchudPpWPmZdQmTaSIJ4Stsr3drdA=;
        b=Di0PZlmOBix3fBmnhgDmDJXVNoG4NKdu2dhbULpDn3VLg8ALr2KVZXwL1FgSiLa8GK
         3OoLke1Goyzac7aXhcoVRLAVS/e8z8FAVLfKYA9DLB1tdQ7EOyPZNR2U8ubQjFXTSHt/
         H+RYVTZUp1gu8Hu90LDK/KegR83Us8qmg+GNnZwgF4VQUe/EQ6Hatc0VolQ85fr93Odq
         nwus8cyPM5yvptxPHvT0RP7jo60ElVpfUIqZKkCYbkxUowfC4TaFg01AxE9ujgDuO0qL
         uqeBBs908blPfdVCdBeabYCMw696L6CTLVj7uR9AVIIrHvuHFA3qPR76yzTEpOc3Rlyk
         U57A==
X-Gm-Message-State: APjAAAUIHbVt3LrhqUg6Sqf07zTXhS2IK+/BBrj1lHZU/fBtBKD47wX4
        ZL9aDo8SB+/gbsiyhuGwmaY=
X-Google-Smtp-Source: APXvYqxQiFzomOq/vwiZKafTRq6yFbsz2b79PNblMsfRYc9BgekgM/AdSCkiMwj2gmfLGFqow2WbvQ==
X-Received: by 2002:aa7:9343:: with SMTP id 3mr41020390pfn.145.1568196642479;
        Wed, 11 Sep 2019 03:10:42 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.204.191])
        by smtp.gmail.com with ESMTPSA id 143sm18421903pgc.6.2019.09.11.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 03:10:41 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] uvc/vsp1/ipu3: use VFL_TYPE_METADATA for metadata device.
Date:   Wed, 11 Sep 2019 15:40:23 +0530
Message-Id: <20190911101023.29003-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vfl_type VFL_TYPE_METADATA instead of VFL_TYPE_GRABBER for metadata device.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/platform/vsp1/vsp1_histo.c | 4 ++--
 drivers/media/usb/uvc/uvc_driver.c       | 4 +++-
 drivers/staging/media/ipu3/ipu3-v4l2.c   | 8 +++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/vsp1/vsp1_histo.c
index 30d751f2cccf..1e1429817758 100644
--- a/drivers/media/platform/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/vsp1/vsp1_histo.c
@@ -551,7 +551,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 	histo->video.fops = &histo_v4l2_fops;
 	snprintf(histo->video.name, sizeof(histo->video.name),
 		 "%s histo", histo->entity.subdev.name);
-	histo->video.vfl_type = VFL_TYPE_GRABBER;
+	histo->video.vfl_type = VFL_TYPE_METADATA;
 	histo->video.release = video_device_release_empty;
 	histo->video.ioctl_ops = &histo_v4l2_ioctl_ops;
 	histo->video.device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
@@ -576,7 +576,7 @@ int vsp1_histogram_init(struct vsp1_device *vsp1, struct vsp1_histogram *histo,
 
 	/* ... and register the video device. */
 	histo->video.queue = &histo->queue;
-	ret = video_register_device(&histo->video, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(&histo->video, VFL_TYPE_METADATA, -1);
 	if (ret < 0) {
 		dev_err(vsp1->dev, "failed to register video device\n");
 		goto error;
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 66ee168ddc7e..cf2e23238268 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1942,6 +1942,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
 	int ret;
+	int vfl_type = VFL_TYPE_GRABBER;
 
 	/* Initialize the video buffers queue. */
 	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
@@ -1975,6 +1976,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		vfl_type = VFL_TYPE_METADATA;
 		break;
 	}
 
@@ -1986,7 +1988,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	 */
 	video_set_drvdata(vdev, stream);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, vfl_type, -1);
 	if (ret < 0) {
 		uvc_printk(KERN_ERR, "Failed to register %s device (%d).\n",
 			   v4l2_type_names[type], ret);
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed434..56fab0de4342 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -1245,7 +1245,13 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	vdev->queue = &node->vbq;
 	vdev->vfl_dir = node->output ? VFL_DIR_TX : VFL_DIR_RX;
 	video_set_drvdata(vdev, imgu);
-	r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+
+	if (vbq->type == V4L2_BUF_TYPE_META_CAPTURE ||
+	    vbq->type == V4L2_BUF_TYPE_META_OUTPUT)
+		r = video_register_device(vdev, VFL_TYPE_METADATA, -1);
+	else
+		r = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+
 	if (r) {
 		dev_err(dev, "failed to register video device (%d)", r);
 		media_entity_cleanup(&vdev->entity);
-- 
2.17.1

