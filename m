Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B234D5F5771
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiJEP2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJEP2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:50 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E0D1EEE3
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso1244105wmc.0
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u9Nk/5KWVZuhK9fPLbCCMVzm/c2ZpA/A5nbN8kga8jI=;
        b=G6IagFV61ktaTOX3dqVIxo90pmDTlxiZOnCbaxq23g5nk6frso3gsxRlQ58IQIgLoE
         ngUUPoI/nktXyf/8IqZ26mETfUbZVpfC9hT5nlJ1fZlWgKokOtUpZuzbNVpF+pZ+vU1w
         NJsgzj2pZiMutiRIM5rUrVxy/GvDh99iKC5Yne5fkfOQpmhtQv4eMyYprn559/JuOQTf
         S7VjgDWz7uJnOOr71QRLhI4lA/ECIvCEnKuKsnCrqzrlelztlKLpKMDOvn3LUUdikWhI
         +J67W8al4ffhvDPnGupUfK40h/rU05ROZzy7XbHs6K1ET7iZ1dr938wdtjjIANhV1YBm
         3CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u9Nk/5KWVZuhK9fPLbCCMVzm/c2ZpA/A5nbN8kga8jI=;
        b=UQx1h8rHKV+neUs0tSa7CbeSETlNPcDbGhgy1z/xWGXWjJJKzhym+qlIJNi39aRYzl
         yV6uLD+GlZZsXAVy4ounWea6m1kl4A8f2s5JVBAxaX8B+ky2uaIkzp7fqn39U+sgE0yP
         b+iDFOe+zSU0nv+qClsKM2jjKazeqomRNCGG8DsHhxSlyHc9BdNEhaotM7FZDj2587uB
         j16B7sY5glIWJnSb0gfEBT0A+B+V9t8/igVUS1hc+5NxuZlNYJGDR9aww81Sm6F49vZg
         D3ixGhJwECYhvZHB7APgDdws2i/pdBKCdaxHxjiBsQSni2xB7DXD5z3Ugb23fMDa8ot6
         K3pA==
X-Gm-Message-State: ACrzQf2KqqY8E3PK7EDlKMwZMJ6NEkVGHKzr3POD1cBHu6b9VqDKMykz
        qKxZSKwXmcKTB44kYrCBxZRGtQ==
X-Google-Smtp-Source: AMsMyM48VqAhvqEa0Opb/N7ou1XWBtZNvb78zByVq6kI6azMXc/C6F0TWwojA4U7+DmN0zuWCO1oZQ==
X-Received: by 2002:a05:600c:1909:b0:3b4:aa30:40df with SMTP id j9-20020a05600c190900b003b4aa3040dfmr3730969wmq.205.1664983727755;
        Wed, 05 Oct 2022 08:28:47 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:46 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 02/16] media: i2c: ov9282: Split registers into common and mode specific
Date:   Wed,  5 Oct 2022 16:27:55 +0100
Message-Id: <20221005152809.3785786-3-dave.stevenson@raspberrypi.com>
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

Currently only one mode is supported, so all registers were
dropped in one list.
In preparation for adding more modes, split out the common registers
from those which configure the mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 77 +++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2c13bcd59c2a..9842080cf66f 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -157,8 +157,8 @@ static const s64 link_freq[] = {
 	OV9282_LINK_FREQ,
 };
 
-/* Sensor mode registers */
-static const struct ov9282_reg mode_1280x720_regs[] = {
+/* Common registers */
+static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
 	{0x030d, 0x50},
 	{0x030e, 0x02},
@@ -189,13 +189,49 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x372d, 0x22},
 	{0x3731, 0x80},
 	{0x3732, 0x30},
-	{0x3778, 0x00},
 	{0x377d, 0x22},
 	{0x3788, 0x02},
 	{0x3789, 0xa4},
 	{0x378a, 0x00},
 	{0x378b, 0x4a},
 	{0x3799, 0x20},
+	{0x3881, 0x42},
+	{0x38a8, 0x02},
+	{0x38a9, 0x80},
+	{0x38b1, 0x00},
+	{0x38c4, 0x00},
+	{0x38c5, 0xc0},
+	{0x38c6, 0x04},
+	{0x38c7, 0x80},
+	{0x3920, 0xff},
+	{0x4010, 0x40},
+	{0x4043, 0x40},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4501, 0x00},
+	{0x450a, 0x08},
+	{0x4601, 0x04},
+	{0x470f, 0x00},
+	{0x4f07, 0x00},
+	{0x4800, 0x20},
+	{0x5000, 0x9f},
+	{0x5001, 0x00},
+	{0x5e00, 0x00},
+	{0x5d00, 0x07},
+	{0x5d01, 0x00},
+	{0x0101, 0x01},
+	{0x1000, 0x03},
+	{0x5a08, 0x84},
+};
+
+struct ov9282_reg_list common_regs_list = {
+	.num_of_regs = ARRAY_SIZE(common_regs),
+	.regs = common_regs,
+};
+
+/* Sensor mode registers */
+static const struct ov9282_reg mode_1280x720_regs[] = {
+	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -218,40 +254,13 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3815, 0x11},
 	{0x3820, 0x3c},
 	{0x3821, 0x84},
-	{0x3881, 0x42},
-	{0x38a8, 0x02},
-	{0x38a9, 0x80},
-	{0x38b1, 0x00},
-	{0x38c4, 0x00},
-	{0x38c5, 0xc0},
-	{0x38c6, 0x04},
-	{0x38c7, 0x80},
-	{0x3920, 0xff},
 	{0x4003, 0x40},
 	{0x4008, 0x02},
 	{0x4009, 0x05},
 	{0x400c, 0x00},
 	{0x400d, 0x03},
-	{0x4010, 0x40},
-	{0x4043, 0x40},
-	{0x4307, 0x30},
-	{0x4317, 0x00},
-	{0x4501, 0x00},
 	{0x4507, 0x00},
 	{0x4509, 0x80},
-	{0x450a, 0x08},
-	{0x4601, 0x04},
-	{0x470f, 0x00},
-	{0x4f07, 0x00},
-	{0x4800, 0x20},
-	{0x5000, 0x9f},
-	{0x5001, 0x00},
-	{0x5e00, 0x00},
-	{0x5d00, 0x07},
-	{0x5d01, 0x00},
-	{0x0101, 0x01},
-	{0x1000, 0x03},
-	{0x5a08, 0x84},
 };
 
 /* Supported sensor mode configurations */
@@ -663,6 +672,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	const struct ov9282_reg_list *reg_list;
 	int ret;
 
+	/* Write common registers */
+	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
+				common_regs_list.num_of_regs);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write common registers");
+		return ret;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
 	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
-- 
2.34.1

