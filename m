Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2ACB2A6299
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgKDKxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:53:44 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:34653 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKDKxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:53:43 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 617B3E0008;
        Wed,  4 Nov 2020 10:53:35 +0000 (UTC)
Date:   Wed, 4 Nov 2020 11:53:34 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 02/14] phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY
 Rx mode for MIPI CSI-2
Message-ID: <20201104105334.GE285779@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-3-paul.kocialkowski@bootlin.com>
 <20201026153857.iwkn4iusi2jy2yf4@gilmour.lan>
 <20201027092326.GB168350@aptenodytes>
 <20201027182811.j6372vdmls5yvhri@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Content-Disposition: inline
In-Reply-To: <20201027182811.j6372vdmls5yvhri@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 27 Oct 20, 19:28, Maxime Ripard wrote:
>=20
> Hi,
>=20
> On Tue, Oct 27, 2020 at 10:23:26AM +0100, Paul Kocialkowski wrote:
> > On Mon 26 Oct 20, 16:38, Maxime Ripard wrote:
> > > On Fri, Oct 23, 2020 at 07:45:34PM +0200, Paul Kocialkowski wrote:
> > > > The Allwinner A31 D-PHY supports both Rx and Tx modes. While the la=
tter
> > > > is already supported and used for MIPI DSI this adds support for the
> > > > former, to be used with MIPI CSI-2.
> > > >=20
> > > > This implementation is inspired by the Allwinner BSP implementation.
> > >=20
> > > Mentionning which BSP you took this from would be helpful
> >=20
> > Sure! It's from the Github repo linked from https://linux-sunxi.org/V3s.
> > Would you like that I mention this URL explicitly or would it be enough=
 to
> > mention "Allwinner's V3s Linux SDK" as they seem to call it?
>=20
> Yeah, that would be great
> > > > +static int sun6i_dphy_rx_power_on(struct sun6i_dphy *dphy)
> > > > +{
> > > > +	/* Physical clock rate is actually half of symbol rate with DDR. =
*/
> > > > +	unsigned long mipi_symbol_rate =3D dphy->config.hs_clk_rate;
> > > > +	unsigned long dphy_clk_rate;
> > > > +	unsigned int rx_dly;
> > > > +	unsigned int lprst_dly;
> > > > +	u32 value;
> > > > +
> > > > +	dphy_clk_rate =3D clk_get_rate(dphy->mod_clk);
> > > > +	if (!dphy_clk_rate)
> > > > +		return -1;
> > >=20
> > > Returning -1 is weird here?
> >=20
> > What do you think would be a more appropriate error code to return?
> > It looks like some other drivers return -EINVAL when that happens (but =
many
> > don't do the check).
>=20
> Yeah, EINVAL at least is better than ENOPERM=20
>=20
> > > > +
> > > > +	/* Hardcoded timing parameters from the Allwinner BSP. */
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME0_REG,
> > > > +		     SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(255) |
> > > > +		     SUN6I_DPHY_RX_TIME0_HS_RX_CLK_MISS(255) |
> > > > +		     SUN6I_DPHY_RX_TIME0_LP_RX(255));
> > > > +
> > > > +	/*
> > > > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > > > +	 * (probably internal divider/multiplier).
> > > > +	 */
> > > > +	rx_dly =3D 8 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rate /=
 8));
> > > > +
> > > > +	/*
> > > > +	 * The Allwinner BSP has an alternative formula for LP_RX_ULPS_WP:
> > > > +	 * lp_ulps_wp_cnt =3D lp_ulps_wp_ms * lp_clk / 1000
> > > > +	 * but does not use it and hardcodes 255 instead.
> > > > +	 */
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME1_REG,
> > > > +		     SUN6I_DPHY_RX_TIME1_RX_DLY(rx_dly) |
> > > > +		     SUN6I_DPHY_RX_TIME1_LP_RX_ULPS_WP(255));
> > > > +
> > > > +	/* HS_RX_ANA0 value is hardcoded in the Allwinner BSP. */
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME2_REG,
> > > > +		     SUN6I_DPHY_RX_TIME2_HS_RX_ANA0(4));
> > > > +
> > > > +	/*
> > > > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > > > +	 * (probably internal divider/multiplier).
> > > > +	 */
> > > > +	lprst_dly =3D 4 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rat=
e / 2));
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME3_REG,
> > > > +		     SUN6I_DPHY_RX_TIME3_LPRST_DLY(lprst_dly));
> > > > +
> > > > +	/* Analog parameters are hardcoded in the Allwinner BSP. */
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA0_REG,
> > > > +		     SUN6I_DPHY_ANA0_REG_PWS |
> > > > +		     SUN6I_DPHY_ANA0_REG_SLV(7) |
> > > > +		     SUN6I_DPHY_ANA0_REG_SFB(2));
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG,
> > > > +		     SUN6I_DPHY_ANA1_REG_SVTT(4));
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
> > > > +		     SUN6I_DPHY_ANA4_REG_DMPLVC |
> > > > +		     SUN6I_DPHY_ANA4_REG_DMPLVD(1));
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG,
> > > > +		     SUN6I_DPHY_ANA2_REG_ENIB);
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
> > > > +		     SUN6I_DPHY_ANA3_EN_LDOR |
> > > > +		     SUN6I_DPHY_ANA3_EN_LDOC |
> > > > +		     SUN6I_DPHY_ANA3_EN_LDOD);
> > > > +
> > > > +	/*
> > > > +	 * Delay comes from the Allwinner BSP, likely for internal regula=
tor
> > > > +	 * ramp-up.
> > > > +	 */
> > > > +	udelay(3);
> > > > +
> > > > +	value =3D SUN6I_DPHY_RX_CTL_EN_DBC | SUN6I_DPHY_RX_CTL_RX_CLK_FOR=
CE;
> > > > +
> > > > +	/*
> > > > +	 * Rx data lane force-enable bits are used as regular RX enable b=
y the
> > > > +	 * Allwinner BSP.
> > > > +	 */
> > > > +	if (dphy->config.lanes >=3D 1)
> > > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D0_FORCE;
> > > > +	if (dphy->config.lanes >=3D 2)
> > > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D1_FORCE;
> > > > +	if (dphy->config.lanes >=3D 3)
> > > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D2_FORCE;
> > > > +	if (dphy->config.lanes =3D=3D 4)
> > > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D3_FORCE;
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_CTL_REG, value);
> > > > +
> > > > +	regmap_write(dphy->regs, SUN6I_DPHY_GCTL_REG,
> > > > +		     SUN6I_DPHY_GCTL_LANE_NUM(dphy->config.lanes) |
> > > > +		     SUN6I_DPHY_GCTL_EN);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int sun6i_dphy_power_on(struct phy *phy)
> > > > +{
> > > > +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > > > +
> > > > +	switch (dphy->submode) {
> > > > +	case PHY_MIPI_DPHY_SUBMODE_TX:
> > > > +		return sun6i_dphy_tx_power_on(dphy);
> > > > +	case PHY_MIPI_DPHY_SUBMODE_RX:
> > > > +		return sun6i_dphy_rx_power_on(dphy);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +}
> > > > +
> > >=20
> > > Can one call power_on before set_mode?
> >=20
> > I didn't find anything indicating this is illegal. What would happen he=
re is
> > that the D-PHY would be configured to PHY_MIPI_DPHY_SUBMODE_TX (submode=
 =3D=3D 0)
> > at power-on if set_mode is not called before.
> >=20
> > I think it's fair to expect that it's too late to change the mode once =
the PHY
> > was powered on. Maybe we should return -EBUSY on set_mode when power on=
 was
> > already requested?
>=20
> Or maybe we can just clarify it in the framework/function documentation

Agreed, I'll add a patch in that direction. I would also be tempted to chec=
k on
phy->power_count to return -EBUSY in phy_set_mode_ext so that the behavior =
is
enforced.

What do you think?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+iiC4ACgkQ3cLmz3+f
v9FVagf+MFoprb1lhbIcBfZckLyH0cqaPWe5B7qYhnUef4iiObGMo1T0PoXbhnUl
W4wwFrgdzcpN0SnOHyYXEQIHOdPnwNXNAR/lJtceUcq0MgI4yeh02lURUBBbKjua
1M8yR/5OYnF1c3f6En4mAGhOdw5dsQDdcVyTA3MlNNLRBVr3W+J6pOkQ3/hzqqX7
rrO+XgcfmzhhhVu3FVdEMFmCz+35yvGMz3YVNCOIweINBOBJIOsyZd54/QGpq8WJ
RlSSFuU4rBORC9mEp2sdVZuwOZQF8fnvoSa3O20anz42qmwvyqf7sZkuiL2ro1Ey
/I7tza6wop/1GiAThIiwYcOBuFKVXw==
=sQ1N
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--
