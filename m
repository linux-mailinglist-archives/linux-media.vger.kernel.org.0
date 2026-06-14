Return-Path: <linux-media+bounces-64865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXjcJ7gPL2qR7gQAu9opvQ
	(envelope-from <linux-media+bounces-64865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CA6822F6
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vh4fqunU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64865-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64865-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0A2300A763
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABC7313534;
	Sun, 14 Jun 2026 20:31:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C627A10F
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:31:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469089; cv=none; b=aiS9f9mQI+C7GiYgHXxniMXkdfcwDjfCpSltCHgf1SQXQG1MBhOrO2/PFBRIXf/Fd3UMQ9dfL+Z8uAiHoGVkmlQvn6WtArworzEftmPOl/mfZdpH5iLajJpWJXjBrR1wlrbNJ98aZ5oG6x2lRgbXzMltJSqgWDAoqLuynCCyt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469089; c=relaxed/simple;
	bh=pS9dj5hZWj+sq0xOxJ1yFaqbU1BUk5WejyxEfxd5tEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNe2wHJBFP2GoB7otPFAqNALzDzab9Tv4GFoHQA9bEhzb0LGg7/8PWNsvzEo8RsRGGQ0FoA+uVrdS1XnU1lPpjfwVONQAYXIQLSM+UXgs8oyYpue5VJ+pchEWN+y3XgYQEv2ZI3Arlh9zsahvjNQax7wWz9vM78itpQ/ve1uuoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh4fqunU; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b900f350fso2338722a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469088; x=1782073888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjNYRCBlo4UVyQJ3qh9HAQ451p2iR7Z90Yo8VcpsvLc=;
        b=Vh4fqunUBi8CrFR0KeYL3ZDHQ0eDPRVpYoqw7GYOlQYLzVCj+3g7loX25fKOGnwLzl
         qjcGxH3Z0z5a/wVMkpnvBsZWUBApeNYzx+fJKGnXOq+6kgInhHFmHLjorLNByE4YrH4t
         bXXe4H3wvDNiF8HLlHgIFtC7GY06hJMLndNl1p0ncxfS9GjZcna3LeYEehlQjIvlyMM5
         hjA3cQCcCJNB/rAZSYGgg6Tdxvsjg5ZDa33Sb9o4luqLLPENfNsskHaZHw0poVzWXSYY
         1uI5wu5X6ON57sZHBHi+WUFwv2HdvtaRxQnq1HObba+kTWpNuJtpiIDD/QjIw8i9GQOJ
         vHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469088; x=1782073888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjNYRCBlo4UVyQJ3qh9HAQ451p2iR7Z90Yo8VcpsvLc=;
        b=PiIO1KZK7WQlQNu64McSSNSPPilYE6Qne1hXuLQHV9pYVv7cgoPPeVUgQ6lnsJOz7J
         V9LgbNNWHzncs/X3YWcz8dlzYNm8KZWrjhNaicKHY8BOLq2dlvE/FOfWRpS2n+Oa11aE
         UJ1vjresr/VXXne3duOeglaPkqcRx0Qj/xx0XzEUgcdAXC5rcMCR2qWSIw4iU+q5uQ6z
         3nufXQY5s+VRiAfcEMfEMsNF/C+3tl98vDxxvixUKLRXRrsNo5tVAoF3tT3kASrZzsLc
         5HBGOKdm8vn9sJ9ihcmPEr5Lzg8XUBYzdBShG5TStOSaRhJU73lO+an0nB2LBjJ3R8db
         f4zw==
X-Gm-Message-State: AOJu0Yyl0d3tDPoUCzQmH4Rz/qKE8uzvSD5qHfrLucHK1YfZTty3OuEC
	vawM0TPqwDOBaDhUrGPLFJfd5FlaZmZ78t3FWoYBcePQVfPZkUdyX1eLL1kJW6Md
X-Gm-Gg: Acq92OFKYU0CcWTpAAOrr+SBVZugNZ2afttsLt1Hu8kjtD4pYKbYhZhr3wROCBy+FX6
	K1ffGdhEqErUioxsNdz/5Cl/ym3lgsGc3noCEw2IohxqL4yFG4zOib0mx8QDJTUa6Vt273UyYE/
	xD1wtnTDtXN99VuJske43eBB5+WanuyUwyyxKiz7rWj6HyMgOzoFGuRsOz3dHcUWyThA723okfn
	Xq1HPjotJFb/OSosx5bXTP+JkFp/fKSrt3tPFF+cINuXQr+IVRPtv6ySy7MUgyFGvnmQkA7NS8m
	HVC+FMwIGgipKmT7wfH8dRT4+vQJpShOWd49MjXRoJv81KtcedwalRc+u9OJWtggfGGnqM/Jw1t
	L3X8WuC6ztDrtRQvQiRM923PrRw3a+xsSDPzC9jZur4QNp4HPYGOxH6UTir00YQj6hVp4inYHk6
	E310uwbfapT+JrWdVO/JQXaoA52elfMH8lrBmA4LYQQgD8SpXxWeiB
X-Received: by 2002:a17:90b:1ccc:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-37c2bd493femr7933097a91.17.1781469087944;
        Sun, 14 Jun 2026 13:31:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.31.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:31:27 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH v3 22/22] media: dvb-frontends: au8522_decoder: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:22 +0530
Message-ID: <20260614202835.11977-23-birenpandya@gmail.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64865-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,nextdimension.cc];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:brad@nextdimension.cc,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F07CA6822F6

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/dvb-frontends/au8522_decoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index 58b959b272c6..9df590603152 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -741,6 +741,7 @@ static int au8522_probe(struct i2c_client *client)
 	if (hdl->error) {
 		int err = hdl->error;
 
+		media_entity_cleanup(&sd->entity);
 		v4l2_ctrl_handler_free(hdl);
 		au8522_release_state(state);
 		return err;
@@ -764,6 +765,7 @@ static void au8522_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 	au8522_release_state(to_state(sd));
 }
 
-- 
2.50.1 (Apple Git-155)


