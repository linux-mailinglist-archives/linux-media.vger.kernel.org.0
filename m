Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB8F4EDE75
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 18:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbiCaQPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 12:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236486AbiCaQPA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 12:15:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A311D59D8
        for <linux-media@vger.kernel.org>; Thu, 31 Mar 2022 09:13:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1730486;
        Thu, 31 Mar 2022 18:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648743189;
        bh=yHGS2hURqkIUrkESX/THMVwzW6jkoB0dHOSQJK3VlEg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RX1PcgcTmdXJviJwtdl0WqW1ajNSwKZoa2e+KC0EeKQLh6pjXHGvaEXnB9GPWNzPy
         65AGAa84cgSenfmPOatzicYmO6z4ans71rluHd+9VcYJQ8S+RgGnUaWK1bqQ8JdKFN
         EyKA7pEka7rtzp6tr8KnorHttUfpsMUhO+LIuqtg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220330155811.1185758-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220330155811.1185758-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: rcar-vin: Remove stray blank line
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Date:   Thu, 31 Mar 2022 17:13:07 +0100
Message-ID: <164874318760.15275.14084679065887620011@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2022-03-30 16:58:11)
> Remove a stray blank line between function definition and body.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Given how controversial this change is, I'm not sure this is necessary,
but this patch has made it's way into my inbox :-) - so before I archive
it away:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/driver=
s/media/platform/renesas/rcar-vin/rcar-core.c
> index 64cb05b3907c28e5..4f36e9df7effeb2b 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -891,7 +891,6 @@ static const struct media_device_ops rvin_csi2_media_=
ops =3D {
> =20
>  static int rvin_csi2_create_link(struct rvin_group *group, unsigned int =
id,
>                                  const struct rvin_group_route *route)
> -
>  {
>         struct media_entity *source =3D &group->remotes[route->csi].subde=
v->entity;
>         struct media_entity *sink =3D &group->vin[id]->vdev.entity;
> --=20
> 2.35.1
>
