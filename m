Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C494391A11
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 16:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbhEZOZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 10:25:37 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37501 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhEZOZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 10:25:37 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 743A61BF210;
        Wed, 26 May 2021 14:24:00 +0000 (UTC)
Date:   Wed, 26 May 2021 16:24:00 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 02/16] phy: Distinguish between Rx and Tx for MIPI
 D-PHY with submodes
Message-ID: <YK5aAL6ciI92ruHs@aptenodytes>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <20210115200141.1397785-3-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7zgmf44zur7folx5"
Content-Disposition: inline
In-Reply-To: <20210115200141.1397785-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7zgmf44zur7folx5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Fri 15 Jan 21, 21:01, Paul Kocialkowski wrote:
> As some D-PHY controllers support both Rx and Tx mode, we need a way for
> users to explicitly request one or the other. For instance, Rx mode can
> be used along with MIPI CSI-2 while Tx mode can be used with MIPI DSI.
>=20
> Introduce new MIPI D-PHY PHY submodes to use with PHY_MODE_MIPI_DPHY.
> The default (zero value) is kept to Tx so only the rkisp1 driver, which
> uses D-PHY in Rx mode, needs to be adapted.

I think it was Laurent who brought up on IRC that using a submode is probab=
ly
not a correct way to distinguish between Rx and Tx modes.

Thinking about it again, it feels like selecting the direction at run-time
would only be relevant if there's D-PHY hardware than can do both Tx and Rx
*and* that can be muxed to either a MIPI DSI and a CSI-2 controller at
run-time.

For the Allwinner case, the D-PHY is the same hardware for both but there w=
ill
be one instance attached to each controller, not a single shared instance.
It feels rather unlikely that a device with both MIPI DSI and CSI-2 would o=
nly
have one PHY for the two as this wouldn't allow concurrent use of the two
controllers. Even in a case where there'd be n controllers and m < n
bi-directional PHYs, it feels safe to assume that a static attribution would
be sufficient.
=20
As a result it feels more relevant to have this distinction in device-tree
rather than via the PHY API.

What do you think?
Any suggestion on how this should be represented in device-tree?

Cheers,

Paul

> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 ++-
>  include/linux/phy/phy-mipi-dphy.h                   | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..cab261644102 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -948,7 +948,8 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *=
isp,
> =20
>  	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
>  					 sensor->lanes, cfg);
> -	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> +	phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> +			 PHY_MIPI_DPHY_SUBMODE_RX);
>  	phy_configure(sensor->dphy, &opts);
>  	phy_power_on(sensor->dphy);
> =20
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mi=
pi-dphy.h
> index a877ffee845d..0f57ef46a8b5 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -6,6 +6,19 @@
>  #ifndef __PHY_MIPI_DPHY_H_
>  #define __PHY_MIPI_DPHY_H_
> =20
> +/**
> + * enum phy_mipi_dphy_submode - MIPI D-PHY sub-mode
> + *
> + * A MIPI D-PHY can be used to transmit or receive data.
> + * Since some controllers can support both, the direction to enable is s=
pecified
> + * with the PHY sub-mode. Transmit is assumed by default with phy_set_mo=
de.
> + */
> +
> +enum phy_mipi_dphy_submode {
> +	PHY_MIPI_DPHY_SUBMODE_TX =3D 0,
> +	PHY_MIPI_DPHY_SUBMODE_RX,
> +};
> +
>  /**
>   * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>   *
> --=20
> 2.30.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--7zgmf44zur7folx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmCuWgAACgkQ3cLmz3+f
v9FhsAf+LCjDsXEPBS3IEa3r1GuNV4LBCN/X+lLIeNTjDh6K2INIlcpTAQKOFukJ
SpuPbpbstXPTy9/vCtFP/DlZL1Oh2LO0HtXUlcb3rGEFO+1I4HUlOemAjl4TLbIv
E0b9iFY1splxVIehgB1+IGh0+OeiFr/d5GegzOggbhxTN9Et1Ag43WAWglT86XcY
MClLNUG8uVl86H83cFVP2AVzPj4GSmgiydKVcH8mLG6PE7DD3PfH5VzkDb2fAmMg
uXJGP2qJCEXMAHwz6GFxEDArK22vzR7kzw3VAZWIwnBYP58QW/ifeL4D0Ak1aDbD
wlmzQmgw2dpbHuESesA/00xaqumugA==
=/RYX
-----END PGP SIGNATURE-----

--7zgmf44zur7folx5--
