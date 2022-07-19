Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E150A5795A3
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 10:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236899AbiGSIzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 04:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiGSIzP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 04:55:15 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA00C5F41
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 01:55:12 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0A493FF802;
        Tue, 19 Jul 2022 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658220907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WcJHXdEOmYEIlKgklT+rhKrMy4NdP9WwfB6g7WIq47E=;
        b=Kvw3Op9FNU6WFvaIardl6G7/wFfhI5RfiQ/plHDVsP/tyYbvCCFdNmGJ+FWvbJbk73Ch6B
        eyz5T/cplIcxYhzLwLpCPkryDOqNhsdiGNCSj+XlmS9FSPMDED0vcYVQ13jjIJstSLtgYG
        3nmQGZnkRAQQiIHmCmrRq3O9aJ0PENzOoZkIir4yoCsKvhP9CxvGyWIXUOzpGVVXPA+1Qt
        VOgauln7tHESF8zRgrKagTcQKEcDhRAJ8Qgb1ZsEPiH2W9FsxXw37EnosCNgo8OKgpa3FP
        rjVsvGMTsQQrvV3OOZ5bCFre4QX8ztcAKRMkZvAvhTrO5mko72UJc+1BKc0T1A==
Date:   Tue, 19 Jul 2022 10:55:06 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/1] media: sunxi: Depend on GENERIC_PHY_MIPI_DPHY
Message-ID: <YtZxajlS5FFFnfgf@aptenodytes>
References: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c2vhqyY7Sz61WNE8"
Content-Disposition: inline
In-Reply-To: <20220713192540.222794-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--c2vhqyY7Sz61WNE8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed 13 Jul 22, 22:25, Sakari Ailus wrote:
> The sun6i-mipi-csi2 and sun6i-a83t-mipi-csi2 drivers depend on the generic
> MIPI D-PHY support. Select it. This fixes a linking problem when either of
> these drivers is enabled and GENERIC_PHY_MIPI_DPHY is disabled.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Looks good to me but I have one question below.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig      | 1 +
>  drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drive=
rs/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> index b1712f5873fd9..eb982466abd30 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -8,6 +8,7 @@ config VIDEO_SUN6I_MIPI_CSI2
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
>  	select PHY_SUN6I_MIPI_DPHY
> +	select GENERIC_PHY_MIPI_DPHY

Since we select PHY_SUN6I_MIPI_DPHY here which also selects
GENERIC_PHY_MIPI_DPHY, I suppose this is not strictly needed?

Still feels like a good idea to have it since the driver does use the gener=
ic
MIPI D-PHY API.

Thanks,

Paul

>  	select REGMAP_MMIO
>  	help
>  	   Support for the Allwinner A31 MIPI CSI-2 controller, also found on
> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig b/=
drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> index 5854f8388c92a..789d58ee12ea9 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
> @@ -8,5 +8,6 @@ config VIDEO_SUN8I_A83T_MIPI_CSI2
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
>  	select REGMAP_MMIO
> +	select GENERIC_PHY_MIPI_DPHY
>  	help
>  	   Support for the Allwinner A83T MIPI CSI-2 controller and D-PHY.
> --=20
> 2.30.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--c2vhqyY7Sz61WNE8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmLWcWoACgkQ3cLmz3+f
v9Gpewf/dAY3PASP/1aBjBhq9Ufq74LEUFJNiLMwY9RdTMqxm3DvPBkBilsvwZS3
REAYNQZ0mWBE2v8GE6AYqk4tcb3NmOuxXRtlwQP6Bkl4KrUUJudPVgQUS/AFl6U+
wB2cEu8SHWWZI5OrX5t6BkaUnmvWJ5DfUfFsV2s958yZGhq28SS/1elKfyB+T9Ra
J4xlDelwAQjL8vv9NHVCDQlbZoAj+u6DdE9SMK3JleAIvILayuvqm0WRM0B9Feq1
KG73qfk9hquQYlcAh36s/WJlXq9JGIji1nGGxPOPCpGE6lOkYYBNsNqCm40uXnOH
/za7p+zZpqLYwrRBw5+gnXr419gDxQ==
=TnzH
-----END PGP SIGNATURE-----

--c2vhqyY7Sz61WNE8--
