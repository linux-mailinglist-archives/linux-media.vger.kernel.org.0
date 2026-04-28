Return-Path: <linux-media+bounces-59836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMjgI1Gg8GkRWQEAu9opvQ
	(envelope-from <linux-media+bounces-59836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:56:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC248457B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85F4731219BA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D6A3F1674;
	Tue, 28 Apr 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8R5Ul/R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94863B4E9C
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376389; cv=none; b=oDDduz63aBmS4jk9BQebSRYugYqTwlHDYB2+ZRlVN44n7enSu7ty3RcRCEWaN2W5446eQBhlr18aN2L0VXmoP27Qko/SQznNKXOy/aC/WTzBo9Xx6+Y/irKY7H7fGaOwCdQK8gR4DGPORfSnJfbv0yy2kD4jcWC1Ynst5qEf1Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376389; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cc8cU7HoGICK8fp7FbDv7Vt62N68vwDaib4idaOBsG4eVOKJdxZ0Xmw7TtfhcMZ9I6a8ldLDCScOjOu+grEtyfar8nAb68cknv8SKj6wf4YxTNQMvtM2WN0JF6TNa6ZzhDiq7lRQkx/Gpx6fCxe0hAlj/5ZyRedbtlDvnt2B9Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8R5Ul/R; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so78676105e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376385; x=1777981185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=U8R5Ul/Rtjv688G/ApPoqfcvPkZAw4zHfPzYzdfWwdy0NbioFyKUIuOqbmTm21kRrV
         5mkkK7T4LZ7w1tIDmc3dOQrvhfVkIrlChjODdPWFaBwIjo62hybK5RlMCVSC/H9VdQRj
         jz3risBC4lv20gsYNYzaTwkpinOlUKOL6aEFhGH+Ob1+G1ZkcJoASg4AFXA7R6djPU3A
         GJUtLAf/HFG3ILwQDqXzuKi+OIQGmQ0mMxDs1ux3lub9XDp1IWBw0FjvynVWAvdG4cTr
         7jFGsaNrp+IvO8UmJCOgUDGnxbWV2f26qw4WniXp9d5aDiLUMeblcQKdyBvcFdTLppof
         Qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376385; x=1777981185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=NgcsXO3623AjvrpIJBpRSPHdxXTIuiusIq0DpNAF+pD6bop0WDc3qrCWBgdgh1gWzi
         k2FVXh1Dtq7328r53G2uIWRE6kPq95O9uNKyWasyQkncELlvJqT8V5uFObpSG1hvdvce
         YL70TXL1rGgqjjfRLiDmLdNP2cNb5jRVpXras8OWcjAS4F/iQU+QRFGZL665gf1Pk5GD
         uvpYvaSwATywWnRCSRtTwIqyqvmdm25UKsTCraJ4pDYHuc1Qn0tU7aJRI1JftPhh24AN
         fLHpU9U9SnFUkovsVHkyr23+mVxNh5tVhhHOByTzwaRLozQe9UouL2UtzMABP/s/EHY0
         qrZw==
X-Forwarded-Encrypted: i=1; AFNElJ8FS2Zb76URwBO+mjbuwsXVYH6AywIrO/dr5Vr1NX+T/cU+zXPyfSkf/Lbb7CPmrX+L+itSOPq6tWSbqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy94/eJVSgfF4udTmV6N6Zt6j/6AYN6gARfW7oFzKuIuSPJukfm
	xt84CGF8skGSgJeeimqV32Oq+zvcwjHM0atqjejs5x+k3JMp0AHkJt6Y
X-Gm-Gg: AeBDies+F9CQ6aLS3QZeAikdN2LcacvYnxiUk481MqvbQWiPo/GTshLO8vjd+p/xtbc
	Hh6dJtF9lWDAJ8l6PCE+fj9Ph96/bkS+3oH8kbFSbi6NaB6TBUKPWhx/dX5e80QxZMp/DOfij7y
	VwhQlI0Bj5uNnimWzBk0Y1NZrYjw82X+sldWHGn8+KDNnjYTGuRZiPwcZGDquSfDx7ooymP7hA/
	cb+2rutaAiHKF/t4GZjDOQltai2AYK95UxYZMPldRPhBG2JqVuNY723ucM0a6loRgtxrVWcIXlV
	FCtFVh42mZVv2+CXCLQYOYCvYRhy8ukNkJUwtHy0ubURvnseDaDhY+xPqjfU+h062EjOCxrmsUW
	so4L9I1e+HUF4LlAVseH0cYQU88hfEJbGg6gyz1zQKFCTwRTxCWNhUW4sXxjIkUZCGly4S8MUbT
	HEx3TJgTrOUYtgFTja/JF/zhE=
X-Received: by 2002:a05:600c:1d0a:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48a77b1e893mr45325545e9.26.1777376385036;
        Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:44 -0700 (PDT)
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
Subject: [PATCH v4 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Tue, 28 Apr 2026 14:39:20 +0300
Message-ID: <20260428113923.112920-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0CFC248457B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59836-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices since they share same hardware,
so the individual sub-device locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index edfb07587cab..5b568ed9536b 100644
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
 
@@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	if (fault != NULL)
 		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	hdl->lock = &flash->lock;
+
 	if (hdl->error)
 		return hdl->error;
 
@@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].state_lock = &flash->lock;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0) {
-- 
2.51.0


