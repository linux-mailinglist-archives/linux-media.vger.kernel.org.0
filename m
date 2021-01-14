Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1802F5D98
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 10:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbhANJax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 04:30:53 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:52081 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbhANJaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 04:30:52 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C14D51BF21E;
        Thu, 14 Jan 2021 09:30:02 +0000 (UTC)
Date:   Thu, 14 Jan 2021 10:30:01 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
Subject: Re: [linux-sunxi] [PATCH v4 09/15] media: sunxi: Add support for the
 A31 MIPI CSI-2 controller
Message-ID: <YAAPGZCK/TffZChD@aptenodytes>
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com>
 <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
 <CAAEAJfAJYCE2z662hPderJ-5Qv3WBA8K5ZQaZ1JuZbZN+KfFig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EJgpfe+RWrId2mN0"
Content-Disposition: inline
In-Reply-To: <CAAEAJfAJYCE2z662hPderJ-5Qv3WBA8K5ZQaZ1JuZbZN+KfFig@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--EJgpfe+RWrId2mN0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ezequiel,

On Mon 11 Jan 21, 15:21, Ezequiel Garcia wrote:
> Salut Paul,
>=20
> Just a minor comment about the v4l2 async API.
>
> On Thu, 31 Dec 2020 at 11:30, Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> > found on Allwinner SoCs such as the A31 and V3/V3s.
> >
> > It is a standalone block, connected to the CSI controller on one side
> > and to the MIPI D-PHY block on the other. It has a dedicated address
> > space, interrupt line and clock.
> >
> > It is represented as a V4L2 subdev to the CSI controller and takes a
> > MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> > media controller API.
> >
> > Only 8-bit and 10-bit Bayer formats are currently supported.
> > While up to 4 internal channels to the CSI controller exist, only one
> > is currently supported by this implementation.
> >
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
> >
> [..]
> > +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> > +{
> > +       struct sun6i_mipi_csi2_video *video =3D &cdev->video;
> > +       struct v4l2_subdev *subdev =3D &video->subdev;
> > +       struct v4l2_async_notifier *notifier =3D &video->notifier;
> > +       struct fwnode_handle *handle;
> > +       struct v4l2_fwnode_endpoint *endpoint;
> > +       struct v4l2_async_subdev *subdev_async;
> > +       int ret;
> > +
> > +       /* Subdev */
> > +
> > +       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > +       subdev->dev =3D cdev->dev;
> > +       subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> > +       v4l2_set_subdevdata(subdev, cdev);
> > +
> > +       /* Entity */
> > +
> > +       subdev->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +       subdev->entity.ops =3D &sun6i_mipi_csi2_entity_ops;
> > +
> > +       /* Pads */
> > +
> > +       video->pads[0].flags =3D MEDIA_PAD_FL_SINK;
> > +       video->pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +       ret =3D media_entity_pads_init(&subdev->entity, 2, video->pads);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Endpoint */
> > +
> > +       handle =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev=
), 0, 0,
> > +                                                FWNODE_GRAPH_ENDPOINT_=
NEXT);
> > +       if (!handle) {
> > +               ret =3D -ENODEV;
> > +               goto error_media_entity;
> > +       }
> > +
> > +       endpoint =3D &video->endpoint;
> > +       endpoint->bus_type =3D V4L2_MBUS_CSI2_DPHY;
> > +
> > +       ret =3D v4l2_fwnode_endpoint_parse(handle, endpoint);
> > +       fwnode_handle_put(handle);
>=20
> I think the _put should be...
>=20
> > +       if (ret)
> > +               goto error_media_entity;
> > +
> > +       /* Notifier */
> > +
> > +       v4l2_async_notifier_init(notifier);
> > +
> > +       subdev_async =3D &video->subdev_async;
> > +       ret =3D v4l2_async_notifier_add_fwnode_remote_subdev(notifier, =
handle,
> > +                                                          subdev_async=
);
>=20
> ... here. See for instance drivers/media/platform/rcar-vin/rcar-csi2.c.
>=20
> (Unless I've missed something, of course).

I think you're right, the reference is obtained at
fwnode_graph_get_endpoint_by_id and should be held when passing handle to
v4l2_async_notifier_add_fwnode_remote_subdev since it will be used to get
a reference to the remote port.

Good catch and thanks for the review!

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--EJgpfe+RWrId2mN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAADxkACgkQ3cLmz3+f
v9Hytwf/W+8A0xNMOTt+EHzq4AdwRMqFrAR8IlpIUjYo23z3pYtavAnDPlARRdLr
EQLRhocXT3344ZS75RV4GDtGs7V2ORUemf98h/WJAQDLMHPYZY0WH+JW8hpI37jJ
przgS0Mte1QrzPEb54o0tOrmomnNrTEg0J4umgGE1HOlzMX48Lij7OV/IYM16ACw
WOsLkeQnCDolkBW4gZoNN2NGZoVfPpEoMYr1ocA5AXijJ8YkHt9nzc46uBMjglov
ko7MWEU0TYvBqoMNWFdSmj0gpRHmgUaLuXs5+r4rg3tdLxF4I2NmNRJZJrnQHMMm
XK9zTMtYtNNs+IfS55Cp8qyb4S4MbA==
=AC7a
-----END PGP SIGNATURE-----

--EJgpfe+RWrId2mN0--
