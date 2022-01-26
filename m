Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE34C49C6E4
	for <lists+linux-media@lfdr.de>; Wed, 26 Jan 2022 10:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239403AbiAZJyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jan 2022 04:54:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49212 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbiAZJyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jan 2022 04:54:05 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADA8C478;
        Wed, 26 Jan 2022 10:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643190843;
        bh=iLM6jdz5tSf/N9ab0QRjzNVKhobs+OBHrKTySNPB7cI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pHI3yBOYRVhO9YuTQMOXOFpscZgjOZ/80GoBW8KyMJm2Muy9A2oCnbxLV6XMDK6NU
         34WeXoRHYxyC24Vlroh4H6nlQ/opYZyQoqUqfxi23maVIeYTWK36S0ZS6Tw8n6qlSo
         GY/XmivD0dUELXefM/E8ars/hAFBRfwFWGJUYf4s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: max9286: Implement media entity .link_validate() operation
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Date:   Wed, 26 Jan 2022 09:54:01 +0000
Message-ID: <164319084133.533872.7177686214935761792@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Quoting Laurent Pinchart (2022-01-13 20:51:50)
> The MAX9286 has sink pads, so it should implement .link_validate(). Do
> so.
>=20

I hope none of my scripts got by working because of the lack of this
check ;-)

But I agree it should be added.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I'll aim to test it next time I boot up the Salvator-X or Eagle.

--
Kieran


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/i2c/max9286.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index eb2b8e42335b..b4885d3b3059 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -846,6 +846,10 @@ static const struct v4l2_subdev_internal_ops max9286=
_subdev_internal_ops =3D {
>         .open =3D max9286_open,
>  };
> =20
> +static const struct media_entity_operations max9286_media_ops =3D {
> +       .link_validate =3D v4l2_subdev_link_validate
> +};
> +
>  static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         switch (ctrl->id) {
> @@ -895,6 +899,7 @@ static int max9286_v4l2_register(struct max9286_priv =
*priv)
>                 goto err_async;
> =20
>         priv->sd.entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +       priv->sd.entity.ops =3D &max9286_media_ops;
> =20
>         priv->pads[MAX9286_SRC_PAD].flags =3D MEDIA_PAD_FL_SOURCE;
>         for (i =3D 0; i < MAX9286_SRC_PAD; i++)
> --=20
> Regards,
>=20
> Laurent Pinchart
>
