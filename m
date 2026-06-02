Return-Path: <linux-media+bounces-63413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p7PpFucMH2ouegAAu9opvQ
	(envelope-from <linux-media+bounces-63413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 19:03:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D796307DE
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 19:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I9j+ChfK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63413-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63413-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D1BD30283C2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 16:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CC538399E;
	Tue,  2 Jun 2026 16:51:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1C6383C84
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 16:51:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419082; cv=none; b=ctuxWcAeMznhYovir+BQ3Pu3AbcnSnFCScne71T70iaffg32af9Ai8AfXO26gkIsxnYiyVyVozIlqL09xKY6e88+RKc4r71Tpl8veJtMx5X/R/QWz0WFIwN2qHJOALcpik7ONSPdoDsZNLVXB0Q1nxPhwKxaOX9Gm1oS0kpKL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419082; c=relaxed/simple;
	bh=iSAy6Y1ZMC4+to5uHDxjV23TWdSBDKYUM64Prkj5ggs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=raU0CKGDCVMaaPUvKSQvHhkjLCfI4Mm6TPKUc3tjQ09+5t4JOAjr+Rm+NQpdePCmLrDrOZ59qBnuMd+q1eK718InWWibtnZuvBfFEQMno+y7caJ+n/81AsGoL+WVWblf9TgeNhytqXs18SYUWflubxuQXhPWKCrO6G8/Ap9vODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9j+ChfK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD791F00893;
	Tue,  2 Jun 2026 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419080;
	bh=9WHTiY1N2Z1J0iSMC0yEDaCXwrHu3OAAebVGabMf4Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=I9j+ChfKGgLiq2i3Uk+0Q1tNiLvTfaT/oo+INbdu5jgNdD5GBqPzahUTWgjoDH4uf
	 yCOPU1cDrN9La22WZnch7puYj4IaFt5rzADqA3ME8WHkA37ETC93RAAcL84uL4kbkN
	 m0I0dWitfhWXaXR7kpasAw0T9acmnLHY5PIN/+zTHL10Y01S2Q45KB3lqdNJjMp8Wx
	 gZQlqS2NdxapCTCqU6Jljk90EMeySIhfqqPJ8U4WusdRLFxQ6BEtzVcOxLTpGStIDf
	 cEYVnrLpijfXxSiyt+qgVCZJVBtUHETDsPe64lM7RicdebTCkiRf/ASf+L/SiISJZr
	 XMTk8rTk5uGew==
Date: Tue, 2 Jun 2026 18:51:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Derek Barbosa <debarbos@redhat.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260602185115.4b5c4886@foz.lan>
In-Reply-To: <ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63413-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linuxtv.org:url,linuxtv.org:email,get_maintainer.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59D796307DE

On Tue, 2 Jun 2026 11:51:42 -0400
Derek Barbosa <debarbos@redhat.com> wrote:

> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:
> > 
> > In time: problematic in the sense that the first project that
> > picked it is likely the patch "owner": the token will require
> > maintainership on such project.
> > 
> > In practice it would mean that the token used on patchwork instances
> > with multiple Kernel projects may need maintainers permission on all
> > such projects, as otherwise patchwork update will fail.
> > 
> > Thanks,
> > Mauro
> >   
> 
> Hi Mauro,
> 
> Just to recap the the thread, to confirm that I am following it correctly:
> 
> - Patchwork only supports a single URL mask for message-ID lookup (lore or
>   sashiko). Adding a sashiko link would require diverging from upstream.

Not sure what you mean.

AFAIKT, a RFC-822 application can have just one message-ID per message.

For message lookup, patchwork works using its own patch ID, or via a search
to the original message ID that contains the patch. So, no, it won't be lore
nor sashiko, as neither lore nor sashiko write e-mails ;-)

If you're talking instead about CI reports, patchwork does support multiple
sources.

See for instance:
	https://patchwork.linuxtv.org/project/linux-media/patch/20260531-qcom-cphy-v5-8-6be0f62b4d65@ixit.cz/

There, media-ci does update it directly via rest protocol; Sashiko
(and LKP/Sysbot) messages are handled by inspecting e-mails using
pw_tools.

> - pw_tools is a workaround solution to get/set status on patchwork via bot-mail
>   parsing. pw tokens also have broad permission scope.

pw_tools is not a workaround solution. It is client tools implementing 
Patchwork's REST protocol. You can use it or whatever other client you
want. If you decide using it, feel free to send me patches improving it
as needed.

> which that leaves us with two "methods" of integration:
> 
> 1. The Sashiko daemon calls the pw_tools script directly to update the status.
> 2. Sashiko sends a single-per-patch-email with parseable "status" to a mailing
> list, where some running daemon will pickup the mail.
>
> please correct me if I am wrong here :)

There is a third option, which is what I currently implemented at:
	https://patchwork.linuxtv.org/project/linux-media/list/

3. Parse the e-mails already sent by Sashiko, before/after patchwork's
   e-mail job process.

The problem with (3) is that it will only pick Sashiko's warning
e-mails, as success doesn't generate e-mails. The alternative of sending
e-mails also for success doesn't scale, as nobody wants that every
possible bot out would send success messages to them. Those are OK
to just update CI context display.

That's why, on media, we do prefer (2), preferably sending e-mails
to a separate e-mail that won't be adding it to the mailing list.

> Roman, for 1, do we want to dip our toes into FFI for the provided pw_tools
> python script, or would a more general std::process::* subprocess suffice?
> 
> Alternatively, we could just translate the logic into Rust, gated behind a
> config. I will have to think about how we would like to implement retry-queues.

Certainly if you decide to do that, you'll need to have retry-queues and
eventually some traffic-flow control to avoid too heavy workloads at
patchwork's side.

> Thinking out loud: would it be simpler to "tag" the reviews that require a
> patchwork-status-update in the DB, and let a cronjob handle setting patchwork
> state? updating the candidates that have successfully posted?

Patchwork handles e-mail sending this way.

> Anyway, Mauro, I think we have the capacity to tackle both patchwork integration
> methods. Would exposing a configuration in the email_policy file that allowed
> for mailing lists to specify what type of patchwork integration suffice?
> 
> This way, a mailing list that would want patchwork integration can opt for
> either the single email approach (as you described) or through the API?

Makes sense.

> something like:
> 
> [subsystems.linux-media]
> lists = ["linux-media@vger.kernel.org"]
> reply_to_author = true
> cc = ["linux-media@vger.kernel.org"]
> + # optional value can be set to email or API
> + patchwork = "email"

works for me, but I would, instead do something like this:

	patchwork = "email:a-bot-status-update-email@linuxtv.org"

to let one specify a different e-mail address to handle context
updates, thus reducing ML traffic.

> Roman is currently working through how "subsystems" are detected via Sashiko,
> taking inspiration from the get_maintainer.pl script. 

You could also take a look at:
	Documentation/sphinx/maintainers_include.py

The parser there converts maintainer entries into a dict, which
can make it easier to use, specially when you want to handle
multiple subsystems.

> This may help with some of
> the concerns I saw with patches-meant-for-other mailing lists?

Yes. Btw, in the specific case of projects using patchwork@kernel.org
(or any other instance with multiple Kernel projects), the user which
updates CI status information has to be maintainer on *all* kernel
projects, as otherwise some/several patches won't be updated.

Basically, when a message is c/c to multiple mailing lists, just one
of such mailing list will "own" the patch. Only a Django user with
permission at the owner list can update it.

Thanks,
Mauro

