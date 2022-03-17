Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B371E4DC31B
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbiCQJl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbiCQJlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:41:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D237E18B274;
        Thu, 17 Mar 2022 02:40:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43E7C929;
        Thu, 17 Mar 2022 10:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647510004;
        bh=HyQC/k8LBUNDh81jRHiNpUZUM/GrDFO9gzvfi0l//Ss=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nEO09ufjmu57QDgTwq0dcS93CuIB8iln2GQry7prxu9A2hbRDX1QDroxzu8lrf8po
         DiU+oQgKvezYcL3lfGgNEg5amxKRIMSpjbj2WGsc1HuxvBUr17k2c2/SDDPw9LcXGV
         SnD7iILeL/wPPu+NOEjsZoyo6f/SgshhMHHsBz/8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220316210916.606929-1-jacopo+renesas@jmondi.org>
References: <20220316210916.606929-1-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] media: i2c: rdacm20: Fix format definition
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Date:   Thu, 17 Mar 2022 09:40:01 +0000
Message-ID: <164751000153.123014.3597958253251467246@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Quoting Jacopo Mondi (2022-03-16 21:09:16)
> The RDACM20 camera supports a single image format which is currently
> listed as MEDIA_BUS_FMT_UYVY8_2X8. As the video stream is transmitted on
> the GMSL serial bus, the 2X8 variant does not apply.
>=20
> Fix the format byusing MEDIA_BUS_FMT_UYVY8_1X16.
>=20
> This fixes a runtime error which is now triggered as the MAX9286
> deserializer implements .link_validate().

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm20.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index ba956733aa89..6f23776ad214 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -47,11 +47,11 @@
>  #define OV10635_VTS                    933
>=20
>  /*
> - * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_2X8 format we
> + * As the drivers supports a single MEDIA_BUS_FMT_UYVY8_1X16 format we
>   * can harcode the pixel rate.
>   *
>   * PCLK is fed through the system clock, programmed @88MHz.
> - * MEDIA_BUS_FMT_UYVY8_2X8 format =3D 2 samples per pixel.
> + * MEDIA_BUS_FMT_UYVY8_1X16 format =3D 2 samples per pixel.
>   *
>   * Pixelrate =3D PCLK / 2
>   * FPS =3D (OV10635_VTS * OV10635_HTS) / PixelRate
> @@ -409,7 +409,7 @@ static int rdacm20_enum_mbus_code(struct v4l2_subdev =
*sd,
>         if (code->pad || code->index > 0)
>                 return -EINVAL;
>=20
> -       code->code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +       code->code =3D MEDIA_BUS_FMT_UYVY8_1X16;
>=20
>         return 0;
>  }
> @@ -425,7 +425,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
>=20
>         mf->width               =3D OV10635_WIDTH;
>         mf->height              =3D OV10635_HEIGHT;
> -       mf->code                =3D MEDIA_BUS_FMT_UYVY8_2X8;
> +       mf->code                =3D MEDIA_BUS_FMT_UYVY8_1X16;
>         mf->colorspace          =3D V4L2_COLORSPACE_RAW;
>         mf->field               =3D V4L2_FIELD_NONE;
>         mf->ycbcr_enc           =3D V4L2_YCBCR_ENC_601;
> --
> 2.35.1
>
