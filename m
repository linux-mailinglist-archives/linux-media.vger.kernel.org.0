Return-Path: <linux-media+bounces-64728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gIhxFqhbLGpoPwQAu9opvQ
	(envelope-from <linux-media+bounces-64728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:19:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A467BF52
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=kyWhkEWo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64728-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64728-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB0D53109EB1
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764B53A7F55;
	Fri, 12 Jun 2026 19:18:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189E2F7EF7;
	Fri, 12 Jun 2026 19:18:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291934; cv=none; b=bFxxu++LRJ4Qfe0yEx0J94fCsYhZXgZT/ylo6OoFEH7aGqA3qA7UmUx/54ZpygAyUgRBGBE4F0irNizDd3OmH+AgBctbQfMYSLH6ZyQrELNPvGHRFXytLyYfq3j1g2V5MAtV1eBuHpyuJJeVjjVFweeCQFHEXqrLHkceQ23Mmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291934; c=relaxed/simple;
	bh=LrMIAmidvmh9DGRCTN9kkeMDUAufFD2wTeWIQSPmOws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oyucqA8M0xR3wyCBMcVzsqh/rZBZvbh1BIRbRt+rWc6/CR3dmTUUD1jqQhMjAMN8U5G9X6x50p16+5p4QheXVjw/g8sPMkW1ua43X3nKfnlvx2NY6Us6FH17ywyXzvoOV3Cn6FxaBoLBtNE8kgBwCg/Rj11EPRQHIx7fw99jsrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kyWhkEWo; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 484F840E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781291933; bh=a8hXTDjdIj3T1WUT5mbFahJEnuuxAhS1puwBFIjZFwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kyWhkEWodTXHn76sWb/kiN2JGhKPuzoR2ZOTWq6yhYrlRQasyCbSl3IOBvNXO47ZJ
	 AjwVCKcoif12xtmoccvedoM03osgyJjGG7Mp7Rc087q7YQz6k91UnuFlo9+jb9UkCi
	 fBFWKHkpa0R/88v5IVgwYd7HQuf4n9Dy5dW01Jhw8lapfTGL3qLTdGSyvrbMXsEmnA
	 /1bJ0g4T2j/tsxF5CqMI7XmMwefqAk6w3QlxZPYh2VlN2eJnoxdpwp2TsRq5glzW2s
	 U+OBPKfwGp0PZpbmfW/yQYtRV2OlnWJjmfMgLfJhEYInSZa5ixLu1lglQKTbecc3/P
	 JFyIeTvSqzsnA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 484F840E4D;
	Fri, 12 Jun 2026 19:18:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: admin-guide: fix bracelets and
 translation issue
In-Reply-To: <20260611075513.124994-2-manuelebner@mailbox.org>
References: <20260611075513.124994-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:18:52 -0600
Message-ID: <87mrwz7ejn.fsf@trenco.lwn.net>
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
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64728-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,lwn.net:dkim,lwn.net:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B70A467BF52

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ] and replace 'neuer Name' with 'new Name'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 +++---
>  Documentation/admin-guide/media/bttv.rst        | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

The patch looks OK, but when the patch itself introduces new typos in
the subject line, I conclude that not a lot of attention is being paid.
Please fix that and resubmit after the merge window.

Thanks,

jon

