Return-Path: <linux-media+bounces-44933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B216CBEB3B2
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 375B335B2E3
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD82432AAAA;
	Fri, 17 Oct 2025 18:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f0Fh0fa+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB715257831
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760726067; cv=none; b=ijUy8oWBx0peumVbzR5tDHbY1tDMPbSTwq6ATTN72NQggiKwXN+Fqt3Eih76Z0By2lXvZuEV/guTZeGEZJd81unQ3NmdBNIOyxQxUsadym1REmLXYqmD+X2NhVcNl9xzrdYBrHuplhFa7xsuWEBE5rBUZU7j5dIx7BhZ+EThnE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760726067; c=relaxed/simple;
	bh=EXMQeAt0mzbB7lNFldmVXWsPny5LbIM9m+aAaykBvMc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nx7LzSDqR9yf487rvZ/MgqDeeH8CxcpBq8U5ukqelei2dA454AQHe8hcMlOWEHy3dldVi3cFgUxFjMezUXneNZZK3ImKtqFUMM907Eg4sjHXrMb4pEijroMV3hIcaLyjOYaXQXrUnj5RVzZgUgQTJL3v4a+HX7PXWz7PKzQREVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f0Fh0fa+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760726062;
	bh=EXMQeAt0mzbB7lNFldmVXWsPny5LbIM9m+aAaykBvMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=f0Fh0fa+icKjzW3a3CW0ttkO2MvfvY3nDXjY6Nrj6gUAHCUiv6aBaZt4pqOr0Vvpt
	 4OMYiJtdBIBpb9qUzawvJgvuM7OZIs+pitSIT7Kuh7xZd3TA9PrfuPJHpZf+I6gRVQ
	 1eBqKKQQt35mEaxAxGIge0wmVAG5VcnfG9yp2GuixwCFPQ02gEr+5VHHDAXDr4X67Y
	 ds90Dh9fEYc+/NsRkq8z5RyAc9sI3GG8WwR1FR+zZDBe0GOGKR6sPoA/xbhC8UEpmP
	 xhO8ZgU5NOTyllVve8z/cP8X2KVdwLk8vNwwe3azMwgHCqaNL6dnX0VrTnnn7/AMnB
	 qP5v8rP367aZA==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6773417E1267;
	Fri, 17 Oct 2025 20:34:22 +0200 (CEST)
Message-ID: <178cbcf92463bf4de47194ff6f2dbc69b9a9280e.camel@collabora.com>
Subject: Re: [GIT PULL v2 FOR 6.19] Media CODEC Fixes 2025-10-17
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: wens@kernel.org
Cc: linux-media@vger.kernel.org
Date: Fri, 17 Oct 2025 14:34:20 -0400
In-Reply-To: <CAGb2v675dx-NECeRAf9O462QnAmH0rwQT30qxERG12-cwoVoBw@mail.gmail.com>
References: <dbccf041ba384d61d9a7f048d7eaab111af85dbb.camel@collabora.com>
	 <CAGb2v675dx-NECeRAf9O462QnAmH0rwQT30qxERG12-cwoVoBw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-qAX35jgFah2eSEDEgLhC"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qAX35jgFah2eSEDEgLhC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wens,

Le samedi 18 octobre 2025 =C3=A0 01:35 +0800, Chen-Yu Tsai a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> On Sat, Oct 18, 2025 at 12:56=E2=80=AFAM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Hi Mauro, Hans,
> >=20
> > This pull request contains a collection of bug fixes in various codec
> > drivers
> > and an improved validation of AV1 sequence parameters.
>=20
> Is it possible to fast track these for 6.18? Some of these fix fatal erro=
rs.

I'm afraid this is as fast as it can go. These have been broken for several
releases before someone picked it up, so it makes little sense to complicat=
e the
process.

>=20
> > cheers,
> > Nicolas
> >=20
> > p.s. sorry for the previous empty subject request.
> >=20
> > ---
> >=20
> > The following changes since commit 082b86919b7a94de01d849021b4da820a6cb=
89dc:
> >=20
> > =C2=A0 media: v4l2-mem2mem: Fix outdated documentation (2025-10-14 15:0=
7:37
> > +0200)
> >=20
> > are available in the Git repository at:
> >=20
> > =C2=A0 https://gitlab.freedesktop.org/linux-media/users/ndufresne.git=
=C2=A0tags/for-
> > 6.19-media-codec-fixes-2025-10-17
> >=20
> > for you to fetch changes up to 60d4fac49415810bd4d07b18570065999e318a7b=
:
> >=20
> > =C2=A0 media: allegro: fix race conditions in channel handling (2025-10=
-16
> > 09:32:55 -0400)
> >=20
> > ----------------------------------------------------------------
> > Various CODEC bug fixes
> >=20
> > ----------------------------------------------------------------
> > Chen-Yu Tsai (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mediatek: vcodec: Use spinlock fo=
r context list protection lock
>=20
> This one.
>=20
> >=20
> > Haoxiang Li (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mediatek: vcodec: Fix a reference=
 leak in
> > mtk_vcodec_fw_vpu_init()
> >=20
> > Johan Hovold (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: platform: mtk-mdp3: fix device le=
aks at probe
> >=20
> > Matthias Fend (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: print warning if channel=
 creation timeout occurs
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: process all pending stat=
us mbox messages
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: fix race conditions in c=
hannel handling
> >=20
> > Ming Qian (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: amphion: Remove vpu_vb_is_codecco=
nfig
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: amphion: Cancel message work befo=
re releasing the VPU core
> >=20
> > Nicolas Dufresne (2):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: Fix CPU stalls on G2=
 bus error
>=20
> This one.
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: Protect G2 HEVC deco=
der against invalid DPB index
>=20
> And maybe this one?

I don't disagree with you these are (for Hantro G2 users) quite bad when hi=
t.
For a little more context, the first makes the error non-fatal, and the sec=
ond
makes the error go away (at least the one I could narrow down using skippab=
le
frames at the start of a gop).

cheers,
Nicolas

>=20
>=20
> Thanks
> ChenYu
>=20
> >=20
> > Pavan Bobba (1):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: v4l2-ctrls: add full AV1 profile =
validation in
> > validate_av1_sequence()
> >=20
> > =C2=A0drivers/media/platform/allegro-dvt/allegro-core.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 114
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
> > +++++++++++++++-----------------------
> > =C2=A0drivers/media/platform/amphion/vpu_malone.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23
> > +++--------------------
> > =C2=A0drivers/media/platform/amphion/vpu_v4l2.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16
> > +++-------------
> > =C2=A0drivers/media/platform/amphion/vpu_v4l2.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 -
> > ---------
> > =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 14
> > ++++++++++++++
> > =C2=A0drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c=
=C2=A0=C2=A0 |=C2=A0 14
> > +++++++++-----
> > =C2=A0drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c |=C2=A0 12
> > +++++++-----
> > =C2=A0drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h |=C2=A0=C2=A0 2
> > +-
> > =C2=A0drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5
> > +++--
> > =C2=A0drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c |=C2=A0 12
> > +++++++-----
> > =C2=A0drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.h |=C2=A0=C2=A0 2
> > +-
> > =C2=A0drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5
> > +++--
> > =C2=A0drivers/media/platform/verisilicon/hantro_g2.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 88
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--=
-----
> > ------------
> > =C2=A0drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17
> > +++++++++++++----
> > =C2=A0drivers/media/platform/verisilicon/hantro_g2_regs.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 13
> > +++++++++++++
> > =C2=A0drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 -
> > -
> > =C2=A0drivers/media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/media/platform/verisilicon/imx8m_vpu_hw.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2
> > ++
> > =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 125
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
> > ++++++++++++++++++++++++-------------------------
> > =C2=A019 files changed, 340 insertions(+), 137 deletions(-)
> >=20
> > --
> > Nicolas Dufresne
> > Principal Engineer at Collabora
> >=20
> > --
> > Nicolas Dufresne
> > Principal Engineer at Collabora

--=-qAX35jgFah2eSEDEgLhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPKMLAAKCRDZQZRRKWBy
9Af8AP4/34pLIpg9S2SRQ496MEeTZ2UhAPhMhktt1bGVJpjILAEAs80ilf0FFG/R
IErkZyiSyoLLa6Os/y6gYvCERKoWiw0=
=9YJd
-----END PGP SIGNATURE-----

--=-qAX35jgFah2eSEDEgLhC--

