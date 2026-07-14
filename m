Return-Path: <linux-media+bounces-67597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sUYJIJS+VmoMAwEAu9opvQ
	(envelope-from <linux-media+bounces-67597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:56:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E124F7594CC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=vo0vdJY8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67597-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67597-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EB6E303AA39
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 22:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29FA429CDA;
	Tue, 14 Jul 2026 22:56:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280438F239
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:56:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069771; cv=none; b=cv93tOG+YcJRm+IzQ4+xZSKvvOe4GR4wnhzafwWdJnRHLuQd1tUiiKgC599xq74R3DAp4h1n5SO+SSjxRUV70vsdHZnxxM7Phbvj6v4g2DnJiL5caJLxZDpGz8rQ2eRiFAEpLV2pLLE5e6aEx4Qrow30bs7dLwKBiKRxtbHWaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069771; c=relaxed/simple;
	bh=GnUPPQk6UL1Oj/4ugIACqj/MgXR336xmOfR2QkycNp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KX+iZJYtZfB0jiRDZ5yMFq6UQQUn5eyFdHeEFd1lSIP0IbU1Dz3PzjpLNQUPkFjiYNIisD6X5pHbVFXUqL1hhkxXoe2LetPq4GAEMcwgQW13DF0BcD+Lj09/aIBA9h0e/SD36k+gM76YsuT570u3LXwgWLvRkliYzECpiisIqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vo0vdJY8; arc=none smtp.client-ip=91.218.175.174
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784069767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SrFFAzMQKzs1GuXJc4A0lImb1clhx9pMOg+JWW0xDG0=;
	b=vo0vdJY8FKzjXCswjmoGATPZcB4BG/OLEac/pyjrf7dQSuJazc9KDgTXSS0hFzlGwDUjwf
	mokrHNVUDbn720r6tK6Tgh/nzQ/HHqbMQiDxDLY6uVAPNzYPkaQsQPPx0Ma4z6tsF6kl3a
	oYWYj91iq/qtq49vw8o8od+ib8US+1Q=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Derek Barbosa
 <debarbos@redhat.com>,  Matthieu Baerts <matttbe@kernel.org>,  Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Steven Rostedt <rostedt@goodmis.org>,  users@kernel.org,
  Linux Media Mailing List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260713220427.582b28bf@foz.lan> (Mauro Carvalho Chehab's
	message of "Mon, 13 Jul 2026 22:04:27 +0200")
References: <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan> <20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260710074528.5a6e4457@foz.lan> <20260710083845.23c753ca@foz.lan>
	<87wlv2jq4t.fsf@linux.dev> <20260713095538.3d5e86f1@foz.lan>
	<20260713094120.GD1127719@killaraus.ideasonboard.com>
	<20260713220427.582b28bf@foz.lan>
Date: Tue, 14 Jul 2026 22:55:42 +0000
Message-ID: <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67597-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:from_mime,linux.dev:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,castle.c.googlers.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E124F7594CC

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On Mon, 13 Jul 2026 12:41:20 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
>> > > Individuals can set their
>> > > spam filters up if they don't want to get these emails, I can't control
>> > > it. Providing individual authors an option "I don't want my patches
>> > > to be reviewed" sound strange to me. It's like "I don't want my patches
>> > > to be tested by unit tests".  
>> > 
>> > I agree with you, and, on my head, not sending e-mails to the author
>> > is a clear violation to one of the most basic net etiquette rule on
>> > mailing lists: any replies to posts there should reach the author.  
>> 
>> I don't know where that one comes from.
>> 
>> What happened to this other "most basic rule" that subscription to
>> services that deliver e-mails should be opt-in ?
>
> Replying to an e-mail is not subscribing to a service. It is the
> author's right to know if one replies publicly to his e-mails.
> Explicitly removing him from the C/C of such replies is a violation
> of his rights. 
>
> On other words, it is implicit that, if you post an e-mail, you'll be
> expecting actions or answers to it.
>
> Now, if one really doesn't really want to receive e-mails from a
> particular sender, a block list solves it. Alternatively, a way to
> opt-out is welcomed.
>
> See, this is different than adding someone to a mailing list without
> his consent: On such case, people receive e-mails unrelated to their 
> preferences. For those, opt-in is the right net etiquette.

I agree with this.

But also just practically: if someone who opted out from sashiko emails
posts a patch and sashiko finds say a critical issue, do we expect the
maintainer to go and manually check each time whether the author opted
out and forward the review?

Thanks!

