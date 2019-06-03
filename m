Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A081F33516
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 18:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfFCQhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 12:37:19 -0400
Received: from mailoutvs42.siol.net ([185.57.226.233]:41050 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726463AbfFCQhT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 12:37:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id CE84852103D;
        Mon,  3 Jun 2019 18:37:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GZTcyyvsd1rj; Mon,  3 Jun 2019 18:37:15 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 38591521345;
        Mon,  3 Jun 2019 18:37:15 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Zimbra) with ESMTPA id C479752103D;
        Mon,  3 Jun 2019 18:37:14 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: cedrus: Improve H264 memory efficiency
Date:   Mon, 03 Jun 2019 18:37:14 +0200
Message-ID: <30580764.erAxqE4FcP@jernej-laptop>
In-Reply-To: <20190603122328.kczqsr4pza2ggvbk@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net> <20190530211516.1891-8-jernej.skrabec@siol.net> <20190603122328.kczqsr4pza2ggvbk@flea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 03. junij 2019 ob 14:23:28 CEST je Maxime Ripard napisal(a):
> On Thu, May 30, 2019 at 11:15:16PM +0200, Jernej Skrabec wrote:
> > H264 decoder driver preallocated pretty big worst case mv col buffer
> > pool. It turns out that pool is most of the time much bigger than it
> > needs to be.
> > 
> > Solution implemented here is to allocate memory only if capture buffer
> > is actually used and only as much as it is really necessary.
> > 
> > This is also preparation for 4K video decoding support, which will be
> > implemented later.
> 
> What is it doing exactly to prepare for 4k?

Well, with that change 4K videos can be actually watched with 256 MiB CMA 
pool, but I can drop this statement in next version.

I concentrated on 256 MiB CMA pool, because it's maximum memory size supported 
by older VPU versions, but I think they don't support 4K decoding. I don't 
have them, so I can't test that hypothesis.

> 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 -
> >  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 81 +++++++------------
> >  2 files changed, 28 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > 16c1bdfd243a..fcbbbef65494 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > @@ -106,10 +106,6 @@ struct cedrus_ctx {
> > 
> >  	union {
> >  	
> >  		struct {
> > 
> > -			void		*mv_col_buf;
> > -			dma_addr_t	mv_col_buf_dma;
> > -			ssize_t		mv_col_buf_field_size;
> > -			ssize_t		mv_col_buf_size;
> > 
> >  			void		*pic_info_buf;
> >  			dma_addr_t	pic_info_buf_dma;
> >  			void		*neighbor_info_buf;
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > b2290f98d81a..758fd0049e8f 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -54,17 +54,14 @@ static void cedrus_h264_write_sram(struct cedrus_dev
> > *dev,> 
> >  		cedrus_write(dev, VE_AVC_SRAM_PORT_DATA, *buffer++);
> >  
> >  }
> > 
> > -static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_ctx *ctx,
> > -					      unsigned int 
position,
> > +static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_buffer *buf,
> > 
> >  					      unsigned int 
field)
> >  
> >  {
> > 
> > -	dma_addr_t addr = ctx->codec.h264.mv_col_buf_dma;
> > -
> > -	/* Adjust for the position */
> > -	addr += position * ctx->codec.h264.mv_col_buf_field_size * 2;
> > +	dma_addr_t addr = buf->extra_buf_dma;
> > 
> >  	/* Adjust for the field */
> > 
> > -	addr += field * ctx->codec.h264.mv_col_buf_field_size;
> > +	if (field)
> > +		addr += buf->extra_buf_size / 2;
> > 
> >  	return addr;
> >  
> >  }
> > 
> > @@ -76,7 +73,6 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
> > 
> >  				struct cedrus_h264_sram_ref_pic 
*pic)
> >  
> >  {
> >  
> >  	struct vb2_buffer *vbuf = &buf->m2m_buf.vb.vb2_buf;
> > 
> > -	unsigned int position = buf->codec.h264.position;
> > 
> >  	pic->top_field_order_cnt = cpu_to_le32(top_field_order_cnt);
> >  	pic->bottom_field_order_cnt = cpu_to_le32(bottom_field_order_cnt);
> > 
> > @@ -84,10 +80,8 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
> > 
> >  	pic->luma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 
0));
> >  	pic->chroma_ptr = cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 
1));
> > 
> > -	pic->mv_col_top_ptr =
> > -		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 
0));
> > -	pic->mv_col_bot_ptr =
> > -		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 
1));
> > +	pic->mv_col_top_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 
0));
> > +	pic->mv_col_bot_ptr = cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 
1));
> > 
> >  }
> >  
> >  static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
> > 
> > @@ -142,6 +136,28 @@ static void cedrus_write_frame_list(struct cedrus_ctx
> > *ctx,> 
> >  	output_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
> >  	output_buf->codec.h264.position = position;
> > 
> > +	if (!output_buf->extra_buf_size) {
> > +		const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
> > +		unsigned int field_size;
> > +
> > +		field_size = DIV_ROUND_UP(ctx->src_fmt.width, 16) *
> > +			DIV_ROUND_UP(ctx->src_fmt.height, 16) * 16;
> > +		if (!(sps->flags & 
V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE))
> > +			field_size = field_size * 2;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			field_size = field_size * 2;
> > +
> > +		output_buf->extra_buf_size = field_size * 2;
> > +		output_buf->extra_buf =
> > +			dma_alloc_coherent(dev->dev,
> > +					   output_buf-
>extra_buf_size,
> > +					   &output_buf-
>extra_buf_dma,
> > +					   GFP_KERNEL);
> > +
> > +		if (!output_buf->extra_buf)
> > +			output_buf->extra_buf_size = 0;
> > +	}
> > +
> 
> That also means that instead of allocating that buffer exactly once,
> you now allocate it for each output buffer?

It's not completely the same. I'm allocating multiple times, yes, but much 
smaller chunks and only if needed.

Still, this slight overhead happens only when buffer is used for the first time. 
When buffer is reused, this MV buffer is also reused.

> 
> I guess that it will cleaned up by your previous patch at
> buffer_cleanup time, so after it's no longer a reference frame?

Yes, it will be deallocated in buffer_cleanup, but only after capture buffers 
are freed, which usually happens when device file descriptor is closed.

Buffers which holds reference frames are later reused, together with it's MV 
buffer, so there's no overhead.

> 
> What is the average memory usage before, and after that change during
> a playback, and what is the runtime cost of doing it multiple times
> instead of once?

As I already said, overhead is present only when buffer is used for the first 
time, which is not ideal, but allows to calculate minimal buffer size needed 
and even doesn't allocate anything if capture buffer is not used at all.

I didn't collect any exact numbers, but with this change I can play H264 and 
HEVC (with similar modification) 4K video samples with 256 MiB CMA pool. 
Without this change, it's not really possible. You can argue "but what if 4K 
video use 16 reference frames", then yes, only solution is to increase CMA 
pool, but why reserve extra memory which will never be used?

I've been using this optimization for past ~6 month with no issues noticed. If 
you feel better, I can change this to be a bit conservative and allocate MV 
buffer when buffer_init is called. This will consume a bit more memory as SPS is 
not available at that time (worst case buffer size estimation), but it still 
won't allocate MV buffers for unallocated capture frames.

Best regards,
Jernej


