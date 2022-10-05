Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA5C5F5779
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiJEP3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiJEP25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7B561709
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bk15so26470242wrb.13
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Z1L47Ikas8tepO08CaLIg/K6uhTqS3MA2OXErSnZo7c=;
        b=ce92HrKZzS3fclGQgdYYfIjUKrvVx6Yi+oWGJi3i0OmrzyvhSED06DK/jp9JagYRFc
         fmsAbHZqLJtmA3RtzmkXxPoQbGp44LlSjFD8bbr9fqD1rQbouPissDgo3DwAAS+lBdkx
         /xqtDF4yGtofPb/uzJcT79q/+8mElH7MIHjTDrk42cxjpxiNA9qtrDrVJus9P/gunXkk
         RqnGz2ANUGIemuPVCmNF7O4TEnCWk5Won740i7SXhzwIz/84sCqONsAZJWPxSV3Glu/z
         56LxIsTPhjhpw5g9Q1mlB+vK9Eb2bYs/2n1yLaK3jnSQkkqmsN7pknhfHRS5TAow/eVX
         KKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z1L47Ikas8tepO08CaLIg/K6uhTqS3MA2OXErSnZo7c=;
        b=XDaTXmpnYZ5FQ7QTWW2hA+5ndm9SBr7RcFI1mtJiDRLtxx84AOs8IGccExYJaOyTnM
         +HS9lhAQwEp6XaG2IC9p85HJzUabSiPaih7sC5OTwFU/vaepZ5wpt4PUkN08QgSJk638
         tBhfW5Wna+JQV4qO3gUVOJBmTwpXp+WGL+Ea25cZ5UBCigjTzvc1BEErvsmnW1iXJZQ6
         MxFHp3YE4K50kqpsFhvgoLmzKbL0JX8g/wGKO+opBt3AnsocNgrAB+6HhKufCxhqWaEq
         kQ65JE992fQYLI/DRxrn6qCW2Q2XfatWPKQKqgMd3St86zJO/qfOdQJVJDRO2byALcXu
         WmeQ==
X-Gm-Message-State: ACrzQf2AuZWGEtjYWrOknWy2ojhoSHQqWvUpY6WR8ds2F/WNXC6crYk0
        boeTh35ojRIk7UI2+zFwOIz7UA==
X-Google-Smtp-Source: AMsMyM4bZ96PTs7OV0cXtPy5VTsjWLpyCxnsdJStjVx6a2AT7xpNbJ/M5DW/r9RFIswJPBQnj6a9QA==
X-Received: by 2002:a5d:59af:0:b0:22e:32be:60f1 with SMTP id p15-20020a5d59af000000b0022e32be60f1mr188454wrr.81.1664983735413;
        Wed, 05 Oct 2022 08:28:55 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:54 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 10/16] media: i2c: ov9282: Action CID_VBLANK when set.
Date:   Wed,  5 Oct 2022 16:28:03 +0100
Message-Id: <20221005152809.3785786-11-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
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
---
 drivers/media/i2c/ov9282.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 183283d191b1..5ddef6e2b3ac 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -419,22 +419,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
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
@@ -465,6 +458,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct ov9282, ctrl_handler);
 	u32 analog_gain;
 	u32 exposure;
+	u32 lpfr;
 	int ret;
 
 	switch (ctrl->id) {
@@ -482,10 +476,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 					       OV9282_EXPOSURE_OFFSET,
 					       1, OV9282_EXPOSURE_DEFAULT);
 		break;
+	}
+
+	/* Set controls only if sensor is in power on state */
+	if (!pm_runtime_get_if_in_use(ov9282->dev))
+		return 0;
+
+	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-		/* Set controls only if sensor is in power on state */
-		if (!pm_runtime_get_if_in_use(ov9282->dev))
-			return 0;
 
 		exposure = ctrl->val;
 		analog_gain = ov9282->again_ctrl->val;
@@ -495,14 +493,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
 
-		pm_runtime_put(ov9282->dev);
 
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

