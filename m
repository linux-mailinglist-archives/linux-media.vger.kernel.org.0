Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F14CD11A7AF
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfLKJnT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 04:43:19 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57187 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbfLKJnT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 04:43:19 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A5F2E1BF204;
        Wed, 11 Dec 2019 09:43:16 +0000 (UTC)
Date:   Wed, 11 Dec 2019 10:45:24 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rcar-vin: Support V4L2_FIELD_SEQ_{TB,BT}
Message-ID: <20191211094524.5jruiyuftyh77z7a@uno.localdomain>
References: <20191210020559.170594-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wzszm6cgjwy6wcce"
Content-Disposition: inline
In-Reply-To: <20191210020559.170594-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--wzszm6cgjwy6wcce
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Dec 10, 2019 at 03:05:57AM +0100, Niklas S=C3=B6derlund wrote:
> Hi,
>
> This series add support for sequential filed formats to rcar-vin. The
> series is based on the media-tree and tested on both R-Car Gen2 and Gen3
> boards without regressions.
>
> Patch 1/2 prepares for the new filed formats by reworking and renaming
> an existing struct member while 2/2 adds support for the two new field
> formats.

Please try to add a changelog, otherwise I have to read my comments in v2
and manually check what has been addressed or not

>
> Niklas S=C3=B6derlund (2):
>   rcar-vin: Move hardware buffer tracking to own struct
>   rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
>
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 91 ++++++++++++++++-----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c |  5 ++
>  drivers/media/platform/rcar-vin/rcar-vin.h  | 28 ++++++-
>  3 files changed, 100 insertions(+), 24 deletions(-)
>
> --
> 2.24.0
>

--wzszm6cgjwy6wcce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3wurQACgkQcjQGjxah
VjzeAhAAt8Qg5K/pjxpoTkCq2qD2ZB71a2zOmPmotrIScjqCvKSOv6GJ/3Bx2GQD
brbVJDYoayN0EfmCN1HivUHroHRo3eYQie6Y6MAiYCoE2iIKvIv54tZArG7wB8M8
0XctJKcEQmp0Wzc8cyVqroyvW0SN+MfrxMnaSScfO/TLW4L5tzrgPcxKVVu3BcK0
S0V00HBJalmhUliupGaWmQ9urrbNfTi66B4Ne+DAtPqJzwnjKVuN4J8p0mdS7+Pi
fqbagWFxUy8+ylP7lUGlTqU1Fka691Fu1hA0HxTfLvjWZbNUSEIKYkgRtCRrsEI/
2iZlstxjkLJbK8/p7rHPBwnG/AP8i/ajtEeUrv/t6+U6uBilcY8+D7bK00hauR2W
vlJdARX0qZev9KeWqqdLahyd7bHgkFjlZKMlH1Y2WEvNsxGZmvTvgvggANnzcfn8
pCf3TJ/LRsPlfrbxDvR7btTpX141gRIdvavypAB0GuXW9BiAL+ERF8FceWE9xKQU
KDEJqAb+JVZiDzThSTyQmVdVf6/Z9mdVufSRPHMeltiYTgRR8e7/3iwuLiyGJLgX
YpUE2HVoCCJx/UurMGRLf0u2eEdi6JSyiEaSncEwEHtnpUhM3DXi8m8GaRFuVztK
Qv+uMWo3a3CyJPzVoz1J3nJ9p0o+1MMs0hRaIdtk05RJ43EtX1E=
=HfLo
-----END PGP SIGNATURE-----

--wzszm6cgjwy6wcce--
