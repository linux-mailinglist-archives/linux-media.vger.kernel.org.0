Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B1C4598DF
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbhKWAEY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhKWADs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:48 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B01C06175E
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:37 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso594591wms.3
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D3axH8ge32Jqy1teSAzH+Oc/5EGMfinICo5RgkR4VMU=;
        b=khY+uZqnPAN2czfdT7PrANh+YhmupRdExWcLPcIrg3uxtWthfjBOEQWpEUBeSjMhR5
         FheJLTQrWfcu5hO3Lea8xFmwL+9IM7S8dZ80PoaySnqmWnElUpOontLAGUBdd4pFjJHf
         vYidXrtnO6mY9zKYJDoKVzD2bqpFfIzqYSKmXbpyslO5yeQzg6YQeF9IhuDSlnwUOnCL
         tO9WvWYyHbbolxGIeOoxbp1VVFHxhm4bzQX+lWG6xIP4nyFbTaCuhbDcN7ERR34UJ7i6
         /6l3GHZdMkulTM5yl/5kqXN85Q4I5isZJJRwc12vI5BCV1xk35eP3NzCzaHKVD1QESCn
         /5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D3axH8ge32Jqy1teSAzH+Oc/5EGMfinICo5RgkR4VMU=;
        b=urXx/bwcIu+aRea1ZuxZxVN1a4Wrsy00IwM1Spq1Ioi+Z+I8eS4jZ9kS5pquCJEYOw
         o85gWA5eGUYxW/BcDQqd6FdK9mn8phs4DU3Bfoub9LhfAWUkS3WpKfHHfXeNXW9ZoB40
         1Rgc9OBXBd8k2Y5zrJpkQ5uyKDc0wFh0m4hTsysg5Bs3Kc5edMMAXJhnuD7YyDOx63hh
         HsIUNuZcLpDlEW/xIb1hdgZuLfDe8Y74xJf0MJVdu7/U8oVXla6EpMnAd0bjVjyuZLcA
         TJld54FfYMt9DPUTvLagiSrSKkpVLmS3yqLYYPTpS0IkJsrLxhIGizbT5bcwYhyl6bDx
         ce0g==
X-Gm-Message-State: AOAM533vYZW2L6OLGD8Yl4K6xUQIcIDCOMpR4LS42+rfCSnyntvNXhQz
        vCCUdBPuv/7qGgXE0jgnjovUwZ5EL8I=
X-Google-Smtp-Source: ABdhPJzzjm/tQKdBBg4NtHxIgGb2vs0/Vm++lP+GCcohOZaHOe5Sr2417vzSVJQMmHjrbVG/yVqMGA==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr1548399wmp.52.1637625635659;
        Mon, 22 Nov 2021 16:00:35 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:35 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 12/17] media: i2c: cap exposure at height + vblank in ov8865
Date:   Tue, 23 Nov 2021 00:00:12 +0000
Message-Id: <20211123000017.43187-13-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exposure limits depend on the total height; when vblank is altered (and
thus the total height is altered), change the exposure limits to reflect
the new cap.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- (JM) Added OV8865_INTEGRATION_TIME_MARGIN to reduce the maximum
	possible exposure, without which setting values within 8 lines of max
	causes an entirely black image.

 drivers/media/i2c/ov8865.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index f4a899e463de..811438c44b58 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -143,6 +143,7 @@
 #define OV8865_EXPOSURE_CTRL_L_REG		0x3502
 #define OV8865_EXPOSURE_CTRL_L(v)		((v) & GENMASK(7, 0))
 #define OV8865_EXPOSURE_GAIN_MANUAL_REG		0x3503
+#define OV8865_INTEGRATION_TIME_MARGIN		8
 
 #define OV8865_GAIN_CTRL_H_REG			0x3508
 #define OV8865_GAIN_CTRL_H(v)			(((v) & GENMASK(12, 8)) >> 8)
@@ -677,6 +678,7 @@ struct ov8865_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2454,6 +2456,20 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int index;
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = sensor->state.mode->output_size_y + ctrl->val -
+			       OV8865_INTEGRATION_TIME_MARGIN;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exposure_max,
+					 sensor->ctrls.exposure->step,
+					 min(sensor->ctrls.exposure->val,
+					     exposure_max));
+	}
+
 	/* Wait for the sensor to be on before setting controls. */
 	if (pm_runtime_suspended(sensor->dev))
 		return 0;
@@ -2510,8 +2526,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
-			  512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
+					    1048575, 16, 512);
 
 	/* Gain */
 
@@ -2700,6 +2716,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	u32 mbus_code = 0;
 	unsigned int hblank;
 	unsigned int index;
+	int exposure_max;
 	int ret = 0;
 
 	mutex_lock(&sensor->mutex);
@@ -2747,6 +2764,13 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
 				 hblank);
 
+	exposure_max = mode->vts - OV8865_INTEGRATION_TIME_MARGIN;
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum, exposure_max,
+				 sensor->ctrls.exposure->step,
+				 min(sensor->ctrls.exposure->val,
+				     exposure_max));
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

