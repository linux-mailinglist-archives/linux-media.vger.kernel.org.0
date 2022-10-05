Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885A25F577D
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiJEP3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbiJEP3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:29:03 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD2057899
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:29:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y23-20020a1c4b17000000b003bd336914f9so1233253wma.4
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Tcapm+tKjFrTXlUvq1XzREivNboKqkjM4qRciK0bi88=;
        b=CMv8HFLqZLNdzzT4dWXVod6tv+fU2thk0KI1UJwxskqO7Djz1XKrI/q9lwTtK6EQ+h
         K9rRjpQetfHy3YfyekRPZ34y7YDbBuRGrDANbE9KEP2y0WEx6qFEG/09dhAe82/a5q0W
         YfCxNICva+FJdd06Z7OZOE//RnVUo24HdpRRfNW+2ACmG0ilPeHcNQEGA7KCnaMneYTC
         H+d5+DUPFX99w8ZHn0fZTpUCfc4EyaVlctnO8Ixy/W7ks1euFgEco1xxQvNLFIuy5V3L
         lytSAecMmuLIL9+X02sGJo1xKH6PGCMu9csyu02HEun8PnrgGAanmhZY6F/C9xo1A8Ha
         K9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Tcapm+tKjFrTXlUvq1XzREivNboKqkjM4qRciK0bi88=;
        b=az6YcKGChie9fJXfG2WvJdSM4UsM5vO76/7iN13A7XaF2oAJLUcc3/H9n1tvuz6Xja
         EXqtMMnM8QoYYGeZOUYkRFwxnYlp6ZIu2T7PIXEwu6NFxKWlyulCi+mbyb1InO3RwsH3
         JKle1k8VhoBcKg8LuqM37FDtVY4dhGx6UQbTGBCd21tuLN21z1pqTVDdEZn2sR3eNhMd
         1wwNo8rm3XiZRVoHJteLZmgRYLol7F75LuWYl39jipBAYmPQRCx5EoqrlIknz0XfomNd
         VrdNGL8pKMdmDfYEmxVPgOBZbCPraQ3IWci1xXQdC7if6NY2hkQUIZhRuu5UosABmbnk
         Fbww==
X-Gm-Message-State: ACrzQf0zp2w/gJu7bw89ZbYHUYnaLZD5R/gZkh2qQ5aIBRtHMb2uwy46
        eJd/y3A9UIqQeerf1JniUHxV6g==
X-Google-Smtp-Source: AMsMyM6vH2QWPcAz/OP44Jid1PHKLNB+ABqx5BLMEt9eKyQ0HKPVtKukYuBgoF3TcUvi5DD96623tw==
X-Received: by 2002:a05:600c:3106:b0:3b9:578a:c151 with SMTP id g6-20020a05600c310600b003b9578ac151mr3753930wmo.29.1664983740152;
        Wed, 05 Oct 2022 08:29:00 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:59 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 14/16] media: i2c: ov9282: Add support for 1280x800 and 640x400 modes
Date:   Wed,  5 Oct 2022 16:28:07 +0100
Message-Id: <20221005152809.3785786-15-dave.stevenson@raspberrypi.com>
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

Adds register settings for additional modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 97 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index d892f53fb1ea..ec1599488f21 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -251,6 +251,37 @@ struct ov9282_reg_list common_regs_list = {
 };
 
 /* Sensor mode registers */
+static const struct ov9282_reg mode_1280x800_regs[] = {
+	{0x3778, 0x00},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x05},
+	{0x3805, 0x0f},
+	{0x3806, 0x03},
+	{0x3807, 0x2f},
+	{0x3808, 0x05},
+	{0x3809, 0x00},
+	{0x380a, 0x03},
+	{0x380b, 0x20},
+	{0x3810, 0x00},
+	{0x3811, 0x08},
+	{0x3812, 0x00},
+	{0x3813, 0x08},
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+	{0x3820, 0x40},
+	{0x3821, 0x00},
+	{0x4003, 0x40},
+	{0x4008, 0x04},
+	{0x4009, 0x0b},
+	{0x400c, 0x00},
+	{0x400d, 0x07},
+	{0x4507, 0x00},
+	{0x4509, 0x00},
+};
+
 static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
@@ -282,6 +313,36 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x4509, 0x80},
 };
 
+static const struct ov9282_reg mode_640x400_regs[] = {
+	{0x3778, 0x10},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x05},
+	{0x3805, 0x0f},
+	{0x3806, 0x03},
+	{0x3807, 0x2f},
+	{0x3808, 0x02},
+	{0x3809, 0x80},
+	{0x380a, 0x01},
+	{0x380b, 0x90},
+	{0x3810, 0x00},
+	{0x3811, 0x04},
+	{0x3812, 0x00},
+	{0x3813, 0x04},
+	{0x3814, 0x31},
+	{0x3815, 0x22},
+	{0x3820, 0x60},
+	{0x3821, 0x01},
+	{0x4008, 0x02},
+	{0x4009, 0x05},
+	{0x400c, 0x00},
+	{0x400d, 0x03},
+	{0x4507, 0x03},
+	{0x4509, 0x80},
+};
+
 /* Supported sensor mode configurations */
 static const struct ov9282_mode supported_modes[] = {
 	{
@@ -306,6 +367,42 @@ static const struct ov9282_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
 		},
+	}, {
+		.width = 1280,
+		.height = 800,
+		.hblank_min = { 250, 176 },
+		.vblank = 1022,
+		.vblank_min = 110,
+		.vblank_max = 51540,
+		.link_freq_idx = 0,
+		.crop = {
+			.left = OV9282_PIXEL_ARRAY_LEFT,
+			.top = OV9282_PIXEL_ARRAY_TOP,
+			.width = 1280,
+			.height = 800
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x800_regs),
+			.regs = mode_1280x800_regs,
+		},
+	}, {
+		.width = 640,
+		.height = 400,
+		.hblank_min = { 890, 816 },
+		.vblank = 1022,
+		.vblank_min = 22,
+		.vblank_max = 51540,
+		.link_freq_idx = 0,
+		.crop = {
+			.left = OV9282_PIXEL_ARRAY_LEFT,
+			.top = OV9282_PIXEL_ARRAY_TOP,
+			.width = 1280,
+			.height = 800
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_640x400_regs),
+			.regs = mode_640x400_regs,
+		},
 	},
 };
 
-- 
2.34.1

