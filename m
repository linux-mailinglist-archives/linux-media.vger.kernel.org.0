Return-Path: <linux-media+bounces-60983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFzfN8Rt/mmlqgAAu9opvQ
	(envelope-from <linux-media+bounces-60983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 01:12:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E44FCA33
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 01:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD8F9300D342
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 23:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7C13AE6FC;
	Fri,  8 May 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="jpLexh6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823C39EF22
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 23:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281919; cv=none; b=CpG5e6Rqwu/0dUTqogcx5KXlt3aZz0ZcgnoEIphwhjY5xHVOPg9BBt3/D6WtUu572i/r5o2FZijnloQfsF50PnC8ut3wTCIxDJo50DOc9oi3ymU/cg5ngz/WfSsaDc0XNfcxxs0rH2wkxQf74/tdMRyLzT0wO+p6DqNeE3k8OFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281919; c=relaxed/simple;
	bh=NQljLf3eomaZ/2T5R92LipgbO5FdwqAfK9cyU8nO+0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LlCjc7RFvnrl1oA/uzq6O915R6Du5ZkuZKrG8DrNxNkXemxfLUsB+SHEnbllNnQa8Ams2RtZet42+eZMfoxA4neM/UoO1XUbupzFQl4HTkUkgT0+6R2xHWL5jZqszIA95vnhojqW21d/ZBANvObEmLcejvTOdKOTG4ByA5c17sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=jpLexh6W; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e594413c2so16799351cf.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 16:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778281917; x=1778886717; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a61U6DoScQKwSeDx7PQ4jXrr3w68CY6nBE7kzjfUuOs=;
        b=jpLexh6W9PzSqXKtJj+jqwSH1p1VgGFUPAR3XG7QNAytn4q1mVdksFQRcuG+mPVkm2
         T2RRb7rw4Pyk7xLjd1+0PtE+T7A4lamXxJ5ya5nE9qRAGxP4bwgiP70Zp7HIYaxhGNJP
         EzbeZZOHZppSOjojwPMafgyDu6rM1yLgurrtPN9w9V85jDOIOeGF6imEkrpCHJB6bQ2k
         CAcZAjY9H9Y67fpemd7yGhWlnkUDy9+E5iUkPDunfU7ruc5HaRN6FgBBuQQB1FcjeXM5
         R9Kwm6DGtg8/57P+KPPZQEYOR0WmKcGxPfih08F7FDgV9E2C2qYAt2xncuz8uHZMcWgU
         ST5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281917; x=1778886717;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a61U6DoScQKwSeDx7PQ4jXrr3w68CY6nBE7kzjfUuOs=;
        b=AlXmAHw13G2Umprk8fIj+qAI3oOHGyI8DI7lPZl6BHj/psrfIwvFe1q+FtwBQRz0DY
         GAmNLDBR/+PmylBbo4jBQc24OKMdoirhhf3Q4mQkXUGj+LHTSU9X+wLBiHCjgTtZ2cCO
         oussfAzvyjXPJIBj+hXrXoFVVuNTg3O6M9oYsCSmYEH4yTQe6BU3SyI9UxF3IHYip6p9
         L5XUQ8EvNYyLWcWTFcoL/KT+8V3flVLD3YKFiVIO1wlP/ziTqbUzsNKXk7MmaofhkDbn
         oXtKYiq4KgHyZQ+H4lDhWkox1Yqbr/JbWLDj1ay7rql43GEqw/DhLcX0AMeso+ZUCy0F
         YNvw==
X-Gm-Message-State: AOJu0YzOFtaKgZbdnrbKGO7t8qIzK51rMOY5OXXYW3j4dpOdu19fCHUV
	qxyzg3/amc0LliFzrh1liUhqml3tRbIQ4l8d+XXr5xmdfZ82V4Xi3fUDlyDDswjvpmU=
X-Gm-Gg: AeBDietOAtXy6zaR1axUeAz/FaM2h2I/FDfg+YWb/dQsSjMvCud5ETIhokLyQF5L+CK
	4SRWq4c5otGcApSyVASsoSnugukYbNNvp6EfPawiOYGTDw1aaV3ZrNMsI0Vu4tqOvKAzVI2UhCv
	aGxS+POaz8TLwbyg5ZIqP3dXuHw8+juC8jc2f9kcXygw6Ah/U3Od2LP7nKuuDFZqBkR0iVjA/+6
	Q4Xs4jyKPA5dTSAaXmiR5XIeQoAzQeSW9ejCqmT3oTf0VkUSO0NTCZkdgB94WAiqG4GQkEFNInN
	FMq/4pE/vfF85E/6BzbuxDM2/D7XzzFFclOzn2QUP/Yr7nIKvz6eGapiWQB1qtDmmqR9FcfZl+1
	I4EnbnrcCvgNY3uCswfjEgolygQxzwc3c3X/n7KEmiNUZHNsm81ordMeu5e224KMtGy/CR+trdR
	xP6l5jtlY2HdomaR9Hlrf0Bx4O6u/q
X-Received: by 2002:a05:622a:2c8:b0:50e:5755:913d with SMTP id d75a77b69052e-514755feb11mr119461611cf.0.1778281916899;
        Fri, 08 May 2026 16:11:56 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148fa78723sm24900771cf.3.2026.05.08.16.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 16:11:55 -0700 (PDT)
Message-ID: <67c2e5b74340a3a33a5e1e377e88298250a6d3c5.camel@ndufresne.ca>
Subject: Re: [PATCH v5 18/29] media: rockchip: rga: check scaling factor
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
Date: Fri, 08 May 2026 19:11:53 -0400
In-Reply-To: <20260428-spu-rga3-v5-18-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-18-eb7f5d019d86@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-6phmHvyO9kAPRIT/1Osz"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6B7E44FCA33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60983-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ndufresne.ca:mid,pengutronix.de:email,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-6phmHvyO9kAPRIT/1Osz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> There are two relevant scenarios that have to be considered to protect
> against invalid scaling values:
>=20
> When the output or capture is already streaming, setting the format on
> the other side should consider the max scaling factor and clamp it
> accordingly. This is only done in the streaming case, as it otherwise
> may unintentionally clamp the value when the application sets the first
> format (due to a default format on the other side).
>=20
> When the format is set on both sides first, then the format won't be
> corrected by above means. Therefore the second streamon call has to
> check the scaling factor and fail otherwise.
>=20
> As try functions should only be state aware if specified, the scaling
> limitation is only done in s_fmt.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 47 ++=
++++++++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A04 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 11079477a3008..11a1a914668f6 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -595,6 +595,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index c2e34be751939..805ec23e5e3f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
> =C2=A0
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
> =C2=A0
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index d111b348255e2..75d05c86b1c00 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> +	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct vb2_queue *vq;
> =C2=A0	struct rga_frame *frm;
> =C2=A0	int ret =3D 0;
> =C2=A0	int i;
> +	struct rga_frame *limit_frm =3D NULL;
> +
> +	/* Limit before try_fmt to avoid recalculating the stride */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->out;

If you need to, use helpers such as vb2_is_streaming(), though in this case=
, I
think you want to use vb2_is_busy(), which protects against changing the fo=
rmat
of a queue that is already allocated. This is needed because drivers, excep=
t vp9
and av1 stateless decoders, don't track the format per buffer.

> +	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)

Same.

> +		limit_frm =3D &ctx->in;
> +	if (limit_frm) {
> +		const struct v4l2_frmsize_stepwise frmsize =3D {
> +			.min_width =3D DIV_ROUND_UP(limit_frm->pix.width,
> +						=C2=A0 hw->max_scaling_factor),
> +			.max_width =3D
> +				limit_frm->pix.width * hw->max_scaling_factor,

Shouldn't you control the absolute min/max for this IP ?

> +			.min_height =3D DIV_ROUND_UP(limit_frm->pix.height,
> +						=C2=A0=C2=A0 hw->max_scaling_factor),
> +			.max_height =3D
> +				limit_frm->pix.height * hw->max_scaling_factor,
> +			.step_width =3D 1,
> +			.step_height =3D 1,

Shouldn't that step match the subsampling like you did earlier ?

Nicolas

> +		};
> +		v4l2_apply_frmsize_constraints(&pix_fmt->width,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pix_fmt->height, &frmsize);
> +	}
> =C2=A0
> =C2=A0	/* Adjust all values accordingly to the hardware capabilities
> =C2=A0	 * and chosen format.
> @@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst=
_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> =C2=A0static int vidioc_streamon(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0
> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streamin=
g) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streamin=
g)) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
> +		=C2=A0=C2=A0=C2=A0 !check_scaling(hw, ctx->in.pix.height, ctx->out.pix=
.height))
> +			return -EINVAL;
> +	}
> +
> =C2=A0	hw->setup_cmdbuf(ctx);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index c741213710b32..454af283b1694 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-6phmHvyO9kAPRIT/1Osz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5tuQAKCRDZQZRRKWBy
9MrfAQDVqv8LNnmDgVligHcx7MKd8IXEllWPqnCGg6qVCKnTEAEA/sEZbAClzfwv
w2zcIFiT48t98hMAoqNwJkqNZHa0Kgk=
=zf12
-----END PGP SIGNATURE-----

--=-6phmHvyO9kAPRIT/1Osz--

