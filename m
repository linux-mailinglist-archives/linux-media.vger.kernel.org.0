Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C21261173E
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiJ1QP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiJ1QOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:54 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDFC22C461
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so4105064wma.3
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6TMFQMv5fFdWCnBKAllpmUgnFPJrPoVSmYxgifBigY=;
        b=ltGPIAcEo5uavGGBxGu1lgzZaZKe6N1kLEh6Qj4HDfACPkPNjRyYxKjaJMO+cOaKy7
         FeOtjAxgrRj4eC5KEHKpPGZqWyDRiMYYDXZO2OEDEkY9NTjpmJisHk6sjB4ciR/MqlNF
         G1Z0gI1fzAeNt+GkFS9BqNOMtExNfJ8fQ2kv3opEYOy8T4CQPqjBsN9qohxK7RZFe7T0
         mqp9mgAyAmAVe5WGTPGseCu1eVtg01Rj/CfcS2XScAiJJKff/a5DB3r9anw1mdVoUYM2
         yESV7WWv0uZWlhW1bkRjBI+gPDMayqRuACBL7dTbWVEFPgar+rPqcgNhchP5algdLFek
         GbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6TMFQMv5fFdWCnBKAllpmUgnFPJrPoVSmYxgifBigY=;
        b=dn8vwBPt5PgsoCWBpsuB1BCPqBPNNs/sCVkstkxHUhEv+ckFq794Vq6HMzyheuSMcg
         SYqmPHX9viAHKqEIOGTmq2YlTEfGxeWj1ThOYlabVxMaOpTM/OgnQoRgoLfTtCYehz4m
         UjeRMGG8DM7UWwp0RWMMIS5aeWtixCWTpnRFbzxn4wqtIIaJvCcXfxXV9IUj9OCHjq+k
         /ORyqKmGxFbTMZvWezzPmAWgPhFRNpS5ksArMFaMEP2AVJhaa3fAelJkDjPshPGIoejr
         WvJVZczEPketVB0hPseRXLN9lC/KmLE0FYZwxHAwruYTZg2xmBplY/rAVQWIhKeUf5YB
         Qc9w==
X-Gm-Message-State: ACrzQf2DZTA6zsMxebb6/KzFGxp/H/0KpzBG0hbnZCCEg4y4oVjJYoav
        WQ8B36TLuoD4YVKtjhlfDV4WwOLu6p4EOg==
X-Google-Smtp-Source: AMsMyM6HRGbHcw5RWt8qCGTEQr+1cYO7JiZG9jZ8hUGNrN6Vk6CvcIBY+bVSLCyR1o7UkdyJYZn3Dg==
X-Received: by 2002:a05:600c:524a:b0:3c6:f820:fc7c with SMTP id fc10-20020a05600c524a00b003c6f820fc7cmr6023wmb.172.1666973576257;
        Fri, 28 Oct 2022 09:12:56 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:55 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 14/16] media: i2c: ov9282: Add support for 1280x800 and 640x400 modes
Date:   Fri, 28 Oct 2022 17:09:00 +0100
Message-Id: <20221028160902.2696973-15-dave.stevenson@raspberrypi.com>
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

Adds register settings for additional modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 103 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a520d9fef0cb..c169b532ec8b 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -246,11 +246,44 @@ struct ov9282_reg_list common_regs_list = {
 	.regs = common_regs,
 };
 
-#define MODE_1280_720		0
+#define MODE_1280_800		0
+#define MODE_1280_720		1
+#define MODE_640_400		2
 
 #define DEFAULT_MODE		MODE_1280_720
 
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
@@ -282,8 +315,57 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
+	[MODE_1280_800] = {
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
+	},
 	[MODE_1280_720] = {
 		.width = 1280,
 		.height = 720,
@@ -307,6 +389,25 @@ static const struct ov9282_mode supported_modes[] = {
 			.regs = mode_1280x720_regs,
 		},
 	},
+	[MODE_640_400] = {
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
+	},
 };
 
 /**
-- 
2.34.1

