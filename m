Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5792A6313
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgKDLOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:14:55 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:48975 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgKDLOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:14:55 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C124724000D;
        Wed,  4 Nov 2020 11:14:46 +0000 (UTC)
Date:   Wed, 4 Nov 2020 12:14:46 +0100
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
Subject: Re: [PATCH 00/14] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Message-ID: <20201104111446.GA287014@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <d15d724b-6af7-3e51-1316-7bdde5a42c60@collabora.com>
 <20201104111137.GH285779@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20201104111137.GH285779@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Wed 04 Nov 20, 12:11, Paul Kocialkowski wrote:
> Hi Helen,
>=20
> On Fri 30 Oct 20, 19:44, Helen Koike wrote:
> > Hi Paul,
> >=20
> > I have some comments through the series, I hope this helps.
>=20
> Thanks for your comments :)
>=20
> > On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
> > > This series introduces support for MIPI CSI-2, with the A31 controlle=
r that is
> > > found on most SoCs (A31, V3s and probably V5) as well as the A83T-spe=
cific
> > > controller. While the former uses the same MIPI D-PHY that is already=
 supported
> > > for DSI, the latter embeds its own D-PHY.
> > >=20
> > > In order to distinguish the use of the D-PHY between Rx mode (for MIP=
I CSI-2)
> > > and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the =
PHY API.
> > > This allows adding Rx support in the A31 D-PHY driver.
> > >=20
> > > A few changes and fixes are applied to the A31 CSI controller driver,=
 in order
> > > to support the MIPI CSI-2 use-case.
> > >=20
> > > Follows is the V4L2 device topology representing the interactions bet=
ween
> > > the MIPI CSI-2 sensor, the MIPI CSI-2 controller (which controls the =
D-PHY)
> > > and the CSI controller:
> > > - entity 1: sun6i-csi (1 pad, 1 link)
> > >             type Node subtype V4L flags 0
> > >             device node name /dev/video0
> > > 	pad0: Sink
> > > 		<- "sun6i-mipi-csi2":1 [ENABLED,IMMUTABLE]
> > >=20
> > > - entity 5: sun6i-mipi-csi2 (2 pads, 2 links)
> > >             type V4L2 subdev subtype Unknown flags 0
> > > 	pad0: Sink
> > > 		<- "ov5648 0-0036":0 [ENABLED,IMMUTABLE]
> > > 	pad1: Source
> > > 		-> "sun6i-csi":0 [ENABLED,IMMUTABLE]
> > >=20
> > > - entity 8: ov5648 0-0036 (1 pad, 1 link)
> > >             type V4L2 subdev subtype Sensor flags 0
> > >             device node name /dev/v4l-subdev0
> >=20
> > Question: I noticed is that sun6i-mipi-csi2 doesn't expose a node under=
 /dev/, but the sensor
> > exposes it. Probably because it uses V4L2_SUBDEV_FL_HAS_DEVNODE and sun=
6i-csi() calls
> > v4l2_device_register_subdev_nodes().
> >=20
> > I find this weird from a userspace pov, since usually we don't mix manu=
al and auto propagation
> > of the configs, so I started wondering if sun6i-csi driver should be ca=
lling
> > v4l2_device_register_subdev_nodes() in the first place.
>=20
> I must admit that I didn't really pay attention to that, but since
> sun6i-mipi-csi2 is basically a bridge driver, it doesn't make sense to ap=
ply
> manual configuration to it. It is actually designed to forward most subde=
v ops
> to its own subdev so configuring it manually would actually result in
> configuring the sensor.
>=20
> XXX

Hum, I meant to add something here and then forgot. I'm pretty new to auto =
vs
manual propagation so I don't really have a clear opinion on this and wheth=
er
we should consider removing the sensor /dev node as well.

I'm satisfied with the way things are currently, but it might be due to
my own ignorance.

Paul

> > Also, sun6i-csi doesn't seem to be used by any board dts (it's declared=
 on the dtsi, but I
> > didn't find any dts enabling it), so I wonder if it would be a bad thin=
g if we update it.
> >
> > > 	pad0: Source
> > > 		[fmt:SBGGR8_1X8/640x480@1/30 field:none colorspace:raw xfer:none yc=
bcr:601 quantization:full-range]
> > > 		-> "sun6i-mipi-csi2":0 [ENABLED,IMMUTABLE]
> >=20
> > If I understand correctly, this is very similar to ipu3:
> >     sensor->bus->dma_engine
> >=20
> > in the case of ipu3-cio2:
> >     sensor->ipu3-csi2->ipu3-cio2
> >=20
> > in this case:
> >     ov5648->sun6i-mipi-csi2->sun6i-csi
>=20
> Yes this is the correct picture.
>=20
> > On thing that is confusing me is the name csi2 with csi (that makes me =
think of csi
> > version one, which is not the case), I would rename it to sun6i-video (=
or maybe
> > it is just me who gets confused).
>=20
> So the CSI name comes from the Allwinner litterature and implementation f=
or that
> controller. Since it supports parallel input on its own, it does in fact =
support
> parallel CSI. The DMA engine part alone from that controller is also used=
 for
> MIPI CSI-2, so in this case the name looses its relevance.
>=20
> > I know this driver is already upstream and not part of this series, but=
 on the other hand it
> > doesn't seem to be used.
>=20
> Personally I don't find a rename to be necessary and while I agree that
> nothing would apparently prevent us from renaming it, I would prefer to k=
eep
> the naming in line with Allwinner's litterature.
>=20
> > On another note, I always wonder if we should expose the bus in the top=
ology, I'm not
> > sure if it provides any useful API or information for userspace, and yo=
u could have
> > a cleaner code (maybe code could be under phy subsystem). But at the sa=
me time, it
> > seems this is a pattern on v4l2.
> >=20
> > I'd like to hear what others think on the above.
>=20
> My view on this is that we are dealing with two distinct controllers here,
> one that acts as a DMA engine and one that acts as a bridge. As a result,=
 two
> chained subdevs looks like the most appropriate representation to me.
>=20
> Using the PHY subsystem would probably be abusing the framework since the
> MIPI CSI-2 controller is not a PHY (and we do have a D-PHY driver for the=
 D-PHY
> part that uses the PHY API already).
>=20
> So tl;dr I don't agree that it would be cleaner.
>=20
> Cheers,
>=20
> Paul
>=20
> > > Happy reviewing!
> > >=20
> > > Paul Kocialkowski (14):
> > >   phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
> > >   phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
> > >     CSI-2
> > >   media: sun6i-csi: Support an optional dedicated memory pool
> > >   media: sun6i-csi: Fix the image storage bpp for 10/12-bit Bayer
> > >     formats
> > >   media: sun6i-csi: Only configure the interface data width for paral=
lel
> > >   media: sun6i-csi: Support feeding from the MIPI CSI-2 controller
> > >   dt-bindings: media: i2c: Add A31 MIPI CSI-2 bindings documentation
> > >   media: sunxi: Add support for the A31 MIPI CSI-2 controller
> > >   ARM: dts: sun8i: v3s: Add CSI0 camera interface node
> > >   ARM: dts: sun8i: v3s: Add MIPI D-PHY and MIPI CSI-2 interface nodes
> > >   dt-bindings: media: i2c: Add A83T MIPI CSI-2 bindings documentation
> > >   media: sunxi: Add support for the A83T MIPI CSI-2 controller
> > >   ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
> > >   media: sunxi: sun8i-a83t-mipi-csi2: Avoid using the (unsolicited)
> > >     interrupt
> > >=20
> > >  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 +++++
> > >  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 +++++
> > >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  26 +
> > >  arch/arm/boot/dts/sun8i-v3s.dtsi              |  62 ++
> > >  drivers/media/platform/sunxi/Kconfig          |   2 +
> > >  drivers/media/platform/sunxi/Makefile         |   2 +
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  54 +-
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  20 +-
> > >  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  11 +
> > >  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 635 +++++++++++++++++
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 116 +++
> > >  .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
> > >  .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
> > >  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
> > >  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 ++
> > >  .../sun8i_a83t_mipi_csi2.c                    | 660 ++++++++++++++++=
++
> > >  .../sun8i_a83t_mipi_csi2.h                    | 196 ++++++
> > >  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 164 ++++-
> > >  drivers/staging/media/rkisp1/rkisp1-isp.c     |   3 +-
> > >  include/linux/phy/phy-mipi-dphy.h             |  13 +
> > >  21 files changed, 2408 insertions(+), 32 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner=
,sun6i-a31-mipi-csi2.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/media/allwinner=
,sun8i-a83t-mipi-csi2.yaml
> > >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kcon=
fig
> > >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Make=
file
> > >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6=
i_mipi_csi2.c
> > >  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6=
i_mipi_csi2.h
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/Kconfig
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/Makefile
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/sun8i_a83t_dphy.c
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/sun8i_a83t_dphy.h
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/sun8i_a83t_mipi_csi2.c
> > >  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2=
/sun8i_a83t_mipi_csi2.h
> > >=20
>=20
> --=20
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+ijSYACgkQ3cLmz3+f
v9EP8gf/ep3ZT/jxOwRIeLC9QlQttVayezv2icEW1vWtW039XYjXl/Lz8Mkk/PIG
KGhH3YVqbCxE2TH2LYpwn+RgVEDuUV/RW/lASfU8uHzKhe6hvZWGmL88qveAViPA
E5h/lQtrItJluIkDgYv3ESNNG+R18HChsHVqzAcSgzvesrSnmW38XhWi1H68OBt9
NDsgIBIvObFX9aX6jzhCPigk7h8fhFjw//FxGQzCtU6BRX/7Rn4lMDmjMqdarZzV
vORjKHaTfAbuS5sjuV6d4zXBRZhlJXsSTw3CssMtxeNEjgIxr2C63crhcqrkDixw
RO/uBigt2IRNLEC8ssCrz/eowA7Zng==
=yIar
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
