Return-Path: <linux-media+bounces-61159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N4ZIxcOAmoSngEAu9opvQ
	(envelope-from <linux-media+bounces-61159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:12:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2651327D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 596763010BD4
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5293844CF4F;
	Mon, 11 May 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcrY5pQu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352E44B666
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519539; cv=none; b=R1gGKhuolqQZh3ZekRNut9/LpRH47MLjNhAt718/nrzQ79822bFCCuxIbEbB8H4hVmoPNUj4Wb+vXtCcpYIpWNK0DJL03R7/RBQr6QZByF2VbKOwf2mjVHykjKyWCM7E8yAbF06bUEhhwl11rGXtnwljLIgs22GIUx2jRThVgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519539; c=relaxed/simple;
	bh=qSesX2ZDGhaCZrzr8oezoBtstChG//vMkmqR9KwS7d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVmU8UketKnpqW3uTCXGgKhFpXP/e5YIIx23ugRK6GBO6BRG56FgiarPyVAtZ5FpF64DfAUuwZx5U61X+bekE9473j2nU+bfoVaJ/oOzLCQDN5KY4Kfxe9gNiM1Ae5eUdigb+2gvFSj+I2/a4aTa2o5Fu2Jt5uAb4zfRR5//WQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcrY5pQu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a10d130b37so4132771e87.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519536; x=1779124336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=KcrY5pQueoCa4MoLMldHSXm4iJ3/EjEqLttwIT098h1TCW6DCISHfy/6r+bVPtjZUx
         PXi9OeeW1CItkGfm2MWvoFrFhJk0H9QqqUMAueQeyRld7+9UTuOOYD+1coRjUw9UX3DU
         9x/k4JKOtJGa5sXYnMiQSr4BeUEoHYuDchPWGlKMiIW7+zSPdBN1x27qIGLmDSxNncgz
         IbEHIJCOj7xlCuHB0Lqar+7TJmC/O67BmkZ510AYqaOzqoKqHf1R2LPZC+gPfEG++zkj
         QDhJuWdx6moAHmvyIvwEEnp+LalJIPiTqwp82itG6QHvpJRcRxvsHG87VOi8pEiQg03I
         YYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519536; x=1779124336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s42sCXaEIYI2iT8o/2WjdzJavucMWxgVZFV2JYX3rF8=;
        b=hhVKLAyFlhF1+4HK05CqJZYQ3u186j/imNwAeS6d0VvHPCtuvU0L7fBbzpTGDDfR+7
         9vGCQ/QFe7J3kj7ZoJh/+r9ET9HAZ95QbTuTk0UKWitqyFuArwbC0RWhbNT40mlGZqDX
         Aw6fUx2dpR8ldxICFBtuUFqsR4ZoGPjEXZ/aTwb8dVeAmbHXgjrCXtfqOaWtQ0dvQpzI
         z+tipeTGOhq9B96xw1GSsyJ9TVscMUgr9Z4B3NF0AyzHcB+w+ITRvbqLFJMX1VS3muLM
         4uJv8mDlp6dCKwwLYvOuZTg7VGtu3Yqz/SmzTH/40cIpqJ2OOFCKXaYLZG/lHVkpXpSG
         664Q==
X-Gm-Message-State: AOJu0Yx1gs+RDUsNP4Ge+E/161RLWlBLT//CQGr3BQQWwmA1yz1aKRmo
	O8uLIAxuZTCH6A+C4I/mun70fgZHntf8t24AP71bahbgQtZeZrUHpeLTwuWm613Re8SaRFhl1ak
	=
X-Gm-Gg: Acq92OH6tVFABgmksE5Dt+GMH2LjroG9Zw1sxpnEKIUJ8czwMv1Uj0WgvyP5jPkYspN
	HOXjG4V0NE+SsIZMpOXhnu91OcqnPckkDmwjVD/wx8cwsPSBg3M2Bl2mQqCrL1NGHzqUDSArFfy
	pzNXG1+x29/IFoHEy75hxR05SivE2oBXD5BEgrgWOC2jO+JZXEinpdO6tjTPwzN0ULq5RX3YX3F
	7nSpbPoTaeprc6lOyh6nJUtEWchWJ8uQlZ8gw4vD8Z1q5EW/nNaZi34jCD+secTkXoZfBDX7BZn
	gDhdjhh+M0U1bJsYXVAZXNBx0FeJxaOalTzpiEPXHAcNmuOcmS0Yg/XXeJWCK3QtXWZQSdNOMoW
	qpsdNGSKqW/sUawBkDvX5UnDnyKRCE6C2pVxXQ5S3whsRT9zEqcyTkmMWMSQBwsC/6UkkTUAPzA
	RA9k7ImsbK+Lm3a7OrtDsCsxRzRSPzVmtP1b9gWgcYN3tfjDlDapRBl7crvOUrMnF6DE66ubQ=
X-Received: by 2002:a05:6512:a8c:b0:5a8:99dd:1648 with SMTP id 2adb3069b0e04-5a8e0c8c320mr110927e87.0.1778519535453;
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:15 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] media: airspy: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:06 +0300
Message-ID: <649601988189f031670215cb35add5e80439559d.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 35F2651327D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,gmail.com,linux.intel.com,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-61159-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

airspy_start_streaming() returned -ENODEV early when the USB device had
been disconnected (s->udev == NULL) without returning any buffers that
buf_queue() had already accepted.  Take v4l2_lock first and jump to the
existing err_clear_bit label, which already drains s->queued_bufs via
vb2_buffer_done(..., VB2_BUF_STATE_QUEUED) before unlocking.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 8f6b721ba107..57edb42463e8 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -522,11 +522,13 @@ static int airspy_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(s->dev, "\n");
 
-	if (!s->udev)
-		return -ENODEV;
-
 	mutex_lock(&s->v4l2_lock);
 
+	if (!s->udev) {
+		ret = -ENODEV;
+		goto err_clear_bit;
+	}
+
 	s->sequence = 0;
 
 	set_bit(POWER_ON, &s->flags);
-- 
2.51.0


