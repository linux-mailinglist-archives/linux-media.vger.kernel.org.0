Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32BD6320BF
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 12:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiKULfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 06:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiKULet (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 06:34:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A56B9639
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 03:30:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C8BD74C;
        Mon, 21 Nov 2022 12:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669030222;
        bh=DhphUCQKJpQOWkqS91KoNPNE3RpUrkbSTPpUWdpv31Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h1xS3DNhTXi7NmESklhLgkDU5+Qyk4yEBp52XUgWRBrcQl+R15WcENP9HrB2Ny3cZ
         pR6D6PTCD398r6blrRzXxnTdnMV1L9uZZSUhIbBfPoZ24++qtHv/PJX0spuwfG8Y07
         KTQGfF2bY7MFT1bGJg237Db0dxwbL5AHbZ2jS6UQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121102705.16092-1-u.kleine-koenig@pengutronix.de>
References: <20221121102705.16092-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] media: i2c: ov5695: convert to i2c's .probe_new()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 21 Nov 2022 11:30:19 +0000
Message-ID: <166903021946.50677.15800275166105418608@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2022-11-21 10:27:05)
> The probe function doesn't make use of the i2c_device_id * parameter so
> it can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5695.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index 61906fc54e37..b287c28920a6 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -1267,8 +1267,7 @@ static int ov5695_configure_regulators(struct ov569=
5 *ov5695)
>                                        ov5695->supplies);
>  }
> =20
> -static int ov5695_probe(struct i2c_client *client,
> -                       const struct i2c_device_id *id)
> +static int ov5695_probe(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct ov5695 *ov5695;
> @@ -1393,7 +1392,7 @@ static struct i2c_driver ov5695_i2c_driver =3D {
>                 .pm =3D &ov5695_pm_ops,
>                 .of_match_table =3D of_match_ptr(ov5695_of_match),
>         },
> -       .probe          =3D &ov5695_probe,
> +       .probe_new      =3D &ov5695_probe,
>         .remove         =3D &ov5695_remove,
>  };
> =20
> --=20
> 2.38.1
>
