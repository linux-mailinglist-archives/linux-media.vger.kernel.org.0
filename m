Return-Path: <linux-media+bounces-64844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bEIOGAUPL2pw7gQAu9opvQ
	(envelope-from <linux-media+bounces-64844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFB682292
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p5SeQfCk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64844-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64844-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DDF3009501
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D446319601;
	Sun, 14 Jun 2026 20:28:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C583B67E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:28:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468926; cv=none; b=tRWDkXENt+YPzCIz7/pwJfNClg33h2oyUU31DRH/AUF3NACUaUF0X3EoKLnne1V541miMzuUA7Iwf8qz5EmSgUXeiXdvzHsK8dLbSoHG92XXfPkHo5bSsgcP0Byqbec5yhT6t4WWr0skzNT3TheRkrLGuvU3jk61T2+ssUCrKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468926; c=relaxed/simple;
	bh=dkJJ9uzMZ/+Wvof2subdudp1ueZI9/fdtBdT0y07Tlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT960l6U7lfmJqC+BD/fA4do6F55J8Sg5Dpx3IT+ziFuAgBWr5OWZFvxFjyw+OjEVWJPjomTS6d4gubQUJQaWnMcsZY7amqfyZS5U4ij2Yfcm8dya0eaZchI4Zpu2j5HGsT9jc/X/zrS7B6iSgRxH7h1JyeWLZRRMKnm1/VYIyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5SeQfCk; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d8b644473so2319544a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468925; x=1782073725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AVHj6ed8VwyCttBF9dIP58qYaaDmNXZpDaeTXKj2YM=;
        b=p5SeQfCkJcMdNpbyUBtf9NfCHYyUoHE1WeUkAFyLd3OvdeWJaXj9em3r5NRHtYOcQR
         JJJRx3AvQK3ReLio84OyWWSBo8UPsYrNs8gBJLmO1Xig4fhLF0K/NOIFccYFdoq9qjMj
         pa2C5WVVHbubnnAkzof5FSVNtDlRFY4cE57n723ZW5a1F7namSBdl/xaYMlqK8KVWjjr
         7KhgSIvmcK40y0XqPGuAVAKdiAxebmkpXd9keF6igvwYItGXcCpQOSzD7yWDAm4Yi4KV
         1V0XtP3r0/EpaV5LvO8nN8uyx+EO4Hcur6STkG0J6QeZsHMzq9wacgUaD0p24/eTKyp4
         m1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468925; x=1782073725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AVHj6ed8VwyCttBF9dIP58qYaaDmNXZpDaeTXKj2YM=;
        b=KrejfClKkiClNkLcGrcwf3zOIc16sVuWgrZOUIbo3m5AzzSVGhgb+4z0Ke3sEPH1G2
         UMXM+np0T4yjV/KDQFeNX4VhOHxqNNNcday4zzWTv1ArplS6OaK32NUQ0ez3227Cz2qk
         hgUwnfpaic+pHBT/zMYHlQuc0rJmQ2lPKddnDv/2g0g7rt/NguqT2HM+yqRfEaawYh3M
         4PUv5vcSZotro6qhGKbucB41r8CVzx0vZ18vgaZgSejKRFyupBjPM22e60hhe6Xej0Y2
         t+2asqBQ5Tx3tV3MdVXbfAbanT5LpSKKB8Bdu9htaTSXFaQAqILsf2WQZNToSV5Si/Oe
         5l+A==
X-Gm-Message-State: AOJu0YwyWzcB+bZ+I0A0XOEa52q5YxlW+ZNOjLXQuO/kKD9q1rohqyrr
	AwkUM1A/XTbJnyppp0/Vl6BvwJvvAlpvuuJDe5q+D9/0gd/fLOpj4aNJNLgJh3xc
X-Gm-Gg: Acq92OGPcSoBFWW10VDcZEGxX3MIvPao5rMptWSh3tL/QdaScO77+CfbkjCwDRevY7a
	ERW7sLGZz4fvR/bqq06+IpS5REyz9S9P77Gewf6NP1ClgcUZd3VEGXtI7KkUjDBIG52HHX2ztr/
	GLosASaqpng+8fxXAxFIRJGUbH7xdOHzLIZUmgzrax4S1lCFeSw6E2CLn9k2xtf6NMmR4/SqtBB
	ZCt/FEfN0ReCTeYb87cqthIUhaKyUyMmWqfcvcwyDE3Ue837sqS/1i9xRz+kivQF8Z+lJM38DPi
	5OB/wSgt+urG6TTKulA7Ns89E0TiBqPNx0ZzaOm+CJo35sEOrZo7O6YuFg0gO665kJ3iQdZInOl
	Myfp93gE8V0kK6spQIuJGjU0wyADSQv4fbSxUGdg0bHt+arhm96BMvaojAdcbf371le5UTlgNWn
	Nat9KEQxnuEeiSsVOlz7PY2nYmv+211L8wl1RbDD9bF5K+lLDomCLe
X-Received: by 2002:a17:90b:4c:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-37a01c36550mr11464489a91.6.1781468924872;
        Sun, 14 Jun 2026 13:28:44 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.28.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:28:44 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v3 01/22] media: i2c: cx25840-core: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:01 +0530
Message-ID: <20260614202835.11977-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64844-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:brad@nextdimension.cc,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EACFB682292

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 69d5cc648c0f..a3d7473854a3 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3962,6 +3962,7 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,6 +3987,7 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.50.1 (Apple Git-155)


