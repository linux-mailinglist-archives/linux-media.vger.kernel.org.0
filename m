Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928CD5796C1
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 11:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237247AbiGSJyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 05:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbiGSJyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 05:54:36 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F4229800
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 02:54:32 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 41C55100004;
        Tue, 19 Jul 2022 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658224471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TzOODSz2A/5xkfE8DtmxnOBdcEg+U1axz6vMATKnnQQ=;
        b=epFlWY3HhcEvxQ77mq3udZLghfS3DDxgqXukqejrMfEjg44PT8aOlQGmeHoE6cmm2UKkJa
        hqJEJKouW798nzHTvM17pD6EJsnH4uSA3QYu0LEO4GIFc720EstKTuO7EjlgMQxqhSfafm
        AF4g3fcqIjsYGQQOzjrgdHE3h4+JxQ4KeoQ2bXoyddNzJL1zEkUXeDSTTMs1TuQUOwUA3N
        h4x+0eh/IVCbLimVczME4s8eO0kLykMj12lFmvcr+swgyBUGee0kPwiiiWqQJ12kIe5ki+
        IjNegHYo3G4t6Luo7vLo/+IAgm5/MbKn9y0PwIj6i5PD5Zm2FziOMkoIYLCPNg==
Date:   Tue, 19 Jul 2022 11:54:30 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c:
 clarify error handling
Message-ID: <YtZ/VmLgnnn2tlAK@aptenodytes>
References: <815bc07c-20ef-86ba-1492-54c77afc7a1f@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b65kn44O6d9s7sw3"
Content-Disposition: inline
In-Reply-To: <815bc07c-20ef-86ba-1492-54c77afc7a1f@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--b65kn44O6d9s7sw3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon 18 Jul 22, 18:08, Hans Verkuil wrote:
> Both sun6i_mipi_csi2.c and sun8i_a83t_mipi_csi2.c have the same issue:
> the comment before the ret =3D 0 assignment is incorrect, drop it and
> always assign the result of the v4l2_subdev_call(..., 0) to ret.

Not sure what is incorrect about it. I agree that it's good to return the
return code of v4l2_subdev_call instead of always 0 on the !on path though.

> In the disable label check for !on and set ret to 0 in that case.
>=20
> This fixes two smatch warnings:
>=20
> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_=
mipi_csi2_s_stream() warn: missing error code 'ret'

I don't think this is legit: the initialization of ret is specifically there
to avoid an undefined ret there.

> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:=
225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 7 ++++---
>  .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c      | 7 ++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
=2Ec b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index 31e12f1506cb..a4e3f9a6b2ff 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -182,14 +182,13 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_sub=
dev *subdev, int on)
>  	unsigned int lanes_count =3D
>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
>  	unsigned long pixel_rate;
> -	/* Initialize to 0 to use both in disable label (ret !=3D 0) and off. */
> -	int ret =3D 0;
> +	int ret;
> =20
>  	if (!source_subdev)
>  		return -ENODEV;
> =20
>  	if (!on) {
> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> +		ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		goto disable;
>  	}
> =20
> @@ -281,6 +280,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subde=
v *subdev, int on)
>  	return 0;
> =20
>  disable:
> +	if (!on)
> +		ret =3D 0;

Then this will always overwrite the ret value from v4l2_subdev_call with the
!on disable path. Looks like this can be removed.

What do you think?

Paul

>  	phy_power_off(dphy);
>  	sun6i_mipi_csi2_disable(csi2_dev);
> =20
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c
> index c82ede3ca0ff..d052ee77ef0a 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> @@ -214,14 +214,13 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l=
2_subdev *subdev, int on)
>  	unsigned int lanes_count =3D
>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
>  	unsigned long pixel_rate;
> -	/* Initialize to 0 to use both in disable label (ret !=3D 0) and off. */
> -	int ret =3D 0;
> +	int ret;
> =20
>  	if (!source_subdev)
>  		return -ENODEV;
> =20
>  	if (!on) {
> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> +		ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		goto disable;
>  	}
> =20
> @@ -313,6 +312,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
>  	return 0;
> =20
>  disable:
> +	if (!on)
> +		ret =3D 0;
>  	phy_power_off(dphy);
>  	sun8i_a83t_mipi_csi2_disable(csi2_dev);
> =20
> --=20
> 2.35.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--b65kn44O6d9s7sw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmLWf1YACgkQ3cLmz3+f
v9HasQf/SywilXcJChVvPLNfnRd09TUpRB4YEI/CukuRp45buCoTZxzxORRRlR3G
Fu47U6v36FVvtFVqrGw2eEKMqTFB9sbA19TNZM7ILeH82tGJussFhj2LFHbD8OdX
WpxuQZqxWBgcinVa8oGaopdpIAmxuu1evRl+MRIdVN6qoihcRiHmKihvtMhnsSyX
iE1F+RzJoqFFfI09roHpSE20g+gGukAIYvSx2UViWyAsZhrfpojQFPjo9712WUUA
SUYN5DmInUpYtqIQ3FVzj6hHy2DyfdwxYJJbWMD5T4R5CauN3CPhv+wXHQfFjf+z
PKHSYvQ5t0hPkTd/20VoIOtOZLLhRw==
=PH9F
-----END PGP SIGNATURE-----

--b65kn44O6d9s7sw3--
