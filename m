Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0358D1E0258
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388347AbgEXTZz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388317AbgEXTZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1424AC08C5C0
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so18601425ljo.0
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O54FRskgHK1TR/NZR20bOnPxvK5tJHkKnr+PK9uS494=;
        b=ZRGjv32Ht26WObnCWn+hq3HY6CKuxST8T8n18Gh4vMczrbp0JeHXGSNyKyAOgXBNfn
         a0kXB6yoTRYWCbEbO48bg5bPwd1pu55eV3R3n/KkmCqn7RtPQQnLWTq92ACuznRmud+U
         DUK7mPX+lbIbG9xTXVJHRcOe3XG1q6E+4Tu8OQ9Gaf5uCIEdOobyLRppizHCaXss9nPU
         JjC0CDt/r8CHasczCjZUcfWhpo95wZK7cCQtjyZom4UloEEH5ASCN1StUCJ9vHoxKzxc
         ZaKYZ8QeVOs6B8M8HXt26moWQ+/XAUSLeyREK+/ryH2DsU6oxu3S9VzDobCkcpUAK0mc
         kw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O54FRskgHK1TR/NZR20bOnPxvK5tJHkKnr+PK9uS494=;
        b=QZNMGgcbtPSFb6ahRV1i9KdC7Cxl4GMWloh+G/P1TA2dgnm9Y0KAND8b0Oe4FGSSMb
         ltoG5+Yj5GqKEvvx50QeoxndHqN58GxYFaJcB3od8yXLhLD0knf3e2c9A2c7b8YccJTJ
         O/CpGLvVtOKpiXF2hka/N0cCBnLQj+MOC/fisWjIL5R6pmv+K9YNw6mckzODBGx5RF4n
         Zc8vMenadqbEtYrtR6HtkT2AU+KNtB8pwknK//5cr3hr1eAwvX3KaxvRT2Ei0DcUpyAH
         QUpGiMfm6MGrvP4MiLYqBnRsfebIS1mk1gpAga3zkO705qZ6a54dGfY6wn3CxcQdDdqY
         FQRw==
X-Gm-Message-State: AOAM530om6iKVnIyuUnGyLNGAFh4v4h3fpdP4GgMcJxNrEvA6XTJX32u
        wfPSYlyh2wu4mRylxpT4xDevEQ==
X-Google-Smtp-Source: ABdhPJwLGeGtJ/7QoEAyHloaq5DdxoRdONb3QzAQODlM4t3p/vwy1q8MVcfdPX1tZySFAecXrrqx2g==
X-Received: by 2002:a2e:8246:: with SMTP id j6mr11735826ljh.54.1590348348560;
        Sun, 24 May 2020 12:25:48 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:48 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 06/10] media: i2c: imx290: Add support for test pattern generation
Date:   Sun, 24 May 2020 22:25:01 +0300
Message-Id: <20200524192505.20682-7-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add support for generating following test patterns by IMX290:

* Sequence Pattern 1
* Horizontal Color-bar Chart
* Vertical Color-bar Chart
* Sequence Pattern 2
* Gradation Pattern 1
* Gradation Pattern 2
* 000/555h Toggle Pattern

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 41 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e800557cf423..162c345fffac 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -26,12 +26,19 @@
 #define IMX290_REGHOLD 0x3001
 #define IMX290_XMSTA 0x3002
 #define IMX290_FR_FDG_SEL 0x3009
+#define IMX290_BLKLEVEL_LOW 0x300a
+#define IMX290_BLKLEVEL_HIGH 0x300b
 #define IMX290_GAIN 0x3014
 #define IMX290_HMAX_LOW 0x301c
 #define IMX290_HMAX_HIGH 0x301d
+#define IMX290_PGCTRL 0x308c
 #define IMX290_PHY_LANE_NUM 0x3407
 #define IMX290_CSI_LANE_MODE 0x3443
 
+#define IMX290_PGCTRL_REGEN BIT(0)
+#define IMX290_PGCTRL_THRU BIT(1)
+#define IMX290_PGCTRL_MODE(n) ((n) << 4)
+
 /* HMAX fields */
 #define IMX290_HMAX_2_1920 0x1130
 #define IMX290_HMAX_4_1920 0x0898
@@ -95,6 +102,17 @@ static const struct regmap_config imx290_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const char * const imx290_test_pattern_menu[] = {
+	"Disabled",
+	"Sequence Pattern 1",
+	"Horizontal Color-bar Chart",
+	"Vertical Color-bar Chart",
+	"Sequence Pattern 2",
+	"Gradation Pattern 1",
+	"Gradation Pattern 2",
+	"000/555h Toggle Pattern",
+};
+
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ 0x3007, 0x00 },
 	{ 0x3018, 0x65 },
@@ -391,6 +409,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = imx290_set_gain(imx290, ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val) {
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
+			msleep(10);
+			imx290_write_reg(imx290, IMX290_PGCTRL,
+					 (u8)(IMX290_PGCTRL_REGEN |
+					 IMX290_PGCTRL_THRU |
+					 IMX290_PGCTRL_MODE(ctrl->val)));
+		} else {
+			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
+			msleep(10);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -906,7 +940,7 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
@@ -932,6 +966,11 @@ static int imx290_probe(struct i2c_client *client)
 					       INT_MAX, 1,
 					       imx290_calc_pixel_rate(imx290));
 
+	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
+				     0, 0, imx290_test_pattern_menu);
+
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
 	if (imx290->ctrls.error) {
-- 
2.17.1

