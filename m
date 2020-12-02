Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112E72CC1B3
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgLBQIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:08:12 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:63443 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgLBQIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 11:08:12 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F23DA24000B;
        Wed,  2 Dec 2020 16:07:23 +0000 (UTC)
Date:   Wed, 2 Dec 2020 17:07:23 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
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
Subject: Re: [PATCH v2 07/19] media: sun6i-csi: Add support for MIPI CSI-2
 bridge input
Message-ID: <X8e7u3smOjzFluy5@aptenodytes>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
 <20201128142839.517949-8-paul.kocialkowski@bootlin.com>
 <20201201121241.cyafjhot45puusfc@gilmour>
 <X8eiXxYw1iHKbdDV@aptenodytes>
 <20201202154053.3fcxiift2uyqnjvp@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="B6QLXucSOn8pJf1x"
Content-Disposition: inline
In-Reply-To: <20201202154053.3fcxiift2uyqnjvp@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--B6QLXucSOn8pJf1x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 02 Dec 20, 16:40, Maxime Ripard wrote:
> On Wed, Dec 02, 2020 at 03:19:11PM +0100, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > On Tue 01 Dec 20, 13:12, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > On Sat, Nov 28, 2020 at 03:28:27PM +0100, Paul Kocialkowski wrote:
> > > > The A31 CSI controller supports a MIPI CSI-2 bridge input, which has
> > > > its own dedicated port in the fwnode graph.
> > > >=20
> > > > Support for this input is added with this change:
> > > > - two pads are defined for the media entity instead of one
> > > >   and only one needs to be connected at a time;
> > > > - the pads currently match the fwnode graph representation;
> > > > - links are created between our pads and the subdevs for each
> > > >   interface and are no longer immutable so that userspace can select
> > > >   which interface to use in case both are bound to a subdev;
> > > > - fwnode endpoints are parsed and stored for each interface;
> > > > - the active subdev (and fwnode endpoint) is retrieved when validat=
ing
> > > >   the media link at stream on time and cleared at stream off;
> > > > - an error is raised if both links are active at the same time;
> > > > - the MIPI interface bit is set if the MIPI CSI-2 bridge endpoint is
> > > >   active.
> > > >=20
> > > > In the future, the media entity representation might evolve to:
> > > > - distinguish the internal parallel bridge and data formatter;
> > > > - represent each of the 4 internal channels that can exist between
> > > >   the parallel bridge (for BT656 time-multiplex) and MIPI CSI-2
> > > >   (internal channels can be mapped to virtual channels);
> > > > - connect the controller's output to the ISP instead of its
> > > >   DMA engine.
> > > >=20
> > > > Finally note that the MIPI CSI-2 bridges should not be linked in
> > > > the fwnode graph unless they have a sensor subdev attached.
> > >=20
> > > I'll leave most of the review to Laurent and Sakari, but I'm not quite
> > > sure what you meant in the last paragraph. Did you mean that the
> > > MIPI-CSI controller in the Allwinner SoC should only be linked if it =
has
> > > a sensor attached, or did you mean that any MIPI-CSI2 bridge cannot be
> > > attached to the controller?
> >=20
> > So the use of plural was a mistake and your first understanding is the =
correct
> > one: if the bridge is linked to the CSI controller in the OF graph but =
the
> > bridge doesn't have a sensor attached, the CSI controller driver will f=
ail
> > to probe, as far as I could see.
>=20
> I'm not sure it's reasonable to not link it in the DTSI then, we'll want
> to reduce as much the boilerplate from the board DTS as possible, and
> the MIPI-CSI controller is always there anyway. However, we should
> definitely have it disabled if there's no sensor, which should solve
> your probe issue

Ah yes there's a good chance that it will solve it.
I'll try that and get back to you!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--B6QLXucSOn8pJf1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/Hu7sACgkQ3cLmz3+f
v9EBKwf9FlOPkn4I/QP73y0XTYCJul68SVmMn85aeJ6iIqaVWGXtkRMM7ILKodOu
aZY8NnE4BjULBapZ1fJOvD+1WfCfjpc31gGtHtmdAc22Yev2PBLbIKtegSnR9O2x
mMPTTkupiw+lCZjZjFqLn5gQEnSJm44I7dZa5bz3kHWM0cgNl2upzQtKBRf4iLCt
bYktWtnpkUNvBGjFtQOI1/8VSiXpdJerFN+qOSIDmbXmp87CNqr6iLzE2CDrJc4g
/eSo/Ot7bGmVK59c1Av4ZXSkJ034dhhA9c0sXST+8boRDIr6Cnl7/zuh/dXsEj4p
aWJ9/KOEC0dyIoJGjtmPNu1IAzSi0w==
=Bj4d
-----END PGP SIGNATURE-----

--B6QLXucSOn8pJf1x--
