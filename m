Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447771DB73F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 16:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgETOlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 10:41:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:54596 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETOlF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 10:41:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B977BAD7C;
        Wed, 20 May 2020 14:41:06 +0000 (UTC)
Message-ID: <a18a3f213b7d26a0f9a420dbda7eb739d3aab1d9.camel@suse.de>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma
 driver
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Wed, 20 May 2020 16:41:02 +0200
In-Reply-To: <CAPY8ntCZsFtko4LMUsfSEUV9LwtJ9bdjXK4ZVJ3KFd18vzRp5A@mail.gmail.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
         <9b42ad8c4c39ac3873e7c3ea2951bea1caef8bd1.camel@suse.de>
         <CAPY8ntCZsFtko4LMUsfSEUV9LwtJ9bdjXK4ZVJ3KFd18vzRp5A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-BpkGeRPNg88WPpM/E/kL"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-BpkGeRPNg88WPpM/E/kL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 16:48 +0100, Dave Stevenson wrote:
> Hi Nicolas
> > > +     exp_info.ops =3D &dma_buf_import_ops;
> > > +     exp_info.size =3D import.size;
> > > +     exp_info.flags =3D O_RDWR;
> > > +     exp_info.priv =3D buffer;
> > > +
> > > +     buffer->dma_buf =3D dma_buf_export(&exp_info);
> >=20
> > Could you comment on the need for this second dma_buf? I've only review=
ed
> > code
> > related to mmal-vchiq imports, but it seems to me that it would be sane=
r to
> > do
> > the unmapping and unattaching explicitly as opposed to having this seco=
nd
> > buffer refcount hit 0. Although, I can imagine this being needed for th=
e
> > userspace interface.
>=20
> Indeed, as it is needed for the userspace interface it seemed to make
> more sense to have common handling rather than two code paths doing
> nearly the same thing but in different ways.
> Downstream we need a userspace import at least to allow MMAL to set up
> zero copy, so unless it raises any real objections then it would be
> useful to keep it.
>=20
> > When you talk about moving to dmabuf heaps, I've pictured a specific dm=
abuf
> > heap for vc4 that takes care of all the importing and unimporting (asid=
e
> > from
> > cma allocations). Am I right? If so, I'm pretty confident we can do awa=
y
> > with
> > this.
>=20
> (Note I'm talking about the VideoCore4 VPU and other blocks, and not
> the vc4 DRM/KMS and V3D drivers)
>=20
> No, I'm looking at using the existing cma_heap driver to do the
> allocations, and then this driver will import them and handle the
> lifetime on behalf of the VPU. There's no need for VPU allocations to
> be split off into yet another heap.

Fair enough.

> One of the things we are trying to get away from is having the gpu_mem
> reserved lump that Linux can't get access to at all, so allocating
> from the CMA heap and importing to the VPU avoids that.

That's great! Will this also apply at some point to the GPU side of things?=
 I
vaguely recall having to reserve up to 300M on rpi3 to get mesa to work on =
a
desktop environment.

> I'll give some history here, which also hopefully covers your query
> over switching mmal-vchiq to zero copy.
>=20
> Almost all the VC4 blocks need contiguous memory, so fragmentation was
> an issue. To resolve that we (back in Broadcom days) had the
> "relocatable heap" - allocations that needed to be locked before
> access and unlocked after. Unlocked blocks could be copied and moved
> around to free up larger contiguous blocks. These allocations use a
> handle instead of a pointer, and have internal refcounting etc.
> Basically providing some of the features of an MMU when you don't have
> one.
>=20
> The original VCSM driver allowed userspace to make a relocatable heap
> allocation, lock it, and the kernel to map the relevant pages into the
> ARM memory space. Now you have a shared buffer, and VCHIQ no longer
> has to copy the data back and forth. (Cache flushing was also
> handled).
> So MMAL in zero copy mode passes the VPU relocatable heap handle
> across in the VCHIQ message, not a pointer to the actual data. VCSM
> did the allocation on behalf of the MMAL client, and provides the
> mapping and VPU handle to the buffer. This still leaves the allocation
> being made from gpu_mem though.
>=20
> The rewrite (vc-sm-cma) was to make use of an import feature into the
> relocatable heap, termed internally as mem wrapping. Take a CMA
> allocation made by something, pass the DMA address and size across to
> the VPU, and it can insert it as a relocatable heap object that can be
> used in exactly the same way gpu_mem allocations. gpu_mem can now be
> shrunk in size :-) It was using a dma-buf as a convenient object to
> manage the allocation, and handle importing buffers allocated by other
> subsystems
> Note that we still have refcounting internally to the relocatable
> heap, so at the point the client says it has finished with it, the VPU
> may not have done. When the last relocatable heap reference is
> released, the kernel gets a callback (VC_SM_MSG_TYPE_RELEASED), and it
> is only at that point that it is safe to drop the reference to the
> imported dmabuf.
>=20
> V4L2 can do the relevant import and wrapping to a relocatable heap
> handle as part of the buffer passing. MMAL needs to do it manually
> from userspace as VCHIQ is the only in-kernel service that it uses,
> hence we need an import ioctl and free mechanism (if the handle is a
> dmabuf, then that's close).
>=20
>=20
> From a platform level it would be nice to have the userspace ioctl for
> importing a dmabuf in mainline, however it isn't necessary for the
> V4L2 use cases that we're trying to upstream here. The driver without
> userspace API would look pretty much like the one in [1]. I'll try and
> update that to include the basic import userspace API to give a
> comparison.
> I don't mind which way this goes as to whether the userspace ioctl
> remains as downstream patches, but losing the dmabuf as the handle
> within vc-sm-cma will make that patch huge, and they're almost
> guaranteed to diverge.
> Ignore the caching ioctls - they're irrelevant.
>=20
> I hope that makes the situation a little clearer.

Thanks a lot for the in-depth explanation, it does indeed. Actually, it
wouldn't hurt to add a subset of this into a text file alongside with the n=
ew
driver.

Regards,
Nicolas


--=-BpkGeRPNg88WPpM/E/kL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7FQX4ACgkQlfZmHno8
x/4p5gf+NZ0BpBHYuHd4Xtv+d6FHlDwwFOWZvpOQTZZPlwEB72JdxvZISOm/heGH
idvDPiAUvghfsEK42UDebn2oVarydc8R9W3ZVOXf+gACw4WgJTBOx0FN9HP5atwp
yyoER3uF0zW1zWDoyxs2J8JhczvCOShYfLnt1YuqBAjJ5Ej0D3CUmGGwN/h0nDce
ePz2o5M6DR4syZmJ6/iBBAheRnxovDQOQkjq4wj2FSOkLcrsPMD0ria8TWB4gTvt
h6ITSHW9dE3sDr+CjEGDj8UUX0iAC2gjYp9IlxQLp3FW0IpCY9p4QwYDlHnH0ciw
J+pcnS+Cx12TrFAf1kTtgsF3iXEcHQ==
=Tdfe
-----END PGP SIGNATURE-----

--=-BpkGeRPNg88WPpM/E/kL--

