Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12261C4190
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 19:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730401AbgEDRMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 13:12:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:57904 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730092AbgEDRMh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 13:12:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 288B9AC53;
        Mon,  4 May 2020 17:12:37 +0000 (UTC)
Message-ID: <ccd8ad49a699d9f8a4d77577eb76b4b281b17843.camel@suse.de>
Subject: Re: [PATCH v2 30/34] staging: vchiq_arm: Give vchiq children DT
 nodes
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>
Date:   Mon, 04 May 2020 19:12:33 +0200
In-Reply-To: <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
         <20200504092611.9798-31-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-xiv4Wya8vifKkT85HxxB"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-xiv4Wya8vifKkT85HxxB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil, Laurent,

On Mon, 2020-05-04 at 12:26 +0300, Laurent Pinchart wrote:
> From: Phil Elwell <phil@raspberrypi.com>
>=20
> vchiq kernel clients are now instantiated as platform drivers rather
> than using DT, but the children of the vchiq interface may still
> benefit from access to DT properties. Give them the option of a
> a sub-node of the vchiq parent for configuration and to allow
> them to be disabled.
>=20
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c
> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index dd3c8f829daa..2325ab825941 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -2734,12 +2734,20 @@ vchiq_register_child(struct platform_device *pdev=
,
> const char *name)
>  	pdevinfo.id =3D PLATFORM_DEVID_NONE;
>  	pdevinfo.dma_mask =3D DMA_BIT_MASK(32);
> =20
> +	np =3D of_get_child_by_name(pdev->dev.of_node, name);
> +
> +	/* Skip the child if it is explicitly disabled */
> +	if (np && !of_device_is_available(np))
> +		return NULL;

I think this is alright, although I'd reshufle the code a little so it look=
s
nicer:

+	/* Skip the child if it is explicitly disabled */
+	np =3D of_get_child_by_name(pdev->dev.of_node, name);
+	if (np && !of_device_is_available(np))
+		return NULL;

>  	child =3D platform_device_register_full(&pdevinfo);
>  	if (IS_ERR(child)) {
>  		dev_warn(&pdev->dev, "%s not registered\n", name);
>  		child =3D NULL;
>  	}
> =20
> +	child->dev.of_node =3D np;

Is this really needed? I'd rather have the parent's np (as commented in pat=
ch
26) as long as this is not a real device-tree defined platform device.

Regards,
Nicolas


--=-xiv4Wya8vifKkT85HxxB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl6wTQEACgkQlfZmHno8
x/7OLQf/Z+X4fq+pEsJXaMHeAH5A9cGBLakZTRBEQrRlds77ejBxDIng6OpnzkaY
1b0kvSNm0Ad+txrpelCUF1PqacLuL3ZZobZ4+Ds2Lg5Kggpa0HuIZaJkVCzRUjFd
zwM1lmT2ZgwLYAuou/FQGh2XxQmvCDbF81CydGJSBLUBh4MMQBe/+oGrNgCycL8P
E+ewfOnZtzOe/hzEm9ezGrugCyh9PCi0vLCKKLebcvKzYoNCwr5xev2uwNL+Dzch
2BLPyN/2B7QEfP7I0/DAmSn0p4OhhqTI7lrT/yFMiYMFafZHuF8Iix0tEkj+QeoP
4kA8mZPXUqvaGTV91VpFbJj7khypKw==
=9LZz
-----END PGP SIGNATURE-----

--=-xiv4Wya8vifKkT85HxxB--

