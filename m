Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84DDF1DB571
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgETNqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:46:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:52852 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETNqk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:46:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 54F98ADD7;
        Wed, 20 May 2020 13:46:41 +0000 (UTC)
Message-ID: <0e296c08867cd8550e592ec9b7f1cd7ba0e4f176.camel@suse.de>
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835
 ISP
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Date:   Wed, 20 May 2020 15:46:36 +0200
In-Reply-To: <CAPY8ntBaE-1n8PzG6hzBdDSBEqO7ZRz8Zj5byU3h=gvDGSfHvw@mail.gmail.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
         <8e45d7059c0f840e1661547a23103f3351c74622.camel@suse.de>
         <CAPY8ntBaE-1n8PzG6hzBdDSBEqO7ZRz8Zj5byU3h=gvDGSfHvw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-piA5C2Yl4+SW2BDptIRE"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-piA5C2Yl4+SW2BDptIRE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 14:38 +0100, Dave Stevenson wrote:
> Hi Nicholas
>=20
> Sorry for the slight delay in replying.
>=20
> On Mon, 11 May 2020 at 20:19, Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > Hi Naushir,
> > a small comment.
> >=20
> > On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> > > From: Naushir Patuck <naush@raspberrypi.com>
> > >=20
> > > Port the V4L2 compatible driver for the ISP unit found on Broadcom BC=
M2835
> > > chips.
> > >=20
> > > The driver interfaces though the VideoCore unit using the VCHIQ MMAL
> > > interface.
> > >=20
> > > ISP driver upported from from RaspberryPi BSP at revision:
> > > 6c3505be6c3e ("staging: vc04_services: isp: Make all references to
> > > bcm2835_isp_fmt const")
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > [Adapt to staging by moving all modifications that in the BSP are
> > > scattered
> > > in core components inside this directory]
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> >=20
> > [...]
> >=20
> > > +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf=
)
> > > +{
> > > +     mmal_vchi_buffer_cleanup(mmal_buf);
> > > +
> > > +     if (mmal_buf->dma_buf) {
> > > +             dma_buf_put(mmal_buf->dma_buf);
> > > +             mmal_buf->dma_buf =3D NULL;
> >=20
> > Why is this needed here, shouldn't this be mmal-vchi's responsibility? =
IIUC
> > the
> > original dma_buf_get() happens there too.
>=20
> The original dma_buf_get is in bcm2835_isp_buf_prepare as it either
> comes from a dma_buf_get(vb->planes[0].m.fd) for VB2_MEMORY_DMABUF
> operations, or a vb2_core_expbuf_dmabuf for VB2_MEMORY_MMAP.
> Seeing as the original "get" is in this calling code, it seemed
> reasonable that the put is as well.
>=20
> There are no get/put operations on dma-bufs (other than indirectly
> through vc_sm_cma) within mmal-vchiq. You have the call
> vc_sm_cma_import_dmabuf to take the external dma_buf and pull it into
> vc_sm_cma, but that is the limit of it.

Understood, thanks.


--=-piA5C2Yl4+SW2BDptIRE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7FNLwACgkQlfZmHno8
x/6crgf/TOmlNGQ1dF8lKEkJmb6922hI4IZph4coHFrZybMAElESPrmD1XUZjLbr
3f0XAvbOeS04IKEefp3mOLr9ZSopra849Bhaczu3e1nY09wsGKINq6HOv7cl56sK
nk61eg5CjmT3jZJZs/Rb2/sgFWREmegBjZf8D0TvL6rg8K/njzz9RPK9BicgW8t3
VlLEiTzReajNIVujj7cU0cV6KNn34rpg4vLhK2f+0D1iZNKVB8pGUfCT39Gxxe+x
7E5y0AQ1MoE58Q+cDQxi8q49UWegFiKO05yc9wXYxKukSPfjUKWaEV8CXtdeM4M5
wW1jxMC0o0jxKM8U8/9YdPIHfJmU8Q==
=2uNR
-----END PGP SIGNATURE-----

--=-piA5C2Yl4+SW2BDptIRE--

