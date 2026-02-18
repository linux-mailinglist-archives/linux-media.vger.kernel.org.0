Return-Path: <linux-media+bounces-53066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFObOuMmlmnxbQIAu9opvQ
	(envelope-from <linux-media+bounces-53066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 21:53:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D7159965
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 21:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1AB430090BA
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 20:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3A4349B02;
	Wed, 18 Feb 2026 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlle5eju"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40F309EE9
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448033; cv=none; b=lnbE9oomovHSRK7yXUvZc3edKo3CSS/ZT9s86WL6OOB/sCKTMoWT3q5i8Q02tnoJbigUshOiYtThdxs1tQGUMmwACQ42v71McQnLo4kVl8HuIcuVanXnxCiRGpKAU57iCxK9F3JsfA8H+awnUzahn7iASGDLzTOJeMDCT046yOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448033; c=relaxed/simple;
	bh=WBbz1JwPtQtLlUB0Ags5R5ElXrpkBP+48U3a0r+Ao48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fg1SIHcrnEXYdoZB4oX7eeSrorEqPU6ax8EMixSERXXEPg8iX14hvPvgX0OGb6tEJeSTZ1hd2zrWclmatnWeGbL16tmV1CclxRgCZUAuIJvs8eZlSWo1DamENghRipZ1fVWu3BqxdEQhzjvYojSqq9QgXOv19YloC8qsM8PfXl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlle5eju; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1275750cf9cso214576c88.0
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 12:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448031; x=1772052831; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5IaAyOjfM5CtksSw7FX2Lls2g+goC4uKtSygvcbqUk=;
        b=jlle5ejurAfToUKhYpSrxEip35st6rcHhKeN4sH8zN8mcgdkR+eDyJ8zIMh8Uen84Q
         tUqVTUFVE87l/Aux0PUCDezaaXnQcMeBedY5q831cpSwg3EkUOas4nJJijLHvSwfpELU
         htP9In2Rr9wR16vHRxfR8X+1d1WDCeWRmMlKkMcR2D8dl+Lr/NP1Z88Xh1s/IGZrPpqF
         HuKg020u2Dn5Mp1PMhe/95dCkPf12tNAWXPdcLj6+Ymw7IvnCjfK2pHG8Im1UvWGcjfy
         bcz9Da1LF5CCovKnN44i4r/v7uKZS7n6gLh2dj2biwIr29EPeF10a8x6fhfokv/MuJtA
         GU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448031; x=1772052831;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5IaAyOjfM5CtksSw7FX2Lls2g+goC4uKtSygvcbqUk=;
        b=h8Arumkdayb+hY3E3pB9DN6BTcrNxGVzLOH9D3zvEVgmNpV5LdRko0topM8XaKG0xu
         vVDKy7ejtqNLImjfMX6Ewr323aD/PA8e6DKNR3en2+KncsIU0OTDLThacyYsKE2cZ+O8
         kBi8hOEs0Nap2KYSSK7aVvtaMy1pirEEibQYmL3ueRLvPNUhVRPH2ynt5zAc9UDVcXT4
         Zp/iZlmkYgS6YLBRju3/ZdEk7iHdkK9/jufBrlyxqMBItq7s30xj+q6OY1zchpleUsE+
         tWRkjHsPVW0vmMyDDYZo8mi6xzB6qCClNVQjC5W41YypevRz+DeL3ZA0oWoVqbgQYF4p
         ax0w==
X-Forwarded-Encrypted: i=1; AJvYcCV5zmtMlsmtwZajmd2xHKXOoh3AD/9Hy+uTb5XlZsrYdVboWlPyWWNeYMUVY5vuR/JFmI+fgoiuGJs3hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1YduPaX89B7h3lYIAmMW7ktLXwEyh6hoEHONrvuqypbm2HxW
	RbmuSAGZb1FLgfq1nMucZ5OMhIDqiyj98BLy/mGrOxaLF8KpuR0pbAGP
X-Gm-Gg: AZuq6aKpGs022Sn8DEmKVGHTyHkPVDbRDtQ9lNf6uLtIzV5iuYsq3YJcgbFNYlOpaTT
	M8DV6rt3xYxZJt65ZOh5G1a+s3YHDErwDBkZ+Dxt8kEZpyOWBTuRQAF90XF+2UwdWD93m8hkYR7
	tX0PMfuOG8DB42FnbFpKgGCvSMXPiJ4zhAfmOtZAo+4AZbYCsXJapvnOTdNOD0uZNWpKNck4CAy
	hm7uxwUd/u+Tapnd+d8hJqc5MjzETcAL61SYiOHhkaH7Ei/FXg/lrmYsmNe1c0F7OGJ6XbEa9tw
	H2V+kDIia3DTtpRLCeN8KN/FxMbOM6v9VfLYCEQKeD1i3zUhlBcwCkC/pG7uDJn/suHPSjyLO5B
	RfoAnupleEeeR6u5GdR35u6war+VcLn3xLCDFcKNX0d1dphcOg3KUOd8EcGtHzQTPUeVUjzaOQ6
	jzSSZldIbwoVGCeQgLnIrGZHhBDoFWPMiFb4vDgZG2FHOo426pEXmUGxeWF4xTdHeJ
X-Received: by 2002:a05:7022:4596:b0:124:65f7:2c2e with SMTP id a92af1059eb24-127398443b8mr6634378c88.43.1771448031252;
        Wed, 18 Feb 2026 12:53:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb5575b3sm18181215eec.9.2026.02.18.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 12:53:50 -0800 (PST)
Date: Wed, 18 Feb 2026 12:53:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: [PATCH] media: i2c: max9286: normalize return value of gpio_get
Message-ID: <aZYmtq2CAWhMo1Eb@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53066-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 941D7159965
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by max9286_gpiochip_get() is
normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e6e214f8294b..ac0712ce1e65 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1205,7 +1205,7 @@ static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct max9286_priv *priv = gpiochip_get_data(chip);
 
-	return priv->gpio_state & BIT(offset);
+	return !!(priv->gpio_state & BIT(offset));
 }
 
 static int max9286_register_gpio(struct max9286_priv *priv)
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

