Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C765923D178
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 22:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgHET77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 15:59:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49510 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgHEQlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 12:41:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E5FA529811F
Message-ID: <40711c2dcb4166a8984fdf2ffaa22428509755f7.camel@collabora.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Wed, 05 Aug 2020 13:41:14 -0300
In-Reply-To: <CAAFQd5BeWXUZZDZNg6u7i=kgMbXRh=KjLa7OqjFD9JgPqC7OMg@mail.gmail.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-9-ezequiel@collabora.com>
         <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
         <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
         <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
         <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
         <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com>
         <dc7f9f199788581a4b37fc7e34466f7bd2173efb.camel@collabora.com>
         <CAAFQd5BeWXUZZDZNg6u7i=kgMbXRh=KjLa7OqjFD9JgPqC7OMg@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Tue, 2020-08-04 at 15:35 +0200, Tomasz Figa wrote:
> On Mon, Jul 27, 2020 at 9:43 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> > Le lundi 27 juillet 2020 à 20:10 +0200, Tomasz Figa a écrit :
> > > On Mon, Jul 27, 2020 at 6:18 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > On Mon, 2020-07-27 at 16:52 +0200, Tomasz Figa wrote:
> > > > > On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > > > Hi Alexandre,
> > > > > > 
> > > > > > Thanks a lot for the review.
> > > > > > 
> > > > > > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > > > > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > > > > > The H.264 specification requires in its "Slice header semantics"
> > > > > > > > section that the following values shall be the same in all slice headers:
> > > > > > > > 
> > > > > > > >   pic_parameter_set_id
> > > > > > > >   frame_num
> > > > > > > >   field_pic_flag
> > > > > > > >   bottom_field_flag
> > > > > > > >   idr_pic_id
> > > > > > > >   pic_order_cnt_lsb
> > > > > > > >   delta_pic_order_cnt_bottom
> > > > > > > >   delta_pic_order_cnt[ 0 ]
> > > > > > > >   delta_pic_order_cnt[ 1 ]
> > > > > > > >   sp_for_switch_flag
> > > > > > > >   slice_group_change_cycle
> > > > > > > > 
> > > > > > > > and can therefore be moved to the per-frame decode parameters control.
> > > > > > > 
> > > > > > > I am really not a H.264 expert, so this question may not be relevant,
> > > > > > 
> > > > > > All questions are welcome. I'm more than happy to discuss this patchset.
> > > > > > 
> > > > > > > but are these values specified for every slice header in the
> > > > > > > bitstream, or are they specified only once per frame?
> > > > > > > 
> > > > > > > I am asking this because it would certainly make user-space code
> > > > > > > simpler if we could remain as close to the bitstream as possible. If
> > > > > > > these values are specified once per slice, then factorizing them would
> > > > > > > leave user-space with the burden of deciding what to do if they change
> > > > > > > across slices.
> > > > > > > 
> > > > > > > Note that this is a double-edged sword, because it is not necessarily
> > > > > > > better to leave the firmware in charge of deciding what to do in such
> > > > > > > a case. :) So hopefully these are only specified once per frame in the
> > > > > > > bitstream, in which case your proposal makes complete sense.
> > > > > > 
> > > > > > Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> > > > > > are doing the slice header parsing themselves. Therefore, the
> > > > > > driver is not really parsing these fields on each slice header.
> > > > > > 
> > > > > > Currently, we are already using only the first slice in a frame,
> > > > > > as you can see from:
> > > > > > 
> > > > > >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > > > > >                 reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > > > > > 
> > > > > > Even if these fields are transported in the slice header,
> > > > > > I think it makes sense for us to split them into the decode params
> > > > > > (per-frame) control.
> > > > > > 
> > > > > > They are really specified to be the same across all slices,
> > > > > > so even I'd say if a bitstream violates this, it's likely
> > > > > > either a corrupted bitstream or an encoder bug.
> > > > > > 
> > > > > > OTOH, one thing this makes me realize is that the slice params control
> > > > > > is wrongly specified as an array.
> > > > > 
> > > > > It is _not_.
> > > > > 
> > > > 
> > > > We introduced the hold capture buffer specifically to support
> > > > this without having a slice array.
> > > > 
> > > > I don't think we have a plan to support this control properly
> > > > as an array.
> > > > 
> > > > If we decide to support the slice control as an array,
> > > > we would have to implement a mechanism to specify the array size,
> > > > which we currently don't have AFAIK.
> > > > 
> > > 
> > > That wasn't the conclusion when we discussed this last time on IRC.
> > > +Nicolas Dufresne
> > > 
> > > Currently the 1-slice per buffer model is quite impractical:
> > > 1) the maximum number of buffers is 32, which for some streams can be
> > > less than needed to queue a single frame,
> > 
> > To give more context, it seems the discussion was about being able to
> > use slice decoder with a 1 poll() per frame model. Of course this will
> > never be as efficient as when using a frame base decoder, but as
> > current design, you can keep a list of pending request (each request is
> > 1 slice/buffer), and simply use memory pressure to poll a mid point and
> > dequeue the remaining. An example, yo have 8 pending request, and reach
> > your memory limit:
> > 
> >   [R1, R2, R3, R4, R5, R6, R7, R8]
> > 
> > As requests are in order and behaves like memory fences, you can pick
> > R6, and poll() that one. When R6 is ready, you can then dequeue R1 to
> > R6 without blocking. In this context, a limit of 16 or 32 buffers seems
> > fair, the optimization we can do in userspace is likely sufficient. So
> > I'd like to drop problem 1) from our list.
> > 
> 
> Okay, I forgot about the ability to poll the requests. I guess this
> solves a part of the problem indeed.
> 
> > > 2) even more system call overhead due to the need to repeat various
> > > operations (e.g. qbuf/dqbuf) per-slice rather than per-frame,
> > > 3) no way to do hardware batching for hardware which supports queuing
> > > multiple slices at a time,
> > > 4) waste of memory - one needs to allocate all the OUTPUT buffers
> > > pessimistically to accommodate the biggest possible slice, while with
> > > all-slices-per-frame 1 buffer could be just heuristically allocated to
> > > be enough for the whole frame.
> > > 
> > > These need to be carefully evaluated, with some proper testing done to
> > > confirm whether they are really a problem or not.
> > 
> > 2, 3 and 4 seems to match what the currently unimplemented API propose.
> > You can mitigate 2) but having multiple slices per buffers. That came
> > with a byte offset to we can program the HW as if it was separate slice
> > buffers. But was limited to 16 buffers, likely a fair compromise.
> > 
> 
> Do we have some ideas on how these problems could be addressed in the
> future? It would be unfortunate to freeze the current API just to
> realize that it can't be made efficient anymore and yet another API
> would have to be invented to redo things in an efficient way.
> 
> With the request polling method, I guess we could solve 2) by making
> it possible to dequeue and enqueue multiple buffers at a time. It
> could be achieved by introducing DQBUF/QBUF variants which operate on
> an array of buffer indexes.
> 
> > 3) is about batching, in the only use case we know, the batching
> > acceleration consist of programming the next operation on the
> > completion IRQ. I already looked with the Cedrus developers if and how
> > that was feasible, but we don't have a PoC yet. The optimization is
> > about removing context switches between operations, which could prevent
> > fully using the HW.
> 
> Right, but still, we have to check whether the API we're going to
> stabilize wouldn't prevent implementing it in the future.
> 
> One idea is to solve it opportunistically. If there are already some
> slices queued and not being processed by the hardware yet, queuing
> more would just join them to the existing (staging) batch. When the
> hardware finishes its current batch, the staging batch would be closed
> and handed to the hardware for decoding.
> 
> > 4) is also well covered with being able to multiplex 1 buffer with
> > multiple slices.
> 
> Note that with MMAP memory type it's not possible, because 1 buffer
> can be only queued once. However, I guess that with DMABUF, one can
> just allocate one large buffer and queue it at different V4L2 buffer
> indexes with different .data_offset (or whatever we introduce for
> proper, well-defined offset handling).
> 
> > To be fair, I understand why we'd like to drop this API, as none of the
> > active developers here of slice decoder (cedrus) have time to engage in
> > supporting this untested "optimization". It's not only about kernel
> > support, but also requires userspace work. I also agree that it could
> > be added later, as an extension. It could be done with 3 new controls,
> > an array of slice_params and an array of slice start offset and the
> > number of slices, or just one, introduce a new structure that have a
> > slice_params structure embedded, num_slices and an array of
> > slice_start_offset. I don't have preference myself, but I'm just
> > illustrating that yes, we could drop the slice batching to avoid
> > pushing untested APIs without scarifying our ability to decode a valid
> > stream.
> 
> Sure, that makes sense, but as I mentioned above, there are problems
> with the existing API and if we don't want to solve them right now, we
> at least have to make sure that the problems can be solved later after
> stabilizing it.
> 

I think the plan is to support 1-slice per request using the current
SLICE_PARAMS control.

So, next iteration of this series should clarify that the SLICE_PARAMS
is not intended as an array, and clean the fields that were added
when the control was first envisioned as part of an array.

As you have pointed out, for slice-based hardware, pushing
1-slice per request can be suboptimal.

However, this is the current mode that is supported by Cedrus,
which is good enough for Cedrus users. I believe there's enough
reasons to stabilize this SLICE_PARAMS and clarify the use-case
is for 1-slice per request.

Nothing prevents to introduce a new control to support another mode,
though. So, going forward, if we see slice-based hardware that can
handle multiple slices per request, or, if we want to pass an entire
frame to Cedrus to save the syscall overhead, we will have to introduce
a new control (array-like).

I believe a decent plan is along Nicolas' suggestions.
I'd like to quote that because it totally matches what I had in mind:

"""
It could be done with 3 new controls,
an array of slice_params and an array of slice start offset and the
number of slices, or just one, introduce a new structure that have a
slice_params structure embedded, num_slices and an array of
slice_start_offset.
"""

Currently, the length of control arrays are fixed and the
kernel rejects applications from passing a size that
differs from the size of the array.
 
Before proposing N-slices per request, we would have to introduce
new V4L2 control semantics, to be able to pass a dynamic array
of controls. This has been in our roadmap, so it'll happen
sooner or later.

Thanks!
Ezequiel


