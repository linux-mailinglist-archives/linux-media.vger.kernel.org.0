Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90AD7716B06
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjE3Ra5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbjE3Raz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE803102
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:39 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30ae61354fbso2224271f8f.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467838; x=1688059838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7/FcO1U+j1nYafNALuQBE2oIBBveZJ8k9FM+1r+mLQ=;
        b=PSCTZ0VOFIA3mpQiEXJUivFW8R2a6tk7L5ikbNoZvsr9W2gYRZwLzi/ud/rQmuiBiB
         ct+GrXvxJc9Pab+fK9zXGhuBp09GxNOZezt+SmURMAUlu/Onnq2y7EW2ui2FCqKZNm50
         hAjaI6g1lpTbcyz8rhg5JE8XomTEYzrjRnJPp7+SFgjrra94OigGndnXPwZ1EgJuJ2nC
         BDVdbVEnIVC0S3LJPBdY2YcirvtZbxb+6vTZi3GIeFYMF6w7YPOV5ijtvSwttWufWG3w
         1wHUkvDUp0bCbTq64fes1T8btiDzs57aruc5mZyzNYGt10MN7MqLGhLYIhA0Tsr3uO3C
         fRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467838; x=1688059838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7/FcO1U+j1nYafNALuQBE2oIBBveZJ8k9FM+1r+mLQ=;
        b=GWaix+E+ysx6BSoArj372LG4RPY7I4EQUizR45BT4kM7WvcQFcaqKpLPEylCCohkPg
         IxG2zZx9GIlZX6GLj14bgYyx/BIVSDQNodGXZqmJ14XAorGAS/6zkhvhb+HpeDihgBhr
         H6IBZ0mbHeiKXr+hE06PE4uMCbh15+RttpseKmTyzda/ClSsVk5XNEecL5KV3l/AnKRC
         /qcFcHknP8O1VOhYtnqHfqSVpt0SbK51cf6gUndDt7bzOhIMTYLEGBtK6BhbkfGatZfk
         dclNEOkTGzZF0QsYSAzJAT9KBtz1HfNtasE6IMEueAY3S4D2oKMJjF2n5/wjBYCoYcaa
         YMRw==
X-Gm-Message-State: AC+VfDyuP3Vhs58CeY1PDlOFee2eY9JhUl1k56e/U89BkMsVYJXq2pdr
        ddmTX7KdSDEEilf06u09DB0UUg==
X-Google-Smtp-Source: ACHHUZ5F5xRqIVyM6Ii8wAbGuU8dMOv2X8P1gGJ3+JcLOVS1ZYMlWofiOpOjlu5hbw/a4T/kF8DKcw==
X-Received: by 2002:a5d:5551:0:b0:306:3731:f73b with SMTP id g17-20020a5d5551000000b003063731f73bmr2197212wrw.43.1685467838228;
        Tue, 30 May 2023 10:30:38 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:37 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 05/21] media: i2c: imx258: Add regulator control
Date:   Tue, 30 May 2023 18:29:44 +0100
Message-Id: <20230530173000.3060865-6-dave.stevenson@raspberrypi.com>
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

The device tree bindings define the relevant regulators for the
sensor, so update the driver to request the regulators and control
them at the appropriate times.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 42 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index b695fd987b71..30bae7388c3a 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -507,6 +508,16 @@ static const char * const imx258_test_pattern_menu[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
+/* regulator supplies */
+static const char * const imx258_supply_name[] = {
+	/* Supplies can be enabled in any order */
+	"vana",  /* Analog (2.8V) supply */
+	"vdig",  /* Digital Core (1.2V) supply */
+	"vif",  /* IF (1.8V) supply */
+};
+
+#define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
+
 /* Configurations for supported link frequencies */
 #define IMX258_LINK_FREQ_634MHZ	633600000ULL
 #define IMX258_LINK_FREQ_320MHZ	320000000ULL
@@ -614,6 +625,7 @@ struct imx258 {
 	bool streaming;
 
 	struct clk *clk;
+	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -999,9 +1011,19 @@ static int imx258_power_on(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
+	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
+				    imx258->supplies);
+	if (ret) {
+		dev_err(dev, "%s: failed to enable regulators\n",
+			__func__);
+		return ret;
+	}
+
 	ret = clk_prepare_enable(imx258->clk);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
+		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+	}
 
 	return ret;
 }
@@ -1012,6 +1034,7 @@ static int imx258_power_off(struct device *dev)
 	struct imx258 *imx258 = to_imx258(sd);
 
 	clk_disable_unprepare(imx258->clk);
+	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
 	return 0;
 }
@@ -1260,6 +1283,19 @@ static void imx258_free_controls(struct imx258 *imx258)
 	mutex_destroy(&imx258->mutex);
 }
 
+static int imx258_get_regulators(struct imx258 *imx258,
+				 struct i2c_client *client)
+{
+	unsigned int i;
+
+	for (i = 0; i < IMX258_NUM_SUPPLIES; i++)
+		imx258->supplies[i].supply = imx258_supply_name[i];
+
+	return devm_regulator_bulk_get(&client->dev,
+				       IMX258_NUM_SUPPLIES,
+				       imx258->supplies);
+}
+
 static int imx258_probe(struct i2c_client *client)
 {
 	struct imx258 *imx258;
@@ -1270,6 +1306,10 @@ static int imx258_probe(struct i2c_client *client)
 	if (!imx258)
 		return -ENOMEM;
 
+	ret = imx258_get_regulators(imx258, client);
+	if (ret)
+		return ret;
+
 	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
 	if (IS_ERR(imx258->clk))
 		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
-- 
2.25.1

