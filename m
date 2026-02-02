Return-Path: <linux-media+bounces-52011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNKdIOqpgGkFAQMAu9opvQ
	(envelope-from <linux-media+bounces-52011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:43:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CECCE35
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 038BF302C77E
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6940436996C;
	Mon,  2 Feb 2026 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zc/+9uWq"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D636A010;
	Mon,  2 Feb 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039769; cv=none; b=C7Wes7l2T/e1iFEG0xVpDpKhXa7O5n5mHV/tNNLj7zrcoteOn0ITF3ketdEjqdsUBfSCr5oMvYKcEbAwd9TlXR66gUVUy18wwoh21cfNg9AWwFVPtB+SViJjWNDeEm7llmNqXQPH65RgwyGdXJE8Yv05QcgUX72lGkOBO3ySopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039769; c=relaxed/simple;
	bh=gcTfsdv162COO0lrMacW+zMoNiUg+aaJ2YIgxYnS0Ak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XgR/fzfKm4S8jEObLAsdmjY7mGXPIVDUZN9Z2vr7E6NbSKRUUlTCydLI2fqR9JBNTMt3aYj4ANwzPxYlbVu5bc3ncKi4tx0pbJ10VyaJReFckuaxF/Sey1DCT3JeU7fqbMiL6TnVuasw+a6nL15TQeMYQ3DzZ0Kf1pgxNfsugx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zc/+9uWq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770039766;
	bh=gcTfsdv162COO0lrMacW+zMoNiUg+aaJ2YIgxYnS0Ak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Zc/+9uWqy6PXrqry3Avy/WE37bZfyD/pTm5q9Ynph2a/6aScihGzebs5+5kSDz7+3
	 05WcpD/Di4+B7njXyzo93kx8snjSlJl53ze2eP21JZZu5aBVn68bc104nk5s4jkuhe
	 isSWebCLRG40qe6Q6yEREZpZttyoQ+zv46BTFMNzbVqd/AP9ajkihBW2xLg6Z1k1GY
	 uNB1cjS+IyCGMkLRnuqNtH86f+xXakrDkIfLptaHXPdJ6In/FXeYjsyOj8lOiUOCC4
	 /v65MMm9hNU3CvoSdLyRnUzjIEzPkYCVk/wLEOwe2JkYXkOhswj/EuQ2eyhvpnCT2o
	 7thn6xx70mQtg==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 96AA917E0927;
	Mon,  2 Feb 2026 14:42:44 +0100 (CET)
Message-ID: <16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor	
 <nathan@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Mon, 02 Feb 2026 08:42:41 -0500
In-Reply-To: <20260202094804.1231706-1-arnd@kernel.org>
References: <20260202094804.1231706-1-arnd@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-7kpS3ryHRVhS3mBqQbB8"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,godbolt.org:url]
X-Rspamd-Queue-Id: EC2CECCE35
X-Rspamd-Action: no action


--=-7kpS3ryHRVhS3mBqQbB8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 10:47 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The rkvdec_pps had a large set of bitfields, all of which
> as misaligned. This causes clang-21 and likely other versions to
> produce absolutely awful object code and a warning about very
> large stack usage, on targets without unaligned access:
>=20
> drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack =
frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wfra=
me-larger-than]

We had already addressed and validated that on clang-21, which indicates me=
 that
we likely are missing an architecture (or a config) in our CI. Can you docu=
ment
which architecture, configuration and flags was affected so we can add it o=
n our
side ?

Our media pipeline before sending to Linus and the clang builds trace are i=
n the
following link, in case it matters.

https://gitlab.freedesktop.org/linux-media/media-committers/-/pipelines/158=
8731
https://gitlab.freedesktop.org/linux-media/media-committers/-/jobs/91604655

>=20
> Part of the problem here is how all the bitfield accesses are
> inlined into a function that already has large structures on
> the stack.

Another observation is that you had to enable ASAN to make it miss-behave o=
n for
loop unrolling (with complex bitfield writes).  All I've obtained by visiti=
ng
the Link: is that its armv7-a architecture.

>=20
> Mark set_field_order_cnt() as noinline_for_stack, and split out
> the following accesses in assemble_hw_pps() into another noinline
> function, both of which now using around 800 bytes of stack in the
> same configuration.
>=20
> There is clearly still something wrong with clang here, but
> splitting it into multiple functions reduces the risk of stack
> overflow.

We've tried really hard to avoid this noninline_for_stack just because comp=
ilers
are buggy. I'll have a look again in case I find some ideas, but meanwhile,=
 with
failing architecture in the commit message:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Fixes: fde24907570d ("media: rkvdec: Add H264 support for the VDPU383 var=
iant")
> Link: https://godbolt.org/z/acP1eKeq9
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0.../rockchip/rkvdec/rkvdec-vdpu383-h264.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 50 ++++++++++---------
> =C2=A01 file changed, 27 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index 6ab3167addc8..ef69f2a36478 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -130,7 +130,7 @@ struct rkvdec_h264_ctx {
> =C2=A0	struct vdpu383_regs_h26x regs;
> =C2=A0};
> =C2=A0
> -static void set_field_order_cnt(struct rkvdec_pps *pps, const struct v4l=
2_h264_dpb_entry *dpb)
> +static noinline_for_stack void set_field_order_cnt(struct rkvdec_pps *pp=
s, const struct v4l2_h264_dpb_entry *dpb)
> =C2=A0{
> =C2=A0	pps->top_field_order_cnt0 =3D dpb[0].top_field_order_cnt;
> =C2=A0	pps->bot_field_order_cnt0 =3D dpb[0].bottom_field_order_cnt;
> @@ -166,6 +166,31 @@ static void set_field_order_cnt(struct rkvdec_pps *p=
ps, const struct v4l2_h264_d
> =C2=A0	pps->bot_field_order_cnt15 =3D dpb[15].bottom_field_order_cnt;
> =C2=A0}
> =C2=A0
> +static noinline_for_stack void set_dec_params(struct rkvdec_pps *pps, co=
nst struct v4l2_ctrl_h264_decode_params *dec_params)
> +{
> +	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> +			pps->is_longterm |=3D (1 << i);
> +		pps->ref_field_flags |=3D
> +		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
> +		pps->ref_colmv_use_flag |=3D
> +		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
> +		pps->ref_topfield_used |=3D
> +		 (!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
> +		pps->ref_botfield_used |=3D
> +			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
> +	}
> +	pps->pic_field_flag =3D
> +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
> +	pps->pic_associated_flag =3D
> +		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
> +
> +	pps->cur_top_field =3D dec_params->top_field_order_cnt;
> +	pps->cur_bot_field =3D dec_params->bottom_field_order_cnt;
> +}
> +
> =C2=A0static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> =C2=A0{
> @@ -177,7 +202,6 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	struct rkvdec_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> =C2=A0	struct rkvdec_sps_pps *hw_ps;
> =C2=A0	u32 pic_width, pic_height;
> -	u32 i;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * HW read the SPS/PPS information from PPS packet index by PPS id=
.
> @@ -261,28 +285,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> =C2=A0
> =C2=A0	set_field_order_cnt(&hw_ps->pps, dpb);
> +	set_dec_params(&hw_ps->pps, dec_params);
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> -		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> -			hw_ps->pps.is_longterm |=3D (1 << i);
> -
> -		hw_ps->pps.ref_field_flags |=3D
> -			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
> -		hw_ps->pps.ref_colmv_use_flag |=3D
> -			(!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
> -		hw_ps->pps.ref_topfield_used |=3D
> -			(!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
> -		hw_ps->pps.ref_botfield_used |=3D
> -			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
> -	}
> -
> -	hw_ps->pps.pic_field_flag =3D
> -		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
> -	hw_ps->pps.pic_associated_flag =3D
> -		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
> -
> -	hw_ps->pps.cur_top_field =3D dec_params->top_field_order_cnt;
> -	hw_ps->pps.cur_bot_field =3D dec_params->bottom_field_order_cnt;
> =C2=A0}
> =C2=A0
> =C2=A0static void rkvdec_write_regs(struct rkvdec_ctx *ctx)

--=-7kpS3ryHRVhS3mBqQbB8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYCp0gAKCRDZQZRRKWBy
9PKZAQDW2WJYqk6PvFuUHWBQTPBTqefBGs5IqpO8QwVWcBdQRwD/YxyoF4mjJmnc
OGxL3bcdMp/Ib+/bvccOgrHz6b08vAE=
=qu3H
-----END PGP SIGNATURE-----

--=-7kpS3ryHRVhS3mBqQbB8--

