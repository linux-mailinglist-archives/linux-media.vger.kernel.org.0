Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC929675D84
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 20:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjATTDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 14:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjATTDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 14:03:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A002116
        for <linux-media@vger.kernel.org>; Fri, 20 Jan 2023 11:03:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BEFD514;
        Fri, 20 Jan 2023 20:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674241403;
        bh=Wcjds+dYXT/N8+Xmb65JQjYwIwWVzKG/YQwYzJDjRk4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OoghPEosO9Sspv516aVKKyYpdks22sbsOQzXlO+I+BGPE3mP4221CrMeAJ01JZbLo
         Wn5wkrFcDpCenrjG6qc87ouMHk47bOohVThtca7H4EqJIiHqCEX4w/RDydx7YQVcfm
         ZNz6mekVVJu70oiQPR1E1YKIhVBEXPE+ECc2cNQM=
Date:   Fri, 20 Jan 2023 21:03:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: "media: vb2: add (un)prepare_streaming queue ops" causes
 vb2_queue->streaming to be set earlier ?
Message-ID: <Y8rleOkeKiO21DEb@pendragon.ideasonboard.com>
References: <545610e7-3446-2b82-60dc-7385fea3774f@redhat.com>
 <51d24c79-867e-3e5b-df60-6ac4555e12bf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51d24c79-867e-3e5b-df60-6ac4555e12bf@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 08, 2022 at 08:40:05AM +0100, Hans Verkuil wrote:
> Hi Hans,
> 
> On 07/12/2022 22:23, Hans de Goede wrote:
> > Hi Hans,
> > 
> > I just fixed a crash in the out of tree driver which is caused by:
> > 
> > a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
> > 
> > I know that breaking out of tree code is fine / not our problem,
> > but I wonder if this maybe affects some in tree code too ?
> > 
> > The problem with the out of tree driver is that it
> > used vb2_queue->streaming inside the buf_queue() callback
> > to determine if the buffer was being pre-queued (from
> > vb2_start_streaming() calling __enqueue_in_driver()) before
> > the start_streaming queue-op is called.
> > 
> > Or if it was being queued after the start_streaming queue-op
> > has been called.
> > 
> > With vb2_queue->streaming now being set before the
> >  __enqueue_in_driver() calls in vb2_start_streaming() this
> > broke and it went down the route to see if there was
> > space available in the hw-queue which NULL pointer deref-ed
> > because the hw-queue had not been setup yet (more or less).
> > 
> > This is fixed now as far as the ipu6 driver is concerned,
> > but I wonder if we may not have in tree drivers making
> > similar assumptions about vb2_queue->streaming in their
> > buf_queue() callbacks ?
> 
> I checked, and there is nobody else that's doing that.

Unfortunately, commit a10b21532574 ("media: vb2: add
(un)prepare_streaming queue ops") broke the vsp1 driver, which oopses
when starting streaming due to the issue described above.

> It's definitely wrong to use q->streaming like that, it was never
> meant as a check for whether or not the buffer was pre-queued.

It's done though :-) The vsp1 .buf_queue() handler reads as

static void vsp1_video_buffer_queue(struct vb2_buffer *vb)
{
	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
	struct vsp1_video *video = vb2_get_drv_priv(vb->vb2_queue);
	struct vsp1_pipeline *pipe = video->rwpf->entity.pipe;
	struct vsp1_vb2_buffer *buf = to_vsp1_vb2_buffer(vbuf);
	unsigned long flags;
	bool empty;
	
	spin_lock_irqsave(&video->irqlock, flags);
	empty = list_empty(&video->irqqueue);
	list_add_tail(&buf->queue, &video->irqqueue);
	spin_unlock_irqrestore(&video->irqlock, flags);
	
	if (!empty)
		return;

	spin_lock_irqsave(&pipe->irqlock, flags);

	video->rwpf->mem = buf->mem;
	pipe->buffers_ready |= 1 << video->pipe_index;
	
	if (vb2_is_streaming(&video->queue) &&
	    vsp1_pipeline_ready(pipe))
		vsp1_video_pipeline_run(pipe);

	spin_unlock_irqrestore(&pipe->irqlock, flags);
} 

> Thanks for the heads-up, though! It is a real change in vb2 behavior
> that I hadn't realized could cause problems.
> 
> It's a good change, since having buf_queue called when q->streaming is
> false makes no sense. However, you can use q->start_streaming_called
> instead if for some reason a driver needs to know.

This fixes the issue in the vsp1 driver. I'll submit a patch, but I'm
worried about other breakages thought, *lots* of drivers call
vb2_is_streaming(), including in the .buf_queue() handler. Even the m2m
core does so. I'm not sure we'll be able to fix all that in time for
v6.2.

-- 
Regards,

Laurent Pinchart
