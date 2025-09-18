Return-Path: <linux-media+bounces-42735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A60B87404
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 00:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8D51C27E45
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 22:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7844F2F39C5;
	Thu, 18 Sep 2025 22:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kX1MgsHu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27768BEE;
	Thu, 18 Sep 2025 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758235050; cv=none; b=Nwf4DjuF+BtRFTkIVfbAIeyfzLmIA8/46+z9jCbpYKLDVLraf3occoqxEMGqvoavl+8qdheNAQwl7ldg1W6LI6Vs36ijCCCFIvkg9vOqVtiEfuEXC8wnLVRhHFVnij02UxL7NK+OkPZyA7GgRSQxPSATqPdtrx2/y8FhPcdwITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758235050; c=relaxed/simple;
	bh=CFNp1DwRSlhPzDlZBacPlISS3GavBgP3D8OWPHMrqTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIvWujndWlW9NJLgwX3s3efEWiFm7ifTAct3ZC/LYcPe920vSpgzinWFy3fp2/S/iLYB6bFp2SkN+NnHrOqsqqMfO+jnJmmEO2g3wwzMTUNb081YaFHxyXeRJlp4fY6AlVm6NZhnchJg/H5V4V6eyRsL53ieW2goTZPtIS49vh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kX1MgsHu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29C489FC;
	Fri, 19 Sep 2025 00:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758234965;
	bh=CFNp1DwRSlhPzDlZBacPlISS3GavBgP3D8OWPHMrqTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX1MgsHuiTMdxlMpsJTLrcl6+bZIagVC1+hcH0yPq7yg8lrFDS6Iegjqt7RvxoKYl
	 7354xr0R6tcDIqcMpuyzHU6C7JxWl6p9VZB1yUtji1Ob7TaGx+e/3qqDikhOTAtIwc
	 TUTaExBonINK7j2HJizJC+7v4cELXPqJejvsG0dI=
Date: Fri, 19 Sep 2025 01:36:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rkisp1: Improve frame sequence correctness on
 stats and params buffers
Message-ID: <20250918223655.GA10985@pendragon.ideasonboard.com>
References: <20250918145504.111428-2-stefan.klug@ideasonboard.com>
 <175820896821.1246375.16035780810428204673@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175820896821.1246375.16035780810428204673@ping.linuxembedded.co.uk>

On Thu, Sep 18, 2025 at 04:22:48PM +0100, Kieran Bingham wrote:
> Quoting Stefan Klug (2025-09-18 15:54:33)
> > On the rkisp1 (in my case on a NXP i.MX8 M Plus) the ISP interrupt
> > handler is sometimes called with RKISP1_CIF_ISP_V_START (start of frame)
> > and RKISP1_CIF_ISP_FRAME (end of frame) being set at the same time. In
> > commit 8524fa22fd2f ("media: staging: rkisp1: isp: add a warning and
> > debugfs var for irq delay") a warning was added for that. There are two
> > cases where this condition can occur:
> > 
> > 1. The v-sync and the frame-end belong to the same frame. This means,
> >    the irq was heavily delayed and the warning is likely appropriate.
> > 
> > 2. The v-sync belongs to the next frame. This can happen if the vertical
> >    blanking between two frames is very short.
> > 
> > The current code always handles case 1 although case 2 is in my
> > experience the more common case and happens in regular usage. This leads
> > to incorrect sequence numbers on stats and params buffers which in turn
> > breaks the regulation in user space. Fix that by adding a frame_active
> > flag to distinguish between these cases and handle the start of frame
> > either at the beginning or at the end of the rkisp1_isp_isr().
> > 
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > 
> > ---
> > 
> > Hi all,
> > 
> > Here is an updated version of the patch with some fixes from the review.
> > 
> > Changes in v2:
> > - Removed test for !frame_active in second v_start handler
> > - Improved comments
> > 
> > Best regards,
> > Stefan
> > 
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++++++++----
> >  2 files changed, 23 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829b..adf23416de9a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -222,6 +222,7 @@ struct rkisp1_isp {
> >         struct media_pad pads[RKISP1_ISP_PAD_MAX];
> >         const struct rkisp1_mbus_info *sink_fmt;
> >         __u32 frame_sequence;
> > +       bool frame_active;
> >  };
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 8c29a1c9309a..2e49764d6262 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -965,6 +965,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> >         }
> >  
> >         isp->frame_sequence = -1;
> > +       isp->frame_active = false;
> >  
> >         sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> >  
> > @@ -1086,12 +1087,15 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
> >   * Interrupt handlers
> >   */
> >  
> > -static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> > +static void rkisp1_isp_sof(struct rkisp1_isp *isp)
> >  {
> >         struct v4l2_event event = {
> >                 .type = V4L2_EVENT_FRAME_SYNC,
> >         };
> >  
> > +       isp->frame_sequence++;
> > +       isp->frame_active = true;
> > +
> >         event.u.frame_sync.frame_sequence = isp->frame_sequence;
> >         v4l2_event_queue(isp->sd.devnode, &event);
> >  }
> > @@ -1111,15 +1115,20 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >  
> >         rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, status);
> >  
> > -       /* Vertical sync signal, starting generating new frame */
> > -       if (status & RKISP1_CIF_ISP_V_START) {
> > -               rkisp1->isp.frame_sequence++;
> > -               rkisp1_isp_queue_event_sof(&rkisp1->isp);
> > +       /*
> > +        * Vertical sync signal, starting new frame. Defer handling of vsync
> > +        * after RKISP1_CIF_ISP_FRAME if the previous frame was not completed
> > +        * yet.
> > +        */
> > +       if (status & RKISP1_CIF_ISP_V_START && !rkisp1->isp.frame_active) {
> > +               status &= ~RKISP1_CIF_ISP_V_START;
> > +               rkisp1_isp_sof(&rkisp1->isp);
> >                 if (status & RKISP1_CIF_ISP_FRAME) {
> >                         WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
> 
> Now I've read below - I see how in here we've had both a frame start and
> a frame end without processing an IRQ at all.
> 
> I'm trying to figure out if the ISR should always just process frame end
> events before frame starts ... but then i think we wouldn't catch this
> case so I suspect this is fine keeping it how things are now.
> 
> 
> >                         rkisp1->debug.irq_delay++;
> >                 }
> >         }
> > +
> >         if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
> >                 /* Clear pic_size_error */
> >                 isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
> > @@ -1138,6 +1147,7 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >         if (status & RKISP1_CIF_ISP_FRAME) {
> >                 u32 isp_ris;
> >  
> > +               rkisp1->isp.frame_active = false;
> >                 rkisp1->debug.complete_frames++;
> >  
> >                 /* New frame from the sensor received */
> > @@ -1152,5 +1162,12 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
> >                 rkisp1_params_isr(rkisp1);
> >         }
> >  
> > +       /*
> > +        * Deferred handling of vsync if RKISP1_CIF_ISP_V_START and
> > +        * RKISP1_CIF_ISP_FRAME occurrend in the same irq.
> 
> s/occurend/occured/
> 
> > +        */
> > +       if (status & RKISP1_CIF_ISP_V_START)
> > +               rkisp1_isp_sof(&rkisp1->isp);
> 
> Aha I see - so this makes sure we /complete/ the frame before we start
> another one.
> 
> That definitely sounds like a very good thing.

Yes, this seems to be a good improvement.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There may still be room for improvement, we could measure the time
between IRQs to estimate the number of lost interrupts. That won't be
easy to develop, and may be best handled in userspace. If we investigate
that, it should probably be implemented with generic helpers.

> I'd be curuious to add a counter for how often we process a frame start
> and frame end in the same ISR too. That likely still means we've got
> some undesirable delays?

There's a counter already, and it's already exported through debugfs :-)

> > +
> >         return IRQ_HANDLED;
> >  }

-- 
Regards,

Laurent Pinchart

