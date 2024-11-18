Return-Path: <linux-media+bounces-21557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E59D1AC7
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 22:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 806F4B2426D
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 21:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AFE1E7C1E;
	Mon, 18 Nov 2024 21:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fCaQR4Dy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2ED1D0DDE
	for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731966360; cv=none; b=Xfqf8k+pm9y73W7BNLUxlGgXJua2pNokCcDer8JYqTBN8hnn9tErvhg13syce1y/shzeyjuAtaF/9Og4mSOM8hOLsIfTNP6VuUkFVGudBL/InlB9VU6bJDXiq803XZ0jOgQhtbidFUE5kZ3+iKqirBTF6I3xPaV/vTnLfcc5t3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731966360; c=relaxed/simple;
	bh=RcHJ430j7zuHLH8dxtwFfoWvRviemutG/WmsFAOT6+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dgVqUfcxXihLA5xR4gaQV3LOjE901rr8W5RS3c10/pgOJC81bV8gf81FNszRMTV0aJHX8OqpyOCM1j/mMlW14KqtAatyQKrfVI4ff/wmY6WYQbd402DNbPUhrYJbPZmdWpQb7BSUDBHNreYSoJPddK2Wvans9OrjJs7DH3ZLU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fCaQR4Dy; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e71401844so461393966b.3
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2024 13:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1731966355; x=1732571155; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzJ9iZGrEcBbTf0nejIN5hDgxydRztwygpx5P5s5ZPk=;
        b=fCaQR4Dy1y+cI9zEEbdjsAH6kKsreGJjTknuCgwvvdhZv6YJ5yRErSpkPMcopHNvsE
         /Xn+gz1glLODueXERbX5abAgNlcnPjP/FJWrOFfCzrqOcqjLHgr2lu0mIV2xEhKP7UCS
         Se6XVa8/q1pzxSamm39aGtr4UeHJvyW94dNagsLpzwHyaN7cX+D6yWowyGs8GbAudhTz
         Hi3SxWY+ZqfnQHGza4vxoaGjLIPusTkFgF5GhbFzeLO36Eg06MZivobOJxMrpjDVSQXo
         48hSAEBpZRzVf4i/fVfwI1WRRWX9Xgd5FBnakCSpsWq+rJYJA1evAay8/YwAuhwoBAE0
         Lviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731966355; x=1732571155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzJ9iZGrEcBbTf0nejIN5hDgxydRztwygpx5P5s5ZPk=;
        b=j9ZRlYib+2gzfX4L3yRcEFT3U943c0riRFrNmNqbH+3I4BNgbcSI7uhd8A/NT3MtLy
         rkc777JErNxa0cpInXYVJ1xLlDptriuaVqexBGDE4yWO9e5ckUjTbUnE/MLE1JJcgWY/
         /NVcGHoKzQt1ApoZOPNCQBgvhYVjY67gREGLLjEPwByCzZ3nK6mC14Dl1ay+Ry5cB2hf
         oZe/NhzVdpzqxTffD1IbyBVPZ3hcESQibJLlvxvQBDdM/3gVFfNQxpwfK7SSpgJvtuAB
         tlrbm8xyjdDfN3FUgfeE6kTLhwR7H/WjsoiCnAgYZ4oLq+nYsFGiYrVBAdu0Pm6j2Nvw
         ZORw==
X-Forwarded-Encrypted: i=1; AJvYcCX6XHk1UqWbM2jovDyTbcfzHulWMWMCeqUB92PK8fkelnUrMSmBmsSZ/2ekxuDeuVQFrBGXXFgXmARtVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHsbguQnvsnQh4wVMGCI458pYkBvLKtBBIFHLBagSAbAS+K6C
	4ULf9qpDiNC0k8lobhGeHHJ2lJEdhXt/KWhWxz4g8fqtXG0J0Iki5Tl9FgxjkWJD59IpZuRuEWr
	J
X-Google-Smtp-Source: AGHT+IH1AXn+4Pbu9RiK+FuHolQEssxt1all3lVH5cqzQ5YFXDuIzlzryEivRSqXuxQtt4PLe8MK0A==
X-Received: by 2002:a17:907:7f8a:b0:a9a:e91:68c5 with SMTP id a640c23a62f3a-aa483454536mr1156464866b.33.1731966355555;
        Mon, 18 Nov 2024 13:45:55 -0800 (PST)
Received: from [192.168.178.182] (2a02-a210-0a3a-6f80-f04f-3897-bedf-0fb0.cable.dynamic.v6.ziggo.nl. [2a02:a210:a3a:6f80:f04f:3897:bedf:fb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd736sm578168266b.118.2024.11.18.13.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 13:45:54 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 18 Nov 2024 22:45:46 +0100
Subject: [PATCH] media: i2c: imx412: Add missing newline to prints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-imx412-newlines-v1-1-152fe6863838@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAIm1O2cC/x3MQQqAIBBA0avIrBMcjaiuEi0qpxooCwcqCO+et
 HyL/18QikwCrXoh0sXCR8jAQsG0DmEhzT4brLElItaa96dEqwPdGwcS7UbjLPqhqYyHXJ2RZn7
 +Y9en9AEBvjsKYQAAAA==
X-Change-ID: 20241118-imx412-newlines-3b0321da960d
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add trailing \n to dev_dbg and dev_err prints where missing.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/media/i2c/imx412.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 0bfe3046fcc8726ef4e484d0fbf980422343fccc..c74097a59c42853ff2a1b600f28ff5aacedb1c6b 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -547,7 +547,7 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 
 	lpfr = imx412->vblank + imx412->cur_mode->height;
 
-	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u",
+	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
 		exposure, gain, lpfr);
 
 	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
@@ -594,7 +594,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		imx412->vblank = imx412->vblank_ctrl->val;
 
-		dev_dbg(imx412->dev, "Received vblank %u, new lpfr %u",
+		dev_dbg(imx412->dev, "Received vblank %u, new lpfr %u\n",
 			imx412->vblank,
 			imx412->vblank + imx412->cur_mode->height);
 
@@ -613,7 +613,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure = ctrl->val;
 		analog_gain = imx412->again_ctrl->val;
 
-		dev_dbg(imx412->dev, "Received exp %u, analog gain %u",
+		dev_dbg(imx412->dev, "Received exp %u, analog gain %u\n",
 			exposure, analog_gain);
 
 		ret = imx412_update_exp_gain(imx412, exposure, analog_gain);
@@ -622,7 +622,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		break;
 	default:
-		dev_err(imx412->dev, "Invalid control %d", ctrl->id);
+		dev_err(imx412->dev, "Invalid control %d\n", ctrl->id);
 		ret = -EINVAL;
 	}
 
@@ -803,14 +803,14 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	ret = imx412_write_regs(imx412, reg_list->regs,
 				reg_list->num_of_regs);
 	if (ret) {
-		dev_err(imx412->dev, "fail to write initial registers");
+		dev_err(imx412->dev, "fail to write initial registers\n");
 		return ret;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx412->dev, "fail to setup handler");
+		dev_err(imx412->dev, "fail to setup handler\n");
 		return ret;
 	}
 
@@ -821,7 +821,7 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
 			       1, IMX412_MODE_STREAMING);
 	if (ret) {
-		dev_err(imx412->dev, "fail to start streaming");
+		dev_err(imx412->dev, "fail to start streaming\n");
 		return ret;
 	}
 
@@ -895,7 +895,7 @@ static int imx412_detect(struct imx412 *imx412)
 		return ret;
 
 	if (val != IMX412_ID) {
-		dev_err(imx412->dev, "chip id mismatch: %x!=%x",
+		dev_err(imx412->dev, "chip id mismatch: %x!=%x\n",
 			IMX412_ID, val);
 		return -ENXIO;
 	}
@@ -927,7 +927,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx412->reset_gpio)) {
-		dev_err(imx412->dev, "failed to get reset gpio %ld",
+		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
 			PTR_ERR(imx412->reset_gpio));
 		return PTR_ERR(imx412->reset_gpio);
 	}
@@ -935,13 +935,13 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	/* Get sensor input clock */
 	imx412->inclk = devm_clk_get(imx412->dev, NULL);
 	if (IS_ERR(imx412->inclk)) {
-		dev_err(imx412->dev, "could not get inclk");
+		dev_err(imx412->dev, "could not get inclk\n");
 		return PTR_ERR(imx412->inclk);
 	}
 
 	rate = clk_get_rate(imx412->inclk);
 	if (rate != IMX412_INCLK_RATE) {
-		dev_err(imx412->dev, "inclk frequency mismatch");
+		dev_err(imx412->dev, "inclk frequency mismatch\n");
 		return -EINVAL;
 	}
 
@@ -966,14 +966,14 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX412_NUM_DATA_LANES) {
 		dev_err(imx412->dev,
-			"number of CSI2 data lanes %d is not supported",
+			"number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto done_endpoint_free;
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(imx412->dev, "no link frequencies defined");
+		dev_err(imx412->dev, "no link frequencies defined\n");
 		ret = -EINVAL;
 		goto done_endpoint_free;
 	}
@@ -1034,7 +1034,7 @@ static int imx412_power_on(struct device *dev)
 
 	ret = clk_prepare_enable(imx412->inclk);
 	if (ret) {
-		dev_err(imx412->dev, "fail to enable inclk");
+		dev_err(imx412->dev, "fail to enable inclk\n");
 		goto error_reset;
 	}
 
@@ -1145,7 +1145,7 @@ static int imx412_init_controls(struct imx412 *imx412)
 		imx412->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	if (ctrl_hdlr->error) {
-		dev_err(imx412->dev, "control init failed: %d",
+		dev_err(imx412->dev, "control init failed: %d\n",
 			ctrl_hdlr->error);
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
@@ -1183,7 +1183,7 @@ static int imx412_probe(struct i2c_client *client)
 
 	ret = imx412_parse_hw_config(imx412);
 	if (ret) {
-		dev_err(imx412->dev, "HW configuration is not supported");
+		dev_err(imx412->dev, "HW configuration is not supported\n");
 		return ret;
 	}
 
@@ -1191,14 +1191,14 @@ static int imx412_probe(struct i2c_client *client)
 
 	ret = imx412_power_on(imx412->dev);
 	if (ret) {
-		dev_err(imx412->dev, "failed to power-on the sensor");
+		dev_err(imx412->dev, "failed to power-on the sensor\n");
 		goto error_mutex_destroy;
 	}
 
 	/* Check module identity */
 	ret = imx412_detect(imx412);
 	if (ret) {
-		dev_err(imx412->dev, "failed to find sensor: %d", ret);
+		dev_err(imx412->dev, "failed to find sensor: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1208,7 +1208,7 @@ static int imx412_probe(struct i2c_client *client)
 
 	ret = imx412_init_controls(imx412);
 	if (ret) {
-		dev_err(imx412->dev, "failed to init controls: %d", ret);
+		dev_err(imx412->dev, "failed to init controls: %d\n", ret);
 		goto error_power_off;
 	}
 
@@ -1222,14 +1222,14 @@ static int imx412_probe(struct i2c_client *client)
 	imx412->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
 	if (ret) {
-		dev_err(imx412->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx412->dev, "failed to init entity pads: %d\n", ret);
 		goto error_handler_free;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&imx412->sd);
 	if (ret < 0) {
 		dev_err(imx412->dev,
-			"failed to register async subdev: %d", ret);
+			"failed to register async subdev: %d\n", ret);
 		goto error_media_entity;
 	}
 

---
base-commit: ae58226b89ac0cffa05ba7357733776542e40216
change-id: 20241118-imx412-newlines-3b0321da960d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


