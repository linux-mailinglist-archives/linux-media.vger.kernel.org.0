Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322211C52B2
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbgEEKNK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:13:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:60816 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgEEKNK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:13:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 189FAB0F2;
        Tue,  5 May 2020 10:13:10 +0000 (UTC)
Message-ID: <09a896b78b42d2c78ed3ad468de7e90163b9d6c4.camel@suse.de>
Subject: Re: [PATCH v2 29/34] staging: vchiq: Add 36-bit address support
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Phil Elwell <phil@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.org>
Date:   Tue, 05 May 2020 12:13:03 +0200
In-Reply-To: <7cbd4185-0d26-aa26-3f7a-56b5b13e5336@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-30-laurent.pinchart@ideasonboard.com>
         <00cc89e24aa5c3d4286b6f42347aa87e7699c4e5.camel@suse.de>
         <7cbd4185-0d26-aa26-3f7a-56b5b13e5336@raspberrypi.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-1SdcJXjM1ZGDAbrh0A7N"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-1SdcJXjM1ZGDAbrh0A7N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-04 at 21:46 +0100, Phil Elwell wrote:
> Hi Nicolas,
>=20
> On 04/05/2020 18:40, Nicolas Saenz Julienne wrote:
> > Hi Phil, Laurent,
> >=20
> > On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > > From: Phil Elwell <phil@raspberrypi.org>
> > >=20
> > > Conditional on a new compatible string, change the pagelist encoding
> > > such that the top 24 bits are the pfn, leaving 8 bits for run length
> > > (-1).
> > >=20
> > > Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >   .../interface/vchiq_arm/vchiq_2835_arm.c      | 88 ++++++++++++++--=
---
> > >   .../interface/vchiq_arm/vchiq_arm.c           |  6 ++
> > >   .../interface/vchiq_arm/vchiq_arm.h           |  1 +
> > >   3 files changed, 74 insertions(+), 21 deletions(-)
> > >=20
> > > diff --git
> > > a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
> > > index 3e422a7eb3f1..ecec84ad4345 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_ar=
m.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_ar=
m.c
> > > @@ -16,6 +16,8 @@
> > >   #include <soc/bcm2835/raspberrypi-firmware.h>
> > >     #define TOTAL_SLOTS (VCHIQ_SLOT_ZERO_SLOTS + 2 * 32)
> > > +#define VC_SAFE(x) (g_use_36bit_addrs ? ((u32)(x) | 0xc0000000) :
> > > (u32)(x))
> > > +#define IS_VC_SAFE(x) (g_use_36bit_addrs ? !((x) & ~0x3fffffffull) :=
 1)
> >=20
> > As I commented earlier, this is a sign your dma-ranges are wrong, most =
of
> > the
> > code below reimplements what is already done by dma-direct (see
> > kernel/dma/direct.c). Once properly setup, you should be able to use
> > whatever
> > phys address dmam_alloc_coherent() provides and drop g_use_36bit_addrs.
> >=20
> > Note that on arm32+LPAE, dma-direct/swiotlb are the default dma_ops, so=
 this
> > also applies there.
>=20
> As I explained in an offline email, the problem is that VCHIQ needs acces=
s to

We discussed this privately, but I wanted to start from scratch, specially =
as I
hope I won't be the only one reviewing this :).

> two
> kinds of "DMA" addresses - those suitable for the 40-bit DMA channel, and=
 the
> 30-bit addresses that the VPU can use. Since each DT node only has access=
 to a
> single set of DMA ranges, I can't see how to use dma-direct to calculate
> addreses
> for everything, but feel free to submit an alternative implementation sho=
wing
> how
> it should be done.

How about this):
 - Move vchiq to /soc
 - Get a handle to the relevant dma controller device pointer (so 30-bit DM=
A
   controller on old RPis, 40-bit on RPi4)
 - Allocate slotmem/pagelist with dma_alloc_coherent(vpu_dev, ...)
 - Map pages with dma_map_sg(dma_dev, ...)

I hope I'm not missing anything, but short of implementing it and seeing th=
e
end result, I think you'd be free of any rpi[1-3]/rpi4 distinction in the c=
ode.

Regards,
Nicolas


--=-1SdcJXjM1ZGDAbrh0A7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6xPC8ACgkQlfZmHno8
x/47IQgAp4Z5SWglpwGbAFpUHgwVMCwHgDAKmRivKtUIO6EIK8UTccmdGSWeXRnP
miICnMgIAuF//hRa3+GRtPCjlMz8BGm0ZozVwzuuxy4eFMgeGDMNB4laj3mrHmVW
umSvP3YSKR0HSLZ/mWgZNQyuDdrGiVsiSlyAlF50CcYkZzA/tSht89rMhQbz/nNL
9a+f1GCYWPb/B7Q1A9ppy+URvR4TpsaBCnwPUUitrqlYcXWgj0PPakdBmVQEqKpj
cD+1lUhIAsogi4kdLDYacRsfUAQ7VgDehzoXS1erlH26A8J/78lVzkLcF8/K4t9V
t8uwOdnEe3fdmvE+Uif+ni/Ivukjgw==
=ljTC
-----END PGP SIGNATURE-----

--=-1SdcJXjM1ZGDAbrh0A7N--

