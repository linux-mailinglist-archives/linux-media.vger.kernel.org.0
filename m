Return-Path: <linux-media+bounces-67637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7T/QOSZIV2pFIgEAu9opvQ
	(envelope-from <linux-media+bounces-67637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:43:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135F75BFDA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:43:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HvKWGZlr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67637-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67637-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 880BD3086557
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBD03CE49E;
	Wed, 15 Jul 2026 08:40:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4A362130
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 08:40:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104818; cv=none; b=CeY8EMX8JGkFO04FnvRNo4Fe9ejndYaL9yUQ+BeaE2qZKGUIRzjZkQONh0qyhyfMa+AJifmZ9wH6SfebLQI65iUMyOQk5tkNfY6J4VEizKNhGlB2IEZZDHnbAhGWISZceOtU6J1YOoECHp6Lpm9g3fSJ5B+tN0IaNJYPWolD6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104818; c=relaxed/simple;
	bh=04alqDAZRlvdzVoCbgR5tQxu79n3jUpnPSCtyAmZfp4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zq0xrKqT+Lnj0H9N9lEQbol2ZdjVgpf5DQFrG/ocMGHwBlfyOiB4/bonIYMF88/Js4nEoEzmV/3wZmScCcJKl8D0sgKaE3TeKmXieIlrer+hQqKbHhMSLxj0DQB0nlRljLg8ynAcq4istQYH6xrjf8h5al+zUNz/J8dUcIXW28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvKWGZlr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00961F000E9;
	Wed, 15 Jul 2026 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784104816;
	bh=nlO11ynP+LYmmr68oxPYsKPXdknBw8947JPyILhhTT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HvKWGZlrnk1DmbvlvbYc3wmkzPyeamogf39TQ/8zcl8l/yLneSdQQaQe2ieoz566d
	 aeudr5rEt458N83inl4cykwq8E9lBDF0a4kybkvcMUX6bjQF7JJHmgzHSbF8LPjSOB
	 Vu1/Ow890HSX0RbLjDYWHA2NjXkf5+l3f/8p5lf/5ZFI2FH8WJQz19c7ByKAizFcUd
	 q5uSAYCScli/L81ZqjgoYUaHTElFzPLOAPlrFy8Q/dgeccPY7JkaVx28vQYEJB68HI
	 lWH8PWFQHPU578WrVbWBi2N4F68YLhyPuWWJ7CGS2UUb+tbTugxtsJdmcgVIIzSsJZ
	 n65BiO7roDXSw==
Date: Wed, 15 Jul 2026 10:40:12 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Derek Barbosa <debarbos@redhat.com>,
 Matthieu Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Subject: Re: Linking Patchwork with Sashiko?
Message-ID: <20260715104012.7fd5c23a@foz.lan>
In-Reply-To: <alc3gAJfAkG5DULJ@zed>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	<4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	<alc3gAJfAkG5DULJ@zed>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:roman.gushchin@linux.dev,m:laurent.pinchart@ideasonboard.com,m:debarbos@redhat.com,m:matttbe@kernel.org,m:konstantin@linuxfoundation.org,m:jgg@ziepe.ca,m:rostedt@goodmis.org,m:users@kernel.org,m:linux-media@vger.kernel.org,m:stephenfin@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67637-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4135F75BFDA

On Wed, 15 Jul 2026 09:59:57 +0200
Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:

> Hi Roman
>=20
> On Tue, Jul 14, 2026 at 07:00:54PM -0700, Roman Gushchin wrote:
> > > On Jul 14, 2026, at 5:59=E2=80=AFPM, Laurent Pinchart <laurent.pincha=
rt@ideasonboard.com> wrote:
> > >
> > > =EF=BB=BFOn Tue, Jul 14, 2026 at 10:55:42PM +0000, Roman Gushchin wro=
te: =20
> > >> Mauro Carvalho Chehab writes: =20
> > >>>> On Mon, 13 Jul 2026 12:41:20 +0300 Laurent Pinchart wrote: =20
> > >>>>>>> Individuals can set their
> > >>>>>>> spam filters up if they don't want to get these emails, I can't=
 control
> > >>>>>>> it. Providing individual authors an option "I don't want my pat=
ches
> > >>>>>>> to be reviewed" sound strange to me. It's like "I don't want my=
 patches
> > >>>>>>> to be tested by unit tests". =20
> > >>>>>>
> > >>>>>> I agree with you, and, on my head, not sending e-mails to the au=
thor
> > >>>>>> is a clear violation to one of the most basic net etiquette rule=
 on
> > >>>>>> mailing lists: any replies to posts there should reach the autho=
r. =20
> > >>>>>
> > >>>>> I don't know where that one comes from.
> > >>>>>
> > >>>>> What happened to this other "most basic rule" that subscription to
> > >>>>> services that deliver e-mails should be opt-in ? =20
> > >>>
> > >>> Replying to an e-mail is not subscribing to a service. It is the
> > >>> author's right to know if one replies publicly to his e-mails.
> > >>> Explicitly removing him from the C/C of such replies is a violation
> > >>> of his rights.
> > >>>
> > >>> On other words, it is implicit that, if you post an e-mail, you'll =
be
> > >>> expecting actions or answers to it.
> > >>>
> > >>> Now, if one really doesn't really want to receive e-mails from a
> > >>> particular sender, a block list solves it. Alternatively, a way to
> > >>> opt-out is welcomed.
> > >>>
> > >>> See, this is different than adding someone to a mailing list without
> > >>> his consent: On such case, people receive e-mails unrelated to their
> > >>> preferences. For those, opt-in is the right net etiquette. =20
> > >>
> > >> I agree with this.
> > >>
> > >> But also just practically: if someone who opted out from sashiko ema=
ils
> > >> posts a patch and sashiko finds say a critical issue, do we expect t=
he
> > >> maintainer to go and manually check each time whether the author opt=
ed
> > >> out and forward the review? =20
> > >
> > > I expect maintainers who want to act on sashiko reviews to triage and
> > > verify them first before bothering authors, yes. I believe we should
> > > follow the first two recommendations of the Software Freedom Conserva=
ncy
> > > on using LLM-backed generative AI systems for FOSS contributions ([1]=
).
> > >
> > > [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-rec=
ommendations.html =20
> >
> > I think it makes the point of sashiko - helping maintainers - unachieva=
ble. If the point to not use
> > LLMs in general, let=E2=80=99s discuss this, not how to make each use c=
ase more complex.
> > =20
>=20
> Having been in the discussion within the media group, let me try to
> re-express here the point I made within that circle already.
>=20
> The decision to not send Sashiko replies to developers but rather have
> them sent to a different mailing list, has been suggested because,
> after a brief interim period where Sashiko reviews has been sent to
> the main mailing list, it has caused more load for maintainers, not
> less.

At the beginning, any new process generate more load for=20
maintainers. The question yet to be answered is how this will
affect our workflow in long term.

> Far-fetched review comments, very convincing word salads mixed with
> valuable findings have often been escalated by authors to maintainers
> to have them distil the good from the bad.
>=20
> This might have merits: analyzing 3 false reports to find a bug is
> still worth it, but has so far caused more load for maintainers and
> reviewers, not less. Considering reviewers are the most scarce
> resource we have, analyzing Sashiko reports has been made an opt-in
> feature by sending its review to a dedicated mailing list where
> maintainers can (optionally) decide if something's worth acting upon.

I'm pretty sure we'll need custom prompts to better adjust reviews,
and maybe even adjusting temperature parameters. Media is a complex=20
subsystem which deals with a wide range of hardware, several of them
with their own specialized processor units (ISPs) and ASICs.

Any no non-specialized static analyzer tools may report more false
positives on such scenario. Yet, we need authors and maintainers
feedback to adjust such media-specific LLM prompts.

The long term goal should be clear. We expect that, with Sashiko:

- patch quality will be improved after using Sashiko's reviews;
- maintainer's overhead will be reduced, as they won't need to
  restate issues already exposed by CI. They'll only start=20
  reviewing once the patches are on a better shape.

If, after using it and customizing its prompts, it turns that the
patch quality decreases or that the maintainers overhead become
too high with very little benefit, then we should review the decision
of using it.=20

Not before.

On my personal experience with Sashiko and other LLM-based review
tools, they're very good to check error paths. By using it, we can
avoid receiving extra patches later on to fix things that could
already be solved at the original commit.=20

=46rom my experience as maintainer, sometimes it takes years until
someone send us patches fixing error check conditions.

Just take for instance a random fix patch send on May, 22:
	06cb687a5132 ("media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_as=
ync_register_subdev_sensor()")

It fixed a patch wrote in 2017:
	Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for r=
egistering sensors")

It would be great if, on that time, we had a tool that would be
able to identify such problem and not needing to take ~10 years=20
to have it fixed.

> This would also give some buffer time to evaluate Sashiko and maybe
> reconsider later on.
>=20
> > It seems like [1]  expresses a very anti-LLM position in general, which=
 I can understand and I agree
> > with some of concerns. But I think it=E2=80=99s up to project leaders t=
o decide if Linux in general  takes this
> > position and my take so far is that the answer is not.
> > =20
>=20
> All discussions around AI inevitably ends being about principles and
> good vs bad. I'm surprised Linus and Ted had to weight in to re-state
> the "we're not against AI!" principle while I would like to discuss
> signal-to-noise metrics instead.
>=20
> Maybe you have number I've not seen yet.
>=20
> Thanks
>    j
>=20
> > Thanks =20



Thanks,
Mauro

