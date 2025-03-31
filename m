Return-Path: <linux-media+bounces-29030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C9A7612A
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 920781881425
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D48F1D5CC6;
	Mon, 31 Mar 2025 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U7j5Njtp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE21537C8;
	Mon, 31 Mar 2025 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409002; cv=none; b=aK7+veb3urQYK6RHzTLzrp7btPGWzpCwt2L3pEdcJaN57tnD7femcXySuubAbj8EkdQJX+GEyMEHzjRjsjSH+oDmAFhySenN/4xxNJIo3vd9tJ828mKEOzi/s+r4diklL3fsZPM5fwK5DWYkCsmf2lCs59trhgj2dLlNuE4C62A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409002; c=relaxed/simple;
	bh=uLA4PItba4DiOgCjVuL7xkoe0O/KU4E1+zLCqi4hRqE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MoF9fqqKVGXl9Ad+nCxSDEGt7gM1aN+yu40lsuZ4F9lbzAcapEbJFVnrnge0e52XqYuP/jdurp3SmbH8PWXDSn4bzC3/3TEJT2eqaFLwAhtkX/2uDclU58bjpRc6Pa4tzt/aEj7rjL1szSYTP4d+0kIMHxbv3KhDCw5lNaY4AR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U7j5Njtp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3452250;
	Mon, 31 Mar 2025 10:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743408887;
	bh=uLA4PItba4DiOgCjVuL7xkoe0O/KU4E1+zLCqi4hRqE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U7j5NjtpnbNjzG7qHxVhTgcuA1bPimh6j94C15HkBlKQGoEEOYEnqP55sWAcFw72a
	 a+S2cXlhO6+xEHSrzu3LGJG5HaYaqwA7l5PoS4vS6x/wUPjEwOgVwhJ2xns10ZBVno
	 dho0uPSZZSzdpiYh4nfBFS1JBjVkTWe0trRP2RqE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
References: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: acopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Mon, 31 Mar 2025 09:16:36 +0100
Message-ID: <174340899625.3687388.14660711739063778026@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Andy Shevchenko (2025-03-31 08:34:35)
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>=20

Looks reasonable to me.


> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/i2c/rdacm20.c | 5 ++---
>  drivers/media/i2c/rdacm21.c | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index b8bd8354d100..dcab63d19baf 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -16,10 +16,10 @@
>   */
> =20
>  #include <linux/delay.h>
> -#include <linux/fwnode.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> =20
> @@ -575,8 +575,7 @@ static int rdacm20_probe(struct i2c_client *client)
>         dev->dev =3D &client->dev;
>         dev->serializer.client =3D client;
> =20
> -       ret =3D of_property_read_u32_array(client->dev.of_node, "reg",
> -                                        dev->addrs, 2);
> +       ret =3D device_property_read_u32_array(&client->dev, "reg", dev->=
addrs, 2);
>         if (ret < 0) {
>                 dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);

But this is no longer a DT reg property ?

>                 return -EINVAL;
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index 3e22df36354f..5ea6988de48b 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -11,10 +11,10 @@
>   */
> =20
>  #include <linux/delay.h>
> -#include <linux/fwnode.h>
>  #include <linux/init.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> =20
> @@ -551,8 +551,7 @@ static int rdacm21_probe(struct i2c_client *client)
>         dev->dev =3D &client->dev;
>         dev->serializer.client =3D client;
> =20
> -       ret =3D of_property_read_u32_array(client->dev.of_node, "reg",
> -                                        dev->addrs, 2);
> +       ret =3D device_property_read_u32_array(&client->dev, "reg", dev->=
addrs, 2);
>         if (ret < 0) {
>                 dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);

Same here ...

With those fixed,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                 return -EINVAL;
> --=20
> 2.47.2
>

