Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59A52CA298
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbgLAMVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:21:31 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46095 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726390AbgLAMVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:21:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1F8A958055B;
        Tue,  1 Dec 2020 07:20:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 01 Dec 2020 07:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=xMkazwppNpf+eo0G/7VDvsioA8Q
        u7LbmHSrB0Ky+Nh0=; b=ZNjBTI0JlwNXNJSrjsoF6MBLLZHcGNOPyw2HICXOMCr
        xayhPvijI+A6JcFOYiKywoR0qq4KSzL8ieEuO7WTh2b1j+/zpcTn8P7vqkE5ymEP
        pOvhPbCh1CLW2cjDWiUu/6922LXh8ZqqW2XmLoGzlwtp5IGMz7Qvqez54HNxqkAz
        YTIM27emdEgr9uUsT6mUovoLyU3uPdUcNYBtmuR5NH1P1Vx+pifdAkcZ3MWwwUvs
        o0yzMP4JS4lZuzTywd890iOGOwKab/RlITEsNvOnUQjJD0TRCnA6NDbhXXm/j+qZ
        Lpd9y+RGTw9A/cOaWx1gZbxRt56h2e4h9NPwsNw8mWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xMkazw
        ppNpf+eo0G/7VDvsioA8Qu7LbmHSrB0Ky+Nh0=; b=SspGVdhIju34NC+EFHZjQX
        0nSrV8AYfplUxQeqaADnQ4vpgdIc7rG7jOFyajYv6EAlZBk3cVwfnwLnd1R9j0db
        rLSHFgAyyejbGeCafhA33X59zbm3ncebLXiNP8/ktLZqmmJ3AeOyF0vYqgTdeLno
        YlJBUnI177gQ1Q1sordcMuM8NMXJRFl0+ExkQhNSjgKooHT4Om0ULtxMkVEl89kK
        9T0lbre6xUWR9lEkmtr3vUAxvdP+eDTAGrCpHfJdzZ6EauIkQ7554EhLcZwTS76A
        yHgTq5h3hjl3ARj4pEu4GMljF+xdpcFUYviym91ayngSLffTNZaUrRrdJuIZbgZQ
        ==
X-ME-Sender: <xms:GDXGX5bb2M-KrVnupHgZKA0IfAOIPLJme9ZWh37-Ic7zK9TbodoMPA>
    <xme:GDXGX3KTqVnKogJEzHca6fBc3KIagDPvM5qG64Vgz7HWSPqeurBCyybEpy2NJjnR3
    vZ9EObfzBlpGfW48LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeivddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GDXGX9sTeIPOD9hFnuA8Y1jsqrqwserCFznWyuyAyKlmQpb8gWf0RA>
    <xmx:GDXGXzUL-ZpdJGHETUVBZsX2LCLVZHGbhMSVVIWhLLMfaHUuVP-hOg>
    <xmx:GDXGXwgZhBRHWXQyACAeW0xwfHQrNHFCJMbXAJgmSmp-INiCoqA2LA>
    <xmx:GzXGX6Lvyb__WEZYPwaHxdVd9M4J23z2tz98T2uD2kQMQI9QNjh2bw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id F03CE1080067;
        Tue,  1 Dec 2020 07:20:39 -0500 (EST)
Date:   Tue, 1 Dec 2020 13:20:38 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
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
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v2 13/19] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <20201201122038.bxk3vu2w3mg43ayq@gilmour>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-14-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xyg3j2piqrsy5z5r"
Content-Disposition: inline
In-Reply-To: <20201128142839.517949-14-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xyg3j2piqrsy5z5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 28, 2020 at 03:28:33PM +0100, Paul Kocialkowski wrote:
> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> found on Allwinner SoCs such as the A31 and V3/V3s.
>=20
> It is a standalone block, connected to the CSI controller on one side
> and to the MIPI D-PHY block on the other. It has a dedicated address
> space, interrupt line and clock.
>=20
> It is represented as a V4L2 subdev to the CSI controller and takes a
> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> media controller API.
>=20
> Only 8-bit and 10-bit Bayer formats are currently supported.
> While up to 4 internal channels to the CSI controller exist, only one
> is currently supported by this implementation.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/Kconfig          |   1 +
>  drivers/media/platform/sunxi/Makefile         |   1 +
>  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
>  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 591 ++++++++++++++++++
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 ++++
>  6 files changed, 726 insertions(+)
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

I'm not sure we need a new folder here, it's only ever tied to sun6i-csi
so it would make more sense to have it in the same folder.

>  obj-y		+=3D sun8i-di/
>  obj-y		+=3D sun8i-rotate/
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/drive=
rs/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> new file mode 100644
> index 000000000000..3260591ed5c0
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_SUN6I_MIPI_CSI2
> +	tristate "Allwinner A31 MIPI CSI-2 Controller Driver"
> +	depends on VIDEO_V4L2 && COMMON_CLK
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	select PHY_SUN6I_MIPI_DPHY
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
> index 000000000000..a6567ef82fb4
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -0,0 +1,591 @@
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
> +#include <linux/pm_runtime.h>
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
> +static const u32 sun6i_mipi_csi2_mbus_codes[] =3D {
> +	MEDIA_BUS_FMT_SBGGR8_1X8,
> +	MEDIA_BUS_FMT_SGBRG8_1X8,
> +	MEDIA_BUS_FMT_SGRBG8_1X8,
> +	MEDIA_BUS_FMT_SRGGB8_1X8,
> +	MEDIA_BUS_FMT_SBGGR10_1X10,
> +	MEDIA_BUS_FMT_SGBRG10_1X10,
> +	MEDIA_BUS_FMT_SGRBG10_1X10,
> +	MEDIA_BUS_FMT_SRGGB10_1X10,
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
> +		goto disable;
> +	}
> +
> +	switch (video->mbus_format.code) {
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
> +	/* Power management */
> +
> +	ret =3D pm_runtime_get_sync(cdev->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(cdev->dev);
> +		return ret;
> +	}
> +
> +	/* D-PHY configuration */
> +
> +	lanes_count =3D bus_mipi_csi2->num_data_lanes;
> +	phy_mipi_dphy_get_default_config(pixel_rate, bpp, lanes_count,
> +					 dphy_cfg);
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
> +	ret =3D phy_reset(cdev->dphy);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to reset MIPI D-PHY\n");
> +		goto error_pm;
> +	}
> +
> +	ret =3D phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> +			       PHY_MIPI_DPHY_SUBMODE_RX);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to set MIPI D-PHY mode\n");
> +		goto error_pm;
> +	}
> +
> +	ret =3D phy_configure(cdev->dphy, &dphy_opts);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to configure MIPI D-PHY\n");
> +		goto error_pm;
> +	}
> +
> +	ret =3D phy_power_on(cdev->dphy);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to power on MIPI D-PHY\n");
> +		goto error_pm;
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
> +	 * However, setting the version enable bit and removing it afterwards
> +	 * appears necessary for capture to work reliably, while replacing it
> +	 * with a delay doesn't do the trick.
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
> +
> +	regmap_write(regmap, SUN6I_MIPI_CSI2_CFG_REG,
> +		     SUN6I_MIPI_CSI2_CFG_CHANNEL_MODE(1) |
> +		     SUN6I_MIPI_CSI2_CFG_LANE_COUNT(lanes_count));
> +
> +	/*
> +	 * Our MIPI CSI-2 controller has internal channels that can be
> +	 * configured to match a specific MIPI CSI-2 virtual channel and/or
> +	 * a specific data type. Each internal channel can be piped to an
> +	 * internal channel of the CSI controller.
> +	 *
> +	 * We set virtual channel numbers to all channels to make sure that
> +	 * virtual channel 0 goes to CSI channel 0 only.
> +	 */
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
> +
> +disable:
> +	regmap_update_bits(regmap, SUN6I_MIPI_CSI2_CTL_REG,
> +			   SUN6I_MIPI_CSI2_CTL_EN, 0);
> +
> +	phy_power_off(cdev->dphy);
> +
> +error_pm:
> +	pm_runtime_put(cdev->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops sun6i_mipi_csi2_subdev_video_o=
ps =3D {
> +	.s_stream	=3D sun6i_mipi_csi2_s_stream,
> +};
> +
> +/* Pad */
> +
> +static int
> +sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
> +			       struct v4l2_subdev_pad_config *config,
> +			       struct v4l2_subdev_mbus_code_enum *code_enum)
> +{
> +	if (code_enum->index >=3D ARRAY_SIZE(sun6i_mipi_csi2_mbus_codes))
> +		return -EINVAL;
> +
> +	code_enum->code =3D sun6i_mipi_csi2_mbus_codes[code_enum->index];
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> +				   struct v4l2_subdev_pad_config *config,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		*mbus_format =3D *v4l2_subdev_get_try_format(subdev, config,
> +							   format->pad);
> +	else
> +		*mbus_format =3D video->mbus_format;
> +
> +	return 0;
> +}
> +
> +static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> +				   struct v4l2_subdev_pad_config *config,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D
> +		sun6i_mipi_csi2_subdev_video(subdev);
> +	struct v4l2_mbus_framefmt *mbus_format =3D &format->format;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_get_try_format(subdev, config, format->pad) =3D
> +			*mbus_format;
> +	else
> +		video->mbus_format =3D *mbus_format;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_subdev_pad_ops =
=3D {
> +	.enum_mbus_code	=3D sun6i_mipi_csi2_enum_mbus_code,
> +	.get_fmt	=3D sun6i_mipi_csi2_get_fmt,
> +	.set_fmt	=3D sun6i_mipi_csi2_set_fmt,
> +};
> +
> +/* Subdev */
> +
> +static const struct v4l2_subdev_ops sun6i_mipi_csi2_subdev_ops =3D {
> +	.video		=3D &sun6i_mipi_csi2_subdev_video_ops,
> +	.pad		=3D &sun6i_mipi_csi2_subdev_pad_ops,
> +};
> +
> +/* Notifier */
> +
> +static int
> +sun6i_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
> +			       struct v4l2_subdev *remote_subdev,
> +			       struct v4l2_async_subdev *remote_subdev_async)
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
> +
> +	return 0;
> +}
> +
> +static const
> +struct v4l2_async_notifier_operations sun6i_mipi_csi2_notifier_ops =3D {
> +	.bound		=3D sun6i_mipi_csi2_notifier_bound,
> +};
> +
> +/* Media Entity */
> +
> +static const struct media_entity_operations sun6i_mipi_csi2_entity_ops =
=3D {
> +	.link_validate	=3D v4l2_subdev_link_validate,
> +};
> +
> +/* Base Driver */
> +
> +static int __maybe_unused sun6i_mipi_csi2_suspend(struct device *dev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(cdev->clk_mod);
> +	clk_disable_unprepare(cdev->clk_bus);
> +	reset_control_assert(cdev->reset);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sun6i_mipi_csi2_resume(struct device *dev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(cdev->reset);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to deassert reset\n");
> +		return ret;
> +	}
> +
> +	ret =3D clk_prepare_enable(cdev->clk_bus);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable bus clock\n");
> +		goto error_reset;
> +	}
> +
> +	ret =3D clk_prepare_enable(cdev->clk_mod);
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable module clock\n");
> +		goto error_clk_bus;
> +	}
> +
> +	return 0;
> +
> +error_clk_bus:
> +	clk_disable_unprepare(cdev->clk_bus);
> +
> +error_reset:
> +	reset_control_assert(cdev->reset);
> +
> +	return ret;
> +}

I'm guessing you set the __maybe_unused attribute because you're using
SET_RUNTIME_PM_OPS, but what would happen if runtime_pm isn't selected?
It looks like you don't handle that case.

> +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> +{
> +	struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> +	struct v4l2_subdev *subdev =3D &video->subdev;
> +	struct v4l2_async_notifier *notifier =3D &video->notifier;
> +	struct fwnode_handle *handle;
> +	struct v4l2_fwnode_endpoint *endpoint;
> +	struct v4l2_async_subdev *subdev_async;
> +	int ret;
> +
> +	/* Subdev */
> +
> +	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> +	subdev->dev =3D cdev->dev;
> +	subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
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
> +	if (!handle) {
> +		ret =3D -ENODEV;
> +		goto error_media_entity;
> +	}
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
> +	subdev_async =3D &video->subdev_async;
> +	ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> +							   subdev_async);
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
> +	/* Runtime PM */
> +
> +	pm_runtime_enable(cdev->dev);
> +	pm_runtime_set_suspended(cdev->dev);
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
> +static int sun6i_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	struct sun6i_mipi_csi2_dev *cdev;
> +	struct resource *res;
> +	void __iomem *io_base;
> +	int ret;
> +
> +	cdev =3D devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> +	if (!cdev)
> +		return -ENOMEM;
> +
> +	cdev->dev =3D &pdev->dev;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	io_base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(io_base))
> +		return PTR_ERR(io_base);
> +
> +	cdev->regmap =3D devm_regmap_init_mmio(&pdev->dev, io_base,
> +					     &sun6i_mipi_csi2_regmap_config);
> +	if (IS_ERR(cdev->regmap)) {
> +		dev_err(&pdev->dev, "failed to init register map\n");
> +		return PTR_ERR(cdev->regmap);
> +	}
> +
> +	cdev->clk_bus =3D devm_clk_get(&pdev->dev, "bus");
> +	if (IS_ERR(cdev->clk_bus)) {
> +		dev_err(&pdev->dev, "failed to acquire bus clock\n");
> +		return PTR_ERR(cdev->clk_bus);
> +	}
> +
> +	cdev->clk_mod =3D devm_clk_get(&pdev->dev, "mod");
> +	if (IS_ERR(cdev->clk_mod)) {
> +		dev_err(&pdev->dev, "failed to acquire mod clock\n");
> +		return PTR_ERR(cdev->clk_mod);
> +	}
> +
> +	cdev->reset =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> +	if (IS_ERR(cdev->reset)) {
> +		dev_err(&pdev->dev, "failed to get reset controller\n");
> +		return PTR_ERR(cdev->reset);
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

This seem to be the only user and its content is pretty straightforward,
so we shouldn't have a separate function here

> +}
> +
> +static const struct dev_pm_ops sun6i_mipi_csi2_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(sun6i_mipi_csi2_suspend, sun6i_mipi_csi2_resume,
> +			   NULL)
> +};
> +
> +static const struct of_device_id sun6i_mipi_csi2_of_match[] =3D {
> +	{ .compatible =3D "allwinner,sun6i-a31-mipi-csi2" },
> +	{ .compatible =3D "allwinner,sun8i-v3s-mipi-csi2", },

There's no need for the v3s compatible here, it will fallback to the a31
one anyway.

Maxime

--xyg3j2piqrsy5z5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8Y1FgAKCRDj7w1vZxhR
xbKgAQDhKjer8YZ3QwsRdd411yhbUrsioVOy/ZoAYW4ICDemsgEA58qGq9sgAJB1
P9Hq5R02fk5eRxhVh+JBvYS8zLoHQgA=
=Kixd
-----END PGP SIGNATURE-----

--xyg3j2piqrsy5z5r--
