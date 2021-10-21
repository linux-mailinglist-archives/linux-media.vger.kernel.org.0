Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57263435FFF
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 13:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhJULNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 07:13:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54826 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJULNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 07:13:04 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85F248B6;
        Thu, 21 Oct 2021 13:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634814647;
        bh=CkbeOg3d4jA1x0PC3HVsBN5J0aYeYCx3qmIFhK32yI0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=egJchCijODjnDMsyBfkMagj3mdcmTJsCONihzPgonoFDsKYa0YIQ/vpNyRorsh2wB
         /020h3hs4Xle3wJyxECPk8OgX5t+0iqe8adxPRIGRxN9NDjnyevIztX0aFfs2axJsh
         VSLZucNIqpu5vVgQcKGhzRjdu5KBQpsKidRZ6yu8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
References: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Thu, 21 Oct 2021 12:10:45 +0100
Message-ID: <163481464506.2663858.16090359620223699606@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- To: Updated Andrzej's e-mail address

Quoting Uwe Kleine-K=C3=B6nig (2021-10-21 07:25:47)
> A driver with a remove callback that just returns 0 behaves identically
> to a driver with no remove callback at all. So simplify accordingly.

Looks fine to me though.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/i2c/s5c73m3/s5c73m3-spi.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c b/drivers/media/i2c/=
s5c73m3/s5c73m3-spi.c
> index c102c6bbc118..7fe61187a2f8 100644
> --- a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
> @@ -130,16 +130,10 @@ static int s5c73m3_spi_probe(struct spi_device *spi)
>         return 0;
>  }
> =20
> -static int s5c73m3_spi_remove(struct spi_device *spi)
> -{
> -       return 0;
> -}
> -
>  int s5c73m3_register_spi_driver(struct s5c73m3 *state)
>  {
>         struct spi_driver *spidrv =3D &state->spidrv;
> =20
> -       spidrv->remove =3D s5c73m3_spi_remove;
>         spidrv->probe =3D s5c73m3_spi_probe;
>         spidrv->driver.name =3D S5C73M3_SPI_DRV_NAME;
>         spidrv->driver.of_match_table =3D s5c73m3_spi_ids;
> --=20
> 2.30.2
>
