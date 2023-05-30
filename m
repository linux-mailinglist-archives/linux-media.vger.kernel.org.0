Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCC5716B25
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbjE3RbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjE3RbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:05 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2BD115
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:51 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f61530506aso50384945e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467849; x=1688059849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBiuayat8eFmVICEHC8QRkGcRRDR13jLdqplOb9ZQDM=;
        b=slNwrukiO9XpMgnqfkG/3WjMfbUbX8SaxrxEP+2UJA2SeiUfoFXgbiCXCyaN37aWhN
         Qt/P9JuINDND/Nx7k/x7BWuT/7sEeVzFFxiWCXD9QBiObjKwZMiFGSqXgIKlbmvPMnKf
         U0H4PkAngcFzXZ7s7OSgBG16OeOnaB6KRBQsnzsxzxuFcsu5ApfeqJpsEi0be93Eq9Ph
         M3vbS1GuDvLuMD88drqdDSum+hSONoopCrXy+Tc2VDehL9PEpz5dlSacoEUkZOaA89Dp
         ZAA12WPs+9dTf9OjHR+PCqCNDIchZ0UnDpeCW1ngB3pxR+hAusKqtQ1PEblDCYKMOxl6
         0VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467849; x=1688059849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBiuayat8eFmVICEHC8QRkGcRRDR13jLdqplOb9ZQDM=;
        b=Ptw0j2oHkfogUWuSvrl8rrf4YB4ywsRB2p9LkHSftdIT35rvHiTDtMtTGsbwTRdZse
         qxBvIU+OMyR57nj5HZAcuKb7PMaOm4Q7QbQpLJT3Q9MotRKyIND55JILIz6JEqVWNasB
         aH/f5cwCWtjWDJ096COEzVnRtfJ5hDTWXeQMyB2YY51umoXikKIkEzkDeQuG+UvtnsbG
         KxTKflj8IGvONH3oNfZJWDIxK04KP9FF7LN6Mmtgc2DMCnjFYORLjsyDWbcKxBxXrelq
         f81aLHwlTq+lMTTi7SfQY2rTjw+/J1uHyqDlSBMtEfBjNSKHhYCSvAguhsZg7UJ/Omif
         5RVw==
X-Gm-Message-State: AC+VfDzy4hfK0RqQDwuq707leZZVwIQo8Nqaz+ZUlzte6XsBnDc+UyKG
        RXUFBMgJZJ5goKE2aMXqdm+Zrw==
X-Google-Smtp-Source: ACHHUZ7+vMtR9wBtL6fDuIsdAszoZsP8f9Su6D3C/3byNYv6zFm19Scb+nfEVMXFgxO+liphQcjJfQ==
X-Received: by 2002:adf:ed48:0:b0:306:35d2:c33a with SMTP id u8-20020adfed48000000b0030635d2c33amr2180686wro.50.1685467849634;
        Tue, 30 May 2023 10:30:49 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:49 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 20/21] media: i2c: imx258: Change register settings for variants of the sensor
Date:   Tue, 30 May 2023 18:29:59 +0100
Message-Id: <20230530173000.3060865-21-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sony have advised that there are variants of the IMX258 sensor which
require slightly different register configuration to the mainline
imx258 driver defaults.

There is no available run-time detection for the variant, so add
configuration via the DT compatible string.

The Vision Components imx258 module supports PDAF, so add the
register differences for that variant

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 49 ++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 986757650378..98b5c1e3abff 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
@@ -320,8 +321,6 @@ static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
 
 static const struct imx258_reg mode_common_regs[] = {
 	{ 0x3051, 0x00 },
-	{ 0x3052, 0x00 },
-	{ 0x4E21, 0x14 },
 	{ 0x6B11, 0xCF },
 	{ 0x7FF0, 0x08 },
 	{ 0x7FF1, 0x0F },
@@ -344,7 +343,6 @@ static const struct imx258_reg mode_common_regs[] = {
 	{ 0x7FA8, 0x03 },
 	{ 0x7FA9, 0xFE },
 	{ 0x7B24, 0x81 },
-	{ 0x7B25, 0x00 },
 	{ 0x6564, 0x07 },
 	{ 0x6B0D, 0x41 },
 	{ 0x653D, 0x04 },
@@ -459,6 +457,33 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x034F, 0x0C },
 };
 
+struct imx258_variant_cfg {
+	const struct imx258_reg *regs;
+	unsigned int num_regs;
+};
+
+static const struct imx258_reg imx258_cfg_regs[] = {
+	{ 0x3052, 0x00 },
+	{ 0x4E21, 0x14 },
+	{ 0x7B25, 0x00 },
+};
+
+static const struct imx258_variant_cfg imx258_cfg = {
+	.regs = imx258_cfg_regs,
+	.num_regs = ARRAY_SIZE(imx258_cfg_regs),
+};
+
+static const struct imx258_reg imx258_pdaf_cfg_regs[] = {
+	{ 0x3052, 0x01 },
+	{ 0x4E21, 0x10 },
+	{ 0x7B25, 0x01 },
+};
+
+static const struct imx258_variant_cfg imx258_pdaf_cfg = {
+	.regs = imx258_pdaf_cfg_regs,
+	.num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
+};
+
 static const char * const imx258_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -643,6 +668,8 @@ struct imx258 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	const struct imx258_variant_cfg *variant_cfg;
+
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
@@ -1134,6 +1161,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
 		return ret;
 	}
 
+	ret = imx258_write_regs(imx258, imx258->variant_cfg->regs,
+				imx258->variant_cfg->num_regs);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set variant config\n",
+			__func__);
+		return ret;
+	}
+
 	ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
 			       IMX258_REG_VALUE_08BIT,
 			       imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
@@ -1490,6 +1525,7 @@ static int imx258_probe(struct i2c_client *client)
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	const struct of_device_id *match;
 	int ret;
 	u32 val = 0;
 
@@ -1565,6 +1601,10 @@ static int imx258_probe(struct i2c_client *client)
 
 	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
 
+	imx258->variant_cfg = of_device_get_match_data(&client->dev);
+	if (!match)
+		imx258->variant_cfg = &imx258_cfg;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
@@ -1653,7 +1693,8 @@ MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
 #endif
 
 static const struct of_device_id imx258_dt_ids[] = {
-	{ .compatible = "sony,imx258" },
+	{ .compatible = "sony,imx258", .data = &imx258_cfg },
+	{ .compatible = "sony,imx258-pdaf", .data = &imx258_pdaf_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx258_dt_ids);
-- 
2.25.1

