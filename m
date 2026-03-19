Return-Path: <linux-media+bounces-56368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BjMBqNKvGknwgIAu9opvQ
	(envelope-from <linux-media+bounces-56368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:12:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E5D2D1936
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 621EF300E165
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCB03793B1;
	Thu, 19 Mar 2026 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QhZ36kcg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFCD30EF82
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773947550; cv=none; b=j5Bf5ZSHxlyL5eU9qGzbFMQentB9CVh8te9JYCPiyPy2vF+V8rh0/cCD/LVcGS6mDiczi9RdjOVzXC8loh31Vjm2pGKxa8ODVca4dEhOcD7x64/vKKrtqaJhDPOsE3MUrrVVkzJy+YwifdMvOZUNoSJxN5qTetXIAKGNmfICR24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773947550; c=relaxed/simple;
	bh=uVWxePcRdp0/Zs8HlV4UUtLltOa/S286Chd7tvM6Whc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KjRkWrFcGnZduu3/13H7wS238tcx63c3D30+pl02nU8xUe+Z0HtSiQh2cXZrxrVrEzIRN1SH9x4f/zKicLFz94kWbhkiGT1ZINe9uIg/YWZp6UEu/wyhtX9BuX8d+Sl6X6dBgXQoFJ2zVNqluh8Wy32cImHIvbV8kr/S3YnPmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QhZ36kcg; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89c5340fed0so13451766d6.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773947548; x=1774552348; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r1LNLkE6o0tWIJ/OijIEt3qH5udkliSvAis8enwUuN4=;
        b=QhZ36kcg6KJre7Uo+R1NI1YFw5jpoz9RuQJvfb+cIA9jeznEWgl59dDvuSZ8tKRTOF
         a5CXjPytj7JHoTtwbQ0McoU+RXznvV++xPbwqr+6Hjvs/xQnQ+xYHUB3Bx/kRrqtvDvX
         FDC0iqo48ywNYUAA5ixJYq1ucuz2nrgOS3Fi04rI0mYoXiD/rml+1BZ73CkfMhqL6x1Y
         26L8lkj7pe65eOH4rXVAuWpCziFWlNljDjqkukmnIFAdFfiJAExBzxOsSYs2T39iuf40
         cJ28qFxPaSEL3Er+HFUBcIMVjanIddWDvi/jrpsKD4QdL9OgK9pn8I02kD/S9i0m2uWm
         xyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773947548; x=1774552348;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1LNLkE6o0tWIJ/OijIEt3qH5udkliSvAis8enwUuN4=;
        b=Xh8gGhWs7VK6nyzZnKCND/IuMv7reEJiCJTLWAK1TYtZyhXGVDOIz6hWz0K9q7vJAC
         PmE1YKqKH/HbHeB7rbyOd9LEqrZY6THPYFJvE3aAsRrHJEWNMViW10y9zKMlixLaosJ7
         wodkTREL11D1iRVeD/7FaIPCMEjfNZMkmFS1JLzqPwCfWJ434TxGlCnLEQGBwRGe7k7Z
         p67hglkaEv4MlFDYKwR0gn3maUT4DT80eebjN2hX8P88Uv2+j24dAe7J++URVQJl62fJ
         jisoQbEIrC0APPR1nJDjh/JaV2tvp5iJFFoF05dnJXVbvI/9WPQTnysB41UlMhHJH7Bn
         Hzfw==
X-Gm-Message-State: AOJu0YwsX1am5k+38BYbDupm0JKwUciu/9TC/hNHaDW3owfA4j0Vaxm9
	+GY+xsRBt2Mbs3rFz1uiZaHxk0wgGTTewVYMsjh4ln+LAJUlnem/deiid7iwRmNOs4A=
X-Gm-Gg: ATEYQzyRhfzqKDOU/X8vFW5zDoAA4+B7N4K5Pt3Uqj//mJc3QyBCHyBiMl2JPpDQQSV
	WASjVdiEN/hE2hLbcMsXQ6zUoaJqIGIkK7OgY4txqVQ6bOH3BtuWrQv0/Pg32Sg4X5N5BnUdk9V
	9TvAOf9quy8woL5qAoS23IkF55OMGHNv7Vc0JAG2jOv5GHcuss6phgQAFMgwBZxUXJenyAecas8
	RpAP50WemiCCOveOuHXQ06jZKhxft+lAYDJuy361oru2fTJa6FiXtEDuRsl7d5Gz1rCftp19ASI
	aHG8eRGHf73K2x1+f5dI0RfkkYilyq1iTEUErzmpfPKfHxJTeiId6VJhm0fvVQ8Fcyjn9+x8220
	1VGxuZqRp68AEjnrWBko3OZl8V1DwylrprhuAKkjxq9Ca91DC3sEMHGc0e4st6aZC+MHCUFtDXC
	w4mut/doAwGqhDWthw/QDCGx1J62To
X-Received: by 2002:a05:6214:5f0e:b0:89c:4d59:bdf with SMTP id 6a1803df08f44-89c773d7d3cmr61987166d6.8.1773947547996;
        Thu, 19 Mar 2026 12:12:27 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8536ba60sm3331256d6.44.2026.03.19.12.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:12:27 -0700 (PDT)
Message-ID: <06b733be91f0b6455fc5c16832678a67d9de1945.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/27] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Thu, 19 Mar 2026 15:12:25 -0400
In-Reply-To: <20260127-spu-rga3-v3-5-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-5-77b273067beb@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-YSpqXCMYz4unuMVeMzx3"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56368-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 87E5D2D1936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-YSpqXCMYz4unuMVeMzx3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
> specify a custom stride alignment in bytes. This is necessary for
> hardware like the Rockchip RGA3, which requires the stride value to be
> aligned to a 16 bytes boundary.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 45 ++++++++++++++++++++++++=
+----------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A02 files changed, 37 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 2b5ccedeb6841..e61506ead9150 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -431,14 +431,15 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_stride(const struct v4=
l2_format_info *info, int plane,
> -						=C2=A0=C2=A0=C2=A0 unsigned int width)
> +						=C2=A0=C2=A0=C2=A0 unsigned int width, u8 byte_alignment)
> =C2=A0{
> =C2=A0	unsigned int hdiv =3D plane ? info->hdiv : 1;
> =C2=A0	unsigned int aligned_width =3D
> =C2=A0		ALIGN(width, v4l2_format_block_width(info, plane));
> =C2=A0
> -	return DIV_ROUND_UP(aligned_width, hdiv) *
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp[plane] / info->bpp_div[p=
lane];
> +	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
> +			=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp_div[plane],
> +		=C2=A0=C2=A0=C2=A0=C2=A0 byte_alignment);
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_height(const struct v4=
l2_format_info *info, int plane,
> @@ -452,9 +453,10 @@ static inline unsigned int v4l2_format_plane_height(=
const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_size(const struct v4l2=
_format_info *info, int plane,
> -						=C2=A0 unsigned int width, unsigned int height)
> +						=C2=A0 unsigned int width, unsigned int height,
> +						=C2=A0 u8 stride_alignment)
> =C2=A0{
> -	return v4l2_format_plane_stride(info, plane, width) *
> +	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_format_plane_height(info=
, plane, height);
> =C2=A0}
> =C2=A0
> @@ -475,8 +477,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
height,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> =C2=A0
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment)
> =C2=A0{
> =C2=A0	const struct v4l2_format_info *info;
> =C2=A0	struct v4l2_plane_pix_format *plane;
> @@ -493,23 +496,41 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt,
> =C2=A0
> =C2=A0	if (info->mem_planes =3D=3D 1) {
> =C2=A0		plane =3D &pixfmt->plane_fmt[0];
> -		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +		/*
> +		 * In case of multiple planes the stride of the other planes
> +		 * is derived from the y stride. To avoid breaking the stride
> +		 * alignment for the non y plane, multiply it by 2.
> +		 */
> +		if (info->comp_planes > 1)
> +			stride_alignment *=3D 2;

This generalization does not seem right for NV12, or YUV444 formats. Perhap=
s
move the correction down into v4l2_format_plane_stride() implementation. It
already have code for scaling the stride, maybe it can be leverage to pre-s=
cale
the alignment.

Nicolas

> +		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0		plane->sizeimage =3D 0;
> =C2=A0
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0			plane->sizeimage +=3D
> -				v4l2_format_plane_size(info, i, width, height);
> +				v4l2_format_plane_size(info, i, width, height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0	} else {
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++) {
> =C2=A0			plane =3D &pixfmt->plane_fmt[i];
> =C2=A0			plane->bytesperline =3D
> -				v4l2_format_plane_stride(info, i, width);
> +				v4l2_format_plane_stride(info, i, width,
> +							 stride_alignment);
> =C2=A0			plane->sizeimage =3D plane->bytesperline *
> =C2=A0				v4l2_format_plane_height(info, i, height);
> =C2=A0		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
> +
> +int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +			u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> +					=C2=A0=C2=A0 width, height, 1);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> =C2=A0
> =C2=A0int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelforma=
t,
> @@ -529,12 +550,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> =C2=A0	pixfmt->width =3D width;
> =C2=A0	pixfmt->height =3D height;
> =C2=A0	pixfmt->pixelformat =3D pixelformat;
> -	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width, 1);
> =C2=A0	pixfmt->sizeimage =3D 0;
> =C2=A0
> =C2=A0	for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0		pixfmt->sizeimage +=3D
> -			v4l2_format_plane_size(info, i, width, height);
> +			v4l2_format_plane_size(info, i, width, height, 1);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 401d8506c24b5..edd416178c333 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,=
 u32 pixelformat,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height);
> =C2=A0int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 =
pixelformat,
> =C2=A0			u32 width, u32 height);
> +/* @stride_alignment is a power of 2 value in bytes */
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment);
> =C2=A0
> =C2=A0/**
> =C2=A0 * v4l2_get_link_freq - Get link rate from transmitter

--=-YSpqXCMYz4unuMVeMzx3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxKmQAKCRDZQZRRKWBy
9AicAQC2kxYDBl49pgCzY7V2crCovY7JdWUNcNxML7TuCyI+6wD/VtaSm1mNxep9
nIXndGUv8JfuXrxAFbJoAMPIRp++3QA=
=OHGz
-----END PGP SIGNATURE-----

--=-YSpqXCMYz4unuMVeMzx3--

