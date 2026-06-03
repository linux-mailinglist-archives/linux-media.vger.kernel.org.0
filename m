Return-Path: <linux-media+bounces-63475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PiZ1JXekH2qIoQAAu9opvQ
	(envelope-from <linux-media+bounces-63475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:50:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDD96340A7
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 05:50:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=A9C69AVz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63475-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63475-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C23330686C3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 03:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2E23DC4B7;
	Wed,  3 Jun 2026 03:50:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D753563C7
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 03:50:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780458605; cv=none; b=HFw4FXPcw2F898pG4ROMyEsl0DhHXJD/JcouUUKiD8JveXTHr8zrIjJwT2Rf92C/yzUNBmZ9kuMucVHa/Kclkh3lO+xVJ2M3I2cd2cTvrTnLVIxywdyQ01L2IgJWlKYJ9nCEShaYvLdj4Rhv4m26W3aAzo+k/vqXLVaL2dxOC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780458605; c=relaxed/simple;
	bh=aw1vgVdlOIT+pT6MOWArbyYOqQ8i7057jCnwu6clh6Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JoRzEsqrxoIHPVIFcX/W4UsMOuoUeYY6BF7F4uuUYSMh20XF5whWp5IcSGCh+ySbKoKkdw3tNRunIsF+yecXz5uuUEL8eHkq7pWJIBDfwR3nKk6d26i6mxLecOFTZR0f9XasUnJA+yNvEzh4V651TYrNPyiFlLlPhLACyONEEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A9C69AVz; arc=none smtp.client-ip=95.215.58.186
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780458600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZx/W49VZGasGnz5fIovVWpDiScjB9NIyb3Feq8H5G0=;
	b=A9C69AVzVAuUM0oOSUDOqdCXujJH+F20LiGqX9bto/hO+48CuDW0fYHndzn5E7+8O8F/rO
	eSo7TN03svaef9rCby28gF1YMOPFfwhtrvBVifd/brsMHMQeGfPhPoenQ7grTRHUtd2Kbw
	J37gDjiU5RPn5e1lCyV9O4iNXtesigU=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Linking Patchwork with Sashiko?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <20260603053534.46452263@foz.lan>
Date: Tue, 2 Jun 2026 20:49:40 -0700
Cc: Matthieu Baerts <matttbe@kernel.org>,
 Derek Barbosa <debarbos@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
Message-Id: <D597CF50-77A4-4CE7-8556-96C9325C94B4@linux.dev>
References: <20260603053534.46452263@foz.lan>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	URI_HIDDEN_PATH(1.00)[https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63475-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:matttbe@kernel.org,m:debarbos@redhat.com,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEDD96340A7



> On Jun 2, 2026, at 8:35=E2=80=AFPM, Mauro Carvalho Chehab <mchehab+huawei@=
kernel.org> wrote:
>=20
> =EF=BB=BFOn Wed, 3 Jun 2026 09:50:06 +1000
> Matthieu Baerts <matttbe@kernel.org> wrote:
>=20
>> Hi Mauro, Derek, Roman,
>>=20
>>> On 03/06/2026 06:39, Mauro Carvalho Chehab wrote:
>>> On Tue, 02 Jun 2026 20:13:15 +0000
>>> Roman Gushchin <roman.gushchin@linux.dev> wrote: =20
>>>> Derek Barbosa <debarbos@redhat.com> writes: =20
>>>>> On Sat, May 30, 2026 at 08:53:51PM +0200, Mauro Carvalho Chehab wrote:=
   =20
>>=20
>> (...)
>>=20
>>>>> - pw_tools is a workaround solution to get/set status on patchwork via=
 bot-mail
>>>>>  parsing. pw tokens also have broad permission scope.
>>>>>=20
>>>>> which that leaves us with two "methods" of integration:
>>>>>=20
>>>>> 1. The Sashiko daemon calls the pw_tools script directly to update the=
 status.
>>>>> 2. Sashiko sends a single-per-patch-email with parseable "status" to a=
 mailing
>>>>> list, where some running daemon will pickup the mail.   =20
>>>>=20
>>>> This feels a bit hacky. =20
>>>=20
>>> The alternative that would be acceptable, at least on media, is if
>>> one would add support on patchwork to have a separate permission just
>>> for checks update. =20
>>=20
>> Indeed. It looks like there is an old feature request about that:
>>=20
>>  https://github.com/getpatchwork/patchwork/issues/14
>>=20
>> Linked to Mauro's email from Dec 2015 :)
>=20
> Yes, this is an old request, and, as on most projects, feature
> development takes precedence over security. On that time, we wanted to
> have non-maintainer permissions to allow patch delegation. There were
> more recent discussions during some Linux Media summits a couple of
> years ago, when we started implementing media-ci.
>=20
>>> Granting full maintainership control to external bots sounds too risky
>>> for my taste. =20
>>=20
>> Even if I agree that's not idea, I would trust Roman's and his team not
>> to mess-up with the project I maintain in Patchwork. I don't know when
>> permissions will be more modular on Patchwork. That would be different
>> for other services like access to the Git repo.
>=20
> The problem is not trusting on people: it is trusting on a bot and
> on its infra.
>=20
>> My current workaround is similar to Mauro: pulling Sashiko's results,
>> and publish them on Patchwork, e.g.
>>=20
>> https://github.com/multipath-tcp/mptcp_net-next/blob/0c8d473f43cfab0ed926=
d694c77cb7824893af04/.github/workflows/tests.yml#L528-L596
>>=20
>> But sometimes the pull timeouts, and that's not ideal, plus it needs to
>> be updated when Sashiko has new features, etc.
>=20
> That's why my model is simpler:
>=20
> - handle feedback when e-mail arrives on an user's account(s) using the
>  same infra that patchwork has to add patches on it. If e-mails are
>  failing, patchwork won't work anyway, so there aren't any new timeout
>  risks than what we had before;
> - if an e-mail arrives, don't parse its content: just open a new
>  context, marking as warning, so someone can later check.
>=20
> ---
>=20
> Btw, looking on your code, you're trusting that Sashiko is properly
> classifying issues.
>=20
> When I was testing my new tool, I produced a broken patch by purpose,
> to see if my patch would properly handle CI e-mail output:
>=20
>    https://patchwork.linuxtv.org/project/linux-media/patch/9050789262f583c=
ef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org/
>=20
> If you look there, you'll see how Sashiko considered a broken
> compilation patch:
>=20
>    Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>    - [Low] Intentional compilation breakage via an invalid syntax token at=
 global scope.
>=20
> e.g. instead of classifying it as "High", it classified the issue
> as "Low".

It=E2=80=99s intentional, simple because there are better ways to find compi=
lation issues.
So if Sashiko is right and compilation is broken, most likely the patch won=E2=
=80=99t make
it to the upstream anyway. And if Sashiko is wrong, raising a low severity f=
alse=20
positive is better than a high severity false positive.
That was my logic.=

