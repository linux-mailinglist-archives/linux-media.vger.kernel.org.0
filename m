Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0FD229D1D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 18:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgGVQax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 12:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbgGVQaw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 12:30:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81ADC0619DC;
        Wed, 22 Jul 2020 09:30:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C4C6329;
        Wed, 22 Jul 2020 18:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595435451;
        bh=SITDhkOUbdrsc3Cb5i0KMNM/DMSYjYSzQlhrR3y07Ic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X9dpHaEau0dcSQ2G1DygH0eDyDWc+YlxKOKfyDlwChbHiIqU2E40MSQg8c4E/5tJp
         8lpW9uelTT22K5ASQjMpLn0xQD+jCK6iUTHplv9R86GZoAkeTKbOSEDkhM5OIwswDs
         lUKkEQIB4GJT2eqf/ygO6zgAU08C9ExdgKs7R4Fc=
Date:   Wed, 22 Jul 2020 19:30:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        hans.verkuil@cisco.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        zhengsq@rock-chips.com, Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Message-ID: <20200722163045.GN29813@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <20190816001323.GF5011@pendragon.ideasonboard.com>
 <30b6367d-9088-d755-d041-904ff2a48130@collabora.com>
 <20200722152459.GC1828171@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200722152459.GC1828171@chromium.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna and Tomasz,

On Wed, Jul 22, 2020 at 03:24:59PM +0000, Tomasz Figa wrote:
> On Sat, Jul 11, 2020 at 01:04:31PM +0200, Dafna Hirschfeld wrote:
> > On 16.08.19 02:13, Laurent Pinchart wrote:
> > > On Tue, Jul 30, 2019 at 03:42:47PM -0300, Helen Koike wrote:
>
> [snip]
>
> > > > +static void rkisp1_isp_queue_event_sof(struct rkisp1_isp_subdev *isp)
> > > > +{
> > > > +	struct v4l2_event event = {
> > > > +		.type = V4L2_EVENT_FRAME_SYNC,
> > > > +		.u.frame_sync.frame_sequence =
> > > > +			atomic_inc_return(&isp->frm_sync_seq) - 1,
> > > 
> > > I would move the increment to the caller, hiding it in this function is
> > > error-prone (and if you look at the caller I'm pointing out one possible
> > > error :-)).
> > > 
> > > In general usage of frm_sync_seq through the driver seems to be very
> > > race-prone. It's read in various IRQ handling functions, all coming from
> > > the same IRQ, so that part is fine (and wouldn't require an atomic
> > > variable), but when read from the buffer queue handlers I really get a
> > > red light flashing in my head. I'll try to investigate more when
> > > reviewing the next patches.
> > 
> > I see that the only place were 'frame_sequence' is read outside of the irq
> > handlers is in the capture in 'rkisp1_vb2_buf_queue':
> > 
> > 	/*
> >          * If there's no next buffer assigned, queue this buffer directly
> >          * as the next buffer, and update the memory interface.
> >          */
> >         if (cap->is_streaming && !cap->buf.next &&
> >             atomic_read(&cap->rkisp1->isp.frame_sequence) == -1) {
> >                 cap->buf.next = ispbuf;
> >                 rkisp1_set_next_buf(cap);
> >         } else {
> >                 list_add_tail(&ispbuf->queue, &cap->buf.queue);
> >         }
> >
> > This "if" condition seems very specific, a case where we already stream but v-start was not yet received.
> > I think it is possible to remove the test 'atomic_read(&cap->rkisp1->isp.frame_sequence) == -1'
> > from the above condition so that the next buffer is updated in case it is null not just before the first
> > v-start signal.
> 
> We don't have this special case in the Chrome OS code.
> 
> I suppose it would make it possible to resume the capture 1 frame
> earlier after a queue underrun, as otherwise the new buffer would be
> only programmed after the next frame start interrupt and used for the
> next-next frame.  However, it's racy, because programming of the buffer
> addresses is not atomic and could end up with the hardware using few
> plane addresses from the new buffer and few from the dummy buffer.
> 
> Given that and also the fact that a queue underrun is a very special
> case, where the system was already having problems catching up, I'd just
> remove this special case.
> 
> [snip]
>
> > > > +void rkisp1_isp_isr(unsigned int isp_mis, struct rkisp1_device *dev)
> > > > +{
> > > > +	void __iomem *base = dev->base_addr;
> > > > +	unsigned int isp_mis_tmp = 0;
> > > 
> > > _tmp are never good names :-S
> > > 
> > > > +	unsigned int isp_err = 0;
> > > 
> > > Neither of these variable need to be initialised to 0.
> > > 
> > > > +
> > > > +	/* start edge of v_sync */
> > > > +	if (isp_mis & CIF_ISP_V_START) {
> > > > +		rkisp1_isp_queue_event_sof(&dev->isp_sdev);
> > > 
> > > This will increment the frame sequence number. What if the interrupt is
> > > slightly delayed and the next frame starts before we get a change to
> > > copy the sequence number to the buffers (before they will complete
> > > below) ?
> > 
> > Do you mean that we get two sequental v-start signals and then the next
> > frame-end signal in MI_MIS belongs to the first v-start signal of the two?
> > How can this be solved? I wonder if any v-start signal has a later signal
> > that correspond to the same frame so that we can follow it?
> > 
> > Maybe we should have one counter that is incremented on v-start signal,
> > and another counter that is incremented uppon some other signal?
> 
> We're talking about a hard IRQ. I can't imagine the interrupt handler
> being delayed for a time close to a full frame interval (~16ms for 60
> fps) to trigger such scenario.

I've been burnt too many times by making such statements and then seeing
a wifi driver disablign interrupts for 40ms... :-S We can only perform
as well as the system and the hardware allow us to, I understand we
can't solve all issues related to long interrupt delays as that would
require more hardware support. I'm not sure what an appropriate best
effort level is though.

> > > > +
> > > > +		writel(CIF_ISP_V_START, base + CIF_ISP_ICR);
> > > 
> > > Do you need to clear all interrupt bits individually, can't you write
> > > isp_mis to CIF_ISP_ICR at the beginning of the function to clear them
> > > all in one go ?
> > > 
> > > > +		isp_mis_tmp = readl(base + CIF_ISP_MIS);
> > > > +		if (isp_mis_tmp & CIF_ISP_V_START)
> > > > +			v4l2_err(&dev->v4l2_dev, "isp icr v_statr err: 0x%x\n",
> > > > +				 isp_mis_tmp);
> > > 
> > > This require some explanation. It looks like a naive way to protect
> > > against something, but I think it could trigger under normal
> > > circumstances if IRQ handling is delayed, and wouldn't do much anyway.
> > > Same for the similar constructs below.
> > > 
> > > > +	}
> > > > +
> > > > +	if ((isp_mis & CIF_ISP_PIC_SIZE_ERROR)) {
> > > > +		/* Clear pic_size_error */
> > > > +		writel(CIF_ISP_PIC_SIZE_ERROR, base + CIF_ISP_ICR);
> > > > +		isp_err = readl(base + CIF_ISP_ERR);
> > > > +		v4l2_err(&dev->v4l2_dev,
> > > > +			 "CIF_ISP_PIC_SIZE_ERROR (0x%08x)", isp_err);
> > > 
> > > What does this mean ?
> > > 
> > > > +		writel(isp_err, base + CIF_ISP_ERR_CLR);
> > > > +	} else if ((isp_mis & CIF_ISP_DATA_LOSS)) {
> > > 
> > > Are CIF_ISP_PIC_SIZE_ERROR and CIF_ISP_DATA_LOSS mutually exclusive ?
> > > 
> > > > +		/* Clear data_loss */
> > > > +		writel(CIF_ISP_DATA_LOSS, base + CIF_ISP_ICR);
> > > > +		v4l2_err(&dev->v4l2_dev, "CIF_ISP_DATA_LOSS\n");
> > > > +		writel(CIF_ISP_DATA_LOSS, base + CIF_ISP_ICR);
> > > > +	}
> > > > +
> > > > +	/* sampled input frame is complete */
> > > > +	if (isp_mis & CIF_ISP_FRAME_IN) {
> > > > +		writel(CIF_ISP_FRAME_IN, base + CIF_ISP_ICR);
> > > > +		isp_mis_tmp = readl(base + CIF_ISP_MIS);
> > > > +		if (isp_mis_tmp & CIF_ISP_FRAME_IN)
> > > > +			v4l2_err(&dev->v4l2_dev, "isp icr frame_in err: 0x%x\n",
> > > > +				 isp_mis_tmp);
> > > > +	}
> > > > +
> > > > +	/* frame was completely put out */
> > > 
> > > "put out" ? :-) What's the difference between ISP_FRAME_IN and ISP_FRAME
> > > ? The two comments could do with a bit of brush up, and I think the
> > > ISP_FRAME_IN interrupt could be disabled as it doesn't perform any
> > > action.
> > 
> > Those two oneline comments are just copy-paste from the datasheet.
> > 
> > ""
> > 5 MIS_FRAME_IN sampled input frame is complete
> > 1 MIS_FRAME frame was completely put out
> > ""
> > 
> > Unfrotunately, the datasheet does not add any further explanation about those signals.
> 
> My loose recollection is that the former is signaled when then frame
> is fully input to the ISP and the latter when the ISP completes
> outputting the frame to the next block in the pipeline, but someone
> would need to verify this, for example by printing timestamps for all
> the various interrupts.
> 
> > > 
> > > > +	if (isp_mis & CIF_ISP_FRAME) {
> > > > +		u32 isp_ris = 0;
> > > 
> > > No need to initialise this to 0.
> > > 
> > > > +		/* Clear Frame In (ISP) */
> > > > +		writel(CIF_ISP_FRAME, base + CIF_ISP_ICR);
> > > > +		isp_mis_tmp = readl(base + CIF_ISP_MIS);
> > > > +		if (isp_mis_tmp & CIF_ISP_FRAME)
> > > > +			v4l2_err(&dev->v4l2_dev,
> > > > +				 "isp icr frame end err: 0x%x\n", isp_mis_tmp);
> > > > +
> > > > +		isp_ris = readl(base + CIF_ISP_RIS);
> > > > +		if (isp_ris & (CIF_ISP_AWB_DONE | CIF_ISP_AFM_FIN |
> > > > +			       CIF_ISP_EXP_END | CIF_ISP_HIST_MEASURE_RDY))
> > > > +			rkisp1_stats_isr(&dev->stats_vdev, isp_ris);
> > > 
> > > Is there a guarantee that the statistics will be fully written out
> > > before the video frame itself ? And doesn't this test if any of the
> > > statistics is complete, not all of them ? I think the logic is wrong, it
> > 
> > The datasheet does not add any explanation of what is expected to come first.
> > Should we wait until all statistics measurements are done? In the struct
> > sent to userspace there is a bitmaks for which of the statistics are read.
> > I think that if only part of the statistics are ready, we can already send the once
> > that are ready to userspace.
> 
> If we look further into the code, rkisp1_stats_isr() checks the
> interrupt status mask passed to it and reads out only the parameters
> with indicated completion. The statistics metadata buffer format
> includes a bit mask which tells the userspace which measurements are
> available.
> 
> However, I think I've spotted a bug there. At the beginning of
> rkisp1_stats_isr(), all the 4 interrupt status bits are cleared,
> regardless of the mask used later to decide which readouts need to be
> done. This could mean that with an unfortunate timing, some measurements
> would be lost. So at least the code should be fixed to only clear the
> interrupts bits really handled.
> 
> As for whether to send separate buffers for each measurement, I guess
> it's not a bad thing to let the userspace access the ones available
> earlier. Now I only don't recall why we decided to put all the
> measurements into one metadata structure, rather than splitting the 4
> into their own structures and buffer queues...
> 
> > > seems it should be moved out of the CIF_ISP_FRAME test, to a test of its
> > > own. It's hard to tell for sure without extra information though (for
> > > instance why are the stats-related bits read from CIF_ISP_RIS, when
> > > they seem to be documented as valid in CIF_ISP_ISR), but this should be
> > > validated, and most probably fixed. Care should be taken to keep
> > > synchronisation of sequence number between the different queues.
> > 
> > I see that the capture buffers are done before incrementing the frame_sequence with
> > the following explanation:
> > 
> > 	/*
> >          * Call rkisp1_capture_isr() first to handle the frame that
> >          * potentially completed using the current frame_sequence number before
> >          * it is potentially incremented by rkisp1_isp_isr() in the vertical
> >          * sync.
> >          */
> > 
> > I think reading the stats/params should also be done before calling rkisp1_capture_isr
> > for the same reason. (so to match the correct frame_sequence)
> 
> My recollection of the sequence of interrupts in this hardware is like
> this:
> 
> CIF_ISP_V_START (frame 0)
>   CIF_ISP_FRAME_IN (frame 0)
>     CIF_ISP_FRAME (frame 0)
>       CIF_ISP_AWB_DONE
>       CIF_ISP_AFM_FIN
>       CIF_ISP_EXP_END
>       CIF_ISP_HIST_MEASURE_RDY
>       CIF_MI_FRAME*
>       CIF_ISP_V_START (frame 1)
>         CIF_ISP_FRAME_IN (frame 1)
>           CIF_ISP_FRAME (frame 1)
>             ...
> 
> where the interrupts at the same indentation level can happen
> independently of each other. Again, someone would have to verify this.

-- 
Regards,

Laurent Pinchart
