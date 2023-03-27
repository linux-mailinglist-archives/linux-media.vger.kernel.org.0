Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAA66C9E7B
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjC0Iqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjC0IqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:46:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052569022;
        Mon, 27 Mar 2023 01:42:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E627712F3;
        Mon, 27 Mar 2023 10:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679906490;
        bh=+Ua11wbI2+XgB0RQEi7CpB8mZ46MNWUX8g6+QXF3EXU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o3vqBl0A8U96ozsnEvQgSN6sHBoPz5Ux3u39VK0q428bS2aeeltYb/s5H4eyTpysp
         vdjwdhI6NTgkms9PLfFsS0hn3yZoyLkVWCt6CJTBL4ta9wstumpGEw6PjGC1fvAzAU
         IZfEN0mNc6RLGfcHmOT6saU0/423pgFIXHqg56EU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230326143224.572654-61-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-61-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 058/117] media: vsp1_drv: Convert to platform remove callback returning void
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 27 Mar 2023 09:41:27 +0100
Message-ID: <167990648749.2697263.5403143235365291246@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-03-26 15:31:25)
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
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index 5710152d6511..c1c28f98bd10 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -977,7 +977,7 @@ static int vsp1_probe(struct platform_device *pdev)
>         return ret;
>  }
> =20
> -static int vsp1_remove(struct platform_device *pdev)
> +static void vsp1_remove(struct platform_device *pdev)
>  {
>         struct vsp1_device *vsp1 =3D platform_get_drvdata(pdev);
> =20
> @@ -985,8 +985,6 @@ static int vsp1_remove(struct platform_device *pdev)
>         rcar_fcp_put(vsp1->fcp);
> =20
>         pm_runtime_disable(&pdev->dev);
> -
> -       return 0;
>  }
> =20
>  static const struct of_device_id vsp1_of_match[] =3D {
> @@ -999,7 +997,7 @@ MODULE_DEVICE_TABLE(of, vsp1_of_match);
> =20
>  static struct platform_driver vsp1_platform_driver =3D {
>         .probe          =3D vsp1_probe,
> -       .remove         =3D vsp1_remove,
> +       .remove_new     =3D vsp1_remove,
>         .driver         =3D {
>                 .name   =3D "vsp1",
>                 .pm     =3D &vsp1_pm_ops,
> --=20
> 2.39.2
>
