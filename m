Return-Path: <linux-media+bounces-63430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uKNhBIU5H2quiwAAu9opvQ
	(envelope-from <linux-media+bounces-63430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:13:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABD631ADD
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:13:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=P7+BLpcf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63430-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63430-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8620302FA4B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AF6355F46;
	Tue,  2 Jun 2026 20:13:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3135357D0F
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:13:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431230; cv=none; b=KSq+zQyVUFmlD+NfRlP1PHEXacE9pOF0Ggfio/+YJJ0daOX+Ra28wt/57GIlSf5HK+htJ4muI+Qjk4y2Z/aRBfnEYA3v7UyrLDi6S7tWLIGEACAksdjjRA3NVodU4UZ7PRZCsiU2j1CKvSy4eraNpERUkLwNQcODLPINTAE2uzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431230; c=relaxed/simple;
	bh=40D6XnayS1rVeYAEcUfX0I+cg2ZKhBBkf/t4KTWvyP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OqUyBylXHq9f1yCIJ3YXUezqopcvc++vggxtoJuHMi8a3TAVkZDkZMclQ4NCJ7+fHJQG2SOBV7ffIC45uzOP3NKUC/9xtvcLAWkhZe+is0zi2qExBdYH6hPi8+hTBLQ4ELMYAj0GM4QnPdXZzbZ7Kp6xK3VlgWa8LwDSS5GixCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P7+BLpcf; arc=none smtp.client-ip=95.215.58.181
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780431227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qUDrOvJb5XL1UwmKCUAHNSX0L/sIhgTofGvh/5nroP4=;
	b=P7+BLpcfL1NcIoMoTA/X8hVwBJb+7aky2xlv6Pl7La1z+CMY8EyBiyOHWTmMp8fUntowxK
	0yVD+f1812PgwZHJ983IM7rR8eZRoC1jEqZ7+i/2YRjqaChnZqJaQAfbmUWYZ6i3SvMpRo
	cuI6fHvMPRe8occRVeHOWR0YFlTCqgE=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Derek Barbosa <debarbos@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,  Steven
 Rostedt <rostedt@goodmis.org>,  users@kernel.org,  Linux Media Mailing
 List <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb> (Derek
	Barbosa's message of "Tue, 2 Jun 2026 11:51:42 -0400")
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan> <20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
Date: Tue, 02 Jun 2026 20:13:15 +0000
Message-ID: <7ia4tsrkn1k4.fsf@castle.c.googlers.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63430-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:debarbos@redhat.com,m:mchehab+huawei@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64ABD631ADD

Derek Barbosa <debarbos@redhat.com> writes:

> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:
>> 
>> In time: problematic in the sense that the first project that
>> picked it is likely the patch "owner": the token will require
>> maintainership on such project.
>> 
>> In practice it would mean that the token used on patchwork instances
>> with multiple Kernel projects may need maintainers permission on all
>> such projects, as otherwise patchwork update will fail.
>> 
>> Thanks,
>> Mauro
>> 
>
> Hi Mauro,
>
> Just to recap the the thread, to confirm that I am following it correctly:
>
> - Patchwork only supports a single URL mask for message-ID lookup (lore or
>   sashiko). Adding a sashiko link would require diverging from
> upstream.

Is it something we can change upstream?

>
> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
>   parsing. pw tokens also have broad permission scope.
>
> which that leaves us with two "methods" of integration:
>
> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> list, where some running daemon will pickup the mail.

This feels a bit hacky.

> please correct me if I am wrong here :)
>
> Roman, for 1, do we want to dip our toes into FFI for the provided pw_tools
> python script, or would a more general std::process::* subprocess suffice?
>
> Alternatively, we could just translate the logic into Rust, gated behind a
> config. I will have to think about how we would like to implement
> retry-queues.

I strongly prefer the option with implementing the logic in Rust.

> Thinking out loud: would it be simpler to "tag" the reviews that require a
> patchwork-status-update in the DB, and let a cronjob handle setting patchwork
> state? updating the candidates that have successfully posted?

We have already a well working logic for sending emails, we can more or
less duplicate it for patchwork.


Thanks

