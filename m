Return-Path: <linux-media+bounces-44931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F364BEAEFD
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB071AE2CFA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 17:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C902F0C64;
	Fri, 17 Oct 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cr8wEHWw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F992F12A7
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720367; cv=none; b=MkoXXpcdJck4+zPWu+PArKN5wuY1N+EMRe9ytN2ycvsQsz6pCHEmS2bq4akgrHEDmyLeYSjcdQ1NaK0WIvJti8jLVjt8lYeBcquesAKq0OqaEk5dxuYu8x9qoGTt3trn6wN+ga3/xFRsgZseeiq79OZpVKKeteUo+fBoZLJ6ODk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720367; c=relaxed/simple;
	bh=feGBSH+2FPW8RiZzt5iXLfzzn3H4XfpiElBqd1MMslQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TKwWhV+IBCDDLwScllQYIuN3QJ73B0bpObvWGIyXKEeITYDaCPoMWlcM/xXXe/ofp5F1bID1LFvie7GlC/PzGDtKo47DMXTvBRbWMUD187Up+cMkbtNDR+IXXj1X4ET0t0YQHqcuAFNq+Ed5O7bkLvA83ny6Bn2IKznD09JJ74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cr8wEHWw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760720364;
	bh=feGBSH+2FPW8RiZzt5iXLfzzn3H4XfpiElBqd1MMslQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=cr8wEHWwluzrlu8ydaKb3GDYLa9W2JOCXB95DJJixsx96FKkyqOFFH4WJQBIttEC4
	 0EKqS7f/nCxD83gEh76P8F/mdDNJ8TfRqn3va4wgm27vPJ28gPKtfbRTiVtYpbKziD
	 epH0a8rLj01p3+vGXrq4/TBTG8yVOejtRdQT8kjeVAU7sS1AoCI/XqjZxxENb9LptR
	 P1N6eGej0tQr07n5/KdhU14dON5DAQlob7QUsQ29/+gy8lBkL8amHr/ODFZ1rlB2Qd
	 aJglx+2DYJg9GDolkAQcyp89CJLrGz+QggpV2fbgcY72vNRtC8pxUF2TFjVgZd80K3
	 b4oZ4j8q0SGow==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A771317E00AC
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 18:59:23 +0200 (CEST)
Message-ID: <7bdf1daadf12eb407246f13d77cb116cdfd47536.camel@collabora.com>
Subject: Re: [GIT PULL FOR 6.19]
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Fri, 17 Oct 2025 12:59:22 -0400
In-Reply-To: <b35589145aa05c0c103d2c1d2b9758f9177327d7.camel@collabora.com>
References: <b35589145aa05c0c103d2c1d2b9758f9177327d7.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-6IsH6iQHpFzXV8DpLemt"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6IsH6iQHpFzXV8DpLemt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 17 octobre 2025 =C3=A0 12:49 -0400, Nicolas Dufresne a =C3=A9cr=
it=C2=A0:
> Hi Mauro, Hans,
>=20
> This pull request contains a collection of bug fixes in various codec dri=
vers
> and an improved validation of AV1 sequence parameters.

Sorry for the bad subject, sent a v2 with a subject, you can ignore this on=
e.

Nicolas

>=20
> cheers,
> Nicolas
>=20
> ---
>=20
> The following changes since commit 082b86919b7a94de01d849021b4da820a6cb89=
dc:
>=20
> =C2=A0 media: v4l2-mem2mem: Fix outdated documentation (2025-10-14 15:07:=
37 +0200)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://gitlab.freedesktop.org/linux-media/users/ndufresne.git=C2=
=A0tags/for-
> 6.19-media-codec-fixes-2025-10-17
>=20
> for you to fetch changes up to 60d4fac49415810bd4d07b18570065999e318a7b:
>=20
> =C2=A0 media: allegro: fix race conditions in channel handling (2025-10-1=
6 09:32:55
> -0400)
>=20
> ----------------------------------------------------------------
> Various CODEC bug fixes
>=20
> ----------------------------------------------------------------
> Chen-Yu Tsai (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mediatek: vcodec: Use spinlock for =
context list protection lock
>=20
> Haoxiang Li (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: mediatek: vcodec: Fix a reference l=
eak in
> mtk_vcodec_fw_vpu_init()
>=20
> Johan Hovold (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: platform: mtk-mdp3: fix device leak=
s at probe
>=20
> Matthias Fend (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: print warning if channel c=
reation timeout occurs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: process all pending status=
 mbox messages
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: allegro: fix race conditions in cha=
nnel handling
>=20
> Ming Qian (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: amphion: Remove vpu_vb_is_codecconf=
ig
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: amphion: Cancel message work before=
 releasing the VPU core
>=20
> Nicolas Dufresne (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: Fix CPU stalls on G2 b=
us error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: verisilicon: Protect G2 HEVC decode=
r against invalid DPB index
>=20
> Pavan Bobba (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: v4l2-ctrls: add full AV1 profile va=
lidation in
> validate_av1_sequence()
>=20
> =C2=A0drivers/media/platform/allegro-dvt/allegro-core.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 114
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
> +++++++++++++-----------------------
> =C2=A0drivers/media/platform/amphion/vpu_malone.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 23
> +++--------------------
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16
> +++-------------
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 ---
> -------
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 14
> ++++++++++++++
> =C2=A0drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c=
=C2=A0=C2=A0 |=C2=A0 14
> +++++++++-----
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=
 |=C2=A0 12
> +++++++-----
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=
 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5
> +++--
> =C2=A0drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c=
 |=C2=A0 12
> +++++++-----
> =C2=A0drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h=
 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5
> +++--
> =C2=A0drivers/media/platform/verisilicon/hantro_g2.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 88
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----=
-----
> ----------
> =C2=A0drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 17
> +++++++++++++----
> =C2=A0drivers/media/platform/verisilicon/hantro_g2_regs.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 13
> +++++++++++++
> =C2=A0drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 --
> =C2=A0drivers/media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/verisilicon/imx8m_vpu_hw.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 ++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 125
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++
> ++++++++++++++++++++++-------------------------
> =C2=A019 files changed, 340 insertions(+), 137 deletions(-)

--=-6IsH6iQHpFzXV8DpLemt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPJ16gAKCRDZQZRRKWBy
9Ke8AP96Y1HHDUUhNsU7/d0ORAalnEym6mIUzaUZhrrJXtVyWwEA7p6MO5XWOI3i
g4pqRex753H2S8yDfPwW97AG76Wfvgo=
=WjWu
-----END PGP SIGNATURE-----

--=-6IsH6iQHpFzXV8DpLemt--

