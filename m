Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F35E773E04B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 15:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjFZNPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 09:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjFZNPe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 09:15:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27B5186
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 06:15:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 189922D8;
        Mon, 26 Jun 2023 15:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687785286;
        bh=swbiITGrCsxxCIcev51yEA/3XUzTUQDM27IEphsoUgo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MNp4PpwNB03GWd/GLl7fy5JDIiSrQvF+XwPgLh+/TFEuGMR0s8qT9jVRExMMR5a6a
         oq9XdJ/EkYpLC8iDBy3qHaDPTlbNasMFwJg2ym7mjiF/NaEBGNv+dZaXt+Md3nO3bz
         HQb6EXvs26ue8mJy+7HajCG8Q2Q2LEuV5FV1kJuE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
References: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] media: i2c: ov01a10: Switch back to use struct i2c_driver::probe
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Bingbu Cao <bingbu.cao@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 26 Jun 2023 14:15:21 +0100
Message-ID: <168778532149.1052803.13469156046955364918@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2023-06-26 10:05:33)
> struct i2c_driver::probe_new is about to go away. Switch the driver to
> use the probe callback with the same prototype.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I'll try to keep my eye open on incoming drivers too to spot these.

Thanks
--
Kieran


> ---
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index de5bc19e715b..2b9e1b3a3bf4 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -992,7 +992,7 @@ static struct i2c_driver ov01a10_i2c_driver =3D {
>                 .pm =3D &ov01a10_pm_ops,
>                 .acpi_match_table =3D ACPI_PTR(ov01a10_acpi_ids),
>         },
> -       .probe_new =3D ov01a10_probe,
> +       .probe =3D ov01a10_probe,
>         .remove =3D ov01a10_remove,
>  };
> =20
>=20
> base-commit: cde0edf98f75221f299486e27a317aa02dc1cf7c
> --=20
> 2.39.2
>
