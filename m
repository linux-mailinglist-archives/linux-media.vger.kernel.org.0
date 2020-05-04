Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103121C3ED9
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 17:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgEDPog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 11:44:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:44428 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728021AbgEDPog (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 11:44:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 24999AFA9;
        Mon,  4 May 2020 15:44:36 +0000 (UTC)
Message-ID: <4bb8d41381004b02a1345f44165f6ad5b99f74ec.camel@suse.de>
Subject: Re: [PATCH v2 27/34] staging: vchiq: Use the old dma controller for
 OF config on platform devices
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
Date:   Mon, 04 May 2020 17:44:32 +0200
In-Reply-To: <20200504092611.9798-28-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-28-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-bhSj+tuO8H54oGJFMMJS"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-bhSj+tuO8H54oGJFMMJS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent, Dave,

On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>=20
> vchiq on Pi4 is no longer under the soc node, therefore it
> doesn't get the dma-ranges for the VPU.

This is not true in upstream's device-tree, and AFAIK, from a HW perspectiv=
e,
the VPU interface didn't change interconnects, it's still connected to /soc
(highlighted by the fact that it has its DMA limitations).

Why did you found the need to move vchiq into /scb downstream?

> Switch to using the configuration of the old dma controller as
> that will set the dma-ranges correctly.

Ultimately, this is no different than copying DMA constraints from, say, th=
e
I2C bus controller. The fact that this is a DMA controller has nothing to w=
ith
VPU's view of the system's memory (which dma-ranges symbolizes).

BTW, Laurent, I learned all about DMA trough one of your talks, it really
helped to set everything in place at the time :).

Regards,
Nicolas

> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c             | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 15ccd624aaab..d1a556f16499 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -2719,6 +2719,7 @@ vchiq_register_child(struct platform_device *pdev, =
const
> char *name)
>  {
>  	struct platform_device_info pdevinfo;
>  	struct platform_device *child;
> +	struct device_node *np;
> =20
>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
> =20
> @@ -2734,10 +2735,20 @@ vchiq_register_child(struct platform_device *pdev=
,
> const char *name)
>  	}
> =20
>  	/*
> -	 * We want the dma-ranges etc to be copied from the parent VCHIQ device
> -	 * to be passed on to the children too.
> +	 * We want the dma-ranges etc to be copied from a device with the
> +	 * correct dma-ranges for the VPU.
> +	 * VCHIQ on Pi4 is now under scb which doesn't get those dma-ranges.
> +	 * Take the "dma" node as going to be suitable as it sees the world
> +	 * through the same eyes as the VPU.
>  	 */
> -	of_dma_configure(&new_dev->dev, pdev->dev.of_node, true);
> +	np =3D of_find_node_by_path("dma");
> +	if (!np)
> +		np =3D pdev->dev.of_node;
> +
> +	of_dma_configure(&child->dev, np, true);
> +
> +	if (np !=3D pdev->dev.of_node)
> +		of_node_put(np);
> =20
>  	return child;
>  }


--=-bhSj+tuO8H54oGJFMMJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wOGEACgkQlfZmHno8
x/7CQQf+NZXJoC6+6D7D0KVm2kS/oC8Zrh37pWEaAMVufqVecVaJ9ADHQ5TJKkYR
AZnd6wDMu185ObBznfyLxKJCflmIftSyXyKDameryd4qYNmF3WhwZMDL2iW5DDnV
gdz/Ym2vFup5zl1ZL3mqNZYyOGX4aU1OMj6GgWKI/Y6p9JrHlh2/duXM5MWMcY/Y
nB4ojW90V5A01m0Us+yw5PrQYxkxx5Glj1FAJLx8LzshBbQ1IIEFsxexGCi7UQoq
415GC3wyIbI3jgikptHbrMuLAuQz//y5v4+KdaePzCnyr1YVj7Iw2ZJMHcKcG6xd
KjQbBeCMusd0DXzbMea58eQOxJ9N8g==
=APJn
-----END PGP SIGNATURE-----

--=-bhSj+tuO8H54oGJFMMJS--

