Return-Path: <linux-media+bounces-67309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3BJZAeERUWoO/AIAu9opvQ
	(envelope-from <linux-media+bounces-67309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:38:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E173C561
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:38:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=pfprDbFU;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67309-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67309-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A17303023F83
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3E9364EB8;
	Fri, 10 Jul 2026 15:34:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097242DA27;
	Fri, 10 Jul 2026 15:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697669; cv=none; b=ZGUXdHi29x35T0HIx7HxfNl5TT0Wbqas8SKy1njraIgwf8SZrqhDVPqlSOmgRaTQ9ZZGeXGd1Wt0LMgUSyDSaoEAWradmSNVDO2H5IXKuJ12p3tGTDsvfm7ByDW2EH1MjWtOD3plv9U4mgCgHAuUyFoZpVTY7zAvQmyigiGNhQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697669; c=relaxed/simple;
	bh=ZWEBIhy5w576yq/v3OLl5lhdIs+WyB2J1ti7p8DXLEM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XSjnfLG1zJgRqQxIL0ywEW8G6psnVg0IeWMkHr68Mb7BnBjp+bCg+CEGmkpMO2uPwmoKJ71cu7VOZVcVRDUgTraA9C/ASVmxipfT40ViWvCMH2n/TsfUeIPD36XazzYzgVheQBCScobFQqKIT9GRMiRRq+L02kfnia+I+Ylvggw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pfprDbFU; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C754A40E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783697668; bh=iEYFj631L5NcaFhfQp0ws1nu9IQF70kqZOCWcmaOLjk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pfprDbFUCusx+QAYGTjsFHwHRe2xjpwDvVUqHfcJucIlhkzUXMYDsCtHLmYmeurmq
	 GSS1buoWxvfFQXiiHxC6PEhSAnnJhK2ZwHuBSVHKzQrr1M/lDvHbl5I2piEU8LRF72
	 xFvgXqIPHtZhspUFxzJlckkXg0wYYD47wNsg/xWImwo4gfIhL+Ti6SA8rGQiqxAU2y
	 qzHJ9Top/T9pWHRJdyiGQKtMbSNrL5Ep4RR0QU1YoFFcoFbEmChQA4zS8THuSFofo7
	 hcZ9GIyDyxdl5ridhzHa+NQzkkew2QpCse2jMK7BqX+Ycd1OZY9JQRE54KBAN/xZiA
	 UGWtu1kNJ+7nA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C754A40E3D;
	Fri, 10 Jul 2026 15:34:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Daniel Lundberg Pedersen
 <dlp@qtec.com>, linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: Bad wrapping in some tables
In-Reply-To: <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net>
 <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Date: Fri, 10 Jul 2026 09:34:26 -0600
Message-ID: <87bjcen9j1.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67309-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rito@ritovision.com,m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,ritovision.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:from_mime,lwn.net:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 358E173C561

"Rito Rhymes" <rito@ritovision.com> writes:

> Reason 2: the real culprit here is this:
>
> Table mobile responsiveness in general in the Linux kernel
> documentation is systemically pathological.

I honestly have to question how important that is to us.  How many
people are really trying to make use of the kernel documentation on
small-screen devices?  This is the kind of information you need when you
have editor and terminal windows open.

Making small screens work better is fine on its own, but I don't think
it should be done at the cost of proper rendering on the sort of devices
that developers actually use.  There are limits to which we want to
develop and maintain our own custom theme for a use case that, I
believe, is pretty rare.

Thanks,

jon

