Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4555D25B128
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgIBQNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728303AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D97D520C56;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=KwVlb9jXQVsTVDCwEJ3VRaXpsjBUKtkFKKDHPsqYn9A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xc6+jjJ2YLvdP1dZKe9voVuwNa3SZMEK+MYtdrM0i1d811hrTGS8hqZkPL7Gck0vR
         dMA69pT/bT6/laJG7498EgOgPYiG4nRkgvItEkNRtgd42y1wZRKn6YdM9GUWuSyWK7
         6TgCyQ7rvjxqATyI8R3hLhX2+GZjL8dwryUUjIQA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tAH-0b; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/38] media: vivid: move the devnode creation logic to a separate function
Date:   Wed,  2 Sep 2020 18:10:17 +0200
Message-Id: <b3660cd8e25735280461fe21d438b87e33ec4395.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to reduce even further the size of the big
vivid_create_instance() function, let's place the part of the
logic which creates the device nodes into a separate function.

    With this and the past patches, those warnings finally
    vanishes:

            drivers/media/test-drivers/vivid/vivid-core.c: drivers/media/test-drivers/vivid/vivid-core.c:1189 vivid_create_instance() parse error: turning off implications after 60 seconds
            drivers/media/test-drivers/vivid/vivid-core.c: drivers/media/test-drivers/vivid/vivid-core.c:1257 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 303 seconds

The init code also seems more organized after breaking the long
function into a smaller set.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 670 +++++++++---------
 1 file changed, 344 insertions(+), 326 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 69cc8456a323..54df7e0c13fc 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1306,6 +1306,346 @@ static int vivid_create_queues(struct vivid_dev *dev)
 	return 0;
 }
 
+static int vivid_create_devnodes(struct platform_device *pdev,
+				 struct vivid_dev *dev, int inst,
+				 unsigned int cec_tx_bus_cnt,
+				 v4l2_std_id tvnorms_cap,
+				 v4l2_std_id tvnorms_out,
+				 unsigned in_type_counter[4],
+				 unsigned out_type_counter[4])
+{
+	struct video_device *vfd;
+	int ret, i;
+
+	if (dev->has_vid_cap) {
+		vfd = &dev->vid_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vid-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->vid_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_vid_cap_q;
+		vfd->tvnorms = tvnorms_cap;
+
+		/*
+		 * Provide a mutex to v4l2 core. It will be used to protect
+		 * all fops and v4l2 ioctls.
+		 */
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->vid_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vid_cap_pad);
+		if (ret)
+			return ret;
+#endif
+
+#ifdef CONFIG_VIDEO_VIVID_CEC
+		if (in_type_counter[HDMI]) {
+			ret = cec_register_adapter(dev->cec_rx_adap, &pdev->dev);
+			if (ret < 0) {
+				cec_delete_adapter(dev->cec_rx_adap);
+				dev->cec_rx_adap = NULL;
+				return ret;
+			}
+			cec_s_phys_addr(dev->cec_rx_adap, 0, false);
+			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input 0\n",
+				  dev_name(&dev->cec_rx_adap->devnode.dev));
+		}
+#endif
+
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_cap_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s\n",
+					  video_device_node_name(vfd));
+	}
+
+	if (dev->has_vid_out) {
+		vfd = &dev->vid_out_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vid-out", inst);
+		vfd->vfl_dir = VFL_DIR_TX;
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->vid_out_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_vid_out_q;
+		vfd->tvnorms = tvnorms_out;
+
+		/*
+		 * Provide a mutex to v4l2 core. It will be used to protect
+		 * all fops and v4l2 ioctls.
+		 */
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->vid_out_pad.flags = MEDIA_PAD_FL_SOURCE;
+		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vid_out_pad);
+		if (ret)
+			return ret;
+#endif
+
+#ifdef CONFIG_VIDEO_VIVID_CEC
+		for (i = 0; i < cec_tx_bus_cnt; i++) {
+			ret = cec_register_adapter(dev->cec_tx_adap[i], &pdev->dev);
+			if (ret < 0) {
+				for (; i < cec_tx_bus_cnt; i++) {
+					cec_delete_adapter(dev->cec_tx_adap[i]);
+					dev->cec_tx_adap[i] = NULL;
+				}
+				return ret;
+			}
+			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
+				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
+			if (i < out_type_counter[HDMI])
+				cec_s_phys_addr(dev->cec_tx_adap[i], (i + 1) << 12, false);
+			else
+				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
+		}
+#endif
+
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_out_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 output device registered as %s\n",
+					  video_device_node_name(vfd));
+	}
+
+	if (dev->has_vbi_cap) {
+		vfd = &dev->vbi_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vbi-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->vbi_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_vbi_cap_q;
+		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_cap;
+		video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->vbi_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vbi_cap_pad);
+		if (ret)
+			return ret;
+#endif
+
+		ret = video_register_device(vfd, VFL_TYPE_VBI, vbi_cap_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s, supports %s VBI\n",
+					  video_device_node_name(vfd),
+					  (dev->has_raw_vbi_cap && dev->has_sliced_vbi_cap) ?
+					  "raw and sliced" :
+					  (dev->has_raw_vbi_cap ? "raw" : "sliced"));
+	}
+
+	if (dev->has_vbi_out) {
+		vfd = &dev->vbi_out_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-vbi-out", inst);
+		vfd->vfl_dir = VFL_DIR_TX;
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->vbi_out_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_vbi_out_q;
+		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_out;
+		video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->vbi_out_pad.flags = MEDIA_PAD_FL_SOURCE;
+		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vbi_out_pad);
+		if (ret)
+			return ret;
+#endif
+
+		ret = video_register_device(vfd, VFL_TYPE_VBI, vbi_out_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 output device registered as %s, supports %s VBI\n",
+					  video_device_node_name(vfd),
+					  (dev->has_raw_vbi_out && dev->has_sliced_vbi_out) ?
+					  "raw and sliced" :
+					  (dev->has_raw_vbi_out ? "raw" : "sliced"));
+	}
+
+	if (dev->has_sdr_cap) {
+		vfd = &dev->sdr_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-sdr-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->sdr_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_sdr_cap_q;
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->sdr_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1, &dev->sdr_cap_pad);
+		if (ret)
+			return ret;
+#endif
+
+		ret = video_register_device(vfd, VFL_TYPE_SDR, sdr_cap_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s\n",
+					  video_device_node_name(vfd));
+	}
+
+	if (dev->has_radio_rx) {
+		vfd = &dev->radio_rx_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-rad-rx", inst);
+		vfd->fops = &vivid_radio_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->radio_rx_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+
+		ret = video_register_device(vfd, VFL_TYPE_RADIO, radio_rx_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 receiver device registered as %s\n",
+					  video_device_node_name(vfd));
+	}
+
+	if (dev->has_radio_tx) {
+		vfd = &dev->radio_tx_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-rad-tx", inst);
+		vfd->vfl_dir = VFL_DIR_TX;
+		vfd->fops = &vivid_radio_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->radio_tx_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+
+		ret = video_register_device(vfd, VFL_TYPE_RADIO, radio_tx_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev, "V4L2 transmitter device registered as %s\n",
+					  video_device_node_name(vfd));
+	}
+
+	if (dev->has_meta_cap) {
+		vfd = &dev->meta_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-meta-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->meta_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_meta_cap_q;
+		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_cap;
+		video_set_drvdata(vfd, dev);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1,
+					     &dev->meta_cap_pad);
+		if (ret)
+			return ret;
+#endif
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
+					    meta_cap_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev,
+			  "V4L2 metadata capture device registered as %s\n",
+			  video_device_node_name(vfd));
+	}
+
+	if (dev->has_meta_out) {
+		vfd = &dev->meta_out_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-meta-out", inst);
+		vfd->vfl_dir = VFL_DIR_TX;
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->meta_out_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_meta_out_q;
+		vfd->lock = &dev->mutex;
+		vfd->tvnorms = tvnorms_out;
+		video_set_drvdata(vfd, dev);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->meta_out_pad.flags = MEDIA_PAD_FL_SOURCE;
+		ret = media_entity_pads_init(&vfd->entity, 1,
+					     &dev->meta_out_pad);
+		if (ret)
+			return ret;
+#endif
+		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
+					    meta_out_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev,
+			  "V4L2 metadata output device registered as %s\n",
+			  video_device_node_name(vfd));
+	}
+
+	if (dev->has_touch_cap) {
+		vfd = &dev->touch_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-touch-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->touch_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_touch_cap_q;
+		vfd->tvnorms = tvnorms_cap;
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->touch_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1,
+					     &dev->touch_cap_pad);
+		if (ret)
+			return ret;
+#endif
+		ret = video_register_device(vfd, VFL_TYPE_TOUCH,
+					    touch_cap_nr[inst]);
+		if (ret < 0)
+			return ret;
+		v4l2_info(&dev->v4l2_dev,
+			  "V4L2 touch capture device registered as %s\n",
+			  video_device_node_name(vfd));
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	/* Register the media device */
+	ret = media_device_register(&dev->mdev);
+	if (ret) {
+		dev_err(dev->mdev.dev,
+			"media device register failed (err=%d)\n", ret);
+		return ret;
+	}
+#endif
+	return 0;
+}
+
 static int vivid_create_instance(struct platform_device *pdev, int inst)
 {
 	static const struct v4l2_dv_timings def_dv_timings =
@@ -1317,7 +1657,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	bool has_tuner;
 	bool has_modulator;
 	struct vivid_dev *dev;
-	struct video_device *vfd;
 	unsigned node_type = node_types[inst];
 	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
 	int ret;
@@ -1545,332 +1884,11 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_touch_cap);
 
 	/* finally start creating the device nodes */
-	if (dev->has_vid_cap) {
-		vfd = &dev->vid_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vid-cap", inst);
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->vid_cap_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_vid_cap_q;
-		vfd->tvnorms = tvnorms_cap;
-
-		/*
-		 * Provide a mutex to v4l2 core. It will be used to protect
-		 * all fops and v4l2 ioctls.
-		 */
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->vid_cap_pad.flags = MEDIA_PAD_FL_SINK;
-		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vid_cap_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-
-#ifdef CONFIG_VIDEO_VIVID_CEC
-		if (in_type_counter[HDMI]) {
-			ret = cec_register_adapter(dev->cec_rx_adap, &pdev->dev);
-			if (ret < 0) {
-				cec_delete_adapter(dev->cec_rx_adap);
-				dev->cec_rx_adap = NULL;
-				goto unreg_dev;
-			}
-			cec_s_phys_addr(dev->cec_rx_adap, 0, false);
-			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI input 0\n",
-				  dev_name(&dev->cec_rx_adap->devnode.dev));
-		}
-#endif
-
-		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_cap_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s\n",
-					  video_device_node_name(vfd));
-	}
-
-	if (dev->has_vid_out) {
-		vfd = &dev->vid_out_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vid-out", inst);
-		vfd->vfl_dir = VFL_DIR_TX;
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->vid_out_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_vid_out_q;
-		vfd->tvnorms = tvnorms_out;
-
-		/*
-		 * Provide a mutex to v4l2 core. It will be used to protect
-		 * all fops and v4l2 ioctls.
-		 */
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->vid_out_pad.flags = MEDIA_PAD_FL_SOURCE;
-		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vid_out_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-
-#ifdef CONFIG_VIDEO_VIVID_CEC
-		for (i = 0; i < cec_tx_bus_cnt; i++) {
-			ret = cec_register_adapter(dev->cec_tx_adap[i], &pdev->dev);
-			if (ret < 0) {
-				for (; i < cec_tx_bus_cnt; i++) {
-					cec_delete_adapter(dev->cec_tx_adap[i]);
-					dev->cec_tx_adap[i] = NULL;
-				}
-				goto unreg_dev;
-			}
-			v4l2_info(&dev->v4l2_dev, "CEC adapter %s registered for HDMI output %d\n",
-				  dev_name(&dev->cec_tx_adap[i]->devnode.dev), i);
-			if (i < out_type_counter[HDMI])
-				cec_s_phys_addr(dev->cec_tx_adap[i], (i + 1) << 12, false);
-			else
-				cec_s_phys_addr(dev->cec_tx_adap[i], 0x1000, false);
-		}
-#endif
-
-		ret = video_register_device(vfd, VFL_TYPE_VIDEO, vid_out_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 output device registered as %s\n",
-					  video_device_node_name(vfd));
-	}
-
-	if (dev->has_vbi_cap) {
-		vfd = &dev->vbi_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vbi-cap", inst);
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->vbi_cap_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_vbi_cap_q;
-		vfd->lock = &dev->mutex;
-		vfd->tvnorms = tvnorms_cap;
-		video_set_drvdata(vfd, dev);
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->vbi_cap_pad.flags = MEDIA_PAD_FL_SINK;
-		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vbi_cap_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-
-		ret = video_register_device(vfd, VFL_TYPE_VBI, vbi_cap_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s, supports %s VBI\n",
-					  video_device_node_name(vfd),
-					  (dev->has_raw_vbi_cap && dev->has_sliced_vbi_cap) ?
-					  "raw and sliced" :
-					  (dev->has_raw_vbi_cap ? "raw" : "sliced"));
-	}
-
-	if (dev->has_vbi_out) {
-		vfd = &dev->vbi_out_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-vbi-out", inst);
-		vfd->vfl_dir = VFL_DIR_TX;
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->vbi_out_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_vbi_out_q;
-		vfd->lock = &dev->mutex;
-		vfd->tvnorms = tvnorms_out;
-		video_set_drvdata(vfd, dev);
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->vbi_out_pad.flags = MEDIA_PAD_FL_SOURCE;
-		ret = media_entity_pads_init(&vfd->entity, 1, &dev->vbi_out_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-
-		ret = video_register_device(vfd, VFL_TYPE_VBI, vbi_out_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 output device registered as %s, supports %s VBI\n",
-					  video_device_node_name(vfd),
-					  (dev->has_raw_vbi_out && dev->has_sliced_vbi_out) ?
-					  "raw and sliced" :
-					  (dev->has_raw_vbi_out ? "raw" : "sliced"));
-	}
-
-	if (dev->has_sdr_cap) {
-		vfd = &dev->sdr_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-sdr-cap", inst);
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->sdr_cap_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_sdr_cap_q;
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->sdr_cap_pad.flags = MEDIA_PAD_FL_SINK;
-		ret = media_entity_pads_init(&vfd->entity, 1, &dev->sdr_cap_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-
-		ret = video_register_device(vfd, VFL_TYPE_SDR, sdr_cap_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 capture device registered as %s\n",
-					  video_device_node_name(vfd));
-	}
-
-	if (dev->has_radio_rx) {
-		vfd = &dev->radio_rx_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-rad-rx", inst);
-		vfd->fops = &vivid_radio_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->radio_rx_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-
-		ret = video_register_device(vfd, VFL_TYPE_RADIO, radio_rx_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 receiver device registered as %s\n",
-					  video_device_node_name(vfd));
-	}
-
-	if (dev->has_radio_tx) {
-		vfd = &dev->radio_tx_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-rad-tx", inst);
-		vfd->vfl_dir = VFL_DIR_TX;
-		vfd->fops = &vivid_radio_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->radio_tx_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-
-		ret = video_register_device(vfd, VFL_TYPE_RADIO, radio_tx_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev, "V4L2 transmitter device registered as %s\n",
-					  video_device_node_name(vfd));
-	}
-
-	if (dev->has_meta_cap) {
-		vfd = &dev->meta_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-meta-cap", inst);
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->meta_cap_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_meta_cap_q;
-		vfd->lock = &dev->mutex;
-		vfd->tvnorms = tvnorms_cap;
-		video_set_drvdata(vfd, dev);
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->meta_cap_pad.flags = MEDIA_PAD_FL_SINK;
-		ret = media_entity_pads_init(&vfd->entity, 1,
-					     &dev->meta_cap_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
-					    meta_cap_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev,
-			  "V4L2 metadata capture device registered as %s\n",
-			  video_device_node_name(vfd));
-	}
-
-	if (dev->has_meta_out) {
-		vfd = &dev->meta_out_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-meta-out", inst);
-		vfd->vfl_dir = VFL_DIR_TX;
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->meta_out_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_meta_out_q;
-		vfd->lock = &dev->mutex;
-		vfd->tvnorms = tvnorms_out;
-		video_set_drvdata(vfd, dev);
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->meta_out_pad.flags = MEDIA_PAD_FL_SOURCE;
-		ret = media_entity_pads_init(&vfd->entity, 1,
-					     &dev->meta_out_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-		ret = video_register_device(vfd, VFL_TYPE_VIDEO,
-					    meta_out_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev,
-			  "V4L2 metadata output device registered as %s\n",
-			  video_device_node_name(vfd));
-	}
-
-	if (dev->has_touch_cap) {
-		vfd = &dev->touch_cap_dev;
-		snprintf(vfd->name, sizeof(vfd->name),
-			 "vivid-%03d-touch-cap", inst);
-		vfd->fops = &vivid_fops;
-		vfd->ioctl_ops = &vivid_ioctl_ops;
-		vfd->device_caps = dev->touch_cap_caps;
-		vfd->release = video_device_release_empty;
-		vfd->v4l2_dev = &dev->v4l2_dev;
-		vfd->queue = &dev->vb_touch_cap_q;
-		vfd->tvnorms = tvnorms_cap;
-		vfd->lock = &dev->mutex;
-		video_set_drvdata(vfd, dev);
-#ifdef CONFIG_MEDIA_CONTROLLER
-		dev->touch_cap_pad.flags = MEDIA_PAD_FL_SINK;
-		ret = media_entity_pads_init(&vfd->entity, 1,
-					     &dev->touch_cap_pad);
-		if (ret)
-			goto unreg_dev;
-#endif
-		ret = video_register_device(vfd, VFL_TYPE_TOUCH,
-					    touch_cap_nr[inst]);
-		if (ret < 0)
-			goto unreg_dev;
-		v4l2_info(&dev->v4l2_dev,
-			  "V4L2 touch capture device registered as %s\n",
-			  video_device_node_name(vfd));
-	}
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-	/* Register the media device */
-	ret = media_device_register(&dev->mdev);
-	if (ret) {
-		dev_err(dev->mdev.dev,
-			"media device register failed (err=%d)\n", ret);
+	ret = vivid_create_devnodes(pdev, dev, inst, cec_tx_bus_cnt,
+				    tvnorms_cap, tvnorms_out,
+				    in_type_counter, out_type_counter);
+	if (ret)
 		goto unreg_dev;
-	}
-#endif
 
 	/* Now that everything is fine, let's add it to device list */
 	vivid_devs[inst] = dev;
-- 
2.26.2

