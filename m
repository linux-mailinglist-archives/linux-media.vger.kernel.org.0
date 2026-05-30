Return-Path: <linux-media+bounces-63144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEfiI/oIG2pg+ggAu9opvQ
	(envelope-from <linux-media+bounces-63144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:57:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F560DD8D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1FD99300860E
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA0E32BF24;
	Sat, 30 May 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rXEkyjxH"
X-Original-To: linux-media@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B475D2F8E85
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780156654; cv=none; b=KDvoljpQB7W+G71HI38LiwIEjrYhHWtGGtf0MYZ8dsX8ozhCUZL8cpOureIeb6P2rgow4TB/05L2FajN/KAnsEtTly6bYbceALBezC30eyM51IhlPDDqPay+5knFb++4Lx/uo4V3IHdUE5YZXW/sdk7/qsxqrvc+gkkkuAQhSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780156654; c=relaxed/simple;
	bh=FHOayfElY9/FnutpS/qLWhIn7PzgMQ46Fghx+ybBwz4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QXSe99p8gOpcIUmrYFTVc1EHsxTmh5ZMKTz+lwQgauLfx5KghYYpjCtA4dwof1xDtW+2qw+zzMtEEYtAbfDiUmVjq6qJKJh5lsLdKhlSjnk5tpVGUWgk5EWycE491/3DkqQpyFRhLLHlmgJcEfOxI8pTy1UI6deI1jJ8Q7STjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rXEkyjxH; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780156648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzrLATNwN4Gl1/FXIf4hOJDt4GSBIX5WeLiUtTXlYgU=;
	b=rXEkyjxHRlNmiF2XQPSEUJvFHaNxmxCG8AH8RqhAdjDlMilbHquxJNfLSAzf3DQTqQxE48
	iydzC7XfLhj2z0h+vYvYZpTo7ii1aTy9AItX0d+IrtI/greuJUf0BVjzsKi1jNTEW37Luz
	eiFd4cWnzH9G34UiU6bfTyJz8KyxHe4=
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
In-Reply-To: <20260530103004.6fe2ffa7@foz.lan>
Date: Sat, 30 May 2026 08:57:13 -0700
Cc: Derek Barbosa <debarbos@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>
Message-Id: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
References: <20260530103004.6fe2ffa7@foz.lan>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63144-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 425F560DD8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mauro!

My understanding is that some subsystems might be interested in having patch=
work integration=20
without Sashiko sending reviews over the email. Most notable, net. Also mptc=
p.

Thanks!

> On May 30, 2026, at 1:30=E2=80=AFAM, Mauro Carvalho Chehab <mchehab+huawei=
@kernel.org> wrote:
>=20
> =EF=BB=BFHi Derek/Konstantin/Roman,
>=20
>> On Fri, 29 May 2026 11:28:29 -0400
>> Derek Barbosa <debarbos@redhat.com> wrote:
>>=20
>> Hi!
>>=20
>>>=20
>>> Forgot to mention, but at least on media patchwork, the best is for
>>> Sashiko to send an e-mail that would allow a local script to run it.
>>>=20
>>> The rationale is that patchwork permissions aren't fine-grained: only
>>> an user with a project maintainer token can update checks. Granting
>>> such permission would allow other changes at the repository, like
>>> delegating a patch, archiving it or changing its status.
>>>=20
>>=20
>> Thanks for the note. It will take me a minute-or-two to get up to speed h=
ere.
>> I'll reach out for any clarifying questions if that's OK :^)
>=20
> I added a bot parsing tool at:
>    https://github.com/mchehab/pw_tools
>=20
> And ran it at the maildir with linux-media e-mails I have locally.
> It is currently set to parse e-mails from:
>=20
>    - LKP;
>    - Sysbot;
>    - Sashiko.
>=20
> You can see the results at:
>    https://patchwork.linuxtv.org/project/linux-media/list/
>=20
> (most of the warnings there are from my parser)
>=20
> And this is how it looks when a patch with bot results is opened:
>    https://patchwork.linuxtv.org/project/linux-media/patch/20260529-milos-=
iris-v2-2-7a763d7195ae@pm.me/
>=20
> I didn't set yet any daemon to keep this updated. As I used my own
> token, all contexts were marked with my own ID.
>=20
> There is one issue with the current process: if there aren't any
> warnings on a patch, like on this example:
>=20
>    https://patchwork.linuxtv.org/project/linux-media/patch/20260529154357.=
18066-1-mohan86108@gmail.com/
>=20
> There's no way to tell if Sashiko tested such patch or not. As I
> commented with Roman in a private discussion, ideally the best
> would be if Sashiko could produce a single per-patch-series email
> that would have something similar to this:
>=20
>    Subject: Re: [PATCH v3 00/13] Improve process/maintainers output
>    Reply-to: <some_id>
>=20
>    Hi,
>=20
>    Sashiko robot found the following potencial issues:
>=20
>    Patch 1/13 (<message_id): Success
>    Patch 2/13 (<message_id): Success
>    Patch 3/13 (<message_id): Success
>    Patch 4/13 (<message_id): Success
>    Patch 5/13 (<message_id): Success
>=20
>    Patch 6/13 (<message_id): Warning: https://sashiko.dev/#/patchset/...
>    - [Low] The `self.field_prev` variable is assigned but never used
>    ...
>=20
>    Patch 13/13: Success
>=20
>    Please check if those issues are pertinent.
>=20
>    Sashiko AI review
>=20
> E.g. it would contain success and warning status for each message
> ID inside a patch series. This is also ideal for me as a maintainer,
> as I can clearly see the low/mid/high issues detected by sashiko
> on a single e-mail.
>=20
> Thanks,
> Mauro

