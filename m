Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F14D3D35B0
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhGWHIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:08:42 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:60759 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbhGWHIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:08:42 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CB6EE1BF205;
        Fri, 23 Jul 2021 07:49:12 +0000 (UTC)
Date:   Fri, 23 Jul 2021 09:49:12 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 03/13] media: i2c: Defer probe if not endpoint found
Message-ID: <YPp0eCIawk2TGQ6Z@aptenodytes>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="slgiAgGpNAwPPDiS"
Content-Disposition: inline
In-Reply-To: <20210722203407.3588046-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--slgiAgGpNAwPPDiS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu 22 Jul 21, 21:33, Daniel Scally wrote:
> The ov8865 driver is one of those that can be connected to a CIO2
> device by the cio2-bridge code. This means that the absence of an
> endpoint for this device is not necessarily fatal, as one might be
> built by the cio2-bridge when it probes. Return -EPROBE_DEFER if no
> endpoint is found rather than a fatal error.

Is this an error that you have actually seen in practice?

My understanding is that this function should return the handle to the *loc=
al*
fwnode graph endpoint, which relates to the static device-tree description
and should be unrelated to another driver probing.

So as far as I can see, this should not be needed (but correct me if I'm wr=
ong).

Cheers,

Paul

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov8865.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index 2ef146e7e7ef..66182142c28b 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2796,10 +2796,8 @@ static int ov8865_probe(struct i2c_client *client)
>  	/* Graph Endpoint */
> =20
>  	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> -	if (!handle) {
> -		dev_err(dev, "unable to find endpoint node\n");
> -		return -EINVAL;
> -	}
> +	if (!handle)
> +		return -EPROBE_DEFER;
> =20
>  	sensor->endpoint.bus_type =3D V4L2_MBUS_CSI2_DPHY;
> =20
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--slgiAgGpNAwPPDiS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmD6dHMACgkQ3cLmz3+f
v9G1Jgf9GNDyXph0+194du9GMYzYfiE9uT6e9UZGa+J8ExQNITtcudiCoYVdJYYz
/yql25CDVUtWdR2S8pt/bdwTtIX7hiAmeAMn/66fL+TGXf/FWwSevt29wg9xGhto
4j6VhX0YLIBmdfItPtajAYjC0YyCk6Ifkib/yOClgzwTTBXdRymHE8jTw8++sOfb
FxN+7OtFLN+g4u/re5CYe3FDH347Q05eBBssILwaAfnsuxbSGLVq3EclGxHqmMf6
92j2vCSe9euuGjbeNTrC05rGKJEos3bcmdCnAMby8Fs+N4s2CuAs+Hq9OKs89/L1
e1Qp6Bdm7m08m7dCE4MvNAoCQ8e6wg==
=IGHw
-----END PGP SIGNATURE-----

--slgiAgGpNAwPPDiS--
