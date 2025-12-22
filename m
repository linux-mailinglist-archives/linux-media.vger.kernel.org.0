Return-Path: <linux-media+bounces-49277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0123CD4997
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 04:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FD6230092E4
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EDA324B3C;
	Mon, 22 Dec 2025 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTWaFsiG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D24324B33
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373003; cv=none; b=R5bUxonuBt+gJMv+TJ4wJRd13N5p6OTpK7VtjQcJkMg3QHikX6+AzLRrgWWKYm/kx2ChMwbdjgslYHn8TZe6PMpejAP1B82jzk4pw0czl7QEVK42iR73U/ANupkZqcXj9ByM+jYUa+WL/wI/W0IRhSNYV3xC2L2fxWz+5Y5B/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373003; c=relaxed/simple;
	bh=JgButqRTf754EzHn9jd3brAUH2BRl3IgpiqZ6cRjiJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b51cxhY0nNXB+vxuPSrk/j4DgpC3Bxdzp1XnAViJEgMUYRCOdrJ6ykcjkKf2G13FK/lIZCpa7A1oF6f8r/hN/7GILFyrflqEiQRH6Pgi4/gGQ8NhRUS6p14hWztb+mR9fQoPDGQeIZy+1WloxNKCSY7XVaRW9Zm3E8Ih+8yVqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTWaFsiG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-597c366f2feso283102e87.3
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 19:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766372999; x=1766977799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II6H1+r8kkpymeSItamWq/7NOBZEazfnxFFFMtqx7iI=;
        b=bTWaFsiGzic4lg3uzsTfG8XqycKykhu4HIJKrRFZk7ibvoP5CqQoA8njyQGKkjLYTO
         tOAL88qa8jvi0xkXYBqJ8sWuP4gt3AaXPwil+yRyHpNX4XN+QH6VXp98K/02hAWK7eOp
         sheMHu9uhibvYLtsNhaSdoXsNJ3yRyCE0SRm9GBSZczn7Zb+o8qo6qeUl6LUQsr5w+mz
         04SCTYfPYOPnrfJVsdpiXgKJswPJ5yYF4akAgz1c7ATRxI11uRMHU0cuGPMbVOdRQ4Fh
         zAkJQGV4adHpM8fjrFTfglOPbiVwM/5S7GEHI6mVz28kWx7s2yKGZkQXS/fjNg3Hr+Xj
         zeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766372999; x=1766977799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=II6H1+r8kkpymeSItamWq/7NOBZEazfnxFFFMtqx7iI=;
        b=iu6EUkT+1vLowYBO0aH88n7IoVSx+6d9bQ8WoRq+KYKx9ldfUMqQ/pt8sr72D8yDT6
         bXnEwYQHaB4pj2FteuoiHO+yGj5l/Na48WnW3qQqwn9GE/bbiW+ftks0RjjuzlRVtEDh
         eEOJ4REfPmTKqyma5jDD78Fy++y7k6PjcCoQCFHYLHYZVqHsZqtPSFnS/v9OdXGdWsql
         T4uI2P6/++b1X2kysvO3YaziY/YgHDGy87SXYBjhELS3fE+MQ8MdoerX8zNt2+aFEcs9
         J7HrV4ZfXx8lPPDXtka9KyZGNP6cOw2oHMEk+8pkkuO4rXgFSCZWbGJNoP59M3BS+L/1
         HFPw==
X-Forwarded-Encrypted: i=1; AJvYcCXVF4+BOI0DTcsl2N+FpUW3x4akRFm9UUbqcu+R3sXGUrdpwyWnbsGYkx+mrYBt+kcgtL7X5zjCkeCVFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/A3z4v2F/c705YT3PYj/r9vm0ZaRmCaXz8gZ0TDK5LDGMtlG
	1IE7hcJFHmmHxj9kbJ0McZHTH0Pc3oJ8b3VqALKdcxDSa3iFpjmGWmt+/6BXNPjtxwk=
X-Gm-Gg: AY/fxX6Rh+p4kj10FoirVllVhViQBBctAKrZa/qxHzvcd5/53JMY7MF7tNoGr7ayUhi
	lovyxPeJA9kOGxta89/bjzepAYAoyF7ZcZkuPTUZfhjMnmHl0I0eZxJtgeFRw7bhAe77mUqxPM/
	QWQLDw5gkNzDaLMJvascPZpPSiROrnjZnPkAjINcRTez8MsQfnipZU48cbc6p1Wtvyqre/fcspX
	lSt8QjcLz4X/PPbNXo5jcvCD516GCYLLv7ask9AxV4CnPNf9bBzkUKCjgh1rj8cKzhTYKPjXqTe
	s7B65CUCub1wjcMqfa0uyQ6YG8uqJmHTYaDJ6T791c7WDfeOqIs3romA9VYq0+hRN38mNWMeXRq
	fhjikxnoabNdeQ5JByOzJfbeBqKZlada5jbjv3Oru1VwM4Cwv0aff2aixt/R2CSx62Jyqpyhnnl
	m4xofr7LwGVJUR+d5pFQwxEfckNlTG2+3IFyoVsff/fbnkyAXMmrI1Mg==
X-Google-Smtp-Source: AGHT+IFJkJ0jSHzwhd4g3QT8ALYWbEiBX96elaIDeOGfb98bECiEp1H5MPJ9RuELRun/M2TneP0Ghg==
X-Received: by 2002:a05:651c:b0d:b0:37b:bafc:26a4 with SMTP id 38308e7fff4ca-3812156a320mr16965261fa.1.1766372999465;
        Sun, 21 Dec 2025 19:09:59 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm24176901fa.28.2025.12.21.19.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:09:58 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: ov6211: make configurable vblank control of the sensor
Date: Mon, 22 Dec 2025 05:09:46 +0200
Message-ID: <20251222030947.3327665-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251222030947.3327665-1-vladimir.zapolskiy@linaro.org>
References: <20251222030947.3327665-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configurable vertical blanking size control allows users to set a wanted
image frame rate.

Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/ov6211.c | 55 +++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
index e3ac5ecf27d1..034d5d57d67e 100644
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
@@ -251,8 +255,25 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
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
+		ret = __v4l2_ctrl_modify_range(ov6211->exposure,
+					       ov6211->exposure->minimum,
+					       exposure_max,
+					       ov6211->exposure->step,
+					       ov6211->exposure->default_value);
+		if (ret)
+			return ret;
+	}
+
 	/* V4L2 controls are applied, when sensor is powered up for streaming */
 	if (!pm_runtime_get_if_active(ov6211->dev))
 		return 0;
@@ -266,6 +287,10 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -287,8 +312,8 @@ static int ov6211_init_controls(struct ov6211 *ov6211)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
 	const struct ov6211_mode *mode = &supported_modes[0];
+	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
-	s64 exposure_max, pixel_rate, h_blank;
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
@@ -311,24 +336,24 @@ static int ov6211_init_controls(struct ov6211 *ov6211)
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


