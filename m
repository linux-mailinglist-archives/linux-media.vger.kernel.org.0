Return-Path: <linux-media+bounces-58686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOMFL35R3WkFcQkAu9opvQ
	(envelope-from <linux-media+bounces-58686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:26:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7053F314A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2910303B4E4
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99427394792;
	Mon, 13 Apr 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DJWJ85am"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C939479E
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776111965; cv=none; b=Zl9VO26HSEZb2AReaNyaX7zErMPITKVIM8I+IjfZmkprI+CTDeiFw3/1mLuik3SFanofG2ieRVuQ75EIr/te7KZkBto20lzoW6Hi+qz/FDMoAekpwwLOUCgh0bWx19zicPTJe15N7+doauUwJDBdKA3AHLAYrFpHRi+4vvzHgrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776111965; c=relaxed/simple;
	bh=m/27Rrhv4iRq5yk5bfXIanGDJpfJHOHKkG4J7aJz/KA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g7XeZKc5qIZmgc3BKMp5FWdlCrNt2ZNGE1zpESMCVPMqyl06iu4AwjUgIVdjU91vPc3YiTwAftFv9f9wfXzbPGaJk7zwS+9K+k1CuzVRDShEvgHedie+xLjZmV4t2Z8tQjpU0iR088YBq8vT26+L/q5djiIG3vfrmR+yiTR1d6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DJWJ85am; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776111960;
	bh=m/27Rrhv4iRq5yk5bfXIanGDJpfJHOHKkG4J7aJz/KA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DJWJ85amUsRS+gL2Up8pOueAP5feL3CoCPGFO+eTvMfNJgzrKeXcQjjEjktAxUqKS
	 u+85UcBqer2BK5MtkX69SZ5pMe1MMpV5V8HmuByM/CMAGDHktMGHtUDsRR/gdeiVi/
	 KxQK/EHPhNR9kHSKTdcmRH1xKXbwdzHfHBGPMDesVIYikMY8lt36MQZr7WS36RYV7r
	 FNd/aPfnrtqlD0NUhjxTjObs5N9kjCl3qGmkEpx/BtF9i6Pup82fCn2sWq2/LfBXfx
	 sD9qEojDzhE9QA5W0ktvA14FQ/cxLTBW2PSqccX7sU0e0FReD2NgTG4xgLvEgbr3GO
	 puAli8iQv+pVA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB23717E0F33;
	Mon, 13 Apr 2026 22:25:56 +0200 (CEST)
Message-ID: <becd4dc0fe49c9d63fa6b49aab5afb3c4cffa8af.camel@collabora.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Loic Poulain
	 <loic.poulain@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List	
 <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda	 <ribalda@chromium.org>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Niklas =?ISO-8859-1?Q?S=F6derlund?=	
 <niklas.soderlund@ragnatech.se>, Tomi Valkeinen	
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
  Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
 Kieran Bingham	 <kieran.bingham@ideasonboard.com>, Kevin Hilman
 <khilman@baylibre.com>, Paul Kocialkowski <paulk@sys-base.io>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, Hans de Goede	 <hansg@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Brandon Brnich	 <b-brnich@ti.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Sven =?ISO-8859-1?Q?P=FCschel?=	
 <s.pueschel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>,
  Devarsh Thakkar	 <devarsht@ti.com>, Yemike Abhilash Chandra
 <y-abhilashchandra@ti.com>,  Jackson Lee <jackson.lee@chipsnmedia.com>, Jai
 Luthra <jai.luthra@ideasonboard.com>, Mehdi Djait	
 <mehdi.djait@linux.intel.com>, "Padhi, Beleswar" <b-padhi@ti.com>, 
 "Donadkar, Rishikesh"	 <r-donadkar@ti.com>, Rouven Czerwinski
 <rouven.czerwinski@linaro.org>
Date: Mon, 13 Apr 2026 16:25:54 -0400
In-Reply-To: <20260413201907.GD4034@killaraus.ideasonboard.com>
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
	 <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
	 <20260413201907.GD4034@killaraus.ideasonboard.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Pt/jzbaHDPw2f07rMYjz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58686-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C7053F314A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Pt/jzbaHDPw2f07rMYjz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 13 avril 2026 =C3=A0 23:19 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> On Mon, Apr 13, 2026 at 10:03:52PM +0200, Loic Poulain wrote:
> > Hi Hans,
> >=20
> > I would be happy to discuss this if a slot is available:
> >=20
> > Title: Generic V4L2 ISP M2M framework
> > Presenter: Loic Poulain
> > Time estimate: ~20min
> > Description: During early development of a Qualcomm Offline Image
> > Processing Engine (OPE), we relied on the V4L2 memory=E2=80=91to=E2=80=
=91memory
> > (v4l2=E2=80=91m2m) framework, which is widely used and provides solid s=
upport
> > for buffer management and scheduling. However, applying it to an ISP
> > use case exposes limitations: ISP engines often require a richer media
> > graph, with multiple pads and metadata flows, similar to inline ISP
> > pipelines (params, stats, outputs). This talk proposes discussing the
> > need for and design of a common V4L2 ISP M2M framework to factor out
> > shared functionality across drivers, particularly around buffer/queue
> > management and job scheduling.
>=20
> That's well aligned with the v4l2-isp framework that Jacopo started, and
> to the multi-context and media-jobs APIs that we have proposed. I
> wonder, however, if a short session at the media summit will be enough,
> or if we should try to organize a half day brainstorming workshop at
> some point. Depending on when the people interested in this topic plan
> to arrive, Monday could be an option.

I'm also/still interested in the multi-context for m2m decoders that have i=
nline
post-processing capabilities (current model forces us to waste a lot of RAM=
). We
just restarted some design discussion with the team, with an increased
confidence that multi-context is the way. The scheduler could come handy in=
 the
future if we get to deal with more multi-stage codecs in the future. I'll b=
e in
Nice all day Monday.

Nicolas

>=20
> > On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verkuil <hverkuil+cisco@k=
ernel.org>
> > wrote:
> > >=20
> > > (Please pass this on to anyone you think might be interested in this!=
)
> > >=20
> > > Hi all,
> > >=20
> > > This is the fourth version of this announcement, updating the list of
> > > attendees
> > > and the tentative agenda at the end: please let me know if you see
> > > mistakes.
> > > Note that there is still time for one or two other topics. Also pleas=
e
> > > check
> > > the agenda if you need more (or perhaps less) time for your topic.
> > >=20
> > > This year's Media Summit will be held on Tuesday May 26th the day bef=
ore
> > > the
> > > Embedded Recipes Conference in Nice, France:
> > >=20
> > > https://embedded-recipes.org/2026/
> > >=20
> > > The Media Summit will be held at Hotel Campanile and in the same meet=
ing
> > > room
> > > as last year (Nikaia):
> > >=20
> > > https://nice-aeroport.campanile.com/en-us/
> > >=20
> > > It is close to the Airport and to the Embedded Recipes venue.
> > >=20
> > > The meeting room can hold up to 30 people and I will provide video
> > > conferencing support,
> > > just like last year. The location and the meeting room was quite nice=
 last
> > > year, so
> > > I saw no need to change it.
> > >=20
> > > That said, in-person participation is very much preferred. This yearl=
y
> > > summit is meant
> > > for active media developers to meet face-to-face and to discuss media
> > > subsystem issues.
> > >=20
> > > And it is also a good opportunity to talk to each other during the
> > > Embedded Recipes
> > > conference to discuss topics in a smaller group. But if you are an ac=
tive
> > > media developer
> > > and are really not able to attend in person, then remote participatio=
n is
> > > an option.
> > >=20
> > > If you want to attend the meeting (either in person or remote), then =
send
> > > an email to me
> > > directly. The deadline for in-person attendance is May 14 as the hote=
l
> > > needs to know the
> > > final number of attendees by then.
> > >=20
> > > There is no registration fee, the meeting room is sponsored by Cisco =
and
> > > Collabora, and
> > > the lunch is sponsored by Ideas on Board! Many thanks to our sponsors=
,
> > > it's very much
> > > appreciated.
> > >=20
> > > If you have a topic that you want to discuss, just 'Reply All' to thi=
s
> > > announcement
> > > and give the topic title, a short description and a guesstimate of th=
e
> > > time you need
> > > for your topic.
> > >=20
> > > See last year's Media Summit Report as an example of what to expect:
> > >=20
> > > https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad0892=
98d@jjverkuil.nl/
> > >=20
> > > Regards,
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
> > >=20
> > > PS: Be aware that May 24 and 25 are public holidays in France. So man=
y
> > > shops may be
> > > closed those days.
> > >=20
> > > In-person attendees:
> > > Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > Brandon Brnich <b-brnich@ti.com>
> > > Rouven Czerwinski <rouven.czerwinski@linaro.org>
> > > Mehdi Djait <mehdi.djait@linux.intel.com>
> > > Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Marco Felsch <m.felsch@pengutronix.de>
> > > Paul Kocialkowski <paulk@sys-base.io>
> > > Jai Luthra <jai.luthra@ideasonboard.com>
> > > Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > > Beleswar Padhi <b-padhi@ti.com>
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > > Ricardo Ribalda <ribalda@chromium.org>
> > > Michael Riesch <michael.riesch@collabora.com>
> > > Devarsh Thakkar <devarsht@ti.com>
> > > Michael Tretter <m.tretter@pengutronix.de>
> > > Hans Verkuil <hverkuil@kernel.org>
> > >=20
> > > Remote attendees:
> > > Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > Rishikesh Donadkar <r-donadkar@ti.com>
> > > Jackson Lee <jackson.lee@chipsnmedia.com>
> > > Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
> > >=20
> > >=20
> > > Agenda (tentative):
> > >=20
> > > 8:45-9:20: Arrive, settle in
> > >=20
> > > 9:20-9:30: Short intro (Hans Verkuil)
> > >=20
> > > 9:30-9:45: Status of ISP support in V4L2
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Laurent Pinchar=
t
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: Summary of IS=
P-related development in V4L2 since the
> > > last
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux Media Summit. This i=
ncludes a brief overview of technical
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 developments, and a summar=
y of the efforts to engage with vendors.
> > >=20
> > > 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Paul Kocialkows=
ki
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: An update on =
the ongonig work to support stateless
> > > codecs in V4L2.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some of the remaining open=
 topics will be presented and discussed.
> > >=20
> > > 10:45-11:00: break
> > >=20
> > > 11:00-11:30: Vulkan Video Codecs
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Nicolas Dufresn=
e
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: Vulkan video =
codecs: what are the viable options for
> > > Linux Media
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and what is in preparation=
 outside of our subsystem. The second
> > > aspect is
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 informative as these discu=
ssions don't seem to lean toward our
> > > subsystem as the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 foundation. But I think it=
's rather useful for everyone to
> > > understand why and
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 what is included.
> > >=20
> > > 11:30-12:00: Protected Video playback on i.MX8MQ
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Rouven Czerwins=
ki
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: Introduction =
to protected video playback
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on i.MX8MQ and missing bit=
s for linux-media & protected heap
> > > interoperability.
> > >=20
> > > 12:00-13:30: Lunch
> > >=20
> > > 13:30-14:00: HDCP support for HDMI receivers
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Hans Verkuil
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: I have been w=
orking on adding HDCP support for HDMI
> > > receivers.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifically the HDCP nego=
tiation between sources and sinks.
> > >=20
> > > 14:00-14:30: AI patches
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Sakari Ailus
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: What is our p=
olicy w.r.t. AI generated patches?
> > >=20
> > > 14:30-15:00 Overview of Media CI: where do pipelines run?
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Ricardo Ribalda
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: How are jobs =
in pipelines assigned? How does the
> > > infrastructure
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for Media CI work? Are the=
re things that can be tweaked to make it
> > > more
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reliable?
> > >=20
> > > 15:00-15:15: Break
> > >=20
> > > 15:15-16:15: Discussion of the media subsystem development process
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Presenter: Hans Verkuil
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description: Review of the=
 multi-committer model: current status
> > > and next steps.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Are there any bottlenecks,=
 any ideas for improvements, w.r.t. the
> > > development process?
> > >=20
> > > As you can see, there is still some available time for other topics.

--=-Pt/jzbaHDPw2f07rMYjz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCad1RUwAKCRDZQZRRKWBy
9Hz4AP9VvX1RGgacscnfOCQrYzjGItIIcxp3U5pgxulGKpbeKwEA5zATPIU4SLhx
40VNoh29kzIB10uICYJEl5EewBmaLAs=
=6f9H
-----END PGP SIGNATURE-----

--=-Pt/jzbaHDPw2f07rMYjz--

