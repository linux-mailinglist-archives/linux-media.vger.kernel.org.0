Return-Path: <linux-media+bounces-65258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DweoLZgTNWrAmgYAu9opvQ
	(envelope-from <linux-media+bounces-65258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:02:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F96A517D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YuVdQnWo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65258-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65258-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B4DC3006991
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1254369236;
	Fri, 19 Jun 2026 10:01:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D52367297
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:01:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863313; cv=none; b=L8/HBkkst2ETBgzDwsmezM6aJG7Un42BLxB/OZBEeBSfch6z3XwRbnENyRVhWBxGUK6uE8mfFk7yLObiSXfHjnjBlngcL4Twxo+jirEExuz0aIRZkWlmXlTGOmtzj6iploJws0FotZePYarvV6LdC4yPB5LUXgv8bUQVxoIZ050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863313; c=relaxed/simple;
	bh=K4GzjHVO7gDeq/mmzra1IKXSINprIj4mvDpAvstV2hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hU90fk1EbXpXKCe9cPsQKzLpmSrPVaxUzGAtRPQdDDd35K2NOd0efzJLcx+AhODr/XH1ctu0KzZ3eDwMFDNSMkjbyvVQR+lZpu+bRZK/GcdlVtcDEzz550eT3ID0YawljIO50V8nksobl7t9W51KhW3N3BOErTeHfcFD6MDJ48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuVdQnWo; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso1048815a91.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863306; x=1782468106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyHTtF6jj6f4MytjchSvlJQGEHcHFMQV+dS0WCXJWZo=;
        b=YuVdQnWo0vJWW45elHGCxYu740zHcczgnllWcC1O6EbBsnqoH6hEHDQMJX/HlH29Jc
         Q9H4wUI8TzGI6IEMjFYJU4VwyyFcdUqc9RxVYGR+BGmz5xYhuZtQsXbZtvVlLei8Az+x
         bmo65pW/Y4GDMcVOAv1bfbZE4RNe+OTFCAuk2L1nL+bUOtaUlZMrB7pxDPIRe58p0nrX
         SgqMrjiMxalwuQ2qlwAN57w2/nb4o/RuIXkjiKK10WJExPUSpIrPh3Kg4n2wkqX2yWJH
         sjvZCzBThB5RUZSZ3kVluTUHWyfzyb4u/zc2Q/XxOXWcmvlw7V8BAtbkw25SCZRABhwb
         G4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863306; x=1782468106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyHTtF6jj6f4MytjchSvlJQGEHcHFMQV+dS0WCXJWZo=;
        b=aZMiDyn1w/7wsS6TYX4xJL8fHuIVbQj9ezLkSIrOn4WhoNwQszkGJ4Nhkpvcl/QNc8
         sc1ymmEP5iQ94dMtalMlDtNT8pbu6K8rzlW8rIZK5lSn8tCcn0kwIOJSoA2YLXnPFwm9
         y6gaUlA767V/B7TphtvRbyebedgVieXtWuZnShdNuZofmDqZnYPEbACwq4fkaQ3gxkh7
         QGWgDRC9WonqSAwMrGqHX8KZMHKZXG2I4FzLKqqDwunwK5FWBDhmK2xRbrx6M4ag/prR
         rP4lWY6Tmd2IX/+BH7pFy8Pm/8M3rkzGSkj2j2u/6EHH/QzCERt+mZ/0W+ZKPErvc3Yj
         tH/w==
X-Gm-Message-State: AOJu0YyqkNUpSRWzzyYvNZ3+TcJ+esAr/ZeX9yXb3uOAdj4/SAQD3OyG
	5Dexf3J1yc2iBqwiqJb6vBU/lDNxZR3yS44xCFa9SJCLMlHOP6vpSdFMUt9o/1kT
X-Gm-Gg: AfdE7clRlNIiIp8cEST7kJQ0s3d1XlTX6AU7q5wqK39pWN/8i7ARlTookFr1AM+S7jN
	FA3qnbIpBVmOtm+BB81JeG9qsLE2q2ZZA4yZHoszAHfwYBfDkjcNAjhm+EeaYUAa4YGiWRnexmA
	Fpc3MzzBT+7vrPStKpFtwqcYpWtaMLtkWYiyU0x/y9t46w9racGvMb41IvLXxMUT+kXCg3Fjm6C
	JVumkE6HLiRwa2v8b2Su05feR3gMK9rIAQxvZRKqJlo2J1vsgcjDqpGIiigdaENjqfsnq0y7wtg
	LR9NebVtSvbuKzylRhUFQC1aYJ4ZbUUNQObKdaEjjMpRk744VhZZosOoyHtVLBfcfEgN9TkdgdJ
	yOAQocbElfZ19TDEXSp3kcIXhChrYNIqLEJhtlIQJ64+yi81RZE0XuV319PzGX9sPJ40QJxWfwU
	voq7Av110vE1KoCDtf3nwPm5YG5TOqgjM5b4jTzDbP8g==
X-Received: by 2002:a17:90a:d610:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-37d13cc9b69mr3718740a91.0.1781863306462;
        Fri, 19 Jun 2026 03:01:46 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.01.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:01:46 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 1/5] media: i2c: cx25840-core: Add missing media_entity_cleanup()
Date: Fri, 19 Jun 2026 15:31:28 +0530
Message-ID: <20260619100126.22197-8-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65258-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD6F96A517D

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them to prevent memory leaks if pads
are dynamically allocated.

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


