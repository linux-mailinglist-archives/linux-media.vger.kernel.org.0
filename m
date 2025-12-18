Return-Path: <linux-media+bounces-49037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0FCC9FF8
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 02:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B5D8301D5A5
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 01:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D6C262FE7;
	Thu, 18 Dec 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMJqcig5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E7265CAD
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766022130; cv=none; b=EA9uXe40Cb/ZJYblFX7jUFysUfJwVKLBdFpS2vM3YkjDGqtqSTqqZ0GSXukOR10QWs+Qcpi6imKjUg4fmXEvPE3JtiBzyrJPznNVz4Igex49XzjDMrI4A8bBb139bwOSdlNDfpcA1Os0r+SWti0fZDB051Cm9PQk6LWcPVkY844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766022130; c=relaxed/simple;
	bh=E6jlg4oxluSYPwBg87g1GHndxwmTAfJM286mzPbTkqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISpHa6zUPc1VqyjMl2QCuoDVxQUTKRwEFGbQTlwjYtJuzbnSsXi0jpO9glUdcZmUCJtFZ9YSSIx3rENTQgmLz3dYwU2PZKKWdEHzH0sKGKMcb0FAfUJKju5P/GwGqOuj1MAHe7/KjRzAkD+Vn39SvMZ96uIK/iGkEFHAYM9EkoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMJqcig5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-598ed017e4cso17361e87.0
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 17:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766022126; x=1766626926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3xph64nGx9TvQ/BbvWUE4QNou6r9UpcwU4r0ysu6ps=;
        b=HMJqcig5cdZsL45hmp9j1DS1+qVUUpqlRizXbM2UAFs7hQGN2QtsH2VO74nGPtviud
         RgR89l+cNr8ppCQAyiDwJdd2X8CDR0VHk3mdi0bvaIIWB5AvJLHGeOZMlloSU6Rx3cmZ
         a9CLLorWsCGa00JCxUI1QBCcHZwDX3phVqO482oJrHBiQ9tkP1Zsc5FDSmq0mUmDFFqF
         7RqIRtx0WDO3zueak7cIR1BnGBaRw6kAsGSbNr68mVDoApQ0rTeqLhLjMx9wzhp9y99w
         QnFKfE0h4tcemQIZVwpn9s1/xVBuBT/YEY5LcrhgONR8FEmr6SAk7IPf6/AedYbKqRTb
         p0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022126; x=1766626926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3xph64nGx9TvQ/BbvWUE4QNou6r9UpcwU4r0ysu6ps=;
        b=cf2cF1A3EDcDU8B/mxD8YBwwtrsmeuILAuIS03wMEAeMSzkvUc4oLuAGGrS5W71dJd
         W/XKIFpkFSy56r7hgCMvSEPDt1Wk0UHy+zMj2u/hSQFfawzCaGICnIJOsukabWIsOCGj
         t10W3XX9d4o5HZl8fOcZ7iPMNHoikSKRh2sp+pZNfnT24yPdUVA+56U42IIId6xHIBAv
         R2kB+jpLMFouvTj8B1Y5fMgFamml4EutDMQL0HE4gUI+xZ/cs8wLpJqzJXp+H4DiHJj6
         Q4S9pWuExOjALqdR86RVAkyBzly6avZmMLXnOi27AeI+/7yX3D4Se9ycJlvUFW5qELis
         9S2Q==
X-Gm-Message-State: AOJu0YzWd+cAx8nNBLHuJDAnVo6bRifpFMAMJH7iHcVbQQEBi2qychAa
	9zxedVmoEi8z9WLhENhmgXDKy2GxrsOLuAeEkSGnUHVEKzLQqcVRt6D7WBbevz9Ai0DSbyB4+Wf
	eWQNx
X-Gm-Gg: AY/fxX7TnY2HfKrZceAyEd6cmPIlAjGTJMSvioOWyyUr121VH9/J+4YIq5Y++4Q/Krh
	+CivRUGXRsgh+UY0IEHTRedqNFujiQppOm4rBvCY1s+4wKK3LZ2fEOJVAl9TGY6g8dbme7SoKmX
	xZT9Zpgzftmk2sWQTUycp1aToI6woZM6BaTyGEfR4ibrJZdZmsdU1yMiN0oicULrHKqKE5L0CDt
	/bBezozgNdDE4LrA3tqunjbwBocKiEvhflZyN8t8yLnnnOUU/PBHsQ2FJE0mcyhX1x3t0nRtf8T
	naKu2AmvAC/sENj+11uAWyHTsNkYYqThBHv5SdvJxtFDqwQGF2E7RKdB1dyfd03FVPIsHEqaHau
	H1pAWN7EXlliOXp5U0sXtge80tWZQtqms1pqCCVgjetOEtufWosTKGRF9BXqitqgcwqYAJrgzo6
	2yYvjBNA3Ykm3ftJPoi1l/z1MJpAYiBrPbQiBx1aJ4s0toPJagDEZ3qQ==
X-Google-Smtp-Source: AGHT+IEIn0Rmfmu59I0nT85yJhf2JNtQweKMOViChL0J6n8Ujmv5jbNqr5ZHJp8lFSYMQnjDLI0CAA==
X-Received: by 2002:a05:651c:1542:b0:37a:9595:a77a with SMTP id 38308e7fff4ca-3811597ea29mr898281fa.5.1766022126298;
        Wed, 17 Dec 2025 17:42:06 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381132cc663sm4354631fa.0.2025.12.17.17.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:42:04 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: ov6211: make configurable vblank control of the sensor
Date: Thu, 18 Dec 2025 03:41:54 +0200
Message-ID: <20251218014155.3265999-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251218014155.3265999-1-vladimir.zapolskiy@linaro.org>
References: <20251218014155.3265999-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configurable vertical blanking size control allows users to set a wanted
image frame rate.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/ov6211.c | 54 +++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
index e3ac5ecf27d1..5c784b1b3c84 100644
--- a/drivers/media/i2c/ov6211.c
+++ b/drivers/media/i2c/ov6211.c
@@ -41,6 +41,10 @@
 #define OV6211_ANALOGUE_GAIN_STEP	1
 #define OV6211_ANALOGUE_GAIN_DEFAULT	160
 
+/* Vertical timing size */
+#define OV6211_REG_VTS			CCI_REG16(0x380e)
+#define OV6211_VTS_MAX			0xffff
+
 /* Test pattern */
 #define OV6211_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OV6211_TEST_PATTERN_ENABLE	BIT(7)
@@ -89,6 +93,8 @@ struct ov6211 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	/* Saved register values */
@@ -167,8 +173,6 @@ static const struct cci_reg_sequence ov6211_400x400_120fps_mode[] = {
 	{ CCI_REG8(0x380b), 0x90 },
 	{ CCI_REG8(0x380c), 0x05 },	/* horizontal timing size */
 	{ CCI_REG8(0x380d), 0xf2 },
-	{ CCI_REG8(0x380e), 0x01 },	/* vertical timing size */
-	{ CCI_REG8(0x380f), 0xb6 },
 	{ CCI_REG8(0x3810), 0x00 },
 	{ CCI_REG8(0x3811), 0x04 },
 	{ CCI_REG8(0x3812), 0x00 },
@@ -251,8 +255,24 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
 					     ctrl_handler);
+	const struct ov6211_mode *mode = &supported_modes[0];
+	s64 exposure_max;
 	int ret;
 
+	/* Propagate change of current control to all related controls */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = ctrl->val + mode->height -
+			OV6211_EXPOSURE_MAX_MARGIN;
+		__v4l2_ctrl_modify_range(ov6211->exposure,
+					 ov6211->exposure->minimum,
+					 exposure_max,
+					 ov6211->exposure->step,
+					 ov6211->exposure->default_value);
+		break;
+	}
+
 	/* V4L2 controls are applied, when sensor is powered up for streaming */
 	if (!pm_runtime_get_if_active(ov6211->dev))
 		return 0;
@@ -266,6 +286,10 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(ov6211->regmap, OV6211_REG_EXPOSURE,
 				ctrl->val << 4, NULL);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(ov6211->regmap, OV6211_REG_VTS,
+				ctrl->val + mode->height, NULL);
+		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov6211_set_test_pattern(ov6211, ctrl->val);
 		break;
@@ -287,8 +311,8 @@ static int ov6211_init_controls(struct ov6211 *ov6211)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
 	const struct ov6211_mode *mode = &supported_modes[0];
+	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
-	s64 exposure_max, pixel_rate, h_blank;
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
@@ -311,24 +335,24 @@ static int ov6211_init_controls(struct ov6211 *ov6211)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_VBLANK,
-				 mode->vts - mode->height,
-				 mode->vts - mode->height, 1,
-				 mode->vts - mode->height);
-	if (ctrl)
-		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v_blank = mode->vts - mode->height;
+	ov6211->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
+					   V4L2_CID_VBLANK, v_blank,
+					   OV6211_VTS_MAX - mode->height, 1,
+					   v_blank);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
 			  OV6211_ANALOGUE_GAIN_STEP,
 			  OV6211_ANALOGUE_GAIN_DEFAULT);
 
-	exposure_max = (mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
-			  V4L2_CID_EXPOSURE,
-			  OV6211_EXPOSURE_MIN, exposure_max,
-			  OV6211_EXPOSURE_STEP,
-			  OV6211_EXPOSURE_DEFAULT);
+	exposure_max = mode->vts - OV6211_EXPOSURE_MAX_MARGIN;
+	ov6211->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     OV6211_EXPOSURE_MIN,
+					     exposure_max,
+					     OV6211_EXPOSURE_STEP,
+					     OV6211_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov6211_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.49.0


