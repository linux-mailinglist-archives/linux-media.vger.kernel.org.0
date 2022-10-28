Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A52611743
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiJ1QPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiJ1QOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8106B10B5D
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:54 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so4164165wmb.2
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uey9vOhMLVzWfhmJtcLrItGBH6mQHGylv2VgePIXpOI=;
        b=HOSvTTqzHmIzDF69JWwPSm/hD9MwBHBCtXyKjGg/OVc4o6xmD03oaTG9pKXRMRF3NB
         7NYwMawhmwGdltRxlATQQpUgM9tkiO55GT5/eGpdsi/FYfZd1zaB1Q/YgGdmxXNMUUkg
         ZI8mzaHxc5GAItHJesGI7YawCDJNVpLc2rGiG0A+TzjtoqvhdTnWTDGQXthm+DazwCEA
         J/mrA7Hhd+TBLj86AyXtUDt2ig2V/9iG3RM1f0UXqS9n+gsPbQ/fGI0L0WaNToVt3uey
         Q8tHXCKzHEsvEyIH3UCOu8N0odABOTEUjeAToH7DhogrIjwX86wPMCh6nL9GP4HccvB6
         C0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uey9vOhMLVzWfhmJtcLrItGBH6mQHGylv2VgePIXpOI=;
        b=J9VvRDxUrZGKuuTlUlDldrafXOtwqcvFDuGtXRtBGKleOxcXlnhLCquVtJqhzTmyE6
         2GmB59jRXk5XM45mMoRFcU7bTschszhfLjej/7GZXh8yFuH+jKVL38nkRFeepyJjeV6J
         JsP30eFVKzz2GpYyNPZM9Mf3L1ojzepOeCFwGalKHHT1FBThJ9BDRvwE7DWLN3znapbk
         ELqTHXi2OHUhqeoDl30SBFN5R6AbldOpWbQpZxnhxIHpqvSf978WSBmZL+d5xD1CEyYp
         VLdxFhJNj0AfLDGagSLhcO8cMkeIqA1NO5fbjnUZ3JCjzJrIVQjaykRNAPy+kqH63p3a
         5upw==
X-Gm-Message-State: ACrzQf2wOzpVaCpZdVS/PfveCq91yGsRJ32myLYl8NoORJu/9VsRmbLH
        W33SjlzCPBsKpMygmy2I6msvSw==
X-Google-Smtp-Source: AMsMyM4Jw7Cy4qfCmBPIsw75X2Gi4bW3rgFc7181BCs6g/SV4AmVBYnRA5QsLdYBZTmI+KJyk6dUZA==
X-Received: by 2002:a05:600c:1d2a:b0:3c6:b7be:2879 with SMTP id l42-20020a05600c1d2a00b003c6b7be2879mr10664012wms.84.1666973573059;
        Fri, 28 Oct 2022 09:12:53 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 10/16] media: i2c: ov9282: Action CID_VBLANK when set.
Date:   Fri, 28 Oct 2022 17:08:56 +0100
Message-Id: <20221028160902.2696973-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Programming the sensor with TIMING_VTS (aka LPFR) was done
when triggered by a change in exposure or gain, but not
when V4L2_CID_VBLANK was changed. Dynamic frame rate
changes could therefore not be achieved.

Separate out programming TIMING_VTS so that it is triggered
by set_ctrl(V4L2_CID_VBLANK)

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 889db9d105a2..e964461ff1d3 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -417,22 +417,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
  */
 static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 {
-	u32 lpfr;
 	int ret;
 
-	lpfr = ov9282->vblank + ov9282->cur_mode->height;
-
-	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u, lpfr %u",
-		exposure, gain, lpfr);
+	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
+		exposure, gain);
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
 	if (ret)
 		return ret;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
-	if (ret)
-		goto error_release_group_hold;
-
 	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
 	if (ret)
 		goto error_release_group_hold;
@@ -463,6 +456,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct ov9282, ctrl_handler);
 	u32 analog_gain;
 	u32 exposure;
+	u32 lpfr;
 	int ret;
 
 	switch (ctrl->id) {
@@ -480,11 +474,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 					       OV9282_EXPOSURE_OFFSET,
 					       1, OV9282_EXPOSURE_DEFAULT);
 		break;
-	case V4L2_CID_EXPOSURE:
-		/* Set controls only if sensor is in power on state */
-		if (!pm_runtime_get_if_in_use(ov9282->dev))
-			return 0;
+	}
+
+	/* Set controls only if sensor is in power on state */
+	if (!pm_runtime_get_if_in_use(ov9282->dev))
+		return 0;
 
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
 		exposure = ctrl->val;
 		analog_gain = ov9282->again_ctrl->val;
 
@@ -492,15 +489,18 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 			exposure, analog_gain);
 
 		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
-
-		pm_runtime_put(ov9282->dev);
-
+		break;
+	case V4L2_CID_VBLANK:
+		lpfr = ov9282->vblank + ov9282->cur_mode->height;
+		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
 		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
 	}
 
+	pm_runtime_put(ov9282->dev);
+
 	return ret;
 }
 
-- 
2.34.1

