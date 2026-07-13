Return-Path: <linux-media+bounces-67432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q2n8OgmaVGqHoAMAu9opvQ
	(envelope-from <linux-media+bounces-67432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:55:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4AC7486BE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m6K9D4EZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67432-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67432-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66842301B4D7
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60539397B09;
	Mon, 13 Jul 2026 07:55:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37D3033FD
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 07:55:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929344; cv=none; b=BGYUiogRdE/WHKU4KAq/uybfbyLdqo2cCR+dSYptzdXlkMeybth6uNOjmbPUdfGY0usJKAoMrFpgqx06WwBZhi5cAD4HxgnCjBiXUAMq8EIxgqrBj6JrWUEgdbMvPrvu+Ul9+TG4FCwYCWh5g6Kvni0NXJA53WFPQoBiyM/XUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929344; c=relaxed/simple;
	bh=pW24w9t37CqWdRB80vlqwoOe3HY/tbzSkziFN988rkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDTbgZhW9fMzcHhIIYgzt8kPEAt1VUkrwCGcbGCpCEwipFaOqTyoU2AGC65nwHMFHdVlzzpGlEd4Co4nHIcAkoP8jFdqDHWfXVrB3hcrca0lVf6PwLhXxwb8AXDefo6XpPSX39hzK4S4qoSQboFqHdqtIXBVBaKHFm74z+tZDyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6K9D4EZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2987A1F000E9;
	Mon, 13 Jul 2026 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783929343;
	bh=OD5wqg/gaJ4wAJRbJHHX8N7GBf/+2MJoFhCRwUxPRD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m6K9D4EZELpuXiyk836qcHMHaLlN83fTOCYkW7uAdiuPxmCkSWd9qWlXyxB9PSChj
	 XSHSt1jqfmDj70fD+DzH3GQ/uFB1///o7QyZNHuvE2TXKNm7JftvIGmm0h6IDAbQFX
	 FlgJ7tvC3LI6o/Ja0kIYrY0EkebKc662N0l0Cc2GoHRIz1yv67gNA1R9mRPYMr+apM
	 DoW7MV57V0+wSque8mk/Tq1ZmhkvsA5DvqUGB+J1UYP1n+F9EYhHER557VyCWxUvaQ
	 lT0kpBf0YodChuBVbkt/by40yTD0xPupn7QE7CDEcZRefvZMit2gqqxlTZZWvxZhZS
	 8WRyIUYs9rIGA==
Date: Mon, 13 Jul 2026 09:55:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts
 <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260713095538.3d5e86f1@foz.lan>
In-Reply-To: <87wlv2jq4t.fsf@linux.dev>
References: <7E971C76-0568-43EF-9EE7-C8DB78C45CA1@linux.dev>
	<20260530200017.0fe7f685@foz.lan>
	<20260530204945.22ac92c6@foz.lan>
	<20260530205351.19847fc8@foz.lan>
	<ah7dpsLKd0Jf1Ir0@debarbos-thinkpadt14gen5.rmtusma.csb>
	<7ia4tsrkn1k4.fsf@castle.c.googlers.com>
	<20260602223936.27def657@foz.lan>
	<b9f7ca3a-fa72-4a8e-94bd-9991a0882f10@kernel.org>
	<20260604085201.177ad537@foz.lan>
	<20260607195656.02788791@foz.lan>
	<akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
	<20260710074528.5a6e4457@foz.lan>
	<20260710083845.23c753ca@foz.lan>
	<87wlv2jq4t.fsf@linux.dev>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:roman.gushchin@linux.dev,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67432-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,linuxtv.org:url,linuxtv.org:email,i.mx:url,foz.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B4AC7486BE

On Fri, 10 Jul 2026 18:01:38 -0700
Roman Gushchin <roman.gushchin@linux.dev> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> > Hi Derek/Roman,
> >
> > On Fri, 10 Jul 2026 07:45:28 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > =20
> >> Hi Derek,
> >>=20
> >> On Tue, 30 Jun 2026 16:32:30 -0400
> >> Derek Barbosa <debarbos@redhat.com> wrote:
> >>  =20
> >> > On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrot=
e:   =20
> >> > > Added both global and per-project permissions to add CI checks:
> >> > >=20
> >> > > 	https://github.com/getpatchwork/patchwork/pull/653
> >> > >=20
> >> > > Tested on a docker container created on the top of current
> >> > > upstream, with the database imported from linuxtv.org and
> >> > > migrated to the new permissions model.     =20
> >> >=20
> >> > Hi Mauro,
> >> >=20
> >> > Patchwork integration has been cleaned up and the original issues fi=
led against
> >> > the Sashiko project have been resolved.
> >> >=20
> >> > Any progress on your work for the permissions modifications (or enab=
ling it for
> >> > media)?   =20
> >>=20
> >> I'd like to have the permission modification changes applied at
> >> Patchwork upstream before applying it to linux-media instance, as
> >> this will require a DB change, which can make it harder in the future
> >> to update linux-media patchwork instance, especially if upstream ends
> >> with some changes over my proposed patch.
> >>=20
> >> So, while patchwork doesn't have a separated permission for checks
> >> addition, we'll keep using my tool to update bots feedback from
> >> e-mails. To prevent too much noise at linux-media, we have now a
> >>=20
> >> 	media-ci@linuxtv.org
> >>=20
> >> mailing list that is meant to receive all bots feedback. The
> >> e-mail parser is listening to it as well. =20
> >
> > Btw, we did an inquire among the participants of the latest media
> > summit, where we discussed Sashiko.
> >
> > There is a consensus of receiving Sashiko feedback at=20
> > media-ci@linuxtv.org, where people can opt-in/opt-out.
> >
> > With regards to c/c authors, there was a proposal to add a custom=20
> > disclaimer's notice on each patch. Also, several people manifested
> > that it should be possible for authors to opt-out receiving Sashiko's
> > e-mails. =20
>=20
> Sorry, I'm not sure how it's supposed to work (opt-in/opt-out).
> My take is that Sashiko (the sashiko.dev instance, not private/corp
> instances) is a tool for maintainers, not individual authors.

IMO, sashiko.dev could have an e-mail interface to enable/disable
delivers to authors on a similar way to what mailman does. For instance,=20
if an author replies to be "unsubscribed" (or access some web interface),
a confirm e-mail with an unique token ID would be sent to his e-mail.
After replying to it, the author would be blacklisted on e-mail
delivery.

This is for authors only.

> I rely on corresponding maintainers decision on whether emails are
> sent to the corresponding mailing list.=20

Mailing lists is a different case: the decision should be taken by
maintainers. Only maintainers can change that.

> Individuals can set their
> spam filters up if they don't want to get these emails, I can't control
> it. Providing individual authors an option "I don't want my patches
> to be reviewed" sound strange to me. It's like "I don't want my patches
> to be tested by unit tests".

I agree with you, and, on my head, not sending e-mails to the author
is a clear violation to one of the most basic net etiquette rule on
mailing lists: any replies to posts there should reach the author.

Unfortunately, some people have too strong opinions against LLM,
and don't even want to setup filters related to it.

> > So, at least with the current way, we were unable to reach a
> > consensus (or a large majority) about c/c the author. =20
>=20
> You can start with cc mailing list only or a set of enthusiasts.

Yes.

>=20
> > So, what it is a consensus is to receive Sashiko's email via
> > media-ci@linuxtv.org, evaluating its feedback results for a couple=20
> > of kernel releases. IMO, it is better to receive there also e-mails
> > if Sashiko didn't find any issue. =20
>=20
> There is such an option, we can enable it.
> Should I move on and enable reviews to be sent to media-ci@linuxtv.org?

Yes, please. This way, media developers interested on receiving Sashiko
reviews may get access to it. It will also feed media patchwork instance
at:
	https://patchwork.linuxtv.org/project/linux-media/list/

> > One interesting feedback was related to a review from i.MX DTS and DMAE=
ngine=20
> > I3C patch series.
> >
> > I guess it could be the start of a custom linux-media prompt.
> >
> > The original suggestion is:
> >
> > 	"I suggested add some actionable advice.  The below action when I hand=
le
> > 	i.MX DTS and DMAEngine\I3C sashakio review feedback. =20
> >
> > 	- "Pre existing issue" \ "not introduce by this patch", can omit this =
feedback,
> > 	But encourage fix at following patch
> > 	- "UAF" or lock issue,  most like is true issue, strongly suggest fix =
it. Maintainer
> > 	Most likely double check this type issue.
> > 	- Small issue like "typo" or "indention",  please fix before maintaine=
r involve
> > 	Review.=20
> > 	- other identify severity is HIGH issue, suggest reply sashiko email a=
nd provide
> > 	Your judgement when close to land." =20
>=20
> Re disclaimers and addition instructions in emails - we can discuss it,
> but my personal preference would be to keep the minimal - after getting
> like 10 emails from Sashiko it will feel like legal disclaimers written
> in small font - something that nobody reads and it just wastes the
> screen space. So maybe we can put these subsystem-specific rules
> somewhere and just provide a link in every email? Just an idea.

Disclaimers on e-mails are, IMO, important to new contributors. You're
right that experienced developers will ignore it, but having a simple
disclaimer's notice informing that bot reviews may make mistakes and
that, in case of doubt one must consult an experienced developer is a
good thing. We had some discussions on media to have a prompt similar
to this:

    This is an LLM-generated review that can be prone to hallucinations.
    It is fine to ignore this review.
    When in doubt about some of the findings, please consult
    an experienced developer.

I even tried wrote some code adding it at:
	https://github.com/mchehab/sashiko/commit/5e3ec00772e9bc7a9e7d90993674d822=
a7bc200f
	https://github.com/mchehab/sashiko/commit/eff8622fe2828efc56cd38037cb837d2=
8ebd3914

they are on this branch:
	https://github.com/mchehab/sashiko/tree/linux-media

but this was before the discussions with regards to c/c authors.
Also, please notice that I never wrote Rust code before, so the
rust patch is likely not perfect: it is compile-tested only.

>=20
> > There was also a discussion about a magic number inside a loop:
> >
> > 	for (unsigned int i =3D 0; i < 56; i++) {
> >
> > (on such loop, "i" was used to access an array)
> >
> > Sashiko didn't pick this one on one of his reviews. =20
>=20
> This is a good candidate for some generic prompt, not subsystem-specific.

Agreed.

>=20
> >
> >
> > I guess we can start with a custom RAC prompt to make Sashiko
> > classify its output according with a criteria similar to the
> > above.
> >
> > E.g. maybe linux-media may start with a custom prompt similar to this
> > (as part of a more complete RAC):
> >
> > 	### Classification categories and actions
> >
> > 	1. **Pre=E2=80=91existing issues** - a bug or flaw that already exists=
 in the current code and is *not introduced by this patch*. =20
> > 	   - **Action**: Place at the end, under "Further suggestions". Note t=
hat the issue could be addressed on a separate patch =20
> > 	   - Mark as: `classification: PRE_EXISTING`, `action: DEFER_FOLLOWUP`.
> >
> > 	2. **UAF / Lock issues** - use=E2=80=91after=E2=80=91free, race condit=
ion, missing lock, double unlock, deadlock, incorrect refcounting, etc. =20
> > 	   - **Action**: This is almost certainly a true bug. Encourage the au=
thor to check or consult an expert if in doubt.
> > 	   - Mark as: `classification: CRITICAL_LOCKING_UAF`, `action: MUST_FI=
X`.
> >
> > 	3. **Small issues** - typo, indentation, coding=E2=80=91style, whitesp=
ace, missing blank line, comment grammar, overly long line, etc. =20
> > 	   - **Action**: These should be corrected before the maintainer becom=
es involved in the review. =20
> > 	   - Mark as: `classification: STYLE_TYPO`, `action: FIX_BEFORE_MAINTA=
INER`.
> >
> > 	4. **Magic numbers** - when a numeric literal (like `56`, `128`) is us=
ed without a defined constant or obvious connection to an array size.=20
> > 	   - **Action**: These should be corrected before the maintainer becom=
es involved in the review. =20
> > 	   - Mark as: `classification: MAGIC_NUMBER`, `action: FIX_BEFORE_MAIN=
TAINER`.
> >
> > 	5. **Other HIGH severity issues** =E2=80=93 any problem that is clearl=
y a functional bug (logic error, NULL deref, buffer overflow, API misuse, i=
ncorrect error handling, memory leak, etc.) that does not fall into categor=
y 2. =20
> > 	   - **Action**: the authors should provide their own judgment on the =
issue (e.g., explain why it is a false positive, or confirm the fix). =20
> > 	   - Mark as: `classification: HIGH_OTHER`, `action: REPLY_WITH_JUDGME=
NT_NEAR_LANDING`.
> >
> > 	6. **Low severity / Informational** =E2=80=93 anything that does not f=
it the above (e.g., suggestion, minor question, potential improvement that =
is not a bug). =20
> > 	   - **Action**: Optional; can be addressed at author=E2=80=99s discre=
tion. =20
> > 	   - Mark as: `classification: LOW_INFO`, `action: OPTIONAL`.
> >
> > Please notice that we're not a prompt experts - nor, afaikt, any media
> > developer tested running Sashiko locally themselves - so you probably c=
an
> > come up with a better custom prompt than us. =20
>=20
> I'll take a look, thanks!

Thank you!

Btw, it occurred to me that we could also pick some things from Media Subsy=
stem=20
profile as well, from its addendum:
	https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html#sub=
mit-checklist-addendum

like adding a feedback that new drivers need to pass at the compliance
tools if the patch series is adding new drivers.

Thanks,
Mauro

