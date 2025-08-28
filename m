Return-Path: <linux-media+bounces-41285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E1B3AA3D
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 20:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F51B7BA686
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AD5272E74;
	Thu, 28 Aug 2025 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L4MtUq57"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C781D26F2AF;
	Thu, 28 Aug 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406814; cv=none; b=YFqeGzbm059txh7Ts4oUFsf8GYvBdIg05b9oTef2szbmcJmm5LUwCU9+XITUMGUsNkR/2+Y22GVYTjyk7xDpIGBI1W2IMfCCzAE0MxQnoxjZqiGhHbiA8JNWBSxhtA5meJTyZ9aGURoJ39fvYR5DALS7FgS+wc9K3FjS9LT9v0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406814; c=relaxed/simple;
	bh=NiOs9m72QVC8+H9yXY0SO0iEkIg09FGrfMBPJT6zQIw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uZVijeucz+OKlTHxq9gk28FqtvpFnWgDsintKoDiqvUdkanUATgJj2OUnv+SZHEPXkBz5qgAIljAmjoSkO1YhmwjzMusC5LYb1ig6h9rAO4+P2rdh0MKLSl4svQDPpxrHIqiLhCnBHI/ckDD0U34OODasFuv9RwYGDhKQNBkj1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L4MtUq57; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756406811;
	bh=NiOs9m72QVC8+H9yXY0SO0iEkIg09FGrfMBPJT6zQIw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L4MtUq57cs5BOTK9aDW3QnQ7fnQ9SuQFziZbzY8k1EE4dJd/kQPNozNzV4vQ0BIqt
	 v+ukeRzakIkzLxxjXZ6n9llCMiWKIUA0TK3wgxb5cr3q7fTd45S6l2SS4vnQ3wUHMg
	 C/vYq0+FAD+PG7GO04HNt5QI3RInsEla+yhOSRHzs4t9nc/LR7OQH1bPAPCJB2uqgp
	 2S6bRDg2Cc+72RoLh2A4smv+xBW/0wM/0rFMsBzP84Zk337Vb1AwFcYJFyE+ljCDS1
	 WV2KrhsWWNz2QbOsT2LQVF+Y9KCS5aNlBMjqUFtyWgoxMheIa6cTlC18PcpLm67spN
	 Fov9xs4Aq2uVg==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65FA217E046C;
	Thu, 28 Aug 2025 20:46:50 +0200 (CEST)
Message-ID: <8d4a5e5b61a5dad935d1d72f98641a6edf52c43a.camel@collabora.com>
Subject: Re: [PATCH v2 3/4] media: uapi: v4l2-controls: Cleanup codec
 definitions
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 28 Aug 2025 14:46:48 -0400
In-Reply-To: <20250824180735.765587-4-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
	 <20250824180735.765587-4-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-gpDBc0ZO2wC/a4nYEiYr"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-gpDBc0ZO2wC/a4nYEiYr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 ao=C3=BBt 2025 =C3=A0 20:07 +0200, Paul Kocialkowski a =C3=
=A9crit=C2=A0:
> Move some fields closer to where they are used, add missing tabs
> and remove an extra newline.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/uapi/linux/v4l2-controls.h | 23 +++++++++++------------
> =C2=A01 file changed, 11 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-
> controls.h
> index 7aef88465d04..2d30107e047e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1537,15 +1537,6 @@ struct v4l2_ctrl_h264_pred_weights {
> =C2=A0	struct v4l2_h264_weight_factors weight_factors[2];
> =C2=A0};
> =C2=A0
> -#define V4L2_H264_SLICE_TYPE_P				0
> -#define V4L2_H264_SLICE_TYPE_B				1
> -#define V4L2_H264_SLICE_TYPE_I				2
> -#define V4L2_H264_SLICE_TYPE_SP				3
> -#define V4L2_H264_SLICE_TYPE_SI				4
> -
> -#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
> -#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
> -
> =C2=A0#define V4L2_H264_TOP_FIELD_REF				0x1
> =C2=A0#define V4L2_H264_BOTTOM_FIELD_REF			0x2
> =C2=A0#define V4L2_H264_FRAME_REF				0x3
> @@ -1566,8 +1557,17 @@ struct v4l2_h264_reference {
> =C2=A0 * Maximum DPB size, as specified by section 'A.3.1 Level limits
> =C2=A0 * common to the Baseline, Main, and Extended profiles'.
> =C2=A0 */
> -#define V4L2_H264_NUM_DPB_ENTRIES 16
> -#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
> +#define V4L2_H264_NUM_DPB_ENTRIES		16
> +#define V4L2_H264_REF_LIST_LEN			(2 *
> V4L2_H264_NUM_DPB_ENTRIES)
> +
> +#define V4L2_H264_SLICE_TYPE_P				0
> +#define V4L2_H264_SLICE_TYPE_B				1
> +#define V4L2_H264_SLICE_TYPE_I				2
> +#define V4L2_H264_SLICE_TYPE_SP				3
> +#define V4L2_H264_SLICE_TYPE_SI				4
> +
> +#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED		0x01
> +#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH			0x02
> =C2=A0
> =C2=A0#define
> V4L2_CID_STATELESS_H264_SLICE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 6)
> =C2=A0/**
> @@ -1707,7 +1707,6 @@ struct v4l2_ctrl_h264_decode_params {
> =C2=A0	__u32 flags;
> =C2=A0};
> =C2=A0
> -
> =C2=A0/* Stateless FWHT control, used by the vicodec driver */
> =C2=A0
> =C2=A0/* Current FWHT version */

--=-gpDBc0ZO2wC/a4nYEiYr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLCkGQAKCRDZQZRRKWBy
9IhLAP9+Kl1KvWFy8AICGADxsy717zWGsfMSXOOSo2z5gOSjNAD/RRODrY6Mgbuw
HxaSUv9DQrkeKA35nyOaYR03wk2EDQ8=
=UPfF
-----END PGP SIGNATURE-----

--=-gpDBc0ZO2wC/a4nYEiYr--

