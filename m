Return-Path: <linux-media+bounces-63435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZMQoBfxBH2oBjQAAu9opvQ
	(envelope-from <linux-media+bounces-63435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:50:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E67631E06
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=IWfJDCNt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63435-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63435-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1122D301BCD9
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D22356758;
	Tue,  2 Jun 2026 20:45:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319BA2E62A9
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:45:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433103; cv=none; b=YvBi6j9JHUV4o4eoHlHk9L6Df7XBE5auVTWY8as41yyg65OrmKupUPKy5h2znWTwXuh7UwNjFAD9fN/uVBYt97JDiTI9D+5a640aXz28RBIgExvh4pkvW/UzOpioUetctcCCOEvgor++WsoWC4p8LJ80JDkjnDSnn6h6Jjj/pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433103; c=relaxed/simple;
	bh=XOXieHT5BNwSL6lnj4StoJAGUsbJruWniToi9U2yReM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e+edqrnrnQhpnNL0Verco9hLMdaUKTJBMGtRyV9blTNx1bXtwVczXSJDx00ykU7qP3Od++BF/mRwjiTBHk+j+a0FgFZlxfd8QIzYDFV54aTQRLFoxKs335kWIlqjFRiFmSAMk41R0NQT2YfB/3tRmnNUW99HXFDvTxQrXA2MxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IWfJDCNt; arc=none smtp.client-ip=91.218.175.185
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780433099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GovdXnIkZYl5ihVwHTXq51twoG5NdKn4Swa4IYsN7Lc=;
	b=IWfJDCNtChn4jUMaQjUR6s5f3QFfMeubprBdbCuIMzDQa6zpwxiYD9jZpLzzFFLo898v8q
	rpuqIiQOY2gwQ3qgVxSmjNR2ckmcz2JKGqHUiqAIyjVGv6dXMf8AJh3cyb1XhpvUOydK40
	72sfJksxSKoavtcXyzOHAMZ990xOals=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,  Steven
 Rostedt <rostedt@goodmis.org>,  users@kernel.org,  Linux Media Mailing
 List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260602223936.27def657@foz.lan> (Mauro Carvalho Chehab's
	message of "Tue, 2 Jun 2026 22:39:36 +0200")
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan> <20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
Date: Tue, 02 Jun 2026 20:44:39 +0000
Message-ID: <7ia4jysgvfig.fsf@castle.c.googlers.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63435-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10E67631E06

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On Tue, 02 Jun 2026 20:13:15 +0000
> Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
>> Derek Barbosa <debarbos@redhat.com> writes:
>> 
>> > On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:  
>> >> 
>> >> In time: problematic in the sense that the first project that
>> >> picked it is likely the patch "owner": the token will require
>> >> maintainership on such project.
>> >> 
>> >> In practice it would mean that the token used on patchwork instances
>> >> with multiple Kernel projects may need maintainers permission on all
>> >> such projects, as otherwise patchwork update will fail.
>> >> 
>> >> Thanks,
>> >> Mauro
>> >>   
>> >
>> > Hi Mauro,
>> >
>> > Just to recap the the thread, to confirm that I am following it correctly:
>> >
>> > - Patchwork only supports a single URL mask for message-ID lookup (lore or
>> >   sashiko). Adding a sashiko link would require diverging from
>> > upstream.  
>> 
>> Is it something we can change upstream?
>
> No idea. I suspect a change like that will require change patches database
> and use Django's migration logic to touch its database.
>
> However, at least for me, I can't see any value of being able search for a
> patch based on Sashiko's message ID.
>
>> > - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
>> >   parsing. pw tokens also have broad permission scope.
>> >
>> > which that leaves us with two "methods" of integration:
>> >
>> > 1. The Sashiko daemon calls the pw_tools script directly to update the status.
>> > 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
>> > list, where some running daemon will pickup the mail.  
>> 
>> This feels a bit hacky.
>
> The alternative that would be acceptable, at least on media, is if 
> one would add support on patchwork to have a separate permission just
> for checks update.

Agree, it feels like the best way forward.

> Granting full maintainership control to external bots sounds too risky 
> for my taste.

Agree. I'd strongly prefer Sashiko to not have it.

