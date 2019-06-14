Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B24458F3
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 11:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfFNJk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 05:40:26 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:43477 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfFNJkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 05:40:25 -0400
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id DAE44200017;
        Fri, 14 Jun 2019 09:40:15 +0000 (UTC)
Date:   Fri, 14 Jun 2019 11:41:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 02/10] [media] marvell-ccic: fix DMA s/g desc number
 calculation
Message-ID: <20190614094128.miryq2wfzoewjoyn@uno.localdomain>
References: <20190505140031.9636-1-lkundrak@v3.sk>
 <20190505140031.9636-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ql2b4spbiyittxev"
Content-Disposition: inline
In-Reply-To: <20190505140031.9636-3-lkundrak@v3.sk>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ql2b4spbiyittxev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Lubomir,

On Sun, May 05, 2019 at 04:00:23PM +0200, Lubomir Rintel wrote:
> The commit d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")
> left dma_desc_nent unset. It previously contained the number of DMA
> descriptors as returned from dma_map_sg().
>
> We can now (since the commit referred to above) obtain the same value from
> the sg_table and drop dma_desc_nent altogether.
>
> Tested on OLPC XO-1.75 machine. Doesn't affect the OLPC XO-1's Cafe
> driver, since that one doesn't do DMA.
>
> Fixes: d790b7eda953df474f470169ebdf111c02fa7a2d

Could you use the proper 'fixes' format here?
Fixes: d790b7eda953 ("[media] vb2-dma-sg: move dma_(un)map_sg here")

> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/media/platform/marvell-ccic/mcam-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index f1b301810260a..d97f39bde9bd6 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -200,7 +200,6 @@ struct mcam_vb_buffer {
>  	struct list_head queue;
>  	struct mcam_dma_desc *dma_desc;	/* Descriptor virtual address */
>  	dma_addr_t dma_desc_pa;		/* Descriptor physical address */
> -	int dma_desc_nent;		/* Number of mapped descriptors */
>  };
>
>  static inline struct mcam_vb_buffer *vb_to_mvb(struct vb2_v4l2_buffer *vb)
> @@ -608,9 +607,11 @@ static void mcam_dma_contig_done(struct mcam_camera *cam, int frame)
>  static void mcam_sg_next_buffer(struct mcam_camera *cam)
>  {
>  	struct mcam_vb_buffer *buf;
> +	struct sg_table *sg_table;
>
>  	buf = list_first_entry(&cam->buffers, struct mcam_vb_buffer, queue);
>  	list_del_init(&buf->queue);
> +	sg_table = vb2_dma_sg_plane_desc(&buf->vb_buf.vb2_buf, 0);
>  	/*
>  	 * Very Bad Not Good Things happen if you don't clear
>  	 * C1_DESC_ENA before making any descriptor changes.
> @@ -618,7 +619,7 @@ static void mcam_sg_next_buffer(struct mcam_camera *cam)
>  	mcam_reg_clear_bit(cam, REG_CTRL1, C1_DESC_ENA);
>  	mcam_reg_write(cam, REG_DMA_DESC_Y, buf->dma_desc_pa);
>  	mcam_reg_write(cam, REG_DESC_LEN_Y,
> -			buf->dma_desc_nent*sizeof(struct mcam_dma_desc));
> +			sg_table->nents*sizeof(struct mcam_dma_desc));

Space betwen operators (it was there already, I know).

Apart for that, patch seems fine to me:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j
>  	mcam_reg_write(cam, REG_DESC_LEN_U, 0);
>  	mcam_reg_write(cam, REG_DESC_LEN_V, 0);
>  	mcam_reg_set_bit(cam, REG_CTRL1, C1_DESC_ENA);
> --
> 2.21.0
>

--ql2b4spbiyittxev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0Da8gACgkQcjQGjxah
VjyjIA//aB6VR+v3fo5/SLTrcX/u5XTaLmejodO0ixfydaNeyjUXq5xajQ0aJ10y
0lXNLcsVgobjnI5MgEcd5cu4gZenlXWOqNfvGs67LOxqDj5l6jUHtVwEYrQTLjrt
/U084G5OlMFWc8WnUskjz9S9ELhlB72lXCFmGil7adsy82hoAQHJPtlNGO8R8Lf1
9uYV8bMWgP8AQ0pgRs4NAGuxzuIT+nbO0PSsSILpy0vywg8hYsHtO1Q3L205BNUR
yGjWvrqGtt+G9mAKIGH0eQzG2e+mbwSvzuGoqvYPu2WG+XZ6cp63AzdU4kZgU2BU
grIDfflb3FcovC4sJ9erGC3LluRI6JjLfp0ZXrQHfyutLgNS3upooisbU+/AU4Zj
FgQiOEzlITW+Y870eQFsVJQq7Fgc60+3cvagyLhXXdhr8CB6LWBM93ohbQj+fUDr
+t1LkcS0sK1pZmIk1tM5IPkOmyTVxTgWSAdBTcljAXqRG6U3DR05CREzyKvzLHec
YcY5/OIy5v8Z3vg1jVzO7XEW6s2NlGinH09QUZNNfeAl7UP1e3LQdoud2mNawbV4
h2P8G2izpXTyGAET0/slS53IglTrstaqa7kWUbEQDCrVVpuhUhjXNGNrFmjWBKDn
bsF2OBoMVWeB/GYIV/SyKeo3v4GdJuE9/EUJzmfUiEQneFF+JoI=
=6gOg
-----END PGP SIGNATURE-----

--ql2b4spbiyittxev--
