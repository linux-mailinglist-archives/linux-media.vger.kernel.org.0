Return-Path: <linux-media+bounces-39440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62707B20C26
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43254190331D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2451A25742F;
	Mon, 11 Aug 2025 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qejlhNE+"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2223B23A99D
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923010; cv=none; b=UqB56eYpUh49Kj+65WQh8inkWwACGt++KuIhxkjR/2k9M/3mPpFRLersJOxNyBCtnPjPGWOjG4ZQu9+4oHL/iMg00+x7fLI7VTxIgaf9gKldrzbNDfYJXKBxtfdcuCga2doWzhV7vhR9a7qM32c0OA/Q2e0hb57M/V9zicFHnqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923010; c=relaxed/simple;
	bh=76iwY8ZuIgwxFmVF2Z9+bPEyNiUKqcaNH5/RH6UKYug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZRuqSHK9++vo1Odvk2JMQnCp8agFfp2a1unY3pB9YNXz2mxeLv5lYdnnsZiCixxePENOvAGdB3PyhXn0CU5s3P393X5XoB6FfAgF5hQr1JlPOSiMFJaMd21BTTduM9CyLe5FBv8BruyxUe3d/w56Exko7Mj8c8+/ncZ1cyCf2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qejlhNE+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754923005;
	bh=76iwY8ZuIgwxFmVF2Z9+bPEyNiUKqcaNH5/RH6UKYug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qejlhNE+RoBfYnA+8m4TKo3/rc7kBrqMUfSLeIPFYyd1fCE8lE9h4NBYPa/50TJQw
	 VOlnrcN9BITvUCmUTZpK84IgXf291DpJkpf3c1JOMPWAn9PBO0kKjhXLIFym9ftIM6
	 556f5yXc411dNnqIAL1jyPm1zOl/Fb2GpS9GEmYvCjEKlnfHAo/5Z8FM1+OpszE7G/
	 J9P43a0X1ZwI7NdK6z3oY8ZRIZV/2SJnEUdUm9DdhoJJL4k7naeVwEs1KwwAwgughg
	 lEjRteox28w6FlU6UgNrFhMHVYyNYxAMEnCQOjQ9d3jmSWypHkvY+dqFBOlyjT7edy
	 jkOk+vp2E7H6w==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4689417E0C87;
	Mon, 11 Aug 2025 16:36:44 +0200 (CEST)
Message-ID: <ab8d8470e9bcc9532d48ccd3287cf242e790dcad.camel@collabora.com>
Subject: Re: [PATCH v3 62/76] media: hantro: Access v4l2_fh from
 file->private_data
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil	
 <hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-rockchip@lists.infradead.org
Date: Mon, 11 Aug 2025 10:36:43 -0400
In-Reply-To: <20250810013100.29776-63-laurent.pinchart+renesas@ideasonboard.com>
References: 
	<20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
	 <20250810013100.29776-63-laurent.pinchart+renesas@ideasonboard.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-OXBfOomi8BZGUmxwnrx0"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-OXBfOomi8BZGUmxwnrx0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 10 ao=C3=BBt 2025 =C3=A0 04:30 +0300, Laurent Pinchart a =C3=A9=
crit=C2=A0:
> To prepare for the introduction of video_device_state as second argument
> of the v4l2_ioctl_ops handler, access the v4l2_fh from
> file->private_data instead of using void *priv.
>=20
> The file->private_data is initialized to point to the v4l2_fh
> by the usage of v4l2_fh_init() in the v4l2_file_operations.open()
> handler.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


> ---
> Changes since v1:
>=20
> - Update file-to-ctx macro due to removal of fh-to-ctx macro
> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 7 +=
-----
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0 | 22 +++++++++--=
--------
> =C2=A02 files changed, 12 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h
> b/drivers/media/platform/verisilicon/hantro.h
> index 5b85c8a44706..e0fdc4535b2d 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -382,14 +382,9 @@ extern int hantro_debug;
> =C2=A0	pr_err("%s:%d: " fmt, __func__, __LINE__, ##args)
> =C2=A0
> =C2=A0/* Structure access helpers. */
> -static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct hantro_ctx, fh);
> -}
> -
> =C2=A0static __always_inline struct hantro_ctx *file_to_ctx(struct file *=
filp)
> =C2=A0{
> -	return fh_to_ctx(file_to_v4l2_fh(filp));
> +	return container_of(file_to_v4l2_fh(filp), struct hantro_ctx, fh);
> =C2=A0}
> =C2=A0
> =C2=A0/* Register accessors. */
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 7c3515cf7d64..6bcd892e7bb4 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -185,7 +185,7 @@ static int vidioc_querycap(struct file *file, void *p=
riv,
> =C2=A0static int vidioc_enum_framesizes(struct file *file, void *priv,
> =C2=A0				=C2=A0 struct v4l2_frmsizeenum *fsize)
> =C2=A0{
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0	const struct hantro_fmt *fmt;
> =C2=A0
> =C2=A0	fmt =3D hantro_find_format(ctx, fsize->pixel_format);
> @@ -217,7 +217,7 @@ static int vidioc_enum_fmt(struct file *file, void *p=
riv,
> =C2=A0			=C2=A0=C2=A0 struct v4l2_fmtdesc *f, bool capture)
> =C2=A0
> =C2=A0{
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0	const struct hantro_fmt *fmt, *formats;
> =C2=A0	unsigned int num_fmts, i, j =3D 0;
> =C2=A0	bool skip_mode_none, enum_all_formats;
> @@ -297,7 +297,7 @@ static int vidioc_g_fmt_out_mplane(struct file *file,=
 void
> *priv,
> =C2=A0				=C2=A0=C2=A0 struct v4l2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0
> =C2=A0	vpu_debug(4, "f->type =3D %d\n", f->type);
> =C2=A0
> @@ -310,7 +310,7 @@ static int vidioc_g_fmt_cap_mplane(struct file *file,=
 void
> *priv,
> =C2=A0				=C2=A0=C2=A0 struct v4l2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0
> =C2=A0	vpu_debug(4, "f->type =3D %d\n", f->type);
> =C2=A0
> @@ -398,13 +398,13 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
> =C2=A0static int vidioc_try_fmt_cap_mplane(struct file *file, void *priv,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *f)
> =C2=A0{
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_try_fmt_out_mplane(struct file *file, void *priv,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *f)
> =C2=A0{
> -	return hantro_try_fmt(fh_to_ctx(priv), &f->fmt.pix_mp, f->type);
> +	return hantro_try_fmt(file_to_ctx(file), &f->fmt.pix_mp, f->type);
> =C2=A0}
> =C2=A0
> =C2=A0static void
> @@ -648,19 +648,19 @@ static int hantro_set_fmt_cap(struct hantro_ctx *ct=
x,
> =C2=A0static int
> =C2=A0vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_=
format *f)
> =C2=A0{
> -	return hantro_set_fmt_out(fh_to_ctx(priv), &f->fmt.pix_mp,
> HANTRO_AUTO_POSTPROC);
> +	return hantro_set_fmt_out(file_to_ctx(file), &f->fmt.pix_mp,
> HANTRO_AUTO_POSTPROC);
> =C2=A0}
> =C2=A0
> =C2=A0static int
> =C2=A0vidioc_s_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_=
format *f)
> =C2=A0{
> -	return hantro_set_fmt_cap(fh_to_ctx(priv), &f->fmt.pix_mp);
> +	return hantro_set_fmt_cap(file_to_ctx(file), &f->fmt.pix_mp);
> =C2=A0}
> =C2=A0
> =C2=A0static int vidioc_g_selection(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_selection *sel)
> =C2=A0{
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0
> =C2=A0	/* Crop only supported on source. */
> =C2=A0	if (!ctx->is_encoder ||
> @@ -691,7 +691,7 @@ static int vidioc_g_selection(struct file *file, void
> *priv,
> =C2=A0static int vidioc_s_selection(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_selection *sel)
> =C2=A0{
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0	struct v4l2_rect *rect =3D &sel->r;
> =C2=A0	struct vb2_queue *vq;
> =C2=A0
> @@ -738,7 +738,7 @@ static const struct v4l2_event hantro_eos_event =3D {
> =C2=A0static int vidioc_encoder_cmd(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_encoder_cmd *ec)
> =C2=A0{
> -	struct hantro_ctx *ctx =3D fh_to_ctx(priv);
> +	struct hantro_ctx *ctx =3D file_to_ctx(file);
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ret =3D v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);

--=-OXBfOomi8BZGUmxwnrx0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJn/+wAKCRBxUwItrAao
HEv2AJ0WNpp8XKQutm5U36TvGiQp1CyIvQCgonsta1h8f3lgUQ3RZ/9DLy0ob5E=
=P6MX
-----END PGP SIGNATURE-----

--=-OXBfOomi8BZGUmxwnrx0--

