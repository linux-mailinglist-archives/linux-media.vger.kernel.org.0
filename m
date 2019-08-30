Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CFDA2F2B
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 07:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfH3FsN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 30 Aug 2019 01:48:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42244 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfH3FsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 01:48:12 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E83A528D773;
        Fri, 30 Aug 2019 06:48:09 +0100 (BST)
Date:   Fri, 30 Aug 2019 07:48:06 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 5/8] media: cedrus: Detect first slice of a frame
Message-ID: <20190830074806.78a2b8b4@collabora.com>
In-Reply-To: <3132748.mYbjOY1tKM@jernej-laptop>
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
        <20190822194500.2071-6-jernej.skrabec@siol.net>
        <20190826202831.311c7c20@collabora.com>
        <3132748.mYbjOY1tKM@jernej-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 29 Aug 2019 21:04:28 +0200
Jernej Škrabec <jernej.skrabec@siol.net> wrote:

> Dne ponedeljek, 26. avgust 2019 ob 20:28:31 CEST je Boris Brezillon 
> napisal(a):
> > Hi Jernej,
> > 
> > On Thu, 22 Aug 2019 21:44:57 +0200
> > 
> > Jernej Skrabec <jernej.skrabec@siol.net> wrote:  
> > > When codec supports multiple slices in one frame, VPU has to know when
> > > first slice of each frame is being processed, presumably to correctly
> > > clear/set data in auxiliary buffers.
> > > 
> > > Add first_slice field to cedrus_run structure and set it according to
> > > timestamps of capture and output buffers. If timestamps are different,
> > > it's first slice and viceversa.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > > 
> > >  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
> > >  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 2 ++
> > >  2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > > 2f017a651848..32cb38e541c6 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > > @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
> > > 
> > >  struct cedrus_run {
> > >  
> > >  	struct vb2_v4l2_buffer	*src;
> > >  	struct vb2_v4l2_buffer	*dst;
> > > 
> > > +	bool first_slice;
> > > 
> > >  	union {
> > >  	
> > >  		struct cedrus_h264_run	h264;
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > > 56ca4c9ad01c..d7b54accfe83 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > > @@ -31,6 +31,8 @@ void cedrus_device_run(void *priv)
> > > 
> > >  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > >  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > 
> > > +	run.first_slice =
> > > +		run.src->vb2_buf.timestamp != run.dst-  
> >vb2_buf.timestamp;
> > 
> > Can't we use slice->first_mb_in_slice to determine if a slice is the
> > first? I'd expect ->first_mb_in_slice to be 0 (unless we decide to
> > support ASO).  
> 
> I looked in all VPU documentation available to me (which isn't much) and there 
> is no indication if ASO is supported or not. Do you have any sample video with 
> out-of-order slices? It's my understanding that this is uncommon.

I'm not entirely sure, but my understanding was that it might be used
when streaming over network where some packets might be lost and
re-emitted later on.

> If it's 
> supported, I would leave code as-is.

I remember seeing the ASO acronym mentioned in the hantro G1 spec, but
at the same time we're doing frame-based decoding, so I guess the HW
block expects slices to be ordered in that case. Honestly I don't know,
so let's keep the code as-is.
