Return-Path: <linux-media+bounces-22842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E40769E880A
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 22:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B144280FCA
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 21:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D089C19340E;
	Sun,  8 Dec 2024 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKE79du5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6CD13A865;
	Sun,  8 Dec 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733692070; cv=none; b=lOZz3m58A+w5tcyHuRqAd01nBDmS7KwVTMPTP/qN/5dhrPeH2KpIURUOJ1u+a7oJlXDgX4UmDSGzhzzGOSBslIS7H6nqSMfSdmrqS38XPoMqWlfCTH0Ia/HSkQ9tZ5VctiZa0jgES6fTYfKx7NyJZanctUB0hy8asyyYUjn4ZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733692070; c=relaxed/simple;
	bh=6uDJ68v+I9nU9szfUFsr8gct9WqPvN8xKzLnRS3ySSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWVlZmb1VROjJPJEP3xoumq/p8ac8PmAbSt/U6QKWzeT3Pc6n7BdQbeeBaniqx1bRfuYvIh7l/0IXX0xsbFE4yKvv18eN9VOWOwU0EQBkQg2vGaUTkbMOD3PczQusN3pI9LiNM60mnlci6eBT3YCMJ8fcgwHb+b8lkhHW2Gx0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKE79du5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B63C4CEE2;
	Sun,  8 Dec 2024 21:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733692069;
	bh=6uDJ68v+I9nU9szfUFsr8gct9WqPvN8xKzLnRS3ySSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pKE79du51QRia4t0bg06brxwOstYbkr0CQhfN53+dOMqoE3DZ4r4U3IhIVnKiPPzA
	 UcHwY0Rr7YLO9/N9upVgIviYp5nnjNroXru3BZNuaJIF1V0iKfr1wsw//+wfoWyhvE
	 Xaxo/z2Vr4wMDFLQwkY2ZNVub6HhRvf1uDYxEBN5ycIpB3DiGhK+rrtLkm0D/KM7ev
	 Zss9RFlnJYxspkZwAxTEheDZ3Cwb7ZhMqephdQJTVV4b9Rau8Ax/m/Uw/R37xvL1kF
	 Az+Wr0UEPf06xun54j/Kym+dV1d7hFtQIzvIPmtHeIMTwXjSaXBfsr6+VfEnVp6H5J
	 V6ZkK56C6BRGg==
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51878d9511bso75733e0c.0;
        Sun, 08 Dec 2024 13:07:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3i9R+8lhiWFDWPUm9CaPvVOLyrggSPCpBx9A1wG+hf868lo+sKAvVkyG3TUAHBwkZ0GhiJM7cORNentk=@vger.kernel.org, AJvYcCV1xmMVuYB8btBREbFtcJIlJq2/byp0ZorzbiWpb1MDcuU3Vt0W0UUH/4991LRHSreHFcHxVxRbmF1BLH0=@vger.kernel.org, AJvYcCWK6XwXccb0J81ZQivpgsxuo4VbS7+t+11QBDjre1vGP6QeYPNqv+rmEQJEe9oEFbG+sH+Yqoop2vsWdPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv+vGRaYpvJYZFSSQ3Nh+/r/Iid7ekNpIvrrxWK3ku6sQPFVm
	lsJ0YSV5l9hMFwp1fekLgwCCvogkmhs6xfnZeeKYLAw6uO5evvy7tiGouPY2GUN8HnxQJgR+41m
	CiNZhfE5jmNQcKDWaMC7vqRNdqaE=
X-Google-Smtp-Source: AGHT+IEQrAPUcXaZRgGEksuxmppVCyx20vEjcIeP7IKKhtN8+o7RgxpKPzsDIcUHLwklMhrj07F/1UeRUfvUII5xh50=
X-Received: by 2002:a05:6122:6b05:b0:516:c0b:8bfe with SMTP id
 71dfb90a1353d-5160c0b8ec8mr6824643e0c.1.1733692068853; Sun, 08 Dec 2024
 13:07:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu> <20241207-imx214-v3-6-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-6-ab60af7ee915@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Sun, 8 Dec 2024 22:07:33 +0100
X-Gmail-Original-Message-ID: <CAPybu_32rn09ba-ouZRVTCzZQ+EQTtmVry_0d8xMTYtc2Y7Bnw@mail.gmail.com>
Message-ID: <CAPybu_32rn09ba-ouZRVTCzZQ+EQTtmVry_0d8xMTYtc2Y7Bnw@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] media: i2c: imx214: Check number of lanes from
 device tree
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
On Sat, Dec 7, 2024 at 9:48=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The imx214 camera is capable of either two-lane or four-lane operation.
>
> Currently only the four-lane mode is supported, as proper pixel rates
> and link frequences for the two-lane mode are unknown.
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 07926f7257877155548f7bcf0e7ee80037b4ce6c..f1c72db0775eaf4810f762e87=
98d301c5ad9923c 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -199,7 +199,6 @@ struct imx214 {
>
>  /*From imx214_mode_tbls.h*/
>  static const struct cci_reg_sequence mode_4096x2304[] =3D {
> -       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -272,7 +271,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>  };
>
>  static const struct cci_reg_sequence mode_1920x1080[] =3D {
> -       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -788,6 +786,13 @@ static int imx214_start_streaming(struct imx214 *imx=
214)
>                 return ret;
>         }
>
> +       ret =3D cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
> +                       IMX214_CSI_4_LANE_MODE, NULL);
> +       if (ret) {
> +               dev_err(imx214->dev, "%s failed to configure lanes\n", __=
func__);
> +               return ret;
> +       }
> +
>         ret =3D cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg=
_table,
>                                   imx214->cur_mode->num_of_regs, NULL);
>         if (ret < 0) {
> @@ -948,6 +953,13 @@ static int imx214_parse_fwnode(struct device *dev)
>                 goto done;
>         }
>
nit: I'd have only added this check, and do not introduce any of the
other changes until we support more lanes

But if you prefer this way and works, I have no objection.

Thanks!
> +       /* Check the number of MIPI CSI2 data lanes */
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> +               ret =3D dev_err_probe(dev, -EINVAL,
> +                                   "only 4 data lanes are currently supp=
orted\n");
> +               goto done;
> +       }
> +
>         for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++)
>                 if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ)
>                         break;
>
> --
> 2.47.1
>
>

