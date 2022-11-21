Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3422B6320B2
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 12:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiKULdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 06:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiKULd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 06:33:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30AF2DDB
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 03:28:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AC4F74C;
        Mon, 21 Nov 2022 12:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669030093;
        bh=IzECdOjtMFL3L4QxI9HdNjGYXC8djn+8VIdhE+Q+MH8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YGpjiVtPJIFumlsAuJeF7oC1EqBxV4TxU1hKb7aJ7ix2aGzvRotOoRQ84zaUJTqez
         7H+6tUZtBs/OOEPOXC48+uIvYCJozyfjin+a3kxZlrfDNpuoXwo3cDHxHp5v4WTLkb
         DXgYKR+a6IcnWSUbhyHaqbqLvQoPiiEGwsQZ0DJQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121102838.16448-1-u.kleine-koenig@pengutronix.de>
References: <20221121102838.16448-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] media: i2c: ov2685: convert to i2c's .probe_new()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 21 Nov 2022 11:28:10 +0000
Message-ID: <166903009014.50677.2914184750085781512@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

Thanks for taking on this mammoth task! I've attempted it a couple of
times already, and been kept back by the sheer volume of patches it
generates.

Quoting Uwe Kleine-K=C3=B6nig (2022-11-21 10:28:38)
> The probe function doesn't make use of the i2c_device_id * parameter so
> it can be trivially converted.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/i2c/ov2685.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> index a3b524f15d89..1c80b121e7d6 100644
> --- a/drivers/media/i2c/ov2685.c
> +++ b/drivers/media/i2c/ov2685.c
> @@ -707,8 +707,7 @@ static int ov2685_configure_regulators(struct ov2685 =
*ov2685)
>                                        ov2685->supplies);
>  }
> =20
> -static int ov2685_probe(struct i2c_client *client,
> -                       const struct i2c_device_id *id)
> +static int ov2685_probe(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct ov2685 *ov2685;
> @@ -830,7 +829,7 @@ static struct i2c_driver ov2685_i2c_driver =3D {
>                 .pm =3D &ov2685_pm_ops,
>                 .of_match_table =3D of_match_ptr(ov2685_of_match),
>         },
> -       .probe          =3D &ov2685_probe,
> +       .probe_new      =3D &ov2685_probe,
>         .remove         =3D &ov2685_remove,
>  };
> =20
> --=20
> 2.38.1
>
