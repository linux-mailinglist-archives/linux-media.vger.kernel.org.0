Return-Path: <linux-media+bounces-67389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id adF8AshwU2qrawMAu9opvQ
	(envelope-from <linux-media+bounces-67389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:47:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFE97446AA
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ritovision.com header.s=zmail header.b="eYW1X/WM";
	dmarc=pass (policy=reject) header.from=ritovision.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67389-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67389-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 416D830209DA
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 10:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7D63A5E78;
	Sun, 12 Jul 2026 10:45:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD093A5435;
	Sun, 12 Jul 2026 10:45:15 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853117; cv=pass; b=bFJdPZ2gsXHzQk7nI4kHMd6N9htHB1xp0Q1LLkXZS6XROZgnh4naxdGQHXraLigkjkeYmEyTWV3fHSzcliUns8E69sOUq2STyHXqA9r+Q04G4eeguUyxMGAx8K/GVsTSUNR9jA+Yy8qTtmUFSYFn1ueI+mK6zEwsQz5XB6CM6/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853117; c=relaxed/simple;
	bh=7jHEBcL+dS6mzFVThVI2nEPKczs+89jm32mYgxOs9Ps=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=B4ToJAj5DjNbiSNvIAKtmki1ffXKff+F90LszAgyRiT2HNDmHpS7qhAvrlDz3kp0yePfQ3ptIXEGSGG69a9FF2BJaFKmS9oYwWxpRUAK4v5V6CUF8aodr/pDELDue0fmjM1MgQO/pU2Xb/eXgc/GyQT2lV4Ug13gRL8uLxBTGak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=eYW1X/WM; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1783853111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kILMFopl5NmGQ923NMG6WoYdSiCvK5CYgMBCZc3Vt6Wb2pg6YfnPfxuYCDinAPorcS063o/wIHZwRVgnpurnL3sc9ZDSBQbcy2tWYH8sVjHqpq+98Hl3jJbX4EyHco29fCfBSgDvmJ224CqRGZuvAOmZPrw4H4p23vyESu9R0q4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783853111; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=7jHEBcL+dS6mzFVThVI2nEPKczs+89jm32mYgxOs9Ps=; 
	b=a1fC4dS3CFfnoLSurFHRevaodi/XKtDitF4CBAgKoBwpaMjQJUPjflnUyZjlcU0XzBnjYrCMcL/2anNNbhm3/H1GejcjD5wKGBMgrw/jKhY/gcZbLheqHrbGgyzuEPuFYk4JqXyHZuq0B00Wj0PwBs5pAguh3donZ7uALyc5H8o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783853111;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To:Cc;
	bh=7jHEBcL+dS6mzFVThVI2nEPKczs+89jm32mYgxOs9Ps=;
	b=eYW1X/WM9uCGj4cvL5WfMO29a59dd7xswcbFhalev4QhadLLJAdbZnvHqhbEoXX3
	OkW5BjpSyiH7VETosB5uRjyD2KozBr+laW0QXLiC3AH+pX2zbDUeUwIkLOxPsC2h+mg
	GdfMLfCAPJsrZGOc6OiBef71nCKV3Vr2nCrix0zQ=
Received: by mx.zohomail.com with SMTPS id 1783853110393547.0399791283496;
	Sun, 12 Jul 2026 03:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 06:45:08 -0400
Message-Id: <DJWJ5GMPAITT.VLIMXPTRIIWV@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Daniel Lundberg Pedersen" <dlp@qtec.com>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>
Subject: Re: Bad wrapping in some tables
X-Mailer: aerc 0.21.0
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
 <87bjcen9j1.fsf@trenco.lwn.net>
In-Reply-To: <87bjcen9j1.fsf@trenco.lwn.net>
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ritovision.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ritovision.com:s=zmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rito@ritovision.com,m:dlp@qtec.com,m:linux-doc@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67389-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rito@ritovision.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ritovision.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ritovision.com:from_mime,ritovision.com:dkim,ritovision.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DFE97446AA

> > Reason 2: the real culprit here is this:
> >
> > Table mobile responsiveness in general in the Linux kernel
> > documentation is systemically pathological.
>
> I honestly have to question how important that is to us. How many
> people are really trying to make use of the kernel documentation on
> small-screen devices? This is the kind of information you need when
> you have editor and terminal windows open.

To clarify, when I say mobile responsive, I'm using that as a term of
art for narrow viewports within the tablet / mobile window size range,
I'm not specifically or exclusively referring to mobile devices, and I'm
operating knowing that desktop is the primary medium here. The fixes
should all be improving desktop experience at these narrow sizes; mobile
devices also being improved but not as the primary focus.

> I tend to use relatively narrow browser windows so that I can fit more
> of them on the screen

^ (Your response in the thread for Mauro's body width change)

You are one of the beneficiaries, among many others with similar
habits on desktop that make use of narrow windows.

I'm testing a few things out to see what's a reasonably simple path
forward.

