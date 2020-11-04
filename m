Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961642A6322
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgKDLRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:17:21 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:57685 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDLRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 06:17:17 -0500
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4CBB8240011;
        Wed,  4 Nov 2020 11:17:11 +0000 (UTC)
Date:   Wed, 4 Nov 2020 12:17:10 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 08/14] media: sunxi: Add support for the A31 MIPI CSI-2
 controller
Message-ID: <20201104111710.GB287014@aptenodytes>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-9-paul.kocialkowski@bootlin.com>
 <1a3a615c-a058-e282-2dbb-c99dfa98be68@collabora.com>
 <20201102092110.ro6a456lvbrktwoz@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20201102092110.ro6a456lvbrktwoz@gilmour.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 02 Nov 20, 10:21, Maxime Ripard wrote:
> On Fri, Oct 30, 2020 at 07:45:18PM -0300, Helen Koike wrote:
> > On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
> > > The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 controller
> > > found on Allwinner SoCs such as the A31 and V3/V3s.
> > >=20
> > > It is a standalone block, connected to the CSI controller on one side
> > > and to the MIPI D-PHY block on the other. It has a dedicated address
> > > space, interrupt line and clock.
> > >=20
> > > Currently, the MIPI CSI-2 controller is hard-tied to a specific CSI
> > > controller (CSI0) but newer SoCs (such as the V5) may allow switching
> > > MIPI CSI-2 controllers between CSI controllers.
> > >=20
> > > It is represented as a V4L2 subdev to the CSI controller and takes a
> > > MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> > > media controller API.
> >=20
> > Maybe this is a bad idea, but I was thinking:
> > This driver basically just turn on/off and catch some interrupts for er=
rors,
> > and all the rest of v4l2 config you just forward to the next subdevice
> > on the pipeline.
> >=20
> > So instead of exposing it as a subdevice, I was wondering if modeling
> > this driver also through the phy subsystem wouldn't be cleaner, so
> > you won't need all the v4l2 subdevice/topology boilerplate code that
> > it seems you are not using (unless you have plans to add controls or
> > some specific configuration on this node later).
> >=20
> > But this would require changes on the sun6i-csi driver.
> >=20
> > What do you think?
>=20
> Eventually we'll need to filter the virtual channels / datatypes I
> guess, so it's definitely valuable to have it in v4l2

Agreed and like I mentionned in the discussion on 00/14 I don't think it
would be a cleaner way to expose things.

There's also the fact that newer SoCs like the V5 seem to allow connecting
any MIPI CSI-2 controller to any CSI controller, so the graph representation
is definitely welcome here.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl+ijbYACgkQ3cLmz3+f
v9Fb1wgAh9Q8P4R5upBbkO+og7cJgFf/zB+D0ht5gGmg/DnFyx7Qbu0URcwTm99o
SS9l3PciZ2grf+J12pMOxobiIh2GuNQOXEOCdJkIDz7w6hw1IF9WQqBrY4anGsof
EYDHm4dRNr7dZHQl2vQwvSYZRsk4Kotd43w5JzSW/cU3+aAkMU/4O5DyO39JS92B
UOsBaw8r09Vp50SAEBRvmluXDo90m8Wi+LNT2qmXTo+aShRNYeS2vmBqiFg4YpgO
6kcdCDup8CHGi18b3ak4o8AGq8BJjAkjKpBVeJxWbF96eaxaQgKZ7JbgRxFCcmmL
tI6VBvxl6ULRZ3ws5QeQ9kq9EZjbBg==
=aT0d
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
