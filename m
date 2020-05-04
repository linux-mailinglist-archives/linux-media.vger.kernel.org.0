Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31A51C3FDF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 18:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgEDQa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 12:30:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:37772 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729360AbgEDQa1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 12:30:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 542B4AE85;
        Mon,  4 May 2020 16:30:27 +0000 (UTC)
Message-ID: <a215710b20cad7792d427a79659650308e56562f.camel@suse.de>
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
Date:   Mon, 04 May 2020 18:30:23 +0200
In-Reply-To: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NqI+rUGeysOyvR1pZS0B"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-NqI+rUGeysOyvR1pZS0B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

I think this patch's description needs to be updated.

Regards,
Nicolas


--=-NqI+rUGeysOyvR1pZS0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wQyAACgkQlfZmHno8
x/4TtAf/XSqwkQ0qgudS8QOXk37BR/lYQYBsMo5rheQ49UL7PZFQI6t9era8fZjC
+RqaGc6/hCfrfSeOY3rIuoUHywGcIP1EJXK5OBTLYyCKJ2toXCp2cfjJWGNQiQ1W
RiMQ3YUq0n6ZxH45hwDposOKCrXnBirmcqBYUoiOEPtnuQyw7UrnHpDzwx+IItkk
xBMEzy9xkaEvE2dI4S2o7RHSyYPR/HeWBlnkb7wc2rAXwV1Dx2hVJexz25k5My6k
ZXQAY/+qTKcqNo0iqG4FU/oc40jOcY9Pgow5etHZuXONFh1Fz5VUOYJmblP9gfQx
gA24FoLvV6KqoHjv1nBeDoSP5q9OEA==
=9fDj
-----END PGP SIGNATURE-----

--=-NqI+rUGeysOyvR1pZS0B--

