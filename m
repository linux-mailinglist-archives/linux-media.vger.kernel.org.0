Return-Path: <linux-media+bounces-49506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFFCDD098
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 20:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67EE2302B127
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 19:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F92333D6CF;
	Wed, 24 Dec 2025 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Dj/GpVJb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E32E4274
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766604306; cv=none; b=sXGj4NuFSq/4NTrAWwEyr8Kz0ZwHfifsYH7fZqbOfzseaQJur4k8DMyJ8aye6O+TuwBdkAX2XWA9akk9ROq3V8rS7xRUZSs/O0UPNsfIVSyyek52EMKrgulP6KwgSer0cgMFO67iOg2J5mGePdeaAMEivQl5quDAipeHDQSuymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766604306; c=relaxed/simple;
	bh=K5HU1Mj4GKYzyBYiOLADWWgfwEWGDJNoFvlsuFzcmG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0tQHIkVXuOIKKK2YPJTSAqxrDHjrgQ+/6ZZZ7nf8fKNCA981FqxvTcMdUUQG0ecSsjGBfnFJqIOqERnCWUAHuYiH+tlVUvgGHy/57sbLRjovJOOdcmk94iihqImh+QL8ysGjvtcOrkRhfVqWUIdTo4D6NFz6iVGN1zFhpRJ5PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Dj/GpVJb; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2d7c38352so715412885a.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 11:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604302; x=1767209102; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EcC2/wRdvVVn4EBbf9oNqdQI8h7Pk69qNBD1NEvRhAo=;
        b=Dj/GpVJbZURTUUOHtQjqvGHiolYO7R4NUSxG9KgXlJ7XnXMBI8hwSXKebQRJAzpF6u
         Z6oRxsZ6PpgtqhDedVwHv98N23AoezmAYW1+TBTlJBTChsXGzVjBa0u1vn42Q7bO+P/x
         w0SA+HnmUyzzGrpMSRELYK9lK1KHWuegztoliFoEC+1ACje0cxfy8UPv30qQ0cR6V66B
         MIaQcOux+lEFEZPg6as34NBpJqt0eS9VxLddPXsNn3thb8x3LF/3qgoFjlylLW7cFOlb
         /sdVsQCTg6bVOwyQ4w/L/gZoWjTufjiIJc9kAfY0g0Ak/ihHJ4Mf8jaxEx2LsEAeLG7H
         c9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604302; x=1767209102;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcC2/wRdvVVn4EBbf9oNqdQI8h7Pk69qNBD1NEvRhAo=;
        b=MVR5jx39/VQ6p3TjhTuM3Zr9YTJ8ArwAHDCFD4sYiNXeuiKyjTyyeItN03P9+pASg/
         WN2Jk2h1kcE+In5A4SJvA2NBE7vDg6VOIiT3F73mkTEUopZhqPFGUHVDixmJ9GmUS0Mj
         oAt7jUDoRrj13w9P0QFq1D3M74/WBnVkJ1OHR8Qfob6rx1zGQ/3ywIyyjzkwnqqE4nks
         h4m9sGqlQoogLThF3An6tFHAP0cbtfyY1SwNFgONcxW8deWEW+u6rejFHw5l4VtJwDtB
         6nj+WbW/uEIs9cTVPFopOaECV9nUYyWflPOJt4xmXvwWkQrEWM/VH9UVdxo/ySSFhjMT
         jSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWP0bTu2aidKbyWhdFWj+Yxh3YscfNbEFXHzphQ2vbczLncMeRaTP+ejYV8hhL/DyxNEGYv047a4oGZfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb96esRmR0KO9irZz3yJI+zfOEoWxrrIJN9h+xBfMvFHi/vqUa
	2Zs4HuHsM/fL1Vcb1q1AKQgvCB48KYw/MKObBm9+hS12sVehGU85UC3IlLmNIfSjLF8=
X-Gm-Gg: AY/fxX7GkPFRUnT/m9QCA643OLEDpAp2P9Kgq0qyre2gmiTKKyF68f/KHhIv8DCWj4k
	F8flDOjj8a1bTzFlnYpruUb9GRxZT1C+2L1mcHmHLeUvPYKyDqMz8BMnInd+JYD02cEL/7h/aIH
	0y/pz5vnX8i9Qis3rUGLLOrv6EnbhLh8Lvyfw6KWIureDDsm/vq/2G5BgFlNIwyHSBJ16KS8WaX
	DKpWDOTotNjhAGcr2BUDlFI4FBGHnfsU8zP2tEOD9utULJLSkZfCzuaGwg/5815/ePhKuln0EcW
	OQFScHHcqWitTDlUIVcXJpiKG/Wj/kDdMVTLj2y/h4Vd0aEYkIoN7zHrJ1kWqHPnYmnF89ew2IF
	uVcpI+XzRVKmrv+ollFVVj8FWQBinUeAgTbixzLvhlMMtwGxTxX/5gEpU6BD6341sM8zuOSlkh0
	CDRogTZ+aXc2BsGHhS
X-Google-Smtp-Source: AGHT+IHz8XgMTn76ZHlPpnpvAj1H6/tJW+eqYOQ1q/VE3zGtKMA6q+I33ugOdqv7oLXVyELPXYLVCg==
X-Received: by 2002:a05:620a:831b:b0:8c1:7bc9:3aa5 with SMTP id af79cd13be357-8c17bc940d8mr713344385a.0.1766604302282;
        Wed, 24 Dec 2025 11:25:02 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783662sm1421044985a.5.2025.12.24.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:25:01 -0800 (PST)
Message-ID: <8d5952b87a1456b2b2203b6321888a16980d7a8b.camel@ndufresne.ca>
Subject: Re: [PATCH v4 3/3] media: amphion: Trigger source change if
 colorspace changed
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 24 Dec 2025 14:24:59 -0500
In-Reply-To: <20251217030227.1546-4-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
	 <20251217030227.1546-4-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-e7Chkxp9Nxc1QldT920F"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-e7Chkxp9Nxc1QldT920F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le mercredi 17 d=C3=A9cembre 2025 =C3=A0 11:02 +0800, ming.qian@oss.nxp.com=
 a =C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> After encountering a colorspace change in the stream, the decoder
> sends a V4L2_EVENT_SOURCE_CHANGE event with changes set to
> V4L2_EVENT_SRC_CH_RESOLUTION.
>=20
> Then the client can detect and handle the colorspace change without any
> buffer reallocation
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 61 =
+++++++++++++++--------
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c |=C2=A0 1 -
> =C2=A02 files changed, 40 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index f25dbcebdccf..beeaf75c76b4 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -950,7 +950,7 @@ static void vdec_stop_done(struct vpu_inst *inst)
> =C2=A0	vpu_inst_unlock(inst);
> =C2=A0}
> =C2=A0
> -static bool vdec_check_source_change(struct vpu_inst *inst)
> +static bool vdec_check_source_change(struct vpu_inst *inst, struct vpu_d=
ec_codec_info *hdr)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0	const struct vpu_format *sibling;
> @@ -962,26 +962,35 @@ static bool vdec_check_source_change(struct vpu_ins=
t *inst)
> =C2=A0		return false;
> =C2=A0
> =C2=A0	sibling =3D vpu_helper_find_sibling(inst, inst->cap_format.type, i=
nst->cap_format.pixfmt);
> -	if (sibling && vdec->codec_info.pixfmt =3D=3D sibling->pixfmt)
> -		vdec->codec_info.pixfmt =3D inst->cap_format.pixfmt;
> +	if (sibling && hdr->pixfmt =3D=3D sibling->pixfmt)
> +		hdr->pixfmt =3D inst->cap_format.pixfmt;
> =C2=A0
> =C2=A0	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))
> =C2=A0		return true;
> -	if (inst->cap_format.pixfmt !=3D vdec->codec_info.pixfmt)
> +	if (inst->cap_format.pixfmt !=3D hdr->pixfmt)
> =C2=A0		return true;
> -	if (inst->cap_format.width !=3D vdec->codec_info.decoded_width)
> +	if (inst->cap_format.width !=3D hdr->decoded_width)
> =C2=A0		return true;
> -	if (inst->cap_format.height !=3D vdec->codec_info.decoded_height)
> +	if (inst->cap_format.height !=3D hdr->decoded_height)
> =C2=A0		return true;
> =C2=A0	if (vpu_get_num_buffers(inst, inst->cap_format.type) < inst->min_b=
uffer_cap)
> =C2=A0		return true;
> -	if (inst->crop.left !=3D vdec->codec_info.offset_x)
> +	if (inst->crop.left !=3D hdr->offset_x)
> =C2=A0		return true;
> -	if (inst->crop.top !=3D vdec->codec_info.offset_y)
> +	if (inst->crop.top !=3D hdr->offset_y)
> =C2=A0		return true;
> -	if (inst->crop.width !=3D vdec->codec_info.width)
> +	if (inst->crop.width !=3D hdr->width)
> =C2=A0		return true;
> -	if (inst->crop.height !=3D vdec->codec_info.height)
> +	if (inst->crop.height !=3D hdr->height)
> +		return true;
> +	if (!hdr->progressive)
> +		return true;
> +
> +	if (vdec->seq_hdr_found &&
> +	=C2=A0=C2=A0=C2=A0 (hdr->color_primaries !=3D vdec->codec_info.color_pr=
imaries ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->transfer_chars !=3D vdec->codec_info.tran=
sfer_chars ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->matrix_coeffs !=3D vdec->codec_info.matri=
x_coeffs ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0 hdr->full_range !=3D vdec->codec_info.full_ran=
ge))
> =C2=A0		return true;
> =C2=A0
> =C2=A0	return false;
> @@ -1333,20 +1342,25 @@ static void vdec_event_seq_hdr(struct vpu_inst *i=
nst, struct vpu_dec_codec_info
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0
> =C2=A0	vpu_inst_lock(inst);
> -	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
> =C2=A0
> -	vpu_trace(inst->dev, "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d\n",
> +	vpu_trace(inst->dev,
> +		=C2=A0 "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d, colorspace: %d,=
 %d, %d, %d\n",
> =C2=A0		=C2=A0 inst->id,
> -		=C2=A0 vdec->codec_info.decoded_width,
> -		=C2=A0 vdec->codec_info.decoded_height,
> -		=C2=A0 vdec->codec_info.offset_x,
> -		=C2=A0 vdec->codec_info.offset_y,
> -		=C2=A0 vdec->codec_info.width,
> -		=C2=A0 vdec->codec_info.height,
> +		=C2=A0 hdr->decoded_width,
> +		=C2=A0 hdr->decoded_height,
> +		=C2=A0 hdr->offset_x,
> +		=C2=A0 hdr->offset_y,
> +		=C2=A0 hdr->width,
> +		=C2=A0 hdr->height,
> =C2=A0		=C2=A0 hdr->num_ref_frms,
> -		=C2=A0 hdr->num_dpb_frms);
> +		=C2=A0 hdr->num_dpb_frms,
> +		=C2=A0 hdr->color_primaries,
> +		=C2=A0 hdr->transfer_chars,
> +		=C2=A0 hdr->matrix_coeffs,
> +		=C2=A0 hdr->full_range);
> =C2=A0	inst->min_buffer_cap =3D hdr->num_ref_frms + hdr->num_dpb_frms;
> -	vdec->is_source_changed =3D vdec_check_source_change(inst);
> +	vdec->is_source_changed =3D vdec_check_source_change(inst, hdr);
> +	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
> =C2=A0	vdec_init_fmt(inst);
> =C2=A0	vdec_init_crop(inst);
> =C2=A0	vdec_init_mbi(inst);
> @@ -1375,7 +1389,12 @@ static void vdec_event_resolution_change(struct vp=
u_inst *inst)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0
> -	vpu_trace(inst->dev, "[%d]\n", inst->id);
> +	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequ=
ence : %d\n",
> +		=C2=A0 inst->id,
> +		=C2=A0 vdec->params.frame_count,
> +		=C2=A0 vdec->decoded_frame_count,
> +		=C2=A0 vdec->display_frame_count,
> +		=C2=A0 vdec->sequence);
> =C2=A0	vpu_inst_lock(inst);
> =C2=A0	vdec->seq_tag =3D vdec->codec_info.tag;
> =C2=A0	vdec_clear_fs(&vdec->mbi);
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..121165a7184f 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -102,7 +102,6 @@ static int vpu_notify_eos(struct vpu_inst *inst)
> =C2=A0int vpu_notify_source_change(struct vpu_inst *inst)
> =C2=A0{
> =C2=A0	static const struct v4l2_event ev =3D {
> -		.id =3D 0,
> =C2=A0		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> =C2=A0		.u.src_change.changes =3D V4L2_EVENT_SRC_CH_RESOLUTION
> =C2=A0	};

--=-e7Chkxp9Nxc1QldT920F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUw+DAAKCRDZQZRRKWBy
9CCgAQCJEcF67WbJCFUJ9LDCkCSQrAPnJ5AUlW1B1MtmPrdnyQD/bln376ZTtTKz
q3xQG4oYSaWKF3oR8duW1S5G/Fz0fwc=
=B805
-----END PGP SIGNATURE-----

--=-e7Chkxp9Nxc1QldT920F--

