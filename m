Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECAFF5F5772
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbiJEP2x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiJEP2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:51 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2742521818
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bu30so6600137wrb.8
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JN+WKzTlGg4Dfuw/XYIvcSEzDC2bO8y0dBB3JqIqBHU=;
        b=lepSQfSZ76iMoeV0TPRdks2npZUjxeCENNWRxYdnuF1pqkwoES7O14oboWKaal2btf
         TMbhWbEVm3CfwpDxGTM/1JQWmgUZFSE9sD4OjbawbVUMIAS2A9ZGMBLRXlW/Du8x5mLj
         gkpPxkU2xUOisCNmnOX+4nFrfzwM2MJD21b6SLChCU2pPgnL3wMaJDxFtm8XSFSr9Hjd
         JQkeHXE0BWxFvLMMN7nV6wgqxyw3S+DuWlK84JqaeGz8vlcvCLWOHwtZKJxTI6p5vAnt
         0sn2NSzKkxp5VOEk9tmlfJiX87NcrWqkEnYz5g7fZAbMKaIjAOLO6R4SOAuBGDSzpo6J
         mlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JN+WKzTlGg4Dfuw/XYIvcSEzDC2bO8y0dBB3JqIqBHU=;
        b=SZIW1CJGm99eLvXTENi6/xwoWm7riueVzxj9dVr2imzNDBarPY/5wz+cJPHvnlzGVJ
         cg2yVCO0G5R+KdM+NptxL6+vwuGVveMcJLsc6CDUKVhsEGtNTk3/+REUXuEpTIhQX+0H
         NejO4KSmyKPxT9kJqEvltoe/BCA5otFCjDeNXBdkd9Cmgr8Ol1eEsSG53hSGg+gXJmc0
         3tjTOmfyx7GL4ZyoEYRvOuJh0ZmlwPy7fY2rHVCSqPo07Dr1Ut6wEfsyRGc5ACkDn9HH
         jaT5YLVAW472uClTxIhJqkgZB0iLn7D5o44kWl0pgUSPE93vn7fINAejXHOuV8eEH3+U
         BuFg==
X-Gm-Message-State: ACrzQf2zLhyyEoJ2B13PmT6m7GysibDyxUvZWZy4V/iPqjZek+dfIt50
        uBbFzM6kc7GgQ8ajCaG+FyxXr5tMy0YR8w==
X-Google-Smtp-Source: AMsMyM66VifbHLZVLV4D6L/LyWJKEj5KpjQzQ39Y0P7iXQi0vkJ2Vlph2NLMFzge0zb+qxt6vl80vA==
X-Received: by 2002:a05:6000:108a:b0:22e:5610:7987 with SMTP id y10-20020a056000108a00b0022e56107987mr161729wrw.527.1664983728707;
        Wed, 05 Oct 2022 08:28:48 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:47 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 03/16] media: i2c: ov9282: Remove format code from the mode
Date:   Wed,  5 Oct 2022 16:27:56 +0100
Message-Id: <20221005152809.3785786-4-dave.stevenson@raspberrypi.com>
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

The format code is independent of mode, and each mode could
support both Y10 and Y8, so disassociate the code from the
mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 9842080cf66f..1c77b77427f0 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -88,7 +88,6 @@ struct ov9282_reg_list {
  * struct ov9282_mode - ov9282 sensor mode structure
  * @width: Frame width
  * @height: Frame height
- * @code: Format code
  * @hblank: Horizontal blanking in lines
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
@@ -100,7 +99,6 @@ struct ov9282_reg_list {
 struct ov9282_mode {
 	u32 width;
 	u32 height;
-	u32 code;
 	u32 hblank;
 	u32 vblank;
 	u32 vblank_min;
@@ -273,7 +271,6 @@ static const struct ov9282_mode supported_mode = {
 	.vblank_max = 51540,
 	.pclk = 160000000,
 	.link_freq_idx = 0,
-	.code = MEDIA_BUS_FMT_Y10_1X10,
 	.reg_list = {
 		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 		.regs = mode_1280x720_regs,
@@ -523,7 +520,7 @@ static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = supported_mode.code;
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
 
 	return 0;
 }
@@ -543,7 +540,7 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
 	if (fsize->index > 0)
 		return -EINVAL;
 
-	if (fsize->code != supported_mode.code)
+	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
 	fsize->min_width = supported_mode.width;
@@ -567,7 +564,7 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
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

