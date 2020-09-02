Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454D625B15D
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgIBQSH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:18:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727970AbgIBQKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:48 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6D1D208C7;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=fpks8/wgVNH3xUBKsGhywKHuyIv8sN2aTZ5fHxmheuM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sZm4UigSYItvrgyo3ZQ5jhbMEUIVHtHTwQbKUsSwIaqGhjKsoCQm/vGhYLO5IR5QD
         ltTBCRxT45+x76RlQaeFQBdhxtD4yiLkgOD2wE0MOCvWy+iL8af1uCDIDVdPQ7HkHk
         uQmGMODE9wotHtT5VjPpI2st9L/X2gSn3BlwdhHc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000tA1-S2; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/38] media: vivid: move the detection part out of vivid_create_instance
Date:   Wed,  2 Sep 2020 18:10:12 +0200
Message-Id: <5c740fb631ed95df4b15ea5de43bd9b1a7a53493.1599062230.git.mchehab+huawei@kernel.org>
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

The vivid_create_instance() function is too harry. Smatch can't
process it, because it takes too long.

The detection part is an important piece of it. As such, there
are even comments before and after such block.

So, it makes sense to just move it to a separate function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 151 ++++++++++--------
 1 file changed, 83 insertions(+), 68 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 931218fa955e..d4785da440d9 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -832,56 +832,16 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	return vb2_queue_init(q);
 }
 
-static int vivid_create_instance(struct platform_device *pdev, int inst)
+static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
+				    unsigned node_type,
+				    bool *has_tuner,
+				    bool *has_modulator,
+				    int *ccs_cap,
+				    int *ccs_out,
+				    unsigned in_type_counter[4],
+				    unsigned out_type_counter[4])
 {
-	static const struct v4l2_dv_timings def_dv_timings =
-					V4L2_DV_BT_CEA_1280X720P60;
-	unsigned in_type_counter[4] = { 0, 0, 0, 0 };
-	unsigned out_type_counter[4] = { 0, 0, 0, 0 };
-	int ccs_cap = ccs_cap_mode[inst];
-	int ccs_out = ccs_out_mode[inst];
-	bool has_tuner;
-	bool has_modulator;
-	struct vivid_dev *dev;
-	struct video_device *vfd;
-	unsigned node_type = node_types[inst];
-	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
-	int ret;
 	int i;
-#ifdef CONFIG_VIDEO_VIVID_CEC
-	unsigned int cec_tx_bus_cnt = 0;
-#endif
-
-	/* allocate main vivid state structure */
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev)
-		return -ENOMEM;
-
-	dev->inst = inst;
-
-#ifdef CONFIG_MEDIA_CONTROLLER
-	dev->v4l2_dev.mdev = &dev->mdev;
-
-	/* Initialize media device */
-	strscpy(dev->mdev.model, VIVID_MODULE_NAME, sizeof(dev->mdev.model));
-	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
-		 "platform:%s-%03d", VIVID_MODULE_NAME, inst);
-	dev->mdev.dev = &pdev->dev;
-	media_device_init(&dev->mdev);
-	dev->mdev.ops = &vivid_media_ops;
-#endif
-
-	/* register v4l2_device */
-	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
-			"%s-%03d", VIVID_MODULE_NAME, inst);
-	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
-	if (ret) {
-		kfree(dev);
-		return ret;
-	}
-	dev->v4l2_dev.release = vivid_dev_release;
-
-	/* start detecting feature set */
 
 	/* do we use single- or multi-planar? */
 	dev->multiplanar = multiplanar[inst] > 1;
@@ -947,14 +907,12 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	    !dev->has_vid_cap && !dev->has_meta_cap) {
 		v4l2_warn(&dev->v4l2_dev,
 			  "Webcam or HDMI input without video or metadata nodes\n");
-		kfree(dev);
 		return -EINVAL;
 	}
 	if ((in_type_counter[TV] || in_type_counter[SVID]) &&
 	    !dev->has_vid_cap && !dev->has_vbi_cap && !dev->has_meta_cap) {
 		v4l2_warn(&dev->v4l2_dev,
 			  "TV or S-Video input without video, VBI or metadata nodes\n");
-		kfree(dev);
 		return -EINVAL;
 	}
 
@@ -976,13 +934,11 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	    !dev->has_vid_out && !dev->has_vbi_out && !dev->has_meta_out) {
 		v4l2_warn(&dev->v4l2_dev,
 			  "S-Video output without video, VBI or metadata nodes\n");
-		kfree(dev);
 		return -EINVAL;
 	}
 	if (out_type_counter[HDMI] && !dev->has_vid_out && !dev->has_meta_out) {
 		v4l2_warn(&dev->v4l2_dev,
 			  "HDMI output without video or metadata nodes\n");
-		kfree(dev);
 		return -EINVAL;
 	}
 
@@ -999,25 +955,25 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	dev->has_tv_tuner = in_type_counter[TV];
 
 	/* do we have a tuner? */
-	has_tuner = ((dev->has_vid_cap || dev->has_vbi_cap) && in_type_counter[TV]) ||
-		    dev->has_radio_rx || dev->has_sdr_cap;
+	*has_tuner = ((dev->has_vid_cap || dev->has_vbi_cap) && in_type_counter[TV]) ||
+		      dev->has_radio_rx || dev->has_sdr_cap;
 
 	/* do we have a modulator? */
-	has_modulator = dev->has_radio_tx;
+	*has_modulator = dev->has_radio_tx;
 
 	if (dev->has_vid_cap)
 		/* do we have a framebuffer for overlay testing? */
 		dev->has_fb = node_type & 0x10000;
 
 	/* can we do crop/compose/scaling while capturing? */
-	if (no_error_inj && ccs_cap == -1)
-		ccs_cap = 7;
+	if (no_error_inj && *ccs_cap == -1)
+		*ccs_cap = 7;
 
 	/* if ccs_cap == -1, then the user can select it using controls */
-	if (ccs_cap != -1) {
-		dev->has_crop_cap = ccs_cap & 1;
-		dev->has_compose_cap = ccs_cap & 2;
-		dev->has_scaler_cap = ccs_cap & 4;
+	if (*ccs_cap != -1) {
+		dev->has_crop_cap = *ccs_cap & 1;
+		dev->has_compose_cap = *ccs_cap & 2;
+		dev->has_scaler_cap = *ccs_cap & 4;
 		v4l2_info(&dev->v4l2_dev, "Capture Crop: %c Compose: %c Scaler: %c\n",
 			dev->has_crop_cap ? 'Y' : 'N',
 			dev->has_compose_cap ? 'Y' : 'N',
@@ -1025,14 +981,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	}
 
 	/* can we do crop/compose/scaling with video output? */
-	if (no_error_inj && ccs_out == -1)
-		ccs_out = 7;
+	if (no_error_inj && *ccs_out == -1)
+		*ccs_out = 7;
 
 	/* if ccs_out == -1, then the user can select it using controls */
-	if (ccs_out != -1) {
-		dev->has_crop_out = ccs_out & 1;
-		dev->has_compose_out = ccs_out & 2;
-		dev->has_scaler_out = ccs_out & 4;
+	if (*ccs_out != -1) {
+		dev->has_crop_out = *ccs_out & 1;
+		dev->has_compose_out = *ccs_out & 2;
+		dev->has_scaler_out = *ccs_out & 4;
 		v4l2_info(&dev->v4l2_dev, "Output Crop: %c Compose: %c Scaler: %c\n",
 			dev->has_crop_out ? 'Y' : 'N',
 			dev->has_compose_out ? 'Y' : 'N',
@@ -1042,7 +998,66 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	/* do we create a touch capture device */
 	dev->has_touch_cap = node_type & 0x80000;
 
-	/* end detecting feature set */
+	return 0;
+}
+
+static int vivid_create_instance(struct platform_device *pdev, int inst)
+{
+	static const struct v4l2_dv_timings def_dv_timings =
+					V4L2_DV_BT_CEA_1280X720P60;
+	unsigned in_type_counter[4] = { 0, 0, 0, 0 };
+	unsigned out_type_counter[4] = { 0, 0, 0, 0 };
+	int ccs_cap = ccs_cap_mode[inst];
+	int ccs_out = ccs_out_mode[inst];
+	bool has_tuner;
+	bool has_modulator;
+	struct vivid_dev *dev;
+	struct video_device *vfd;
+	unsigned node_type = node_types[inst];
+	v4l2_std_id tvnorms_cap = 0, tvnorms_out = 0;
+	int ret;
+	int i;
+#ifdef CONFIG_VIDEO_VIVID_CEC
+	unsigned int cec_tx_bus_cnt = 0;
+#endif
+
+	/* allocate main vivid state structure */
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->inst = inst;
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	dev->v4l2_dev.mdev = &dev->mdev;
+
+	/* Initialize media device */
+	strscpy(dev->mdev.model, VIVID_MODULE_NAME, sizeof(dev->mdev.model));
+	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
+		 "platform:%s-%03d", VIVID_MODULE_NAME, inst);
+	dev->mdev.dev = &pdev->dev;
+	media_device_init(&dev->mdev);
+	dev->mdev.ops = &vivid_media_ops;
+#endif
+
+	/* register v4l2_device */
+	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
+			"%s-%03d", VIVID_MODULE_NAME, inst);
+	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		kfree(dev);
+		return ret;
+	}
+	dev->v4l2_dev.release = vivid_dev_release;
+
+	ret = vivid_detect_feature_set(dev, inst, node_type,
+				       &has_tuner, &has_modulator,
+				       &ccs_cap, &ccs_out,
+				       in_type_counter, out_type_counter);
+	if (ret) {
+		kfree(dev);
+		return ret;
+	}
 
 	if (dev->has_vid_cap) {
 		/* set up the capabilities of the video capture device */
-- 
2.26.2

