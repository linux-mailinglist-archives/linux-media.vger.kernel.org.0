Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10DE52438F6
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 12:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMKxg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 06:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMKxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 06:53:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853F7C061757
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 03:53:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21FE3551;
        Thu, 13 Aug 2020 12:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597316009;
        bh=0h0xRWiirvzccj+w77A9EqiAIwgMnUAgTTYO4/jWh2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rvbUPfLGsqUkw0SK0tLPRIX4S8fIBZaRn2fBtODdGf7olurCOBzM/AXaBkNRW6fOT
         jyd1TXpVJsW4OIHeMQzMI/tkZ+w6EQb6ScDy4peqU7LwwHuZPB/gKameKOqYpDBtLF
         i/k4E7/qFDMauJywO0+re1c4rmfuIswPpfZvx2Wk=
Date:   Thu, 13 Aug 2020 13:53:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 3/3] media: staging: rkisp1: params: in 'stop_streaming'
 don't release the lock while returning buffers
Message-ID: <20200813105314.GA6258@pendragon.ideasonboard.com>
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com>
 <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
 <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com>
 <e680474a-1b47-7904-b7ab-5a026d0db05f@collabora.com>
 <CAAFQd5CHK+c=zED-evW3sqgF+WpuAYW6M8kvPZCVCrf2_KHG8A@mail.gmail.com>
 <16ea1aba-0b0d-6bcf-8e72-5e253ead9218@arm.com>
 <4d90a5d1-25a7-ab49-f3e5-2d54b6b8ecba@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d90a5d1-25a7-ab49-f3e5-2d54b6b8ecba@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Aug 13, 2020 at 12:44:35PM +0200, Dafna Hirschfeld wrote:
> Am 26.06.20 um 18:58 schrieb Robin Murphy:
> > On 2020-06-26 16:59, Tomasz Figa wrote:
> >> On Fri, Jun 26, 2020 at 5:48 PM Dafna Hirschfeld wrote:
> >>> On 26.06.20 16:03, Tomasz Figa wrote:
> >>>> On Fri, Jun 26, 2020 at 3:32 PM Robin Murphy wrote:
> >>>>> On 2020-06-25 18:42, Dafna Hirschfeld wrote:
> >>>>>> In the stop_streaming callback 'rkisp1_params_vb2_stop_streaming'
> >>>>>> there is no need to release the lock 'config_lock' and then acquire
> >>>>>> it again at each iteration when returning all buffers.
> >>>>>> This is because the stream is about to end and there is no need
> >>>>>> to let the isr access a buffer.
> >>>>>>
> >>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>>>> ---
> >>>>>>     drivers/staging/media/rkisp1/rkisp1-params.c | 7 +------
> >>>>>>     1 file changed, 1 insertion(+), 6 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> >>>>>> index bf006dbeee2d..5169b02731f1 100644
> >>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> >>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> >>>>>> @@ -1488,19 +1488,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
> >>>>>>         /* stop params input firstly */
> >>>>>>         spin_lock_irqsave(&params->config_lock, flags);
> >>>>>>         params->is_streaming = false;
> >>>>>> -     spin_unlock_irqrestore(&params->config_lock, flags);
> >>>>>>
> >>>>>>         for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
> >>>>>> -             spin_lock_irqsave(&params->config_lock, flags);
> >>>>>>                 if (!list_empty(&params->params)) {
> >>>>>>                         buf = list_first_entry(&params->params,
> >>>>>>                                                struct rkisp1_buffer, queue);
> >>>>>>                         list_del(&buf->queue);
> >>>>>> -                     spin_unlock_irqrestore(&params->config_lock,
> >>>>>> -                                            flags);
> >>>>>>                 } else {
> >>>>>> -                     spin_unlock_irqrestore(&params->config_lock,
> >>>>>> -                                            flags);
> >>>>>>                         break;
> >>>>>>                 }
> >>>>>
> >>>>> Just skimming through out of idle curiosity I was going to comment that
> >>>>> if you end up with this pattern:
> >>>>>
> >>>>>           if (!x) {
> >>>>>                   //do stuff
> >>>>>           } else {
> >>>>>                   break;
> >>>>>           }
> >>>>>
> >>>>> it would be better as:
> >>>>>
> >>>>>           if (x)
> >>>>>                   break;
> >>>>>           //do stuff
> >>>>>
> >>>>> However I then went and looked at the whole function and frankly it's a
> >>>>> bit of a WTF. As best I could decipher, this whole crazy loop appears to
> >>>>> be a baroque reinvention of:
> >>>>>
> >>>>>           list_for_each_entry_safe(&params->params, ..., buf) {
> >>>>>                   list_del(&buf->queue);
> >>>>>                   vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> >>>>>           }
> >>> Hi, indeed this is a much simpler implementation, greping 'return_all_buffers'
> >>> I see that many drivers implement it this way.
> >>> thanks!
> >>>
> >>>>>
> >>>>> (assuming from context that the list should never contain more than
> >>>>> RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)
> >>>>
> >>>> Or if we want to avoid disabling the interrupts for the whole
> >>>> iteration, we could use list_splice() to move all the entries of
> >>>
> >>> But this code runs when userspace asks to stop the streaming so I don't
> >>> think it is important at that stage to allow the interrupts.
> >>
> >> It's generally a good practice to reduce the time spent with
> >> interrupts disabled. Disabling the interrupts prevents the system from
> >> handling external events, including timer interrupts, and scheduling
> >> higher priority tasks, including real time ones. How much the system
> >> runs with interrupts disabled is one of the factors determining the
> >> general system latency.
> > 
> > Right, with the way we handle interrupt affinity on Arm an IRQ can't
> > target multiple CPUs in hardware, so any time spent with IRQs
> > disabled might be preventing other devices' interrupts from being
> > taken even if they're not explicitly affine to the current CPU.
> > 
> > Now that I've looked, it appears that vb2_buffer_done() might end up
> > performing a DMA sync on the buffers, which, if it has to do
> > order-of-megabytes worth of cache maintenance for large frames, is
> > the kind of relatively slow operation that really doesn't want to be
> > done with IRQs disabled (or under a lock at all, ideally) unless it
> > absolutely *has* to be. If the lock is only needed here to protect
> > modifications to the params list itself, then moving the whole list
> > at once to do the cleanup "offline" sounds like a great idea to me.

Ouch.

> ok, that might be a problem in v4l2 in general since vb2_buffer_done
> is actually often used inside an irq handler

Correct. The DMA sync should be moved to DQBUF time, there shouldn't be
any reason to do it in the IRQ handler. I thought this had already been
fixed :-(

-- 
Regards,

Laurent Pinchart
