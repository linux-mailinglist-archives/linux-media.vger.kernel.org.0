Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B961EFEB7
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgFER0Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 5 Jun 2020 13:26:25 -0400
Received: from mailoutvs50.siol.net ([185.57.226.241]:34137 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726939AbgFER0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:26:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 33D78521D26;
        Fri,  5 Jun 2020 19:26:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Hkdlf3xJ94FU; Fri,  5 Jun 2020 19:26:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C0F03521D2D;
        Fri,  5 Jun 2020 19:26:21 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id C2B65521CA7;
        Fri,  5 Jun 2020 19:26:20 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, mripard@kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, jonas@kwiboo.se,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: cedrus: h264: Properly configure reference field
Date:   Fri, 05 Jun 2020 19:26:20 +0200
Message-ID: <2479507.UA2pHCgT9S@jernej-laptop>
In-Reply-To: <7e74e15b7b3f9fc765182f1a43cfcf1e0e9602fc.camel@ndufresne.ca>
References: <20200604185745.23568-1-jernej.skrabec@siol.net> <20200604185745.23568-3-jernej.skrabec@siol.net> <7e74e15b7b3f9fc765182f1a43cfcf1e0e9602fc.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne petek, 05. junij 2020 ob 19:16:35 CEST je Nicolas Dufresne napisal(a):
> Le jeudi 04 juin 2020 à 20:57 +0200, Jernej Skrabec a écrit :
> > When interlaced H264 content is being decoded, references must indicate
> > which field is being referenced. Currently this was done by checking
> > capture buffer flags. However, that is not correct because capture
> > buffer may hold both fields.
> > 
> > Fix this by checking newly introduced flags in reference lists.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Perhaps an additional patch could cleanup the miss-leading comment in
> v4l2_h264_dpb_entry definition.

I missed that. I think this change actually belongs to patch 1. I'll fix it in 
v2.

Best regards,
Jernej

> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> > ---
> > 
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > cce527bbdf86..c87717d17ec5 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -183,7 +183,6 @@ static void _cedrus_write_ref_list(struct cedrus_ctx
> > *ctx,> 
> >  	for (i = 0; i < num_ref; i++) {
> >  	
> >  		const struct v4l2_h264_dpb_entry *dpb;
> >  		const struct cedrus_buffer *cedrus_buf;
> > 
> > -		const struct vb2_v4l2_buffer *ref_buf;
> > 
> >  		unsigned int position;
> >  		int buf_idx;
> >  		u8 dpb_idx;
> > 
> > @@ -198,12 +197,11 @@ static void _cedrus_write_ref_list(struct cedrus_ctx
> > *ctx,> 
> >  		if (buf_idx < 0)
> >  		
> >  			continue;
> > 
> > -		ref_buf = to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);
> > -		cedrus_buf = vb2_v4l2_to_cedrus_buffer(ref_buf);
> > +		cedrus_buf = vb2_to_cedrus_buffer(cap_q->bufs[buf_idx]);
> > 
> >  		position = cedrus_buf->codec.h264.position;
> >  		
> >  		sram_array[i] |= position << 1;
> > 
> > -		if (ref_buf->field == V4L2_FIELD_BOTTOM)
> > +		if (ref_list[i].flags & 
V4L2_H264_REFERENCE_FLAG_BOTTOM_FIELD)
> > 
> >  			sram_array[i] |= BIT(0);
> >  	
> >  	}




