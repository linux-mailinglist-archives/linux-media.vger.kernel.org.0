Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1891441C89
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 15:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhKAOZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 10:25:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhKAOZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 10:25:10 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 352FBB77;
        Mon,  1 Nov 2021 15:22:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635776556;
        bh=lhxaybupWQNEC5nJrWvEWQ92KI2sXd58629oOVYTw/M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rnda0YiHpma0KJ9NvjjOKhbmDyoAgvJ2dQ+2ndRMySfR/2jwHZvntN2bD0pyKv49x
         ca7xWJqkQ6lvRDyJ4T5iB8RwUPj9P1CrliY75hPAmlaxeAk9UafAYhaZ/FWxuCRAKp
         EuGMOBpieES1KXOASQQyH+omwOwliEzyiJ9ZCzFM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211026194010.109029-1-u.kleine-koenig@pengutronix.de>
References: <20211026194010.109029-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] [media] tua9001: Improve messages in .remove's error path
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Date:   Mon, 01 Nov 2021 14:22:33 +0000
Message-ID: <163577655353.275423.6737046445297486684@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Uwe Kleine-K=C3=B6nig (2021-10-26 20:40:10)
> If disabling the hardware fails the driver propagates the error code to
> the i2c core. However this only results in a generic error message; the
> device still disappears.
>=20
> So instead emit a message that better describes the actual problem than
> the i2c core's "remove failed (ESOMETHING), will be ignored" and return
> 0 to suppress the generic message.

You almost caught me out. I was going to say, this changes the
behaviour of the return code. But It's intentional ;-)

It's still a bit concerning, /not/ returning an error on an error - but
as it's not going to prevent removal, and it won't add further (helpful)
diagnosticts), maybe it makes sense.

My only concern would be if it might be better to keep the return code,
so that the core frameworks know about the issue at least.

The error message is better IMO though so :

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/tuners/tua9001.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua900=
1.c
> index 5e3625e75620..af7d5ea1f77e 100644
> --- a/drivers/media/tuners/tua9001.c
> +++ b/drivers/media/tuners/tua9001.c
> @@ -240,14 +240,10 @@ static int tua9001_remove(struct i2c_client *client)
>                                    DVB_FRONTEND_COMPONENT_TUNER,
>                                    TUA9001_CMD_CEN, 0);
>                 if (ret)
> -                       goto err_kfree;
> +                       dev_err(&client->dev, "Tuner disable failed (%pe)=
\n", ERR_PTR(ret));
>         }
>         kfree(dev);
>         return 0;
> -err_kfree:
> -       kfree(dev);
> -       dev_dbg(&client->dev, "failed=3D%d\n", ret);
> -       return ret;
>  }
> =20
>  static const struct i2c_device_id tua9001_id_table[] =3D {
> --=20
> 2.30.2
>
