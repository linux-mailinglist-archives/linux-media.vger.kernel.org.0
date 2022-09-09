Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241F65B3A60
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 16:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbiIIOCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 10:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbiIIOCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 10:02:08 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEE7A221B
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 07:00:44 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 217A7100015;
        Fri,  9 Sep 2022 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1662732042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8pJmLrfDLV1g+Jr97lQ/nwBVyxrNiVAD4ve4HsLR6+0=;
        b=gzO0UAPeMh9HSwcel+EFjqZoh55BpOFCutC65kq+hZbRy9gjJxtuMKaA23T753IBp8WXsH
        ndZMSgKw8LWVl4ttkG18xLOXocje+LtKO9hr9aw8WR1S5MAlgQzieCQPfEyrNEdtavbf2d
        1bD2qI0hNqaCcZnaJkYfR2QnoBr2jvHlUQA9RxNUbgRlav6frZRWTcts6/AxLlbQOUg/3L
        6fi+eW8kVwm/h9vxXHE/d3H3xQqIGEKOZ6mZ2lIH7J7eMABmeNjn3g6RBxV5T0SaOGskNB
        R5QmVlJVYrStTmEJ/JT4TeQPMqMzP1s6ekV8W6MqH+eqlnWbNjRIkkTV1JoGtQ==
Date:   Fri, 9 Sep 2022 16:00:37 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/1] sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY
Message-ID: <YxtHBbvZ2sq6KIyp@aptenodytes>
References: <20220905100054.3259357-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rdk50ZX1LxOfHMDq"
Content-Disposition: inline
In-Reply-To: <20220905100054.3259357-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rdk50ZX1LxOfHMDq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon 05 Sep 22, 13:00, Sakari Ailus wrote:
> PHY_SUN6I_MIPI_DPHY is not a freely selectable option and so may not
> always be available. Depend on it instead.

I don't get what you mean by "not a freely selectable option".
It's definitely a tristate. Also no build issue will occur if it's
unselected (but I guess that's not the point here).

Cheers,

Paul
=20
> Fixes: 94d7fd9692b5 ("media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drive=
rs/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> index eb982466abd30..4d072abdfb705 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -4,10 +4,10 @@ config VIDEO_SUN6I_MIPI_CSI2
>  	depends on V4L_PLATFORM_DRIVERS && VIDEO_DEV
>  	depends on ARCH_SUNXI || COMPILE_TEST
>  	depends on PM && COMMON_CLK
> +	depends on PHY_SUN6I_MIPI_DPHY
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> -	select PHY_SUN6I_MIPI_DPHY
>  	select GENERIC_PHY_MIPI_DPHY
>  	select REGMAP_MMIO
>  	help
> --=20
> 2.30.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--rdk50ZX1LxOfHMDq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmMbRwUACgkQ3cLmz3+f
v9Fx0Af+ODIdFejFhc7oglOCGoG3Kv52QyaXJQKqaV/Q3MNZ96CN3tZjBkpGzpcK
PT7t0LxvuDgcTNur7BwBJ3AfWP0IWxLKtwTfZldc8pNYGrKCvwmCN1B6Dqn3Uy3A
XN3XQiGkuWdliooNTGQhJ876mg8Vqxu7kArerEp4k808pqjqff/DJp82Z6N9/p35
AJPXx1vna31uLMQ5AL0NOkdMsT+UHnP1F94N2uEH9u/ExX04M1nRWXic+6qtJ879
Zyjy8e6cM3dfuGhyv9G9nyGz24U3m++nC68sQ/E9pluL8P6415t1kOH56kmnGOuu
ruqyHhB/6uXbF3iT5CN3+aYUZbDxog==
=3rqI
-----END PGP SIGNATURE-----

--rdk50ZX1LxOfHMDq--
