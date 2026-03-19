Return-Path: <linux-media+bounces-56388-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sME9LaRovGlQyQIAu9opvQ
	(envelope-from <linux-media+bounces-56388-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:20:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6952D29B0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7256F316C493
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD89C3AF673;
	Thu, 19 Mar 2026 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o3xTMww0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ABC3AEF5F;
	Thu, 19 Mar 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955144; cv=none; b=NprJVi6EBEVo++aBFFkepMQd39K13W6I36WwTTV7jarK2fmczEMkQAH5PdhZ/BYZbFLJ4hIOjmx0D65ndaFtbSBQqyU3sSO8bVO2d/rZi/LM2bYi2s2SqM/rznXP8OKsJ0M6BGimma1NogWlV7bKAHC5cCqcBaeykHFFfXVO9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955144; c=relaxed/simple;
	bh=hJgFRt/WPwZDJe3OaMRuks0sjPNx8HcH0bxKQhXQzVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s70tTAvIJpiXBeVbWqqY9eiMNaaGUz1z1XUu5HlGNRQLUyVw0fQS3fl4PE5AFoRI0SJV308Rv6qIvaSH/vlO+au0uVqmpWfaDsD7p9nugBn+9p+ytlykUQJO8WXz5x2DtjRvy0yzIJcGmz26AyWzE0vjjAaFhlT39dBVm686feI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o3xTMww0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773955140;
	bh=hJgFRt/WPwZDJe3OaMRuks0sjPNx8HcH0bxKQhXQzVw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=o3xTMww0CtEGlHd2BF8eqmw/U1ua7kx0ESy5nsZsiifAKmaZEfICt4/arMrHi+ysD
	 /OvhP2hbDkJJaENwU8ZKT/KY2IVyXIJbeUOy8TYPyOdqyhR3ZBVB+lDPN6uxwkJSAC
	 mWtU1N8+6//4li5YPh0hwPYejaOdht9zUVcQfbN4usuF27PiG5jfJmSDlr3G49zfwR
	 SSi5OMffBlnzjsUZIzZV+Il5B5DvY06gDIzESNsKjSyst0c8S9n807FwCm4pc1b/7w
	 WllkRFY+zVBQxShKIWq/BAfRTBt5oZwyZ+HVc+cD1ovMzfoye3bU41+gwuWdFYfEj9
	 5cr1jbtEoBLng==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D02D717E0ECE;
	Thu, 19 Mar 2026 22:18:58 +0100 (CET)
Message-ID: <153125d1c7021e84b6d165a799b5c0e628a7a774.camel@collabora.com>
Subject: Re: [PATCH v0 3/3] media: chips-media: wave5: Add Support for
 Packed YUV422 Formats
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Thu, 19 Mar 2026 17:18:57 -0400
In-Reply-To: <20260319053210.90-4-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
	 <20260319053210.90-4-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-JJpfnELRynE3oz/s3lrq"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56388-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 1D6952D29B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-JJpfnELRynE3oz/s3lrq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 19 mars 2026 =C3=A0 14:32 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Wave5 encoder is capable of reading in numerous raw pixel formats.
> Expose these formats and properly configure encoder if selected.
>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/chips-media/wave5/wave5-helper.h |=C2=A0 2 +-
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++
> =C2=A02 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.h
> index d61fdbda359d..e6f241012c3b 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> @@ -11,7 +11,7 @@
> =C2=A0#include "wave5-vpu.h"
> =C2=A0
> =C2=A0#define FMT_TYPES	2
> -#define MAX_FMTS	12
> +#define MAX_FMTS	16
> =C2=A0
> =C2=A0const char *state_to_str(enum vpu_instance_state state);
> =C2=A0void wave5_cleanup_instance(struct vpu_instance *inst, struct file =
*filp);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f315ed7243a7..b24c65f174ea 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -90,6 +90,22 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES]=
[MAX_FMTS] =3D {
> =C2=A0			.v4l2_pix_fmt =3D V4L2_PIX_FMT_NV61M,
> =C2=A0			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> =C2=A0		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YUYV,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_YVYU,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_UYVY,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> +		{
> +			.v4l2_pix_fmt =3D V4L2_PIX_FMT_VYUY,
> +			.v4l2_frmsize =3D &enc_frmsize[VPU_FMT_TYPE_RAW],
> +		},
> =C2=A0	}
> =C2=A0};
> =C2=A0
> @@ -1161,6 +1177,22 @@ static int wave5_set_enc_openparam(struct enc_open=
_param *open_param,
> =C2=A0	else
> =C2=A0		open_param->src_format =3D FORMAT_420;
> =C2=A0
> +	switch (info->format) {
> +	case V4L2_PIX_FMT_YUYV:
> +		open_param->packed_format =3D PACKED_YUYV;
> +		break;
> +	case V4L2_PIX_FMT_YVYU:
> +		open_param->packed_format =3D PACKED_YVYU;
> +		break;
> +	case V4L2_PIX_FMT_UYVY:
> +		open_param->packed_format =3D PACKED_UYVY;
> +		break;
> +	case V4L2_PIX_FMT_VYUY:
> +		open_param->packed_format =3D PACKED_VYUY;
> +		break;
> +	default:
> +		break;
> +	}
> =C2=A0	open_param->wave_param.gop_preset_idx =3D PRESET_IDX_IPP_SINGLE;
> =C2=A0	open_param->wave_param.hvs_qp_scale =3D 2;
> =C2=A0	open_param->wave_param.hvs_max_delta_qp =3D 10;

--=-JJpfnELRynE3oz/s3lrq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxoQQAKCRDZQZRRKWBy
9PLyAP96JSXGKiZxZaxvJE0BoY0rQHrQvofX2yWuY5rUWUO9QQEA8nkC6Rt+Hs68
+saAVjHQ8imq3lZPDQC8UK7Xyt5lTwI=
=G9Tt
-----END PGP SIGNATURE-----

--=-JJpfnELRynE3oz/s3lrq--

