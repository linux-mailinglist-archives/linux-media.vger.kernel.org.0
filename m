Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1A91268E7
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 19:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfLSSW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 13:22:57 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40657 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfLSSW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 13:22:56 -0500
Received: by mail-pg1-f193.google.com with SMTP id k25so3546135pgt.7
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 10:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KMxyNKrwFiypU+Za0PvdEdroSKdNRbPMZobhgZUY7nE=;
        b=iyymSRkQTNB324vLkBnS7VSoRJkH72UREfXNbeNFSewtHmL0P6PHfBuqx+np20dLqm
         pJ0UJ/u1YkgyAvj4pYJv/wqfSaOgFM+Qim1/y54eNZ5aso+wYDF5/Nz0PpuuesrXE7/X
         TTkPdjkg9GSOr/mm75SMnBp0I2RQ+6Xx8l40WBW1aAZMibF19pO8lgqE+TV2gQ1RKP6L
         FA/F1iSK1BoFbeDtd+/nAVjUuK2CvoU9QsVitgon4SPe7Z+PoCUOz0aAFVLOStTz5g+j
         11Ha1A2n2+j/45Zxe76ZG5GIhQFe2FoZvdJZjOnFbMexUGqXshCUAg0v2hzJVXVGZxVC
         4cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KMxyNKrwFiypU+Za0PvdEdroSKdNRbPMZobhgZUY7nE=;
        b=DcHye2gcMiSLHa3ndWJSvAVi0ePZqRIWKo1qT91U0pYOlN88UFvDXBp0onXCDA45G5
         lvYWcqLQTGL53rrpxXt29VAQ1zUcSc5QlootDqz/s7QuPlujEeiDaryNDh4pfA39T0yd
         SMuNgwgMC/VNP5luTugs11R+iM9WPSH1SYKTR8AQqVCcbpIUq3ewItsm/o+SXNveYeXJ
         iEkdBevuiQN1L8JunSRlftb/lfcpzMG9RlEAzMxEID4l1dL9+otjRrLtNpmiehVjCti5
         bjbVw4neNV5hGEGHRDFY1oQ6kxQVhzOOkgNbg3seExNMLmvRQ3N/DVg3QBrv3oKcLXR6
         YE4g==
X-Gm-Message-State: APjAAAUcI+S6ptQZQbaFA7YdvrbmMNn5xs0F3NqGiJ0dzAoOYd+27oHy
        Ea3xdboBsyDqhwRMtAdPuSHV
X-Google-Smtp-Source: APXvYqzG1vcXDyCDAjAHlqsGirk7Ni9aKqXLQ+RzNVSCFt0yvdRP9IcU/BWFVEohbUy0NUYg5RcGmA==
X-Received: by 2002:a63:f551:: with SMTP id e17mr10230035pgk.162.1576779775598;
        Thu, 19 Dec 2019 10:22:55 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6010:65a5:a416:e9bd:178a:9286])
        by smtp.gmail.com with ESMTPSA id i3sm9085735pfg.94.2019.12.19.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:22:55 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/6] media: i2c: imx290: Add support for test pattern generation
Date:   Thu, 19 Dec 2019 23:52:18 +0530
Message-Id: <20191219182222.18961-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
References: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for generating following test patterns by IMX290:

* Sequence Pattern 1
* Horizontal Color-bar Chart
* Vertical Color-bar Chart
* Sequence Pattern 2
* Gradation Pattern 1
* Gradation Pattern 2
* 000/555h Toggle Pattern

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 41 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 532ad488b801..96eea0aafd3e 100644
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
@@ -99,6 +106,17 @@ static const struct regmap_config imx290_regmap_config = {
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
@@ -394,6 +412,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -881,7 +915,7 @@ static int imx290_probe(struct i2c_client *client)
 
 	mutex_init(&imx290->lock);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
@@ -899,6 +933,11 @@ static int imx290_probe(struct i2c_client *client)
 					       INT_MAX, 1,
 					       imx290_modes[0].pixel_rate);
 
+	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
+				     0, 0, imx290_test_pattern_menu);
+
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
 	if (imx290->ctrls.error) {
-- 
2.17.1

