Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42504C9440
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 00:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfJBWXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 18:23:14 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37749 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfJBWXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 18:23:14 -0400
X-Originating-IP: 132.205.230.6
Received: from aptenodytes (unknown [132.205.230.6])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1D20E60002;
        Wed,  2 Oct 2019 22:23:09 +0000 (UTC)
Date:   Wed, 2 Oct 2019 18:23:07 -0400
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: cedrus: improvements
Message-ID: <20191002222307.GD24151@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <20191002193553.1633467-1-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> This is continuation of https://lkml.org/lkml/2019/5/30/1459 with several
> patches removed (2 merged, others needs redesign) and one added.

Thanks for the continued effort on this, these fixes are greatly appreciated
(and more generally, all the work you are putting into cedrus)!

Although I've been out of the loop on cedrus, it is very nice to see
development happening. Keep up the good work!

Cheers,

Paul

> Patch 1 fixes h264 playback issue which happens in rare cases.
>=20
> Patch 2 sets PPS default reference index count in register from PPS
> control. Currently it was set to values from slice control.
>=20
> Patch 3 replaces direct accesses to capture queue from m2m contex with
> helpers which was designed exactly for that. It's also safer since
> helpers do some checks.
>=20
> Best regards,
> Jernej
>=20
> Jernej Skrabec (3):
>   media: cedrus: Fix decoding for some H264 videos
>   media: cedrus: Fix H264 default reference index count
>   media: cedrus: Use helpers to access capture queue
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  8 +++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++-----
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
>  3 files changed, 44 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.23.0
>=20

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2VI0sACgkQ3cLmz3+f
v9EcCQf/dp1ZJ98xtDjBSFeOTicLLmTSYPEL4psHHVW8+VSMna6ZSZtO4ClTTBGZ
tDrKjeCHhy0yri5j2/e+adLJP/qa0IMu0/5Nmoe7Tr6VN2DztUUjfGs50+l4ZcOF
M9Zyuy18MuRWDflAksGRfp49eiH8vPKWbY8svsunL3SDPF+WWtuIjpUBwArhk7vH
Xm5NG55KJdbb2rUd/DhGzgueb1eZQ3EVQe25wNL3RozTeZB03IrNSaRz+QqAVCm/
rAFWSYJn+RzrVKmGa1/LpT8UwzNJ6oXlpX8M6jHnN/OicIXEMzyXy1xQVgJCYMT8
9PbndGZKpiunBcFHh64bHoPk5Fn5gg==
=jxCu
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
