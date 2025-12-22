Return-Path: <linux-media+bounces-49278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D836CD499D
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 04:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C3E300C0E9
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6C1A2392;
	Mon, 22 Dec 2025 03:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IerUingt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E833993
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373005; cv=none; b=QMoCcRm76i24O8H5hTkOboXvh2scLfzBXQrhoKp0AZa8Gw4+eXE7++L6DejWX73eT1iFl9HyOZCebmeJ18SHkAUsTS4GKno2JI8mQHFgDe8d4ch3eXwbTu3GBxOXfiZD8rrrt1W6WcgIuajc5qGmaN9zI5/oA7F+0yFYJrRJriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373005; c=relaxed/simple;
	bh=+0bJ2ufQ+sjfoaraF8sUga60H2G6cRi0mv9qDbA2a1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDhjWo/P3RHqBJ2ApdOFpSAxYYq12dIyez+M/K45C7O3TDsugfkMtdQJeaLNQTjQQLb7GPYCX84r51hPvqQVgWulS7HJcTUoRz2e3gY9uU0fmlpiOLWLdPfJLRmGpPCen5WLxgPvFdr98j3OB4EG2tIbpxhZ3S3Hyw5qJjVzVNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IerUingt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37e8892d4e0so7648831fa.1
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 19:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766373001; x=1766977801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrBerfiTkxGrACxsNSX1yc2lwlNSOJ5xb65L0kSrQPs=;
        b=IerUingt2AlaYWvGXNRggQYXr4Fc+VAmBbxXNaVt9P48t16TJ2PWY1CE6SS5iye2LT
         Nkv8eiQKH6oJvzk9prUUUHGqYCvZncgTFbKmcag6Ll7BI/IEHkOT2YO57rK9Loe6UoKk
         0eHuNKCYeTy3Q3uwM0xSknMcXDOk30JO/755Rh6ukpL0gfcHCYnrnlOpdT9+5f+b6xoU
         CDVchawOdF8sy5gsSAlqaYitZVWPAXO092+Lkwevhx7ox/DrTr7mq7ErpIXL7IwhNcM2
         11aD1gcUAlW+jj4cQntPGqUaa4kbeQxS1y5fuN+qQqMfa6+Q7i++FxT8hGaboM4il2gn
         LPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766373001; x=1766977801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrBerfiTkxGrACxsNSX1yc2lwlNSOJ5xb65L0kSrQPs=;
        b=tNFrm9dSOLcGWWKqeJ69WRmHBtrkFF4OCEKVgM+4peIUuQ4PQ0FKmLmKHA1crBzRGa
         TD+aK0bYw2Gywxf3GbDdH2XWZCxzk1QTPwG44cCljhqV5n1u1hMIlUal48gHR/Clw/ca
         3J2fpErjV8epEMXR/qIOujrBoprEI5CPw2dpUSAksQ5xm4fjY+z1UTpUTel9Z86KX4sh
         TpoWtjs0berJu8RJ8niAAD+hgK0YmTpWWZYPV8nhTorRvD6LzB18zf8n3DfqGguGQkjX
         QUnb1Fb5ZYEBfFzpYXgDNjEUorCkV1OB5LNjeHFOcgr/mwcvlAIG9EmYdETkffXDf2Vk
         eZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDLV06WPkB7yqzyafhOVVzRhtQ6uFJpulHMU8XSzu5k+E9MEG1+JJVKAMu03pVhpFv3WrazvfTY5AVmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpa/lPHVTQim7grPHcVA/FS8I5VPzgXGW9qBgECpIT9/PnHrI
	VSKCoP49EHmi56JFNnbi7GbmcozSWKALaUYETycXh+2C4mn55qfTw0MIRcMQhAwhMPc=
X-Gm-Gg: AY/fxX7TZSk32YO9/y6HjxIx1b2FvxJJXBOHrKH/+HZI9Bg48Gvaaj5vHngooeQeQsF
	nk1k84bGXTm2jDbRfT0um/KIpE9jp6/jM9UNv5iBCtFdqpe6qrxwfh8n+cXepy+Ejz7Qahht9bR
	P5Trc368tqhiaWOFTsnJPE1QAQNtKNIC5ozej0hutqbasAs1Hqjw0BzP9U1eoL5Kl+OSEcJoS9f
	P4n2SbfcAVBQL5YfQyptyegG08iYjS9YkUJMGY5yv7/u56MsHCM7oX1hQT2eqUgpjT3xmj0MImt
	EEuCd0bSlR9heC5Al/seBtft6jDX3QlTvChsLUP3k2hIvtiwVzUXrmyA0Ymgwk/buwYia5xI0Kz
	rgRwRn4Lc8rsnZ0lFb+4QII+Bj6fqJKfUPJ0mBDEt+RZjsVa5WZix6nrdEeEHQqVDBXz2Yp8lLJ
	utxgU6PaIhe3PWZ4u73uEXw0IMsvEze7la7nTyjiCtQdSZBcKAMXLKjA==
X-Google-Smtp-Source: AGHT+IFpTUUHUDFw92VRKIG0Lg1O0c0IM4pBqhBPWN8zceNhP6kysEyoY/cF72iB4dZRvjA0Kz4tKg==
X-Received: by 2002:a05:651c:211a:b0:37f:a96c:2b9f with SMTP id 38308e7fff4ca-38121616442mr13968561fa.5.1766373001391;
        Sun, 21 Dec 2025 19:10:01 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b360sm24176901fa.28.2025.12.21.19.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:09:59 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: og0ve1b: make configurable vblank control of the sensor
Date: Mon, 22 Dec 2025 05:09:47 +0200
Message-ID: <20251222030947.3327665-3-vladimir.zapolskiy@linaro.org>
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
 drivers/media/i2c/og0ve1b.c | 55 +++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 262d9df766fe..84a28cdcade1 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -41,6 +41,10 @@
 #define OG0VE1B_ANALOGUE_GAIN_STEP	1
 #define OG0VE1B_ANALOGUE_GAIN_DEFAULT	16
 
+/* Vertical timing size */
+#define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
+#define OG0VE1B_VTS_MAX			0xffff
+
 /* Test pattern */
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
@@ -89,6 +93,8 @@ struct og0ve1b {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	/* Saved register value */
@@ -140,8 +146,6 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x380b), 0xe0 },
 	{ CCI_REG8(0x380c), 0x03 },	/* horizontal timing size */
 	{ CCI_REG8(0x380d), 0x18 },
-	{ CCI_REG8(0x380e), 0x02 },	/* vertical timing size */
-	{ CCI_REG8(0x380f), 0x38 },
 	{ CCI_REG8(0x3811), 0x04 },
 	{ CCI_REG8(0x3813), 0x04 },
 	{ CCI_REG8(0x3814), 0x11 },
@@ -273,8 +277,25 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
+	const struct og0ve1b_mode *mode = &supported_modes[0];
+	s64 exposure_max;
 	int ret;
 
+	/* Propagate change of current control to all related controls */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = ctrl->val + mode->height -
+			OG0VE1B_EXPOSURE_MAX_MARGIN;
+		ret = __v4l2_ctrl_modify_range(og0ve1b->exposure,
+					og0ve1b->exposure->minimum,
+					exposure_max,
+					og0ve1b->exposure->step,
+					og0ve1b->exposure->default_value);
+		if (ret)
+			return ret;
+	}
+
 	/* V4L2 controls are applied, when sensor is powered up for streaming */
 	if (!pm_runtime_get_if_active(og0ve1b->dev))
 		return 0;
@@ -288,6 +309,10 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
 				ctrl->val << 4, NULL);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
+				ctrl->val + mode->height, NULL);
+		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
 		break;
@@ -309,8 +334,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
 	const struct og0ve1b_mode *mode = &supported_modes[0];
+	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
-	s64 exposure_max, pixel_rate, h_blank;
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
@@ -333,24 +358,24 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_VBLANK,
-				 mode->vts - mode->height,
-				 mode->vts - mode->height, 1,
-				 mode->vts - mode->height);
-	if (ctrl)
-		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v_blank = mode->vts - mode->height;
+	og0ve1b->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,
+					    V4L2_CID_VBLANK, v_blank,
+					    OG0VE1B_VTS_MAX - mode->height, 1,
+					    v_blank);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OG0VE1B_ANALOGUE_GAIN_MIN, OG0VE1B_ANALOGUE_GAIN_MAX,
 			  OG0VE1B_ANALOGUE_GAIN_STEP,
 			  OG0VE1B_ANALOGUE_GAIN_DEFAULT);
 
-	exposure_max = (mode->vts - OG0VE1B_EXPOSURE_MAX_MARGIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,
-			  V4L2_CID_EXPOSURE,
-			  OG0VE1B_EXPOSURE_MIN, exposure_max,
-			  OG0VE1B_EXPOSURE_STEP,
-			  OG0VE1B_EXPOSURE_DEFAULT);
+	exposure_max = mode->vts - OG0VE1B_EXPOSURE_MAX_MARGIN;
+	og0ve1b->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OG0VE1B_EXPOSURE_MIN,
+					      exposure_max,
+					      OG0VE1B_EXPOSURE_STEP,
+					      OG0VE1B_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.49.0


