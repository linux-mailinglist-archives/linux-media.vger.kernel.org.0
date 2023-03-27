Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC146C9E9A
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbjC0IwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjC0Ivu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:51:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9736D61AF
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:47:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B415F18C3;
        Mon, 27 Mar 2023 10:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679906551;
        bh=bEkZTf+kqWERLEXroKzvQOoX1sY0IIecD6ZTB9AzsyQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N8QbuDpdpKh1pmZZaAUuz3tsZms05lrEUPBw+jEbOCCasUMcIK2LVIfY+S93fnRbB
         uWCvjjkGASHZJKM8OMfJEzaL9h60zfa/dSnyAoitNZXwSkHX74S5ynGGJNHkqKDt5R
         xs6GnW3FkPcpcganzzzIoqpHavwpF8mlGBclsgJk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230326143224.572654-117-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-117-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 114/117] media: vimc-core: Convert to platform remove callback returning void
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 27 Mar 2023 09:42:29 +0100
Message-ID: <167990654945.2697263.6488572097757132570@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-26 15:32:21)
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/test-drivers/vimc/vimc-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/=
test-drivers/vimc/vimc-core.c
> index e82cfa5ffbf4..af127476e920 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -387,7 +387,7 @@ static int vimc_probe(struct platform_device *pdev)
>         return 0;
>  }
> =20
> -static int vimc_remove(struct platform_device *pdev)
> +static void vimc_remove(struct platform_device *pdev)
>  {
>         struct vimc_device *vimc =3D platform_get_drvdata(pdev);
> =20
> @@ -397,8 +397,6 @@ static int vimc_remove(struct platform_device *pdev)
>         media_device_unregister(&vimc->mdev);
>         v4l2_device_unregister(&vimc->v4l2_dev);
>         v4l2_device_put(&vimc->v4l2_dev);
> -
> -       return 0;
>  }
> =20
>  static void vimc_dev_release(struct device *dev)
> @@ -412,7 +410,7 @@ static struct platform_device vimc_pdev =3D {
> =20
>  static struct platform_driver vimc_pdrv =3D {
>         .probe          =3D vimc_probe,
> -       .remove         =3D vimc_remove,
> +       .remove_new     =3D vimc_remove,
>         .driver         =3D {
>                 .name   =3D VIMC_PDEV_NAME,
>         },
> --=20
> 2.39.2
>
