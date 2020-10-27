Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C2429C72B
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 19:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1827820AbgJ0S2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 14:28:20 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48515 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1827811AbgJ0S2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 14:28:18 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2A9F25803DD;
        Tue, 27 Oct 2020 14:28:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 27 Oct 2020 14:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=dSgnQIa3tA1J3WQvwUkryDJy17/
        cH7uUtmKx14vRB74=; b=XUmOhwucqRqwCMBBJ5y53w/bh0MvJJmlNvX3vSsqwMI
        qeEcHNVJ3rB7rfqcict3X+E3gqDjDvKhDcTS6tlKTVvrolSfRmXLVvl67z/3+Sr2
        24kdLLi8flG6sqlsxonszl63zyQ+ISrb82gG4+0iro95IjGI6FdT2b69DnTk3SA5
        ku+o8UbKvVyK85gF1z2AyM7ujnVAd0r1bnm9LwQu+rWzpYeraHObxiImqoSixZmw
        wwru3O5JhbezMWnS4njh2PUEzVhcfWOPic2H0mPuIkaNYjkhImGLupHVb6j/kIsS
        HA1QmZmKTaXkcUChdV7/Tkz9XU6/Hwk7IoMM6Ef+0OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dSgnQI
        a3tA1J3WQvwUkryDJy17/cH7uUtmKx14vRB74=; b=dVg5tdUTdLWWDtOyTUFtBn
        OYQeP2fmPeQJLXBsZgySH0cjE8fjTZArR3+woJpzcdhJcZMrzxX5i9x8687Ssk2V
        C1SEhEAWVfuK4XiO/cGEcAGUP2/1ODuzL/2aevPhnM3rzy3+CpptIzWbiroAPN3j
        nCjL3a+9iR6cAHLle/VlOAVZdnzWgbfV5euJquIfE2rjyC7iuCNa1iy2Yo28GXyh
        h18aMjgxI6gwt1PLEWlhXSHP33McwFU5udoahj+dc2equNrMhSxa0qdD7xeLrE8I
        +dGqU9bGEhhjU7ml8arlOwKGcnNymqkOpbMLaxKHMq49FoxP5xSqaXUPrrFjT65g
        ==
X-ME-Sender: <xms:vWaYX-pssDg_l0Bp5o_BD_020W7obaCpS33U-SOfjrgLDey2xIVcJQ>
    <xme:vWaYX8q3pkDyJ21ahQD5QcZxShwRp3frYkZTvlbOYrVF7c1-V4lrnbcB6fe2h2WEK
    Yk0iyFD5wuwfvzFsAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnheptdfggfelgeehieeuieegfefgueduudefheffhfejleekheefjeevveegueel
    ueefnecuffhomhgrihhnpehlihhnuhigqdhsuhhngihirdhorhhgnecukfhppeeltddrke
    elrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vWaYXzMVtOHfPSziFsp7l0nRhHMO_WiGp-EkSFV-VpaLtauKj95w4Q>
    <xmx:vWaYX95EoO5Jc5m248cqkLuS8bkcduV82yQ21IEcRDVTlDVGGVv9ag>
    <xmx:vWaYX96KCNUbXVAmysj-8ek_NHL1sWd2Ac4oSjp5Z29JXRGbkY60FQ>
    <xmx:wGaYX6xrrSUc7PUFjfVYgzxB0GVeKfWyF-ReVj64MM0GyCFfW6mQAA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 20FBB3280067;
        Tue, 27 Oct 2020 14:28:13 -0400 (EDT)
Date:   Tue, 27 Oct 2020 19:28:11 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Message-ID: <20201027182811.j6372vdmls5yvhri@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-3-paul.kocialkowski@bootlin.com>
 <20201026153857.iwkn4iusi2jy2yf4@gilmour.lan>
 <20201027092326.GB168350@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uqnhruvnsc2qrfvt"
Content-Disposition: inline
In-Reply-To: <20201027092326.GB168350@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uqnhruvnsc2qrfvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

On Tue, Oct 27, 2020 at 10:23:26AM +0100, Paul Kocialkowski wrote:
> On Mon 26 Oct 20, 16:38, Maxime Ripard wrote:
> > On Fri, Oct 23, 2020 at 07:45:34PM +0200, Paul Kocialkowski wrote:
> > > The Allwinner A31 D-PHY supports both Rx and Tx modes. While the latt=
er
> > > is already supported and used for MIPI DSI this adds support for the
> > > former, to be used with MIPI CSI-2.
> > >=20
> > > This implementation is inspired by the Allwinner BSP implementation.
> >=20
> > Mentionning which BSP you took this from would be helpful
>=20
> Sure! It's from the Github repo linked from https://linux-sunxi.org/V3s.
> Would you like that I mention this URL explicitly or would it be enough to
> mention "Allwinner's V3s Linux SDK" as they seem to call it?

Yeah, that would be great
> > > +static int sun6i_dphy_rx_power_on(struct sun6i_dphy *dphy)
> > > +{
> > > +	/* Physical clock rate is actually half of symbol rate with DDR. */
> > > +	unsigned long mipi_symbol_rate =3D dphy->config.hs_clk_rate;
> > > +	unsigned long dphy_clk_rate;
> > > +	unsigned int rx_dly;
> > > +	unsigned int lprst_dly;
> > > +	u32 value;
> > > +
> > > +	dphy_clk_rate =3D clk_get_rate(dphy->mod_clk);
> > > +	if (!dphy_clk_rate)
> > > +		return -1;
> >=20
> > Returning -1 is weird here?
>=20
> What do you think would be a more appropriate error code to return?
> It looks like some other drivers return -EINVAL when that happens (but ma=
ny
> don't do the check).

Yeah, EINVAL at least is better than ENOPERM=20

> > > +
> > > +	/* Hardcoded timing parameters from the Allwinner BSP. */
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME0_REG,
> > > +		     SUN6I_DPHY_RX_TIME0_HS_RX_SYNC(255) |
> > > +		     SUN6I_DPHY_RX_TIME0_HS_RX_CLK_MISS(255) |
> > > +		     SUN6I_DPHY_RX_TIME0_LP_RX(255));
> > > +
> > > +	/*
> > > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > > +	 * (probably internal divider/multiplier).
> > > +	 */
> > > +	rx_dly =3D 8 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rate / 8=
));
> > > +
> > > +	/*
> > > +	 * The Allwinner BSP has an alternative formula for LP_RX_ULPS_WP:
> > > +	 * lp_ulps_wp_cnt =3D lp_ulps_wp_ms * lp_clk / 1000
> > > +	 * but does not use it and hardcodes 255 instead.
> > > +	 */
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME1_REG,
> > > +		     SUN6I_DPHY_RX_TIME1_RX_DLY(rx_dly) |
> > > +		     SUN6I_DPHY_RX_TIME1_LP_RX_ULPS_WP(255));
> > > +
> > > +	/* HS_RX_ANA0 value is hardcoded in the Allwinner BSP. */
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME2_REG,
> > > +		     SUN6I_DPHY_RX_TIME2_HS_RX_ANA0(4));
> > > +
> > > +	/*
> > > +	 * Formula from the Allwinner BSP, with hardcoded coefficients
> > > +	 * (probably internal divider/multiplier).
> > > +	 */
> > > +	lprst_dly =3D 4 * (unsigned int)(dphy_clk_rate / (mipi_symbol_rate =
/ 2));
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_TIME3_REG,
> > > +		     SUN6I_DPHY_RX_TIME3_LPRST_DLY(lprst_dly));
> > > +
> > > +	/* Analog parameters are hardcoded in the Allwinner BSP. */
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA0_REG,
> > > +		     SUN6I_DPHY_ANA0_REG_PWS |
> > > +		     SUN6I_DPHY_ANA0_REG_SLV(7) |
> > > +		     SUN6I_DPHY_ANA0_REG_SFB(2));
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA1_REG,
> > > +		     SUN6I_DPHY_ANA1_REG_SVTT(4));
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA4_REG,
> > > +		     SUN6I_DPHY_ANA4_REG_DMPLVC |
> > > +		     SUN6I_DPHY_ANA4_REG_DMPLVD(1));
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA2_REG,
> > > +		     SUN6I_DPHY_ANA2_REG_ENIB);
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_ANA3_REG,
> > > +		     SUN6I_DPHY_ANA3_EN_LDOR |
> > > +		     SUN6I_DPHY_ANA3_EN_LDOC |
> > > +		     SUN6I_DPHY_ANA3_EN_LDOD);
> > > +
> > > +	/*
> > > +	 * Delay comes from the Allwinner BSP, likely for internal regulator
> > > +	 * ramp-up.
> > > +	 */
> > > +	udelay(3);
> > > +
> > > +	value =3D SUN6I_DPHY_RX_CTL_EN_DBC | SUN6I_DPHY_RX_CTL_RX_CLK_FORCE;
> > > +
> > > +	/*
> > > +	 * Rx data lane force-enable bits are used as regular RX enable by =
the
> > > +	 * Allwinner BSP.
> > > +	 */
> > > +	if (dphy->config.lanes >=3D 1)
> > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D0_FORCE;
> > > +	if (dphy->config.lanes >=3D 2)
> > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D1_FORCE;
> > > +	if (dphy->config.lanes >=3D 3)
> > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D2_FORCE;
> > > +	if (dphy->config.lanes =3D=3D 4)
> > > +		value |=3D SUN6I_DPHY_RX_CTL_RX_D3_FORCE;
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_RX_CTL_REG, value);
> > > +
> > > +	regmap_write(dphy->regs, SUN6I_DPHY_GCTL_REG,
> > > +		     SUN6I_DPHY_GCTL_LANE_NUM(dphy->config.lanes) |
> > > +		     SUN6I_DPHY_GCTL_EN);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int sun6i_dphy_power_on(struct phy *phy)
> > > +{
> > > +	struct sun6i_dphy *dphy =3D phy_get_drvdata(phy);
> > > +
> > > +	switch (dphy->submode) {
> > > +	case PHY_MIPI_DPHY_SUBMODE_TX:
> > > +		return sun6i_dphy_tx_power_on(dphy);
> > > +	case PHY_MIPI_DPHY_SUBMODE_RX:
> > > +		return sun6i_dphy_rx_power_on(dphy);
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +}
> > > +
> >=20
> > Can one call power_on before set_mode?
>=20
> I didn't find anything indicating this is illegal. What would happen here=
 is
> that the D-PHY would be configured to PHY_MIPI_DPHY_SUBMODE_TX (submode =
=3D=3D 0)
> at power-on if set_mode is not called before.
>=20
> I think it's fair to expect that it's too late to change the mode once th=
e PHY
> was powered on. Maybe we should return -EBUSY on set_mode when power on w=
as
> already requested?

Or maybe we can just clarify it in the framework/function documentation

Maxime

--uqnhruvnsc2qrfvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5hmuwAKCRDj7w1vZxhR
xeyQAQD8UUtAF93oDhvysOz/Nj17EEhOoBwmmzBNGTtdCLRtUgD9EsftZeY/+IOA
Kzp6yDaCvfPfojb2leh+z+S5NCYPxQ4=
=HLIM
-----END PGP SIGNATURE-----

--uqnhruvnsc2qrfvt--
