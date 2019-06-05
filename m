Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09D736707
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFEVwi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 5 Jun 2019 17:52:38 -0400
Received: from mailoutvs3.siol.net ([185.57.226.194]:35673 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726541AbfFEVwh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 17:52:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 970E952208F;
        Wed,  5 Jun 2019 23:52:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3s15YwTEOaZU; Wed,  5 Jun 2019 23:52:33 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1DAE05220CF;
        Wed,  5 Jun 2019 23:52:33 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D6D3F52208F;
        Wed,  5 Jun 2019 23:52:30 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>, wens@csie.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: cedrus: Add infra for extra buffers connected to capture buffers
Date:   Wed, 05 Jun 2019 23:52:30 +0200
Message-ID: <7799592.17q1oAZbP1@jernej-laptop>
In-Reply-To: <e45ea296476b2966a3800552dae259d7117a7751.camel@bootlin.com>
References: <20190530211516.1891-1-jernej.skrabec@siol.net> <3029072.frl2UAsRGt@jernej-laptop> <e45ea296476b2966a3800552dae259d7117a7751.camel@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sreda, 05. junij 2019 ob 23:10:17 CEST je Paul Kocialkowski napisal(a):
> Hi,
> 
> Le lundi 03 juin 2019 à 17:48 +0200, Jernej Škrabec a écrit :
> > Dne ponedeljek, 03. junij 2019 ob 14:18:59 CEST je Maxime Ripard 
napisal(a):
> > > Hi,
> > > 
> > > On Thu, May 30, 2019 at 11:15:15PM +0200, Jernej Skrabec wrote:
> > > > H264 and HEVC engines need additional buffers for each capture buffer.
> > > > H264 engine has this currently solved by allocating fixed size pool,
> > > > which is not ideal. Most of the time pool size is much bigger than it
> > > > needs to be.
> > > > 
> > > > Ideally, extra buffer should be allocated at buffer initialization,
> > > > but
> > > > that's not efficient. It's size in H264 depends on flags set in SPS,
> > > > but
> > > > that information is not available in buffer init callback.
> > > > 
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > ---
> > > > 
> > > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 ++++
> > > >  .../staging/media/sunxi/cedrus/cedrus_video.c | 19
> > > >  +++++++++++++++++++
> > > >  2 files changed, 23 insertions(+)
> > > > 
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > > > d8e6777e5e27..16c1bdfd243a 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > > @@ -81,6 +81,10 @@ struct cedrus_run {
> > > > 
> > > >  struct cedrus_buffer {
> > > >  
> > > >  	struct v4l2_m2m_buffer          m2m_buf;
> > > > 
> > > > +	void		*extra_buf;
> > > > +	dma_addr_t	extra_buf_dma;
> > > > +	ssize_t		extra_buf_size;
> > > > +
> > > > 
> > > >  	union {
> > > >  	
> > > >  		struct {
> > > >  		
> > > >  			unsigned int			position;
> > > > 
> > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> > > > 681dfe3367a6..d756e0e69634 100644
> > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > > @@ -411,6 +411,24 @@ static void cedrus_queue_cleanup(struct vb2_queue
> > > > *vq, u32 state)>
> > > > 
> > > >  	}
> > > >  
> > > >  }
> > > > 
> > > > +static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> > > > +{
> > > > +	struct vb2_queue *vq = vb->vb2_queue;
> > > > +
> > > > +	if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
> > > > +		struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
> > > > +		struct cedrus_buffer *cedrus_buf;
> > > > +
> > > > +		cedrus_buf = vb2_to_cedrus_buffer(vq->bufs[vb->index]);
> > > > +
> > > > +		if (cedrus_buf->extra_buf_size)
> > > > +			dma_free_coherent(ctx->dev->dev,
> > > > +					  cedrus_buf-
> > > 
> > > extra_buf_size,
> > > 
> > > > +					  cedrus_buf-
> > > 
> > > extra_buf,
> > > 
> > > > +					  cedrus_buf-
> > > 
> > > extra_buf_dma);
> > > 
> > > > +	}
> > > > +}
> > > > +
> > > 
> > > I'm really not a fan of allocating something somewhere, and freeing it
> > > somewhere else. Making sure you don't leak something is hard enough to
> > > not have some non-trivial allocation scheme.
> > 
> > Ok, what about introducing two new optional methods in engine callbacks,
> > buffer_init and buffer_destroy, which would be called from
> > cedrus_buf_init() and cedrus_buf_cleanup(), respectively. That way all
> > (de)allocation logic stays within the same engine.
> 
> I'm thinking that we should have v4l2-framework-level per-codec helpers
> to provide ops for these kinds of things, since they tend be quite
> common across decoders.

Isn't .buf_init and .buf_cleanup callbacks provided by struct vb2_ops meant 
for exactly that?

Related, but different topic. I managed to fix 10-bit HEVC support on H6, but 
when working in 8-bit mode, capture buffers have to be big enough to hold 
normal NV12 decoded image plus extra buffer for 2 bits of each pixel. VPU 
accepts only offset from destination buffer for this extra buffer instead of full 
address. How we will handle that? Override sizeimage when allocating? But 
there we don't have information if it's 10-bit video or not. As you can see, 
I'm not a fan of overallocating.

I suspect we will have even bigger issues when decoding 10-bit HEVC video in 
P010 format, which is the only 10-bit YUV format useable by DRM driver (not 
implemented yet). From what I know till now, VPU needs aforementioned 8-bit+2-
bit buffers (for decoding) and another one in which it rearranges samples in 
P010 format. But that has to be confirmed first.

Best regards,
Jernej


