Return-Path: <linux-media+bounces-49484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D44CDC998
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E33AB30EE5FB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 14:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7E30C375;
	Wed, 24 Dec 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="N+UR2bE0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46126215F7D
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766587720; cv=none; b=R0WGGKN9QGmP18rhj1PJQ0oLJ9m3o3lMieAw2LxbC1lqN3oAH2xohV/T8Yyesj8uBo1pasWPBmKq3M40F1D8VWHTr38KkgqBcWZdaZi7s04fZ6kWSt2ezcfu1P/rQnLAJYg+9CSdDTPBqmJ8XClACb1ClOW8rwIi7qkoYjZ/ANo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766587720; c=relaxed/simple;
	bh=eyZGogHnJ3QU8HPtxdsQhPJIO7zYERNcin8cesCSMmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uTiE5ZPXWsggXaHb+hWkvqCf68DPT+VPcSV/zbWdqxPYFDyI3bVpY2XguttNQI1iZ1OmgJKKXsP1VH59+cHNzJGVbX71BVvdhd/rwpnKP/IWL0v5zUp/FNSKBKnSkABpzmTpOYtC50kOhg8CcGLSOwOcM+A0GtVaFpHkIbZbAWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=N+UR2bE0; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8888a16d243so53662466d6.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766587717; x=1767192517; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kv8uVhQiYXeEfFC22LTWeYBZIiji9JQILeQzDCWhcvk=;
        b=N+UR2bE0l7w9thgg4BWSNDnMDXe3mpculMK3GkX7dam+atiKoP4/Y4KTHU+YbKu7oM
         i1krg2SyyH0x+znKQKAw+1lPPZVQUFubJDsPeF2Vnqk02Foj0a/+PO7+C81KA42kyp5f
         imDObtN81WPLMXWAczLCYPdVjLpFV9ZKazqMKuonV7wL4UAPw7yOfEd3pAZJ9xrcrgXz
         A0Gc73dMrJQqemv49dCVSWp/zAA1T1M1BBT+pHM7YvBSNtn3Btm0bS4sBB3dOOdUeCqn
         2kd57p7KKmYu9yb4XpgWEgDPhESbChEPGV8RVDzILwzDaidn8zDQFwbMTn19JMuPvQb1
         4gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766587717; x=1767192517;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv8uVhQiYXeEfFC22LTWeYBZIiji9JQILeQzDCWhcvk=;
        b=Q6PY+dNnIDWOsMINzvJaQNvx2Y8XBzu9uReLiTwMds+os4Qso2DaGAR0E/Um90UoXI
         6skVY3Q0mjXGQkpFlsDqzZqF3xteCTs/2ihq03Lq/WzCkpuog1BfWf8e235Y/p0SZiHq
         MT605mcJY4pOP7qIrQjX6ZVIFvSipgk2T6/waaPqBpBQY9sQXu0KSs1rowCo7Dduplrp
         uk4tBCm203yIH9DprGNL0yJdnL/KcXSpsK9ZxA0wTolcPJ3SYWQhd/1jGveN7igUJsfi
         k5BHniveUrGYr7j9uYyUenl/fSnCbgAcR8F25EgIb0LimyfFv2QddYuYBwNXP0pcTtZt
         p/4A==
X-Gm-Message-State: AOJu0YzDp73ywHZvL1iRC7J14/rbkHnqusW6pVrJzM2VajopGfgBbIOX
	01CrvGY+Q5rdKqaZHUIc2B2enh/dI+1U7m1GXLXurdn3c59Id7uamq/I94/YCZB/QiI=
X-Gm-Gg: AY/fxX5Rd5aA80NrDPrCPJ2h1YyTLXZ42ZXDEvxT8mdpg7XUBez22Nj6ImfflrcmS7E
	E8eoYkYPvDaFCbPpFcVmSxneyCXLu5SWI4zo6RmguMGmvCSd1v29Nf26onYFTv7391UT4i9FB6c
	umc3825id8zRXWcTfmHr+qYvR1Zk1RAW5XWb9/3vT0y/tTIzMtWKOwXcqUPmIxqR86KkzkVjJSu
	eMlC85sN7OeNwBge9WxgMp2p32sBadvUztexea3Z80WPdKDkaPguFIOD/17yZajw8hXJWdfxTmH
	mDu8D9WMDENbQQvYEAzazuar4g1Hkfycm62k8bxiMjJDHOJZEn8sTKXMlnNAzj27trKzYupm6RE
	VDlZ1QQX2K0dBUXn1HTJ/2Ik2eCJRVJoPOqyZ0K/d9l8BO74msrACsK0E94Wj0MJNooZG/0jLxB
	pvgXA/zfhx5gfTlZnn
X-Google-Smtp-Source: AGHT+IHUw306Ut7ymeV0kJIFuDFhQmJhzVDxJ8eqcQqn6KuZn3cQi9qGKe1+/PE9xQtkQkAuW1Wvfg==
X-Received: by 2002:a05:6214:5013:b0:880:5851:3c49 with SMTP id 6a1803df08f44-88d82621f22mr305922536d6.0.1766587717216;
        Wed, 24 Dec 2025 06:48:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d969fed73sm128870776d6.15.2025.12.24.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:48:36 -0800 (PST)
Message-ID: <43caf038367d00217d11237e54c82240c3caea5a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 04/22] media: rockchip: rga: use clk_bulk api
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
Date: Wed, 24 Dec 2025 09:48:35 -0500
In-Reply-To: <20251203-spu-rga3-v2-4-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-4-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-5GfWg0gYb1YIqmTgJN+W"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-5GfWg0gYb1YIqmTgJN+W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Use the clk_bulk API to avoid code duplication for each of the three
> clocks.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 64 ++++----------------=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 5 +--
> =C2=A02 files changed, 9 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d993811..ef568b3758380 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -698,48 +698,10 @@ static const struct video_device rga_videodev =3D {
> =C2=A0	.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> =C2=A0};
> =C2=A0
> -static int rga_enable_clocks(struct rockchip_rga *rga)
> -{
> -	int ret;
> -
> -	ret =3D clk_prepare_enable(rga->sclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga sclk: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->aclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga aclk: %d\n", ret);
> -		goto err_disable_sclk;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->hclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga hclk: %d\n", ret);
> -		goto err_disable_aclk;
> -	}
> -
> -	return 0;
> -
> -err_disable_aclk:
> -	clk_disable_unprepare(rga->aclk);
> -err_disable_sclk:
> -	clk_disable_unprepare(rga->sclk);
> -
> -	return ret;
> -}
> -
> -static void rga_disable_clocks(struct rockchip_rga *rga)
> -{
> -	clk_disable_unprepare(rga->sclk);
> -	clk_disable_unprepare(rga->hclk);
> -	clk_disable_unprepare(rga->aclk);
> -}
> -
> =C2=A0static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> +	int ret;
> =C2=A0
> =C2=A0	core_rst =3D devm_reset_control_get(rga->dev, "core");
> =C2=A0	if (IS_ERR(core_rst)) {
> @@ -771,22 +733,10 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	udelay(1);
> =C2=A0	reset_control_deassert(ahb_rst);
> =C2=A0
> -	rga->sclk =3D devm_clk_get(rga->dev, "sclk");
> -	if (IS_ERR(rga->sclk)) {
> -		dev_err(rga->dev, "failed to get sclk clock\n");
> -		return PTR_ERR(rga->sclk);
> -	}
> -
> -	rga->aclk =3D devm_clk_get(rga->dev, "aclk");
> -	if (IS_ERR(rga->aclk)) {
> -		dev_err(rga->dev, "failed to get aclk clock\n");
> -		return PTR_ERR(rga->aclk);
> -	}
> -
> -	rga->hclk =3D devm_clk_get(rga->dev, "hclk");
> -	if (IS_ERR(rga->hclk)) {
> -		dev_err(rga->dev, "failed to get hclk clock\n");
> -		return PTR_ERR(rga->hclk);
> +	ret =3D devm_clk_bulk_get(rga->dev, ARRAY_SIZE(rga->clks), rga->clks);
> +	if (ret) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -935,7 +885,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	rga_disable_clocks(rga);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(rga->clks), rga->clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -944,7 +894,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	return rga_enable_clocks(rga);
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(rga->clks), rga->clks);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pm_ops rga_pm =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b120fabf..a922fac0c01a3 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __RGA_H__
> =C2=A0#define __RGA_H__
> =C2=A0
> +#include <linux/clk.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> @@ -81,9 +82,7 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> -	struct clk *sclk;
> -	struct clk *aclk;
> -	struct clk *hclk;
> +	struct clk_bulk_data clks[3];
> =C2=A0	struct rockchip_rga_version version;
> =C2=A0
> =C2=A0	/* vfd lock */

--=-5GfWg0gYb1YIqmTgJN+W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUv9QwAKCRDZQZRRKWBy
9PD/AP4tic+jV60iRFkPYzejPFAmtdDlWpNwzUiuwJZwW678VwEAnEx6nok/9TcX
lGjkyKo77ZGxsPzeclf3xOMh+37c4QA=
=g61U
-----END PGP SIGNATURE-----

--=-5GfWg0gYb1YIqmTgJN+W--

