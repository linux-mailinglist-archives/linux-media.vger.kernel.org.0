Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949A6502CD4
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 17:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243482AbiDOPdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 11:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355263AbiDOPbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 11:31:32 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30C4D64D4;
        Fri, 15 Apr 2022 08:28:47 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4682BE0015;
        Fri, 15 Apr 2022 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650036526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2fzMXFp7GnA/U7fJH8F1ljdEdR1zvqkYmKc5yUNRwl4=;
        b=fpB1K5LTTcVbPKdCHve3eIu0vkvgvWZeB3hOjMqWe1HHGUmBeR0XYc0f7MVKk+lzTEMRve
        h/VGQeA2SltQJhx5Zfi87uBAbP3PqidNBNXc6ZUPns4U8ghf4tR1ET/ivGsfXBtdzSuoue
        zhqunrOLpRS+4/3IeEDl1o5FXRVjo2IMMVfrJZb7W+0Rm4axQSnN2xc+iq9AVspBIBZSJ/
        BWZvB9RkuVqxTE341RWCVfEnTgtpRrZm9B9lya3CckThejGzFodtsP+YBTxDwyx/ZpPDiz
        T7TZwxEfQ7x9Cty88rgnMDJ98qDvFNRcMXh7TWhY9pU0XieKI00fjO6o8kuJTQ==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 23/45] media: sun6i-csi: Move power management to runtime pm in capture
Date:   Fri, 15 Apr 2022 17:27:49 +0200
Message-Id: <20220415152811.636419-24-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Let's just enable the module when we start using it (at stream on)
and benefit from runtime pm instead of enabling it at first open.

Also reorder the call to v4l2_pipeline_pm_get.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 24 -----------
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  7 ----
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 41 ++++++++++---------
 3 files changed, 22 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 29892e8c2b9d..7801f5abe47e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -148,30 +148,6 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
 	return false;
 }
 
-int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable)
-{
-	struct device *dev = csi_dev->dev;
-	struct regmap *regmap = csi_dev->regmap;
-	int ret;
-
-	if (!enable) {
-		regmap_update_bits(regmap, SUN6I_CSI_EN_REG,
-				   SUN6I_CSI_EN_CSI_EN, 0);
-		pm_runtime_put(dev);
-
-		return 0;
-	}
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		return ret;
-
-	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN,
-			   SUN6I_CSI_EN_CSI_EN);
-
-	return 0;
-}
-
 static enum csi_input_fmt get_csi_input_format(struct sun6i_csi_device *csi_dev,
 					       u32 mbus_code, u32 pixformat)
 {
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index 155527961280..3a4f2b45d267 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -77,13 +77,6 @@ struct sun6i_csi_variant {
 bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
 				   u32 pixformat, u32 mbus_code);
 
-/**
- * sun6i_csi_set_power() - power on/off the csi
- * @csi:	pointer to the csi
- * @enable:	on/off
- */
-int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable);
-
 /**
  * sun6i_csi_update_config() - update the csi register settings
  * @csi:	pointer to the csi
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 72fcc60d2695..3e5c4f7df48d 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <media/v4l2-device.h>
@@ -141,6 +142,9 @@ static void sun6i_csi_capture_enable(struct sun6i_csi_device *csi_dev)
 {
 	struct regmap *regmap = csi_dev->regmap;
 
+	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN,
+			   SUN6I_CSI_EN_CSI_EN);
+
 	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, SUN6I_CSI_CAP_VCAP_ON,
 			   SUN6I_CSI_CAP_VCAP_ON);
 }
@@ -150,6 +154,7 @@ static void sun6i_csi_capture_disable(struct sun6i_csi_device *csi_dev)
 	struct regmap *regmap = csi_dev->regmap;
 
 	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, SUN6I_CSI_CAP_VCAP_ON, 0);
+	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN, 0);
 }
 
 static void
@@ -382,6 +387,7 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
 	struct sun6i_csi_capture_state *state = &capture->state;
 	struct video_device *video_dev = &capture->video_dev;
+	struct device *dev = csi_dev->dev;
 	struct v4l2_subdev *subdev;
 	int ret;
 
@@ -402,6 +408,12 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 		goto error_media_pipeline;
 	}
 
+	/* PM */
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto error_media_pipeline;
+
 	/* Clear */
 
 	sun6i_csi_capture_irq_clear(csi_dev);
@@ -429,6 +441,8 @@ static int sun6i_csi_capture_start_streaming(struct vb2_queue *queue,
 	sun6i_csi_capture_disable(csi_dev);
 	sun6i_csi_capture_irq_disable(csi_dev);
 
+	pm_runtime_put(dev);
+
 error_media_pipeline:
 	media_pipeline_stop(&video_dev->entity);
 
@@ -442,6 +456,7 @@ static void sun6i_csi_capture_stop_streaming(struct vb2_queue *queue)
 {
 	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
+	struct device *dev = csi_dev->dev;
 	struct v4l2_subdev *subdev;
 
 	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
@@ -451,6 +466,8 @@ static void sun6i_csi_capture_stop_streaming(struct vb2_queue *queue)
 	sun6i_csi_capture_disable(csi_dev);
 	sun6i_csi_capture_irq_disable(csi_dev);
 
+	pm_runtime_put(dev);
+
 	media_pipeline_stop(&capture->video_dev.entity);
 
 	sun6i_csi_capture_state_cleanup(csi_dev, true);
@@ -639,27 +656,20 @@ static int sun6i_csi_capture_open(struct file *file)
 	if (mutex_lock_interruptible(&capture->lock))
 		return -ERESTARTSYS;
 
-	ret = v4l2_fh_open(file);
+	ret = v4l2_pipeline_pm_get(&capture->video_dev.entity);
 	if (ret < 0)
 		goto error_lock;
 
-	ret = v4l2_pipeline_pm_get(&capture->video_dev.entity);
+	ret = v4l2_fh_open(file);
 	if (ret < 0)
-		goto error_v4l2_fh;
-
-	/* Power on at first open. */
-	if (v4l2_fh_is_singular_file(file)) {
-		ret = sun6i_csi_set_power(csi_dev, true);
-		if (ret < 0)
-			goto error_v4l2_fh;
-	}
+		goto error_pipeline;
 
 	mutex_unlock(&capture->lock);
 
 	return 0;
 
-error_v4l2_fh:
-	v4l2_fh_release(file);
+error_pipeline:
+	v4l2_pipeline_pm_put(&capture->video_dev.entity);
 
 error_lock:
 	mutex_unlock(&capture->lock);
@@ -671,19 +681,12 @@ static int sun6i_csi_capture_close(struct file *file)
 {
 	struct sun6i_csi_device *csi_dev = video_drvdata(file);
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
-	bool last_close;
 
 	mutex_lock(&capture->lock);
 
-	last_close = v4l2_fh_is_singular_file(file);
-
 	_vb2_fop_release(file, NULL);
 	v4l2_pipeline_pm_put(&capture->video_dev.entity);
 
-	/* Power off at last close. */
-	if (last_close)
-		sun6i_csi_set_power(csi_dev, false);
-
 	mutex_unlock(&capture->lock);
 
 	return 0;
-- 
2.35.2

