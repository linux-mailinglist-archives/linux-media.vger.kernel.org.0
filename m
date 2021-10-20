Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA6A434BE1
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 15:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhJTNRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:17:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhJTNRd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:17:33 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3AC63F6;
        Wed, 20 Oct 2021 15:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634735718;
        bh=/60rjKG6YhwKPQDfX/uQPCdwZERANMQmw+nxk42u4KQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JrAvEQHepKfsb/VXq707Rzj271C3cZVFt/cX7NQbGOvFGxmzV9XGof1t+Q4kK4jar
         NgdKbmZj2I71X1Uosh1Uw+d9khKB9UHY/7xK0sNHaSdEtdbqntNiUrCCczJH14VN11
         nw5k+3aHJF37Q8lvhYfcdG9TUTO3nDC8EUAXeG7k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211020125932.23335-1-u.kleine-koenig@pengutronix.de>
References: <20211020125932.23335-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] media: rc: ir-spi: Drop empty spi_driver remove callback
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Sean Young <sean@mess.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 20 Oct 2021 14:15:15 +0100
Message-ID: <163473571574.2490016.1320966208487664818@Monstersaurus>
User-Agent: alot/0.9.2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2021-10-20 13:59:32)
> A driver with a remove callback that just returns 0 behaves identically
> to a driver with no remove callback at all. So simplify accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Sounds like the sort of thing that could have a coccinelle type check.
But yes, looks reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/rc/ir-spi.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
> index c58f2d38a458..51aa55a84bb5 100644
> --- a/drivers/media/rc/ir-spi.c
> +++ b/drivers/media/rc/ir-spi.c
> @@ -152,11 +152,6 @@ static int ir_spi_probe(struct spi_device *spi)
>         return devm_rc_register_device(&spi->dev, idata->rc);
>  }
> =20
> -static int ir_spi_remove(struct spi_device *spi)
> -{
> -       return 0;
> -}
> -
>  static const struct of_device_id ir_spi_of_match[] =3D {
>         { .compatible =3D "ir-spi-led" },
>         {},
> @@ -165,7 +160,6 @@ MODULE_DEVICE_TABLE(of, ir_spi_of_match);
> =20
>  static struct spi_driver ir_spi_driver =3D {
>         .probe =3D ir_spi_probe,
> -       .remove =3D ir_spi_remove,
>         .driver =3D {
>                 .name =3D IR_SPI_DRIVER_NAME,
>                 .of_match_table =3D ir_spi_of_match,
> --=20
> 2.30.2
>
