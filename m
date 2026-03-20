Return-Path: <linux-media+bounces-56561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBfVJMiKvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:58:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F42DF02E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 051FF302FE56
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799673DA7ED;
	Fri, 20 Mar 2026 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="srEmdTSH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2863016FA
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029451; cv=none; b=H2qd2zb7+uS9E7ZTg8haRvrgB6W+k8qambqvljzq5PP4forQGhqLs6Zu24hqu52UGqdEohAbENXLECGuprBbGXhqMNwY68aQbkW3WXQ3KnYnUWdhwKZ5WTYHNGxtJiyMncM1FnZkh4QcKLCQZvPOTrR4ZBWcw6Yva5W4vULulWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029451; c=relaxed/simple;
	bh=GYAEhNexLwhDhIm36mxaOuEEnayaPHcvgT1XQ3ECWc8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zo3UXc1eecLjFkQCj/KcnB5pRttlRY0pkBnIKNflHpwAO1bFeaEct1t+nqdXLUg5dZJ/VqayIwTCOWjSLZExSTEW/T4lrlzab3P0ouQmAsPkPPhCje0/uoYz/gSD0maIBZjrUJzhpDgngfvO5KIHConaCzzNgBsL/+ICLHILAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=srEmdTSH; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ae222d978so2554805d50.1
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029449; x=1774634249; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=srEmdTSHPCme7pfugCR9OzXQnsiGE5Iy/Pt5Skl3p0fGXw5JqkOW85nyi+9CnPRHHw
         CmGjLU26q/RLJW4LTmvfoKuyRtwmfHPJcYOLjVB41ATJlIpfsBzLercvctDkoGlb6/OZ
         HihLThiYAm3xXINDodogMLFlQRGf/zUuQMyQkulcN1zbS05z149L2sMKD9pR7UTy0SAr
         4oAiz+NnXE8hDN4C9mhsnEPSTQy7OyTmm5aDnniT4kcB0F9FX+HafHXXMDtfmUEVYDYl
         V3p4hnOVPNmbLefR2Zgysx6sdvIVdSb2KcOgtVhfzCsVzjiWk2V/nrf5Lym22ZhHZmaE
         tFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029449; x=1774634249;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=aUbKUo4q4SJHnBxwC9FjebAy872rdXtnNLFODnTb6QkwDhtJqgnpbaq5XV/9x8+d/p
         E+Z8t0/5OESbY8F1HcoyUZl7MgbysNY20sBQJz0Y60cCha7pE11UHryhk2p5BxVe2ujw
         9MnGRcHlY5HGZff3WL6Z7ts1LE5t/vujTnjo+j73OouylgWWVyEAEOomBOk9pCmIkQYV
         9UeQ+LRRkVgRTt0NkyIn5IOal51ixt+DQ9PIAuK1DXu1XH2gynNs+wyRJzBeUXUB2Tvq
         d7Z6m9IrOPEXpa25STvp2CtIDfJb2I1Qx9D/NOWrME/dtQJGUNwPSXhLN0G9eOSDiG0g
         N5sA==
X-Gm-Message-State: AOJu0YxDF3nmCP3eAFLTSegKtKJYGBYUNq/otLgB3dpHH0WaPKd7FcUk
	4bGo9r5e78dvhV0PziEn9J0TSl3ACjX8YE9fhtOHCf8IN31bXB0Ir0LYhkmHjsof2Ys=
X-Gm-Gg: ATEYQzwodXGhryS0OhLADoYlP0dWrEQ40KgNNKgkVQm5SA7QDdXGh3/xPHB1lkR7DDk
	4B6sMc9iO6acElbH05O+NcQGzwDmsZJnsIEnakL3xlRZMMOh8sKSlVeyqdjb8o/shAxOUEmz5+x
	9cVj4NTAxH9rJnp09xKYHIZlq+ypfDOHG2pYVJp2Jvcj1vwqJel6cMzAssZENUNp5PamC+mph/O
	Kbg3g3JfL4m/cHz+0PMISYLLV87pZO6twvtHuHzI6urMK9Uw2tfc2jeOIq5OKJvtN8wJGgAxNJI
	mV8SZYhpJszi+j86k/LRLj9S+ozZsktQ9+3ddZSWUtY4UaC3SD7N7T5nSVQmB2TdDcxH12OyP09
	LTK2OL+2aPiAoWivgmkwVLG9M9NLNW49+ox0wuaiSetLI+A6VjSi3t8uea43/11qMGkM5HsMUsw
	3fGZJj70+ffWRvqv1CGoMCD84coaEx
X-Received: by 2002:a53:b7d1:0:b0:64c:ac70:9422 with SMTP id 956f58d0204a3-64eaa8750damr3005530d50.79.1774029449330;
        Fri, 20 Mar 2026 10:57:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm1852148d50.6.2026.03.20.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:57:28 -0700 (PDT)
Message-ID: <90da83de861e8268745255720554ad23341e6839.camel@ndufresne.ca>
Subject: Re: [PATCH v3 16/27] media: rockchip: rga: check scaling factor
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
Date: Fri, 20 Mar 2026 13:57:26 -0400
In-Reply-To: <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qjIqyG00QdlUohxd10SX"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56561-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 392F42DF02E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-qjIqyG00QdlUohxd10SX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
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
> index dcd540ed3fd5b..7a4070665fed7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index f4752aa823051..fffcab0131225 100644
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
> index 6947c472a8b01..fad921ddd8348 100644
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
> +	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->in;
> +	if (limit_frm) {
> +		const struct v4l2_frmsize_stepwise frmsize =3D {
> +			.min_width =3D DIV_ROUND_UP(limit_frm->pix.width,
> +						=C2=A0 hw->max_scaling_factor),
> +			.max_width =3D
> +				limit_frm->pix.width * hw->max_scaling_factor,
> +			.min_height =3D DIV_ROUND_UP(limit_frm->pix.height,
> +						=C2=A0=C2=A0 hw->max_scaling_factor),
> +			.max_height =3D
> +				limit_frm->pix.height * hw->max_scaling_factor,
> +			.step_width =3D 1,
> +			.step_height =3D 1,

Is there a risk to re-introduce odd sizes ? Should this be the hdiv / vdiv
values ?

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

--=-qjIqyG00QdlUohxd10SX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2KhgAKCRDZQZRRKWBy
9PM7AP9jGP5aoYcuwSgumkHCKGfz+EC3ON3LYoZEHTq181prOwD9EQ6lsBj+nyKz
T6YbQyqWaVwY9slYUWGL40d6F+8IIAY=
=9adu
-----END PGP SIGNATURE-----

--=-qjIqyG00QdlUohxd10SX--

