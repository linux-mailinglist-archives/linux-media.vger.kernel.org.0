Return-Path: <linux-media+bounces-18207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F8976AF2
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1B51C234E5
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CE41BA29C;
	Thu, 12 Sep 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YX7bZryw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD41AE845;
	Thu, 12 Sep 2024 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148429; cv=none; b=cX+/HnixjqNWxBTGrPx0cHFBkczehTqBxXwYawgRl16p7o7Fny9IMRWngCDpm1FFYBOYtF/vtT2SuXD/eRMAgoYllTUNHQmIZKDzMIifyMVf01o0eBALkJ7GOSAPxrQ3cAw7ZiVRr6GHDwC0nr3bxhu/VkW8Q5ZL/yP5G96/U50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148429; c=relaxed/simple;
	bh=YF00am0CMauOpkhKobRsCpQSsBcC8dux9WPjZvQu2P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r08o7oiodk4BcY5fMmrm57nTeHojF7RyziOY+Gq9XD4N0hFWF/6w7tbOyvM8yOdwQhlCSD53RsnWwTmDn2C3l8ahextx81hnk56QJUpCFrWLkgbaaVaJCXGluh0eIybZOqKAcF3B0KPXvHPN6nLzOmChJBvau3a0TNBCBh8rN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YX7bZryw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D76C4CECC;
	Thu, 12 Sep 2024 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148429;
	bh=YF00am0CMauOpkhKobRsCpQSsBcC8dux9WPjZvQu2P8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YX7bZryw1K375mldaD8PF9oP820DeSWWfVcmhQNEXmVXP6VAzqzgy+yIpGZkdx/1Q
	 kd/1wjoF9YMVL/ttLrEXqs2nEuHAJbT2+DOoz2fP5PKtZOuJn/4yFhz473vSKtP6/D
	 MmD+5P/LeYgYaIJB1/9UaNJjxIgtlRJaiIAppvOAgVJrXuhTNFfhtEe2/r2QvJGRzm
	 TMx+qBmwfkRoFJTqsSGwogZBe5IU6EDHAPvFexB0S61rKljJaMjXwcZzRrhdz1Oxd5
	 ZY8LgD5EIbIOVIdKAlEWVsMWDOHfa/9yPbzqi3QSpL+qzf12sdMh+A1kRjOA3w52LD
	 UWkyhumSPftaw==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-710d5d9aac1so424822a34.3;
        Thu, 12 Sep 2024 06:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbLMZMYYy3Eq8PFNaxfSLsrRue+rZj8NcehO9CFCQGsUBok8+qF9k42N8M4B2MXeTrikSiBshexfFYYrQ=@vger.kernel.org, AJvYcCWWQySGKCHQf/htJbNcAJJeVetrEHjDK3RLiJrRuuue0944AUtZx22BOCzZEru7LUfNvziiRRQCmxUjrsk=@vger.kernel.org, AJvYcCX3u5AGU9GI6h5NMq7QiX95YXxOFXsmxI6BzHzNXN31l4TGppVMlfN7O4ZOF3GIeiv2YVZjtD2UYPd5ev0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBLLf0fY96GZuTxwlHUqbE3pJfg9L14ZZfYLvFNMspf3C/XeB
	JNOKjDSAB303QYVO5i14Yu5MBkBoJ+9lvE409lZwTumllpTlGYZnCnDdTBP3JfcrIvXNtmFQf7/
	K8en73EXG1u0qQWM9iCgDmQDMcbk=
X-Google-Smtp-Source: AGHT+IEM3fsmMaiIV0dyN3MjMz/N0pjnakzZrLEryu9ho/ZEYM+Bv2cdl82TeRaKSKT7yej2uq/X1dX4Ep/T3Xojr6s=
X-Received: by 2002:a05:6358:7182:b0:1b8:33db:8201 with SMTP id
 e5c5f4694b2df-1bb23de4152mr116747755d.24.1726148428711; Thu, 12 Sep 2024
 06:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-7-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-7-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:12 +0200
X-Gmail-Original-Message-ID: <CAPybu_0n2b87mzqm0GXwzWa9wyq4kpRMFNjZpMmpqoEz_w2=VA@mail.gmail.com>
Message-ID: <CAPybu_0n2b87mzqm0GXwzWa9wyq4kpRMFNjZpMmpqoEz_w2=VA@mail.gmail.com>
Subject: Re: [PATCH 07/13] media: i2c: imx214: Use number of lanes from device tree
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
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
>  drivers/media/i2c/imx214.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 4507e12dd4cd..3b422cddbdce 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -195,11 +195,13 @@ struct imx214 {
>         struct regulator_bulk_data      supplies[IMX214_NUM_SUPPLIES];
>
>         struct gpio_desc *enable_gpio;
> +
> +       /* Two or Four lanes */
> +       u8 lanes;
>  };
>
>  /*From imx214_mode_tbls.h*/
>  static const struct cci_reg_sequence mode_4096x2304[] =3D {
> -       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -272,7 +274,6 @@ static const struct cci_reg_sequence mode_4096x2304[]=
 =3D {
>  };
>
>  static const struct cci_reg_sequence mode_1920x1080[] =3D {
> -       { IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>         { IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>         { IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>         { IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -774,6 +775,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>         return 0;
>  };
>
> +static int imx214_configure_lanes(struct imx214 *imx214)
> +{
> +       return cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
> +                        imx214->lanes =3D=3D 2 ? IMX214_CSI_2_LANE_MODE =
:
> +                        IMX214_CSI_4_LANE_MODE, NULL);
> +};
> +
>  static int imx214_start_streaming(struct imx214 *imx214)
>  {
>         const struct imx214_mode *mode;
> @@ -786,6 +794,13 @@ static int imx214_start_streaming(struct imx214 *imx=
214)
>                 return ret;
>         }
>
> +       /* Configure two or four Lane mode */
> +       ret =3D imx214_configure_lanes(imx214);
> +       if (ret) {
> +               dev_err(imx214->dev, "%s failed to configure lanes\n", __=
func__);
> +               return ret;
> +       }
> +
>         mode =3D v4l2_find_nearest_size(imx214_modes,
>                                 ARRAY_SIZE(imx214_modes), width, height,
>                                 imx214->fmt.width, imx214->fmt.height);
> @@ -930,7 +945,7 @@ static int imx214_get_regulators(struct device *dev, =
struct imx214 *imx214)
>                                        imx214->supplies);
>  }
>
> -static int imx214_parse_fwnode(struct device *dev)
> +static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214=
)
>  {
>         struct fwnode_handle *endpoint;
>         struct v4l2_fwnode_endpoint bus_cfg =3D {
> @@ -949,6 +964,14 @@ static int imx214_parse_fwnode(struct device *dev)
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

Until there is support for lanes !=3D4. I think is best if we just add
this check to imx214_parse_fwnode() and remove everything else from
this patch


> +       imx214->lanes =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
>         for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++)
>                 if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LIN=
K_FREQ)
>                         break;
> @@ -973,14 +996,14 @@ static int imx214_probe(struct i2c_client *client)
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
> +
>         imx214->dev =3D dev;
>
>         imx214->xclk =3D devm_clk_get(dev, NULL);
>
> --
> 2.46.0
>
>

