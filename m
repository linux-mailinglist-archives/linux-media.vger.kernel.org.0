Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17028A96EE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 01:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbfIDXOl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 4 Sep 2019 19:14:41 -0400
Received: from mailoutvs5.siol.net ([185.57.226.196]:54364 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728286AbfIDXOl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 19:14:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id D7476520A46;
        Thu,  5 Sep 2019 01:14:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FM58iBnMidPl; Thu,  5 Sep 2019 01:14:37 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 38A985208D8;
        Thu,  5 Sep 2019 01:14:37 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 76204520A32;
        Thu,  5 Sep 2019 01:14:34 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        mripard@kernel.org, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 7/8] media: cedrus: Add support for holding capture buffer
Date:   Thu, 05 Sep 2019 01:14:34 +0200
Message-ID: <2397760.v9PcElvEDa@jernej-laptop>
In-Reply-To: <f105990c-e059-6bdd-433f-074388e3a2dc@xs4all.nl>
References: <20190822194500.2071-1-jernej.skrabec@siol.net> <20190822194500.2071-8-jernej.skrabec@siol.net> <f105990c-e059-6bdd-433f-074388e3a2dc@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 29. avgust 2019 ob 13:23:29 CEST je Hans Verkuil napisal(a):
> On 8/22/19 9:44 PM, Jernej Skrabec wrote:
> > When frame contains multiple slices and driver works in slice mode, it's
> > more efficient to hold capture buffer in queue until all slices of a
> > same frame are decoded.
> > 
> > Add support for that to Cedrus driver by exposing and implementing
> > V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF capability.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus_dec.c   | 9 +++++++++
> >  drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 8 +++++---
> >  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 1 +
> >  3 files changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > d7b54accfe83..68462b99750e 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > @@ -31,6 +31,14 @@ void cedrus_device_run(void *priv)
> > 
> >  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> >  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > 
> > +
> > +	if (v4l2_m2m_release_capture_buf(run.src, run.dst)) {
> > +		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +		v4l2_m2m_buf_done(run.dst, VB2_BUF_STATE_DONE);
> > +		run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +	}
> > +	run.dst->is_held = run.src->flags & 
V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
> > +
> > 
> >  	run.first_slice =
> >  	
> >  		run.src->vb2_buf.timestamp != run.dst-
>vb2_buf.timestamp;
> > 
> > @@ -46,6 +54,7 @@ void cedrus_device_run(void *priv)
> > 
> >  			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
> >  		
> >  		run.mpeg2.quantization = cedrus_find_control_data(ctx,
> >  		
> >  			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
> > 
> > +		run.dst->is_held = false;
> > 
> >  		break;
> >  	
> >  	case V4L2_PIX_FMT_H264_SLICE:
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> > a942cd9bed57..99fedec80224 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> > @@ -122,7 +122,7 @@ static irqreturn_t cedrus_irq(int irq, void *data)
> > 
> >  	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
> >  	
> >  	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > 
> > -	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > 
> >  	if (!src_buf || !dst_buf) {
> >  	
> >  		v4l2_err(&dev->v4l2_dev,
> > 
> > @@ -136,8 +136,10 @@ static irqreturn_t cedrus_irq(int irq, void *data)
> > 
> >  		state = VB2_BUF_STATE_DONE;
> >  	
> >  	v4l2_m2m_buf_done(src_buf, state);
> > 
> > -	v4l2_m2m_buf_done(dst_buf, state);
> > -
> > +	if (!dst_buf->is_held) {
> > +		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +		v4l2_m2m_buf_done(dst_buf, state);
> > +	}
> > 
> >  	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
> >  	
> >  	return IRQ_HANDLED;
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> > eeee3efd247b..5153b2bba21e 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -515,6 +515,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue
> > *src_vq,> 
> >  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> >  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> >  	src_vq->drv_priv = ctx;
> > 
> > +	src_vq->subsystem_flags = 
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF;
> 
> This isn't quite right: this flag should only be set for formats that
> support slicing. So cedrus_s_fmt_vid_out() should set this for H264, but
> clear it for MPEG2.
> 
> Looking at the cedrus code it seems that it does not set an initial default
> output format after opening the video device. This seems wrong to me. If it
> did set a default output format, then src_vq->subsystem_flags should set
> this flag corresponding to the default output format.

Ok, I'll base v2 series on your "cedrus: v4l2-compliance fixes", because it has 
some useful changes for this case.

Best regards,
Jernej

> 
> >  	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
> >  	src_vq->min_buffers_needed = 1;
> >  	src_vq->ops = &cedrus_qops;
> 
> Regards,
> 
> 	Hans




