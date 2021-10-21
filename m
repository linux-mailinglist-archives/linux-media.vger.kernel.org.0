Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA8D436CEF
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbhJUVq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbhJUVqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:22 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF71BC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i12so1604895wrb.7
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dLvw5T1WDItF4vTR3Zgsm+pRVTM/FpHw0z8/bM9ZpVU=;
        b=Krkre2RdpZa8/7YYOZ+pedJhM0XtWg8/KUgWvvHXLcED+W0u+M8/y9h0sUfAC1/5L2
         Aqj1NkkYppcJdlFZ1BHtPjTk4Q3J0REhZ0ZQkp5dL82EbfSqzYOfi+DKilc4Bv6pbW0J
         PpB8j8us4foChGOZ4YyRiJAy+95esQNp6FAORcJNhyPIIbe1eyjJsosAVAE0lk84zTwI
         YuHNJTzXbXOwL5MNqUDRmveBJqXx8Qzk8P3IXPw4xzxz4fKoNMQ8cJDUsaxFPb0heohd
         EfilEAC3JxzGyykBuLlnWpVRykAjt/CTYan0wXKWep1Xyxg5gvUUm86gawCaAy4JTrwp
         0eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dLvw5T1WDItF4vTR3Zgsm+pRVTM/FpHw0z8/bM9ZpVU=;
        b=kni8rLchhiBF0+/aKVM9vBY/sTQQygWyk4XiOPYIkF1j11nJMGP7feXfxuaKPzbGZi
         GqUSYmE9NT0beDg0prFCygHxpu8UuxtpoUuc2Py2lDZoSZIpg6YUqBWN3Xe9PFoEHpg/
         GrWDesDZ0CQdWPhFk3FM2T9cTgSMUddLdchF/uGLRN9Fbs5Bd0E/z4+QVdb5kImxui5f
         XoG9X7BTKimrVp/ZvFnhWIZsWuVimddSKAbxaiWoJC7nkwKdbZkJhdzFEWYDikkz2Svv
         jT/xo+OkYoMvQ1YGTL3soFNV9I9W/mCn7xN0uPUtZoJWc28bUwkPhBvyZhiyCOrLyywS
         qAVw==
X-Gm-Message-State: AOAM532FNwqJ4lpY/yDFGFfgLaU+ji4czpwwGYlUFibl0rIriEVTZXnw
        6QhN7Fy+EaF2RNDGBhkZ/Vph98VjCDE=
X-Google-Smtp-Source: ABdhPJz8U4zccPlCvQG5V1Sj5Z6mkSyu7J4hdkMMVO1r3h9glJCBmqyYulUO2DMkOI0AQ+Jpk4xVtA==
X-Received: by 2002:a05:6000:1289:: with SMTP id f9mr10516941wrx.192.1634852644550;
        Thu, 21 Oct 2021 14:44:04 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:04 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 10/16] media: i2c: cap exposure at height + vblank in ov8865
Date:   Thu, 21 Oct 2021 22:43:25 +0100
Message-Id: <20211021214331.1188787-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
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
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index dccbc23afd2f..16c5ce80353c 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -677,6 +677,7 @@ struct ov8865_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2454,6 +2455,19 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int index;
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = sensor->state.mode->output_size_y + ctrl->val;
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
@@ -2510,8 +2524,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
-			  512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
+					    1048575, 16, 512);
 
 	/* Gain */
 
@@ -2700,6 +2714,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	u32 mbus_code = 0;
 	unsigned int hblank;
 	unsigned int index;
+	int exposure_max;
 	int ret = 0;
 
 	mutex_lock(&sensor->mutex);
@@ -2747,6 +2762,13 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
 				 hblank);
 
+	exposure_max = mode->vts;
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

