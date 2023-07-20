Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22BED75A7FB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 09:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjGTHmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 03:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjGTHmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 03:42:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2821C2118
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 00:41:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 530659B9;
        Thu, 20 Jul 2023 09:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689838862;
        bh=4q/JnoFdoaFrSVy0MFStpjxTvRdaTgaXcYH98REQDpY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gmveTbSe/j8oqDfl1Q39a8b56FneP32uak9ttfGG430nJCK58cL1TtH2D8yZyqkX+
         HgDY41yaLZUvIuEx26KeLXMZSgK0xpki0fnNZvj95/aPBAFWFS9ZR8jCK9y4TE++5w
         GTMymYGfYfdPcJBtn6lLEllf5lRyfYFys5WFlkmQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230718204541.3955386-1-u.kleine-koenig@pengutronix.de>
References: <20230718204541.3955386-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] media: Switch three more drivers back to use struct i2c_driver::probe()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Thu, 20 Jul 2023 08:41:53 +0100
Message-ID: <168983891379.2075858.1065248508876084250@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

Quoting Uwe Kleine-K=C3=B6nig (2023-07-18 21:45:41)
> struct i2c_driver::probe_new() is about to go away. Since I converted
> all drivers below drivers/media use struct i2c_driver::probe, three more
> drivers were added in the following commits that use .probe_new():
>=20
>         6363db1c9d45 media: i2c: add DS90UB953 driver
>         c158d0d4ff15 media: i2c: add DS90UB913 driver
>         afe267f2d368 media: i2c: add DS90UB960 driver


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Switch these driver to use the probe callback.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> these three drivers are currently added in next and introduce new usages
> of .probe_new which I intend to remove after the next -rc1.
>=20
> To reduce the amount of patches that are necessary to apply together
> with the patch that drops .probe_new() it would be great if you make
> sure that this patch makes it in before v6.6-rc1.
>=20
> Thanks
> Uwe
>=20
>  drivers/media/i2c/ds90ub913.c | 2 +-
>  drivers/media/i2c/ds90ub953.c | 2 +-
>  drivers/media/i2c/ds90ub960.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 203f7cceae23..4dae5afa9fa9 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -889,7 +889,7 @@ static const struct of_device_id ub913_dt_ids[] =3D {
>  MODULE_DEVICE_TABLE(of, ub913_dt_ids);
> =20
>  static struct i2c_driver ds90ub913_driver =3D {
> -       .probe_new      =3D ub913_probe,
> +       .probe          =3D ub913_probe,
>         .remove         =3D ub913_remove,
>         .id_table       =3D ub913_id,
>         .driver =3D {
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 1e3827a60029..87a7420366ea 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -1382,7 +1382,7 @@ static const struct of_device_id ub953_dt_ids[] =3D=
 {
>  MODULE_DEVICE_TABLE(of, ub953_dt_ids);
> =20
>  static struct i2c_driver ds90ub953_driver =3D {
> -       .probe_new      =3D ub953_probe,
> +       .probe          =3D ub953_probe,
>         .remove         =3D ub953_remove,
>         .id_table       =3D ub953_id,
>         .driver =3D {
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index e101bcf2356a..548c257f922f 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -4034,7 +4034,7 @@ static const struct of_device_id ub960_dt_ids[] =3D=
 {
>  MODULE_DEVICE_TABLE(of, ub960_dt_ids);
> =20
>  static struct i2c_driver ds90ub960_driver =3D {
> -       .probe_new      =3D ub960_probe,
> +       .probe          =3D ub960_probe,
>         .remove         =3D ub960_remove,
>         .id_table       =3D ub960_id,
>         .driver =3D {
>=20
> base-commit: 6363db1c9d45a54ddc1582423b74b5f9935b5958
> --=20
> 2.39.2
>
