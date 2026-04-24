Return-Path: <linux-media+bounces-59487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIi4C5Qa62lTIgAAu9opvQ
	(envelope-from <linux-media+bounces-59487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B545AA97
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21AA7300F14E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C3D3793BB;
	Fri, 24 Apr 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwT+e/dt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68518371D16
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015375; cv=none; b=pfBvMeLCKAJZju/M/nxeW87IAv6u0unUjd6CHC2kQQg7cyXFGreC9tF1kDW98tt3kjba1VzY+Nx4vxw7N6xwbKYuaH4mlY75hLp/NA1Bm6Kgf+Ht2ScCXC3gA5gncuF3gn7GiTid5WlY0E/TMkJHpR/382ixQ9o7Tlfw5qK6im8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015375; c=relaxed/simple;
	bh=DPuU9UKzjNveL2Uy3y9tUPnjY6ZhEX35Z5uqTrDGofg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBvnqkMvv4bdQ1uJ2zzDO66VVaESfTmpVlzGIv5JToDi45yp2ieiLGq8sSB3YJvB3ZviRyRhVidYohjbue8bIzGKnzx7XWYEEDiziFjzymZResS79qLDvBbtw7QMlkHzc8j0V+CBYPROJNOpt36JV4MGV4MRsbNx1anB6G+u6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwT+e/dt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a525aedb24so6371424e87.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015372; x=1777620172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=SwT+e/dtnF+HXvdlrQmeEZC0tlVMo9xLCeK2S8w+Bz6R6s4CSOfgxIkfESvU71nkhZ
         1P4mHnh84BRTv8JjHhZx7wu4uuFB98c+Gayvq+NeP6+5/hxZ+q7pE6Hv/6Ji/ckT3knR
         zQ08CcaB/EEz+VSkTvUF1G3jpK4XB2pRkb6Gyuzrrq/2cZLvP3dKuhDZ+KzNBuK6nZ6k
         LCdBFj1D3xlr9ox0vjcxj13hbye14vQpngehoMZVb9wiDFwIavEp5qJqW6kOJnHlfjzE
         ZE3pUPDfOh+I8vjMnYcP79740hukY9EqGyF1NznXlg8oKs804BirRCAbXLyoeU+/vS+W
         fY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015372; x=1777620172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=HErmUq+lLRj8fFCk66JfJQGmL903imhhkYtMqvTvh9mIMILWhzFoSh+oVUrRnGaE50
         hAPTNHHmAhm8XMaOw5+Jgevxx0V2z6w7w25XrruKFTeeMkhxQcWRJfvPgyiiP0JsaeaN
         GkTMBdnqn/783VcK+KCz+coASn27BCyTNAoSdHeBJnBrTSQjEQlfIgqO4iAc2u3Ppk2D
         kvqZ/8WvBiYkQ6KZgNtwh5FBQBuExNeY5/z6uVDAcyvzvNiWGfh5DbB40h9k4b9W+aQq
         hbBElolfBzzWZwAqrCvVVq26hdhao/3AX/KmIKOffkwIiiONuZ32/keqvoNqv7PDbGpI
         HXWA==
X-Forwarded-Encrypted: i=1; AFNElJ/S5FsCABeOWk1lke7Tt4ZS4fJPbe75DNDCIatPCA5qcsmZ+fnkKUjHgg7hh+q9OdZTy2edd8so7bzsNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymqiCAKtXstcM5qextibKnnGae++LyTIrwejDUugNGmSpHkEEI
	bspp7zA7e6Wxpbfq6T90j5y5niq18pTBStKN7djs9mkzhK9hD4ciOoqj
X-Gm-Gg: AeBDiev7XyFiQ/iGIRWNEWeJGD2H/OPpi4b9Hl0V1HLwxP4BYAftLhSG/xI+t+1o0wv
	7oXkGG0cuFfK8yCIYX5mCWzlsbWZ7vpanrg3zZgkHn/jKVdy5hNbjc7nFkAoBu3fqU5dMIB6x1F
	5qHmUypqv4PVsCG3QHSL8xQgx5gTNnNPJtPpMgISzLsMojPmQ8FOkVJmxQ/iobdkvi4zi1Bhtng
	bHt8vl5xEERW8u/vSYKRUpFE0zXb1OVpLMpttHOF03dC+hhW0RStBYS2lEFFgTTop/ZAD2ITrfZ
	zBzZAC96fFmXYF72EJqHJIbaP00+N8zsPhlfng+IIfFaMxNyYKmWNAgu3nDyBhkHWVUM4JbJJIm
	YOUVXEnCXrNA4UJ1lQdccWvT7Lxz1WmqgBAy/PJLzd92nDRfStHeTJdBf7o/hj1OvFgVkJQ61gI
	owytF0nLAsUwc3+rxBAq7Jegw=
X-Received: by 2002:a05:6512:8005:20b0:5a4:1904:b1fb with SMTP id 2adb3069b0e04-5a41904b214mr6711948e87.40.1777015371479;
        Fri, 24 Apr 2026 00:22:51 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Fri, 24 Apr 2026 10:22:28 +0300
Message-ID: <20260424072230.90354-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9C3B545AA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59487-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices, so the individual sub-device
locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 085a0ef70e39..5cd22c2fbb64 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -332,6 +322,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 		return hdl->error;
 
 	flash->subdev_led[led_no].ctrl_handler = hdl;
+	flash->subdev_led[led_no].ctrl_handler->lock = &flash->lock;
+
 	return 0;
 }
 
-- 
2.51.0


