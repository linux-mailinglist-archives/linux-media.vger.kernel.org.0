Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28EF611734
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbiJ1QPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiJ1QOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0230DFB6
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso4150446wmb.5
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J1qiec3Yxt5b0ju8tgueYhZ2XcpMHPMQXJUPdcOjXQ=;
        b=cjunyKNmcjzxozkCvnw59YyFJPhKvjnbaJGWVxaRMnufrd9It2H84kEzKtIOYsbnDT
         iK8KBr0ltQs8+BS+8gPb5Gy51EUQbZEtQCQmunpvsnqrpadP5KEz8fVa217PoSfwA+6G
         sht30UOQEACMtRjMtaETU8fn9boTKYu/3GYygChlqiAEgEUVs84PJ3vBB/3QmhJpvlbm
         AJGq5Yzls4/VoBUl5CSZ+qaZE9vPh/CGWEkbnamOHTHJZnVqxyXiRRQwKkvMQvun4HTM
         oBgleKQiYbDBlWcDBVO3aQG/zTh3ZoKOFrX/iTH2GyBeiGm5xdPNv7SjrvQtb2W/q37g
         ZM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J1qiec3Yxt5b0ju8tgueYhZ2XcpMHPMQXJUPdcOjXQ=;
        b=y3Xa/a3vt0pSRkYpsYRlBnM8GB24JZ1UjC2Jfvk2ZXbUy6GKF1+yznKvO5nWexmcKm
         aTvF66iGbJQzUK6ZvjkgQhqGMKRPZOQi87cZpeEcA9sfuDxdyIdRfuwBNsAv81s2K7Qj
         ANypkXs3h1WVDWo9hZUYltBVlx51HiyCYlbVxycqtPMH09mMyakY73ZBWEDQAwmVNLGO
         yi6ogNZ6MX7w3+TrorrEyAhi+oZEWMNGdcrIjD0jjivnugtlpCj/GRGHSeCaE/MUTQqq
         CLD4p/4M3q4zLcpQSxRyHIpeFCbbsbfq2zsbo06jTGzFRc0lNMPZGNrgUtQL4Wj3saBh
         JqCg==
X-Gm-Message-State: ACrzQf2YRcGT2qIMcRRRaOTO0OxuANoSAYG+Q6byOy8fKtHP2Rx7v8L2
        vnv7jWIeCH3N8jPiIWSIe5LYGI9/rO4q9Q==
X-Google-Smtp-Source: AMsMyM6Fpu+WC51VP/erVsnag8C6QwoF2OqTrJujzihgWjwCtvGd6HJaQ9Ozb5ZnHIExAxnSOZ8cyw==
X-Received: by 2002:a05:600c:34c1:b0:3cf:3921:ef22 with SMTP id d1-20020a05600c34c100b003cf3921ef22mr3244wmq.204.1666973564540;
        Fri, 28 Oct 2022 09:12:44 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:44 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 03/16] media: i2c: ov9282: Remove format code from the mode
Date:   Fri, 28 Oct 2022 17:08:49 +0100
Message-Id: <20221028160902.2696973-4-dave.stevenson@raspberrypi.com>
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

The format code is independent of mode, and each mode could
support both Y10 and Y8, so disassociate the code from the
mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 6999ce869a1b..ead3a4f22ef8 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -79,7 +79,6 @@ struct ov9282_reg_list {
  * struct ov9282_mode - ov9282 sensor mode structure
  * @width: Frame width
  * @height: Frame height
- * @code: Format code
  * @hblank: Horizontal blanking in lines
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
@@ -91,7 +90,6 @@ struct ov9282_reg_list {
 struct ov9282_mode {
 	u32 width;
 	u32 height;
-	u32 code;
 	u32 hblank;
 	u32 vblank;
 	u32 vblank_min;
@@ -263,7 +261,6 @@ static const struct ov9282_mode supported_mode = {
 	.vblank_max = 51540,
 	.pclk = 160000000,
 	.link_freq_idx = 0,
-	.code = MEDIA_BUS_FMT_Y10_1X10,
 	.reg_list = {
 		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 		.regs = mode_1280x720_regs,
@@ -513,7 +510,7 @@ static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = supported_mode.code;
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
 
 	return 0;
 }
@@ -533,7 +530,7 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
 	if (fsize->index > 0)
 		return -EINVAL;
 
-	if (fsize->code != supported_mode.code)
+	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
 	fsize->min_width = supported_mode.width;
@@ -557,7 +554,7 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = mode->code;
+	fmt->format.code = MEDIA_BUS_FMT_Y10_1X10;
 	fmt->format.field = V4L2_FIELD_NONE;
 	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
 	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-- 
2.34.1

