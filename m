Return-Path: <linux-media+bounces-41283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE40B3AA33
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 20:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604993BE094
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE62278771;
	Thu, 28 Aug 2025 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GSaH+mvR"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333126B2A6;
	Thu, 28 Aug 2025 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406751; cv=none; b=elcFo75fII+TkN/GxucLG9vxFdgHiwUQ2agHwr8GgXnR8HkYjTPawK76f7ErqCSeUrXXtIaiCnGy7q4zyl9t0M5u8guaJPnWH4wVXBqa4E/X3gcMZ553yxTkMZ/LFLtreDfaHAqENcQQdO0pyUU6nJEo3Gr80JjJVhigkPyscSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406751; c=relaxed/simple;
	bh=//Upra/X2Pbl23/cwYHGyyFdIDag/vCHd2kVf6DOrxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TnXG4MPoAnFFLBgOtCe+G1nx2Xi/7GvYpqbVk6naICwVmJmglAOQZaoQG08DBJBNmteMMyk0sHGvsBDolV79aRN6uUwaSScY/4QeBLQyonWOWGqvMh1KAqxQSZk3XWivnfXQtBkObhIYGrJonmvw9qKFxO3catJ/Eno91ugHH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GSaH+mvR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756406746;
	bh=//Upra/X2Pbl23/cwYHGyyFdIDag/vCHd2kVf6DOrxg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GSaH+mvRR7lt4BTMAGS4bChGVOccfoL0HGsMeji6UhICY0GO1qbrfXM75N1RyAEQy
	 CNty/TlD+Eqnn10SWid41ZJcSacyMGVLcM/7amTNbmPUBqEqeK2hqd0scaeH01cYkz
	 oPuGAMEYYcRj00hxkfa8xvERa6oF0tOTNtLQFBqV89dnWNEJ4wB3KT7POs1zJoMCEB
	 Y1b3RsNrWsVAoQNuFMu1NmUzLSWKSMWNTObBXQ6aaeFyak499PpnqqEc+lmhc7RB2P
	 o0ShqcRW6DzfUpuk0b9L9pg/P26rJwlvJbsD2tf47p4SeePCFELepXXkn2oXqqHbjg
	 CtlemsxlUlH9Q==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E014817E1259;
	Thu, 28 Aug 2025 20:45:45 +0200 (CEST)
Message-ID: <a44e8e04903edac00cf1a6d8304b2c9433b25ba1.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] media: uapi: Move colorimetry controls at the
 end of the file
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 28 Aug 2025 14:45:42 -0400
In-Reply-To: <20250824180735.765587-2-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
	 <20250824180735.765587-2-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-GntifHjHFo+uE3nWfLj3"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-GntifHjHFo+uE3nWfLj3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> The colorimetry controls class is defined after the stateless codec
> class at the top of the controls header. It is currently defined in
> the middle of stateless codec controls.
>=20
> Move the colorimetry controls after the stateless codec controls,
> at the end of the file.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/uapi/linux/v4l2-controls.h | 68 +++++++++++++++------------=
---
> =C2=A01 file changed, 34 insertions(+), 34 deletions(-)
>=20
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index f836512e9deb..4a483ff1c418 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2549,40 +2549,6 @@ struct v4l2_ctrl_hevc_scaling_matrix {
> =C2=A0	__u8	scaling_list_dc_coef_32x32[2];
> =C2=A0};
> =C2=A0
> -#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY
> | 0x900)
> -#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
> -
> -#define
> V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
> -
> -struct v4l2_ctrl_hdr10_cll_info {
> -	__u16 max_content_light_level;
> -	__u16 max_pic_average_light_level;
> -};
> -
> -#define
> V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_=
BASE +1)
> -
> -#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
> -#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
> -#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
> -#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
> -#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
> -#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
> -#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
> -#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
> -#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
> -#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
> -#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
> -#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
> -
> -struct v4l2_ctrl_hdr10_mastering_display {
> -	__u16 display_primaries_x[3];
> -	__u16 display_primaries_y[3];
> -	__u16 white_point_x;
> -	__u16 white_point_y;
> -	__u32 max_display_mastering_luminance;
> -	__u32 min_display_mastering_luminance;
> -};
> -
> =C2=A0/* Stateless VP9 controls */
> =C2=A0
> =C2=A0#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
> @@ -3515,4 +3481,38 @@ struct v4l2_ctrl_av1_film_grain {
> =C2=A0#define V4L2_CID_MPEG_MFC51_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 V4L2_CID_CODEC_MFC51_BASE
> =C2=A0#endif
> =C2=A0
> +#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY
> | 0x900)
> +#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
> +
> +#define
> V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
> +
> +struct v4l2_ctrl_hdr10_cll_info {
> +	__u16 max_content_light_level;
> +	__u16 max_pic_average_light_level;
> +};
> +
> +#define
> V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_=
BASE +1)
> +
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
> +#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
> +#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
> +#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
> +
> +struct v4l2_ctrl_hdr10_mastering_display {
> +	__u16 display_primaries_x[3];
> +	__u16 display_primaries_y[3];
> +	__u16 white_point_x;
> +	__u16 white_point_y;
> +	__u32 max_display_mastering_luminance;
> +	__u32 min_display_mastering_luminance;
> +};
> +
> =C2=A0#endif

--=-GntifHjHFo+uE3nWfLj3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLCj1wAKCRDZQZRRKWBy
9NbRAP9SJ+CQdKYlBASaUM6wrL9UH/xeYoYhaH8K0/LfLuaPQgD/WHIU2B18YI3f
nvHSH5giTNnqK0NLeeASLGpGD3eLUgM=
=Skjj
-----END PGP SIGNATURE-----

--=-GntifHjHFo+uE3nWfLj3--

