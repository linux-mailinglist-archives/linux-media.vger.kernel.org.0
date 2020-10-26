Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5E2299302
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786627AbgJZQyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:54:15 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35893 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786620AbgJZQyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:54:15 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9AE585805D6;
        Mon, 26 Oct 2020 12:54:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=jIzVtzYn2h8aePP1xaU0P+zUInz
        PFSZtARCPKtjxQ5A=; b=pgw+6ZbJwy23L+oUJmWLqg7hiQ6LdGf4+z68yyE7vLy
        IviDfO/3NUsdf5yPJnmFdbn8j/DrSC8rTLwsQVBCFBgrF++3Zhh40N5jiuPk7XsB
        dFtmwVc4Qt69XDA48a+HGOlg49CUjsedtHjEBn0B82FrcVdYlAl15JtAV7NqXSku
        LNXhOLq/SvjcAAZzw7ruAdJ7PwW8H3ust2aUKKdXVX8gmbtoa4KW5QAzaJWdjWnk
        DrEWAGuJGoG8a1x47ZdH87CmXvzgd3zImftcUVgi90X2lcbXEHrBYPAKovyk1aSd
        0dhDUR+Km6R+b9hJ6og41q2/BYAoeHl0r6SZjPDxtIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jIzVtz
        Yn2h8aePP1xaU0P+zUInzPFSZtARCPKtjxQ5A=; b=SMXq8SQ6PSg8IegzYTUNgh
        tL+SmLrWTMcXeRSzmNHsoW/QIi7+plpRL0hzNO9vEB7dNn1c3XDvPkHmJb7kS/tN
        KnoNU3yrPvkIZvzYV7QOdQGm75EXYq/FTMI/9GKbcIkXHCjh2agwV/CMCU67Ckgx
        H7jG1eZKVUNVN1yhxniGXClpv2iw72GZcw0EbJRYmzC/cQa2/OZ56wi/pheWVeG1
        ICG6YZrLLxAu/7zn7qcgP13qX4wo4Dp639yzUfXm7vAdTtv8sFcIgXEyfjg4bTSd
        dyilaVAsH1ZqpMfiTetHOnMRXvXjuPoxEggpW0o/cOWJhbzwhIrd0+GavmEFf/3w
        ==
X-ME-Sender: <xms:Mf-WX3fXZIZ7pbtgC8A0yZSass6WwSnAgQ_6hwTcsYs7WPEC-Uo5OA>
    <xme:Mf-WX9PDLu73dOhDMqOdaVjPRheSUyB1UGavLkiVB7LO8B_PH2pceRrLbTvRPBBa2
    BqIgli0bk-D8C6Kim4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Mf-WXwhLveUfp1Ve3u1Kc3-kmGj89pNHK0m80SKcnAm4UoCGisrXXQ>
    <xmx:Mf-WX4-ORUOBO-UemjmsmIo5kRbAaulcesrQAJJcG3geK8OtMTCZDA>
    <xmx:Mf-WXzvxycwwSBfkGlSJ9wW_BRHqxF5_IDGtDQwOTrdcLr2hMlfy2Q>
    <xmx:M_-WX-mZ68eCvJAZnwXONslBabUTXsAi7fdOaRr4ezNInO7SIrek1w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2FF6B3280059;
        Mon, 26 Oct 2020 12:54:09 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:54:07 +0100
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
Subject: Re: [PATCH 08/14] media: sunxi: Add support for the A31 MIPI CSI-2
 controller
Message-ID: <20201026165407.rrq6ccsexcsub5bm@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-9-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4cfq3ujht5frxucc"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4cfq3ujht5frxucc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:40PM +0200, Paul Kocialkowski wrote:
> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 controller
> found on Allwinner SoCs such as the A31 and V3/V3s.
>=20
> It is a standalone block, connected to the CSI controller on one side
> and to the MIPI D-PHY block on the other. It has a dedicated address
> space, interrupt line and clock.
>=20
> Currently, the MIPI CSI-2 controller is hard-tied to a specific CSI
> controller (CSI0) but newer SoCs (such as the V5) may allow switching
> MIPI CSI-2 controllers between CSI controllers.
>=20
> It is represented as a V4L2 subdev to the CSI controller and takes a
> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> media controller API.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/Kconfig          |   1 +
>  drivers/media/platform/sunxi/Makefile         |   1 +
>  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  11 +
>  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 635 ++++++++++++++++++
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 116 ++++
>  6 files changed, 768 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mi=
pi_csi2.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mi=
pi_csi2.h
>=20
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platfor=
m/sunxi/Kconfig
> index 7151cc249afa..9684e07454ad 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -2,3 +2,4 @@
> =20
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platfo=
rm/sunxi/Makefile
> index fc537c9f5ca9..887a7cae8fca 100644
> --- a/drivers/media/platform/sunxi/Makefile
> +++ b/drivers/media/platform/sunxi/Makefile
> @@ -2,5 +2,6 @@
> =20
>  obj-y		+=3D sun4i-csi/
>  obj-y		+=3D sun6i-csi/
> +obj-y		+=3D sun6i-mipi-csi2/
>  obj-y		+=3D sun8i-di/
>  obj-y		+=3D sun8i-rotate/
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drive=
rs/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> new file mode 100644
> index 000000000000..7033bda483b4
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_SUN6I_MIPI_CSI2
> +	tristate "Allwinner A31 MIPI CSI-2 Controller Driver"
> +	depends on VIDEO_V4L2 && COMMON_CLK
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select REGMAP_MMIO
> +	select V4L2_FWNODE
> +	help
> +	   Support for the Allwinner A31 MIPI CSI-2 Controller.
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile b/driv=
ers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> new file mode 100644
> index 000000000000..14e4e03818b5
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +sun6i-mipi-csi2-y +=3D sun6i_mipi_csi2.o
> +
> +obj-$(CONFIG_VIDEO_SUN6I_MIPI_CSI2) +=3D sun6i-mipi-csi2.o
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2=
=2Ec b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> new file mode 100644
> index 000000000000..ce89c35f5b86
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -0,0 +1,635 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "sun6i_mipi_csi2.h"
> +
> +#define MODULE_NAME	"sun6i-mipi-csi2"
> +
> +/* Core */
> +
> +static irqreturn_t sun6i_mipi_csi2_isr(int irq, void *dev_id)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev =3D (struct sun6i_mipi_csi2_dev *)dev_=
id;
> +	struct regmap *regmap =3D cdev->regmap;
> +	u32 pending;
> +
> +	WARN_ONCE(1, MODULE_NAME
> +		  ": Unsolicited interrupt, an error likely occurred!\n");
> +
> +	regmap_read(regmap, SUN6I_MIPI_CSI2_CH_INT_PD_REG, &pending);
> +	regmap_write(regmap, SUN6I_MIPI_CSI2_CH_INT_PD_REG, pending);
> +
> +	/*
> +	 * The interrupt can be used to catch transmission errors.
> +	 * However, we currently lack plumbing for reporting that to the
> +	 * A31 CSI controller driver.
> +	 */
> +
> +	return IRQ_HANDLED;
> +}

Uhh, what is this handler supposed to be doing? The warning will already
be printed by the core if you return IRQ_NONE, and then, apart from
clearing the interrupt status, it doesn't seem to be doing anything?

Why should we register a handler in the first place then?

> +static int sun6i_mipi_csi2_s_power(struct v4l2_subdev *subdev, int on)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct sun6i_mipi_csi2_dev *cdev =3D sun6i_mipi_csi2_video_dev(video);
> +	int ret;
> +
> +	if (!on) {
> +		clk_disable_unprepare(cdev->clk_mod);
> +		reset_control_assert(cdev->reset);
> +
> +		return 0;
> +	}
> +
> +	ret =3D clk_prepare_enable(cdev->clk_mod);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable module clock\n");
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(cdev->reset);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to deassert reset\n");
> +		goto error_clk;
> +	}

The user manual says to do the opposite: deassert the reset line and
then enable the clock, but I'm not sure where the bus clock is handled?

> +	return 0;
> +
> +error_clk:
> +	clk_disable_unprepare(cdev->clk_mod);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops sun6i_mipi_csi2_subdev_core_ops=
 =3D {
> +	.s_power	=3D sun6i_mipi_csi2_s_power,
> +};
> +
> +/* Video */
> +
> +static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct sun6i_mipi_csi2_dev *cdev =3D sun6i_mipi_csi2_video_dev(video);
> +	struct v4l2_subdev *remote_subdev =3D video->remote_subdev;
> +	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =3D
> +		&video->endpoint.bus.mipi_csi2;
> +	union phy_configure_opts dphy_opts =3D { 0 };
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &dphy_opts.mipi_dphy;
> +	struct regmap *regmap =3D cdev->regmap;
> +	struct v4l2_ctrl *ctrl;
> +	unsigned int lanes_count;
> +	unsigned int bpp;
> +	unsigned long pixel_rate;
> +	u8 data_type =3D 0;
> +	u32 version =3D 0;
> +	/* Initialize to 0 to use both in disable label (ret !=3D 0) and off. */
> +	int ret =3D 0;
> +
> +	if (!remote_subdev)
> +		return -ENODEV;
> +
> +	if (!on) {
> +		v4l2_subdev_call(remote_subdev, video, s_stream, 0);
> +
> +disable:
> +		regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
> +				   SUN6I_MIPI_CSI2_CTL_EN, 0);
> +
> +		phy_power_off(cdev->dphy);
> +
> +		return ret;
> +	}
> +
> +	switch (video->mbus_code) {
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		data_type =3D MIPI_CSI2_DATA_TYPE_RAW8;
> +		bpp =3D 8;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		data_type =3D MIPI_CSI2_DATA_TYPE_RAW10;
> +		bpp =3D 10;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Sensor pixel rate */
> +
> +	ctrl =3D v4l2_ctrl_find(remote_subdev->ctrl_handler, V4L2_CID_PIXEL_RAT=
E);
> +	if (!ctrl) {
> +		dev_err(cdev->dev,
> +			"%s: no MIPI CSI-2 pixel rate from the sensor\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	pixel_rate =3D (unsigned long)v4l2_ctrl_g_ctrl_int64(ctrl);
> +	if (!pixel_rate) {
> +		dev_err(cdev->dev,
> +			"%s: zero MIPI CSI-2 pixel rate from the sensor\n",
> +			__func__);
> +		return -ENODEV;
> +	}
> +
> +	/* D-PHY configuration */
> +
> +	lanes_count =3D bus_mipi_csi2->num_data_lanes;
> +	phy_mipi_dphy_get_default_config(pixel_rate, bpp, lanes_count,
> +					 dphy_cfg);
> +
> +
> +	/*
> +	 * Note that our hardware is using DDR, which is not taken in account by
> +	 * phy_mipi_dphy_get_default_config when calculating hs_clk_rate from
> +	 * the pixel rate, lanes count and bpp.
> +	 *
> +	 * The resulting clock rate is basically the symbol rate over the whole
> +	 * link. The actual clock rate is calculated with division by two since
> +	 * DDR samples both on rising and falling edges.
> +	 */
> +
> +	dev_dbg(cdev->dev, "A31 MIPI CSI-2 config:\n");
> +	dev_dbg(cdev->dev, "%ld pixels/s, %u bits/pixel, %lu Hz clock\n",
> +		pixel_rate, bpp, dphy_cfg->hs_clk_rate / 2);
> +
> +	ret =3D 0;
> +	ret |=3D phy_reset(cdev->dphy);
> +	ret |=3D phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> +				PHY_MIPI_DPHY_SUBMODE_RX);
> +	ret |=3D phy_configure(cdev->dphy, &dphy_opts);

If you have multiple errors here, chances are you'll get a different
error code, and then ...

> +	if (ret) {
> +		dev_err(cdev->dev, "failed to setup MIPI D-PHY\n");
> +		return ret;
> +	}

=2E.. return a completely bogus value here. I'd rather check in each step
and return the error code.

> +	ret =3D phy_power_on(cdev->dphy);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to power on MIPI D-PHY\n");
> +		return ret;
> +	}
> +
> +	/* MIPI CSI-2 controller setup */
> +
> +	/*
> +	 * The enable flow in the Allwinner BSP is a bit different: the enable
> +	 * and reset bits are set together before starting the CSI controller.
> +	 *
> +	 * In mainline we enable the CSI controller first (due to subdev logic).
> +	 * One reliable way to make this work is to deassert reset, configure
> +	 * registers and enable the controller when everything's ready.
> +	 *
> +	 * However, reading the version appears necessary for it to work
> +	 * reliably. Replacing it with a delay doesn't do the trick.
> +	 */
> +	regmap_write(regmap, SUN6I_MIPI_CSI2_CTL_REG,
> +		     SUN6I_MIPI_CSI2_CTL_RESET_N |
> +		     SUN6I_MIPI_CSI2_CTL_VERSION_EN |
> +		     SUN6I_MIPI_CSI2_CTL_UNPK_EN);
> +
> +	regmap_read(regmap, SUN6I_MIPI_CSI2_VERSION_REG, &version);
> +
> +	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
> +				   SUN6I_MIPI_CSI2_CTL_VERSION_EN, 0);
> +
> +	dev_dbg(cdev->dev, "A31 MIPI CSI-2 version: %04x\n", version);

That's really weird. Are you sure it's not due to the fact that the bus
clock would be enabled and not the reset line, or the other way around?

> +	regmap_write(regmap, SUN6I_MIPI_CSI2_CFG_REG,
> +		     SUN6I_MIPI_CSI2_CFG_CHANNEL_MODE(1) |
> +		     SUN6I_MIPI_CSI2_CFG_LANE_COUNT(lanes_count));

It's not really clear what the channel is here? The number of virtual
channels? Something else?

> +	regmap_write(regmap, SUN6I_MIPI_CSI2_VCDT_RX_REG,
> +		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(3, 3) |
> +		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(2, 2) |
> +		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(1, 1) |
> +		     SUN6I_MIPI_CSI2_VCDT_RX_CH_VC(0, 0) |
> +		     SUN6I_MIPI_CSI2_VCDT_RX_CH_DT(0, data_type));
> +
> +	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
> +			   SUN6I_MIPI_CSI2_CTL_EN, SUN6I_MIPI_CSI2_CTL_EN);
> +
> +	ret =3D v4l2_subdev_call(remote_subdev, video, s_stream, 1);
> +	if (ret)
> +		goto disable;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops sun6i_mipi_csi2_subdev_video_o=
ps =3D {
> +	.s_stream	=3D sun6i_mipi_csi2_s_stream,
> +};
> +
> +/* Pad */
> +
> +static int sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
> +					  struct v4l2_subdev_pad_config *config,
> +					  struct v4l2_subdev_mbus_code_enum *code_enum)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +
> +	if (!video->remote_subdev)
> +		return -ENODEV;
> +
> +	/* Forward to the sensor. */
> +	code_enum->pad =3D video->remote_pad_index;
> +
> +	return v4l2_subdev_call(video->remote_subdev, pad, enum_mbus_code,
> +				config, code_enum);
> +}
> +
> +static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> +				   struct v4l2_subdev_pad_config *config,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +
> +	if (!video->remote_subdev)
> +		return -ENODEV;
> +
> +	/* Forward to the sensor. */
> +	format->pad =3D video->remote_pad_index;
> +
> +	return v4l2_subdev_call(video->remote_subdev, pad, get_fmt, config,
> +				format);
> +}
> +
> +static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> +				   struct v4l2_subdev_pad_config *config,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +
> +	if (!video->remote_subdev)
> +		return -ENODEV;
> +
> +	/* Forward to the sensor. */
> +	format->pad =3D video->remote_pad_index;
> +
> +	return v4l2_subdev_call(video->remote_subdev, pad, set_fmt, config,
> +				format);
> +}
> +
> +static int sun6i_mipi_csi2_enum_frame_size(struct v4l2_subdev *subdev,
> +					   struct v4l2_subdev_pad_config *config,
> +					   struct v4l2_subdev_frame_size_enum *size_enum)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +
> +	if (!video->remote_subdev)
> +		return -ENODEV;
> +
> +	/* Forward to the sensor. */
> +	size_enum->pad =3D video->remote_pad_index;
> +
> +	return v4l2_subdev_call(video->remote_subdev, pad, enum_frame_size,
> +				config, size_enum);
> +}
> +
> +static int sun6i_mipi_csi2_enum_frame_interval(struct v4l2_subdev *subde=
v,
> +					       struct v4l2_subdev_pad_config *config,
> +					       struct v4l2_subdev_frame_interval_enum *interval_enum)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +
> +	if (!video->remote_subdev)
> +		return -ENODEV;
> +
> +	/* Forward to the sensor. */
> +	interval_enum->pad =3D video->remote_pad_index;
> +
> +	return v4l2_subdev_call(video->remote_subdev, pad, enum_frame_interval,
> +				config, interval_enum);
> +}

You shouldn't forward those calls here, the MC framework is here to
allow to query each component. Just return what ever that bridge
supports.

> +static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_subdev_pad_ops =
=3D {
> +	.enum_mbus_code		=3D sun6i_mipi_csi2_enum_mbus_code,
> +	.get_fmt		=3D sun6i_mipi_csi2_get_fmt,
> +	.set_fmt		=3D sun6i_mipi_csi2_set_fmt,
> +	.enum_frame_size	=3D sun6i_mipi_csi2_enum_frame_size,
> +	.enum_frame_interval	=3D sun6i_mipi_csi2_enum_frame_interval,
> +};
> +
> +/* Subdev */
> +
> +static const struct v4l2_subdev_ops sun6i_mipi_csi2_subdev_ops =3D {
> +	.core		=3D &sun6i_mipi_csi2_subdev_core_ops,
> +	.video		=3D &sun6i_mipi_csi2_subdev_video_ops,
> +	.pad		=3D &sun6i_mipi_csi2_subdev_pad_ops,
> +};
> +
> +/* Notifier */
> +
> +static int sun6i_mipi_csi2_notifier_bound(struct v4l2_async_notifier *no=
tifier,
> +					  struct v4l2_subdev *remote_subdev,
> +					  struct v4l2_async_subdev *remote_subdev_async)
> +{
> +	struct v4l2_subdev *subdev =3D notifier->sd;
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct sun6i_mipi_csi2_dev *cdev =3D sun6i_mipi_csi2_video_dev(video);
> +	int source_pad;
> +	int ret;
> +
> +	source_pad =3D media_entity_get_fwnode_pad(&remote_subdev->entity,
> +						 remote_subdev->fwnode,
> +						 MEDIA_PAD_FL_SOURCE);
> +	if (source_pad < 0)
> +		return source_pad;
> +
> +	ret =3D media_create_pad_link(&remote_subdev->entity, source_pad,
> +				    &subdev->entity, 0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to create %s:%u -> %s:%u link\n",
> +			remote_subdev->entity.name, source_pad,
> +			subdev->entity.name, 0);
> +		return ret;
> +	}
> +
> +	video->remote_subdev =3D remote_subdev;
> +	video->remote_pad_index =3D source_pad;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations sun6i_mipi_csi2_notif=
ier_ops =3D {
> +	.bound		=3D sun6i_mipi_csi2_notifier_bound,
> +};
> +
> +/* Media Entity */
> +
> +static int sun6i_mipi_csi2_link_validate(struct media_link *link)
> +{
> +	struct v4l2_subdev *subdev =3D
> +		container_of(link->sink->entity, struct v4l2_subdev, entity);
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct v4l2_subdev *remote_subdev;
> +	struct v4l2_subdev_format format =3D { 0 };
> +	int ret;
> +
> +	if (!is_media_entity_v4l2_subdev(link->source->entity))
> +		return -EINVAL;
> +
> +	remote_subdev =3D media_entity_to_v4l2_subdev(link->source->entity);
> +
> +	format.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> +	format.pad =3D link->source->index;
> +
> +	ret =3D v4l2_subdev_call(remote_subdev, pad, get_fmt, NULL, &format);
> +	if (ret)
> +		return ret;
> +
> +	video->mbus_code =3D format.format.code;
> +
> +	return 0;
> +}

I'm not really sure what you're trying to validate here?

> +static const struct media_entity_operations sun6i_mipi_csi2_entity_ops =
=3D {
> +	.link_validate	=3D sun6i_mipi_csi2_link_validate,
> +};
> +
> +/* Base Driver */
> +
> +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> +	struct v4l2_subdev *subdev =3D &video->subdev;
> +	struct v4l2_async_notifier *notifier =3D &video->notifier;
> +	struct fwnode_handle *handle;
> +	struct v4l2_fwnode_endpoint *endpoint;
> +	int ret;
> +
> +	/* Subdev */
> +
> +	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> +	subdev->dev =3D cdev->dev;
> +	strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> +	v4l2_set_subdevdata(subdev, cdev);
> +
> +	/* Entity */
> +
> +	subdev->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	subdev->entity.ops =3D &sun6i_mipi_csi2_entity_ops;
> +
> +	/* Pads */
> +
> +	video->pads[0].flags =3D MEDIA_PAD_FL_SINK;
> +	video->pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +	ret =3D media_entity_pads_init(&subdev->entity, 2, video->pads);
> +	if (ret)
> +		return ret;
> +
> +	/* Endpoint */
> +
> +	handle =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, 0,
> +						 FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!handle)
> +		goto error_media_entity;
> +
> +	endpoint =3D &video->endpoint;
> +	endpoint->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> +
> +	ret =3D v4l2_fwnode_endpoint_parse(handle, endpoint);
> +	fwnode_handle_put(handle);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	/* Notifier */
> +
> +	v4l2_async_notifier_init(notifier);
> +
> +	ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> +							   &video->subdev_async);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	video->notifier.ops =3D &sun6i_mipi_csi2_notifier_ops;
> +
> +	ret =3D v4l2_async_subdev_notifier_register(subdev, notifier);
> +	if (ret < 0)
> +		goto error_notifier;
> +
> +	/* Subdev */
> +
> +	ret =3D v4l2_async_register_subdev(subdev);
> +	if (ret < 0)
> +		goto error_notifier_registered;
> +
> +	return 0;
> +
> +error_notifier_registered:
> +	v4l2_async_notifier_unregister(notifier);
> +error_notifier:
> +	v4l2_async_notifier_cleanup(notifier);
> +error_media_entity:
> +	media_entity_cleanup(&subdev->entity);
> +
> +	return ret;
> +}
> +
> +static int sun6i_mipi_csi2_v4l2_teardown(struct sun6i_mipi_csi2_dev *cde=
v)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> +	struct v4l2_subdev *subdev =3D &video->subdev;
> +	struct v4l2_async_notifier *notifier =3D &video->notifier;
> +
> +	v4l2_async_unregister_subdev(subdev);
> +	v4l2_async_notifier_unregister(notifier);
> +	v4l2_async_notifier_cleanup(notifier);
> +	media_entity_cleanup(&subdev->entity);
> +	v4l2_device_unregister_subdev(subdev);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config sun6i_mipi_csi2_regmap_config =3D {
> +	.reg_bits       =3D 32,
> +	.reg_stride     =3D 4,
> +	.val_bits       =3D 32,
> +	.max_register	=3D 0x400,
> +};
> +
> +static int sun6i_mipi_csi2_resource_request(struct sun6i_mipi_csi2_dev *=
cdev,
> +					    struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *io_base;
> +	int irq;
> +	int ret;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	io_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(io_base))
> +		return PTR_ERR(io_base);
> +
> +	cdev->regmap =3D devm_regmap_init_mmio_clk(&pdev->dev, "bus", io_base,
> +						 &sun6i_mipi_csi2_regmap_config);
> +	if (IS_ERR(cdev->regmap)) {
> +		dev_err(&pdev->dev, "failed to init register map\n");
> +		return PTR_ERR(cdev->regmap);
> +	}

Yeah, so that won't work. regmap expects to have access to those
registers when you enable that clock, but that won't happen since the
reset line can be disabled. You would be better off using runtime_pm
here.

> +
> +	cdev->clk_mod =3D devm_clk_get(&pdev->dev, "mod");
> +	if (IS_ERR(cdev->clk_mod)) {
> +		dev_err(&pdev->dev, "failed to acquire csi clock\n");
> +		return PTR_ERR(cdev->clk_mod);
> +	}
> +
> +	cdev->reset =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(cdev->reset)) {
> +		dev_err(&pdev->dev, "failed to get reset controller\n");
> +		return PTR_ERR(cdev->reset);
> +	}

What does it need to be shared with?

> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return -ENXIO;
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, sun6i_mipi_csi2_isr, 0,
> +			       MODULE_NAME, cdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request MIPI CSI-2 IRQ\n");
> +		return ret;
> +	}
> +
> +	cdev->dphy =3D devm_phy_get(&pdev->dev, "dphy");
> +	if (IS_ERR(cdev->dphy)) {
> +		dev_err(&pdev->dev, "failed to get the MIPI D-PHY\n");
> +		return PTR_ERR(cdev->dphy);
> +	}
> +
> +	ret =3D phy_init(cdev->dphy);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to initialize the MIPI D-PHY\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev;
> +	int ret;
> +
> +	cdev =3D devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->dev =3D &pdev->dev;
> +
> +	ret =3D sun6i_mipi_csi2_resource_request(cdev, pdev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, cdev);
> +
> +	ret =3D sun6i_mipi_csi2_v4l2_setup(cdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_remove(struct platform_device *pdev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev =3D platform_get_drvdata(pdev);
> +
> +	phy_exit(cdev->dphy);
> +
> +	return sun6i_mipi_csi2_v4l2_teardown(cdev);
> +}
> +
> +static const struct of_device_id sun6i_mipi_csi2_of_match[] =3D {
> +	{ .compatible =3D "allwinner,sun6i-a31-mipi-csi2" },
> +	{ .compatible =3D "allwinner,sun8i-v3s-mipi-csi2", },

If you have a fallback on the a31 compatible, you don't need the v3s one

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sun6i_mipi_csi2_of_match);
> +
> +static struct platform_driver sun6i_mipi_csi2_platform_driver =3D {
> +	.probe =3D sun6i_mipi_csi2_probe,
> +	.remove =3D sun6i_mipi_csi2_remove,
> +	.driver =3D {
> +		.name =3D MODULE_NAME,
> +		.of_match_table =3D of_match_ptr(sun6i_mipi_csi2_of_match),
> +	},
> +};
> +module_platform_driver(sun6i_mipi_csi2_platform_driver);
> +
> +MODULE_DESCRIPTION("Allwinner A31 MIPI CSI-2 Controller Driver");
> +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");

I guess Kevin should be there too?

Maxime

--4cfq3ujht5frxucc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5b/LwAKCRDj7w1vZxhR
xcKYAQCmBi2Z/ElUAeNviaV2V6DWPXh3YirB6fBQmZjLxycAMAD/bmD/19smDzNt
Up7XG83rGHqjNpOkjmw7AQi/RBSVXg4=
=cGYS
-----END PGP SIGNATURE-----

--4cfq3ujht5frxucc--
