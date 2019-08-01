Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339F27D5FC
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 09:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfHAHEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 03:04:15 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36113 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfHAHEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 03:04:15 -0400
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 583F4100012;
        Thu,  1 Aug 2019 07:04:10 +0000 (UTC)
Date:   Thu, 1 Aug 2019 09:04:10 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hertz Wong <hertz.wong@rock-chips.com>
Subject: Re: [PATCH 7/9] media: hantro: Add core bits to support H264 decoding
Message-ID: <20190801070410.GA22382@aptenodytes>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
 <20190619121540.29320-8-boris.brezillon@collabora.com>
 <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <CAHD77HksotqFBTE84rRM=DuNFX=YJPs=YnsuFkaN-pWUNCtoxA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 01 Aug 19, 13:06, Tomasz Figa wrote:
> Hi Boris,
>=20
> On Wed, Jun 19, 2019 at 9:15 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> [snip]
> > @@ -533,10 +535,21 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned=
 int *num_buffers,
> >                 return -EINVAL;
> >         }
> >
> > +       /* The H264 decoder needs extra size on the output buffer. */
> > +       if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE_RAW)
> > +               extra_size0 =3D 128 * DIV_ROUND_UP(pixfmt->width, 16) *
> > +                             DIV_ROUND_UP(pixfmt->height, 16);
> > +
>=20
> I wonder if this shouldn't be accounted for already in the sizeimage
> returned by TRY_/S_FMT, so that the application can know the required
> buffer size if it uses some external allocator and DMABUF memory type.
> I know we had it like this in our downstream code, but it wasn't the
> problem because we use minigbm, where we explicitly add the same
> padding in the rockchip backend. Any thoughts?

Does the extra size have to be allocated along with the buffer?

On cedrus, we have a need for a similar side-buffer but give it a dedicated=
 CMA
allocation, which should allow dma-buf-imported buffers.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl1CjukACgkQ3cLmz3+f
v9E6+wf+OYHawgm5Z7vHIOssrL6TF8ZV3xNsgqTT2Je54KLFCRbarBvD2HyB8nFc
pSPCrxiELvO1Tio+KYCoYz2Xve0PlzdxiBq1zbEYnzb8k95YbZnOMb2Vj90ZLPNm
FPpXE5VrVih6v5T3qgtqBNjaYRHOHLztiWoHRbRshiWxEPvzreD/Hfyawe4LbsJ6
dnzSPh8DvV46LsjnYe4rskINbfEkxEk7VtBynQ9CucYaZ2O8xXKYVQk5D/XkNhtm
48LgrQQJ2QrZH6Qed+We9pqBhOUH/in49PdD+UGN054dLBHT86nVc+0dbfJQW87N
jwHDYAmZKitBd74E4nNs5DQeWXCfig==
=h/ad
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
