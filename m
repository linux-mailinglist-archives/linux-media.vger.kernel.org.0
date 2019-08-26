Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACC29D5FF
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 20:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732007AbfHZSsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 14:48:07 -0400
Received: from mailoutvs2.siol.net ([185.57.226.193]:38889 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727822AbfHZSsH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 14:48:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A3AF252502C;
        Mon, 26 Aug 2019 20:48:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id XAiW7Ff-hBd0; Mon, 26 Aug 2019 20:48:02 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 08F0E522D89;
        Mon, 26 Aug 2019 20:48:02 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 54683524F76;
        Mon, 26 Aug 2019 20:47:58 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        acourbot@chromium.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH 5/8] media: cedrus: Detect first slice of a frame
Date:   Mon, 26 Aug 2019 20:47:57 +0200
Message-ID: <3859967.Y0CYr1sFaX@jernej-laptop>
In-Reply-To: <20190826202831.311c7c20@collabora.com>
References: <20190822194500.2071-1-jernej.skrabec@siol.net> <20190822194500.2071-6-jernej.skrabec@siol.net> <20190826202831.311c7c20@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne ponedeljek, 26. avgust 2019 ob 20:28:31 CEST je Boris Brezillon 
napisal(a):
> Hi Jernej,
> 
> On Thu, 22 Aug 2019 21:44:57 +0200
> 
> Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> > When codec supports multiple slices in one frame, VPU has to know when
> > first slice of each frame is being processed, presumably to correctly
> > clear/set data in auxiliary buffers.
> > 
> > Add first_slice field to cedrus_run structure and set it according to
> > timestamps of capture and output buffers. If timestamps are different,
> > it's first slice and viceversa.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
> >  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 2 ++
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> > 2f017a651848..32cb38e541c6 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> > @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
> > 
> >  struct cedrus_run {
> >  
> >  	struct vb2_v4l2_buffer	*src;
> >  	struct vb2_v4l2_buffer	*dst;
> > 
> > +	bool first_slice;
> > 
> >  	union {
> >  	
> >  		struct cedrus_h264_run	h264;
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> > 56ca4c9ad01c..d7b54accfe83 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> > @@ -31,6 +31,8 @@ void cedrus_device_run(void *priv)
> > 
> >  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> >  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > 
> > +	run.first_slice =
> > +		run.src->vb2_buf.timestamp != run.dst-
>vb2_buf.timestamp;
> 
> Can't we use slice->first_mb_in_slice to determine if a slice is the
> first? I'd expect ->first_mb_in_slice to be 0 (unless we decide to
> support ASO).

I'm not sure if that is always the case, I would have to check the standard. 
Anyway, this method of comparing timestamps was suggested to me a while ago 
when we were discussing details on a way forward for multi-slice decoding. I 
highly doubt someone would decode slices in mixed order (from different frames) 
in same instance.

I can change that in next version if ->first_mb_in_slice == 0 is always true 
for the first slice.

Best regards,
Jernej

> 
> >  	/* Apply request(s) controls if needed. */
> >  	src_req = run.src->vb2_buf.req_obj.req;




