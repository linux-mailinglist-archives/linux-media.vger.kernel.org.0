Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AB0270CED
	for <lists+linux-media@lfdr.de>; Sat, 19 Sep 2020 12:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgISKXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 06:23:18 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:35161 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 06:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600510995;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SKsYkQ8W6CpU/hz9bXXuR7cy0nmrehduqP6/apaIQr0=;
        b=kvhdUO5tHJ+BAeA7FQSFmHvJloEywcAQoge13gLgWpzTxo5MuvwcYcFtZXIoUGhuXv
        CPvkuYixFHQ6vd4HR1xJPsjmOxcVvA0rrJ8fkOqHMx4soRRkFjIaHnUgMenECyPahUbr
        UlAjvuVrYtYxUI9Jg1WCWzwSn8Odv64/OR6wRYCX5K79aMuSHi6WXPf+wN6iNDOnsUIr
        LSaG/qfAOi7sxHnyaBDqN2HJdG3RSwW2jyI7Y4oX8UFurn7gen5LboUn8zN8p10sqjLg
        TATIbZkPibCpg4/BjI0khMQvAtt7chJyhcP27nf4i7gXx9sJQznkdvEce/mYpFkFX4mL
        sSaA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw8JAHC6BG
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 19 Sep 2020 12:17:12 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:17:12 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <1218972192.1109884.1600510632282@webmail.strato.com>
In-Reply-To: <20200915230140.1201187-3-niklas.soderlund+renesas@ragnatech.se>
References: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
 <20200915230140.1201187-3-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/2] rcar-vin: Extend RAW8 support to all RGB layouts
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On 09/16/2020 1:01 AM Niklas S=C3=B6derlund <niklas.soderlund+renesas@rag=
natech.se> wrote:
>=20
> =20
> Extend the list of supported formats to include all RGB layouts of RAW8.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 28 ++++++++++++++++++++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 27 ++++++++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/p=
latform/rcar-vin/rcar-dma.c
> index a5dbb90c5210bae7..7f8997536aba6f0b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -598,8 +598,16 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
>  =09/* For RAW8 format bpp is 1, but the hardware process RAW8
>  =09 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
>  =09 */
> -=09if (vin->format.pixelformat =3D=3D V4L2_PIX_FMT_SRGGB8)
> +=09switch (vin->format.pixelformat) {
> +=09case MEDIA_BUS_FMT_SBGGR8_1X8:
> +=09case MEDIA_BUS_FMT_SGBRG8_1X8:
> +=09case MEDIA_BUS_FMT_SGRBG8_1X8:
> +=09case MEDIA_BUS_FMT_SRGGB8_1X8:
>  =09=09stride /=3D 2;
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> =20
>  =09rvin_write(vin, stride, VNIS_REG);
>  }
> @@ -683,6 +691,9 @@ static int rvin_setup(struct rvin_dev *vin)
> =20
>  =09=09input_is_yuv =3D true;
>  =09=09break;
> +=09case MEDIA_BUS_FMT_SBGGR8_1X8:
> +=09case MEDIA_BUS_FMT_SGBRG8_1X8:
> +=09case MEDIA_BUS_FMT_SGRBG8_1X8:
>  =09case MEDIA_BUS_FMT_SRGGB8_1X8:
>  =09=09vnmc |=3D VNMC_INF_RAW8;
>  =09=09break;
> @@ -747,6 +758,9 @@ static int rvin_setup(struct rvin_dev *vin)
>  =09case V4L2_PIX_FMT_ABGR32:
>  =09=09dmr =3D VNDMR_A8BIT(vin->alpha) | VNDMR_EXRGB | VNDMR_DTMD_ARGB;
>  =09=09break;
> +=09case V4L2_PIX_FMT_SBGGR8:
> +=09case V4L2_PIX_FMT_SGBRG8:
> +=09case V4L2_PIX_FMT_SGRBG8:
>  =09case V4L2_PIX_FMT_SRGGB8:
>  =09=09dmr =3D 0;
>  =09=09break;
> @@ -1124,6 +1138,18 @@ static int rvin_mc_validate_format(struct rvin_dev=
 *vin, struct v4l2_subdev *sd,
>  =09case MEDIA_BUS_FMT_UYVY10_2X10:
>  =09case MEDIA_BUS_FMT_RGB888_1X24:
>  =09=09break;
> +=09case MEDIA_BUS_FMT_SBGGR8_1X8:
> +=09=09if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SBGGR8)
> +=09=09=09return -EPIPE;
> +=09=09break;
> +=09case MEDIA_BUS_FMT_SGBRG8_1X8:
> +=09=09if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SGBRG8)
> +=09=09=09return -EPIPE;
> +=09=09break;
> +=09case MEDIA_BUS_FMT_SGRBG8_1X8:
> +=09=09if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SGRBG8)
> +=09=09=09return -EPIPE;
> +=09=09break;
>  =09case MEDIA_BUS_FMT_SRGGB8_1X8:
>  =09=09if (vin->format.pixelformat !=3D V4L2_PIX_FMT_SRGGB8)
>  =09=09=09return -EPIPE;
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/=
platform/rcar-vin/rcar-v4l2.c
> index 0e066bba747e0b73..4071d9bd554ab88f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -66,6 +66,18 @@ static const struct rvin_video_format rvin_formats[] =
=3D {
>  =09=09.fourcc=09=09=09=3D V4L2_PIX_FMT_ABGR32,
>  =09=09.bpp=09=09=09=3D 4,
>  =09},
> +=09{
> +=09=09.fourcc=09=09=09=3D V4L2_PIX_FMT_SBGGR8,
> +=09=09.bpp=09=09=09=3D 1,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=09=3D V4L2_PIX_FMT_SGBRG8,
> +=09=09.bpp=09=09=09=3D 1,
> +=09},
> +=09{
> +=09=09.fourcc=09=09=09=3D V4L2_PIX_FMT_SGRBG8,
> +=09=09.bpp=09=09=09=3D 1,
> +=09},
>  =09{
>  =09=09.fourcc=09=09=09=3D V4L2_PIX_FMT_SRGGB8,
>  =09=09.bpp=09=09=09=3D 1,
> @@ -366,6 +378,21 @@ static int rvin_enum_fmt_vid_cap(struct file *file, =
void *priv,
>  =09case MEDIA_BUS_FMT_UYVY10_2X10:
>  =09case MEDIA_BUS_FMT_RGB888_1X24:
>  =09=09break;
> +=09case MEDIA_BUS_FMT_SBGGR8_1X8:
> +=09=09if (f->index)
> +=09=09=09return -EINVAL;
> +=09=09f->pixelformat =3D V4L2_PIX_FMT_SBGGR8;
> +=09=09return 0;
> +=09case MEDIA_BUS_FMT_SGBRG8_1X8:
> +=09=09if (f->index)
> +=09=09=09return -EINVAL;
> +=09=09f->pixelformat =3D V4L2_PIX_FMT_SGBRG8;
> +=09=09return 0;
> +=09case MEDIA_BUS_FMT_SGRBG8_1X8:
> +=09=09if (f->index)
> +=09=09=09return -EINVAL;
> +=09=09f->pixelformat =3D V4L2_PIX_FMT_SGRBG8;
> +=09=09return 0;
>  =09case MEDIA_BUS_FMT_SRGGB8_1X8:
>  =09=09if (f->index)
>  =09=09=09return -EINVAL;
> --=20
> 2.28.0

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
