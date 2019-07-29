Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EF978CBD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 15:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbfG2NZ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 09:25:27 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60995 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387449AbfG2NZ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 09:25:27 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DE1FA20002;
        Mon, 29 Jul 2019 13:25:22 +0000 (UTC)
Date:   Mon, 29 Jul 2019 15:25:21 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
Message-ID: <20190729132521.GA31073@aptenodytes>
References: <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
 <20190705191618.3467c417@collabora.com>
 <20190725084228.2306171e@collabora.com>
 <20190725193616.GD14499@aptenodytes>
 <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
 <20190726082828.0844011d@collabora.com>
 <20190726093028.3a94bda0@collabora.com>
 <9b186171-3c1f-d979-c070-ef0c5c0786ac@xs4all.nl>
 <20190727092743.GA16618@aptenodytes>
 <20190727114636.4224e2cd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20190727114636.4224e2cd@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 27 Jul 19, 11:46, Boris Brezillon wrote:
> On Sat, 27 Jul 2019 11:27:43 +0200
> Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:
>=20
> > Hi,
> >=20
> > On Fri 26 Jul 19, 10:53, Hans Verkuil wrote:
> > > On 7/26/19 9:30 AM, Boris Brezillon wrote: =20
> > > > On Fri, 26 Jul 2019 08:28:28 +0200
> > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > >  =20
> > > >> On Thu, 25 Jul 2019 23:39:11 -0300
> > > >> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > >> =20
> > > >>> On Thu, 2019-07-25 at 21:36 +0200, Paul Kocialkowski wrote:   =20
> > > >>>> Having a control that specifies an alignment constraint for the =
slice beginning
> > > >>>> could work (as long as we make it optional, although userspace s=
hould be
> > > >>>> required to abide by it when it is present).   =20
> > > >>
> > > >> By making that, you put the burden on both sides of the stack:
> > > >>
> > > >> - the kernel side will have to deal with the unaligned cases (usin=
g a
> > > >>   bounce buffer)
> > > >> - userspace apps/libs that want to avoid an extra copy will have to
> > > >>   check this constraint and align things properly anyway =20
> > > >=20
> > > > I'd like to revise my statement. Ideally, the drivers should take c=
are
> > > > of such mis-alignments or unsupported NAL header types by
> > > > copying/re-formatting the OUTPUT buffer so that existing apps work
> > > > out of the box when the driver is added, which means we'll have to =
take
> > > > care of that kernel-side anyway. Handling selection of the best
> > > > encoding-mode/NAL-header-type in userspace is useful if one wants to
> > > > improve perfs. =20
> > >=20
> > > Just my 5 cents:
> > >=20
> > > You very much want to avoid the situation where drivers have to copy =
or
> > > reformat the OUTPUT buffer. That's asking for problems, not to mention
> > > that it is no longer zero-copy. =20
> >=20
> > I definitely agree on that, since such constraints are likely to exist,=
 we are
> > certainly better off exposing them to userspace.
> >=20
> > I understand that it does add some complexity and asks for userspace co=
de to be
> > more complex, but let's be realistic: this is a complex topic with lots=
 of
> > hardware-specific details getting in the way. I don't think we can act =
as if
> > things were simpler.
> >=20
> > My feeling is that we should keep trying to find "as elegant as possibl=
e" ways
> > to expose constraints instead of putting strict and easy definitions for
> > userspace that end up making drivers perform sub-optimally.
> >=20
> > Since the initial cedrus proposal, we have covered more ground to allow=
 the
> > API to fit the rockchip case, without conflicting with cedrus. We're no=
w facing
> > new constraints and issue and I really think we should keep trying to i=
ntegrate
> > them in the unified API.
> >=20
> > > >> Plus, the alignment thing won't work for AVC headers, so I think we
> > > >> should actually have a control to select the NAL header type rather
> > > >> than expose some alignment constraints (or have one pix fmt per NAL
> > > >> header type, but you don't seem to like the idea, so I'm trying
> > > >> to find something else :-)).
> > > >>
> > > >> And if we go for this option (control to select the NAL header typ=
e),
> > > >> I'm wondering why we're not making that NAL-header type selection
> > > >> mandatory from the start. We don't have to support all NAL headers=
 at
> > > >> first (can be Annex B only), but, by making this control selection
> > > >> non-optional, we'll at least give a decent feedback to userspace
> > > >> (setting NAL header control fails because the selected NAL header =
type
> > > >> is not supported by the HW) instead of returning an error on the
> > > >> decoding operation (which, depending on how verbose the driver is,=
 can
> > > >> be quite hard to figure out). =20
> > >=20
> > > This sounds reasonable.
> > >=20
> > > This control should be mandatory, and it should be referred to from
> > > the H264/5 pixelformat definitions (see also https://patchwork.linuxt=
v.org/patch/57709/). =20
> >=20
> > I am growing confused about one thing: are we talking about selecting
> > the type of *start code* (which can have a variable number of heading a=
nd
> > trailing zeros depending on the situation) or about the *NAL header typ=
e*, which
> > follows the start code?
>=20
> We're talking about start codes, but Nicolas called them nal_header in
> this email [1], so I thought it was the appropriate naming.

Okay, the representation I had in mind was:
[zeros][start code][nal unit header][zeros][nal unit data]

but maybe I'm mixing things up on my side.

> > I like the idea of drivers providing what types of start codes they can=
 support,
> > but I don't really see how it helps regarding the alignment constraints=
 and how
> > it relates to the zero-padding.
>=20
> It does help with alignment constraints because buffers allocated by
> the driver are usually matching the HW alignment constraints and by
> passing the type of NAL header (or start code if you prefer) we now
> guarantee that the raw bitstream (when in NO_NAL_HEADER is selected) is
> placed at the beginning of the buffer.

I thought the issue at hand was that we needed the nal unit header to start=
 at
an aligned address while still needing a start code of 3 bytes. I feel like=
 I'm
missing something in my understanding of the issue here.

> Doesn't solve the case of
> imported buffers, but that problem is orthogonal I think (it's a
> problem we already have right now, and would indeed require some way
> to expose HW alignment constraints).

If we expose the constraints explicitly, then we can honestly say that it's=
 up
to user-space to abide by them so there should be no particular difference
between imported and allocated buffers. Userspace just has to know what it's
doing. And drivers chould refuse imports that don't follow the reported
constraints (or are outside the pool dedicated to the VPU).

> Not sure what the zero padding issue is. If you know the type of start
> code, you don't have add extra 0 at the beginning to meet the alignment
> constraints. If you're talking about padding bytes added at the end of
> the bitstream (there's such a constraint on the rkvdec block), I think
> that's something driver specific and should be handled by the driver.

My point would rather be that it is (as far as I understood) valid regardin=
g the
H.264 spec to have extra zeros added by userspace (whatever the reason), so=
 even
if the type of start code is reported, it doesn't imply that we know the le=
ngth
of the heading zeros and start code, so the issue remains.

Cheers,

Paul

> [1]https://www.mail-archive.com/linux-media@vger.kernel.org/msg146836.html

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl0+88EACgkQ3cLmz3+f
v9FrWwf/ectKUmqSJnmak7wvqtvopZXh2bz+PqAbnHEr7yTPthiEoCHtK+9XAlwM
U3VogLClkxuihbZYxpAcH1+DSmMpgjFLw5WiJZnxrYPMbdJs8FDJjBcXz/YP3rgz
4ou3l65D7MQvNM5AVDMZczk6NIiMyZjVicAC8uvpmrS494wq/oZ1V9GcsHxDy1Xq
Gc6w+OOe0KWbK5qaC0BY0+H0uTj/52jFXF9qeeiTAOdgCgLL+tLRXzrmq8kS3edC
E8/ju/9PfCixyFEV97XzVWyrB5yXD3Cbv2gDYnwkTPe4bOlzY1zLVl2iAeAY40Rq
zbc7YKlrwuZcLbKXZVqYtCLHaNx/2A==
=zsr0
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
