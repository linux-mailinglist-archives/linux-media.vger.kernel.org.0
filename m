Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36974E69CD
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 22:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfJ0V4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Oct 2019 17:56:51 -0400
Received: from mailoutvs44.siol.net ([185.57.226.235]:54073 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727135AbfJ0V4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Oct 2019 17:56:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 5A14A522815;
        Sun, 27 Oct 2019 22:56:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HL8mW0m7ZVtU; Sun, 27 Oct 2019 22:56:47 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id DE48C522841;
        Sun, 27 Oct 2019 22:56:46 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 8E24B52282D;
        Sun, 27 Oct 2019 22:56:45 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-sunxi@googlegroups.com
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH 4/4] media: cedrus: hevc: Add support for multiple slices
Date:   Sun, 27 Oct 2019 22:56:45 +0100
Message-ID: <3093393.es1Za2YUDY@jernej-laptop>
In-Reply-To: <20191026174703.1120023-5-jernej.skrabec@siol.net>
References: <20191026174703.1120023-1-jernej.skrabec@siol.net> <20191026174703.1120023-5-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sobota, 26. oktober 2019 ob 19:47:03 CET je Jernej Skrabec napisal(a):
> Now that segment address is available, support for multi-slice frames
> can be easily added.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 21 +++++++++++++++----
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> 888bfd5ca224..e909adf6f30f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -366,15 +366,28 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  	reg = VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
>  	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
> 
> -	/* Coding tree block address: start at the beginning. */
> +	/* Coding tree block address */
>  	reg = VE_DEC_H265_DEC_CTB_ADDR_X(0) | 
VE_DEC_H265_DEC_CTB_ADDR_Y(0);
> +	if (!ctx->fh.m2m_ctx->new_frame) {

There is no reason why would this block be guarded by above if clause. I'll 
remove it in next revision. However, it uncovered a bug where new_frame is set 
to true for every slice. I have to debug this further. At this point I can't 
say for sure if it is in kernel or in ffmpeg.

Best regards,
Jernej

> +		unsigned int log2_max_luma_coding_block_size =
> +			sps->log2_min_luma_coding_block_size_minus3 + 
3 +
> +			sps->log2_diff_max_min_luma_coding_block_size;
> +		unsigned int ctb_size_luma =
> +			1UL << log2_max_luma_coding_block_size;
> +		unsigned int width_in_ctb_luma =
> +			DIV_ROUND_UP(sps->pic_width_in_luma_samples, 
ctb_size_luma);
> +
> +		reg = VE_DEC_H265_DEC_CTB_ADDR_X(slice_params-
>slice_segment_addr %
> width_in_ctb_luma); +		reg |=
> VE_DEC_H265_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr /
> width_in_ctb_luma); +	}
>  	cedrus_write(dev, VE_DEC_H265_DEC_CTB_ADDR, reg);
> 
>  	cedrus_write(dev, VE_DEC_H265_TILE_START_CTB, 0);
>  	cedrus_write(dev, VE_DEC_H265_TILE_END_CTB, 0);
> 
>  	/* Clear the number of correctly-decoded coding tree blocks. */
> -	cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
> +	if (ctx->fh.m2m_ctx->new_frame)
> +		cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
> 
>  	/* Initialize bitstream access. */
>  	cedrus_write(dev, VE_DEC_H265_TRIGGER, 
VE_DEC_H265_TRIGGER_INIT_SWDEC);
> @@ -523,8 +536,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
>  				
V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT,
>  				pps->flags);
> 
> -	/* FIXME: For multi-slice support. */
> -	reg |= 
VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
> +	if (ctx->fh.m2m_ctx->new_frame)
> +		reg |= 
VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
> 
>  	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO0, reg);
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> 15cf1f10221b..497b1199d3fe 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -311,6 +311,7 @@ static int cedrus_s_fmt_vid_out(struct file *file, void
> *priv,
> 
>  	switch (ctx->src_fmt.pixelformat) {
>  	case V4L2_PIX_FMT_H264_SLICE:
> +	case V4L2_PIX_FMT_HEVC_SLICE:
>  		vq->subsystem_flags |=
>  			VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
>  		break;




