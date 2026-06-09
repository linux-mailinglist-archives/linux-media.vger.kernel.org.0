Return-Path: <linux-media+bounces-64327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WxfzJ3JXKGrlCQMAu9opvQ
	(envelope-from <linux-media+bounces-64327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 20:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4BB66337B
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 20:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=Nu3K+jsy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64327-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64327-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A18DB305DBE8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB68235200C;
	Tue,  9 Jun 2026 18:00:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6637C11E;
	Tue,  9 Jun 2026 18:00:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028009; cv=none; b=dVkf+kt7Jukw4QX/NfDO4Ys8ku7YMXqp7AUyBUXvufq6zA4FdgU3kcsIHOsagOd+YjaswWHt08Ynbm3MiElJx4xApuDSGi0XgBwdvVHGvnjhzVq8ubni5xmJLi/gPwjk1qzu70PquGrSyTAXw+krCufZEMQ6NzIhOAr/mJqz5sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028009; c=relaxed/simple;
	bh=LSU8uy9TIm+yPHCEgoK9Ye89/jZyx4/FHIz6pW3qNMA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dh8+pSrVsXn23tC0JUQ4x1Zbg807JlwECX9kzv/Pc7sdB+4qcHFYO1U7ur5bvAS7hFPiC65gOHNUs2GROm0TykX8ZejgZgdRXYaMLws5b0roFPT82KgZBnx9024L8hO0jUjHjax/DKqoIFXt7ZyISmt53SA61k1I1ZWF4IHJeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nu3K+jsy; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781028006;
	bh=LSU8uy9TIm+yPHCEgoK9Ye89/jZyx4/FHIz6pW3qNMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Nu3K+jsy97Yy6S7tO7hMENFWubYbQuAVI/emRwDvCWnE6I+yV01Qz9nKG6ZpFmfty
	 p4SdtYJ268TtFwfrIXkssCRIMZZvEaMdJMoaJaW6l4B+kX7g2CoB0+cQme6fO6e8Md
	 pjUCWgC92OdgF0EwixX07V/qOLJI91hl40UgfadWHHXJB/00ujcDEluP9u6X+1HI4E
	 2V+Q8Lr+pWsvnYnCqBGrPwbhY4wKseSZaIICYPvS7coXpHrBm1Sv2A7zmgFlUZT6w4
	 Q3gy/tifTf25DA9ZkaOQ8BZ2B5fVVywEQ05L/Fp7bjBN3FtTI3c2w99bKxoWxA/ct7
	 rtOkEfM00Wetw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CF3A17E013E;
	Tue,  9 Jun 2026 20:00:04 +0200 (CEST)
Message-ID: <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Ming Qian (OSS)" <ming.qian@oss.nxp.com>, 
 "sashiko-reviews@lists.linux.dev"	 <sashiko-reviews@lists.linux.dev>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>,  "mchehab@kernel.org"	
 <mchehab@kernel.org>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"	
 <Frank.Li@kernel.org>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, Elliot Chen
	 <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Tue, 09 Jun 2026 14:00:02 -0400
In-Reply-To: <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
	 <20260608040616.1A3EE1F00893@smtp.kernel.org>
	 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="=-8m0gqXdWrn1Q4RBvIOn+"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ming.qian@oss.nxp.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F4BB66337B


--=-8m0gqXdWrn1Q4RBvIOn+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le lundi 08 juin 2026 =C3=A0 06:26 +0000, Ming Qian (OSS) a =C3=A9crit=C2=
=A0:
>=20
>=20
> > -----Original Message-----
> > From: sashiko-bot@kernel.org=C2=A0<sashiko-bot@kernel.org>
> > Sent: Monday, June 8, 2026 12:06 PM
> > To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
> > Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kernel.o=
rg
> > Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
> > V4L2_FMT_FLAG_DYN_RESOLUTION usage
> >=20
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s)
> > to consider:
> > - [High] The added documentation conflates
> > `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
> > resolution switching capability) with the mandatory initial
> > `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this flag=
 to
> > determine whether the decoder will signal the initial resolution", it
> > explicitly
> > legitimizes a flawed userspace heuristic that violates the V4L2 statefu=
l
> > decoder
> > specification. The specification mandates that for coded formats contai=
ning
> > resolution info, the decoder MUST parse the stream and emit an initial
> > `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant dri=
vers
> > (e.g., `coda`) correctly emit this initial event but do NOT set
> > `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switching
> > capabilities. If userspace follows this documented advice, it will
> > erroneously
> > skip waiting for the initial event on these drivers, breaking Capture S=
etup
> > and
> > stream decoding.
> > --
> >=20
> > commit ec9c0583334c246f7813132b55724e42622e8edd
> > Author: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
> >=20
> > This commit updates the V4L2 stateful decoder documentation to clarify =
the
> > usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating
> > that decoders setting this flag will always emit an initial source chan=
ge
> > event.
> > The documentation suggests clients can use this flag to decide whether =
to
> > wait
> > for the initial resolution signal.
> >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -361,6 +361,14 @@ Initialization
> > [ ... ]
> > > +=C2=A0=C2=A0=C2=A0 .. note::
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Decoders that set the ``V4L2_FM=
T_FLAG_DYN_RESOLUTION`` flag for
> > the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 coded format will always emit a=
n initial
> > ``V4L2_EVENT_SOURCE_CHANGE``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 event with ``V4L2_EVENT_SRC_CH_=
RESOLUTION`` during this phase.
> > Clients
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can use this flag to determine =
whether the decoder will signal the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initial resolution before produ=
cing decoded frames.
> >=20
> > [Severity: High]
> > Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
> > which designates mid-stream dynamic resolution switching, with the
> > mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
> >=20
> > The V4L2 Stateful Decoder API requires an initial
> > V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for stre=
am
> > parsing, irrespective of dynamic resolution support.
> >=20
> > Compliant drivers like coda correctly emit this initial event but do no=
t set
> > V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
> > capabilities.
> >=20
> > If userspace follows this documented advice, wouldn't it erroneously sk=
ip
> > waiting for the initial event on these drivers, potentially breaking ca=
pture
> > setup
> > and stream decoding?
> >=20
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-flag-d=
yn-
> > resolution-v1-0-44dc65516148@oss.nxp.com?part=3D1
>=20
> Hi,
>=20
> Thanks for the review.
>=20
> You are right that the V4L2 stateful decoder specification states the ini=
tial
> V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
> resolution information in the stream (Initialization Step 4).

Be aware that Sashiko is an AI bot, llm words things with extreme convictio=
n,
and it this case forget about backward compatibility from pre-spec.

>=20
> However, in practice, GStreamer's v4l2 stateful decoder implementation us=
es
> V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wait f=
or
> the initial source change event. The reasoning from the GStreamer side, a=
s
> Nicolas explained [1]:
>=20
> =C2=A0=20
> "
> https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dynamic-=
resolu
> tion-change
> =C2=A0=C2=A0=C2=A0 Says:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Not all decoders can detect re=
solution changes. Those that do set the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_FMT_FLAG_DYN_RESOLUTION f=
lag.
>=20
> =C2=A0=C2=A0=C2=A0 So normally that wording should prevent requiring an i=
nitial SRC_CH,
> =C2=A0=C2=A0=C2=A0 or emitting later SRC_CH. Your driver don't have this =
flag, then your
> =C2=A0=C2=A0=C2=A0 driver can't emit this event. But a measure we should =
take into
> =C2=A0=C2=A0=C2=A0 GStreamer would be to not register (or mark) this even=
t."
>=20
> @Nicolas, could you elaborate on why GStreamer needs
> V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change event?
> Is this something that should be fixed on the GStreamer side (i.e., alway=
s
> wait for the initial event), or is the current heuristic intentional due =
to
> legacy drivers that don't emit the event?

The coda source_change notification is completely fake. It does not depende=
nt on
the bitstream content. So the event is left there, since its kind of part o=
f the
ABI, but it does not behave like other implementation, or pre-spec drivers.

So what we do in GStreamer, is that for legacy driver (no
V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on our gu=
essed
dimensions. If it happens that the conformance windows is small enough, it =
often
works. DRC will only work if the display dimension changes.

For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we stri=
ctly
wait for the event, and on DRC, even if the display resolution changes, we =
let
the driver tell us when to actually reconfigure. The legacy method was kept=
 to
not break coda and older driver, the new method is a lot more reliable, and
avoid allocating twice the capture queue (wrong guess).

The userspace implementation is also a bit more flexible, as normally the l=
egacy
way should kind of work for any drivers, and we still subscribe it seems. B=
ut
the implication is just strange and shouldn't be needed in drivers with
V4L2_FMT_FLAG_DYN_RESOLUTION support.

Nicolas



>=20
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126
>=20
> Best regards,
> Ming

--=-8m0gqXdWrn1Q4RBvIOn+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaihUogAKCRDZQZRRKWBy
9CHaAQCTKf/BSE24byAZnFSfSBREpFisA0YSFFZjDJESudzBagEA/dlVejAySVvK
6ZcMw1myvBREc8mGAbj0RMD9fDt36Qc=
=FpTM
-----END PGP SIGNATURE-----

--=-8m0gqXdWrn1Q4RBvIOn+--

