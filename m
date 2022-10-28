Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A5F61173A
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiJ1QPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiJ1QOi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D351F810C
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bp11so7191113wrb.9
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaKoQyrZ2yCkJsSr+WI5a4CPSDINEZrCRWoW1/EHfUg=;
        b=K4BqX5ToEFU9Qt36Q47lZhVJH7zNHdzFIZyLaTttzpjW9zKD18Cn3ejn74VNlKkQYk
         lGdYLrg/QV8vVPgmxYGcyexBMS4hTxWCliynb11WYXrqrsBKZheN7/2la8Z0IMB4+QkQ
         DNoiH71Jfw3jaP0wm23dqVfrnBbmzwrVcNNntOXaJEtEdPYSB+ODjYHsT6u/+H1UCg44
         2AYImkgLPZKxXtqGr8ZrYRVUIyhV2+d+3WlqS+j2vAsMmZ8olxPEyUviJ0Xwp8tnyMFf
         qNt/nS6G96eFT2RW8pxTDrFk4CBFflny5ne94oFt3OtVMEPNHXz+Fo5rVAmW9HX00z8g
         TsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaKoQyrZ2yCkJsSr+WI5a4CPSDINEZrCRWoW1/EHfUg=;
        b=GQUSAS4bi6CYbzrgrCkqA+mWmen5QuwmXjwFZRFFKUFCermfKG2GUjrmSaYq6zsy0W
         uSNmIBd8VwFm/sltFjqaROCO3sUvn5AFovB+9Z/1o244o1W3RXm7zdexCUqeZsYA7Nso
         XyjwdNEkzkcul5+mlkR5TqejE3VKYMM5J0zW8o6a4txaafnequTvE7vqPYUM44dQwUFh
         0IVjP+IJY+5l12q5vt/g7EVBJqJWd8GUSGANA/2FJ4jkFH9xgdDHGCH1Np66kq99wDAh
         AL3aOt7CTSdz1OrEUTWSdajaxqzGM+QOQLhFuHe9Ef8nnXDotJC8u+97zrJMLbyCHTy2
         pwpg==
X-Gm-Message-State: ACrzQf3i26JXdlYPErA49h/Je7hgJv5yeuxMAhpFf4nxxz9rSjewQIPf
        9psGwaMgEt8WFYb8XAFoAzINJ4qwdplukA==
X-Google-Smtp-Source: AMsMyM7S6+M0qXeyrc/LAHB/vuNo3NAeiqCJg1WqxzWKcsSsh5bFDAh03U5WaZsNgqJZFw5TzeXh2g==
X-Received: by 2002:adf:fe85:0:b0:236:7cde:a95d with SMTP id l5-20020adffe85000000b002367cdea95dmr57182wrr.531.1666973571503;
        Fri, 28 Oct 2022 09:12:51 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:51 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 08/16] media: i2c: ov9282: Add selection for CSI2 clock mode
Date:   Fri, 28 Oct 2022 17:08:54 +0100
Message-Id: <20221028160902.2696973-9-dave.stevenson@raspberrypi.com>
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

The sensor supports either having the CSI2 clock lane free
running, or gated when there is no packet to transmit.
The driver only selected gated (non-continuous) clock mode.

Add code to allow fwnode to configure whether the clock is
gated or free running.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 35bc2b0438bc..1637cf1177c5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -45,6 +45,9 @@
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
 
+#define OV9282_REG_MIPI_CTRL00	0x4800
+#define OV9282_GATED_CLOCK	BIT(5)
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -136,6 +139,7 @@ struct ov9282 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	u32 vblank;
+	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
 	struct mutex mutex;
 	bool streaming;
@@ -145,7 +149,13 @@ static const s64 link_freq[] = {
 	OV9282_LINK_FREQ,
 };
 
-/* Common registers */
+/*
+ * Common registers
+ *
+ * Note: Do NOT include a software reset (0x0103, 0x01) in any of these
+ * register arrays as some settings are written as part of ov9282_power_on,
+ * and the reset will clear them.
+ */
 static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
 	{0x030d, 0x50},
@@ -201,7 +211,6 @@ static const struct ov9282_reg common_regs[] = {
 	{0x4601, 0x04},
 	{0x470f, 0x00},
 	{0x4f07, 0x00},
-	{0x4800, 0x20},
 	{0x5000, 0x9f},
 	{0x5001, 0x00},
 	{0x5e00, 0x00},
@@ -835,6 +844,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	if (ret)
 		return ret;
 
+	ov9282->noncontinuous_clock =
+		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
 		dev_err(ov9282->dev,
 			"number of CSI2 data lanes %d is not supported",
@@ -903,6 +915,14 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
+	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
+			       ov9282->noncontinuous_clock ?
+					OV9282_GATED_CLOCK : 0);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
+		return ret;
+	}
+
 	return 0;
 
 error_reset:
-- 
2.34.1

