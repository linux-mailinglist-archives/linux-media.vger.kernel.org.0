Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71576F2708
	for <lists+linux-media@lfdr.de>; Sun, 30 Apr 2023 00:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjD2Wom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Apr 2023 18:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjD2Wok (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Apr 2023 18:44:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3B6E7C
        for <linux-media@vger.kernel.org>; Sat, 29 Apr 2023 15:44:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F7908C2;
        Sun, 30 Apr 2023 00:44:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682808263;
        bh=TbPH9f2RuMwVJbJZm3VvGX6sleNaGRftgYyTGai1Fzk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jiAcbmOHFrhOMwv+MTL/CIp/au7oa+tUks6UO6W6nw6LRUhxF70F9xCzpSjWZDmou
         ieEoNetNlru98BxV2JvoF/0BRmjljNnJ245pCQqbig8+9fgDJsFGq+ZTDyNkxnWauX
         KfctyOiqRhO7hrIXQkcvBwmrQFgtwNst6IriG3Vs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230425073346.636871-1-alexander.stein@ew.tq-group.com>
References: <20230425073346.636871-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] media: tc358743: Add error code to error message
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Sat, 29 Apr 2023 23:44:34 +0100
Message-ID: <168280827424.3916342.4864738241564255838@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Alexander Stein (2023-04-25 08:33:46)
> Add the error code of a failed i2c transfer to the error message.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/i2c/tc358743.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 9197fa0b1bc2..ad6a72b2bcf5 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -133,8 +133,8 @@ static void i2c_rd(struct v4l2_subdev *sd, u16 reg, u=
8 *values, u32 n)
> =20
>         err =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>         if (err !=3D ARRAY_SIZE(msgs)) {
> -               v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed\=
n",
> -                               __func__, reg, client->addr);
> +               v4l2_err(sd, "%s: reading register 0x%x from 0x%x failed:=
 %d\n",

Hrm. I was going to ask if %pe [0] would be relevant to print the error, but
these aren't quite PTR_ERR's ... just errors... Though it looks from
lib/vscnprintf.c :: err_ptr() it would still work!

[0] https://www.kernel.org/doc/html/latest/core-api/printk-formats.html#err=
or-pointers

So either way,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +                               __func__, reg, client->addr, err);
>         }
>  }
> =20
> @@ -165,8 +165,8 @@ static void i2c_wr(struct v4l2_subdev *sd, u16 reg, u=
8 *values, u32 n)
> =20
>         err =3D i2c_transfer(client->adapter, &msg, 1);
>         if (err !=3D 1) {
> -               v4l2_err(sd, "%s: writing register 0x%x from 0x%x failed\=
n",
> -                               __func__, reg, client->addr);
> +               v4l2_err(sd, "%s: writing register 0x%x from 0x%x failed:=
 %d\n",
> +                               __func__, reg, client->addr, err);
>                 return;
>         }
> =20
> --=20
> 2.34.1
>
