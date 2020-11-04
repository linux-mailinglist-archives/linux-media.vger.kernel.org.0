Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26002A62AD
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgKDKzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:55:08 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51565 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgKDKzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:55:07 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id ABA7A1BF204;
        Wed,  4 Nov 2020 10:54:59 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:54:59 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 02/14] phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY
 Rx mode for MIPI CSI-2
Message-ID: <20201104105459.GF285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-3-paul.kocialkowski@bootlin.com>
 <5df82a6c-daa3-8e47-b7a4-85da60b87dd2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Content-Disposition: inline
In-Reply-To: <5df82a6c-daa3-8e47-b7a4-85da60b87dd2@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Helen and thanks for the review,

On Fri 30 Oct 20, 19:44, Helen Koike wrote:
> On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
> > The Allwinner A31 D-PHY supports both Rx and Tx modes. While the latter
> > is already supported and used for MIPI DSI this adds support for the
> > former, to be used with MIPI CSI-2.
> >=20
> > This implementation is inspired by the Allwinner BSP implementation.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c | 164 +++++++++++++++++++-
> >  1 file changed, 160 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c b/drivers/phy/=
allwinner/phy-sun6i-mipi-dphy.c
> > index 1fa761ba6cbb..8bcd4bb79f60 100644
> > --- a/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> > +++ b/drivers/phy/allwinner/phy-sun6i-mipi-dphy.c
> > @@ -24,6 +24,14 @@
> >  #define SUN6I_DPHY_TX_CTL_REG		0x04
> >  #define SUN6I_DPHY_TX_CTL_HS_TX_CLK_CONT	BIT(28)
> > =20
> > +#define SUN6I_DPHY_RX_CTL_REG		0x08
> > +#define SUN6I_DPHY_RX_CTL_EN_DBC	BIT(31)
> > +#define SUN6I_DPHY_RX_CTL_RX_CLK_FORCE	BIT(24)
> > +#define SUN6I_DPHY_RX_CTL_RX_D3_FORCE	BIT(23)
> > +#define SUN6I_DPHY_RX_CTL_RX_D2_FORCE	BIT(22)
> > +#define SUN6I_DPHY_RX_CTL_RX_D1_FORCE	BIT(21)
> > +#define SUN6I_DPHY_RX_CTL_RX_D0_FORCE	BIT(20)
> > +
> >  #define SUN6I_DPHY_TX_TIME0_REG		0x10
> >  #define SUN6I_DPHY_TX_TIME0_HS_TRAIL(n)		(((n) & 0xff) << 24)
> >  #define SUN6I_DPHY_TX_TIME0_HS_PREPARE(n)	(((n) & 0xff) << 16)
> > @@ -44,12 +52,29 @@
> >  #define SUN6I_DPHY_TX_TIME4_HS_TX_ANA1(n)	(((n) & 0xff) << 8)
> >  #define SUN6I_DPHY_TX_TIME4_HS_TX_ANA0(n)	((n) & 0xff)
> > =20
> > +#define SUN6I_DPHY_RX_TIME0_REG		0x30
> > +#define SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(n)	(((n) & 0xff) << 24)
> > +#define SUN6I_DPHY_RX_TIME0_HS_RX_CLK_MISS(n)	(((n) & 0xff) << 16)
> > +#define SUN6I_DPHY_RX_TIME0_LP_RX(n)		(((n) & 0xff) << 8)
> > +
> > +#define SUN6I_DPHY_RX_TIME1_REG		0x34
> > +#define SUN6I_DPHY_RX_TIME1_RX_DLY(n)		(((n) & 0xfff) << 20)
> > +#define SUN6I_DPHY_RX_TIME1_LP_RX_ULPS_WP(n)	((n) & 0xfffff)
> > +
> > +#define SUN6I_DPHY_RX_TIME2_REG		0x38
> > +#define SUN6I_DPHY_RX_TIME2_HS_RX_ANA1(n)	(((n) & 0xff) << 8)
> > +#define SUN6I_DPHY_RX_TIME2_HS_RX_ANA0(n)	((n) & 0xff)
> > +
> > +#define SUN6I_DPHY_RX_TIME3_REG		0x40
> > +#define SUN6I_DPHY_RX_TIME3_LPRST_DLY(n)	(((n) & 0xffff) << 16)
> > +
> >  #define SUN6I_DPHY_ANA0_REG		0x4c
> >  #define SUN6I_DPHY_ANA0_REG_PWS			BIT(31)
> >  #define SUN6I_DPHY_ANA0_REG_DMPC		BIT(28)
> >  #define SUN6I_DPHY_ANA0_REG_DMPD(n)		(((n) & 0xf) << 24)
> >  #define SUN6I_DPHY_ANA0_REG_SLV(n)		(((n) & 7) << 12)
> >  #define SUN6I_DPHY_ANA0_REG_DEN(n)		(((n) & 0xf) << 8)
> > +#define SUN6I_DPHY_ANA0_REG_SFB(n)		(((n) & 3) << 2)
> > =20
> >  #define SUN6I_DPHY_ANA1_REG		0x50
> >  #define SUN6I_DPHY_ANA1_REG_VTTMODE		BIT(31)
> > @@ -92,6 +117,8 @@ struct sun6i_dphy {
> > =20
> >  	struct phy				*phy;
> >  	struct phy_configure_opts_mipi_dphy	config;
> > +
> > +	int					submode;
> >  };
> > =20
> >  static int sun6i_dphy_init(struct phy *phy)
> > @@ -105,6 +132,18 @@ static int sun6i_dphy_init(struct phy *phy)
> >  	return 0;
> >  }
> > =20
> > +static int sun6i_dphy_set_mode(struct phy *phy, enum phy_mode mode, in=
t submode)
> > +{
> > +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > +
> > +	if (mode !=3D PHY_MODE_MIPI_DPHY)
> > +		return -EINVAL;
> > +
> > +	dphy->submode =3D submode;
>=20
> Shouldn't you check if the submode is valid here?

Yes that's a good point, thanks!

> > +
> > +	return 0;
> > +}
> > +
> >  static int sun6i_dphy_configure(struct phy *phy, union phy_configure_o=
pts *opts)
> >  {
> >  	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > @@ -119,9 +158,8 @@ static int sun6i_dphy_configure(struct phy *phy, un=
ion phy_configure_opts *opts)
> >  	return 0;
> >  }
> > =20
> > -static int sun6i_dphy_power_on(struct phy *phy)
> > +static int sun6i_dphy_tx_power_on(struct sun6i_dphy *dphy)
> >  {
> > -	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> >  	u8 lanes_mask =3D GENMASK(dphy->config.lanes - 1, 0);
> > =20
> >  	regmap_write(dphy->regs, SUN6I_DPHY_TX_CTL_REG,
> > @@ -211,12 +249,129 @@ static int sun6i_dphy_power_on(struct phy *phy)
> >  	return 0;
> >  }
> > =20
> > +static int sun6i_dphy_rx_power_on(struct sun6i_dphy *dphy)
> > +{
> > +	/* Physical clock rate is actually half of symbol rate with DDR. */
> > +	unsigned long mipi_symbol_rate =3D dphy->config.hs_clk_rate;
> > +	unsigned long dphy_clk_rate;
> > +	unsigned int rx_dly;
> > +	unsigned int lprst_dly;
> > +	u32 value;
> > +
> > +	dphy_clk_rate =3D clk_get_rate(dphy->mod_clk);
> > +	if (!dphy_clk_rate)
> > +		return -1;
> > +
> > +	/* Hardcoded timing parameters from the Allwinner BSP. */
> > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME0_REG,
> > +		     SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(255) |
> > +		     SUN6I_DPHY_RX_TIME0_HS_RX_CLK_MISS(255) |
> > +		     SUN6I_DPHY_RX_TIME0_LP_RX(255));
> > +
> > +	/*
> > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > +	 * (probably internal divider/multiplier).
> > +	 */
> > +	rx_dly =3D 8 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rate / 8));
> > +
> > +	/*
> > +	 * The Allwinner BSP has an alternative formula for LP_RX_ULPS_WP:
> > +	 * lp_ulps_wp_cnt =3D lp_ulps_wp_ms * lp_clk / 1000
> > +	 * but does not use it and hardcodes 255 instead.
> > +	 */
> > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME1_REG,
> > +		     SUN6I_DPHY_RX_TIME1_RX_DLY(rx_dly) |
> > +		     SUN6I_DPHY_RX_TIME1_LP_RX_ULPS_WP(255));
> > +
> > +	/* HS_RX_ANA0 value is hardcoded in the Allwinner BSP. */
> > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME2_REG,
> > +		     SUN6I_DPHY_RX_TIME2_HS_RX_ANA0(4));
> > +
> > +	/*
> > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > +	 * (probably internal divider/multiplier).
> > +	 */
> > +	lprst_dly =3D 4 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rate / =
2));
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME3_REG,
> > +		     SUN6I_DPHY_RX_TIME3_LPRST_DLY(lprst_dly));
> > +
> > +	/* Analog parameters are hardcoded in the Allwinner BSP. */
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA0_REG,
> > +		     SUN6I_DPHY_ANA0_REG_PWS |
> > +		     SUN6I_DPHY_ANA0_REG_SLV(7) |
> > +		     SUN6I_DPHY_ANA0_REG_SFB(2));
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG,
> > +		     SUN6I_DPHY_ANA1_REG_SVTT(4));
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
> > +		     SUN6I_DPHY_ANA4_REG_DMPLVC |
> > +		     SUN6I_DPHY_ANA4_REG_DMPLVD(1));
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG,
> > +		     SUN6I_DPHY_ANA2_REG_ENIB);
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
> > +		     SUN6I_DPHY_ANA3_EN_LDOR |
> > +		     SUN6I_DPHY_ANA3_EN_LDOC |
> > +		     SUN6I_DPHY_ANA3_EN_LDOD);
> > +
> > +	/*
> > +	 * Delay comes from the Allwinner BSP, likely for internal regulator
> > +	 * ramp-up.
> > +	 */
> > +	udelay(3);
> > +
> > +	value =3D SUN6I_DPHY_RX_CTL_EN_DBC | SUN6I_DPHY_RX_CTL_RX_CLK_FORCE;
> > +
> > +	/*
> > +	 * Rx data lane force-enable bits are used as regular RX enable by the
> > +	 * Allwinner BSP.
> > +	 */
> > +	if (dphy->config.lanes >=3D 1)
> > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D0_FORCE;
> > +	if (dphy->config.lanes >=3D 2)
> > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D1_FORCE;
> > +	if (dphy->config.lanes >=3D 3)
> > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D2_FORCE;
> > +	if (dphy->config.lanes =3D=3D 4)
> > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D3_FORCE;
>=20
> I would replace this by a switch case with fallthrough to avoid too many =
comparisons
> to the same value.

Okay, why not!

Cheers,

Paul

> Regards,
> Helen
>=20
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_CTL_REG, value);
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_GCTL_REG,
> > +		     SUN6I_DPHY_GCTL_LANE_NUM(dphy->config.lanes) |
> > +		     SUN6I_DPHY_GCTL_EN);
> > +
> > +	return 0;
> > +}
> > +
> > +static int sun6i_dphy_power_on(struct phy *phy)
> > +{
> > +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > +
> > +	switch (dphy->submode) {
> > +	case PHY_MIPI_DPHY_SUBMODE_TX:
> > +		return sun6i_dphy_tx_power_on(dphy);
> > +	case PHY_MIPI_DPHY_SUBMODE_RX:
> > +		return sun6i_dphy_rx_power_on(dphy);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static int sun6i_dphy_power_off(struct phy *phy)
> >  {
> >  	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > =20
> > -	regmap_update_bits(dphy->regs, SUN6I_DPHY_ANA1_REG,
> > -			   SUN6I_DPHY_ANA1_REG_VTTMODE, 0);
> > +	regmap_write(dphy->regs, SUN6I_DPHY_GCTL_REG, 0);
> > +
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA0_REG, 0);
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG, 0);
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG, 0);
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG, 0);
> > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG, 0);
> > =20
> >  	return 0;
> >  }
> > @@ -234,6 +389,7 @@ static int sun6i_dphy_exit(struct phy *phy)
> > =20
> > =20
> >  static const struct phy_ops sun6i_dphy_ops =3D {
> > +	.set_mode	=3D sun6i_dphy_set_mode,
> >  	.configure	=3D sun6i_dphy_configure,
> >  	.power_on	=3D sun6i_dphy_power_on,
> >  	.power_off	=3D sun6i_dphy_power_off,
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+iiIMACgkQ3cLmz3+f
v9EkBwf+IjDiunJ0G32sOk6Fk+5zcdajobd4frt8lze6HGDCLACYGzsN5yhyHYHw
ywbzbVqWXbOBdauj0uplVaWeoo6B5OYbKvnwrz1Yzmz42gxyINl5ae2HkFbr5rK1
6L3pxvs89Vjnl+H/spm234ubaILLRBYYuv8SuzLfjiaDBqCnIwEqD+U368fQuqMT
gOeN1Ert+RY1s3uLCnc9rGhavrbAE/6i21+M2xgl94JzF5bTZGSlpnorNXh/eb5h
oyNwnYL811zu3S5QT4DselP3KAx1uMh8ciPV+wZDd9uhEl+lZqti5LDPw4tDU2iG
D79IR/96XLGfCP8Mx6eH6Oqh4eZ2UA==
=bjvT
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
