Return-Path: <linux-media+bounces-67230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQKgCp6TUGp71wIAu9opvQ
	(envelope-from <linux-media+bounces-67230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:39:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC3737C19
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DIljIyQQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67230-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67230-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FCDA30078A9
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 06:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5383B14BF;
	Fri, 10 Jul 2026 06:39:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0689B2641FC
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:39:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665546; cv=none; b=HGQEMj4tD4XUfSuubeqHlIRYEVWKBRTZPS9n9BMFpF3pMObWXFa5Jn3oD2YA4TXp3HkRYZgszn5oia99fQb3kSKlF1DYOpCqobPmM5kkvOpMNYWt563GaI3kzqOo3SDC29bawity8lRLTS9GfMRcjexaM9nNpc41KxnUGOlD/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665546; c=relaxed/simple;
	bh=e8SDB/Bo194r4JCaA3OLOqJ5XndsslpWaSVIn1NjmXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oiw7eI4EGq2eKHXSlvzc9OPq31yggkx20vZuyMRzIJRYZH8tZNMbNU/o8HkfQ2hb56/ZNXgjWYgF4RbhdYHJK0X4ZUvBxbyeYsWmYLBqKyK4zat9kFZYLGI35MXsUIZDPMTixYkBNYa5ihqDNe4t1Ns8aEWVAcAKoV4WMaays4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIljIyQQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09A11F000E9;
	Fri, 10 Jul 2026 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783665544;
	bh=1n2nq7IYE3jZVByFqRTbu6zMGUNPhgx47iDdiYvA1No=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DIljIyQQ3WgDEgMeGolZyleIqNopWUN7GaAiFfZX9leBn7ILKKBj9Fijr/AATf9ko
	 5Se77GKAFjUMgZh5w4TtzOH/SAMQRBnRMCMvIgMdMKtzUlrP5F1yW68YG07vS3y9Rs
	 G8n+lpifTA3Tyeg6REZwi0S4r+84rRjdEE1nBQtHjqcc7wcfqcECGPuNEy7JeoYzMn
	 uXRCCKE7iV+TsgHaR7BMZLszr56fj0SntE3pWcs1pXi03RYyopzMQZsYvTvO1bDaCF
	 9aW6xErmr6BJZVL6G6KKJCMQbX+Nhw/39jUlm+3bRN4YhcEeOU6/jwpxe1AEs2VJtp
	 H0XLPjkQJmQWA==
Date: Fri, 10 Jul 2026 08:39:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Derek Barbosa <debarbos@redhat.com>, Roman Gushchin
 <roman.gushchin@linux.dev>
Cc: Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260710083845.23c753ca@foz.lan>
In-Reply-To: <20260710074528.5a6e4457@foz.lan>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:debarbos@redhat.com,m:roman.gushchin@linux.dev,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67230-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url,linuxtv.org:email,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CFC3737C19

Hi Derek/Roman,

On Fri, 10 Jul 2026 07:45:28 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Derek,
>=20
> On Tue, 30 Jun 2026 16:32:30 -0400
> Derek Barbosa <debarbos@redhat.com> wrote:
>=20
> > On Sun, Jun 07, 2026 at 07:56:56PM +0200, Mauro Carvalho Chehab wrote: =
=20
> > > Added both global and per-project permissions to add CI checks:
> > >=20
> > > 	https://github.com/getpatchwork/patchwork/pull/653
> > >=20
> > > Tested on a docker container created on the top of current
> > > upstream, with the database imported from linuxtv.org and
> > > migrated to the new permissions model.   =20
> >=20
> > Hi Mauro,
> >=20
> > Patchwork integration has been cleaned up and the original issues filed=
 against
> > the Sashiko project have been resolved.
> >=20
> > Any progress on your work for the permissions modifications (or enablin=
g it for
> > media)? =20
>=20
> I'd like to have the permission modification changes applied at
> Patchwork upstream before applying it to linux-media instance, as
> this will require a DB change, which can make it harder in the future
> to update linux-media patchwork instance, especially if upstream ends
> with some changes over my proposed patch.
>=20
> So, while patchwork doesn't have a separated permission for checks
> addition, we'll keep using my tool to update bots feedback from
> e-mails. To prevent too much noise at linux-media, we have now a
>=20
> 	media-ci@linuxtv.org
>=20
> mailing list that is meant to receive all bots feedback. The
> e-mail parser is listening to it as well.

Btw, we did an inquire among the participants of the latest media
summit, where we discussed Sashiko.

There is a consensus of receiving Sashiko feedback at=20
media-ci@linuxtv.org, where people can opt-in/opt-out.

With regards to c/c authors, there was a proposal to add a custom=20
disclaimer's notice on each patch. Also, several people manifested
that it should be possible for authors to opt-out receiving Sashiko's
e-mails.

So, at least with the current way, we were unable to reach a
consensus (or a large majority) about c/c the author.

So, what it is a consensus is to receive Sashiko's email via
media-ci@linuxtv.org, evaluating its feedback results for a couple=20
of kernel releases. IMO, it is better to receive there also e-mails
if Sashiko didn't find any issue.

One interesting feedback was related to a review from i.MX DTS and DMAEngin=
e=20
I3C patch series.

I guess it could be the start of a custom linux-media prompt.

The original suggestion is:

	"I suggested add some actionable advice.  The below action when I handle
	i.MX DTS and DMAEngine\I3C sashakio review feedback. =20

	- "Pre existing issue" \ "not introduce by this patch", can omit this feed=
back,
	But encourage fix at following patch
	- "UAF" or lock issue,  most like is true issue, strongly suggest fix it. =
Maintainer
	Most likely double check this type issue.
	- Small issue like "typo" or "indention",  please fix before maintainer in=
volve
	Review.=20
	- other identify severity is HIGH issue, suggest reply sashiko email and p=
rovide
	Your judgement when close to land."

There was also a discussion about a magic number inside a loop:

	for (unsigned int i =3D 0; i < 56; i++) {

(on such loop, "i" was used to access an array)

Sashiko didn't pick this one on one of his reviews.


I guess we can start with a custom RAC prompt to make Sashiko
classify its output according with a criteria similar to the
above.

E.g. maybe linux-media may start with a custom prompt similar to this
(as part of a more complete RAC):

	### Classification categories and actions

	1. **Pre=E2=80=91existing issues** - a bug or flaw that already exists in =
the current code and is *not introduced by this patch*. =20
	   - **Action**: Place at the end, under "Further suggestions". Note that =
the issue could be addressed on a separate patch =20
	   - Mark as: `classification: PRE_EXISTING`, `action: DEFER_FOLLOWUP`.

	2. **UAF / Lock issues** - use=E2=80=91after=E2=80=91free, race condition,=
 missing lock, double unlock, deadlock, incorrect refcounting, etc. =20
	   - **Action**: This is almost certainly a true bug. Encourage the author=
 to check or consult an expert if in doubt.
	   - Mark as: `classification: CRITICAL_LOCKING_UAF`, `action: MUST_FIX`.

	3. **Small issues** - typo, indentation, coding=E2=80=91style, whitespace,=
 missing blank line, comment grammar, overly long line, etc. =20
	   - **Action**: These should be corrected before the maintainer becomes i=
nvolved in the review. =20
	   - Mark as: `classification: STYLE_TYPO`, `action: FIX_BEFORE_MAINTAINER=
`.

	4. **Magic numbers** - when a numeric literal (like `56`, `128`) is used w=
ithout a defined constant or obvious connection to an array size.=20
	   - **Action**: These should be corrected before the maintainer becomes i=
nvolved in the review. =20
	   - Mark as: `classification: MAGIC_NUMBER`, `action: FIX_BEFORE_MAINTAIN=
ER`.

	5. **Other HIGH severity issues** =E2=80=93 any problem that is clearly a =
functional bug (logic error, NULL deref, buffer overflow, API misuse, incor=
rect error handling, memory leak, etc.) that does not fall into category 2.=
 =20
	   - **Action**: the authors should provide their own judgment on the issu=
e (e.g., explain why it is a false positive, or confirm the fix). =20
	   - Mark as: `classification: HIGH_OTHER`, `action: REPLY_WITH_JUDGMENT_N=
EAR_LANDING`.

	6. **Low severity / Informational** =E2=80=93 anything that does not fit t=
he above (e.g., suggestion, minor question, potential improvement that is n=
ot a bug). =20
	   - **Action**: Optional; can be addressed at author=E2=80=99s discretion=
. =20
	   - Mark as: `classification: LOW_INFO`, `action: OPTIONAL`.

Please notice that we're not a prompt experts - nor, afaikt, any media
developer tested running Sashiko locally themselves - so you probably can
come up with a better custom prompt than us.

Thanks,
Mauro

