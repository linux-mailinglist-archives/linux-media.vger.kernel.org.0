Return-Path: <linux-media+bounces-48597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4131CB3FE0
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4F81302D903
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C322305E01;
	Wed, 10 Dec 2025 20:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V0vvu9T8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294815624B;
	Wed, 10 Dec 2025 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399651; cv=none; b=Zeoj86Z5XctWtAzJfkqcNetjcPRtUula07zYrQzD16E/8pS2sqv1exwj/O8qElboBa+lnAg64ojmP2e2mW1rYDuVw4qwlPnLGGK7D1Qj/lpjm89YyGYHO5linQ7kE7MqdJJ87sjaVN/Dp4yVgvT2SXMglf3HhjpqU+mrqYKqPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399651; c=relaxed/simple;
	bh=Qv07xC9vCeh7/Zm3t445eHka2wwv6Sk3M0NWCOOm92E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9q1vY7njEk+PZpVt/Jl5yvnsN3vM9+/Sl5u8Vg87Ck1Ds0/xIEcWNdFwvbO1x2PdepgI93N446+KVQvg4OeC2sDfunCEYmuI2OsL9j1DBcM2a8FS+14RWogvfOdINt0en1aUcA5Xpaw99BWDwUTZ3P3ck7oB3CWSB3Tl7/3LzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V0vvu9T8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765399646;
	bh=Qv07xC9vCeh7/Zm3t445eHka2wwv6Sk3M0NWCOOm92E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V0vvu9T8yaPuh29PdsqK0hIJFD7CASFIlEajF1JjdBI9N0ZYDcGUCz6HE6bILSQXY
	 ivfDAc2AGrvyKYkF1haIcGWCwvyXsgAa8mdbp9XLqZnxeAgtfkMxUuMlQDsRqnJTV+
	 pXGuyW+k1kDbdkUIReocpvsFTb9UDqhCZKVNbNDooWDGhTtOBQXDlJUeWOBaEylhGp
	 KBT8Tfe/UzVboZmuSKVjhHrHYOdNyERafVE1ULPmJJZVmWR9lLcm40mMQlL1LmQQxV
	 lROWjTnT6Y33mwqzDOe/UhglIqwPcCuUCFoABEo93Hnuk2EuxiqcjM3jUKbxpwHihO
	 +eJQT62hdVNsg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B99C17E1104;
	Wed, 10 Dec 2025 21:47:24 +0100 (CET)
Message-ID: <8f7468a242b13ca1ea8f618e40bfb58f0d7950af.camel@collabora.com>
Subject: Re: [PATCH v4 15/15] media: rkvdec: Add HEVC support for the
 VDPU383 variant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Wed, 10 Dec 2025 15:47:23 -0500
In-Reply-To: <20251022174508.284929-16-detlev.casanova@collabora.com>
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
	 <20251022174508.284929-16-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-/kyOZS9SoJk9P6XyChkm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-/kyOZS9SoJk9P6XyChkm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 octobre 2025 =C3=A0 13:45 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The VDPU383 decoder is used on the RK3576 SoC and has support for HEVC.
>=20
> This patch also moves some functions to a common rkvdec-hevc-common.c
> file and adds a specific scaling matrix flatten function.
>=20
> The fluster score for JCT-VC-HEVC_V1 is 146/147.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 60 +-
> =C2=A0.../rockchip/rkvdec/rkvdec-hevc-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu383-hevc.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 690 ++++++++++++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0 94 =
++-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> =C2=A08 files changed, 804 insertions(+), 51 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vd=
pu383-hevc.c
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/me=
dia/platform/rockchip/rkvdec/Makefile
> index e30fdd7d51c3..e629d571e4d8 100644
> --- a/drivers/media/platform/rockchip/rkvdec/Makefile
> +++ b/drivers/media/platform/rockchip/rkvdec/Makefile
> @@ -11,4 +11,5 @@ rockchip-vdec-y +=3D \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu381-h264.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu381-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vdpu383-h264.o \
> +		=C2=A0=C2=A0 rkvdec-vdpu383-hevc.o \
> =C2=A0		=C2=A0=C2=A0 rkvdec-vp9.o
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 4b21b3ea67fd..8f1dc2d1e463 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -158,58 +158,25 @@ static void set_ref_poc(struct rkvdec_rps_short_ter=
m_ref_set *set, int poc, int
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -/*
> - * Flip one or more matrices along their main diagonal and flatten them
> - * before writing it to the memory.
> - * Convert:
> - * ABCD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AEIM
> - * EFGH=C2=A0=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 BFJN=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D>=C2=A0=C2=A0=C2=A0=C2=A0 AEIMBFJNCGKODHLP
> - * IJKL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CGKO
> - * MNOP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DHLP
> - */
> -static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
> -					=C2=A0=C2=A0 int matrices, int row_length)
> -{
> -	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_siz=
e, new_value;
> -
> -	matrix_size =3D row_length * row_length;
> -	for (i =3D 0; i < matrices; i++) {
> -		row =3D 0;
> -		x_offset =3D 0;
> -		matrix_offset =3D i * matrix_size;
> -		for (j =3D 0; j < matrix_size; j++) {
> -			y_offset =3D j - (row * row_length);
> -			rot_index =3D y_offset * row_length + x_offset;
> -			new_value =3D *(input + i * matrix_size + j);
> -			output[matrix_offset + rot_index] =3D new_value;
> -			if ((j + 1) % row_length =3D=3D 0) {
> -				row +=3D 1;
> -				x_offset +=3D 1;
> -			}
> -		}
> -	}
> -}
> -
> -static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_h=
evc_scaling_matrix *input)
> +static void assemble_scalingfactor0(struct rkvdec_ctx *ctx, u8 *output,
> +				=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_scaling_matrix *input=
)
> =C2=A0{
> +	const struct rkvdec_config *cfg =3D ctx->dev->variant->config;
> =C2=A0	int offset =3D 0;
> =C2=A0
> -	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_=
4x4, 6, 4);
> +	cfg->flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4=
);
> =C2=A0	offset =3D 6 * 16 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scal=
ing_list_8x8, 6, 8);
> +	cfg->flatten_matrices(output + offset, (const u8 *)input->scaling_list_=
8x8, 6, 8);
> =C2=A0	offset +=3D 6 * 64 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_16x16, 6, 8);
> +	cfg->flatten_matrices(output + offset, (const u8 *)input->scaling_list_=
16x16, 6, 8);
> =C2=A0	offset +=3D 6 * 64 * sizeof(u8);
> =C2=A0	/* Add a 128 byte padding with 0s between the two 32x32 matrices *=
/
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32, 1, 8);
> +	cfg->flatten_matrices(output + offset, (const u8 *)input->scaling_list_=
32x32, 1, 8);
> =C2=A0	offset +=3D 64 * sizeof(u8);
> =C2=A0	memset(output + offset, 0, 128);
> =C2=A0	offset +=3D 128 * sizeof(u8);
> -	transpose_and_flatten_matrices(output + offset,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list=
_32x32 + (64 * sizeof(u8)),
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, 8);
> +	cfg->flatten_matrices(output + offset,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const u8 *)input->scaling_list_32x32 =
+ (64 * sizeof(u8)), 1, 8);
> =C2=A0	offset +=3D 64 * sizeof(u8);
> =C2=A0	memset(output + offset, 0, 128);
> =C2=A0}
> @@ -232,16 +199,17 @@ static void assemble_scalingdc(u8 *output, const st=
ruct v4l2_ctrl_hevc_scaling_m
> =C2=A0	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
> =C2=A0}
> =C2=A0
> -static void translate_scaling_list(struct scaling_factor *output,
> +static void translate_scaling_list(struct rkvdec_ctx *ctx, struct scalin=
g_factor *output,
> =C2=A0				=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_scaling_matrix *input)
> =C2=A0{
> -	assemble_scalingfactor0(output->scalingfactor0, input);
> +	assemble_scalingfactor0(ctx, output->scalingfactor0, input);
> =C2=A0	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4=
, 96);
> =C2=A0	assemble_scalingdc(output->scalingdc, input);
> =C2=A0	memset(output->reserved, 0, 4 * sizeof(u8));
> =C2=A0}
> =C2=A0
> -void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
> +void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> +					=C2=A0 struct rkvdec_hevc_run *run,
> =C2=A0					=C2=A0 struct scaling_factor *scaling_list,
> =C2=A0					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache)
> =C2=A0{
> @@ -251,7 +219,7 @@ void rkvdec_hevc_assemble_hw_scaling_list(struct rkvd=
ec_hevc_run *run,
> =C2=A0		=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
> =C2=A0		return;
> =C2=A0
> -	translate_scaling_list(scaling_list, scaling);
> +	translate_scaling_list(ctx, scaling_list, scaling);
> =C2=A0
> =C2=A0	memcpy(cache, scaling,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct v4l2_ctrl_hevc_=
scaling_matrix));
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> index 0005b80bad79..c4947d2b983d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> @@ -99,7 +99,8 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *=
run, u16 log2_min_cb_size
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s32 pic_in_cts_height, u16 =
*column_width, u16 *row_height);
> =C2=A0void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struc=
t rkvdec_rps *rps,
> =C2=A0				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache);
> -void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
> +void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
> +					=C2=A0 struct rkvdec_hevc_run *run,
> =C2=A0					=C2=A0 struct scaling_factor *scaling_factor,
> =C2=A0					=C2=A0 struct v4l2_ctrl_hevc_scaling_matrix *cache);
> =C2=A0struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index 31a979698578..eb18f7c2bb0c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -546,7 +546,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0
> =C2=A0	rkvdec_hevc_run_preamble(ctx, &run);
> =C2=A0
> -	rkvdec_hevc_assemble_hw_scaling_list(&run, &tbl->scaling_list,
> +	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->scaling_matrix_cache);
> =C2=A0	assemble_hw_pps(ctx, &run);
> =C2=A0	assemble_sw_rps(ctx, &run);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> index 278f1dbf0910..0798d68f1af2 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -568,8 +568,7 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0		dev_warn_ratelimited(rkvdec->dev, "Long and short term RPS not se=
t\n");
> =C2=A0	}
> =C2=A0
> -	rkvdec_hevc_assemble_hw_scaling_list(&run,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 &tbl->scaling_list,
> +	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->scaling_matrix_cache);
> =C2=A0	assemble_hw_pps(ctx, &run);
> =C2=A0	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> new file mode 100644
> index 000000000000..ef29f0ee6c31
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -0,0 +1,690 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VDPU383 HEVC backend
> + *
> + * Copyright (C) 2025 Collabora, Ltd.
> + *=C2=A0 Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "rkvdec.h"
> +#include "rkvdec-rcb.h"
> +#include "rkvdec-hevc-common.h"
> +#include "rkvdec-vdpu383-regs.h"
> +
> +struct rkvdec_hevc_sps_pps {
> +	// SPS
> +	u16 video_parameters_set_id			: 4;
> +	u16 seq_parameters_set_id_sps			: 4;
> +	u16 chroma_format_idc				: 2;
> +	u16 width					: 16;
> +	u16 height					: 16;
> +	u16 bit_depth_luma				: 3;
> +	u16 bit_depth_chroma				: 3;
> +	u16 max_pic_order_count_lsb			: 5;
> +	u16 diff_max_min_luma_coding_block_size		: 2;
> +	u16 min_luma_coding_block_size			: 3;
> +	u16 min_transform_block_size			: 3;
> +	u16 diff_max_min_transform_block_size		: 2;
> +	u16 max_transform_hierarchy_depth_inter		: 3;
> +	u16 max_transform_hierarchy_depth_intra		: 3;
> +	u16 scaling_list_enabled_flag			: 1;
> +	u16 amp_enabled_flag				: 1;
> +	u16 sample_adaptive_offset_enabled_flag		: 1;
> +	u16 pcm_enabled_flag				: 1;
> +	u16 pcm_sample_bit_depth_luma			: 4;
> +	u16 pcm_sample_bit_depth_chroma			: 4;
> +	u16 pcm_loop_filter_disabled_flag		: 1;
> +	u16 diff_max_min_pcm_luma_coding_block_size	: 3;
> +	u16 min_pcm_luma_coding_block_size		: 3;
> +	u16 num_short_term_ref_pic_sets			: 7;
> +	u16 long_term_ref_pics_present_flag		: 1;
> +	u16 num_long_term_ref_pics_sps			: 6;
> +	u16 sps_temporal_mvp_enabled_flag		: 1;
> +	u16 strong_intra_smoothing_enabled_flag		: 1;
> +	u16 reserved0					: 7;
> +	u16 sps_max_dec_pic_buffering_minus1		: 4;
> +	u16 separate_colour_plane_flag			: 1;
> +	u16 high_precision_offsets_enabled_flag		: 1;
> +	u16 persistent_rice_adaptation_enabled_flag	: 1;
> +
> +	// PPS
> +	u16 picture_parameters_set_id			: 6;
> +	u16 seq_parameters_set_id_pps			: 4;
> +	u16 dependent_slice_segments_enabled_flag	: 1;
> +	u16 output_flag_present_flag			: 1;
> +	u16 num_extra_slice_header_bits			: 13;
> +	u16 sign_data_hiding_enabled_flag		: 1;
> +	u16 cabac_init_present_flag			: 1;
> +	u16 num_ref_idx_l0_default_active		: 4;
> +	u16 num_ref_idx_l1_default_active		: 4;
> +	u16 init_qp_minus26				: 7;
> +	u16 constrained_intra_pred_flag			: 1;
> +	u16 transform_skip_enabled_flag			: 1;
> +	u16 cu_qp_delta_enabled_flag			: 1;
> +	u16 log2_min_cb_size				: 3;
> +	u16 pps_cb_qp_offset				: 5;
> +	u16 pps_cr_qp_offset				: 5;
> +	u16 pps_slice_chroma_qp_offsets_present_flag	: 1;
> +	u16 weighted_pred_flag				: 1;
> +	u16 weighted_bipred_flag			: 1;
> +	u16 transquant_bypass_enabled_flag		: 1;
> +	u16 tiles_enabled_flag				: 1;
> +	u16 entropy_coding_sync_enabled_flag		: 1;
> +	u16 pps_loop_filter_across_slices_enabled_flag	: 1;
> +	u16 loop_filter_across_tiles_enabled_flag	: 1;
> +	u16 deblocking_filter_override_enabled_flag	: 1;
> +	u16 pps_deblocking_filter_disabled_flag		: 1;
> +	u16 pps_beta_offset_div2			: 4;
> +	u16 pps_tc_offset_div2				: 4;
> +	u16 lists_modification_present_flag		: 1;
> +	u16 log2_parallel_merge_level			: 3;
> +	u16 slice_segment_header_extension_present_flag	: 1;
> +	u16 reserved1					: 3;
> +
> +	// pps extensions
> +	u16 log2_max_transform_skip_block_size		: 2;
> +	u16 cross_component_prediction_enabled_flag	: 1;
> +	u16 chroma_qp_offset_list_enabled_flag		: 1;
> +	u16 log2_min_cu_chroma_qp_delta_size		: 3;
> +	u16 cb_qp_offset_list0				: 5;
> +	u16 cb_qp_offset_list1				: 5;
> +	u16 cb_qp_offset_list2				: 5;
> +	u16 cb_qp_offset_list3				: 5;
> +	u16 cb_qp_offset_list4				: 5;
> +	u16 cb_qp_offset_list5				: 5;
> +	u16 cb_cr_offset_list0				: 5;
> +	u16 cb_cr_offset_list1				: 5;
> +	u16 cb_cr_offset_list2				: 5;
> +	u16 cb_cr_offset_list3				: 5;
> +	u16 cb_cr_offset_list4				: 5;
> +	u16 cb_cr_offset_list5				: 5;
> +	u16 chroma_qp_offset_list_len_minus1		: 3;
> +
> +	/* mvc0 && mvc1 */
> +	u16 mvc_ff					: 16;
> +	u16 mvc_00					: 9;
> +
> +	/* poc info */
> +	u16 reserved2					: 3;
> +	u32 current_poc					: 32;
> +	u32 ref_pic_poc0				: 32;
> +	u32 ref_pic_poc1				: 32;
> +	u32 ref_pic_poc2				: 32;
> +	u32 ref_pic_poc3				: 32;
> +	u32 ref_pic_poc4				: 32;
> +	u32 ref_pic_poc5				: 32;
> +	u32 ref_pic_poc6				: 32;
> +	u32 ref_pic_poc7				: 32;
> +	u32 ref_pic_poc8				: 32;
> +	u32 ref_pic_poc9				: 32;
> +	u32 ref_pic_poc10				: 32;
> +	u32 ref_pic_poc11				: 32;
> +	u32 ref_pic_poc12				: 32;
> +	u32 ref_pic_poc13				: 32;
> +	u32 ref_pic_poc14				: 32;
> +	u32 reserved3					: 32;
> +	u32 ref_is_valid				: 15;
> +	u32 reserved4					: 1;
> +
> +	/* tile info*/
> +	u16 num_tile_columns				: 5;
> +	u16 num_tile_rows				: 5;
> +	u32 column_width0				: 24;
> +	u32 column_width1				: 24;
> +	u32 column_width2				: 24;
> +	u32 column_width3				: 24;
> +	u32 column_width4				: 24;
> +	u32 column_width5				: 24;
> +	u32 column_width6				: 24;
> +	u32 column_width7				: 24;
> +	u32 column_width8				: 24;
> +	u32 column_width9				: 24;
> +	u32 row_height0					: 24;
> +	u32 row_height1					: 24;
> +	u32 row_height2					: 24;
> +	u32 row_height3					: 24;
> +	u32 row_height4					: 24;
> +	u32 row_height5					: 24;
> +	u32 row_height6					: 24;
> +	u32 row_height7					: 24;
> +	u32 row_height8					: 24;
> +	u32 row_height9					: 24;
> +	u32 row_height10				: 24;
> +	u32 reserved5					: 2;
> +	u32 padding;
> +} __packed;
> +
> +struct rkvdec_hevc_priv_tbl {
> +	struct rkvdec_hevc_sps_pps param_set;
> +	struct rkvdec_rps rps;
> +	struct scaling_factor scaling_list;
> +	u8 cabac_table[27456];
> +}=C2=A0 __packed;
> +
> +struct rkvdec_hevc_ctx {
> +	struct rkvdec_aux_buf			priv_tbl;
> +	struct v4l2_ctrl_hevc_scaling_matrix	scaling_matrix_cache;
> +	struct v4l2_ctrl_hevc_ext_sps_st_rps	st_cache;
> +	struct vdpu383_regs_h26x		regs;
> +};
> +
> +static void set_column_row(struct rkvdec_hevc_sps_pps *hw_ps, u16 column=
, u16 row, int i)
> +{
> +	int shift =3D (i & 1) ? 12 : 0;
> +
> +	switch (i / 2) {
> +	case 0:
> +		hw_ps->column_width0 |=3D column << shift;
> +		hw_ps->row_height0 |=3D row << shift;
> +		break;
> +	case 1:
> +		hw_ps->column_width1 |=3D column << shift;
> +		hw_ps->row_height1 |=3D row << shift;
> +		break;
> +	case 2:
> +		hw_ps->column_width2 |=3D column << shift;
> +		hw_ps->row_height2 |=3D row << shift;
> +		break;
> +	case 3:
> +		hw_ps->column_width3 |=3D column << shift;
> +		hw_ps->row_height3 |=3D row << shift;
> +		break;
> +	case 4:
> +		hw_ps->column_width4 |=3D column << shift;
> +		hw_ps->row_height4 |=3D row << shift;
> +		break;
> +	case 5:
> +		hw_ps->column_width5 |=3D column << shift;
> +		hw_ps->row_height5 |=3D row << shift;
> +		break;
> +	case 6:
> +		hw_ps->column_width6 |=3D column << shift;
> +		hw_ps->row_height6 |=3D row << shift;
> +		break;
> +	case 7:
> +		hw_ps->column_width7 |=3D column << shift;
> +		hw_ps->row_height7 |=3D row << shift;
> +		break;
> +	case 8:
> +		hw_ps->column_width8 |=3D column << shift;
> +		hw_ps->row_height8 |=3D row << shift;
> +		break;
> +	case 9:
> +		hw_ps->column_width9 |=3D column << shift;
> +		hw_ps->row_height9 |=3D row << shift;
> +		break;
> +	case 10:
> +		hw_ps->row_height10 |=3D row << shift;
> +		break;
> +	}
> +}
> +
> +static void set_pps_ref_pic_poc(struct rkvdec_hevc_sps_pps *hw_ps, u32 p=
oc, int i)
> +{
> +	switch (i) {
> +	case 0:
> +		hw_ps->ref_pic_poc0 =3D poc;
> +		break;
> +	case 1:
> +		hw_ps->ref_pic_poc1 =3D poc;
> +		break;
> +	case 2:
> +		hw_ps->ref_pic_poc2 =3D poc;
> +		break;
> +	case 3:
> +		hw_ps->ref_pic_poc3 =3D poc;
> +		break;
> +	case 4:
> +		hw_ps->ref_pic_poc4 =3D poc;
> +		break;
> +	case 5:
> +		hw_ps->ref_pic_poc5 =3D poc;
> +		break;
> +	case 6:
> +		hw_ps->ref_pic_poc6 =3D poc;
> +		break;
> +	case 7:
> +		hw_ps->ref_pic_poc7 =3D poc;
> +		break;
> +	case 8:
> +		hw_ps->ref_pic_poc8 =3D poc;
> +		break;
> +	case 9:
> +		hw_ps->ref_pic_poc9 =3D poc;
> +		break;
> +	case 10:
> +		hw_ps->ref_pic_poc10 =3D poc;
> +		break;
> +	case 11:
> +		hw_ps->ref_pic_poc11 =3D poc;
> +		break;
> +	case 12:
> +		hw_ps->ref_pic_poc12 =3D poc;
> +		break;
> +	case 13:
> +		hw_ps->ref_pic_poc13 =3D poc;
> +		break;
> +	case 14:
> +		hw_ps->ref_pic_poc14 =3D poc;
> +		break;
> +	}
> +}
> +
> +static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> +{
> +	struct rkvdec_hevc_ctx *h264_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +	const struct v4l2_ctrl_hevc_pps *pps =3D run->pps;
> +	const struct v4l2_ctrl_hevc_decode_params *dec_params =3D run->decode_p=
arams;
> +	struct rkvdec_hevc_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> +	struct rkvdec_hevc_sps_pps *hw_ps;
> +	bool tiles_enabled;
> +	s32 max_cu_width;
> +	s32 pic_in_cts_width;
> +	s32 pic_in_cts_height;
> +	u16 log2_min_cb_size, width, height;
> +	u16 column_width[22];
> +	u16 row_height[22];
> +	u8 pcm_enabled;
> +	u32 i;
> +
> +	/*
> +	 * HW read the SPS/PPS information from PPS packet index by PPS id.
> +	 * offset from the base can be calculated by PPS_id * 32 (size per PPS
> +	 * packet unit). so the driver copy SPS/PPS information to the exact PP=
S
> +	 * packet unit for HW accessing.
> +	 */
> +	hw_ps =3D &priv_tbl->param_set;
> +	memset(hw_ps, 0, sizeof(*hw_ps));
> +
> +	/* write sps */
> +	hw_ps->video_parameters_set_id =3D sps->video_parameter_set_id;
> +	hw_ps->seq_parameters_set_id_sps =3D sps->seq_parameter_set_id;
> +	hw_ps->chroma_format_idc =3D sps->chroma_format_idc;
> +
> +	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3;
> +	width =3D sps->pic_width_in_luma_samples;
> +	height =3D sps->pic_height_in_luma_samples;
> +	hw_ps->width =3D width;
> +	hw_ps->height =3D height;
> +	hw_ps->bit_depth_luma =3D sps->bit_depth_luma_minus8 + 8;
> +	hw_ps->bit_depth_chroma =3D sps->bit_depth_chroma_minus8 + 8;
> +	hw_ps->max_pic_order_count_lsb =3D sps->log2_max_pic_order_cnt_lsb_minu=
s4 + 4;
> +	hw_ps->diff_max_min_luma_coding_block_size =3D sps->log2_diff_max_min_l=
uma_coding_block_size;
> +	hw_ps->min_luma_coding_block_size =3D sps->log2_min_luma_coding_block_s=
ize_minus3 + 3;
> +	hw_ps->min_transform_block_size =3D sps->log2_min_luma_transform_block_=
size_minus2 + 2;
> +	hw_ps->diff_max_min_transform_block_size =3D
> +		sps->log2_diff_max_min_luma_transform_block_size;
> +	hw_ps->max_transform_hierarchy_depth_inter =3D sps->max_transform_hiera=
rchy_depth_inter;
> +	hw_ps->max_transform_hierarchy_depth_intra =3D sps->max_transform_hiera=
rchy_depth_intra;
> +	hw_ps->scaling_list_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
> +	hw_ps->amp_enabled_flag =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_ENAB=
LED);
> +	hw_ps->sample_adaptive_offset_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET);
> +
> +	pcm_enabled =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED);
> +	hw_ps->pcm_enabled_flag =3D pcm_enabled;
> +	hw_ps->pcm_sample_bit_depth_luma =3D
> +		pcm_enabled ? sps->pcm_sample_bit_depth_luma_minus1 + 1 : 0;
> +	hw_ps->pcm_sample_bit_depth_chroma =3D
> +		pcm_enabled ? sps->pcm_sample_bit_depth_chroma_minus1 + 1 : 0;
> +	hw_ps->pcm_loop_filter_disabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED);
> +	hw_ps->diff_max_min_pcm_luma_coding_block_size =3D
> +		sps->log2_diff_max_min_pcm_luma_coding_block_size;
> +	hw_ps->min_pcm_luma_coding_block_size =3D
> +		pcm_enabled ? sps->log2_min_pcm_luma_coding_block_size_minus3 + 3 : 0;
> +	hw_ps->num_short_term_ref_pic_sets =3D sps->num_short_term_ref_pic_sets=
;
> +	hw_ps->long_term_ref_pics_present_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT);
> +	hw_ps->num_long_term_ref_pics_sps =3D sps->num_long_term_ref_pics_sps;
> +	hw_ps->sps_temporal_mvp_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED);
> +	hw_ps->strong_intra_smoothing_enabled_flag =3D
> +		!!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED);
> +	hw_ps->sps_max_dec_pic_buffering_minus1 =3D sps->sps_max_dec_pic_buffer=
ing_minus1;
> +
> +	/* write pps */
> +	hw_ps->picture_parameters_set_id =3D pps->pic_parameter_set_id;
> +	hw_ps->seq_parameters_set_id_pps =3D sps->seq_parameter_set_id;
> +	hw_ps->dependent_slice_segments_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED);
> +	hw_ps->output_flag_present_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_=
OUTPUT_FLAG_PRESENT);
> +	hw_ps->num_extra_slice_header_bits =3D pps->num_extra_slice_header_bits=
;
> +	hw_ps->sign_data_hiding_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED);
> +	hw_ps->cabac_init_present_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_C=
ABAC_INIT_PRESENT);
> +	hw_ps->num_ref_idx_l0_default_active =3D pps->num_ref_idx_l0_default_ac=
tive_minus1 + 1;
> +	hw_ps->num_ref_idx_l1_default_active =3D pps->num_ref_idx_l1_default_ac=
tive_minus1 + 1;
> +	hw_ps->init_qp_minus26 =3D pps->init_qp_minus26;
> +	hw_ps->constrained_intra_pred_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> +	hw_ps->transform_skip_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED);
> +	hw_ps->cu_qp_delta_enabled_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_=
CU_QP_DELTA_ENABLED);
> +	hw_ps->log2_min_cb_size =3D log2_min_cb_size +
> +				=C2=A0 sps->log2_diff_max_min_luma_coding_block_size -
> +				=C2=A0 pps->diff_cu_qp_delta_depth;
> +	hw_ps->pps_cb_qp_offset =3D pps->pps_cb_qp_offset;
> +	hw_ps->pps_cr_qp_offset =3D pps->pps_cr_qp_offset;
> +	hw_ps->pps_slice_chroma_qp_offsets_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT=
);
> +	hw_ps->weighted_pred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHT=
ED_PRED);
> +	hw_ps->weighted_bipred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIG=
HTED_BIPRED);
> +	hw_ps->transquant_bypass_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED);
> +	tiles_enabled =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
> +	hw_ps->tiles_enabled_flag =3D tiles_enabled;
> +	hw_ps->entropy_coding_sync_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED);
> +	hw_ps->pps_loop_filter_across_slices_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABL=
ED);
> +	hw_ps->loop_filter_across_tiles_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED);
> +	hw_ps->deblocking_filter_override_enabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED)=
;
> +	hw_ps->pps_deblocking_filter_disabled_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER);
> +	hw_ps->pps_beta_offset_div2 =3D pps->pps_beta_offset_div2;
> +	hw_ps->pps_tc_offset_div2 =3D pps->pps_tc_offset_div2;
> +	hw_ps->lists_modification_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT);
> +	hw_ps->log2_parallel_merge_level =3D pps->log2_parallel_merge_level_min=
us2 + 2;
> +	hw_ps->slice_segment_header_extension_present_flag =3D
> +		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRES=
ENT);
> +	hw_ps->num_tile_columns =3D tiles_enabled ? pps->num_tile_columns_minus=
1 + 1 : 1;
> +	hw_ps->num_tile_rows =3D tiles_enabled ? pps->num_tile_rows_minus1 + 1 =
: 1;
> +	hw_ps->mvc_ff =3D 0xffff;
> +
> +	// Setup tiles information
> +	memset(column_width, 0, sizeof(column_width));
> +	memset(row_height, 0, sizeof(row_height));
> +
> +	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_size + =
log2_min_cb_size);
> +	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +
> +	if (tiles_enabled) {
> +		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> +			compute_tiles_uniform(run, log2_min_cb_size, width, height,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pic_in_cts_width, pic_in_cts_height,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 column_width, row_height);
> +		} else {
> +			compute_tiles_non_uniform(run, log2_min_cb_size, width, height,
> +						=C2=A0 pic_in_cts_width, pic_in_cts_height,
> +						=C2=A0 column_width, row_height);
> +		}
> +	} else {
> +		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> +		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +	}
> +
> +	for (i =3D 0; i < 22; i++)
> +		set_column_row(hw_ps, column_width[i], row_height[i], i);
> +
> +	// Setup POC information
> +	hw_ps->current_poc =3D dec_params->pic_order_cnt_val;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		u32 valid =3D !!(dec_params->num_active_dpb_entries > i);
> +
> +		set_pps_ref_pic_poc(hw_ps, dec_params->dpb[i].pic_order_cnt_val, i);
> +		hw_ps->ref_is_valid |=3D valid << i;
> +	}
> +}
> +
> +static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_ctx *h265_ctx =3D ctx->priv;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_REGS,
> +			=C2=A0=C2=A0 &h265_ctx->regs.common,
> +			=C2=A0=C2=A0 sizeof(h265_ctx->regs.common));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_COMMON_ADDR_REGS,
> +			=C2=A0=C2=A0 &h265_ctx->regs.common_addr,
> +			=C2=A0=C2=A0 sizeof(h265_ctx->regs.common_addr));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_PARAMS_REGS,
> +			=C2=A0=C2=A0 &h265_ctx->regs.h26x_params,
> +			=C2=A0=C2=A0 sizeof(h265_ctx->regs.h26x_params));
> +	rkvdec_memcpy_toio(rkvdec->regs + VDPU383_OFFSET_CODEC_ADDR_REGS,
> +			=C2=A0=C2=A0 &h265_ctx->regs.h26x_addr,
> +			=C2=A0=C2=A0 sizeof(h265_ctx->regs.h26x_addr));
> +}
> +
> +static void config_registers(struct rkvdec_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> +{
> +	const struct v4l2_ctrl_hevc_decode_params *dec_params =3D run->decode_p=
arams;
> +	struct rkvdec_hevc_ctx *h265_ctx =3D ctx->priv;
> +	const struct v4l2_ctrl_hevc_sps *sps =3D run->sps;
> +	dma_addr_t priv_start_addr =3D h265_ctx->priv_tbl.dma;
> +	const struct v4l2_pix_format_mplane *dst_fmt;
> +	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> +	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> +	struct vdpu383_regs_h26x *regs =3D &h265_ctx->regs;
> +	const struct v4l2_format *f;
> +	dma_addr_t rlc_addr;
> +	dma_addr_t dst_addr;
> +	u32 hor_virstride;
> +	u32 ver_virstride;
> +	u32 y_virstride;
> +	u32 offset;
> +	u32 pixels;
> +	u32 i;
> +
> +	memset(regs, 0, sizeof(*regs));
> +
> +	/* Set H264 mode */
> +	regs->common.reg008_dec_mode =3D VDPU383_MODE_HEVC;
> +
> +	/* Set input stream length */
> +	regs->h26x_params.reg066_stream_len =3D vb2_get_plane_payload(&src_buf-=
>vb2_buf, 0);
> +
> +	/* Set strides */
> +	f =3D &ctx->decoded_fmt;
> +	dst_fmt =3D &f->fmt.pix_mp;
> +	hor_virstride =3D dst_fmt->plane_fmt[0].bytesperline;
> +	ver_virstride =3D dst_fmt->height;
> +	y_virstride =3D hor_virstride * ver_virstride;
> +
> +	pixels =3D dst_fmt->height * dst_fmt->width;
> +
> +	regs->h26x_params.reg068_hor_virstride =3D hor_virstride / 16;
> +	regs->h26x_params.reg069_raster_uv_hor_virstride =3D hor_virstride / 16=
;
> +	regs->h26x_params.reg070_y_virstride =3D y_virstride / 16;
> +
> +	/* Activate block gating */
> +	regs->common.reg010.strmd_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.inter_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.intra_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.transd_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.recon_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D 1;
> +	regs->common.reg010.filterd_auto_gating_e=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.bus_auto_gating_e	=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.ctrl_auto_gating_e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D 1;
> +	regs->common.reg010.rcb_auto_gating_e	=C2=A0=C2=A0=C2=A0=C2=A0 =3D 1;
> +	regs->common.reg010.err_prc_auto_gating_e=C2=A0=C2=A0=C2=A0 =3D 1;
> +
> +	/* Set timeout threshold */
> +	if (pixels < VDPU383_1080P_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_1080p;
> +	else if (pixels < VDPU383_4K_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_4K;
> +	else if (pixels < VDPU383_8K_PIXELS)
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_8K;
> +	else
> +		regs->common.reg013_core_timeout_threshold =3D VDPU383_TIMEOUT_MAX;
> +
> +	regs->common.reg016.error_proc_disable =3D 1;
> +
> +	/* Set ref pic address & poc */
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb) - 1; i++) {
> +		struct vb2_buffer *vb_buf =3D get_ref_buf(ctx, run, i);
> +		dma_addr_t buf_dma;
> +
> +		buf_dma =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> +
> +		/* Set reference addresses */
> +		regs->h26x_addr.reg170_185_ref_base[i] =3D buf_dma;
> +		regs->h26x_addr.reg195_210_payload_st_ref_base[i] =3D buf_dma;
> +
> +		/* Set COLMV addresses */
> +		regs->h26x_addr.reg217_232_colmv_ref_base[i] =3D buf_dma + ctx->colmv_=
offset;
> +	}
> +
> +	/* Set rlc base address (input stream) */
> +	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> +	regs->common_addr.reg128_strm_base =3D rlc_addr;
> +
> +	/* Set output base address */
> +	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +	regs->h26x_addr.reg168_decout_base =3D dst_addr;
> +	regs->h26x_addr.reg169_error_ref_base =3D dst_addr;
> +	regs->h26x_addr.reg192_payload_st_cur_base =3D dst_addr;
> +
> +	/* Set colmv address */
> +	regs->h26x_addr.reg216_colmv_cur_base =3D dst_addr + ctx->colmv_offset;
> +
> +	/* Set RCB addresses */
> +	for (i =3D 0; i < rkvdec_rcb_buf_count(ctx); i++) {
> +		regs->common_addr.reg140_162_rcb_info[i].offset =3D rkvdec_rcb_buf_dma=
_addr(ctx, i);
> +		regs->common_addr.reg140_162_rcb_info[i].size =3D rkvdec_rcb_buf_size(=
ctx, i);
> +	}
> +
> +	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
> +		/* Set scaling matrix */
> +		offset =3D offsetof(struct rkvdec_hevc_priv_tbl, scaling_list);
> +		regs->common_addr.reg132_scanlist_addr =3D priv_start_addr + offset;
> +	}
> +
> +	/* Set hw pps address */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, param_set);
> +	regs->common_addr.reg131_gbl_base =3D priv_start_addr + offset;
> +	regs->h26x_params.reg067_global_len =3D sizeof(struct rkvdec_hevc_sps_p=
ps) / 16;
> +
> +	/* Set hw rps address */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, rps);
> +	regs->common_addr.reg129_rps_base =3D priv_start_addr + offset;
> +
> +	/* Set cabac table */
> +	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, cabac_table);
> +	regs->common_addr.reg130_cabactbl_base =3D priv_start_addr + offset;
> +
> +	rkvdec_write_regs(ctx);
> +}
> +
> +static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_priv_tbl *priv_tbl;
> +	struct rkvdec_hevc_ctx *hevc_ctx;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_SPS);
> +	if (!ctrl)
> +		return -EINVAL;
> +
> +	ret =3D rkvdec_hevc_validate_sps(ctx, ctrl->p_new.p_hevc_sps);
> +	if (ret)
> +		return ret;
> +
> +	hevc_ctx =3D kzalloc(sizeof(*hevc_ctx), GFP_KERNEL);
> +	if (!hevc_ctx)
> +		return -ENOMEM;
> +
> +	priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
> +	if (!priv_tbl) {
> +		ret =3D -ENOMEM;
> +		goto err_free_ctx;
> +	}
> +
> +	hevc_ctx->priv_tbl.size =3D sizeof(*priv_tbl);
> +	hevc_ctx->priv_tbl.cpu =3D priv_tbl;
> +	memcpy(priv_tbl->cabac_table, rkvdec_hevc_cabac_table,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(rkvdec_hevc_cabac_table));
> +
> +	ctx->priv =3D hevc_ctx;
> +	return 0;
> +
> +err_free_ctx:
> +	kfree(hevc_ctx);
> +	return ret;
> +}
> +
> +static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +
> +	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
> +			=C2=A0 hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
> +	kfree(hevc_ctx);
> +}
> +
> +static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_hevc_run run;
> +	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_hevc_priv_tbl *tbl =3D hevc_ctx->priv_tbl.cpu;
> +	u32 watchdog_time;
> +	u64 timeout_threshold;
> +	unsigned long axi_rate;
> +
> +	rkvdec_hevc_run_preamble(ctx, &run);
> +
> +	/*
> +	 * On vdpu383, not setting the long and short term ref sets leads to IO=
MMU page faults.
> +	 * To be on the safe side for this new v4l2 control, write an error in =
the log and mark
> +	 * the buffer as failed by returning an error here.
> +	 */
> +	if ((!ctx->has_sps_lt_rps && run.sps->num_long_term_ref_pics_sps) ||
> +		(!ctx->has_sps_st_rps && run.sps->num_short_term_ref_pic_sets)) {
> +		dev_err_ratelimited(rkvdec->dev, "Long and short term RPS not set\n");
> +		return -EINVAL;
> +	}
> +
> +	rkvdec_hevc_assemble_hw_scaling_list(ctx, &run, &tbl->scaling_list,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 &hevc_ctx->scaling_matrix_cache);
> +	assemble_hw_pps(ctx, &run);
> +	rkvdec_hevc_assemble_hw_rps(&run, &tbl->rps, &hevc_ctx->st_cache);
> +
> +	config_registers(ctx, &run);
> +
> +	rkvdec_run_postamble(ctx, &run.base);
> +
> +	/* Set watchdog at 2 times the hardware timeout threshold */
> +	timeout_threshold =3D hevc_ctx->regs.common.reg013_core_timeout_thresho=
ld;
> +	axi_rate =3D clk_get_rate(rkvdec->axi_clk);
> +
> +	if (axi_rate)
> +		watchdog_time =3D 2 * (1000 * timeout_threshold) / axi_rate;
> +	else
> +		watchdog_time =3D 2000;
> +	schedule_delayed_work(&rkvdec->watchdog_work,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(watchdog_time));
> +
> +	/* Start decoding! */
> +	writel(timeout_threshold, rkvdec->link + VDPU383_LINK_TIMEOUT_THRESHOLD=
);
> +	writel(VDPU383_IP_CRU_MODE, rkvdec->link + VDPU383_LINK_IP_ENABLE);
> +	writel(VDPU383_DEC_E_BIT, rkvdec->link + VDPU383_LINK_DEC_ENABLE);
> +
> +	return 0;
> +}
> +
> +const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_hevc_fmt_ops =3D {
> +	.adjust_fmt =3D rkvdec_hevc_adjust_fmt,
> +	.start =3D rkvdec_hevc_start,
> +	.stop =3D rkvdec_hevc_stop,
> +	.run =3D rkvdec_hevc_run,
> +	.try_ctrl =3D rkvdec_hevc_try_ctrl,
> +	.get_image_fmt =3D rkvdec_hevc_get_image_fmt,
> +};
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index b72cb07de70e..326ee8f307bc 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -504,6 +504,22 @@ static const struct rkvdec_coded_fmt_desc vdpu383_co=
ded_fmts[] =3D {
> =C2=A0		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> =C2=A0		.capability =3D RKVDEC_CAPABILITY_H264,
> =C2=A0	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 65472,
> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 65472,
> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &vdpu38x_hevc_ctrls,
> +		.ops =3D &rkvdec_vdpu383_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int =
capability)
> @@ -1447,6 +1463,78 @@ static irqreturn_t rkvdec_irq_handler(int irq, voi=
d *priv)
> =C2=A0	return cfg->irq_handler(ctx);
> =C2=A0}
> =C2=A0
> +/*
> + * Flip one or more matrices along their main diagonal and flatten them
> + * before writing it to the memory.
> + * Convert:
> + * ABCD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AEIM
> + * EFGH=C2=A0=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 BFJN=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D>=C2=A0=C2=A0=C2=A0=C2=A0 AEIMBFJNCGKODHLP
> + * IJKL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CGKO
> + * MNOP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DHLP
> + */
> +static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
> +					=C2=A0=C2=A0 int matrices, int row_length)
> +{
> +	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_siz=
e, new_value;
> +
> +	matrix_size =3D row_length * row_length;
> +	for (i =3D 0; i < matrices; i++) {
> +		row =3D 0;
> +		x_offset =3D 0;
> +		matrix_offset =3D i * matrix_size;
> +		for (j =3D 0; j < matrix_size; j++) {
> +			y_offset =3D j - (row * row_length);
> +			rot_index =3D y_offset * row_length + x_offset;
> +			new_value =3D *(input + i * matrix_size + j);
> +			output[matrix_offset + rot_index] =3D new_value;
> +			if ((j + 1) % row_length =3D=3D 0) {
> +				row +=3D 1;
> +				x_offset +=3D 1;
> +			}
> +		}
> +	}
> +}
> +
> +/*
> + * VDPU383 needs a specific order:
> + * The 8x8 flatten matrix is based on 4x4 blocks.
> + * Each 4x4 block is written separately in order.
> + *
> + * Base data=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 Transposed=C2=A0=C2=A0=C2=A0 V=
DPU383 transposed
> + *
> + * ABCDEFGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AIQYaiqy=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 AIQYBJRZ
> + * IJKLMNOP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BJRZbjrz=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 CKS0DLT1
> + * QRSTUVWX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CKS0cks6=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 aiqybjrz
> + * YZ012345=C2=A0=C2=A0=C2=A0=C2=A0 =3D>=C2=A0 DLT1dlt7=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cks6dlt7
> + * abcdefgh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMU2emu8=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 EMU2FNV3
> + * ijklmnop=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FNV3fnv9=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 GOW4HPX5
> + * qrstuvwx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GOW4gow#=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 emu8fnv9
> + * yz6789#$=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HPX5hpx$=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gow#hpx$
> + *
> + * As the function reads block of 4x4 it can be used for both 4x4 and 8x=
8 matrices.
> + *
> + */
> +static void vdpu383_flatten_matrices(u8 *output, const u8 *input, int ma=
trices, int row_length)
> +{
> +	u8 block;
> +	int i, j, matrix_offset, matrix_size, new_value, input_idx, line_offset=
, block_offset;
> +
> +	matrix_size =3D row_length * row_length;
> +	for (i =3D 0; i < matrices; i++) {
> +		matrix_offset =3D i * matrix_size;
> +		for (j =3D 0; j < matrix_size; j++) {
> +			block =3D j / 16;
> +			line_offset =3D (j % 16) / 4;
> +			block_offset =3D (block & 1) * 32 + (block & 2) * 2;
> +			input_idx =3D ((j % 4) * row_length) + line_offset + block_offset;
> +
> +			new_value =3D *(input + i * matrix_size + input_idx);
> +
> +			output[matrix_offset + j] =3D new_value;
> +		}
> +	}
> +}
> +
> =C2=A0static void rkvdec_watchdog_func(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct rkvdec_dev *rkvdec;
> @@ -1510,6 +1598,7 @@ static const struct rkvdec_config config_rkvdec =3D=
 {
> =C2=A0	.coded_fmts_num =3D ARRAY_SIZE(rkvdec_coded_fmts),
> =C2=A0	.irq_handler =3D rk3399_irq_handler,
> =C2=A0	.colmv_size =3D rkvdec_colmv_size,
> +	.flatten_matrices =3D transpose_and_flatten_matrices,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct rcb_size_info vdpu381_rcb_sizes[] =3D {
> @@ -1532,6 +1621,7 @@ static const struct rkvdec_config config_vdpu381 =
=3D {
> =C2=A0	.rcb_num =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> =C2=A0	.irq_handler =3D vdpu381_irq_handler,
> =C2=A0	.colmv_size =3D rkvdec_colmv_size,
> +	.flatten_matrices =3D transpose_and_flatten_matrices,
> =C2=A0	.named_regs =3D true,
> =C2=A0};
> =C2=A0
> @@ -1555,6 +1645,7 @@ static const struct rkvdec_config config_vdpu383 =
=3D {
> =C2=A0	.rcb_num =3D ARRAY_SIZE(vdpu383_rcb_sizes),
> =C2=A0	.irq_handler =3D vdpu383_irq_handler,
> =C2=A0	.colmv_size =3D rkvdec_vdpu383_colmv_size,
> +	.flatten_matrices =3D vdpu383_flatten_matrices,
> =C2=A0	.named_regs =3D true,
> =C2=A0};
> =C2=A0
> @@ -1589,7 +1680,8 @@ static const struct rkvdec_variant rk3588_vdpu381_v=
ariant =3D {
> =C2=A0
> =C2=A0static const struct rkvdec_variant rk3576_vdpu383_variant =3D {
> =C2=A0	.config =3D &config_vdpu383,
> -	.capabilities =3D RKVDEC_CAPABILITY_H264,
> +	.capabilities =3D RKVDEC_CAPABILITY_H264 |
> +			RKVDEC_CAPABILITY_HEVC,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_rkvdec_match[] =3D {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 94e2e6429992..aed684f14766 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -123,6 +123,7 @@ struct rkvdec_config {
> =C2=A0	size_t rcb_num;
> =C2=A0	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
> =C2=A0	u32 (*colmv_size)(u16 width, u16 height);
> +	void (*flatten_matrices)(u8 *output, const u8 *input, int matrices, int=
 row_length);
> =C2=A0	bool named_regs;
> =C2=A0};
> =C2=A0
> @@ -194,5 +195,6 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu3=
81_hevc_fmt_ops;
> =C2=A0
> =C2=A0/* VDPU383 ops */
> =C2=A0extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_h264_fmt_op=
s;
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu383_hevc_fmt_ops;
> =C2=A0
> =C2=A0#endif /* RKVDEC_H_ */

--=-/kyOZS9SoJk9P6XyChkm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTncWwAKCRDZQZRRKWBy
9F6kAQCD5VVujTe5hZp3ccK/GzsjTZs9LAQYtCvwCel475mE0QEAthv+qT1ulIfE
g0Kd6DD3kCSKXYNPn7oCxYkr3j1tPw4=
=4xKF
-----END PGP SIGNATURE-----

--=-/kyOZS9SoJk9P6XyChkm--

