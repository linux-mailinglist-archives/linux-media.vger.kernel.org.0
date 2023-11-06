Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59FF7E2033
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 12:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjKFLlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 06:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjKFLlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 06:41:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FA8C6
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 03:41:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 375C1583;
        Mon,  6 Nov 2023 12:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699270856;
        bh=sj/5u52AGl/SEMYNGZ08lO6i3WIaUl6VsUtyQdF7Kj0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=wkrWtyn6PW3LxeZsWyu8J8qwRNjBc6iJ2mZlq8ZW+YYlPaoNw7yzsaL1Z6MFO2SC3
         Bft+Bek3xWZLaT1PmaxREoqbWMYemmjK79XTYIzJsiBmrnpdOCEo8vLSTRb9bSoJPE
         qQJOYoxKFMp6Bp0aIQIEOgTwzTwF8akDmE6rvoLM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231101094241.1149656-1-sakari.ailus@linux.intel.com>
References: <20231101094241.1149656-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] media: imx319: Enable runtime PM before registering async sub-device
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     "Cao, Bingbu" <bingbu.cao@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Date:   Mon, 06 Nov 2023 11:41:13 +0000
Message-ID: <169927087350.1233626.4881175954374673034@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Sakari Ailus (2023-11-01 09:42:41)
> As the sensor may be accessible right after its async sub-device is
> registered, enable runtime PM before doing so.
>=20

This sounds pretty reasonable to me.

Do we have any sort of cocci checks for these sort of things?

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx319.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
> index 5378f607f340..f8bce161318d 100644
> --- a/drivers/media/i2c/imx319.c
> +++ b/drivers/media/i2c/imx319.c
> @@ -2464,19 +2464,21 @@ static int imx319_probe(struct i2c_client *client)
>                 goto error_handler_free;
>         }
> =20
> -       ret =3D v4l2_async_register_subdev_sensor(&imx319->sd);
> -       if (ret < 0)
> -               goto error_media_entity;
> -
>         /* Set the device's state to active if it's in D0 state. */
>         if (full_power)
>                 pm_runtime_set_active(&client->dev);
>         pm_runtime_enable(&client->dev);
>         pm_runtime_idle(&client->dev);
> =20
> +       ret =3D v4l2_async_register_subdev_sensor(&imx319->sd);
> +       if (ret < 0)
> +               goto error_media_entity_pm;
> +
>         return 0;
> =20
> -error_media_entity:
> +error_media_entity_pm:
> +       pm_runtime_disable(&client->dev);
> +       pm_runtime_set_suspended(&client->dev);
>         media_entity_cleanup(&imx319->sd.entity);
> =20
>  error_handler_free:
> --=20
> 2.39.2
>
