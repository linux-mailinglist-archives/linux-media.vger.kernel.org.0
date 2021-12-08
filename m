Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78F046D359
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 13:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbhLHMfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 07:35:03 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51966 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbhLHMfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 07:35:02 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 098CA8BB;
        Wed,  8 Dec 2021 13:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638966690;
        bh=yJVCk5jmq4sQLYV/FGSqcIN1gvW0jgXSAV2v3ROr/io=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h9KWJldzs66gnY5GVcdINTk8/QkaWToOa9qCfN23EpVWv0hU2XalVH36V1JUYGxL5
         fUjuEdzUskdmF42F4VIuMr1aXeWp90mU1QkNhwGz87yE1RKfxRBqv0FyfAUkcGe+HA
         gMcpxkt/CgEIMX+Cijx4yATU69JzOWAgwdz1vEd4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: i2c: max9286: Use dev_err_probe() helper
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Date:   Wed, 08 Dec 2021 12:31:27 +0000
Message-ID: <163896668772.1970692.10840510075161830431@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-12-08 12:17:56)
> Use the dev_err_probe() helper, instead of open-coding the same
> operation. While at it retrieve the error once and use it from
> 'ret' instead of retrieving it twice.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Looks better already...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 7c663fd587bbeefa..16aa7e5b0e81c210 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1295,11 +1295,9 @@ static int max9286_probe(struct i2c_client *client)
> =20
>         priv->regulator =3D devm_regulator_get(&client->dev, "poc");
>         if (IS_ERR(priv->regulator)) {
> -               if (PTR_ERR(priv->regulator) !=3D -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Unable to get PoC regulator (%ld)\n",
> -                               PTR_ERR(priv->regulator));
>                 ret =3D PTR_ERR(priv->regulator);
> +               dev_err_probe(&client->dev, ret,
> +                             "Unable to get PoC regulator\n");
>                 goto err_powerdown;
>         }
> =20
> --=20
> 2.34.1
>
