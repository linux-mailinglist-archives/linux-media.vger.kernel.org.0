Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D44482D20
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 00:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiABXVS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jan 2022 18:21:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiABXVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jan 2022 18:21:17 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80F75E57;
        Mon,  3 Jan 2022 00:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641165676;
        bh=WulEdarNBjQGp6mo4uSw1raxGV5gxhYj4Ev2jrI8fZU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bHWrMQbiY15IeOhtTPAhvHWYfXIoVBM6Wj0YGdCFdfLiwlZUjHMy3oKtoMA0CG+Jm
         LeLAmdc/xdytgqCUyFsy2VOszbohaBosR4kZ8Iy4s48zMuXK7wM6r0qKDHfnLhtlnK
         HcArUie4dr+dm/K+1t29RggqfH3+oVj00j6NHODs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: max9271: Add header include guards to max9271.h
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Sun, 02 Jan 2022 23:21:13 +0000
Message-ID: <164116567398.210256.8635439327374336545@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2022-01-02 22:48:03)
> Protect against multiple inclusions of the max9271.h header with include
> guards.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/i2c/max9271.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
> index dc5e4e70ba6f..0bf1d40811eb 100644
> --- a/drivers/media/i2c/max9271.h
> +++ b/drivers/media/i2c/max9271.h
> @@ -8,6 +8,9 @@
>   * Copyright (C) 2015 Cogent Embedded, Inc.
>   */
> =20
> +#ifndef __MEDIA_I2C_MAX9271_H__
> +#define __MEDIA_I2C_MAX9271_H__
> +

I wonder if we'll ever #pragma once outside of /tools/testing/selftests.

Still, these are indeed missing and should be added.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



>  #include <linux/i2c.h>
> =20
>  #define MAX9271_DEFAULT_ADDR   0x40
> @@ -231,3 +234,5 @@ int max9271_set_deserializer_address(struct max9271_d=
evice *dev, u8 addr);
>   * Return 0 on success or a negative error code on failure
>   */
>  int max9271_set_translation(struct max9271_device *dev, u8 source, u8 de=
st);
> +
> +#endif /* __MEDIA_I2C_MAX9271_H__ */
> --=20
> Regards,
>=20
> Laurent Pinchart
>
