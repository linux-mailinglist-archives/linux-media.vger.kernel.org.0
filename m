Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617F1445C96
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 00:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhKDXPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 19:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhKDXPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 19:15:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF6EC061714;
        Thu,  4 Nov 2021 16:12:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 990273E7;
        Fri,  5 Nov 2021 00:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636067541;
        bh=qHm5VbOQRAHwdqDq9/3Q4h7/7+sc/b7bk511KxLC5UU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MCC5hp7CYVbeuWU92ynGZrps0W2F1e5rufCXEIlgg+auA/ruSir4EUESP0DzlGd3k
         NRuPJFsWncD8+V6mWCqUvdylLbyKdTRX70Jftgv26z5lQtgk4vpwl4aRS1+CyoE72y
         MPJq8WsmhLWIeTLTpnWZXZCeoczd06UEseAK9i0k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211104110924.248444-3-jacopo+renesas@jmondi.org>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org> <20211104110924.248444-3-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 2/2] media: max9271: Fail loud on bus errors in call sites
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 04 Nov 2021 23:12:19 +0000
Message-ID: <163606753931.3601475.14148653571463183259@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jacopo Mondi (2021-11-04 11:09:24)
> As not all bus access errors are fatal, as in example reads performed
> in a busy loop, it's responsibility of the bus access function caller
> to fail louder on fatal errors.
>=20
> Instrument all functions in the max9271 library driver to fail on fatal
> read/write errors and demote the max9271_write() error level to debug
> to align it to the one in max9271_read().
>=20
> While at it, align the style of the existing error messages by removing
> "MAX9271" from the output string, as the device log helpers already
> identify the driver emitting the message.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Seems good to me overall.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9271.c | 105 ++++++++++++++++++++++--------------
>  1 file changed, 64 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index aa4add473716..f5f354b8a43c 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -45,7 +45,7 @@ static int max9271_write(struct max9271_device *dev, u8=
 reg, u8 val)
> =20
>         ret =3D i2c_smbus_write_byte_data(dev->client, reg, val);
>         if (ret < 0)
> -               dev_err(&dev->client->dev,
> +               dev_dbg(&dev->client->dev,
>                         "%s: register 0x%02x write failed (%d)\n",
>                         __func__, reg, ret);
> =20
> @@ -120,8 +120,11 @@ int max9271_set_serial_link(struct max9271_device *d=
ev, bool enable)
>          * Therefore a conservative delay seems best here.
>          */
>         ret =3D max9271_write(dev, 0x04, val);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err(&dev->client->dev, "Failed to set serial link (%d=
)\n",
> +                       ret);
>                 return ret;
> +       }
> =20
>         usleep_range(5000, 8000);
> =20
> @@ -134,8 +137,11 @@ int max9271_configure_i2c(struct max9271_device *dev=
, u8 i2c_config)
>         int ret;
> =20
>         ret =3D max9271_write(dev, 0x0d, i2c_config);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err(&dev->client->dev, "Failed to configure I2C (%d)\=
n",
> +                       ret);
>                 return ret;
> +       }
> =20
>         /* The delay required after an I2C bus configuration change is not
>          * characterized in the serializer manual. Sleep up to 5msec to
> @@ -153,7 +159,7 @@ int max9271_set_high_threshold(struct max9271_device =
*dev, bool enable)
> =20
>         ret =3D max9271_read(dev, 0x08);
>         if (ret < 0)
> -               return ret;
> +               goto out;
> =20
>         /*
>          * Enable or disable reverse channel high threshold to increase
> @@ -161,11 +167,15 @@ int max9271_set_high_threshold(struct max9271_devic=
e *dev, bool enable)
>          */
>         ret =3D max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~B=
IT(0));
>         if (ret < 0)
> -               return ret;
> +               goto out;
> =20
>         usleep_range(2000, 2500);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to set high threshold (%d)\n",=
 ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_set_high_threshold);
> =20
> @@ -186,7 +196,7 @@ int max9271_configure_gmsl_link(struct max9271_device=
 *dev)
>         ret =3D max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
>                             MAX9271_EDC_1BIT_PARITY);
>         if (ret < 0)
> -               return ret;
> +               goto out;
> =20
>         usleep_range(5000, 8000);
> =20
> @@ -199,11 +209,15 @@ int max9271_configure_gmsl_link(struct max9271_devi=
ce *dev)
>                             MAX9271_PCLK_AUTODETECT |
>                             MAX9271_SERIAL_AUTODETECT);
>         if (ret < 0)
> -               return ret;
> +               goto out;
> =20
>         usleep_range(5000, 8000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to configure GMSL link (%d)\n"=
, ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_configure_gmsl_link);
> =20
> @@ -213,18 +227,20 @@ int max9271_set_gpios(struct max9271_device *dev, u=
8 gpio_mask)
> =20
>         ret =3D max9271_read(dev, 0x0f);
>         if (ret < 0)
> -               return 0;
> +               goto out;
> =20
>         ret |=3D gpio_mask;
>         ret =3D max9271_write(dev, 0x0f, ret);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev, "Failed to set gpio (%d)\n", r=
et);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> =20
>         usleep_range(3500, 5000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to set gpio (%d)\n", ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_set_gpios);
> =20
> @@ -234,18 +250,20 @@ int max9271_clear_gpios(struct max9271_device *dev,=
 u8 gpio_mask)
> =20
>         ret =3D max9271_read(dev, 0x0f);
>         if (ret < 0)
> -               return 0;
> +               goto out;
> =20
>         ret &=3D ~gpio_mask;
>         ret =3D max9271_write(dev, 0x0f, ret);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev, "Failed to clear gpio (%d)\n",=
 ret);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> =20
>         usleep_range(3500, 5000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to clear gpio (%d)\n", ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_clear_gpios);
> =20
> @@ -255,19 +273,21 @@ int max9271_enable_gpios(struct max9271_device *dev=
, u8 gpio_mask)
> =20
>         ret =3D max9271_read(dev, 0x0e);
>         if (ret < 0)
> -               return 0;
> +               goto out;
> =20
>         /* BIT(0) reserved: GPO is always enabled. */
>         ret |=3D (gpio_mask & ~BIT(0));
>         ret =3D max9271_write(dev, 0x0e, ret);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n"=
, ret);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> =20
>         usleep_range(3500, 5000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n", ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_enable_gpios);
> =20
> @@ -277,19 +297,21 @@ int max9271_disable_gpios(struct max9271_device *de=
v, u8 gpio_mask)
> =20
>         ret =3D max9271_read(dev, 0x0e);
>         if (ret < 0)
> -               return 0;
> +               goto out;
> =20
>         /* BIT(0) reserved: GPO cannot be disabled */
>         ret &=3D ~(gpio_mask | BIT(0));
>         ret =3D max9271_write(dev, 0x0e, ret);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n=
", ret);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> =20
>         usleep_range(3500, 5000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n", ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_disable_gpios);
> =20
> @@ -299,13 +321,13 @@ int max9271_verify_id(struct max9271_device *dev)
> =20
>         ret =3D max9271_read(dev, 0x1e);
>         if (ret < 0) {
> -               dev_err(&dev->client->dev, "MAX9271 ID read failed (%d)\n=
",
> +               dev_err(&dev->client->dev, "Failed to read the chip ID (%=
d)\n",
>                         ret);
>                 return ret;
>         }
> =20
>         if (ret !=3D MAX9271_ID) {
> -               dev_err(&dev->client->dev, "MAX9271 ID mismatch (0x%02x)\=
n",
> +               dev_err(&dev->client->dev, "Chip ID mismatch (0x%02x)\n",
>                         ret);
>                 return -ENXIO;
>         }
> @@ -321,7 +343,7 @@ int max9271_set_address(struct max9271_device *dev, u=
8 addr)
>         ret =3D max9271_write(dev, 0x00, addr << 1);
>         if (ret < 0) {
>                 dev_err(&dev->client->dev,
> -                       "MAX9271 I2C address change failed (%d)\n", ret);
> +                       "Failed to change I2C address (%d)\n", ret);
>                 return ret;
>         }
>         usleep_range(3500, 5000);
> @@ -337,7 +359,7 @@ int max9271_set_deserializer_address(struct max9271_d=
evice *dev, u8 addr)
>         ret =3D max9271_write(dev, 0x01, addr << 1);
>         if (ret < 0) {
>                 dev_err(&dev->client->dev,
> -                       "MAX9271 deserializer address set failed (%d)\n",=
 ret);
> +                       "Failed to set deser address (%d)\n", ret);
>                 return ret;
>         }
>         usleep_range(3500, 5000);
> @@ -351,22 +373,23 @@ int max9271_set_translation(struct max9271_device *=
dev, u8 source, u8 dest)
>         int ret;
> =20
>         ret =3D max9271_write(dev, 0x09, source << 1);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev,
> -                       "MAX9271 I2C translation setup failed (%d)\n", re=
t);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> +
>         usleep_range(3500, 5000);
> =20
>         ret =3D max9271_write(dev, 0x0a, dest << 1);
> -       if (ret < 0) {
> -               dev_err(&dev->client->dev,
> -                       "MAX9271 I2C translation setup failed (%d)\n", re=
t);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out;
> +
>         usleep_range(3500, 5000);
> =20
>         return 0;
> +
> +out:
> +       dev_err(&dev->client->dev,
> +               "Failed to set I2C addresses translation (%d)\n", ret);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(max9271_set_translation);
> =20
> --=20
> 2.33.1
>
