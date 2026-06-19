Return-Path: <linux-media+bounces-65261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ve6YF6YTNWrHmgYAu9opvQ
	(envelope-from <linux-media+bounces-65261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:02:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5A6A5182
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:02:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oEmdlnlq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65261-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65261-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8DDF300A114
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6B936AB5A;
	Fri, 19 Jun 2026 10:02:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02735E1AC
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:02:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863329; cv=none; b=eYT7OymmsQGzeFvIAB1utOwfaTcZuSU3QnQ+nEf7Q+ozJNP9t9EHukw2OkElZhLyHbASIW5g93pOr++XiBzj7EgG0TPuYsfR6vI0Ql6VlEUUVJDk13AvjLN7AD2whfaXN/BIsPLzME1LjIm6ymQmByrwHJOaektHnm4VfEQi/0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863329; c=relaxed/simple;
	bh=KhRQGfABJerN27yISd5NaiiNsCc8AAO1y93JwBS+7mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apoCreZLsQW6Xh1yrSVrpqJW0qTTNRL737hl/F53mz+Vr6d+/f5y/T504gJUNBTVwxzQIsY2nd63TyxXq85or25NG82XbPtPzh8kzO84MFf+RtUfwOQdtYrqgYUse6EP5+e6liFxZqh6C8fHumtldj8QA4DIf6MNNeUqm5tlMUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEmdlnlq; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so939588a91.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863324; x=1782468124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYfQsV5FQESx4DqGwKnGdUsEM+vvGeU8qSGjcIl6olo=;
        b=oEmdlnlqS8h2kYlleU6ECJDgwkrOr2OEFYdVfSBF+hRVlFILAXQoBzX4ODdSpHfuDM
         el2nMhIqyleASuAQVdLWPkYy6vQ6FD+MOiZpPmaBRPsA5c4OKQStduk3leEMdYgHgetS
         c9iWYSDnULx7ariKI2AdKSTJD2A5Q8zDJWRfu3H4Hr/7En7cWPPEP34uJEWh6T09q6pS
         vCJepm5i45GkIpqvkkHqoV6rnsfq911uanFDGgNK29KqaRL108YAzqgnZVYINrrbrdi8
         uRvD86IEJ4b5G5illYWLfHaLdgYa0OZrjb/8/nltEWp1AnwvXIDPivkw6JZyyuozyb/w
         nZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863324; x=1782468124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYfQsV5FQESx4DqGwKnGdUsEM+vvGeU8qSGjcIl6olo=;
        b=Un+kWXfPlpHUSTs3E8dK0sf32i4G5L51Ro5gYZVWbNTaTYkFs4+5/LCju3bbrKBFjf
         nvLSjRbzWwEVjYTTBrfTtLacH6mzyK2ou89dhtGTlnXktdjws6s2sgNk0xsTFxtj+mbd
         yC4cMfeYQAc4hR/z7cFNbKNZ3cSDYZkEoVQ+/efve1dB+K8EbqzDWX+UDGDg7gbwxAhw
         rFBALt8NDNyKBcvUfbhTbZcymX8iZ6WWzCXBsMCl76T7SR7lN3tFOzoCznqSnwXJzMeN
         p39jmE+XbisUldjEQVqLdl/wHm8ywhwTKL8bLGIe1KjGbaW1F3MjKIXdICaJxthojFXa
         ydDA==
X-Gm-Message-State: AOJu0YzxXHfC1qnrb27FmIL4vQRBydqbyp6A202VFIDwLtMS5CbHkq2n
	ges/3Y7pAndhGcVozJXH7oFZPzG3n3MfGsR/PtZfI7y9jqK/DFX6kNCazeMRiaj+
X-Gm-Gg: AfdE7ck9bUqzHAXoB/KG8XwU7XksRbef7sWtZ4qx6cto/BrVhioIZDEt1sUpqfjVd7L
	2oV5JNmBdlqH7aqMSRg36aBjUuX36S/Khs1CYfhbrZeMhjFNpR/L2efwcVwwaJ5uZTThk7hzeuS
	Dv2kpEGUtPrKUfciv5sULilXVarsMrUciZrypkMeh2Z5RzJ0N1gm6i+XEqBEPHgPMrbEk52aqXF
	anyUhXg8K1DOlb+2oWEJsGYMbnm2kzHw573bpMfiYS1S9UhqPBTV7XHfccUMezlMbciqbvXUlGx
	QaAaX9upYXBfWQM8S62YG2w2MSBnEJvcZCvCIgr3P2A/xhCuRbqGtQpTWe97OMRYm9nEnjbiscO
	R0mSEoxB9pxiueL9wuBL/DiaaGOan2lZhZm7T3NTkbPpzAzSGJ1tuRamXliwJJOGdS7xl8o/nhD
	MtBlaM1/Rm24DDXG4vmQ9OovKw7vwkJHz1LDFfbufaGA==
X-Received: by 2002:a17:90b:274d:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-37d15e8b6bcmr3942112a91.19.1781863323991;
        Fri, 19 Jun 2026 03:02:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.02.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:02:03 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH 5/5] media: i2c: saa7115: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:31:32 +0530
Message-ID: <20260619100126.22197-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260619100126.22197-7-birenpandya@gmail.com>
References: <20260619100126.22197-7-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65261-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C5A6A5182

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them to prevent memory leaks if pads
are dynamically allocated.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/saa7115.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..64adfff3001b 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1867,6 +1867,7 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1925,6 +1926,7 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.50.1 (Apple Git-155)


