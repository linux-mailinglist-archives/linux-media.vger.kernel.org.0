Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1776E482BA4
	for <lists+linux-media@lfdr.de>; Sun,  2 Jan 2022 16:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiABPFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jan 2022 10:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiABPFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jan 2022 10:05:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B2AC061761;
        Sun,  2 Jan 2022 07:05:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F34DFCC;
        Sun,  2 Jan 2022 16:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641135939;
        bh=fJUql0xL3bIUQQNjEt84f8/xY0BgrY2+ihdVlTf48hg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gBAzRUx1AbIGePeXsOerPS2ljh6c/m5eJnz0EBj5K1PTeNKUraaeQo2n613jRZ9J9
         H1UAOLRu1ar5KHELI7lgTYVa7iMg3WqphweR171BLBsXk+pxnORwLL3CsVdn8Tljqi
         cl+2W2GfxJ7rt94qG5myZFKDaea9EQcJYT0GXj/k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101173540.9090-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: rdacm20: Fix indentation in comment
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Sun, 02 Jan 2022 15:05:35 +0000
Message-ID: <164113593594.2704318.17445520556422868596@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Laurent Pinchart (2022-01-01 17:35:40)
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Fix a small indentation issue in a comment block.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/rdacm20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 025a610de893..e1eff4678ab3 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -463,8 +463,8 @@ static int rdacm20_initialize(struct rdacm20_device *=
dev)
>                 return ret;
> =20
>         /*
> -        *  Ensure that we have a good link configuration before attempti=
ng to
> -        *  identify the device.
> +        * Ensure that we have a good link configuration before attemptin=
g to
> +        * identify the device.
>          */
>         ret =3D max9271_configure_i2c(&dev->serializer,
>                                     MAX9271_I2CSLVSH_469NS_234NS |
>=20
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
> --=20
> Regards,
>=20
> Laurent Pinchart
>
