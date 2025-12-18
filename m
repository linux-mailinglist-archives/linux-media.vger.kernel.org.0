Return-Path: <linux-media+bounces-49038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECFCC9FFD
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 02:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD617301FC1B
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 01:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C60262FE7;
	Thu, 18 Dec 2025 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVR937tJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0593726561D
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766022132; cv=none; b=SEMuGPI+a8Dk6+zJsTurVHg8xT7DbxCbnbynA/3gI+poCOKWOWyUKTwPj5ddA9DfFQJMgO6st/1+4VWxPOKAe1ttyd9IA+TvbCGg5vwbt4MrAnb7s+t2vE0WBXPpCc+VkN2OCSjZPfjxanZt9NPBuutUMkRu04HmPUFDOm5q4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766022132; c=relaxed/simple;
	bh=FtqYo36tfekF6lbkORU0PcHmok7eNZ+nazj6/9vu/fM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8wCA4NVOepFvOjJF1siORc9A5TPnypT7qgqK+wYY3zQSpgZNumKC05bDsMa86WaUPEhXvIIE/vgy7aPtfhbPoHAu8e3veS8bwlMgwstTJKApbfa/gl4aHm531DCvMwbFmElECDVK6rMvK8Z2Eb627lbpDCPtm8rCU93fvld8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVR937tJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37e8892d4e0so220061fa.1
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 17:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766022129; x=1766626929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGP+/H7CS6BgAhp6cufaMmFUaVYDq2cjxfy/g5LrDCs=;
        b=wVR937tJyz/Tw9FlYul4AkPriSBMDbADDtcdPWrwprbBKPFR6KEtTRXowSRpXw5Pom
         lpg1jDv+S11c62V4/77dmjewvtaTDvJ2R6WTNauULfpExeJUKEOuaIaAloedjImsQGsK
         uA1cvUHruPQNDbt1B4owA0y0ua+rWVHKuZCfpAterd71S8gXHjKQDqw8qAccUXKQ542D
         GSm77q39e3Rp8g+ZB0H0ywMGRw5iA5m8o32iBtDBlnp/rKfbICqFLThzz3L9byS58P9P
         Drfcsm290bsNCHAZgRYEePB3FvBatDZZM9/s6sRiMy/Xaot4AEw855+WPKqHPbzN4m+i
         Y4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022129; x=1766626929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fGP+/H7CS6BgAhp6cufaMmFUaVYDq2cjxfy/g5LrDCs=;
        b=o0RBEfCooZ3NzXD39abeghDWjccpbOioLV8DQNWGO/98Njyu9xGs89BVw4iZbvKW2W
         pk/qlgBIIQ64TH82G/0nwNbM2bd2CEBZ5eMBsLiNPBnVeDleaM++MyDDGj1DrC695N3z
         PASdMCNg+ne5UKdxleSimRuy0phGRz+qsUk+UsN7E8SVx8ATOtFjU7KnV5ibiXuxAKNJ
         FQeoWta4NwCNrd9MsgxDF6c/lG0c88ljvR+clTaQiFKOY9RY1v3YF7R59bMiX4oyLrtv
         Y+jpR4AaHdXqmVhaY3igIFrXZemOqkKWNHXO90Zn1WLF0NaOGnYbGx0m26PuGCgayANQ
         u8EA==
X-Gm-Message-State: AOJu0YwkimQU5uJ2K229tUAUd3YnLbr/cLrvFQFexbNM0jsQhfNRon+P
	ILkuCN/1TrAKsl3Dw3DwUfTfbZD0Tgun+jzyWXnNPq8QOFMtDjHiMBLnLCWInLJv1p6BUDmx65x
	ODgx3
X-Gm-Gg: AY/fxX5ZU7iZ/5DJ+FpN2smdOxRd0mBZUVhr5m2dYr6E0Ls36B8tuvMSDXx71Zztv03
	TjQCWEWozRZDQ1sPIy7cdPNpzH7o8p1vBmzBEewIxXa65NiNxn/azX/k+ULBn15eO5LfTq84MPQ
	NiH56iMmRD7PJcZv6Q/ktuZcY8N6nBA04gF5K+bn8lEpQB5xeHIMNXZ34cWZ0WECmdKSmYzJlR9
	Z8fiZbUaiSFznVFeCdgd01idFL0dhS9j0UOrIGE22V4eAVupDXI2rpcMzRWSZt97ddBGr6dyNYU
	dcqfjeJM6AGtZNGB0rYECNCJcSC1gPGwheBR1tPMOuY0J8y24WTBuV5GHL6mrVZrgcHXBsOYjyv
	yxYUmO/A/+j0RW4wXjNITEErRRCVVkDOXBlGQylYkgxNGx3XjTHveS1ZlE9vgFu8dKp6So+iZPB
	zid7jzNjkD+7OnsUa27UqblTdYx4mHT9ctPCtytQwn+Ioo+mbCPCzHnw==
X-Google-Smtp-Source: AGHT+IErU4l3leLByy9Edcwjo2MaTPlpDlgPBxGFqyqhDcrcK0ktrQU6t1vYd0zniZa+G0B5/yQM0Q==
X-Received: by 2002:a05:651c:150a:b0:37f:aad0:408f with SMTP id 38308e7fff4ca-3811588e7f9mr925941fa.6.1766022129082;
        Wed, 17 Dec 2025 17:42:09 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381132cc663sm4354631fa.0.2025.12.17.17.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:42:07 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: og0ve1b: make configurable vblank control of the sensor
Date: Thu, 18 Dec 2025 03:41:55 +0200
Message-ID: <20251218014155.3265999-3-vladimir.zapolskiy@linaro.org>
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
 drivers/media/i2c/og0ve1b.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 262d9df766fe..64bde90a2069 100644
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
@@ -273,8 +277,24 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
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
+		__v4l2_ctrl_modify_range(og0ve1b->exposure,
+					 og0ve1b->exposure->minimum,
+					 exposure_max,
+					 og0ve1b->exposure->step,
+					 og0ve1b->exposure->default_value);
+		break;
+	}
+
 	/* V4L2 controls are applied, when sensor is powered up for streaming */
 	if (!pm_runtime_get_if_active(og0ve1b->dev))
 		return 0;
@@ -288,6 +308,10 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -309,8 +333,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
 	const struct og0ve1b_mode *mode = &supported_modes[0];
+	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
-	s64 exposure_max, pixel_rate, h_blank;
 	struct v4l2_ctrl *ctrl;
 	int ret;
 
@@ -333,24 +357,24 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
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


