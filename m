Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E18940A8CF
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 10:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhINIJF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 04:09:05 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57155 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhINIGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 04:06:19 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7D13424000B;
        Tue, 14 Sep 2021 08:04:26 +0000 (UTC)
Date:   Tue, 14 Sep 2021 10:04:25 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 15/22] media: sunxi: Remove the sun6i-csi driver
 implementation
Message-ID: <YUBXiSrQjccLoa8b@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-16-paul.kocialkowski@bootlin.com>
 <20210913081707.3pjcfuwan46pbdep@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4F826WXvoEFTgwkk"
Content-Disposition: inline
In-Reply-To: <20210913081707.3pjcfuwan46pbdep@gilmour>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4F826WXvoEFTgwkk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 13 Sep 21, 10:17, Maxime Ripard wrote:
> On Fri, Sep 10, 2021 at 08:41:40PM +0200, Paul Kocialkowski wrote:
> > As described in the commit adding support for the new sun6i-csi driver,
> > a complete rewrite was necessary to support the Allwinner A31 ISP as
> > well as fix a number of issues with the current implementation.
> >=20
> > Farewell and thanks for all the pixels!
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>=20
> For completeness, this is what the other commit log mentions:
>=20
> > While adapting the sun6i-csi driver for MIPI CSI-2 support was
> > possible, it became clear that adding support for the ISP required
> > very heavy changes to the driver which were quite hard to break down
> > into a series of subsequent changes.
>=20
> > The first major difficulty comes from the lack of v4l2 subdev that
> > acts a bridge, separate from the video node representing the DMA
> > engine. To support the ISP, only parts of the hardware must be
> > configured (excluding aspects related to the DMA output), which made
> > the separation a hard requirement.
>=20
> > Another significant difficulty was the specific dance that is required
> > to have both the ISP and CSI device be part of the same media device.
> > Because the ISP and CSI are two different hardware blocks, they have
> > two distinct drivers that will each try to register their own v4l2
> > and media devices, resulting in two distinct pipelines. When the ISP
> > is in use, we actually want the CSI driver to register with the ISP's
> > v4l2 and media devices while keeping the ability to register its own
> > when the ISP is not in use. This is done by:
> > 1. Having the CSI driver check whether the ISP is available, using
> >    sun6i_csi_isp_detect();
> > 2. If not, it can register when its own async subdevs are ready, using
> >    sun6i_csi_v4l2_complete();
> > 3. If so, it will register its bridge as an async subdev which will
> >    be picked-up by the ISP driver (from the fwnode graph link);
> > 4. When the subdev becomes bound to the ISP's v4l2 device, we can
> >    then access that device (and the associated media device) to
> >    complete registration of the capture video node, using
> >    sun6i_csi_isp_complete();
> > Besides the logic rework, other issues were identified and resolved:
> > - The sync mechanism for buffer flipping was based on the frame done
> >   interrupt, which is too late (next frame is already being processed).
> >   This lead to requiring 3 buffers to start and writing two addresses
> >   when starting. Using vsync as a sync point seems to be the correct
> >   approach and allows using only two buffers without tearing;
> > - Using devm_regmap_init_mmio_clk was incorrect since the reset also
> >   comes into play;
> > - Some register definitions were inverted compared to their actual
> >   effect (which was inherited from the Allwinner documentation and
> >   code): comments were added where relevant;
> > - The deprecated v4l2_async_notifier_parse_fwnode_endpoints() helper
> >   is no longer used by the driver;
>=20
> With that being said, NAK.
>=20
> Having heavy changes to a driver is completely fine, and is kind of
> expected really with such a big change. Breaking all possibility of
> bisection and throwing away years of stabilization and maintenance
> isn't.
>=20
> And all those small bug fixes you mention at the end are just that:
> small bug fixes that can be done on the current driver just fine too.

I understand that this looks like we're trashing all the work that was
done previously by removing the current driver and adding the new one
but the logic for deciding what to write into registers was carefully
preserved from the original driver to make sure that the works of
stabilization and maintenance are not lost.

However I would understand that my good promise on this is not enough,
so perhaps I could provide a combinatory verification that the same set
of mbus/pixel formats end up with the same thing being written into
registers.

In addition I understand that it will be necessary to split the changes
up into small commits to clarify the transition path between the two
drivers. So I will do my best to split things up.

Does that seem like an agreeable plan or do you see other things that
would be blockers?

My initial thought was that it would be much easier to review the driver as=
 a
rewrite, but I'm not too surprised I was wrong. To be honest it was nearly
impossible to actually have the initial development happen as sequential st=
eps
and I preferred to allocate my time on other tasks than splitting the chang=
es
into these sequential steps.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--4F826WXvoEFTgwkk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFAV4kACgkQ3cLmz3+f
v9EieQf/XPAbDZuMl6e9vh2/5Nk+xAsVjNUg2fI21tKCjVq3m//gtD27CcUkhInC
/G37OLndkoQ/8UhNaymnU7ld3rKjsn+xU/DN8dySK2QXx+MCeEP0Ffni9mDuXy4b
AOc+1/s1HUOLwkRpQ0HgeCjEkYAbSwe8QV3RR7QCMG+qqFiKmfWPZgserIZKKjFz
VxyI/KP3M3BRr5eXJrpUaKkar+7iXmv2nrPBpdIeLpOYC62oIVg+24nvNrAC7NG4
8J28VSDGgprknJQn8eHEycrX4LfSQJNhjiVWnpsO3HDXaDggSYs3Ev9w+IoJy+Mf
9N31yTCNwZS9MT4W296c4FMLFekjKA==
=oC/H
-----END PGP SIGNATURE-----

--4F826WXvoEFTgwkk--
