Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014DA632BAA
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 19:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiKUSBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 13:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbiKUSAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 13:00:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA5D17AA4
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 10:00:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B49F74C;
        Mon, 21 Nov 2022 19:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669053618;
        bh=CRSPB7jn0Ij0UU46RtKAVT71tcCikDq45hojW7KhG+0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gctvVfJM5gekEcx5ogwHDUVFJnLzoYQnqKDkSHlNjKSfWLnR6FduJAZtrw3Bk5ND5
         gRWLOInrMpGFeYgiOSf5iIb9IWDeQrVaGqiir1DCXdvmq4493D5733dmNfhesERFXj
         4kMD3ahAVXszo84lbP/SeDaprIZtBps8JhY6QJf0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121173453.24250-1-sakari.ailus@linux.intel.com>
References: <20221121173453.24250-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] ov08x40: remove() now returns void
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Shawn Tu <shawnx.tu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Date:   Mon, 21 Nov 2022 18:00:15 +0000
Message-ID: <166905361555.50677.4109012115533689827@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Quoting Sakari Ailus (2022-11-21 17:34:53)
> The return type of the driver's remove() callback is now void. This driver
> got merged while the return type got changed tree-wide. Fix this.
>=20
> Fixes: 38fc5136ac16 ("media: i2c: Add ov08x40 image sensor driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Kieran: Mon, 21 Nov 2022 17:34:47 +0000
Sakari: Mon, 21 Nov 2022 19:34:53 +0200

Aha, so I got my v1 out 6 seconds before you ;-) Quite the tense race
...

But I'll not worry - yours is probably already in your tree, so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov08x40.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index b4ade17a83f5e..72ae7fba94eb0 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -3281,7 +3281,7 @@ static int ov08x40_probe(struct i2c_client *client)
>         return ret;
>  }
> =20
> -static int ov08x40_remove(struct i2c_client *client)
> +static void ov08x40_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov08x40 *ov08x =3D to_ov08x40(sd);
> @@ -3292,8 +3292,6 @@ static int ov08x40_remove(struct i2c_client *client)
> =20
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
> =20
>  static const struct dev_pm_ops ov08x40_pm_ops =3D {
> --=20
> 2.30.2
>
