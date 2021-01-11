Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5522F1C0E
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 18:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389251AbhAKRQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 12:16:37 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:53007 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389057AbhAKRQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 12:16:37 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2A43AE0005;
        Mon, 11 Jan 2021 17:15:48 +0000 (UTC)
Date:   Mon, 11 Jan 2021 18:15:48 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
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
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH v4 09/15] media: sunxi: Add support for the A31 MIPI
 CSI-2 controller
Message-ID: <X/yHxOJFADAS3F8X@aptenodytes>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
 <4ea6a6d0-e2ef-9374-e24b-9d62d5f66e23@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uRaHPLWd4AKyBLC+"
Content-Disposition: inline
In-Reply-To: <4ea6a6d0-e2ef-9374-e24b-9d62d5f66e23@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uRaHPLWd4AKyBLC+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 09 Jan 21, 16:24, Samuel Holland wrote:
> On 12/31/20 8:29 AM, Paul Kocialkowski wrote:
> > The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> > found on Allwinner SoCs such as the A31 and V3/V3s.
> >=20
> > It is a standalone block, connected to the CSI controller on one side
> > and to the MIPI D-PHY block on the other. It has a dedicated address
> > space, interrupt line and clock.
> >=20
> > It is represented as a V4L2 subdev to the CSI controller and takes a
> > MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> > media controller API.
> >=20
> > Only 8-bit and 10-bit Bayer formats are currently supported.
> > While up to 4 internal channels to the CSI controller exist, only one
> > is currently supported by this implementation.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/platform/sunxi/Kconfig          |   1 +
> >  drivers/media/platform/sunxi/Makefile         |   1 +
> >  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
> >  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 590 ++++++++++++++++++
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 ++++
> >  6 files changed, 725 insertions(+)
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefi=
le
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_=
mipi_csi2.c
> >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_=
mipi_csi2.h
> >=20
> > diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platf=
orm/sunxi/Kconfig
> > index 7151cc249afa..9684e07454ad 100644
> > --- a/drivers/media/platform/sunxi/Kconfig
> > +++ b/drivers/media/platform/sunxi/Kconfig
> > @@ -2,3 +2,4 @@
> > =20
> >  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
> >  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> > +source "drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig"
> > diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/plat=
form/sunxi/Makefile
> > index fc537c9f5ca9..887a7cae8fca 100644
> > --- a/drivers/media/platform/sunxi/Makefile
> > +++ b/drivers/media/platform/sunxi/Makefile
> > @@ -2,5 +2,6 @@
> > =20
> >  obj-y		+=3D sun4i-csi/
> >  obj-y		+=3D sun6i-csi/
> > +obj-y		+=3D sun6i-mipi-csi2/
> >  obj-y		+=3D sun8i-di/
> >  obj-y		+=3D sun8i-rotate/
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig b/dri=
vers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > new file mode 100644
> > index 000000000000..47f1bb0779a8
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config VIDEO_SUN6I_MIPI_CSI2
> > +	tristate "Allwinner A31 MIPI CSI-2 Controller Driver"
> > +	depends on ARCH_SUNXI || COMPILE_TEST
> > +	depends on PM && COMMON_CLK && VIDEO_V4L2
> > +	select REGMAP_MMIO
> > +	select PHY_SUN6I_MIPI_DPHY
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> > +	help
> > +	   Support for the Allwinner A31 MIPI CSI-2 Controller.
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile b/dr=
ivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> > new file mode 100644
> > index 000000000000..14e4e03818b5
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +sun6i-mipi-csi2-y +=3D sun6i_mipi_csi2.o
> > +
> > +obj-$(CONFIG_VIDEO_SUN6I_MIPI_CSI2) +=3D sun6i-mipi-csi2.o
> > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_cs=
i2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > new file mode 100644
> > index 000000000000..87307beda4cf
> > --- /dev/null
> > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > @@ -0,0 +1,590 @@
> [...]
> > +/* Base Driver */
> > +
> > +static int sun6i_mipi_csi2_suspend(struct device *dev)
> > +{
> > +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(cdev->clk_mod);
> > +	clk_disable_unprepare(cdev->clk_bus);
> > +	reset_control_assert(cdev->reset);
> > +
> > +	return 0;
> > +}
> > +
> > +static int sun6i_mipi_csi2_resume(struct device *dev)
> > +{
> > +	struct sun6i_mipi_csi2_dev *cdev =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D reset_control_deassert(cdev->reset);
> > +	if (ret) {
> > +		dev_err(cdev->dev, "failed to deassert reset\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(cdev->clk_bus);
> > +	if (ret) {
> > +		dev_err(cdev->dev, "failed to enable bus clock\n");
> > +		goto error_reset;
> > +	}
> > +
> > +	ret =3D clk_prepare_enable(cdev->clk_mod);
> > +	if (ret) {
> > +		dev_err(cdev->dev, "failed to enable module clock\n");
> > +		goto error_clk_bus;
> > +	}
> > +
> > +	return 0;
> > +
> > +error_clk_bus:
> > +	clk_disable_unprepare(cdev->clk_bus);
> > +
> > +error_reset:
> > +	reset_control_assert(cdev->reset);
> > +
> > +	return ret;
> > +}
> > +
> > +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> > +{
> > +	struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> > +	struct v4l2_subdev *subdev =3D &video->subdev;
> > +	struct v4l2_async_notifier *notifier =3D &video->notifier;
> > +	struct fwnode_handle *handle;
> > +	struct v4l2_fwnode_endpoint *endpoint;
> > +	struct v4l2_async_subdev *subdev_async;
> > +	int ret;
> > +
> > +	/* Subdev */
> > +
> > +	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > +	subdev->dev =3D cdev->dev;
> > +	subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> > +	v4l2_set_subdevdata(subdev, cdev);
> > +
> > +	/* Entity */
> > +
> > +	subdev->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	subdev->entity.ops =3D &sun6i_mipi_csi2_entity_ops;
> > +
> > +	/* Pads */
> > +
> > +	video->pads[0].flags =3D MEDIA_PAD_FL_SINK;
> > +	video->pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret =3D media_entity_pads_init(&subdev->entity, 2, video->pads);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Endpoint */
> > +
> > +	handle =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, =
0,
> > +						 FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	if (!handle) {
> > +		ret =3D -ENODEV;
> > +		goto error_media_entity;
> > +	}
> > +
> > +	endpoint =3D &video->endpoint;
> > +	endpoint->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > +
> > +	ret =3D v4l2_fwnode_endpoint_parse(handle, endpoint);
> > +	fwnode_handle_put(handle);
> > +	if (ret)
> > +		goto error_media_entity;
> > +
> > +	/* Notifier */
> > +
> > +	v4l2_async_notifier_init(notifier);
> > +
> > +	subdev_async =3D &video->subdev_async;
> > +	ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> > +							   subdev_async);
> > +	if (ret)
> > +		goto error_media_entity;
> > +
> > +	video->notifier.ops =3D &sun6i_mipi_csi2_notifier_ops;
> > +
> > +	ret =3D v4l2_async_subdev_notifier_register(subdev, notifier);
> > +	if (ret < 0)
> > +		goto error_notifier;
> > +
> > +	/* Subdev */
> > +
> > +	ret =3D v4l2_async_register_subdev(subdev);
> > +	if (ret < 0)
> > +		goto error_notifier_registered;
> > +
> > +	/* Runtime PM */
> > +
> > +	pm_runtime_enable(cdev->dev);
>=20
> I would expect to see this before registering with the class, since
> pm_runtime_get_sync() will fail if called before runtime PM is enabled.

You're right, and I actually made the same mistake on another driver too.
Will fix!

> > +	pm_runtime_set_suspended(cdev->dev);
>=20
> This is already the default.

Yeah, I just wanted to make this explicit for someone reading the driver
who's not so familiar with rpm internals. I guess it doesn't hurt.

> > +
> > +	return 0;
> > +
> > +error_notifier_registered:
> > +	v4l2_async_notifier_unregister(notifier);
> > +error_notifier:
> > +	v4l2_async_notifier_cleanup(notifier);
> > +error_media_entity:
> > +	media_entity_cleanup(&subdev->entity);
> > +
> > +	return ret;
> > +}
> > +
> > +static int sun6i_mipi_csi2_v4l2_teardown(struct sun6i_mipi_csi2_dev *c=
dev)
> > +{
> > +	struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> > +	struct v4l2_subdev *subdev =3D &video->subdev;
> > +	struct v4l2_async_notifier *notifier =3D &video->notifier;
> > +
> > +	v4l2_async_unregister_subdev(subdev);
> > +	v4l2_async_notifier_unregister(notifier);
> > +	v4l2_async_notifier_cleanup(notifier);
> > +	media_entity_cleanup(&subdev->entity);
> > +	v4l2_device_unregister_subdev(subdev);
> > +
>=20
> I would expect to see pm_runtime_suspend()/pm_runtime_disable() called
> here, so you do not leak clock prepare/enable references.

Sure, I also forgot that.

Thanks a lot for the review!

Cheers,

Paul

> Cheers,
> Samuel
>=20
> > +	return 0;
> > +}
> > +
> > +static const struct regmap_config sun6i_mipi_csi2_regmap_config =3D {
> > +	.reg_bits       =3D 32,
> > +	.reg_stride     =3D 4,
> > +	.val_bits       =3D 32,
> > +	.max_register	=3D 0x400,
> > +};
> > +
> > +static int sun6i_mipi_csi2_probe(struct platform_device *pdev)
> > +{
> > +	struct sun6i_mipi_csi2_dev *cdev;
> > +	struct resource *res;
> > +	void __iomem *io_base;
> > +	int ret;
> > +
> > +	cdev =3D devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
> > +	if (!cdev)
> > +		return -ENOMEM;
> > +
> > +	cdev->dev =3D &pdev->dev;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	io_base =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(io_base))
> > +		return PTR_ERR(io_base);
> > +
> > +	cdev->regmap =3D devm_regmap_init_mmio(&pdev->dev, io_base,
> > +					     &sun6i_mipi_csi2_regmap_config);
> > +	if (IS_ERR(cdev->regmap)) {
> > +		dev_err(&pdev->dev, "failed to init register map\n");
> > +		return PTR_ERR(cdev->regmap);
> > +	}
> > +
> > +	cdev->clk_bus =3D devm_clk_get(&pdev->dev, "bus");
> > +	if (IS_ERR(cdev->clk_bus)) {
> > +		dev_err(&pdev->dev, "failed to acquire bus clock\n");
> > +		return PTR_ERR(cdev->clk_bus);
> > +	}
> > +
> > +	cdev->clk_mod =3D devm_clk_get(&pdev->dev, "mod");
> > +	if (IS_ERR(cdev->clk_mod)) {
> > +		dev_err(&pdev->dev, "failed to acquire mod clock\n");
> > +		return PTR_ERR(cdev->clk_mod);
> > +	}
> > +
> > +	cdev->reset =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> > +	if (IS_ERR(cdev->reset)) {
> > +		dev_err(&pdev->dev, "failed to get reset controller\n");
> > +		return PTR_ERR(cdev->reset);
> > +	}
> > +
> > +	cdev->dphy =3D devm_phy_get(&pdev->dev, NULL);
> > +	if (IS_ERR(cdev->dphy)) {
> > +		dev_err(&pdev->dev, "failed to get the MIPI D-PHY\n");
> > +		return PTR_ERR(cdev->dphy);
> > +	}
> > +
> > +	ret =3D phy_init(cdev->dphy);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "failed to initialize the MIPI D-PHY\n");
> > +		return ret;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, cdev);
> > +
> > +	ret =3D sun6i_mipi_csi2_v4l2_setup(cdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int sun6i_mipi_csi2_remove(struct platform_device *pdev)
> > +{
> > +	struct sun6i_mipi_csi2_dev *cdev =3D platform_get_drvdata(pdev);
> > +
> > +	phy_exit(cdev->dphy);
> > +
> > +	return sun6i_mipi_csi2_v4l2_teardown(cdev);
> > +}
> > +
> > +static const struct dev_pm_ops sun6i_mipi_csi2_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(sun6i_mipi_csi2_suspend, sun6i_mipi_csi2_resume,
> > +			   NULL)
> > +};
> > +
> > +static const struct of_device_id sun6i_mipi_csi2_of_match[] =3D {
> > +	{ .compatible =3D "allwinner,sun6i-a31-mipi-csi2" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, sun6i_mipi_csi2_of_match);
> > +
> > +static struct platform_driver sun6i_mipi_csi2_platform_driver =3D {
> > +	.probe =3D sun6i_mipi_csi2_probe,
> > +	.remove =3D sun6i_mipi_csi2_remove,
> > +	.driver =3D {
> > +		.name =3D MODULE_NAME,
> > +		.of_match_table =3D of_match_ptr(sun6i_mipi_csi2_of_match),
> > +		.pm =3D &sun6i_mipi_csi2_pm_ops,
> > +	},
> > +};
> > +module_platform_driver(sun6i_mipi_csi2_platform_driver);
> > +
> > +MODULE_DESCRIPTION("Allwinner A31 MIPI CSI-2 Controller Driver");
> > +MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
> > +MODULE_LICENSE("GPL");
> [...]

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--uRaHPLWd4AKyBLC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/8h8QACgkQ3cLmz3+f
v9Hffgf+I/r9S7NGgwB3/XcwhR4JmrqQPY8fjJJeCjT+3r9q62oUS/DLgak7W0h2
fQsWRgsmhVyQe/m5DMQdhtj0T/JhrbJF9ZlNfJ+iElb9ac4rrrEeubQZnxk7Vpc5
sgbiw4fc/jl1tHMrmfhO1OlU2X3OHZ/PWlz21XKlzo8LA8BvA0hLVePwMx5QD1lR
5C0Lu/JkB1iVEbtNDnTfQqxiOwmBUObV7fyWxPaKi+QtAOCRxSTT2jdcCYeLs4My
wZsgQBp2/K12hFFiB0IVUP/sthALip8buy37shnkp/sG/MU8Sc2s8X7FfheD4wrK
Iz6f1Fk6R0PI9UadF6cwgih5IGKlAg==
=KrSi
-----END PGP SIGNATURE-----

--uRaHPLWd4AKyBLC+--
