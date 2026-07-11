Return-Path: <linux-media+bounces-67335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NdwEMhOWUWrzGQMAu9opvQ
	(envelope-from <linux-media+bounces-67335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 03:02:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05A73FE5E
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 03:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=RZWj00Bd;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67335-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67335-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE2930210D6
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 01:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18781BD9D0;
	Sat, 11 Jul 2026 01:02:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFEA35893
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 01:01:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783731721; cv=none; b=o6dmtnyb0B0LWtlWWF7K4VUzgAVoxTZMnekuWad1ynICHmS0VIBnH9qJM9aFGQ+Z+drNbvyNvfjUqlk/wxvxObpfQlZnTKNDzb4tQI8FakUlDUmTM7x6c2O0mtiF0+qd1Eb+nGAp+Gq32WYdxolbgfYLecLML1vsWmY1OS6Z6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783731721; c=relaxed/simple;
	bh=uWRm6BN3f3I9abq1UlnZG2afuIgAoH/b/alYsDsCWHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LC5RMUjCnVs19OmEKuMJZWW7DuCUm7nTPA2ocHIkKgeBJkYnIqoBdBuCOnUULpScahraAB429/MfleXGetX7L62pNfIdIP+zhEOgiqwNCHPqsC/1tfTjM7bzJ0cA/3YEC/P1u0pAJssilqVIUd+ETxCL7EaZLvX0xugLQRi6e/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RZWj00Bd; arc=none smtp.client-ip=91.218.175.174
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783731713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZCBMsxDFLY+JWJBokM7VsOaa28H/hhBGYpqC1U1eLI=;
	b=RZWj00BdU16k6nmrZSIDqI5YA6Ir6YD787yKihT74c4hyqNj0QenZeDAG1gU8jmcic74Ud
	0cYn+59NHgWe7dKD9HrOL4SlPLWWnKcajS3+S+KFxMZ3dnKc+95wgipd7/3b+fVBLMLkej
	59vy4PMn3Y06G0yyhBhfpclByfK4Y0Q=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Derek Barbosa <debarbos@redhat.com>,  Matthieu Baerts
 <matttbe@kernel.org>,  Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  Jason Gunthorpe <jgg@ziepe.ca>,  Steven
 Rostedt <rostedt@goodmis.org>,  users@kernel.org,  Linux Media Mailing
 List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
In-Reply-To: <20260710083845.23c753ca@foz.lan> (Mauro Carvalho Chehab's
	message of "Fri, 10 Jul 2026 08:39:00 +0200")
References: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan> <20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan> <20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260710074528.5a6e4457@foz.lan> <20260710083845.23c753ca@foz.lan>
Date: Fri, 10 Jul 2026 18:01:38 -0700
Message-ID: <87wlv2jq4t.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67335-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,linuxtv.org:url,linuxtv.org:email,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A05A73FE5E

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Derek/Roman,
>
> On Fri, 10 Jul 2026 07:45:28 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
>> Hi Derek,
>>=20
>> On Tue, 30 Jun 2026 16:32:30 -0400
>> Derek Barbosa <debarbos@redhat.com> wrote:
>>=20
>> > On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrote:=
=20=20
>> > > Added both global and per-project permissions to add CI checks:
>> > >=20
>> > > 	https://github.com/getpatchwork/patchwork/pull/653
>> > >=20
>> > > Tested on a docker container created on the top of current
>> > > upstream, with the database imported from linuxtv.org and
>> > > migrated to the new permissions model.=20=20=20=20
>> >=20
>> > Hi Mauro,
>> >=20
>> > Patchwork integration has been cleaned up and the original issues file=
d against
>> > the Sashiko project have been resolved.
>> >=20
>> > Any progress on your work for the permissions modifications (or enabli=
ng it for
>> > media)?=20=20
>>=20
>> I'd like to have the permission modification changes applied at
>> Patchwork upstream before applying it to linux-media instance, as
>> this will require a DB change, which can make it harder in the future
>> to update linux-media patchwork instance, especially if upstream ends
>> with some changes over my proposed patch.
>>=20
>> So, while patchwork doesn't have a separated permission for checks
>> addition, we'll keep using my tool to update bots feedback from
>> e-mails. To prevent too much noise at linux-media, we have now a
>>=20
>> 	media-ci@linuxtv.org
>>=20
>> mailing list that is meant to receive all bots feedback. The
>> e-mail parser is listening to it as well.
>
> Btw, we did an inquire among the participants of the latest media
> summit, where we discussed Sashiko.
>
> There is a consensus of receiving Sashiko feedback at=20
> media-ci@linuxtv.org, where people can opt-in/opt-out.
>
> With regards to c/c authors, there was a proposal to add a custom=20
> disclaimer's notice on each patch. Also, several people manifested
> that it should be possible for authors to opt-out receiving Sashiko's
> e-mails.

Sorry, I'm not sure how it's supposed to work (opt-in/opt-out).
My take is that Sashiko (the sashiko.dev instance, not private/corp
instances) is a tool for maintainers, not individual authors.
I rely on corresponding maintainers decision on whether emails are
sent to the corresponding mailing list. Individuals can set their
spam filters up if they don't want to get these emails, I can't control
it. Providing individual authors an option "I don't want my patches
to be reviewed" sound strange to me. It's like "I don't want my patches
to be tested by unit tests".

> So, at least with the current way, we were unable to reach a
> consensus (or a large majority) about c/c the author.

You can start with cc mailing list only or a set of enthusiasts.

> So, what it is a consensus is to receive Sashiko's email via
> media-ci@linuxtv.org, evaluating its feedback results for a couple=20
> of kernel releases. IMO, it is better to receive there also e-mails
> if Sashiko didn't find any issue.

There is such an option, we can enable it.
Should I move on and enable reviews to be sent to media-ci@linuxtv.org?

> One interesting feedback was related to a review from i.MX DTS and DMAEng=
ine=20
> I3C patch series.
>
> I guess it could be the start of a custom linux-media prompt.
>
> The original suggestion is:
>
> 	"I suggested add some actionable advice.  The below action when I handle
> 	i.MX DTS and DMAEngine\I3C sashakio review feedback.=20=20
>
> 	- "Pre existing issue" \ "not introduce by this patch", can omit this fe=
edback,
> 	But encourage fix at following patch
> 	- "UAF" or lock issue,  most like is true issue, strongly suggest fix it=
. Maintainer
> 	Most likely double check this type issue.
> 	- Small issue like "typo" or "indention",  please fix before maintainer =
involve
> 	Review.=20
> 	- other identify severity is HIGH issue, suggest reply sashiko email and=
 provide
> 	Your judgement when close to land."

Re disclaimers and addition instructions in emails - we can discuss it,
but my personal preference would be to keep the minimal - after getting
like 10 emails from Sashiko it will feel like legal disclaimers written
in small font - something that nobody reads and it just wastes the
screen space. So maybe we can put these subsystem-specific rules
somewhere and just provide a link in every email? Just an idea.

> There was also a discussion about a magic number inside a loop:
>
> 	for (unsigned int i =3D 0; i < 56; i++) {
>
> (on such loop, "i" was used to access an array)
>
> Sashiko didn't pick this one on one of his reviews.

This is a good candidate for some generic prompt, not subsystem-specific.

>
>
> I guess we can start with a custom RAC prompt to make Sashiko
> classify its output according with a criteria similar to the
> above.
>
> E.g. maybe linux-media may start with a custom prompt similar to this
> (as part of a more complete RAC):
>
> 	### Classification categories and actions
>
> 	1. **Pre=E2=80=91existing issues** - a bug or flaw that already exists i=
n the current code and is *not introduced by this patch*.=20=20
> 	   - **Action**: Place at the end, under "Further suggestions". Note tha=
t the issue could be addressed on a separate patch=20=20
> 	   - Mark as: `classification: PRE_EXISTING`, `action: DEFER_FOLLOWUP`.
>
> 	2. **UAF / Lock issues** - use=E2=80=91after=E2=80=91free, race conditio=
n, missing lock, double unlock, deadlock, incorrect refcounting, etc.=20=20
> 	   - **Action**: This is almost certainly a true bug. Encourage the auth=
or to check or consult an expert if in doubt.
> 	   - Mark as: `classification: CRITICAL_LOCKING_UAF`, `action: MUST_FIX`.
>
> 	3. **Small issues** - typo, indentation, coding=E2=80=91style, whitespac=
e, missing blank line, comment grammar, overly long line, etc.=20=20
> 	   - **Action**: These should be corrected before the maintainer becomes=
 involved in the review.=20=20
> 	   - Mark as: `classification: STYLE_TYPO`, `action: FIX_BEFORE_MAINTAIN=
ER`.
>
> 	4. **Magic numbers** - when a numeric literal (like `56`, `128`) is used=
 without a defined constant or obvious connection to an array size.=20
> 	   - **Action**: These should be corrected before the maintainer becomes=
 involved in the review.=20=20
> 	   - Mark as: `classification: MAGIC_NUMBER`, `action: FIX_BEFORE_MAINTA=
INER`.
>
> 	5. **Other HIGH severity issues** =E2=80=93 any problem that is clearly =
a functional bug (logic error, NULL deref, buffer overflow, API misuse, inc=
orrect error handling, memory leak, etc.) that does not fall into category =
2.=20=20
> 	   - **Action**: the authors should provide their own judgment on the is=
sue (e.g., explain why it is a false positive, or confirm the fix).=20=20
> 	   - Mark as: `classification: HIGH_OTHER`, `action: REPLY_WITH_JUDGMENT=
_NEAR_LANDING`.
>
> 	6. **Low severity / Informational** =E2=80=93 anything that does not fit=
 the above (e.g., suggestion, minor question, potential improvement that is=
 not a bug).=20=20
> 	   - **Action**: Optional; can be addressed at author=E2=80=99s discreti=
on.=20=20
> 	   - Mark as: `classification: LOW_INFO`, `action: OPTIONAL`.
>
> Please notice that we're not a prompt experts - nor, afaikt, any media
> developer tested running Sashiko locally themselves - so you probably can
> come up with a better custom prompt than us.

I'll take a look, thanks!

Thank you!

