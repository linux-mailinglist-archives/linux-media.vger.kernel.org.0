Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F167445C87
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 00:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhKDXHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 19:07:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhKDXHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 19:07:39 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63A4529B;
        Fri,  5 Nov 2021 00:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636067099;
        bh=S80KdrCdKqvN+/0iGSWnmjjESPN/GpWoz11Fy7q16Vs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iXUGcL7DSzy1oxQE/mXqOtuSettT+NSq4yR6wwnM123cAHWNBY1eaUfRJws6AAEnv
         bKZsfRmVQWoeIFPW53B8azjR2cFXvJOPIxWUJi5GyYPJ3asKnEIoF7PNcsfwITtf9M
         pHM++LYEfuLatEyHwUJFHJkmr/L3SbQGUu9iOL8k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211104110924.248444-2-jacopo+renesas@jmondi.org>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org> <20211104110924.248444-2-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 1/2] media: max9271: Ignore busy loop read errors
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 04 Nov 2021 23:04:57 +0000
Message-ID: <163606709702.3601475.5348110236576814282@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jacopo Mondi (2021-11-04 11:09:23)
> Valid pixel clock detection is performed by spinning on a register read
> which if repeated too frequently might fail. As the error is not fatal
> ignore it instead of bailing out to continue spinning until the timeout
> completion.
>=20
> Also relax the time between bus transactions and slightly increase the
> wait interval to mitigate the failure risk.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

This seems good to me. In your testing did you identify how many
spins/how long it usually takes before it first detects the pixel clock?

I.e. - was it cutting it close at 10ms, and we should even still extend
this further? (as the usleep_range means we could still loop this 10 ms)

Anyway, this looks like a strong improvement.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>=20
> v1->v2:
> - Do not continue but jump to a label to respect the sleep timout after a
>   failed read
>=20
> Niklas I kept your tag anyway, hope it's ok.
>=20
> Thanks
>    j
>=20
> ---
>  drivers/media/i2c/max9271.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index ff86c8c4ea61..aa4add473716 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8=
 reg, u8 val)
>  /*
>   * max9271_pclk_detect() - Detect valid pixel clock from image sensor
>   *
> - * Wait up to 10ms for a valid pixel clock.
> + * Wait up to 15ms for a valid pixel clock.
>   *
>   * Returns 0 for success, < 0 for pixel clock not properly detected
>   */
> @@ -64,15 +64,16 @@ static int max9271_pclk_detect(struct max9271_device =
*dev)
>         unsigned int i;
>         int ret;
>=20
> -       for (i =3D 0; i < 100; i++) {
> +       for (i =3D 0; i < 10; i++) {
>                 ret =3D max9271_read(dev, 0x15);
>                 if (ret < 0)
> -                       return ret;
> +                       goto skip;
>=20
>                 if (ret & MAX9271_PCLKDET)
>                         return 0;
>=20
> -               usleep_range(50, 100);
> +skip:
> +               usleep_range(1000, 1500);
>         }
>=20
>         dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n"=
);
> --
> 2.33.1
>
