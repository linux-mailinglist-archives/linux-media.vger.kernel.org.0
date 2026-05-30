Return-Path: <linux-media+bounces-63147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEDfJeklG2rO/QgAu9opvQ
	(envelope-from <linux-media+bounces-63147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:01:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C34610D29
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 20:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96F273004D01
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16D43C1977;
	Sat, 30 May 2026 18:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWs7QtZd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53463342CB3
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780164024; cv=none; b=rj/3Y1UPuVQqjyU3uOg14JXWgCpG3Dgybp1al0GzgWCbHr+LpokdM0KnkbZqKKTnLLVSsqDNC6APqrcyQ8cRaIxJM02VRTs+uRgYNuVk15S8I278KExSoGE7G3Awufn2iWl1bLHicXIBcnjRQQP+I383cJGIHVrLMbO6WjLDHhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780164024; c=relaxed/simple;
	bh=7/XvxLcrEU9e7itf83nGhqk8SdGNlxP/QiO3sQXiVzU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJ2toxEGvrQz04TtDccZW/+1szs7mP8VkSfU/U9FqTbKtrZY5Rw67Lq88TZHBNpjL9E3+GSQMuVysBz1mHI25HlL/N0ZWy/oE+tddhdDx5wZDly/92RNcvEsA6F1Y6Cs1BYnvcNKGPODeEl6Yb5CVCpBZKB4FhVbuHsWjYvZJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWs7QtZd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9EE1F00898;
	Sat, 30 May 2026 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780164022;
	bh=sB95AeAQB4DcmqKWYki8m9Y3cn29Y+9hpfDFO5Sf8B4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nWs7QtZdOJPt8soEo7iqhk+RNF6mU7T5jCimnfxKUOrYDvR2bf48LupS8VL6lcWuw
	 8JsSCayMXd7A8w0zAhX3FgUAB3uIWPnZyrS3l2kwJr+yRAOX4A6giLV6IP+o93q3oE
	 4BM8QjNn4zboJX3fKR31AteHrmas/sgvjvA6IUIKuBikT3323CZ/rzjW0K2k9OtqFo
	 aPXlCa1p3LU1geHfAh0rsND4nujmeVoMbuWpjDpG/SMQR8nleTyTcW01ouuS1bexKM
	 e219cJQbaPOaKDRueKIl6DmdNg2pI24B7/qroi8AXHRGW39+r52q86GOCmdPrrULAs
	 YvoHPt+owEC8w==
Date: Sat, 30 May 2026 20:00:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260530200017.0fe7f685@foz.lan>
In-Reply-To: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
References: <20260530103004.6fe2ffa7@foz.lan>
	<7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63147-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 99C34610D29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 08:57:13 -0700
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> Hi Mauro!
>=20
> My understanding is that some subsystems might be interested in having pa=
tchwork integration=20
> without Sashiko sending reviews over the email. Most notable, net. Also m=
ptcp.

Well, you can use my scripts to do such integration
(https://github.com/mchehab/pw_tools).

Yet, you'll need a patchwork token with full project permission to add
a new check - e.g. it would allow Sachiko to not only change checks.=20
Such token will have all project grants including status and delegation
changes.

Anyway, for subsystems that prefer a direct integration and provide
you a write token, you can let sashiko to run my script - or call directly
the Python class on it - letting it update status directly. You'll
probably need to implement a queue to do retries, in case patchwork
server has issues by the time it tries to update.

For media, I prefer a single e-mail, sent to a separate e-mail, to
reduce e-mail traffic at the main ML. This way, we can let such script
do just check changes - and use the same process to also handle other
bots like sysbot and LKP.

Also, emails are asynchronous, and, in case of problems, one can repeat
the operation later using a ML archive to re-run the email queue.=20

>=20
> Thanks!
>=20
> > On May 30, 2026, at 1:30=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+hua=
wei@kernel.org> wrote:
> >=20
> > =EF=BB=BFHi Derek/Konstantin/Roman,
> >  =20
> >> On Fri, 29 May 2026 11:28:29 -0400
> >> Derek Barbosa <debarbos@redhat.com> wrote:
> >>=20
> >> Hi!
> >>  =20
> >>>=20
> >>> Forgot to mention, but at least on media patchwork, the best is for
> >>> Sashiko to send an e-mail that would allow a local script to run it.
> >>>=20
> >>> The rationale is that patchwork permissions aren't fine-grained: only
> >>> an user with a project maintainer token can update checks. Granting
> >>> such permission would allow other changes at the repository, like
> >>> delegating a patch, archiving it or changing its status.
> >>>  =20
> >>=20
> >> Thanks for the note. It will take me a minute-or-two to get up to spee=
d here.
> >> I'll reach out for any clarifying questions if that's OK :^) =20
> >=20
> > I added a bot parsing tool at:
> >    https://github.com/mchehab/pw_tools
> >=20
> > And ran it at the maildir with linux-media e-mails I have locally.
> > It is currently set to parse e-mails from:
> >=20
> >    - LKP;
> >    - Sysbot;
> >    - Sashiko.
> >=20
> > You can see the results at:
> >    https://patchwork.linuxtv.org/project/linux-media/list/
> >=20
> > (most of the warnings there are from my parser)
> >=20
> > And this is how it looks when a patch with bot results is opened:
> >    https://patchwork.linuxtv.org/project/linux-media/patch/20260529-mil=
os-iris-v2-2-7a763d7195ae@pm.me/
> >=20
> > I didn't set yet any daemon to keep this updated. As I used my own
> > token, all contexts were marked with my own ID.
> >=20
> > There is one issue with the current process: if there aren't any
> > warnings on a patch, like on this example:
> >=20
> >    https://patchwork.linuxtv.org/project/linux-media/patch/202605291543=
57.18066-1-mohan86108@gmail.com/
> >=20
> > There's no way to tell if Sashiko tested such patch or not. As I
> > commented with Roman in a private discussion, ideally the best
> > would be if Sashiko could produce a single per-patch-series email
> > that would have something similar to this:
> >=20
> >    Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
> >    Reply-to: <some_id>
> >=20
> >    Hi,
> >=20
> >    Sashiko robot found the following potencial issues:
> >=20
> >    Patch 1/13 (<message_id): Success
> >    Patch 2/13 (<message_id): Success
> >    Patch 3/13 (<message_id): Success
> >    Patch 4/13 (<message_id): Success
> >    Patch 5/13 (<message_id): Success
> >=20
> >    Patch 6/13 (<message_id): Warning: https://sashiko.dev/#/patchset/...
> >    - [Low] The `self.field_prev` variable is assigned but never used
> >    ...
> >=20
> >    Patch 13/13: Success
> >=20
> >    Please check if those issues are pertinent.
> >=20
> >    Sashiko AI review
> >=20
> > E.g. it would contain success and warning status for each message
> > ID inside a patch series. This is also ideal for me as a maintainer,
> > as I can clearly see the low/mid/high issues detected by sashiko
> > on a single e-mail.
> >=20
> > Thanks,
> > Mauro =20



Thanks,
Mauro

