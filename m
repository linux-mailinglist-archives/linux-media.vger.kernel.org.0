Return-Path: <linux-media+bounces-66603-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WuUBECNnSWq31QAAu9opvQ
	(envelope-from <linux-media+bounces-66603-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 22:03:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52B70862A
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 22:03:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=meF3r4fR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66603-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66603-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AFC73028B79
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 20:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F683603D9;
	Sat,  4 Jul 2026 20:03:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692EE175A93
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:03:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783195414; cv=none; b=V9SOFnY7n8EIwAvVmYlIpExGiu7Awi0bSNLU7hf2KDBJxC/dYKXAADV+3QkeDzGmkyuWcCCQsDB/1Undsm1rz+sO/R0iLgN62cn+aLDEF7WonadsUtr53CY80Jlzf3Z/vX9ti3S9CMMpk40gzwgWlRyPSd4t9VQX/keuj3qmIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783195414; c=relaxed/simple;
	bh=9XsXo7q/8mNOgukAZVzYBBXDo0Ob/80vCLiatJ9HA5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DbJ2KOvJAQUJ5tQc83WI9zSf+X/Z9qOx8NmYEeleRwAmDM7JrRnso4qqNiv72xWTIKL5e5Z+1rBI1TA/f7ABJpmI0NIHW9kdmlYamuRT2XfTkX+jqP+4RqEN6HUgIrI1RWKz5glksnk/6jhVhcStLUdysH4Gu/ztUdJZeALRcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meF3r4fR; arc=none smtp.client-ip=209.85.219.43
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f0d6853360so11539026d6.0
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783195412; x=1783800212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wj5NhGN8hkNKLjQV8L+00m1+Ba6O0PCkR7v2DNR+qBs=;
        b=meF3r4fRwPHwOlUX6eqtnpP/N2tLi+bR68CeSg1E9oINvnFG2UYpNOX2khS/J/O6Rs
         DcIsThSEtMiYZQbzN5dFImCM0zPnQfyS6KtAH5lIISChjrvqK2FJZ4s/jpC/KjdNWEGX
         T2+JbPbuYnWzaxpBHMxbKgP4GQVRjLF5Ve+b2VEKbPc6c1LRtfchnFy0UiyijuqjWtQS
         QWdZ+X7dbbm6vUS4gA8uhX1/tjhlLex4Ioe+KVnCN6tpQ2k41y+AyMXXZaSbsL7zc1Cv
         4TRsKleRg3CUx0OtIY/jEqiDSc7JRZo7HO9kg+sykFBHHTriaXfktzt3Gx5ibFzwBj4Y
         +qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783195412; x=1783800212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj5NhGN8hkNKLjQV8L+00m1+Ba6O0PCkR7v2DNR+qBs=;
        b=Slr8LItkSEyCenB7vG7t8XszWE5Rj9UGu8y8MqOqbUPiDsGHYvMqQWjziB+KmUf7Gx
         tPJno1crCxjRK+1WJ55LAF7XYif4pGTNym9B9N6B0k4yhxjmvL9B02DLuvcrjJF3Xn/g
         J+hTe38EpwjpOUJhSi7psrOl6Ru+gChyOX16ZlEipsaaj5Sp64KA4BykxaZOAvd+rixQ
         rk/mVNrmtRAIyazqF6HuNUlV2JTShz4qcHNmUeP8qT7dYmINkY9yUEvcAMhYmBNxjaLY
         eUCa1pV0K/Pd1MQlDz8GOuUYhx8p4fRjtxo9iq+Wp7Z2G5xrnMFQJ2co+fwDmiNtKB7w
         pILw==
X-Gm-Message-State: AOJu0Yz3z+4R9W43EqPO2U4rUwTWEtj56D7T2nphUfJw7OMyZm3aPzHB
	tI4CMFz91RX2VEcXHnMGpqAEDlVgqCEYySEDgIHxfE8gVp0yhsoGdhWAnxjdfw==
X-Gm-Gg: AfdE7ckvuuWKLzdlA/m3+MSXjNbACLG2VImBAdLJlL+kD/Lso6XKKoOfyslRcl/xnC6
	IKkfc5xlNbQ7U8UFgMbFqC0pPQQvtuzJqvB5Y5Q/SBwt2D46TDMkag8jFgSbEDYIOH7yeeHvrr6
	0tH1mAuSn4/ii0AJlZqLJEZzPRMAcRI6ZDlR1r1N8hxW8pisR7anoCVMBkA+sSRZZHKvL1VxtN3
	8mjz/NLUcFolvbIwXuwpZ/IvDXzVrMpDLtRO33q1Gb/avoSXG7s5xS4stbsE/X+Nv5ENMUiMR1w
	2mzFvt3KbLW3OWs0uu1zbk+0Hz0VYCVjkk7Zl233F6mNGDqbFrrtuBmVokuOQvSzkT8ly/e9lgt
	EkriMtSC6hq5/rjdM9KotH29CpQ/o9jL9XMHx6Ql8o+uwEum3hNIVKHUIvxiSzq4f4xcRWIoff5
	BZV5ZS/2I9Tay4eI7pv35xXyO/+4lLrXF2oOuJ1dikIjV5eQ/aO6jS
X-Received: by 2002:a05:6214:1c81:b0:8f5:5866:161d with SMTP id 6a1803df08f44-8f74997c896mr74200476d6.2.1783195412369;
        Sat, 04 Jul 2026 13:03:32 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm86758016d6.21.2026.07.04.13.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 13:03:32 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] media: em28xx: fix audio extension ref leak
Date: Sat,  4 Jul 2026 16:02:05 -0400
Message-ID: <20260704200301.3968952-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66603-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shuangpeng.kernel@gmail.com,m:shuangpengkernel@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuangpengkernel@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A52B70862A

em28xx_audio_init() takes a reference on the em28xx device before
creating and registering the ALSA card. If snd_card_new(),
snd_pcm_new(), audio URB setup, or snd_card_register() fails, the
function returns an error without dropping the reference.

The em28xx extension framework ignores init callback errors, so the
failing init path must balance the reference itself.

Drop the reference on every audio init error path. Only store the ALSA
card in the audio extension after the card is registered successfully,
so em28xx_audio_fini() can use that pointer as the success marker. This
avoids a second put during disconnect or module unload after init has
already failed and dropped the reference.

Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-audio.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index ccff6be5599e..f583837f9a85 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -829,10 +829,9 @@ static int em28xx_audio_init(struct em28xx *dev)
 	err = snd_card_new(&dev->intf->dev, index[devnr], "Em28xx Audio",
 			   THIS_MODULE, 0, &card);
 	if (err < 0)
-		return err;
+		goto ref_put;
 
 	spin_lock_init(&adev->slock);
-	adev->sndcard = card;
 	adev->udev = udev;
 
 	err = snd_pcm_new(card, "Em28xx Audio", 0, 0, 1, &pcm);
@@ -875,6 +874,8 @@ static int em28xx_audio_init(struct em28xx *dev)
 	if (err < 0)
 		goto urb_free;
 
+	adev->sndcard = card;
+
 	dev_info(&dev->intf->dev, "Audio extension successfully initialized\n");
 	return 0;
 
@@ -883,7 +884,9 @@ static int em28xx_audio_init(struct em28xx *dev)
 
 card_free:
 	snd_card_free(card);
-	adev->sndcard = NULL;
+
+ref_put:
+	kref_put(&dev->ref, em28xx_free_device);
 
 	return err;
 }
@@ -912,9 +915,9 @@ static int em28xx_audio_fini(struct em28xx *dev)
 
 		snd_card_free(dev->adev.sndcard);
 		dev->adev.sndcard = NULL;
-	}
 
-	kref_put(&dev->ref, em28xx_free_device);
+		kref_put(&dev->ref, em28xx_free_device);
+	}
 	return 0;
 }
 
-- 
2.43.0


