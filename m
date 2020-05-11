Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031521CE3AB
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbgEKTPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:15:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:36090 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728613AbgEKTPp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:15:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2161FAF6F;
        Mon, 11 May 2020 19:15:46 +0000 (UTC)
Message-ID: <c7033b364a7bd447362ba405ea3699423148a4fb.camel@suse.de>
Subject: Re: [PATCH v2 15/34] staging: mmal-vchiq: Use vc-sm-cma to support
 zero copy
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Mon, 11 May 2020 21:15:40 +0200
In-Reply-To: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-HRnGfwHHkvMUaSWFK0zl"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-HRnGfwHHkvMUaSWFK0zl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,
some questions.

On Mon, 2020-05-04 at 12:25 +0300, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to vchiq-mmal.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> staging: vc-sm-cma: Use a void* pointer as the handle within the kernel
>=20
> The driver was using an unsigned int as the handle to the outside world,
> and doing a nasty cast to the struct dmabuf when handed it back.
> This breaks badly with a 64 bit kernel where the pointer doesn't fit
> in an unsigned int.
>=20
> Switch to using a void* within the kernel. Reality is that it is
> a struct dma_buf*, but advertising it as such to other drivers seems
> to encourage the use of it as such, and I'm not sure on the implications
> of that.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---

[...]

> @@ -419,8 +422,13 @@ buffer_from_host(struct vchiq_mmal_instance *instanc=
e,
> =20
>  	/* buffer header */
>  	m.u.buffer_from_host.buffer_header.cmd =3D 0;
> -	m.u.buffer_from_host.buffer_header.data =3D
> -		(u32)(unsigned long)buf->buffer;
> +	if (port->zero_copy) {
> +		m.u.buffer_from_host.buffer_header.data =3D buf->vc_handle;
> +	} else {
> +		m.u.buffer_from_host.buffer_header.data =3D
> +			(u32)(unsigned long)buf->buffer;
> +	}

Just for my education, where exactly does the copying happen, IIUC this hea=
ders
are copied into a vchiq slot and then it's up to vc4 to do whatever it plea=
ses
with the buffer. Also, what happens while importing a dmabuf on vc4's side =
and
why is the buffer import needed before queueing this?

Regards,
Nicolas


--=-HRnGfwHHkvMUaSWFK0zl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl65pFwACgkQlfZmHno8
x/5grQgAlyZGL97HBCvKGldbjpo8kwBBq8peciVtlAUMWVP/UjtxQJLIaBHWWrJf
dCuXNRlioJsifDCXLpveSWhcndMBRDYqStDZzaBdIRj3aENOG03nX2PvMiBA2iEq
o4t55K3LtrAKJ66b4NeszF0apFHC10HJeKot+FM3kUTK/H4BabOdQY6PoKoXdCor
pupsjvL3IcfHfFj1uXhVxWQHhfMQ1qvbsxIy603H1ayTb2S5ohdhcmnhxPDGHR4a
Qz8ep0rB/rwDj1Y0XQsS/+t54oJ5IYqTgXWllACqr10nMp5e6XViMAX35GmzeKBO
iv0r5m7JNN/jQjfTsJ/lOLUkzz2bWQ==
=xFO+
-----END PGP SIGNATURE-----

--=-HRnGfwHHkvMUaSWFK0zl--

