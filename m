Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F1E1CE3C4
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730974AbgEKTTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:19:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:36912 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728613AbgEKTTN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:19:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2B5D4AEE7;
        Mon, 11 May 2020 19:19:14 +0000 (UTC)
Message-ID: <8e45d7059c0f840e1661547a23103f3351c74622.camel@suse.de>
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835
 ISP
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 11 May 2020 21:19:09 +0200
In-Reply-To: <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-pEyVyxX6OgqwpV6jID33"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-pEyVyxX6OgqwpV6jID33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naushir,
a small comment.

On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> From: Naushir Patuck <naush@raspberrypi.com>
>=20
> Port the V4L2 compatible driver for the ISP unit found on Broadcom BCM283=
5
> chips.
>=20
> The driver interfaces though the VideoCore unit using the VCHIQ MMAL
> interface.
>=20
> ISP driver upported from from RaspberryPi BSP at revision:
> 6c3505be6c3e ("staging: vc04_services: isp: Make all references to
> bcm2835_isp_fmt const")
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> [Adapt to staging by moving all modifications that in the BSP are scatter=
ed
> in core components inside this directory]
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---

[...]

> +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> +{
> +	mmal_vchi_buffer_cleanup(mmal_buf);
> +
> +	if (mmal_buf->dma_buf) {
> +		dma_buf_put(mmal_buf->dma_buf);
> +		mmal_buf->dma_buf =3D NULL;

Why is this needed here, shouldn't this be mmal-vchi's responsibility? IIUC=
 the
original dma_buf_get() happens there too.

Regards,
Nicolas



--=-pEyVyxX6OgqwpV6jID33
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl65pS0ACgkQlfZmHno8
x/7idwgAje3kedgX0p5aSBWzYgq4IRoHq1hkWz9bm56gmK6XUvxz22zeU0jMJdF/
GxwrSM1Y6jBpxdOd4N1Dkv2cWldEhfZY/CtP/ys+GMmSD5yw79iDeLheop1McX4x
noEKpomw90NA1QYrUVGviSkElDNRuDZOuQbyngvXEUn7bDaCtBKyRHZgVTP0amv3
Jqm0rGkjfRE2d8+Fbjnz+o4zaNNFs6tM0v/7rJT8dyXvFVUwO9dphJSNK8G5fgAD
oVSYHLkjBiS2rYfNNUN1ZzMyDapf9iX6sfkjunU6dXxLtw471gUGjtSS1cRMFFjW
MEm9K23ZyEo/8K/orQokfNUbqFPYxg==
=DnPs
-----END PGP SIGNATURE-----

--=-pEyVyxX6OgqwpV6jID33--

