Return-Path: <linux-media+bounces-60980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBWRFm9T/mntpAAAu9opvQ
	(envelope-from <linux-media+bounces-60980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:19:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2C4FBD90
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 23:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 904C53047267
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 21:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E653D5228;
	Fri,  8 May 2026 21:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Byh7ckd6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020AB3A5E97
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 21:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275131; cv=none; b=rUBq/EBWjunu2gTqMz9EVr66izFHXahAFs5qbJXwW9sHMXuYvEhvJPh9Y8uo6DefKtinRhsQ1ZDDV1zY8H91WpnAKtlWf8CLpJ5ivM0bRocvBvC2wmKwANhz/w5Trh5GHn3EmLom4iShu4ONBbGjrWFRGhMC5zZbNKTA1/ivNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275131; c=relaxed/simple;
	bh=pbYkC9CrvM7jp5u9cfMSxAZ5Nm/n21DNkpcPKeg8DmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XMayf5YbRhcAhPgKLRxcwNHGJWAhPtlAZjUyUzlcp5fjpWwcXhAHoHD1hvMYYtuTp4/7cEdrI5DKuYx76zWwhZYWfpLUD9go/L9NCLMzWDCBPE/kaUjEO6UYDYRNZomPY9a5f7tcwiz+nYZMur0YM5tgs+sbe6JXMzlRWz7NnQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Byh7ckd6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-512f750d4b2so18842001cf.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778275129; x=1778879929; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NuDyd+pdDE/YN+9KZpt+S8gMDx02yjwA/CK1DnFyXwo=;
        b=Byh7ckd6cUehWwYn85WI63for43yII7h//sMOeV1rV4ifZjWQyQENyB9kBJboLgjpU
         3rkxPZQBE0PcjSS2vyRiK1EALulTpNi0mzRM3HxMkdLexoyIeNWX5XNpy8Uuk04ho7el
         cKIz39PCrsLKYE9ZnvMvuTk3SxTZC+bisMP0pbQHSsukAaJwD0RLi+e6xosOhV1kZPT3
         Pyze887yoDYu7HvFXyOMLoTMn/N+ALYoQ9GI0YuJR+y8p3/8ogLgQaAZIn5kqdB5vbZI
         SplggRI6qUsyyBqfnSGeoxl5758ex7eKJKuFMr0Em5hM1lLYN/YoFx7Q4KvKmGQZGTkq
         lCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275129; x=1778879929;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuDyd+pdDE/YN+9KZpt+S8gMDx02yjwA/CK1DnFyXwo=;
        b=IU7oDqbYq4VLu1gPOuu5cJlRfTX1rj3yH6ss7SVaecD/FXdFDTy8ibnBQUXCPAKszf
         KivYyHSLYG8DXGk3tgjry+w7MTjvLscsgTKPRVtnuDeiHSMyq3+4S+t1Q3VpcgNMiASQ
         Rs/Nw0pcvPRDmS8IgiuibuN8jDSEmXdUTby3NAVVZ8dHI78JsqRa2cupvIiLD2SElKvE
         UYnGLypP7bEG7qgeKv/m7sLyWzhtVvZlmiH97bX96ol1SXwVLL3BWcbuIU6kQuLJ9lQY
         vGyrn2USL3000Ejb3jJIbhuBhenVnGGs5bVeWv9POfSNLhQfDPuCgDcg835YvXX6feB4
         DZdg==
X-Gm-Message-State: AOJu0YyE8ic3TY/oNJvoCrfQe395Ka/OGHHERavo1UhKQsPG27sIktzS
	BTNcGjcr5fF1GXL/kMkfYHd3+Gqk9kkE1+0N0pjcsWDkyn2p9DK+lTGOiPlbH/971cM=
X-Gm-Gg: AeBDieuio/W1x+AtkpFJ79vgbcBDJCvKyYYWNmmAR2mXd3Tzhwak2uMAnmX2y9D33I7
	eJhizVHEhyJvhwjBLsNdugXi7C7X0OZ7UWxPbbAKwlkRi0RgTC/R7WWoKmOsQ5dT4HndhrYidrn
	Yo82NiXT+j/U1FUW21gJxt1WgOXi6oNEqWtOjijcH+WKrS3OiQApjmRrwRukI8ab4dlHPIdyXrq
	ipjDHtT6dtqHph0HmvxF9ZN0qFsNoNayJU/8NcvM0poC3DQ5sK88Cfj+OQIbZFEUF7IpvOdeblc
	0CkxxlPrqoQE6gtxHH/XsaSf0ZPdVpEzq7NWP3w2BPXg4lcEyQb+SfKpSm9CGP4ZTS9bv0NA4+r
	GsUtVW/0EXm67aJEK9PTvqrtmW8EBdvFpHn7GsrCEWoxmGuMS/ecoS+DLDPwjWynagiGeUC8SmN
	dJd+hqHDrwFmQVQH01lj1uZsw18KWCleBTFD8b930=
X-Received: by 2002:a05:622a:4d4e:b0:50b:5336:1d20 with SMTP id d75a77b69052e-514621d5127mr196554381cf.53.1778275128704;
        Fri, 08 May 2026 14:18:48 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c7600sm28019116d6.1.2026.05.08.14.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:18:47 -0700 (PDT)
Message-ID: <4f5e481c8883b358ee4cef64f26f3f00f0ac7304.camel@ndufresne.ca>
Subject: Re: [PATCH v5 12/29] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Fri, 08 May 2026 17:18:46 -0400
In-Reply-To: <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-12-eb7f5d019d86@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-qZ2RVVDen/K+BWJk4jzk"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: ECD2C4FBD90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60980-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne.ca:mid,collabora.com:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-qZ2RVVDen/K+BWJk4jzk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
>=20
> This requirement is documented explicitly for the RGA3 in=C2=A0 section 5=
.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index f599c992829dd..77b8c7ab74274 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize =3D {
> +		.min_width =3D hw->min_width,
> +		.max_width =3D hw->max_width,
> +		.min_height =3D hw->min_height,
> +		.max_height =3D hw->max_height,
> +		.step_width =3D 1,
> +		.step_height =3D 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width =3D 2;
> +		frmsize.step_height =3D 2;

I think its fine like this, so let's start with:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

But it does not feel like a hardware alignment to me. When we process in
software these things, the minimum alignment is bound to the subsampling, s=
ince
there is no way to store half or quarter pixels, the padded width/height
requires a step that follow the subsampling, something like:

		frmsize.step_width =3D finfo->hdiv;
		frmsize.step_height =3D finfo->vdiv;

Nicolas


> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frms=
ize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-qZ2RVVDen/K+BWJk4jzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5TNgAKCRDZQZRRKWBy
9K22AP9NA5svkOS4YL++qXSzMq8kynIFrKCnDRWKeJx++AbT9AD/dLvKF5HRQ8Cf
i9PlqWBZXkzVLS+1T8+GiOLpb3UFXAQ=
=85ga
-----END PGP SIGNATURE-----

--=-qZ2RVVDen/K+BWJk4jzk--

