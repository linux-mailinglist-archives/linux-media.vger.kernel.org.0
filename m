Return-Path: <linux-media+bounces-23499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E59F3C5E
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2E21890C7D
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F299A1F03E7;
	Mon, 16 Dec 2024 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhjA97Ok"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572F1EBA1E;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382892; cv=none; b=BayyDXwsiwBJ4IyFdN4ZKl1e9N6fdL3C3nn0LU/yhA9YDDZTP4ALGp1pmAIXSOGIO9nKA1NILRmkBbANEmukn7Cea3vyAJS6DRJD1FDaxnX+v0G3C78G/IHeusmw81iIVHJiRmJnID1F5RqdohOKOk3JWvz1Qi57xHpGFNJHWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382892; c=relaxed/simple;
	bh=Qbc3XC17iyOY56lG8BSpVs0HmK+jOxwZhtwNl3yPBj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xesu6uuaLSwiYUlvn/ZzmRF1jLl3QOAhzVF+X4+4uCMWjbTJquUXIfthgRJH80DksqnTNNbyHYzZa2g85yxeEDzfcaEAEq3fhhhLXbPZSMpgyEMgLjDRnosvWufTJO0FgU3HUAgOEfENZuLLMCLB2HbamFSArPhXDLWZhK8E/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhjA97Ok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D82DC4CEDF;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734382892;
	bh=Qbc3XC17iyOY56lG8BSpVs0HmK+jOxwZhtwNl3yPBj0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OhjA97OkMB9MW/XHCw3X2HyMlcDyxnMHxb5WNXbqqnxaBfIrEExX21P3CUF9tzKv1
	 uo6p0gJ1mHFxt7N6qO/hNwr7W78z0Brc7vMLhC2u9nsnlGWzvzgXWpY3HJVU5ZmZL6
	 A1IORob5qqOCiYdFDxnhwgiioriTVXixMCIJFapxVaCrfZiAfXhHMRQTXAVf6aWWz6
	 yIfRfOhb2KkVPuH4rnU7LJtq15jrqn7fn7FXB4azA+f+q6FFutsZpn//S3RMUJcs8b
	 rPZMcArNIhWU0lYCmEtd9DmVR2jOYQ5nEP2NiYPLif5TZpAyxVjyq1oP80S1oyKVpS
	 0M1mKixnW1hiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648A4E77186;
	Mon, 16 Dec 2024 21:01:32 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 16 Dec 2024 22:00:55 +0100
Subject: [PATCH v4 09/13] media: i2c: imx214: Add analogue/digital gain
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-imx214-v4-9-8cbda160fbce@apitzsch.eu>
References: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
In-Reply-To: <20241216-imx214-v4-0-8cbda160fbce@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734382889; l=4360;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=U31A7rhuOcXed0fWhewKyAOx8tnN+Kiqi4jmnEn6KYk=;
 b=f3oBI5TRa8oBP1/gQctt5HLAEpdtGrP6sfinIhULicp1ESCkWxoCj1IRSmbTmlhZKHnfjoTbQ
 V1naNRvRxW5CYFcttgLS8x6bTA1DLPM0kT2PdqthjnnlgwmOmBKu1lc
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 sensor supports analogue gain up to 8x and digital gain up to
16x. Implement the corresponding controls in the driver. Default gain
values are not modified by this patch.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 53 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 880b4bc506d898181965737f3f8262fadf70a5fe..91d0e892f9ac30a86cd0e1848e4b0d9befea2932 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -52,12 +52,20 @@
 /* Analog gain control */
 #define IMX214_REG_ANALOG_GAIN		CCI_REG16(0x0204)
 #define IMX214_REG_SHORT_ANALOG_GAIN	CCI_REG16(0x0216)
+#define IMX214_ANA_GAIN_MIN		0
+#define IMX214_ANA_GAIN_MAX		448
+#define IMX214_ANA_GAIN_STEP		1
+#define IMX214_ANA_GAIN_DEFAULT		0x0
 
 /* Digital gain control */
 #define IMX214_REG_DIG_GAIN_GREENR	CCI_REG16(0x020e)
 #define IMX214_REG_DIG_GAIN_RED		CCI_REG16(0x0210)
 #define IMX214_REG_DIG_GAIN_BLUE	CCI_REG16(0x0212)
 #define IMX214_REG_DIG_GAIN_GREENB	CCI_REG16(0x0214)
+#define IMX214_DGTL_GAIN_MIN		0x0100
+#define IMX214_DGTL_GAIN_MAX		0x0fff
+#define IMX214_DGTL_GAIN_DEFAULT	0x0100
+#define IMX214_DGTL_GAIN_STEP		1
 
 #define IMX214_REG_ORIENTATION		CCI_REG8(0x0101)
 
@@ -280,13 +288,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
-	{ IMX214_REG_ANALOG_GAIN, 0 },
-	{ IMX214_REG_DIG_GAIN_GREENR, 256 },
-	{ IMX214_REG_DIG_GAIN_RED, 256 },
-	{ IMX214_REG_DIG_GAIN_BLUE, 256 },
-	{ IMX214_REG_DIG_GAIN_GREENB, 256 },
-	{ IMX214_REG_SHORT_ANALOG_GAIN, 0 },
-
 	{ CCI_REG8(0x4170), 0x00 },
 	{ CCI_REG8(0x4171), 0x10 },
 	{ CCI_REG8(0x4176), 0x00 },
@@ -350,13 +351,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 
 	{ IMX214_REG_SHORT_EXPOSURE, 500 },
 
-	{ IMX214_REG_ANALOG_GAIN, 0 },
-	{ IMX214_REG_DIG_GAIN_GREENR, 256 },
-	{ IMX214_REG_DIG_GAIN_RED, 256 },
-	{ IMX214_REG_DIG_GAIN_BLUE, 256 },
-	{ IMX214_REG_DIG_GAIN_GREENB, 256 },
-	{ IMX214_REG_SHORT_ANALOG_GAIN, 0 },
-
 	{ CCI_REG8(0x4170), 0x00 },
 	{ CCI_REG8(0x4171), 0x10 },
 	{ CCI_REG8(0x4176), 0x00 },
@@ -748,6 +742,18 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
+{
+	int ret = 0;
+
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_GREENR, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_RED, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_BLUE, val, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_GAIN_GREENB, val, &ret);
+
+	return ret;
+}
+
 static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx214 *imx214 = container_of(ctrl->handler,
@@ -780,6 +786,15 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(imx214->regmap, IMX214_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		cci_write(imx214->regmap, IMX214_REG_SHORT_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = imx214_update_digital_gain(imx214, ctrl->val);
+		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx214->regmap, IMX214_REG_EXPOSURE, ctrl->val, &ret);
 		break;
@@ -826,7 +841,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 		return ret;
 
 	ctrl_hdlr = &imx214->ctrls;
-	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 10);
+	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 12);
 	if (ret)
 		return ret;
 
@@ -875,6 +890,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 					     IMX214_EXPOSURE_STEP,
 					     exposure_def);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  IMX214_ANA_GAIN_MIN, IMX214_ANA_GAIN_MAX,
+			  IMX214_ANA_GAIN_STEP, IMX214_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  IMX214_DGTL_GAIN_MIN, IMX214_DGTL_GAIN_MAX,
+			  IMX214_DGTL_GAIN_STEP, IMX214_DGTL_GAIN_DEFAULT);
+
 	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	if (imx214->hflip)

-- 
2.47.1



