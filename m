Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17466C9E71
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbjC0IoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbjC0IoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:44:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454279006;
        Mon, 27 Mar 2023 01:40:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9218E12F3;
        Mon, 27 Mar 2023 10:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679906392;
        bh=96V8MppeMF+NW6V4+9f6Y/8BI7H5wf9OEn77H7NjWzg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OwW4CIk8AgQNqOOsMBz4GOFpDaDXeJ+UDvuNqLtDkpuorKbFNu9H6TyzGli78SZcC
         +rXsCcVZ8LpLUk4Q3w3alnS5e1je1flvg86mGMK5gMW6WpLk0tqH3IuZk3C8EHEqzb
         2ve2UVz8JIGdhbZS0MVpTXA6+1GskbA1xGt+5B8s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230326143224.572654-55-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-55-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 052/117] media: rcar_fdp1: Convert to platform remove callback returning void
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 27 Mar 2023 09:39:50 +0100
Message-ID: <167990639061.2697263.12613924340988124182@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-26 15:31:19)
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
>  drivers/media/platform/renesas/rcar_fdp1.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index 37ecf489d112..d80b3214dfae 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -2396,7 +2396,7 @@ static int fdp1_probe(struct platform_device *pdev)
>         return ret;
>  }
> =20
> -static int fdp1_remove(struct platform_device *pdev)
> +static void fdp1_remove(struct platform_device *pdev)
>  {
>         struct fdp1_dev *fdp1 =3D platform_get_drvdata(pdev);
> =20
> @@ -2404,8 +2404,6 @@ static int fdp1_remove(struct platform_device *pdev)
>         video_unregister_device(&fdp1->vfd);
>         v4l2_device_unregister(&fdp1->v4l2_dev);
>         pm_runtime_disable(&pdev->dev);
> -
> -       return 0;
>  }
> =20
>  static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
> @@ -2441,7 +2439,7 @@ MODULE_DEVICE_TABLE(of, fdp1_dt_ids);
> =20
>  static struct platform_driver fdp1_pdrv =3D {
>         .probe          =3D fdp1_probe,
> -       .remove         =3D fdp1_remove,
> +       .remove_new     =3D fdp1_remove,
>         .driver         =3D {
>                 .name   =3D DRIVER_NAME,
>                 .of_match_table =3D fdp1_dt_ids,
> --=20
> 2.39.2
>
