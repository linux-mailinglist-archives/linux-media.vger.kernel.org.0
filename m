Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A186436EB6
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 10:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfFFIdU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 04:33:20 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:42799 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfFFIdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 04:33:20 -0400
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6C6F510001B;
        Thu,  6 Jun 2019 08:33:08 +0000 (UTC)
Date:   Thu, 6 Jun 2019 10:33:07 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: cedrus: Add infra for extra buffers connected
 to capture buffers
Message-ID: <20190606083307.b5zpk4n6x3w6mtmb@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-7-jernej.skrabec@siol.net>
 <20190603121859.sbphcjy75kmed6oc@flea>
 <3029072.frl2UAsRGt@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="llwlg2xtnnijika2"
Content-Disposition: inline
In-Reply-To: <3029072.frl2UAsRGt@jernej-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--llwlg2xtnnijika2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 05:48:25PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 03. junij 2019 ob 14:18:59 CEST je Maxime Ripard napisal(=
a):
> > > +static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_queue *vq =3D vb->vb2_queue;
> > > +
> > > +	if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
> > > +		struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vq);
> > > +		struct cedrus_buffer *cedrus_buf;
> > > +
> > > +		cedrus_buf =3D vb2_to_cedrus_buffer(vq->bufs[vb->index]);
> > > +
> > > +		if (cedrus_buf->extra_buf_size)
> > > +			dma_free_coherent(ctx->dev->dev,
> > > +					  cedrus_buf-
> >extra_buf_size,
> > > +					  cedrus_buf-
> >extra_buf,
> > > +					  cedrus_buf-
> >extra_buf_dma);
> > > +	}
> > > +}
> > > +
> >
> > I'm really not a fan of allocating something somewhere, and freeing it
> > somewhere else. Making sure you don't leak something is hard enough to
> > not have some non-trivial allocation scheme.
>
> Ok, what about introducing two new optional methods in engine callbacks,
> buffer_init and buffer_destroy, which would be called from cedrus_buf_ini=
t() and
> cedrus_buf_cleanup(), respectively. That way all (de)allocation logic sta=
ys
> within the same engine.

Yep, that would work for me.

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--llwlg2xtnnijika2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPjPwwAKCRDj7w1vZxhR
xfVpAQCOr8fs3rk1qqMT7K32xwhOKrfkpEzeOlKL8hYuHFgkPQEA+ZYtxUfOTSQu
8EDER1DVGqjSGhBpL356m0j1JSeHNgM=
=Hz+3
-----END PGP SIGNATURE-----

--llwlg2xtnnijika2--
