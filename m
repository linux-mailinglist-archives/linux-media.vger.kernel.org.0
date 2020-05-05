Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B2D1C5368
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgEEKhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:37:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:44196 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728238AbgEEKhq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:37:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 076E2AC6C;
        Tue,  5 May 2020 10:37:47 +0000 (UTC)
Message-ID: <ad81d1a3ce1a5c9c0103bf54313a99c96c91fa9a.camel@suse.de>
Subject: Re: [PATCH v2 30/34] staging: vchiq_arm: Give vchiq children DT
 nodes
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Phil Elwell <phil@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 05 May 2020 12:37:42 +0200
In-Reply-To: <8e062f07-c151-6273-4c25-e541f6df1bb0@raspberrypi.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
         <ccd8ad49a699d9f8a4d77577eb76b4b281b17843.camel@suse.de>
         <8e062f07-c151-6273-4c25-e541f6df1bb0@raspberrypi.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kGx5z/wRu/Gl606/dyld"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-kGx5z/wRu/Gl606/dyld
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-04 at 20:42 +0100, Phil Elwell wrote:
> Hi Nicolas,
>=20
> On 04/05/2020 18:12, Nicolas Saenz Julienne wrote:
> > Hi Phil, Laurent,
> >=20
> > On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > > From: Phil Elwell <phil@raspberrypi.com>
> > >=20
> > > vchiq kernel clients are now instantiated as platform drivers rather
> > > than using DT, but the children of the vchiq interface may still
> > > benefit from access to DT properties. Give them the option of a
> > > a sub-node of the vchiq parent for configuration and to allow
> > > them to be disabled.
> > >=20
> > > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >   .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 +++++=
+++
> > >   1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_=
arm.c
> > > b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > index dd3c8f829daa..2325ab825941 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > @@ -2734,12 +2734,20 @@ vchiq_register_child(struct platform_device *=
pdev,
> > > const char *name)
> > >   	pdevinfo.id =3D PLATFORM_DEVID_NONE;
> > >   	pdevinfo.dma_mask =3D DMA_BIT_MASK(32);
> > >  =20
> > > +	np =3D of_get_child_by_name(pdev->dev.of_node, name);
> > > +
> > > +	/* Skip the child if it is explicitly disabled */
> > > +	if (np && !of_device_is_available(np))
> > > +		return NULL;
> >=20
> > I think this is alright, although I'd reshufle the code a little so it =
looks
> > nicer:
> >=20
> > +	/* Skip the child if it is explicitly disabled */
> > +	np =3D of_get_child_by_name(pdev->dev.of_node, name);
> > +	if (np && !of_device_is_available(np))
> > +		return NULL;
>=20
> I prefer the original.

Fair enough

> > >   	child =3D platform_device_register_full(&pdevinfo);
> > >   	if (IS_ERR(child)) {
> > >   		dev_warn(&pdev->dev, "%s not registered\n", name);
> > >   		child =3D NULL;
> > >   	}
> > >  =20
> > > +	child->dev.of_node =3D np;
> >=20
> > Is this really needed? I'd rather have the parent's np (as commented in
> > patch
> > 26) as long as this is not a real device-tree defined platform device.
>=20
> Unless the of_node pointer refers to the sub-node for the child, all chil=
dren
> would have to share a common set of properties, rather defeating the poin=
t of
> the
> change.

Sorry I wasn't clear, my main point is that, since manually editing device
internals is bad a practice, specially after they have been registered (the=
re
are potential races with dma_configure()/probe()). I want to make sure we n=
eed
it in the first place (i.e. I don't see any further usage of that device no=
de).
If we can get rid of this line, we're better-off.

If we actually need the device node further down I propose two things:
- Use dev.of_node_reused, and do an children lookup anytime you need to get=
 a
  property. It's a one-liner in the end.
- Move device registration to DT. There has been some push-back of this in =
the
  past, but IMO things like arm's SCMI already set a standard on what firmw=
are
  devices can do trough DT and it fits this situation.

Regards,
Nicolas


--=-kGx5z/wRu/Gl606/dyld
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6xQfYACgkQlfZmHno8
x/6oTggAmZlxeCopvax438yIxjhlJxZkQqp8nT8kgT073OSIQT38a3kwLegThuSq
DArJf65wrmuEv/rUSQnRluv50sdepFCMuywyb4HvJLerCE//JLQhxIP7x//gVsVx
fsisxR1XPE7anc6g+yKEnb6hAVqmCOs+DdVxJ7ATMMJVjmnFdaIN5q/oQtgY0DwQ
c1Reaujl4lY1KYgho6WXOPEiHTtAH3IxM1MGW/NTwUfDTi31nE4ZnwP4NsHicmia
9RK46MSVghetGng6VB6qeMH/CMRCmjFCdB3Oj7iobhZ+QUd2dZEqI9vNWvZKVBjK
uMlhMMTWTd4FD7WIO5O2N6t4f6Lgbg==
=TtUL
-----END PGP SIGNATURE-----

--=-kGx5z/wRu/Gl606/dyld--

