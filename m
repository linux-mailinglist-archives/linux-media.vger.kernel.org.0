Return-Path: <linux-media+bounces-64439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8QHpNshlKWrSWAMAu9opvQ
	(envelope-from <linux-media+bounces-64439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:25:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F9669AFC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:25:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=E1WdhyrN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64439-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64439-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1784032A1107
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B15408023;
	Wed, 10 Jun 2026 13:20:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DE407CE1;
	Wed, 10 Jun 2026 13:20:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097625; cv=none; b=H5XsSyCrFlWBNnP1vABiLaEAPJ/l7TTRItLdK/1JNnrWTwm2hbGXcU+g8GrTP0qFrG5VamqTJLZUyTPlhbL5NytFfPG2JSkvBYZcwXl4pe1z73B1vwQ85t6Pavh1ruo5beAJ0kL5ZllOMmkem478zAiMzyCTy6+XaiXcAm5YIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097625; c=relaxed/simple;
	bh=rtNAAlhtypLV7NtxFca9OU2GViA+FbcIEm3U1Hqnr6o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u2Ss4gqMSl1KySi739UNclHXGfgE+yvM/Tevetl8Ms8IKpKiG6KwBs9qVxIhD4uSqPvQAL0RFFoNje7Vf0WiGaGx1ku8hwm+a5QDPaYPKS7KMoD1U/lap36XfuvgBP3BuuEDItFP2PLJu51cRzTAermtiAStjKXC8I+6CJmTMwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E1WdhyrN; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781097615;
	bh=rtNAAlhtypLV7NtxFca9OU2GViA+FbcIEm3U1Hqnr6o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E1WdhyrNxGo+A6il718YJ1uav0/PXgvvGf1ry4iRD5rcChufxC29u7f01hhP6p0Gd
	 X9J4VEpKD6f6B2zI0a05HG/T6PWmsqj5crt/6Ge0liC00Mv+CRY6wCmpTKzLRwg7de
	 oCUI5tSv0wKHSANhhSP11yj9kFkvixmDE4ci7aLAMf2jCslm8avSdw6ZWOYBz4DKsv
	 iu7MvLm3J7dQqWVFOoPh+4/ju8BAE5d0vnemsLSSi8jEArqjY8Y4R2mI5qu+ud6FoC
	 uOKn5Dj4Oyh2HBZtMX0V9e0w+uyurFZSvbZxFQzEsX4PFqRdRG5uZunyDHdBZy1P+V
	 U6Nr6DDMF6KBw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 610D817E0246;
	Wed, 10 Jun 2026 15:20:14 +0200 (CEST)
Message-ID: <6d3acf626e0018c4175c413c3eeb9b8b12c3c8be.camel@collabora.com>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Marek Szyprowski
	 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
 "hverkuil@kernel.org"	 <hverkuil@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "imx@lists.linux.dev"	 <imx@lists.linux.dev>,
 "Frank.Li@kernel.org" <Frank.Li@kernel.org>,  "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, Elliot
 Chen	 <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Jun 2026 09:20:12 -0400
In-Reply-To: <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
	 <20260608040616.1A3EE1F00893@smtp.kernel.org>
	 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
	 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
	 <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-RwNoGtVUCUgb+aOBDcyu"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ming.qian@oss.nxp.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64439-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,linux.dev:email,collabora.com:dkim,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 336F9669AFC


--=-RwNoGtVUCUgb+aOBDcyu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 10 juin 2026 =C3=A0 11:49 +0900, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> On Tue, Jun 09, 2026 at 02:00:02PM -0400, Nicolas Dufresne wrote:
>=20
> Hi Nicolas,
> > Hi Ming,
> >=20
> > Le lundi 08 juin 2026 =C3=A0 06:26 +0000, Ming Qian (OSS) a =C3=A9crit=
=C2=A0:
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: sashiko-bot@kernel.org=C2=A0<sashiko-bot@kernel.org>
> > > > Sent: Monday, June 8, 2026 12:06 PM
> > > > To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
> > > > Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kern=
el.org
> > > > Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > >=20
> > > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l
> > > > issue(s)
> > > > to consider:
> > > > - [High] The added documentation conflates
> > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
> > > > resolution switching capability) with the mandatory initial
> > > > `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this =
flag to
> > > > determine whether the decoder will signal the initial resolution", =
it
> > > > explicitly
> > > > legitimizes a flawed userspace heuristic that violates the V4L2 sta=
teful
> > > > decoder
> > > > specification. The specification mandates that for coded formats co=
ntaining
> > > > resolution info, the decoder MUST parse the stream and emit an init=
ial
> > > > `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant=
 drivers
> > > > (e.g., `coda`) correctly emit this initial event but do NOT set
> > > > `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switchi=
ng
> > > > capabilities. If userspace follows this documented advice, it will
> > > > erroneously
> > > > skip waiting for the initial event on these drivers, breaking Captu=
re Setup
> > > > and
> > > > stream decoding.
> > > > --
> > > >=20
> > > > commit ec9c0583334c246f7813132b55724e42622e8edd
> > > > Author: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > >=20
> > > > This commit updates the V4L2 stateful decoder documentation to clar=
ify the
> > > > usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stat=
ing
> > > > that decoders setting this flag will always emit an initial source =
change
> > > > event.
> > > > The documentation suggests clients can use this flag to decide whet=
her to
> > > > wait
> > > > for the initial resolution signal.
> > > >=20
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rs=
t
> > > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > @@ -361,6 +361,14 @@ Initialization
> > > > [ ... ]
> > > > > +=C2=A0=C2=A0=C2=A0 .. note::
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Decoders that set the ``V4L=
2_FMT_FLAG_DYN_RESOLUTION`` flag for
> > > > the
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 coded format will always em=
it an initial
> > > > ``V4L2_EVENT_SOURCE_CHANGE``
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event with ``V4L2_EVENT_SRC=
_CH_RESOLUTION`` during this phase.
> > > > Clients
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can use this flag to determ=
ine whether the decoder will signal the
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initial resolution before p=
roducing decoded frames.
> > > >=20
> > > > [Severity: High]
> > > > Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
> > > > which designates mid-stream dynamic resolution switching, with the
> > > > mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
> > > >=20
> > > > The V4L2 Stateful Decoder API requires an initial
> > > > V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for =
stream
> > > > parsing, irrespective of dynamic resolution support.
> > > >=20
> > > > Compliant drivers like coda correctly emit this initial event but d=
o not set
> > > > V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
> > > > capabilities.
> > > >=20
> > > > If userspace follows this documented advice, wouldn't it erroneousl=
y skip
> > > > waiting for the initial event on these drivers, potentially breakin=
g capture
> > > > setup
> > > > and stream decoding?
> > > >=20
> > > > --
> > > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-fl=
ag-dyn-
> > > > resolution-v1-0-44dc65516148@oss.nxp.com?part=3D1
> > >=20
> > > Hi,
> > >=20
> > > Thanks for the review.
> > >=20
> > > You are right that the V4L2 stateful decoder specification states the=
 initial
> > > V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
> > > resolution information in the stream (Initialization Step 4).
> >=20
> > Be aware that Sashiko is an AI bot, llm words things with extreme convi=
ction,
> > and it this case forget about backward compatibility from pre-spec.
> >=20
> > >=20
> > > However, in practice, GStreamer's v4l2 stateful decoder implementatio=
n uses
> > > V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wa=
it for
> > > the initial source change event. The reasoning from the GStreamer sid=
e, as
> > > Nicolas explained [1]:
> > >=20
> > > =C2=A0=20
> > > "
> > > https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dyna=
mic-resolu
> > > tion-change
> > > =C2=A0=C2=A0=C2=A0 Says:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not all decoders can detec=
t resolution changes. Those that do set the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_FMT_FLAG_DYN_RESOLUTI=
ON flag.
> > >=20
> > > =C2=A0=C2=A0=C2=A0 So normally that wording should prevent requiring =
an initial SRC_CH,
> > > =C2=A0=C2=A0=C2=A0 or emitting later SRC_CH. Your driver don't have t=
his flag, then your
> > > =C2=A0=C2=A0=C2=A0 driver can't emit this event. But a measure we sho=
uld take into
> > > =C2=A0=C2=A0=C2=A0 GStreamer would be to not register (or mark) this =
event."
> > >=20
> > > @Nicolas, could you elaborate on why GStreamer needs
> > > V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change even=
t?
> > > Is this something that should be fixed on the GStreamer side (i.e., a=
lways
> > > wait for the initial event), or is the current heuristic intentional =
due to
> > > legacy drivers that don't emit the event?
> >=20
> > The coda source_change notification is completely fake. It does not dep=
endent on
> > the bitstream content. So the event is left there, since its kind of pa=
rt of the
> > ABI, but it does not behave like other implementation, or pre-spec driv=
ers.
> >=20
> > So what we do in GStreamer, is that for legacy driver (no
> > V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on ou=
r guessed
> > dimensions. If it happens that the conformance windows is small enough,=
 it often
> > works. DRC will only work if the display dimension changes.
> >=20
> > For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we =
strictly
> > wait for the event, and on DRC, even if the display resolution changes,=
 we let
> > the driver tell us when to actually reconfigure. The legacy method was =
kept to
> > not break coda and older driver, the new method is a lot more reliable,=
 and
> > avoid allocating twice the capture queue (wrong guess).
> >=20
> > The userspace implementation is also a bit more flexible, as normally t=
he legacy
> > way should kind of work for any drivers, and we still subscribe it seem=
s. But
> > the implication is just strange and shouldn't be needed in drivers with
> > V4L2_FMT_FLAG_DYN_RESOLUTION support.
> >=20
> > Nicolas
> >=20
> >=20
>=20
> Thanks for the detailed explanation of GStreamer's approach.
>=20
> I have a couple of follow-up questions:
>=20
> 1. Regarding coda's source change being "completely fake":
>=20
> =C2=A0=C2=A0 Looking at the coda driver code, its seq_init_work does pars=
e the
> =C2=A0=C2=A0 bitstream via hardware (SEQ_INIT command), and the source ch=
ange event
> =C2=A0=C2=A0 is only emitted after ctx->initialized is set =E2=80=94 whic=
h requires the
> =C2=A0=C2=A0 hardware to successfully parse the stream headers. After the=
 event,
> =C2=A0=C2=A0 userspace can call G_SELECTION to retrieve the actual displa=
y crop
> =C2=A0=C2=A0 rectangle parsed from the bitstream.
>=20
> =C2=A0=C2=A0 The limitation is that coda requires userspace to set a suff=
iciently
> =C2=A0=C2=A0 large resolution via S_FMT(OUTPUT) beforehand (since it vali=
dates
> =C2=A0=C2=A0 stream dimensions fit within the pre-configured buffer size =
rather
> =C2=A0=C2=A0 than updating G_FMT with parsed dimensions). But the event i=
tself
> =C2=A0=C2=A0 does depend on bitstream content and carries useful informat=
ion
> =C2=A0=C2=A0 (visible resolution via selection API).
>=20
> =C2=A0=C2=A0 So it seems coda could work with the standard init flow =E2=
=80=94 the source
> =C2=A0=C2=A0 change event is real, just the information delivery is parti=
al (crop
> =C2=A0=C2=A0 via G_SELECTION rather than full coded resolution via G_FMT)=
. Would
> =C2=A0=C2=A0 you agree, or is there another reason GStreamer treats it as=
 legacy?

Its possible I miss-understood the code indeed.

>=20
> 2. Regarding s5p-mfc:
>=20
> =C2=A0=C2=A0 Interestingly, s5p-mfc sets V4L2_FMT_FLAG_DYN_RESOLUTION but=
 does
> =C2=A0=C2=A0 NOT emit an initial source change event. After SEQ_DONE, it =
simply
> =C2=A0=C2=A0 transitions to MFCINST_HEAD_PARSED state and wakes up waiter=
s =E2=80=94
> =C2=A0=C2=A0 userspace discovers the resolution by calling G_FMT(CAPTURE)=
 which
> =C2=A0=C2=A0 internally blocks until header parsing completes.
>=20
> =C2=A0=C2=A0 The source change event is only emitted during mid-stream re=
solution
> =C2=A0=C2=A0 changes (RES_CHANGE_FLUSH path). How does GStreamer handle t=
his case?
> =C2=A0=C2=A0 Does it timeout waiting for the initial event and fall back,=
 or does
> =C2=A0=C2=A0 it use some other mechanism?

That one I have no idea, that MFC driver gets highly hacked up on Android, =
and
Samsung is pretty much gone from the general purpose SBC or IoT world. Last=
 time
I worked with MFC, they did not have that flags set (it didn't exist yet), =
and
the blocking G_FMT was the thing that pretty much everyone disliked, and wh=
y we
made a spec for newly introduce decoder.

I'd assume that GStreamer cannot operate on mainline MFC. It would be nice =
to
fix, but I don't myself have the bandwidth. Is there anyone left at Samsung=
 that
cares about it ? Adding the two maintainers. Though clearly, its non spec
compliant to flag V4L2_FMT_FLAG_DYN_RESOLUTION without emitting the initial
event.

>=20
> Overall, I agree that using V4L2_FMT_FLAG_DYN_RESOLUTION to unify the
> behavior (both initial source change and mid-stream DRC) is the right
> direction. But the current state has some inconsistencies:
>=20
> =C2=A0 - coda: emits initial source change, but does NOT set DYN_RESOLUTI=
ON
> =C2=A0 - s5p-mfc: sets DYN_RESOLUTION, but does NOT emit initial source c=
hange
>=20
> If we want to document that "DYN_RESOLUTION implies initial source change
> event will be emitted", s5p-mfc would need to be fixed to comply. Does
> that seem reasonable, or should we take a different approach?

I think though that we don't have to have that documented, since
V4L2_FMT_FLAG_DYN_RESOLUTION comes after the V4L2 stateful spec, and so, if=
 you
include that flag you also have to comply to the spec. Maybe I'm a bit wish=
ful,
but the reality is that this is more about unmaintained territory.

For CODA, its very very old, and the legacy way of guessing the allocation =
is
what works best there. Though, I'd be happy to help fix and test this one, =
I do
have this hardware, and surprisingly, imx6 which host this IP is still in u=
se
today.

Nicolas

>=20
> Regards,
> Ming
>=20
> >=20
> > >=20
> > > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5=
126
> > >=20
> > > Best regards,
> > > Ming
>=20

--=-RwNoGtVUCUgb+aOBDcyu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCailkjAAKCRDZQZRRKWBy
9M8hAQCk9VYvunvG/LPVCfamhohzZ+Nr7kS0XQl/eA0IWoMIiAD/To621F1YThiA
tcyTUzAoznVXi5pHiexsLAGhacivGgs=
=i4uu
-----END PGP SIGNATURE-----

--=-RwNoGtVUCUgb+aOBDcyu--

