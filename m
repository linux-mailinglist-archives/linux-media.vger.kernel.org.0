Return-Path: <linux-media+bounces-20588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E99B6203
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA741C21354
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A411E5703;
	Wed, 30 Oct 2024 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvN641iv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974F1E00B6;
	Wed, 30 Oct 2024 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288357; cv=none; b=V16OPr+idvoiB6ktJFLHO517HtLUPspT/KTGa2+Xtqch6bQ76hjPmoapq2wtW4yHsR9K7LZOFtN5iku3yoLWnMyppJlHJ8VRd4sjkb0VrUSe3VntA938/lNlqewfs0VtF7saWCFz0wu/It/U104G9d5i6+OPA3gDp2H01bTw67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288357; c=relaxed/simple;
	bh=eiYRD7zCmW6r80UgPSfahuzaI3z9MGeiBsIrWhGnOaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2JLm5E6pdl7JuTVpw+7/QIrhfb9VpMbe74wL3LyxjRiq6RudVxRrrKx/aOzEUDNij2cV76v1rg9zJLhaaf+5KPoyZKg6nPr+xRgx+Lt8CHZsue1QSYkJyU81yKQCLeM0yWphsrjnSMW09icQIGoEpNz/uQ/d9KKDbAGQByw8s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvN641iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F65C4CEE5;
	Wed, 30 Oct 2024 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730288357;
	bh=eiYRD7zCmW6r80UgPSfahuzaI3z9MGeiBsIrWhGnOaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HvN641ivHdVIOPg38qnp4sr3384KfVUkLI1VlPAuTFWLTThf7DCDESx+Q6ZeUOS1o
	 Qa1sp73wpH+0ySLKa/nINxGRcCgkfX4Tz7QqOlx4MbubmuPaL5oRg9ZhN6RROrB03B
	 fMvFA0QBenXPq7+gDY6iwNl7cdnsRAl7V1fUK60Hkfm14ujvD5nYfRyFRHLcFWwctV
	 LOHpfP7KKj2wdpPTv46iscCt5vK8dI2nX9SyDdGva6TdO8lY+IoL0XAf2bWWwGB8vz
	 nFgVljRYMveig8GVSPes3BLdb4IxFGza3lJLN6LkHYvj8eza91V0obkDoXnXgnyF3z
	 1Lg8ct0ju4Clw==
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-84fcd9f4e98so1620993241.0;
        Wed, 30 Oct 2024 04:39:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4ZQQT2ldZ3RJe3ns0MB2pdjcF7YPPoryCxFcD+8C+OgVvWeuMQPkRx6LQi2N5VmrRqy1lJ48MRNJRfSk=@vger.kernel.org, AJvYcCW3Rt9TdljMFL8b6j2dX62k2SZK8A52CmkdsO1sqf/lU/VaKZkz2F1sj6axa8KiNxFdrFTMnJb7QJ6qWBc=@vger.kernel.org, AJvYcCX62S8CHpfjSjy1T82uzrATleHONrNqkzKgfUOEmMaPqVcM1fWgf/3OwyoszJLbEHuQqyRQNWde8wTlVw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0BcGcMQ5/X1VztIVK2mP77NUMKzUDVXjsuZqNmufXq/GSYHB
	QrTkjM8WGGUPVlD/1tfvJ9/7IFkbW4iqSLS/QzCOGupoqIoOahGR4XsgVdA0z5Uoz2zXvHpjZix
	8tectIuXa9mdiPzpqBttsxol8YyI=
X-Google-Smtp-Source: AGHT+IHxBG/XYrL65JET4f8lbEvLUBaY0/DYd+k+TAwfIpTBNvaUKGZ2pp+m0JitHrIUvyQXH0yvqPIsVM1T3WZS7qY=
X-Received: by 2002:a05:6122:a2a:b0:50a:ca69:2b76 with SMTP id
 71dfb90a1353d-51014e8ca8dmr13583721e0c.0.1730288356293; Wed, 30 Oct 2024
 04:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-7-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-7-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 12:38:59 +0100
X-Gmail-Original-Message-ID: <CAPybu_28VXjfJksVccfvytB9PU2-saNpAos8sBtQnhgt8KKz2w@mail.gmail.com>
Message-ID: <CAPybu_28VXjfJksVccfvytB9PU2-saNpAos8sBtQnhgt8KKz2w@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] media: i2c: imx214: Check number of lanes from
 device tree
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
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
>  drivers/media/i2c/imx214.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 0c83149bcc3e3b833a087d26104eb7dfaafdf904..497baad616ad7374a92a3da2b=
7c1096b1d72a0c7 100644
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
> @@ -791,6 +789,13 @@ static int imx214_start_streaming(struct imx214 *imx=
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
> @@ -932,7 +937,7 @@ static int imx214_get_regulators(struct device *dev, =
struct imx214 *imx214)
>                                        imx214->supplies);
>  }
>
> -static int imx214_parse_fwnode(struct device *dev)
> +static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214=
)
We don't seem to use imx214 in the function. You probably do not want
to add this change.
>  {
>         struct fwnode_handle *endpoint;
>         struct v4l2_fwnode_endpoint bus_cfg =3D {
> @@ -951,6 +956,13 @@ static int imx214_parse_fwnode(struct device *dev)
>                 goto done;
>         }
>
> +       /* Check the number of MIPI CSI2 data lanes */
> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4) {
> +               dev_err_probe(dev, -EINVAL,
> +                             "only 4 data lanes are currently supported\=
n");
> +               goto done;
> +       }
> +
>         for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++)
>                 if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ)
>                         break;
> @@ -975,14 +987,14 @@ static int imx214_probe(struct i2c_client *client)
>         struct imx214 *imx214;
>         int ret;
>
> -       ret =3D imx214_parse_fwnode(dev);
> -       if (ret)
> -               return ret;
> -
>         imx214 =3D devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
>         if (!imx214)
>                 return -ENOMEM;
>
> +       ret =3D imx214_parse_fwnode(dev, imx214);
> +       if (ret)
> +               return ret;
I  am not against changing the order... but the commit message does
not mention it.

> +
>         imx214->dev =3D dev;
>
>         imx214->xclk =3D devm_clk_get(dev, NULL);
>
> --
> 2.47.0
>
>

