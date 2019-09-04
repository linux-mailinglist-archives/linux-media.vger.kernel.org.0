Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C6CA8033
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 12:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfIDKRx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 06:17:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51021 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbfIDKRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 06:17:53 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5SMJ-0000g8-3X; Wed, 04 Sep 2019 12:17:51 +0200
Message-ID: <1567592270.3041.4.camel@pengutronix.de>
Subject: Re: [PATCH 3/4] media: hantro: Add helper for the H264 motion
 vectors allocation
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Date:   Wed, 04 Sep 2019 12:17:50 +0200
In-Reply-To: <20190903181711.7559-4-ezequiel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <20190903181711.7559-4-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-09-03 at 15:17 -0300, Ezequiel Garcia wrote:
> Introduce a helper to allow easier enablement of the post-processing
> feature. No functional changes intended.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h      | 6 ++++++
>  drivers/staging/media/hantro/hantro_v4l2.c | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index deb90ae37859..e8872f24e351 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -381,4 +381,10 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
>  	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>  }
>  
> +static inline unsigned int
> +hantro_h264_buffer_extra_size(unsigned int width, unsigned int height)
> +{
> +	return 128 * MB_WIDTH(width) * MB_HEIGHT(height);
> +}

This doesn't seem to be used or modified by patch 4 at all?

> +
>  #endif /* HANTRO_H_ */
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index d48b548842cf..59adecba0e85 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -246,8 +246,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  		 */
>  		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
>  			pix_mp->plane_fmt[0].sizeimage +=
> -				128 * DIV_ROUND_UP(pix_mp->width, 16) *
> -				      DIV_ROUND_UP(pix_mp->height, 16);
> +				hantro_h264_buffer_extra_size(pix_mp->width,
> +							      pix_mp->height);
>  	} else if (!pix_mp->plane_fmt[0].sizeimage) {
>  		/*
>  		 * For coded formats the application can specify

regards
Philipp
