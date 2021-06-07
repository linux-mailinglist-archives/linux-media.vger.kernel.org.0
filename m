Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0123439E48F
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 18:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhFGQyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 12:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhFGQyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 12:54:10 -0400
Received: from perceval.ideasonboard.com (unknown [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E851C061766
        for <linux-media@vger.kernel.org>; Mon,  7 Jun 2021 09:52:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB9958DB;
        Mon,  7 Jun 2021 18:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623084722;
        bh=NJoSGi95J7AkhVIhdqQYKpZyXkeZLsoteZ6X2mzagxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P8UPiUffils1LXoAfZpL0B/H0KAc03ZfNTXiC2UHD3n5hb2UW0Q9k1QtPcTff4cUQ
         hRNKo5YVQ1+BRGyLhUc+1JbeZgBbj0d7lszfeOf0YmwMAwd3EAid4nmUv2AuwbIvTb
         3kw4gFKfU945lqGUrQcMOfZ5Mvwcv587kmLVwnNA=
Date:   Mon, 7 Jun 2021 19:51:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 32/38] media: ti-vpe: cal: use CSI-2 frame number
Message-ID: <YL5OpCAmfrMUibXq@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
 <YLozAqLmoKnHzQEi@pendragon.ideasonboard.com>
 <ca4c24d2-4edc-5ba4-970c-381195545a00@ideasonboard.com>
 <YL4iKZv5YV3LllIK@pendragon.ideasonboard.com>
 <b28c71d4-e7b1-2f21-530b-a108cfe0c337@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b28c71d4-e7b1-2f21-530b-a108cfe0c337@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Jun 07, 2021 at 05:55:05PM +0300, Tomi Valkeinen wrote:
> On 07/06/2021 16:42, Laurent Pinchart wrote:
> > On Mon, Jun 07, 2021 at 03:39:45PM +0300, Tomi Valkeinen wrote:
> >> On 04/06/2021 17:04, Laurent Pinchart wrote:
> >>> On Mon, May 24, 2021 at 02:09:03PM +0300, Tomi Valkeinen wrote:
> >>>> The driver fills buf->vb.sequence with an increasing number which is
> >>>> incremented by the driver. This feels a bit pointless, as the userspace
> >>>> could as well track that kind of number itself. Instead, lets use the
> >>>
> >>> s/lets/let's/
> >>>
> >>>> frame number provided in the CSI-2 data from the sensor.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>>> ---
> >>>>    drivers/media/platform/ti-vpe/cal.c | 7 +++++--
> >>>>    drivers/media/platform/ti-vpe/cal.h | 1 -
> >>>>    2 files changed, 5 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >>>> index 888706187fd1..62c45add4efe 100644
> >>>> --- a/drivers/media/platform/ti-vpe/cal.c
> >>>> +++ b/drivers/media/platform/ti-vpe/cal.c
> >>>> @@ -493,7 +493,6 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
> >>>>    
> >>>>    void cal_ctx_start(struct cal_ctx *ctx)
> >>>>    {
> >>>> -	ctx->sequence = 0;
> >>>>    	ctx->dma.state = CAL_DMA_RUNNING;
> >>>>    
> >>>>    	/* Configure the CSI-2, pixel processing and write DMA contexts. */
> >>>> @@ -586,6 +585,10 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
> >>>>    static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
> >>>>    {
> >>>>    	struct cal_buffer *buf = NULL;
> >>>> +	u32 frame_num;
> >>>> +
> >>>> +	frame_num = cal_read(ctx->cal, CAL_CSI2_STATUS(ctx->phy->instance,
> >>>> +						       ctx->csi2_ctx)) & 0xffff;
> >>>>    
> >>>>    	spin_lock(&ctx->dma.lock);
> >>>>    
> >>>> @@ -607,7 +610,7 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
> >>>>    	if (buf) {
> >>>>    		buf->vb.vb2_buf.timestamp = ktime_get_ns();
> >>>>    		buf->vb.field = ctx->v_fmt.fmt.pix.field;
> >>>> -		buf->vb.sequence = ctx->sequence++;
> >>>> +		buf->vb.sequence = frame_num;
> >>>
> >>> We'll need something a bit more complicated. The CSI-2 frame number is
> >>> not mandatory, and when used, it is a 16-bit number starting at 1 and
> >>> counting to an unspecified value larger than one, resetting to 1 at the
> >>> end of the cycle. The V4L2 sequence number, on the other hand, is a
> >>> monotonic counter starting at 0 and wrapping only at 2^32-1. We should
> >>> thus keep a software sequence counter and
> >>>
> >>> - increase it by 1 if the frame number is zero
> >>> - increase it by frame_num - last_frame_num (with wrap-around of
> >>>     frame_num handled) otherwise
> >>
> >> Ok... I wonder if we need a new field for this, though. The problem I
> >> was solving when I changed this to use the CSI-2 frame-number was how to
> >> associate a pixel frame and a metadata frame.
> >>
> >> Their CSI-2 frame-numbers match (as they are from the same original
> >> CSI-2 frame), so the userspace can use that to figure the matching
> >> frames. While the above method you suggest should give us identical
> >> sequence numbers for pixel and metadata, I think it's going a bit away
> >> from my intended purpose, and possibly risks ending up with different
> >> sequences for pixel and metadata.
> > 
> > Why do you think they could get out of sync (assuming the sensor
> > supports frame numbers of course, if it always returns 0, that's not
> > usable for the purpose of synchronization).
> 
> If there's a requirement that the sequence starts from 0, it doesn't 
> work, as the pixel and metadata video capture may be started at 
> different times. When pixel capture starts, the frame number could be 10 
> and pixel sequence would be 0, but when metadata capture starts, the 
> frame number could be 12, and pixel seq would thus be 2 and meta seq 0.
> 
> But even if we allow the seq to start from the current frame number, 

Good point. I think we can allow starting at a non-zero value to handle
this.

> this doesn't work if the frame number has wrapped between starting the 
> pixel capture and starting the meta capture.

The timestamp should be enough to handle this, the timestamp difference
between two wraparounds should be large enough to sync the two streams
without any risk.

> We have a FS irq for each virtual channel (the current sequence code is 
> in the dma-frame-end irq code which is enabled per ctx only when 
> capturing), but I don't right away see how tracking FS per VC would help 
> here...
> 
> >> So do we need the sequence number, as it is currently, and something new
> >> for this buffer matching purpose?
> > 
> > When the sensor doesn't support frame numbers, the only thing that can
> > be used is the timestamp as far as I can see.
> 
> CAL doc says that if the sensor is not sending frame numbers, the frame 
> number register is incremented by 1 on every FS. So we always have a 
> frame number, but we don't know if it's from the sensor or not.

Ah, that's a useful feature, it should simplify the implementation on
the driver side and avoid missing frame syncs.

-- 
Regards,

Laurent Pinchart
