Return-Path: <linux-media+bounces-58368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEomMdjm12n8UQgAu9opvQ
	(envelope-from <linux-media+bounces-58368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:50:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 591613CE4E7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 19:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18CCD3030131
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 17:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607F23E2750;
	Thu,  9 Apr 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N8M0tP1+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786932E7162;
	Thu,  9 Apr 2026 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775756910; cv=none; b=jVxX3sROY/vNNO5rcITPn+egLMRPsbgJYNCD17zaIdNJI2wArUdX/uEj16JcrEsKsLJcuGf8qWJflba12oFR3guo1OItY8QSctlp7tAFdTahafP/Io0JLLkHY+nGo1tOP1HyQeKgB61caPSSlI2UBjAcLSojZNk/zygfrMdZ32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775756910; c=relaxed/simple;
	bh=GOPVnYctauWroG2tZXF6QD2dB9fsyysY8ZThXl6u9is=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n9mXsrRYkBx4ofoHNjpLH3OqmR+S6A4Va/oCMyrCyqVA7kp3HEEx/XLBhSzsC7xoQskoQWUMZFwJcEpqnva/pqwHqMoVrEkHtrX378eNkYLoikJTH4HUKon4J5uEZYEocx52wn4gm7+29bWW8mSkUDcSnWNH0dSQx/lBY+qt2Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N8M0tP1+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775756907;
	bh=GOPVnYctauWroG2tZXF6QD2dB9fsyysY8ZThXl6u9is=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N8M0tP1+nTFtCAm5mYRVljVpT2KsF2bTDT0V8fBto+rM4y2hKDJSG+8OOLf3pp431
	 tOh+9b5PSxXh6LqFjnBxm+yXl5la2tcB6OvOhSUfp8ai4fVpL4GBiro53So+ov/CKG
	 L5DeyF3/g5084oqSbNFZ5ZBgdHWu3IafJpI8VrGWrb3LECStbWC31qezreRYEWU4/D
	 gRGVhUHw3LIT2lG2aj4Bj4/MR0BYaxea1wzEEPLsjOijPToiMgge7v8deHiPDk+LxP
	 rJ4dN7rkF/SjfwN/xnEG5R6hBe6M42MccGZ6ao+0WGfcb2uAltVOwOcSXPLwPPzWgc
	 ARz0OyCOxTWhw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1A3617E11F5;
	Thu,  9 Apr 2026 19:48:25 +0200 (CEST)
Message-ID: <30ac60a7d8671917cbb8ce2fe77c9264e42905dd.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, mripard@kernel.org,
 mchehab@kernel.org, 	gregkh@linuxfoundation.org, wens@kernel.org,
 jernej.skrabec@gmail.com, 	samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 13:48:23 -0400
In-Reply-To: <adfGZHR9wM2d6-yJ@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <adeqkmA9VhaPkSAk@shepard>
	 <4bd5d70a6144f3e8d4356c182f314cf735f1921c.camel@collabora.com>
	 <ade4Qe4OS04au2Ba@shepard>
	 <a5f8c14becdc926f14ea852c8c5a2d4665a2ef8a.camel@collabora.com>
	 <adfGZHR9wM2d6-yJ@shepard>
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
	protocol="application/pgp-signature"; boundary="=-Nv2A21rWHI35JGwK0I46"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linuxfoundation.org,gmail.com,sholland.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58368-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 591613CE4E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Nv2A21rWHI35JGwK0I46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 17:31 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On Thu 09 Apr 26, 10:39, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le jeudi 09 avril 2026 =C3=A0 16:31 +0200, Paul Kocialkowski a =C3=A9cr=
it=C2=A0:
> > > I think it make sense yes, but it would be good to document it in the=
 uAPI
> > > document too.
> >=20
> > Basically, extend in the M2M decoder spec(s) on the existing documentat=
ion:
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 V4L2_BUF_FLAG_ERROR:
> > =C2=A0=C2=A0 -
> > =C2=A0=C2=A0 When this flag is set, the buffer has been dequeued succes=
sfully, although
> > =C2=A0=C2=A0 the data might **have been corrupted**. This is recoverabl=
e, streaming may
> > =C2=A0=C2=A0 continue as normal and the buffer may be reused normally. =
Drivers set this
> > =C2=A0=C2=A0 flag when the VIDIOC_DQBUF ioctl is called.
>=20
> Well this part is about v4l2 buffers in general, not just m2m/decoders.
> But I guess this mechanism would make sense for more device classes than =
just
> decoders, so we could indeed specify it there. Maybe with a sufficiently =
broad
> wording.

This is current spec, I did meant to use that as basis and improve that cod=
ec
specific part.

>=20
> But it would be good to also update the stateless decode document (and ma=
ybe
> stateful too) where V4L2_BUF_FLAG_ERROR is already mentionned a few times=
.
> We could indicate how this behavior related to reference frames there.
>=20
> If we agree I could make a series with the following:
> - Introduce a V4L2_H264_REF_MISSING 0xff define (same for HEVC)
> - Update the v4l2_h264_reference doc to mention it
> - Update the cedrus driver to error out (zero-size payload) when the L0/L=
1 index
> =C2=A0 is either V4L2_H264_REF_MISSING or an invalid index that doesn't e=
xist in the
> =C2=A0 DPB (same for HEVC)

Base on what you reported, this is currently the shortest and safe thing to=
 do.

> - Update the v4l2 buffer and stateless(+stateful) documents to mention th=
at
> =C2=A0 buffers marked with V4L2_BUF_FLAG_ERROR may or may not contain usa=
ble (yet
> =C2=A0 corrupted) data depending on the payload size and how it relates t=
o reference
> =C2=A0 frames.

wfm

>=20
> Then we could later envision having a mechanism (hopefully common) to fig=
ure out
> the best replacement to a given missing reference, which would allow cedr=
us
> (and maybe other drivers too) to return a frame with incorrect data inste=
ad of
> a zero-size payload error.

Certainly, though from my experience best or any works quite well, and quit=
e
better then skipping. But if it makes the HW unstable, or sending uninitial=
ized
data to the HW, I agree this is better to hard fail that frame now, enhance
later. Also, be aware that some HW (RK3399 iirc) have error counters, so yo=
u
know how many macroblocks are not decoded properly. Other HW have error IRQ=
,
with a register that tells which macroblock it failed on. The reference dec=
oder
have optional support for software concealment for the failing macroblock, =
the
down side is that in the worse case you get an irq per block, which is quit=
e a
disaster performance whise.

>=20
> What do you think?

Yes, I'm happy with the proposal to get this moving forward.

Nicolas

>=20
> All the best,
>=20
> Paul

--=-Nv2A21rWHI35JGwK0I46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadfmaAAKCRDZQZRRKWBy
9AfdAP9GiZ9AUUqZ2JJXJMWdLt5KTeBYnF0UqPDmYB9l/JTzwwD/SSbSjVel/rLp
CxWSNudtOhoaGu+tHQJkTzmbI+OVpAI=
=uM6R
-----END PGP SIGNATURE-----

--=-Nv2A21rWHI35JGwK0I46--

