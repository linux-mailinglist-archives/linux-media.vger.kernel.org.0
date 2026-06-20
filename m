Return-Path: <linux-media+bounces-65313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fNzpGGXUNmpoFQcAu9opvQ
	(envelope-from <linux-media+bounces-65313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:56:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67BB6A9705
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:56:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="NM/4fxTH";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65313-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65313-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AF453016C8C
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 17:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF8554652;
	Sat, 20 Jun 2026 17:56:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDB349CC6
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 17:56:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978190; cv=none; b=ePGQvnpUYQd9JkQ5dPdMXpTWfH5tdiYWQ9iOKsVDu/I8Zp1HTLIFlkfq2RrW/hV/5rB0H2DzcVRcDLCXbccOs997t1rIRq36ckWLq6ZTSmthSmXUnvrS3bhDSFuJfoO5tonB66JcUzENQz4yyV7+gWJXXO8hmrMKgHSCFEM3Zz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978190; c=relaxed/simple;
	bh=F9VFYFWSuQDzI7Hub02MrckVVk5ba6xLzqHgqAkYXhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5EdSkZ37ArbloIA3nRDH0i2BYZ9ng95McBRTTWnWCW5sUeB1FshJhCYAWVwUi1oWLCw7/Fds12Z/3mko0jmXBUFR5junZrgzXSEHrdbgrLtDJ0u4lTC6dKxYVRPVnKcCHx8DAdSoZg7riFylSwus0QdflZpU5QeyW4MXWXAxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM/4fxTH; arc=none smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c0be5e548a4so180512866b.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781978186; x=1782582986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofk1tHTYkeea6RmwkgsGn5VZMONxe5kQJxlee5oH/sE=;
        b=NM/4fxTHdmw6CKHlcWQjW48+3TYMjbqKNNSNDJ/4VRfiZOrIu+Hs6spFMZZhwrKanw
         c+1aNkNaEGU+2bW9rfVYGFWl9xtuP73aQxHO/FiLPJVqKNtI9Gp6/Xvah6T1sdFQwcE0
         Abc1+B3BM28098hj200eiw7KMbfU+tlNgqEbWigmaNY0gKk/8VieeU8NYd7so5Ul2u2m
         SvK+OXWuongCPlBSzJu87YLbOx9jMhdhXLaUiLOdlTwtPqZF+3Epl/iJjUePFwbWN7as
         oM2XuS7qqyhfyqT96LvfSbRhvJB76dIz/vZk9hmCD9BlnWmXNPksoTPgcAGBs7uu0GFg
         Ublg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781978186; x=1782582986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofk1tHTYkeea6RmwkgsGn5VZMONxe5kQJxlee5oH/sE=;
        b=ORHXUlY0k57QfjOQd8gobuQo66YzBdEhZI2Y05XdoLDruu55UZEy8IB1StJ6r7tgPk
         KmZSBanRe+Iztmn2/lzmUxNyJzmYvwfaLC0h+p5hZ2qLQZqrCPsnK+sm8m0Lsqs7qxZm
         OGeSXcLoMFuoLw1Uz7+8SmdYvqhcwfBaIJ7SiWtqQZPYX+6uXp12067LGdnTwbDE09rR
         rWniOxHOlMjOwHkHvk/R2lrENI1B/jSBLtiWui+kpn8h3/JQ3mg9YQrKCzntK5vOyoQZ
         aWAJvq0gfurRgoKJkbfAd8PdQZ9IOaN4wK/BFy4rTo41BqP3B4c8bZ5dW2wSryzo3ioB
         uN5g==
X-Forwarded-Encrypted: i=1; AFNElJ+CswICaCYmRUYk9magJq8W/6X9t9+C6LKfXDxet3A4kSfiO7Krcwq4BMTgkOu76chWbaHt0k+dR4o6Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXic+VF7DEIicNmeDYwPzmRCz6fbp4Gqo/LMHqb/MRtOXHLNFr
	gf5md5V3LKqgDC15ofdEzIQC/uqYBlP8nqBSzkcJ+B9eWzlzA2P3UkH44oIwuVpXovcY7xH+
X-Gm-Gg: AfdE7clSbDWvtXJo+rLJpmG6MOguOrFVb27ZarMtchCg4hxS0NpmK3JuNmj0VBadnjd
	OSinuqk8x/vNPHWgL8KQoW/tKj73uyR7wmKXW9GSu2Ujvb0z+BNbRoEILkPteWoPdfsD/qudQ6u
	dZh57JunOq5ZBgs8hfLQ3Y1PHP6eytMLO2vCgEBB/ibRPrTEXbr4/y+B4co1g+x+vBJIt80LlNC
	V3u4JqnF2kIVk1Bo4me32bk7miPGVIa7igp0grHLZenuGnrATsflHV4RwP2pdD266alp/5CXODo
	QvdPxbP18B6T6lcL+ErNYoxeAh87Pguy4n+ODXUlHIVVZVweLf1GgoAsX4s0+TR/nST2JdBkzqa
	E1Jr7Azh7x/CqosKbjoUezPPIZS12QsVRbgqfmYBSuc+EXZq1O6xejvWa9MYGkJlruA==
X-Received: by 2002:a17:907:1b1a:b0:bfe:ed06:5a1d with SMTP id a640c23a62f3a-c098eb2d96amr397621866b.50.1781978185634;
        Sat, 20 Jun 2026 10:56:25 -0700 (PDT)
Received: from adr.. ([2a02:6ea0:c041:2243::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm122947866b.2.2026.06.20.10.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:56:24 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v2] staging: media: av7110: refactor av7110_start_feed to reduce indentation
Date: Sat, 20 Jun 2026 14:55:08 -0300
Message-ID: <20260620175508.13138-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ajZSd4RhjJgDqn1q@stanley.mountain>
References: <ajZSd4RhjJgDqn1q@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65313-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrem.33333@gmail.com,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B67BB6A9705

The av7110_start_feed function contains heavily nested if-statements,
causing excessive indentation and violating code style guidelines.

Refactor the logic inside the DMX_MEMORY_FE case by inverting the
conditional check to break early. Additionally, remove the inner
'if (feed->ts_type & TS_DECODER)' check, as it is redundant since
the outer block already validates this condition.

This reduces the indentation level and cleans up redundant checks
without altering the underlying driver behavior.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 862aee993889c..06c43b5f8a87a 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				if (feed->pes_type >= 2 ||
+				    (demux->pids[0] & 0x8000) ||
+				    (demux->pids[1] & 0x8000))
+					break;
+
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+				ret = av7110_av_start_play(av7110, RP_AV);
+				if (!ret)
+					demux->playing = 1;
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0


