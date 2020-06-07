Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313CB1F0D13
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgFGQb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgFGQbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:31:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FEAC08C5C3
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:31:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j12so8732569lfh.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WjXebY5QtcvN7Odp1pbuemzpCVQPCaprQRcJnauls1g=;
        b=xdTL2NQOA8zPNA64Udqix9m8upZNsI4VUW2sLly0Ad9qQw9ZpEacC8Yeh3M8oeYi7R
         xyGaN+/jaQQGQuV5ShduYcJN9elzEic60QctEwL+nSzJVnzeO6V1wXJ1a0Y3dNGCvB0F
         HymT2Tk0BXnG4lBjWA2yfi3U1MwJm79EeXYbSPbwMtWl/RBtSWBy2jXB4mS96nPadHpP
         kxz8l6iKCpkR/w4SEeOH0hQiAPPzIXvAbKVqVuNopbbpgPR0crnATl8qKakTprrDBfiV
         04pyjWVqjBS7W+v1u6o99xPvu3OcAHZ6IwlbwjDfmsFz5JeGEHtplDdKrIzCU3mrYatg
         diXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WjXebY5QtcvN7Odp1pbuemzpCVQPCaprQRcJnauls1g=;
        b=nsQOL0yn2Hkg72jpWE2wYpAjXHWYLbFPJlVnjxBlWsHq8iAF1PFv5jaDBly2aKdG7E
         jltaBOQxkwnBmywJXpsU2+OXuMxlg3Pf4OMa7iyHZ5fsqPr7jpAyKeJyHUcZuqysuXHw
         +jsvu5CZ+BUVrniwbfeYC/6AG1p3VZP5BsZZ2+FX91phyx0if8GmMn5LUjG5BSieSEfa
         a5LrLt+9uO601dTzU+lS5hqgdfyV8FxrR8K9QKejVhtWFIJsg0eR5QxOVbm+zh3WbuAC
         cu5wG5CA7vH5mh7r4rQ9pEiGvORbqGhGpAkBVKuxIttYY8nhpk9sFotnPGSG3DT6Cgp0
         8yhw==
X-Gm-Message-State: AOAM530A9mUk0IUoOX8jtkXWBeqNX1T1ZTp1N6SuwHD/9Y3rUX4TAd/9
        BeaDkNvWjEH7XZwDnO3tXXSdHQ==
X-Google-Smtp-Source: ABdhPJz2+0XORBmKupYT1hANsXAnVr8WdKQBgv6HE9FXfAm085NQD6o5rVpp3L583ehbFYtmVImxMg==
X-Received: by 2002:a19:3f01:: with SMTP id m1mr10354676lfa.130.1591547459202;
        Sun, 07 Jun 2020 09:30:59 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:58 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 06/10] media: i2c: imx290: Add support for test pattern generation
Date:   Sun,  7 Jun 2020 19:30:21 +0300
Message-Id: <20200607163025.8409-7-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
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
index 152b65cb7cbc..67725a5aabd3 100644
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
 static const char * const imx290_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -91,6 +98,17 @@ static const struct regmap_config imx290_regmap_config = {
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
@@ -448,6 +466,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -959,7 +993,7 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
@@ -977,6 +1011,11 @@ static int imx290_probe(struct i2c_client *client)
 					       1, INT_MAX, 1,
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

