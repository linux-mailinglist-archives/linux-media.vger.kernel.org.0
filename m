Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B24C4B7B06
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbiBOXIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243451AbiBOXIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:11 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D88665E0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:08:00 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h6so494185wrb.9
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l2tRfNrOIKSoY0VV6Ty+DAIfmKgy5ueutRp2dWCh5N8=;
        b=PD3lJUsN8qPv5UHjhZchPZvcRsBUS1Xn9Y86GpZxWDrbgStg3LXVP/tfnM4P7TSpYI
         N2MY9cfjvK0YOGBaDA0e77geHyZiBl9oBxLc2KFyScYVONOV4VLB6ZxPmcQ3Cn7QuFyh
         IgkEw+NVsw+Fzr9rCGBsouh9C2mVNgGfXXRD6D5hNSBG4+pcIPs82UpJKSrrMDsnXZmz
         9vXB3eLbVJMhwdBmZeDvDNEDaLIn1KOhnmuaEq4p/2eXijJhvbtypwvB6ZOC40eEpvPg
         rxeGeyeO8NnIHIWRQBRVwIMl2HVxaRVTrxhG3C1p+dHm+7Qznks2lPp2emPQXCMq7aKR
         9pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2tRfNrOIKSoY0VV6Ty+DAIfmKgy5ueutRp2dWCh5N8=;
        b=hcZ9m3qSo/0mLj+fMs8YhvOsi9Z/Vd72xeEv/yyPZg0gP1MB7ESb98jvXImgJm7sUm
         TD0gm4EjEu9h1x+sdg2hjyNrezmUgyRkXQxqSPojxf2qp5bghfHjt0pxjhjDELpwYET3
         7DSr8sKXHF3z3pCdGSQOUVuWZC4qrYno6ziklXigr7Jpliz3vnyqTBv+O+DB1U7oSB5e
         Ppp+DbqOdxazvEZEQWzsIzkTHMGThOfo7ydbZj6WKgjIRpWg7A/nqTV9gAXSt8yQhQYF
         S8hUKzYraLZhfPcIWyiR+36Eyoc0lEh/KAH60A/TCfWF2GmnDaGps5UyajLkCNq/IFko
         +eHQ==
X-Gm-Message-State: AOAM531ZCCPRqOixeqSnmxr2OwzlZPvrMpGZC/TqQy03cPcfxzWtlEjE
        pdUR0uVDdOzEgsI1d0mI2hKQO9J30K8pjg==
X-Google-Smtp-Source: ABdhPJwyjDUeKKWmw2gNSF/NQP1ARSi9LWPJGNMG4fNyQdBATH4e+kZQ0jiHVL86cgYeYPeGsiP+qA==
X-Received: by 2002:adf:d082:0:b0:1e3:16e2:d611 with SMTP id y2-20020adfd082000000b001e316e2d611mr165280wrh.716.1644966479230;
        Tue, 15 Feb 2022 15:07:59 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:58 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 09/10] media: i2c: Remove .s_power() from ov7251
Date:   Tue, 15 Feb 2022 23:07:36 +0000
Message-Id: <20220215230737.1870630-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_power() callback is deprecated, and now that we have pm_runtime
functionality in the driver there's no further use for it. Delete the
function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov7251.c | 44 +-------------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d620ed6a4e42..5e7422ca4ab9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -903,43 +903,6 @@ static int __maybe_unused ov7251_sensor_resume(struct device *dev)
 	return ov7251_set_power_on(ov7251);
 }
 
-static int ov7251_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct ov7251 *ov7251 = to_ov7251(sd);
-	int ret = 0;
-
-	mutex_lock(&ov7251->lock);
-
-	/* If the power state is not modified - no work to do. */
-	if (ov7251->power_on == !!on)
-		goto exit;
-
-	if (on) {
-		ret = ov7251_set_power_on(ov7251);
-		if (ret < 0)
-			goto exit;
-
-		ret = ov7251_set_register_array(ov7251,
-					ov7251_global_init_setting,
-					ARRAY_SIZE(ov7251_global_init_setting));
-		if (ret < 0) {
-			dev_err(ov7251->dev, "could not set init registers\n");
-			ov7251_set_power_off(ov7251);
-			goto exit;
-		}
-
-		ov7251->power_on = true;
-	} else {
-		ov7251_set_power_off(ov7251);
-		ov7251->power_on = false;
-	}
-
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
-}
-
 static int ov7251_set_hflip(struct ov7251 *ov7251, s32 value)
 {
 	u8 val = ov7251->timing_format2;
@@ -1384,10 +1347,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-static const struct v4l2_subdev_core_ops ov7251_core_ops = {
-	.s_power = ov7251_s_power,
-};
-
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 	.s_stream = ov7251_s_stream,
 	.g_frame_interval = ov7251_get_frame_interval,
@@ -1405,7 +1364,6 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov7251_subdev_ops = {
-	.core = &ov7251_core_ops,
 	.video = &ov7251_video_ops,
 	.pad = &ov7251_subdev_pad_ops,
 };
@@ -1690,7 +1648,7 @@ static int ov7251_probe(struct i2c_client *client)
 	pm_runtime_disable(ov7251->dev);
 	pm_runtime_put_noidle(ov7251->dev);
 power_down:
-	ov7251_s_power(&ov7251->sd, false);
+	ov7251_set_power_off(ov7251);
 free_entity:
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
-- 
2.25.1

