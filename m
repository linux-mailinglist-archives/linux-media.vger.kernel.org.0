Return-Path: <linux-media+bounces-66898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EOMiGT05TWpExAEAu9opvQ
	(envelope-from <linux-media+bounces-66898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:37:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D471E57A
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:37:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="rk3/UTRm";
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66898-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66898-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E581D3019385
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAD6370D5C;
	Tue,  7 Jul 2026 17:36:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA921A6823;
	Tue,  7 Jul 2026 17:36:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783445818; cv=none; b=jyk4kRTjxf1NVB+E4QTT8ZsITknikHGGA07sAfDsJZXyEcT32wNCh5a7Kv77VGGR0MMGauM+cGTm/M2d3dt/F/utvdPe6L1V9+QlfJhxeZNbZB3u72AhaWA3/FpmFluNudbCb9Pl7Dz+QrQkTTc6RuQ5ZCZKbQ6sYSmu9WBeGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783445818; c=relaxed/simple;
	bh=Ib/vVqcal4j1MGj8D0TYa+zICO91dCuZmlsT4KqrO20=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kbhe1D6CfBqyCa33ahnEuScufC0CJlEaP5FOC7LJlhbqy4ULa5O2K438sHokrcUSsPzutOXWkFyk2hfOgmeKVTY4db814wRw1+JOafjeAtRH8BCB04DeTHFYn7rs/nlhrLbkwGB/DxXNILvGCQKagBMNOfycldIs3iZOQVv0YBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rk3/UTRm; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A66E040430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783445815; bh=COXHWe8bmkjlnZivcKeLq98DBvhs3tW0/+YwQdc3IWU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=rk3/UTRmwQJgFwPjxnuOk8nvd6IPczW0ZRnxhLUuJI2lKSkc/tuTYIkJIykpMXW8h
	 KHdNGLyfbsW9paWamyXjGuOUuY8o6jfuK8aA9T6av66YqdsvyvYA0qPmGIdXXEJyAQ
	 cLRW18gw2+pDpjjcTDQsyU+YqL63JB72AgLYlSoG+NBys79xzQH4InPJzUTtVKOTof
	 DBLY6cQPeYBxOPeBg1opVkSzE2sdhVfW2t3xiPtvRv/6pYVgVXnYhf1oxkycqEiqJ3
	 xR1OA5YO8555kUaWG1dEMmKDNgEPSvRUh6bz6PknNig/u66IMir+TRRkEmfCk1Hvkk
	 1NLzgpNmKWIZA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A66E040430;
	Tue,  7 Jul 2026 17:36:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Lundberg Pedersen <dlp@qtec.com>, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: Bad wrapping in some tables
In-Reply-To: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
Date: Tue, 07 Jul 2026 11:36:54 -0600
Message-ID: <87pl0yr9ah.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66898-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,m:rito@ritovision.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D0D471E57A

Daniel Lundberg Pedersen <dlp@qtec.com> writes:

> I've noticed some bad wrapping happening in tables, seemingly only in
> the Media docs, but that's also where I look the most, after v7.1.
>
> See:
>
> https://www.kernel.org/doc/html/v7.1/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers
>
> Compared to:
>
> https://www.kernel.org/doc/html/v7.0/userspace-api/media/v4l/vidioc-create-bufs.html#c.V4L.v4l2_create_buffers
>
> Other tables have also changed, but they don't end up this bad, e.g:
>
> https://www.kernel.org/doc/html/v7.1/process/debugging/kgdb.html#run-time-parameter-kgdbreboot
>
> I've bisected it to be f2679ac773899f5fdea0b68d5077eef5f88dfd42 that
> has caused the change, and I did try some quick changes to see if I
> could fix it for the tables, but I didn't get any positive results.

For future reference, it really does help to copy the maintainer and the
author of the patch.

The patch in question tweaked our CSS thusly:

> +code.docutils.literal span.pre {
> +    white-space: normal;
> +    overflow-wrap: anywhere;
> +}

That overflow-wrap line is the problem.  The patch was trying to improve
overflow from some literal blocks, but it does seem that the cure is
worse than the disease.

I've just made the attached revert - thanks for the report!

jon

From 1afefde902c5267d1197da8a3b039354ed771d37 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 7 Jul 2026 11:34:47 -0600
Subject: [PATCH] Revert "docs: allow inline literals in paragraphs to wrap to
 prevent overflow"

This reverts commit f2679ac773899f5fdea0b68d5077eef5f88dfd42.

This change causes truly unreadable breaking of literal strings in a number
of settings.

Reported-by: Daniel Lundberg Pedersen <dlp@qtec.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx-static/custom.css | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 5aa0a1ed9864..2e019c8f8a56 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -156,15 +156,6 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
 
-/*
- * Let long inline literals in paragraph text wrap as needed to prevent
- * overflow.
- */
-code.docutils.literal span.pre {
-    white-space: normal;
-    overflow-wrap: anywhere;
-}
-
 /* Let rendered reference links in tables wrap when needed. */
 div.body table.docutils a.reference {
     overflow-wrap: anywhere;
-- 
2.54.0



