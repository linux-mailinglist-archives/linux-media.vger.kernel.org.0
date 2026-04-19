Return-Path: <linux-media+bounces-59095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF9lMF2i5GmUXgEAu9opvQ
	(envelope-from <linux-media+bounces-59095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:37:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 315CB423893
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D41373030C95
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 09:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2048537CD27;
	Sun, 19 Apr 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1UirRBg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACBC37B027
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591281; cv=none; b=Aq8GAkjbt/Ymwi/T6fJn15JN2E8eRB2J+eOpHjRHjJCkgzYbeUJmRUwrgcGm6P1p0t7gwyO4ERT0ayPW3cYhBchgf0OjBCZQ+1xU8VyRAhTf5JgmUhRwjy8cRWTgNcydoRSv64lpVat9g/nDmsX8MBvat1dI4+JvW4mVC5T996c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591281; c=relaxed/simple;
	bh=NnTZhLTZnNfRAZTpInLPnO6pd8hHUs/jOhkVX7vXeK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRb05XBzjPjI2xHuKozrZRuTTLpyS2o5xB9zshVYdW3/6LNNvEa5OC3RsacZFwrCeNlFKKtmHo9j1JaqYqHE3ms0w4CgnKVh3G4/R5V8tBvKguIk1pUFzSqFZbD4f9pRBvMFZFosFfd7VkuY4Se4684XG07i3i/nbtVJmRUvrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1UirRBg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38be5e86918so23903171fa.3
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591277; x=1777196077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=b1UirRBgWKe01ZefHYhHt1bIkKPpu++bcmRdJHnOQMF9ezzyrG6OjGKTq1n43OEFQt
         0TdIMRMlYaNV2F5StHZG7tQoL4cWFnL2cT4NXCui0E3xMmnpvet+fzPLNOtZytMvfPCi
         z7xojrwVGisE517O659eDeEUUMXkWSJmvae4qE5S/U7rnTfw2UgTRe9ctWzUL0vZRgYY
         KN5qIvKuoPwixGZ58Fs9x9Eggvxsw+GW0PvYWxQyY8D/jHuWbaJRz3qyEcS4BX+CYmbn
         eWG7HLw92kzgY3ds0vBv91DFwD0xFv6ClSU33c09AaPWdnwC741Vy3Wuh55IWrsz24LL
         MYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591277; x=1777196077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=VYKufkR573h1ZAkilI/p95exPl3A+SpAOuUhB+jwwIMYtkKH2KreEUia4rFSRxzb4s
         gFFu2yFQNXIpdk75u73ETH8YFQpMP5WyrgcBFDycoJfqU7/J1B7kBRVm0Wi+/2oxtVFT
         ng5hBeWrOYUgxoIkw/5jNlUlJOMjO7mPfdyAtsA2JOoCHD524IB51Bsdi2SmbhXDRiGw
         Ksa4p2NUoXMrX+AGa3TVq22l1gcDh33BR7QxGrhO117IlIvDP1Pj04QbvfGFdcMKl4AX
         oI7y3ADceuNA+BDb24qM44xh69DQri83yMFInCiiFxV/jmps5D1kB3EyY2WgUK4eDgGl
         GC0g==
X-Forwarded-Encrypted: i=1; AFNElJ/24DxGuzq4km//GMLUrfJrW6psg9vxUKgvjgduMaSdKZygEg9uSAe4Ccjr+cqrbVd/cY3A2JuMkxSRlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfPTA8ChBv2dM3x8rHd2TO2drYair0qf9JSHIO12tVqvS2SGP
	+O62F7gWB/bmL4b5MUxCfJs9eZ3Oh6Pb1FJNC89aTP/vyk1nOwd7IDiR
X-Gm-Gg: AeBDiet7RsEXhFr6JirReBQU//yvIyjCgR2oOu7+d0FuxF7YmXAoBMk1HIwJiUgu6Ca
	5Ej4fnb8mTbB7N1Rrnl58t2mb//B6HzJh2JMqt9+1Kl/H6p/Qq/SqMiJvqVgmZazzy66YEcucvq
	X+0oUCmevVKkCeKPMxyPQj3UtnQsNH4J3fEOekEWnOzs4C/uNL1e2lqpL08Vw888YixqtP2xPTz
	Tr8NNkvIWf+U1kRuLu1/Z/Qt3Dui3Spi2dDFRzI7FRpCTG7pNTOIVyNJ0SYp7bJ6ALafu0ldhe2
	QpRKWb8eclx7hnaeCnX6h3fsDhArEoF2dYl3VYSxCn2HoCo8ez3hNYuATfaWpdRxwJGAXWmXf+H
	iva+xUOTs8nr+BxZH1XFtMMml3Vd/euKj3JARJSGwM7GOkcL/Hhh9+KZIqptO+6D0rUSjqy/zhL
	3ckEF8r+WSVhn0QoE4bXP0J0c4gTky+VlDEA==
X-Received: by 2002:a05:651c:1604:b0:38e:9ef0:58be with SMTP id 38308e7fff4ca-38ec77f5aafmr27047701fa.5.1776591276767;
        Sun, 19 Apr 2026 02:34:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:36 -0700 (PDT)
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
Subject: [PATCH v2 2/5] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Sun, 19 Apr 2026 12:34:09 +0300
Message-ID: <20260419093412.40796-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59095-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 315CB423893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..085a0ef70e39 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
-- 
2.51.0


