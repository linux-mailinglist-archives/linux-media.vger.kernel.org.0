Return-Path: <linux-media+bounces-60117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PUKEdRt9GlcBQIAu9opvQ
	(envelope-from <linux-media+bounces-60117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:09:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D44AB2B3
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 11:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB253024291
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 09:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E0037E307;
	Fri,  1 May 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJW07Cpc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5EB37D134
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626564; cv=none; b=JJ9d+xslLYfxqJ8ZUVRhqmpjj9AIDh6rMKnlsQQWoc9T8Vadri+/Q2yCUFVWXGhx8qPFpYFmd5+CJzGELFkg7WmDEbKbigjVSednOCMUDWJjGeBbY/EteTuh7oNZ6VMBdm4LnAFbkjpiqGdE9pk8fQoSHV5Ozr79HTn/Y/NDNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626564; c=relaxed/simple;
	bh=89jlVxW1k1DaDpOVsCpZaDI95QQVTHGjkXHGWhY6j08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VkNMY2GVpCvJ/SNp/LwG5vUjH6isjmdPSNJMxoLw2WyaWyyHbdn9cE1Fa1JYALG4fMsr/CUOzwrLSBhl4jeph/p8/wgPBrW2t8uDDnkAmy/bT/RJaUw4uRNrfYVHuzDttPgzFijobHnyX2MYv8gZiSD2yL0lrEtkieI+P8bPTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJW07Cpc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1906820a91.3
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626563; x=1778231363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyTlFLeJ1G6PI38qtRjcufp4nAkxnC1Ry8Nmrz84v+c=;
        b=KJW07CpcKPsjZ7NONt6vid4z1zuUsyQF1VlkSfB/qYfG+KX63QzQVo+dcnGhaqSIwI
         Gm0h03uXIuYiiq1Mc2NIX1NxCScNJIzT5NfWtOZg9JxuQMsvDkHuN6hcfx2cWeELARGN
         1WUKO5qSpVFxdkP2ojjQ3tAuOZKyp//qPVCLwY7w2rX3DkMT8FTVB/UOR0/cUwsMqSic
         OkmZeQ0oI1vEk8mGCYlLY3VdM49NNL29dx/wIJ+ZVUDmakAlDk9blJS548bfXN8PHbsz
         EcLJfhkV5NV+gIh9hRrAePe41Rb2evl4BUuoC6HEQ7l1Q+YYKpGcH3wXbRgiM56MWdzq
         yh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626563; x=1778231363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyTlFLeJ1G6PI38qtRjcufp4nAkxnC1Ry8Nmrz84v+c=;
        b=pA3IRupPSJxff3L4vGNXC6Z8Ev8cSVNykhVkPutMxuBSKOqVY/H0z7zCpU0i2pD/Bm
         YzpadlGj++fhKPui3lwIbH5kSru81AVWAZ+tLN/f4bj/fV8T/9kRXLllK+BL/lQnojpQ
         05zYm0sZ3xQvnHrS+ov16Qxxg6wBMOByV3jIg1YEgZhFD6Oxp+yYPv/YRBnaBjsqbq7s
         N97pPCLP38Fdj5HBXp1XqELfFBwgMy0hxblEhW+05br8w/sI7h10ZINihAE44xna8lRT
         ERJt+hP8D54bFOFUbYyiDu6cVYqKjj7Qqsb2JKjtgxb2JQs3RDolIFqTRDBII0aAlQQT
         9sHw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZDAXwAWl+4UwK5velc8SARRrAmHSOHnWziFCMqnXVnJ9wHyltWHn2gA3q5Ckh2uPyr1H6tGUs4ahf8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOg52z/ca7LRdqVihyOo07r1ca9rDGERlnL1qkQ6HkRNf8QpA
	ByOp2KvQPvZ8TjlIMwFYiC4bogUZfHks4OknBmiUGB1zALSnsybgLR5J
X-Gm-Gg: AeBDieuheW7bHgAiVPiC1FF9DCUHWeyoBAFyiEod3Fk0GBCRWGaa9DTDSKsLW7I3LBm
	Bkd9sxFYHUZChTltZWBp6tj/Eeb1fEFrAtPgLgdSZDt0e0MyGQvDhvrw6S/7SGzeD1R2I8GwunO
	HJzauR25rB/gallOfydBPsyNe/GRqp+DMvGwohNeq6bjDGcen1QPeCZhczuuSGuzw4oBqG3mSCj
	XaD/Jg4EG+aI4+riKwOnbaX6KOu9FpcqFR/mPCUs4pU0r2brCS0yYP6Gw9yHYaXi3ym3GPz5CyS
	UzWZ3usTFM1J3ufyD9EsxKIRS45KwHF5aYDdFXj6mXlO0onPPZLXO9BeqBUl/3tPsHUKxbBOX54
	aNp33X23K11wFsD63ydijZPzBb/jhAzTNl1/JLLb9XaaN8qguEkb4HiZOoKl9U3WvjAublAr30t
	RtR8Zp09aiM1tuuDpq
X-Received: by 2002:a05:6a21:e081:b0:3a2:d79c:416d with SMTP id adf61e73a8af0-3a3cf86c261mr7683626637.43.1777626562812;
        Fri, 01 May 2026 02:09:22 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbc9dasm1675365a12.9.2026.05.01.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:09:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: helene: fix possible double free in helene_probe()
Date: Fri,  1 May 2026 17:06:57 +0800
Message-ID: <20260501090657.492534-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B29D44AB2B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-60117-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

helene_probe() allocates the private data with devm_kzalloc(), so the
memory is managed by the i2c client's device and will be released
automatically on driver detach.

However, helene_probe() copies helene_tuner_ops into fe->ops.tuner_ops,
including the .release callback.  helene_release() frees fe->tuner_priv
with kfree(), which is correct for the non-devm helene_attach() paths,
but not for the devm allocation used by helene_probe().

Clear the .release callback in the i2c probe path after copying the
tuner ops, so the devm-managed private data is not freed by
helene_release().

This issue was found by a static analysis tool I am developing.

Fixes: 817dc4b579d8 ("media: helene: add I2C device probe function")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/dvb-frontends/helene.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-frontends/helene.c
index 1402d124544e..1ff8c06d06fb 100644
--- a/drivers/media/dvb-frontends/helene.c
+++ b/drivers/media/dvb-frontends/helene.c
@@ -1091,6 +1091,7 @@ static int helene_probe(struct i2c_client *client)
 
 	memcpy(&fe->ops.tuner_ops, &helene_tuner_ops,
 	       sizeof(struct dvb_tuner_ops));
+	fe->ops.tuner_ops.release = NULL;
 	fe->tuner_priv = priv;
 	i2c_set_clientdata(client, priv);
 
-- 
2.43.0


