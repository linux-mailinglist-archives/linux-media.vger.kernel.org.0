Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77A5BD3BF3
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 11:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfJKJLJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Oct 2019 05:11:09 -0400
Received: from mailoutvs25.siol.net ([185.57.226.216]:53110 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726585AbfJKJLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 05:11:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 03E57521083;
        Fri, 11 Oct 2019 11:11:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id eqfg6fAq5YmG; Fri, 11 Oct 2019 11:11:06 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 9EB2252108F;
        Fri, 11 Oct 2019 11:11:06 +0200 (CEST)
Received: from jernej-laptop.localnet (unknown [89.216.49.66])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id EA4CB520BD8;
        Fri, 11 Oct 2019 11:11:05 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCHv3 7/8] media: cedrus: h264: Support multiple slices per frame
Date:   Fri, 11 Oct 2019 11:11:02 +0200
Message-ID: <9696944.LNMW5gGE19@jernej-laptop>
In-Reply-To: <20191010131152.68984-8-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl> <20191010131152.68984-8-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 10. oktober 2019 ob 15:11:51 CEST je Hans Verkuil napisal(a):
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> With recent changes, support for decoding multi-slice frames can be
> easily added now.
> 
> Signal VPU if current slice is first in frame or not and add information
> about first macroblock coordinates.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> d6a782703c9b..3ffb5494cff6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -301,6 +301,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
>  	dma_addr_t src_buf_addr;
>  	u32 offset = slice->header_bit_size;
>  	u32 len = (slice->size * 8) - offset;
> +	unsigned int pic_width_in_mbs;
> +	bool mbaff_pic;
>  	u32 reg;
> 
>  	cedrus_write(dev, VE_H264_VLD_LEN, len);
> @@ -370,12 +372,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
>  		reg |= VE_H264_SPS_DIRECT_8X8_INFERENCE;
>  	cedrus_write(dev, VE_H264_SPS, reg);
> 
> +	mbaff_pic = !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
> +		    (sps->flags & 
V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> +	pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
> +
>  	// slice parameters
>  	reg = 0;
> +	reg |= ((slice->first_mb_in_slice % pic_width_in_mbs) & 0xff) << 24;
> +	reg |= (((slice->first_mb_in_slice / pic_width_in_mbs) *
> +		 (mbaff_pic + 1)) & 0xff) << 16;
>  	reg |= decode->nal_ref_idc ? BIT(12) : 0;
>  	reg |= (slice->slice_type & 0xf) << 8;
>  	reg |= slice->cabac_init_idc & 0x3;
> -	reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
> +	if (run->first_slice)

Now that first_slice (ctx->fh.m2m_ctx->new_frame) flag depends on 
subsystem_flags, I think patch 7 and 8 should be merged, otherwise this patch 
won't work on it's own.

Best regards,
Jernej

> +		reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
>  	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
>  		reg |= VE_H264_SHS_FIELD_PIC;
>  	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)




