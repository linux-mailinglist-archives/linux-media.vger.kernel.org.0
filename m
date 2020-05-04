Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F531C408B
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 18:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgEDQyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 12:54:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:49966 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729540AbgEDQyj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 12:54:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 07244AC53;
        Mon,  4 May 2020 16:54:36 +0000 (UTC)
Message-ID: <078d57964f47ea29af3b8ab0af65c244a158e9b1.camel@suse.de>
Subject: Re: [PATCH v2 26/34] staging: vchiq_arm: Set up dma ranges on child
 devices
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
Date:   Mon, 04 May 2020 18:54:32 +0200
In-Reply-To: <20200504092611.9798-27-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-27-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-NnllMnUJX9eO3ojhXSix"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-NnllMnUJX9eO3ojhXSix
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> The VCHIQ driver now loads the audio, camera, codec, and vc-sm
> drivers as platform drivers. However they were not being given
> the correct DMA configuration.
>=20
> Call of_dma_configure with the parent (VCHIQ) parameters to be
> inherited by the child.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index c5c7af28c1c8..15ccd624aaab 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -2733,6 +2733,12 @@ vchiq_register_child(struct platform_device *pdev,
> const char *name)
>  		child =3D NULL;
>  	}
> =20
> +	/*
> +	 * We want the dma-ranges etc to be copied from the parent VCHIQ device
> +	 * to be passed on to the children too.
> +	 */
> +	of_dma_configure(&new_dev->dev, pdev->dev.of_node, true);

I think you could use struct platform_device_info's of_node_reused. See pat=
ch
908f6fc3a1405 ('usb: musb: sunxi: propagate devicetree node to glue pdev') =
for
an example. AFAIK of_dma_configure() is only to be used in bus code, and th=
ere
has been a huge effort in the past to make sure it says as such. With a pro=
per
fwnode set of_dma_configure() will be called during the device's probe.

Regards,
Nicolas


--=-NnllMnUJX9eO3ojhXSix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wSMgACgkQlfZmHno8
x/65Lgf+IcQLwglon1Fx2hAjEgn6ynA+b2aVSZKV1G7+7hGXlUcX8kxllSdg3Dfq
L5bhevZOc/3RaGLSnXaOwKWT4HO25uVKJ2ca422avBbRCxeKl8f7hHxyhqfyuMfe
+uxtcg5C6jCGasD3/9B39c6Fmn+JlnS3TiLCKUt3GylnAvk3jkbqvYdlOem8shSv
DEDlHaBSZMwdCGpF66XZlYzBiM7xALd/gp1UUZIS1OK/SeyB0+UipQ/UEODDq4mv
RnOoRdzTFsvIrLxjUPJFPjXgQpS7FRaX8pAF+xdDhHhPonltFcXhKT4smsQ3zEmf
at/UxAzOPilsed2rPtdUUBw2pASThg==
=CqLe
-----END PGP SIGNATURE-----

--=-NnllMnUJX9eO3ojhXSix--

