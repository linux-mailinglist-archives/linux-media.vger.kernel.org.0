Return-Path: <linux-media+bounces-18211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4759F976AFB
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 15:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B351D1F26A2E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 13:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683501BC9E8;
	Thu, 12 Sep 2024 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEoURQMz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD21BC091;
	Thu, 12 Sep 2024 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148445; cv=none; b=nbu5j+48gJZMYFoy4U1XZa0ZHPLsI9+PWA7hLnJJn3dIiGPwq4oGRxicdvMk/6ZSPKdQv444TZeifoCL6W5O16vVQA6tkexcOMVIF4VQcn7ght0U02MbCHeY95+M6VGMs5UIqUjBgrge9w8aZZGrowzBeHryKFi8wqpERqP7GXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148445; c=relaxed/simple;
	bh=4KHgd9/NuUJA/iogGNZq1pjICMNVk3ke/h2KcLeKpFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhwwQyDSMYKCn7cHWMS1RtyDjGwshlZeLDWj84qCHfRmj7LqNPYvAAYFmAamXMQ+0vOlrZAy0FilQ9MT8+2Czq2F4Jml9PXF4T9XBWpsllhQ4V67MenkSmPanIYlyQxpwAXxzRyR3x/VqoC24vyZ7ma8Y34I2e75tbxQwyz6k8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEoURQMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF6CC4CED3;
	Thu, 12 Sep 2024 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148445;
	bh=4KHgd9/NuUJA/iogGNZq1pjICMNVk3ke/h2KcLeKpFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eEoURQMzl4uK9LnNqeCsK0A9jXEmZyXVYQ1/lOBg0zAVE/YwxZTvodJ2EJEynpE/z
	 EyA19426z8Eg+3jmBZLHztttwrsnfeQOJSuDZHa2tFSQWu9Os0kZjbWzQ0DupzOnVt
	 YrjuDhxypveu4Gxl1QhN4KDUXGu2RfQo4CCy0uVGcyX+4WqD9dlqZN/i1VqGPvoSoU
	 jKMJj8ZNk0UC+UAb0ikbYQ+4UdyqFQaFTwOm8uTF00TQU/vdc28jk1unpiS2jauWMH
	 jis2cGal/SqwT96GP7vwHhkkPop3EqErAr61gavNwF3qXSTnjueY4CJyyAwn2Q7z6x
	 ncy0ndfrt90sQ==
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-846bec788f0so289074241.1;
        Thu, 12 Sep 2024 06:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG0NEACOKc+dMBCZGTZ8xVOl8PI+KAVSvkNfDTjWeZ2i4UI//KCMsZJ3OxbK8i3dWIuv78SasmiBWH90M=@vger.kernel.org, AJvYcCUrCo4H1q1utX8AJgEJLNjLDNvI+gAuQ6qgqjcv4qB+iH5FXmHIU//lcy+AU7IVqZ42VKGr89O6muUIU5o=@vger.kernel.org, AJvYcCWT0MibBs7Zx6Pt2gHuScGxUAzuWBXdqTxx+j59YU70hOj8M+arWWhE+wOAXZj22KqFDLi1IUO7dlhE5mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QDS7vVc+TwuRyUwKa/6Ff8A8uyVob5JSEdysOay6RO85b+Hp
	Bv1CzGSPMdU3aoGBN+mG7yoHP3JPeVA7gjF4IeIASMHaPjQPPa6nG/TIT6CJC4xM4+FgeDeYiWc
	0+DDCAqZI35wjb/P2osEZ4GXUAM8=
X-Google-Smtp-Source: AGHT+IFdG3nyBgaM+dgqRNeaAW6o967G312TmBPCLufVVeguRLGOoO0hIYuQ9TY4+JPPJnXB8gHCqXsU8ZgeDhPXTVw=
X-Received: by 2002:a05:6122:54b:b0:4f6:a7f7:164d with SMTP id
 71dfb90a1353d-5032d52bd19mr2196315e0c.8.1726148444329; Thu, 12 Sep 2024
 06:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu> <20240902-imx214-v1-3-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-3-c96cba989315@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 12 Sep 2024 15:40:28 +0200
X-Gmail-Original-Message-ID: <CAPybu_0-wmZSbzqqby1yUoksZ5a3oj6-Mp5cR4BT6V7moJ247g@mail.gmail.com>
Message-ID: <CAPybu_0-wmZSbzqqby1yUoksZ5a3oj6-Mp5cR4BT6V7moJ247g@mail.gmail.com>
Subject: Re: [PATCH 03/13] media: i2c: imx214: Simplify with dev_err_probe()
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:53=E2=80=AFPM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> Error handling in probe() can be a bit simpler with dev_err_probe().
>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>

> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 52 ++++++++++++++++++++--------------------=
------
>  1 file changed, 22 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 283d4783c22e..ad2f1db6baeb 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -931,14 +931,12 @@ static int imx214_parse_fwnode(struct device *dev)
>         int ret;
>
>         endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL=
);
> -       if (!endpoint) {
> -               dev_err(dev, "endpoint node not found\n");
> -               return -EINVAL;
> -       }
> +       if (!endpoint)
> +               return dev_err_probe(dev, -EINVAL, "endpoint node not fou=
nd\n");
>
>         ret =3D v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>         if (ret) {
> -               dev_err(dev, "parsing endpoint node failed\n");
> +               dev_err_probe(dev, ret, "parsing endpoint node failed\n")=
;
>                 goto done;
>         }
>
> @@ -947,8 +945,9 @@ static int imx214_parse_fwnode(struct device *dev)
>                         break;
>
>         if (i =3D=3D bus_cfg.nr_of_link_frequencies) {
> -               dev_err(dev, "link-frequencies %d not supported, Please r=
eview your DT\n",
> -                       IMX214_DEFAULT_LINK_FREQ);
> +               dev_err_probe(dev, -EINVAL,
> +                             "link-frequencies %d not supported, Please =
review your DT\n",
> +                             IMX214_DEFAULT_LINK_FREQ);
>                 ret =3D -EINVAL;
>                 goto done;
>         }
> @@ -976,34 +975,27 @@ static int imx214_probe(struct i2c_client *client)
>         imx214->dev =3D dev;
>
>         imx214->xclk =3D devm_clk_get(dev, NULL);
> -       if (IS_ERR(imx214->xclk)) {
> -               dev_err(dev, "could not get xclk");
> -               return PTR_ERR(imx214->xclk);
> -       }
> +       if (IS_ERR(imx214->xclk))
> +               return dev_err_probe(dev, PTR_ERR(imx214->xclk),
> +                                    "failed to get xclk\n");
>
>         ret =3D clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> -       if (ret) {
> -               dev_err(dev, "could not set xclk frequency\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to set xclk freque=
ncy\n");
>
>         ret =3D imx214_get_regulators(dev, imx214);
> -       if (ret < 0) {
> -               dev_err(dev, "cannot get regulators\n");
> -               return ret;
> -       }
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");
>
>         imx214->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_L=
OW);
> -       if (IS_ERR(imx214->enable_gpio)) {
> -               dev_err(dev, "cannot get enable gpio\n");
> -               return PTR_ERR(imx214->enable_gpio);
> -       }
> +       if (IS_ERR(imx214->enable_gpio))
> +               return dev_err_probe(dev, PTR_ERR(imx214->enable_gpio),
> +                                    "failed to get enable gpio\n");
>
>         imx214->regmap =3D devm_regmap_init_i2c(client, &sensor_regmap_co=
nfig);
> -       if (IS_ERR(imx214->regmap)) {
> -               dev_err(dev, "regmap init failed\n");
> -               return PTR_ERR(imx214->regmap);
> -       }
> +       if (IS_ERR(imx214->regmap))
> +               return dev_err_probe(dev, PTR_ERR(imx214->regmap),
> +                                    "regmap init failed\n");
>
>         v4l2_i2c_subdev_init(&imx214->sd, client, &imx214_subdev_ops);
>         imx214->sd.internal_ops =3D &imx214_internal_ops;
> @@ -1029,20 +1021,20 @@ static int imx214_probe(struct i2c_client *client=
)
>
>         ret =3D media_entity_pads_init(&imx214->sd.entity, 1, &imx214->pa=
d);
>         if (ret < 0) {
> -               dev_err(dev, "could not register media entity\n");
> +               dev_err_probe(dev, ret, "failed to init entity pads\n");
>                 goto free_ctrl;
>         }
>
>         imx214->sd.state_lock =3D imx214->ctrls.lock;
>         ret =3D v4l2_subdev_init_finalize(&imx214->sd);
>         if (ret < 0) {
> -               dev_err(dev, "subdev init error: %d\n", ret);
> +               dev_err_probe(dev, ret, "subdev init error\n");
>                 goto free_entity;
>         }
>
>         ret =3D v4l2_async_register_subdev_sensor(&imx214->sd);
>         if (ret < 0) {
> -               dev_err(dev, "could not register v4l2 device\n");
> +               dev_err_probe(dev, ret, "failed to register sensor sub-de=
vice\n");
>                 goto error_subdev_cleanup;
>         }
>
>
> --
> 2.46.0
>
>

