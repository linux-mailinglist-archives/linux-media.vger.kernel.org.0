Return-Path: <linux-media+bounces-42466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB164B553C4
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 17:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6077EAC68BE
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 15:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA033128D9;
	Fri, 12 Sep 2025 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C2sHicwt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA2A1DDC2A;
	Fri, 12 Sep 2025 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757691429; cv=none; b=dAwU8OnfQYTVKHF4FeDV5d1z5nYCUdtfMwgeKsdagl0TMWpkjFRp3vy1yC3I1557LJsZZOE6JclJDIYjKAv8a4FbDRofC7f53fA/JxUGt8f8wbmepj/zT+DAO25xI3N+0wQdJWQCIWqPgAQhYpQyPdS2fhC5BnNQl6x3NXbRBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757691429; c=relaxed/simple;
	bh=DL31K34KsytLR2IDDwKhdpvf/53LPLSI2+gMKo6rpBA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lV39EZZlqGZNPrc/qjIXMNpMbDNgifcEuN8QRdIqrobng1cEp14ULJlecpa6noed3U8rpNpEhH8UkyG2rQZeC6Rbvse55bpDs/KHde3fMufoSMqCY+UrBdDt86eL1j1HNTsc3Zjktr0oPLjBGDkdilTsP0W8PwpK94W1tkH4DT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C2sHicwt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757691425;
	bh=DL31K34KsytLR2IDDwKhdpvf/53LPLSI2+gMKo6rpBA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=C2sHicwt+MkWtRAvxqPLtfqOgENsZRZi5SlpLUGZyfl32h3Bg4Dp0AeFee/clXvv5
	 B7s87224ZyE+/WgLxHvxjt+pqyomLmge5qVM9tiLAc/DakfpAeJdjmV36J/+OzRSAn
	 oD6smi1EJL2ZwdsJ3+3FCbA5cQsp5IzjXDuWWTWc4bsq0G3JM/BaMCGU/HPuqEtf1b
	 G1ETKRAsHvACbLuCTaOhtyzClJgED1hhaPRbXrr4VLEBrHzVscnL2AE4NxqT4fXY+p
	 cBXP16ERVEr+KnhN0ubkqH1KwkumQTR6NCzNOU9SEL2o6de7aQQuxIQXil7rn/UkPk
	 JyG9BDIVBZEhw==
Received: from [IPv6:2606:6d00:10:aee0::c41] (unknown [IPv6:2606:6d00:10:aee0::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C769017E127C;
	Fri, 12 Sep 2025 17:37:03 +0200 (CEST)
Message-ID: <cbab615b1b17ce869cf2359c6a16f54afb17802e.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2-ctrls: add full AV1 profile validation in
 validate_av1_sequence()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pavan Bobba <opensource206@gmail.com>, mchehab@kernel.org, 
	hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, 	yunkec@google.com,
 sakari.ailus@linux.intel.com, james.cowgill@blaize.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 12 Sep 2025 11:37:01 -0400
In-Reply-To: <20250912131459.6833-1-opensource206@gmail.com>
References: <20250912131459.6833-1-opensource206@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-HiGWKv5DX8Jxhi11f2oJ"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-HiGWKv5DX8Jxhi11f2oJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 septembre 2025 =C3=A0 18:44 +0530, Pavan Bobba a =C3=A9crit=
=C2=A0:
> The AV1 stateless decoder API provides the control
> V4L2_CID_STATELESS_AV1_SEQUENCE to pass sequence header parameters
> from userspace. The current validator only checked that seq_profile
> =E2=89=A4 2 and that monochrome was not signaled in profile 1.
>=20
> This patch completes the "TODO: PROFILES" by enforcing all
> profile-specific constraints as defined by the AV1 specification
> (Section 5.5.2, "Color config syntax"):
>=20
> - Profile 0: 8/10-bit only, 4:2:0 subsampling, no monochrome
> - Profile 1: 8/10-bit only, 4:4:4 only, no monochrome
> - Profile 2: 8/10/12-bit, 4:2:0 / 4:2:2 / 4:4:4 allowed, monochrome allow=
ed
>=20
> Additionally, when the MONO_CHROME flag is set:
> - subsampling_x and subsampling_y must both be 1
> - separate_uv_delta_q must be 0
>=20
> These checks prevent userspace from providing invalid AV1 sequence
> headers that would otherwise be accepted, leading to undefined
> driver or hardware behavior.
>=20
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>

The changes looks good and seems safer. I will have to run some tests to ma=
ke
sure we don't regress anything. About your commit message, there is a push =
to
make things more imperative, so that would mean reformatting to the followi=
ng
and dropping the first paragraph:

   Complete the "TODO: PROFILES" by enforcing all profile-specific constrai=
nts
   as defined by the AV1 specification (Section 5.5.2, "Color config syntax=
"):
  =20
   - Profile 0: 8/10-bit only, 4:2:0 subsampling, no monochrome
   - Profile 1: 8/10-bit only, 4:4:4 only, no monochrome
   - Profile 2: 8/10/12-bit, 4:2:0 / 4:2:2 / 4:4:4 allowed, monochrome allo=
wed
  =20
   Additionally, when the MONO_CHROME flag is set:
   - subsampling_x and subsampling_y must both be 1
   - separate_uv_delta_q must be 0
  =20
   These checks prevent userspace from providing invalid AV1 sequence
   headers that would otherwise be accepted, leading to undefined
   driver or hardware behavior.

If you are fine with this change I can apply. Otherwise please include my R=
b in
your v2.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 54 ++++++++++++++++++++=
+--
> =C2=A01 file changed, 50 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-
> core/v4l2-ctrls-core.c
> index 98b960775e87..3283ed04cc36 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -852,14 +852,60 @@ static int validate_av1_sequence(struct
> v4l2_ctrl_av1_sequence *s)
> =C2=A0	 V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	if (s->seq_profile =3D=3D 1 && s->flags &
> V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
> -		return -EINVAL;
> -
> =C2=A0	/* reserved */
> =C2=A0	if (s->seq_profile > 2)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* TODO: PROFILES */
> +	/* Profile-specific checks */
> +	switch (s->seq_profile) {
> +	case 0:
> +		/* Bit depth: 8 or 10 */
> +		if (s->bit_depth !=3D 8 && s->bit_depth !=3D 10)
> +			return -EINVAL;
> +
> +		/* Subsampling must be 4:2:0 =E2=86=92 x=3D1, y=3D1 */
> +		if (!(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
> +		=C2=A0=C2=A0=C2=A0 !(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
> +			return -EINVAL;
> +		break;
> +
> +	case 1:
> +		/* Monochrome is forbidden in profile 1 */
> +		if (s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME)
> +			return -EINVAL;
> +
> +		/* Bit depth: 8 or 10 */
> +		if (s->bit_depth !=3D 8 && s->bit_depth !=3D 10)
> +			return -EINVAL;
> +
> +		/* Subsampling must be 4:4:4 =E2=86=92 x=3D0, y=3D0 */
> +		if ((s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
> +		=C2=A0=C2=A0=C2=A0 (s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
> +			return -EINVAL;
> +		break;
> +
> +	case 2:
> +		/* Bit depth: 8, 10, or 12 */
> +		if (s->bit_depth !=3D 8 && s->bit_depth !=3D 10 &&
> +		=C2=A0=C2=A0=C2=A0 s->bit_depth !=3D 12)
> +			return -EINVAL;
> +
> +		/* Subsampling: 4:2:0, 4:2:2, or 4:4:4 allowed =E2=86=92 no extra
> check */
> +		break;
> +	}
> +
> +	/* If monochrome flag is set, enforce spec rules */
> +	if (s->flags & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME) {
> +		/* Must signal subsampling_x=3D1, subsampling_y=3D1 */
> +		if (!(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X) ||
> +		=C2=A0=C2=A0=C2=A0 !(s->flags & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y))
> +			return -EINVAL;
> +
> +		/* separate_uv_delta_q must be 0 in monochrome */
> +		if (s->flags & V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q)
> +			return -EINVAL;
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

--=-HiGWKv5DX8Jxhi11f2oJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMQ+HQAKCRDZQZRRKWBy
9EvLAQD7uo3zVzpkovi8tBM87e5/tqplVA+VuHJyqLGXfPtFhwEApdJLhG5HxKR8
sqQZHfWYpWtAeEuG8jynR2C7OncyCQA=
=ohXd
-----END PGP SIGNATURE-----

--=-HiGWKv5DX8Jxhi11f2oJ--

