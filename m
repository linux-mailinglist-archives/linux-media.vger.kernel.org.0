Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A461336666
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfFEVKZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 17:10:25 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47155 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfFEVKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 17:10:24 -0400
X-Originating-IP: 93.29.109.196
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 802F8E0002;
        Wed,  5 Jun 2019 21:10:18 +0000 (UTC)
Message-ID: <e45ea296476b2966a3800552dae259d7117a7751.camel@bootlin.com>
Subject: Re: [PATCH 6/7] media: cedrus: Add infra for extra buffers
 connected to capture buffers
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 05 Jun 2019 23:10:17 +0200
In-Reply-To: <3029072.frl2UAsRGt@jernej-laptop>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
         <20190530211516.1891-7-jernej.skrabec@siol.net>
         <20190603121859.sbphcjy75kmed6oc@flea> <3029072.frl2UAsRGt@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le lundi 03 juin 2019 à 17:48 +0200, Jernej Škrabec a écrit :
> Dne ponedeljek, 03. junij 2019 ob 14:18:59 CEST je Maxime Ripard napisal(a):
> > Hi,
> > 
> > On Thu, May 30, 2019 at 11:15:15PM +0200, Jernej Skrabec wrote:
> > > H264 and HEVC engines need additional buffers for each capture buffer.
> > > H264 engine has this currently solved by allocating fixed size pool,
> > > which is not ideal. Most of the time pool size is much bigger than it
> > > needs to be.
> > > 
> > > Ideally, extra buffer should be allocated at buffer initialization, but
> > > that's not efficient. It's size in H264 depends on flags set in SPS, but
> > > that information is not available in buffer init callback.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > > 
> > >  drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 ++++
> > >  .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > > d8e6777e5e27..16c1bdfd243a 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > @@ -81,6 +81,10 @@ struct cedrus_run {
> > > 
> > >  struct cedrus_buffer {
> > >  
> > >  	struct v4l2_m2m_buffer          m2m_buf;
> > > 
> > > +	void		*extra_buf;
> > > +	dma_addr_t	extra_buf_dma;
> > > +	ssize_t		extra_buf_size;
> > > +
> > > 
> > >  	union {
> > >  	
> > >  		struct {
> > >  		
> > >  			unsigned int			position;
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_video.c index
> > > 681dfe3367a6..d756e0e69634 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > @@ -411,6 +411,24 @@ static void cedrus_queue_cleanup(struct vb2_queue
> > > *vq, u32 state)> 
> > >  	}
> > >  
> > >  }
> > > 
> > > +static void cedrus_buf_cleanup(struct vb2_buffer *vb)
> > > +{
> > > +	struct vb2_queue *vq = vb->vb2_queue;
> > > +
> > > +	if (!V4L2_TYPE_IS_OUTPUT(vq->type)) {
> > > +		struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
> > > +		struct cedrus_buffer *cedrus_buf;
> > > +
> > > +		cedrus_buf = vb2_to_cedrus_buffer(vq->bufs[vb->index]);
> > > +
> > > +		if (cedrus_buf->extra_buf_size)
> > > +			dma_free_coherent(ctx->dev->dev,
> > > +					  cedrus_buf-
> > extra_buf_size,
> > > +					  cedrus_buf-
> > extra_buf,
> > > +					  cedrus_buf-
> > extra_buf_dma);
> > > +	}
> > > +}
> > > +
> > 
> > I'm really not a fan of allocating something somewhere, and freeing it
> > somewhere else. Making sure you don't leak something is hard enough to
> > not have some non-trivial allocation scheme.
> 
> Ok, what about introducing two new optional methods in engine callbacks, 
> buffer_init and buffer_destroy, which would be called from cedrus_buf_init() and 
> cedrus_buf_cleanup(), respectively. That way all (de)allocation logic stays 
> within the same engine.

I'm thinking that we should have v4l2-framework-level per-codec helpers
to provide ops for these kinds of things, since they tend be quite
common across decoders.

Cheers,

Paul

