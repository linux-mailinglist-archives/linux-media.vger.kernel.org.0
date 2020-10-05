Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE0028395C
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgJEPQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 11:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgJEPQG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 11:16:06 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C85C2078A;
        Mon,  5 Oct 2020 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601910965;
        bh=h+mjNR7Ih9SPH2szRZ48s6Wbw1Tsxse8uOiktaYvNf0=;
        h=From:To:Cc:Subject:Date:From;
        b=1Qu/wPSrap3vLZR0kC6AuI6UwX0VM4DuLJhiXzpnWpmZsyVvCLDnyZ55S/ZHkNEyR
         2nsU+8fJhSsWBgrais7UMkNZSYriMRzKJ1DxRvgG24HxKirBVMRNcr/cR5wdTvC9ma
         yR+0wiAQ2VUDgugJC7R7IiEtIRVWHtYUohAjaqfk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] media: i2c: imx258: add HDR control
Date:   Mon,  5 Oct 2020 17:15:58 +0200
Message-Id: <20201005151559.12003-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX258 supports High Dynamic Range with 5 levels of low/high
exposure ratio.  Add a V4L2 control for HDR (WIDE_DYNAMIC_RANGE).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx258.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 7bedbfe5c4d6..aedf8e7c6165 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -61,6 +61,15 @@
 #define IMX258_DGTL_GAIN_DEFAULT	1024
 #define IMX258_DGTL_GAIN_STEP		1
 
+/* HDR control */
+#define IMX258_REG_HDR			0x0220
+#define IMX258_HDR_ON			BIT(0)
+#define IMX258_REG_HDR_RATIO		0x0222
+#define IMX258_HDR_RATIO_MIN		0
+#define IMX258_HDR_RATIO_MAX		5
+#define IMX258_HDR_RATIO_STEP		1
+#define IMX258_HDR_RATIO_DEFAULT	0x0
+
 /* Test Pattern Control */
 #define IMX258_REG_TEST_PATTERN		0x0600
 
@@ -777,6 +786,22 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 				!ctrl->val ? REG_CONFIG_MIRROR_FLIP :
 				REG_CONFIG_FLIP_TEST_PATTERN);
 		break;
+	case V4L2_CID_WIDE_DYNAMIC_RANGE:
+		if (!ctrl->val) {
+			ret = imx258_write_reg(imx258, IMX258_REG_HDR,
+					       IMX258_REG_VALUE_08BIT,
+					       IMX258_HDR_RATIO_MIN);
+		} else {
+			ret = imx258_write_reg(imx258, IMX258_REG_HDR,
+					       IMX258_REG_VALUE_08BIT,
+					       IMX258_HDR_ON);
+			if (ret)
+				break;
+			ret = imx258_write_reg(imx258, IMX258_REG_HDR_RATIO,
+					       IMX258_REG_VALUE_08BIT,
+					       BIT(IMX258_HDR_RATIO_MAX));
+		}
+		break;
 	default:
 		dev_info(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -1193,6 +1218,9 @@ static int imx258_init_controls(struct imx258 *imx258)
 				IMX258_DGTL_GAIN_STEP,
 				IMX258_DGTL_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_WIDE_DYNAMIC_RANGE,
+				0, 1, 1, IMX258_HDR_RATIO_DEFAULT);
+
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_TEST_PATTERN,
 				ARRAY_SIZE(imx258_test_pattern_menu) - 1,
-- 
2.17.1

