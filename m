Return-Path: <linux-media+bounces-56557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ7jLTmHvWnQ+gIAu9opvQ
	(envelope-from <linux-media+bounces-56557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:43:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7322DED99
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC8B0300D354
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1F43D7D6D;
	Fri, 20 Mar 2026 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="l9pIve2L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673A3D75A8
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028583; cv=none; b=pzXZ1LO9sgq8LEDJr/+DNO4hzsPRON7Hk4+uYR9jvTSRPDR1D4SyHfk+pQB5QCV1wgYEVZo7hOMKlfCqvTOtPCvr9v8hFA5UyKhWlBj6NiutlThuUbAXnsAqjvgusNyLfHBQyoxEDgldROXkBc+ZW2YXMulQWfKRD1OwqRjQmDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028583; c=relaxed/simple;
	bh=Ng6lkfIzPn2qUTr6WUPLQTGicLlvh0rZQdiVPA9WRok=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZNGWgQ7tEJUL5gjqpiPhCdCJZjaaWAjqt/8IElCFvNhLLpqEIiljx8l2HK2jq50Th4CWI1GoyYz9C0AwY9azKRhtFs/sGn+NdMCHDLWJEmS3pKpu+RKLtaidqL0/DXhfJCAqpg3pwxMoKFNQ85sB2WuKbEHd3O3t0XpyfaXkLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=l9pIve2L; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd7c372929so181581885a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028578; x=1774633378; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4b7bHDEHMNg+ZOh92aXYeYMSzd5GgyCONDythGrcDzA=;
        b=l9pIve2LYLw9Wv7OdRYJ9KvM4IKMtL4RSzwsWgtsXEolZIXt0S/kLZxc2yXotPV3A/
         J/big7428hibFm6qYlMScxVkWkhTVC30nYsumM9SdrX3LTDFj5bWIKcKIBKAhIZ56q9i
         1nLcayqX4hhSWDUFPzNiT1avcly30PxzKS5tqG4u1Ch8EbxDI1jwF519pBwrntWnM8Ch
         Niz2PhjnDcQ+unPBwQMnBajFVCINdUWuuWRnO+zUUzBeYneD/9LwzJCOpi/O1lxNSf0V
         NaNBNlNCFdiraYI2WoLaV96OcMtJScFie8McLvE7iG4X5US8JlSSvhd8miyPtT9fb76k
         UZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028578; x=1774633378;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4b7bHDEHMNg+ZOh92aXYeYMSzd5GgyCONDythGrcDzA=;
        b=VQ2BDlUfsixHq0IiQak0xqnZKyCp3UtpZiDP7nl5haZPPPOSxaHnU09rJ5W+qoprYC
         q7QOg5OTSiDYDsrwwCTTmf2CmqWwqy9q5PkZBD09jMIWikOOETo0M15rfd+HLlATvuXq
         DqCqOhr4g54lyBQboEuYwFlCV56VZ+Q2axWDC+7zy6dYrCFB9UTBndOVBL0d09ZNPJDn
         QewLpAKWuGPeSNfn593mRLD+Tl8RhzdCLx1wjiD07HjAbxu3J4FZLsY9RoMFLFNHAFFW
         dT7Kc3PqgvcGcY+6CmUfUW/Rht1CqkPZ+KkHEQh+zEHksWE17g+JFqZ+io9zYDocc+ZO
         cIQg==
X-Gm-Message-State: AOJu0YwHdyxEDyLk4txj1bmzPsQM0ZoKU88Wgo2XxaIP8ShLr93FxF9q
	/XI7apoCq6YYFAgdAioM8EDjgGd+R2MM7A4wpDV5f2NFhEMx37wpUpum6xJCpKKwsro=
X-Gm-Gg: ATEYQzy81TFqKuWF/DddMMUgDgD36WUZJHpmXGZbG7LOcJEsZaw5XgQGWw2bVrXKyLf
	mrXuBHsOJyqsL84/cMZgMm01KJjBEyzQqJaLIHWUkvvkiYztVAHkBH8yiuUPyGOIJa9vAco7Yu9
	iN8OqJ6pIPANMX0jbY+tovu42fztvBG23sUfb3X+Qku0+j5mdaBChJ2s8RI6D/BEVVhY7PIoi53
	MlUszrHNgsVm1uyrtPAchKwfK1QpLmphG+q5V5rvHG6rVjXREfTENvGcPKWCmwRrRKKMajY/Vas
	iFGQdnUCn8zFvZ51+aiZNk8S4wq2ZbV7cgeQfnlR9LnX/9RRHdOX4TZuhUabnJ4ExSwlhYoieUO
	MkM+ZsyZwrCH/4zPc9lbUhVxoBDDl/3Kt7av8jCK1nI2QucaMrRZbgxCrINo/9Xi2AADPM9BIT5
	YWvGbR7jj1W2L4MN85JsZAUx9E63zq
X-Received: by 2002:a05:620a:4606:b0:8cd:b2e9:7d88 with SMTP id af79cd13be357-8cfc7f4df71mr539139685a.44.1774028577988;
        Fri, 20 Mar 2026 10:42:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5d128sm210466385a.8.2026.03.20.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:42:57 -0700 (PDT)
Message-ID: <baeafc597ae5b49e34481c4c2704ec242344ffe4.camel@ndufresne.ca>
Subject: Re: [PATCH v3 09/27] media: rockchip: rga: announce and sync
 colorimetry
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
Date: Fri, 20 Mar 2026 13:42:56 -0400
In-Reply-To: <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-9-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oe7RpPV93eR3PfJ/4+yO"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56557-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 4F7322DED99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-oe7RpPV93eR3PfJ/4+yO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Announce the capability to adjust the quantization and ycbcr_enc on the
> capture side and check if the SET_CSC flag is set when the colorimetry
> is changed. Furthermore copy the colorimetry from the output to the
> capture side to fix the currently failing v4l2-compliance tests, which
> expect exactly this behavior.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 37 ++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 20d1d9cb7625d..cf9d5702598fa 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *=
priv, struct v4l2_fmtdesc *f
> =C2=A0	fmt =3D &formats[f->index];
> =C2=A0	f->pixelformat =3D fmt->fourcc;
> =C2=A0
> +	if (f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	=C2=A0=C2=A0=C2=A0 f->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		return 0;
> +
> +	/* allow changing the quantization and xfer func for YUV formats */
> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |=3D V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			=C2=A0=C2=A0=C2=A0 V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
> =C2=A0static int vidioc_try_fmt(struct file *file, void *priv, struct v4l=
2_format *f)
> =C2=A0{
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> +	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rga_fmt *fmt;
> =C2=A0
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		const struct rga_frame *frm;
> +
> +		frm =3D rga_get_frame(ctx, f->type);
> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +			pix_fmt->quantization =3D frm->pix.quantization;
> +			pix_fmt->ycbcr_enc =3D frm->pix.ycbcr_enc;
> +		}
> +		/* disallow values not announced in vidioc_enum_fmt */
> +		pix_fmt->colorspace =3D frm->pix.colorspace;
> +		pix_fmt->xfer_func =3D frm->pix.xfer_func;
> +	}
> +
> =C2=A0	fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &formats[0];
> @@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *pri=
v, struct v4l2_format *f)
> =C2=A0	frm->fmt =3D rga_fmt_find(pix_fmt->pixelformat);
> =C2=A0	frm->stride =3D pix_fmt->plane_fmt[0].bytesperline;
> =C2=A0
> +	/*
> +	 * Copy colorimetry from output to capture as required by the
> +	 * v4l2-compliance tests
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		ctx->out.pix.colorspace =3D pix_fmt->colorspace;
> +		ctx->out.pix.ycbcr_enc =3D pix_fmt->ycbcr_enc;
> +		ctx->out.pix.quantization =3D pix_fmt->quantization;
> +		ctx->out.pix.xfer_func =3D pix_fmt->xfer_func;
> +	}
> +
> =C2=A0	/* Reset crop settings */
> =C2=A0	frm->crop.left =3D 0;
> =C2=A0	frm->crop.top =3D 0;

--=-oe7RpPV93eR3PfJ/4+yO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2HIAAKCRDZQZRRKWBy
9Px4AQChjkhhOucaVISHeRAYH5X7ODkjIye5JGejpkeHL63PSQEAk4KAcyPF14o8
SuHYOv4/KXqhuyvwujnnCWprB/iW7QE=
=HbxP
-----END PGP SIGNATURE-----

--=-oe7RpPV93eR3PfJ/4+yO--

