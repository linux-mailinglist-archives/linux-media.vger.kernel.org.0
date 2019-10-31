Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1460BEACE4
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfJaJxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:53:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45718 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbfJaJxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:53:10 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1502C278253;
        Thu, 31 Oct 2019 09:53:09 +0000 (GMT)
Date:   Thu, 31 Oct 2019 10:53:06 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] media: hantro: Remove now unused H264 pic_size
Message-ID: <20191031105306.5e3fb4c5@collabora.com>
In-Reply-To: <HE1PR06MB4011F0A6FB7B474D16DD7957AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB4011F0A6FB7B474D16DD7957AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:51 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> pic_size in hantro_h264_dec_hw_ctx struct is no longer used,
> lets remove it.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_h264.c | 5 -----
>  drivers/staging/media/hantro/hantro_hw.h   | 3 ---
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> index 694a330f508e..568640eab3a6 100644
> --- a/drivers/staging/media/hantro/hantro_h264.c
> +++ b/drivers/staging/media/hantro/hantro_h264.c
> @@ -618,7 +618,6 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
>  	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
>  	struct hantro_aux_buf *priv = &h264_dec->priv;
>  	struct hantro_h264_dec_priv_tbl *tbl;
> -	struct v4l2_pix_format_mplane pix_mp;
>  
>  	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
>  				       GFP_KERNEL);
> @@ -629,9 +628,5 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
>  	tbl = priv->cpu;
>  	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
>  
> -	v4l2_fill_pixfmt_mp(&pix_mp, ctx->dst_fmt.pixelformat,
> -			    ctx->dst_fmt.width, ctx->dst_fmt.height);
> -	h264_dec->pic_size = pix_mp.plane_fmt[0].sizeimage;
> -
>  	return 0;
>  }
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 69b88f4d3fb3..fa91dd1848b7 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -80,15 +80,12 @@ struct hantro_h264_dec_reflists {
>   * @dpb:	DPB
>   * @reflists:	P/B0/B1 reflists
>   * @ctrls:	V4L2 controls attached to a run
> - * @pic_size:	Size in bytes of decoded picture, this is needed
> - *		to pass the location of motion vectors.
>   */
>  struct hantro_h264_dec_hw_ctx {
>  	struct hantro_aux_buf priv;
>  	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
>  	struct hantro_h264_dec_reflists reflists;
>  	struct hantro_h264_dec_ctrls ctrls;
> -	size_t pic_size;
>  };
>  
>  /**

