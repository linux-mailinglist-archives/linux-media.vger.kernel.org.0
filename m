Return-Path: <linux-media+bounces-16214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 214FD950593
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904F51F239A2
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120BE19AD6E;
	Tue, 13 Aug 2024 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FzOizqnP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B014A600;
	Tue, 13 Aug 2024 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553599; cv=none; b=HIiWTNt3D2TQnv2T5y2ezFRkJsshVIs18RmVAUPhhJOFASpznKNv0bzYeDKRKAFr2fnpGpyRQPQ4m/Wtg2d1u/JDxhPxcrMBO+falT2R+QB1L7BTUtYb3kz4asn3GU4zucNW56vNosk5MZIbGVbdRZlaivTjdAmdDNNR4rdx7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553599; c=relaxed/simple;
	bh=Tv6nVRpA/JfrDD9X1z6zbbGt9KN/YiGuWF85y9EwFPw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cEDDoBK389evPMymPPgO4/fo4UMFyD+yQnMXxrsZdT3CWKnn+LlVWeniKyG+PnBSw1z4K2bbRNRwceiPIDrxoCegLfM4u18/IW9JQkmYhKR5mtXAxx3LVMXNbciTD7UYZhoFvsa2lb/R7g5R17duqkoPygANzfGa/IYxz08qpp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FzOizqnP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0A4F2EC;
	Tue, 13 Aug 2024 14:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723553538;
	bh=Tv6nVRpA/JfrDD9X1z6zbbGt9KN/YiGuWF85y9EwFPw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FzOizqnPNI4C3WZZnLFSzbVagIQ3LJohwfbMrAzXy51VbDn3UusRc26gqb3ZIt0Gc
	 Kmxp5dIOSdwyFZ4Z3nAyTH1v5U8BpearNQ9IrQDqtDOd0ccCpekF30MF4Myq/kY6h/
	 KYFbH44h6Gg39B3zSXUm0iO0Hv878brGdMGzvFaQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240813102035.1763559-7-vladimir.zapolskiy@linaro.org>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org> <20240813102035.1763559-7-vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 6/6] media: i2c: og01a1b: Add management of optional sensor supply lines
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Date: Tue, 13 Aug 2024 13:53:13 +0100
Message-ID: <172355359318.1687952.6620713968085551486@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Vladimir Zapolskiy (2024-08-13 11:20:35)
> Omnivision OG01A1B camera sensor is supplied by tree power rails,

three?

> if supplies are present as device properties, include them into
> sensor power up sequence.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/i2c/og01a1b.c | 86 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
> index 90a68201f43f..0150fdd2f424 100644
> --- a/drivers/media/i2c/og01a1b.c
> +++ b/drivers/media/i2c/og01a1b.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -422,6 +423,9 @@ static const struct og01a1b_mode supported_modes[] =
=3D {
>  struct og01a1b {
>         struct clk *xvclk;
>         struct gpio_desc *reset_gpio;
> +       struct regulator *avdd;
> +       struct regulator *dovdd;
> +       struct regulator *dvdd;
> =20
>         struct v4l2_subdev sd;
>         struct media_pad pad;
> @@ -982,11 +986,46 @@ static int og01a1b_power_on(struct device *dev)
>  {
>         struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
>         struct og01a1b *og01a1b =3D to_og01a1b(sd);
> +       int ret;
> +
> +       if (og01a1b->avdd) {
> +               ret =3D regulator_enable(og01a1b->avdd);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (og01a1b->dovdd) {
> +               ret =3D regulator_enable(og01a1b->dovdd);
> +               if (ret)
> +                       goto avdd_disable;
> +       }
> +
> +       if (og01a1b->dvdd) {
> +               ret =3D regulator_enable(og01a1b->dvdd);
> +               if (ret)
> +                       goto dovdd_disable;
> +       }

Perhaps regulator_bulk_enable()/regulator_bulk_disable() would be
suitable here to reduce lots of repetitive code and error handling?

> =20
>         gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
>         usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
> =20
> -       return clk_prepare_enable(og01a1b->xvclk);
> +       ret =3D clk_prepare_enable(og01a1b->xvclk);
> +       if (ret)
> +               goto dvdd_disable;
> +
> +       return 0;
> +
> +dvdd_disable:
> +       if (og01a1b->dvdd)
> +               regulator_disable(og01a1b->dvdd);
> +dovdd_disable:
> +       if (og01a1b->dovdd)
> +               regulator_disable(og01a1b->dovdd);
> +avdd_disable:
> +       if (og01a1b->avdd)
> +               regulator_disable(og01a1b->avdd);
> +
> +       return ret;
>  }
> =20
>  static int og01a1b_power_off(struct device *dev)
> @@ -998,6 +1037,15 @@ static int og01a1b_power_off(struct device *dev)
> =20
>         gpiod_set_value_cansleep(og01a1b->reset_gpio, 1);
> =20
> +       if (og01a1b->dvdd)
> +               regulator_disable(og01a1b->dvdd);
> +
> +       if (og01a1b->dovdd)
> +               regulator_disable(og01a1b->dovdd);
> +
> +       if (og01a1b->avdd)
> +               regulator_disable(og01a1b->avdd);
> +
>         return 0;
>  }
> =20
> @@ -1045,6 +1093,42 @@ static int og01a1b_probe(struct i2c_client *client)
>                 return PTR_ERR(og01a1b->reset_gpio);
>         }
> =20
> +       og01a1b->avdd =3D devm_regulator_get_optional(&client->dev, "avdd=
");
> +       if (IS_ERR(og01a1b->avdd)) {
> +               ret =3D PTR_ERR(og01a1b->avdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'avdd' regulator\n");
> +                       return ret;
> +               }
> +
> +               og01a1b->avdd =3D NULL;
> +       }
> +
> +       og01a1b->dovdd =3D devm_regulator_get_optional(&client->dev, "dov=
dd");
> +       if (IS_ERR(og01a1b->dovdd)) {
> +               ret =3D PTR_ERR(og01a1b->dovdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'dovdd' regulator\n"=
);
> +                       return ret;
> +               }
> +
> +               og01a1b->dovdd =3D NULL;
> +       }
> +
> +       og01a1b->dvdd =3D devm_regulator_get_optional(&client->dev, "dvdd=
");
> +       if (IS_ERR(og01a1b->dvdd)) {
> +               ret =3D PTR_ERR(og01a1b->dvdd);
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(&client->dev, ret,
> +                                     "Failed to get 'dvdd' regulator\n");
> +                       return ret;
> +               }
> +
> +               og01a1b->dvdd =3D NULL;
> +       }
> +
>         /* The sensor must be powered on to read the CHIP_ID register */
>         ret =3D og01a1b_power_on(&client->dev);
>         if (ret)
> --=20
> 2.45.2
>

