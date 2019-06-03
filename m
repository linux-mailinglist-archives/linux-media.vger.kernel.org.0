Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E837732F68
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfFCMTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:19:15 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:34559 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfFCMTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 08:19:15 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4F98124001F;
        Mon,  3 Jun 2019 12:19:02 +0000 (UTC)
Date:   Mon, 3 Jun 2019 14:18:59 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: cedrus: Add infra for extra buffers connected
 to capture buffers
Message-ID: <20190603121859.sbphcjy75kmed6oc@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-7-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ymlpox2fd2kt5ivb"
Content-Disposition: inline
In-Reply-To: <20190530211516.1891-7-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ymlpox2fd2kt5ivb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, May 30, 2019 at 11:15:15PM +0200, Jernej Skrabec wrote:
> H264 and HEVC engines need additional buffers for each capture buffer.
> H264 engine has this currently solved by allocating fixed size pool,
> which is not ideal. Most of the time pool size is much bigger than it
> needs to be.
>
> Ideally, extra buffer should be allocated at buffer initialization, but
> that's not efficient. It's size in H264 depends on flags set in SPS, but
> that information is not available in buffer init callback.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 ++++
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index d8e6777e5e27..16c1bdfd243a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -81,6 +81,10 @@ struct cedrus_run {
>  struct cedrus_buffer {
>  	struct v4l2_m2m_buffer          m2m_buf;
>
> +	void		*extra_buf;
> +	dma_addr_t	extra_buf_dma;
> +	ssize_t		extra_buf_size;
> +
>  	union {
>  		struct {
>  			unsigned int			position;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 681dfe3367a6..d756e0e69634 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -411,6 +411,24 @@ static void cedrus_queue_cleanup(struct vb2_queue *vq, u32 state)
>  	}
>  }
>
> +static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq = vb->vb2_queue;
> +
> +	if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
> +		struct cedrus_buffer *cedrus_buf;
> +
> +		cedrus_buf = vb2_to_cedrus_buffer(vq->bufs[vb->index]);
> +
> +		if (cedrus_buf->extra_buf_size)
> +			dma_free_coherent(ctx->dev->dev,
> +					  cedrus_buf->extra_buf_size,
> +					  cedrus_buf->extra_buf,
> +					  cedrus_buf->extra_buf_dma);
> +	}
> +}
> +

I'm really not a fan of allocating something somewhere, and freeing it
somewhere else. Making sure you don't leak something is hard enough to
not have some non-trivial allocation scheme.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ymlpox2fd2kt5ivb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPUQMwAKCRDj7w1vZxhR
xZNaAP9V21ZWkOqlo7WZlTwBZOAkVOmATfNXoqclKE0qWtzOVAD8CPTJeCMOMixQ
jEzMAC7P8TCOrSNny9fgeSx7u+ReUwM=
=dENZ
-----END PGP SIGNATURE-----

--ymlpox2fd2kt5ivb--
