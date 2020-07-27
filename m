Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C1C22F4DF
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 18:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgG0QS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 12:18:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39798 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731648AbgG0QSM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 12:18:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 025CE296D3C
Message-ID: <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Mon, 27 Jul 2020 13:18:02 -0300
In-Reply-To: <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-9-ezequiel@collabora.com>
         <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
         <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
         <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-07-27 at 16:52 +0200, Tomasz Figa wrote:
> On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > Hi Alexandre,
> > 
> > Thanks a lot for the review.
> > 
> > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > The H.264 specification requires in its "Slice header semantics"
> > > > section that the following values shall be the same in all slice headers:
> > > > 
> > > >   pic_parameter_set_id
> > > >   frame_num
> > > >   field_pic_flag
> > > >   bottom_field_flag
> > > >   idr_pic_id
> > > >   pic_order_cnt_lsb
> > > >   delta_pic_order_cnt_bottom
> > > >   delta_pic_order_cnt[ 0 ]
> > > >   delta_pic_order_cnt[ 1 ]
> > > >   sp_for_switch_flag
> > > >   slice_group_change_cycle
> > > > 
> > > > and can therefore be moved to the per-frame decode parameters control.
> > > 
> > > I am really not a H.264 expert, so this question may not be relevant,
> > 
> > All questions are welcome. I'm more than happy to discuss this patchset.
> > 
> > > but are these values specified for every slice header in the
> > > bitstream, or are they specified only once per frame?
> > > 
> > > I am asking this because it would certainly make user-space code
> > > simpler if we could remain as close to the bitstream as possible. If
> > > these values are specified once per slice, then factorizing them would
> > > leave user-space with the burden of deciding what to do if they change
> > > across slices.
> > > 
> > > Note that this is a double-edged sword, because it is not necessarily
> > > better to leave the firmware in charge of deciding what to do in such
> > > a case. :) So hopefully these are only specified once per frame in the
> > > bitstream, in which case your proposal makes complete sense.
> > 
> > Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> > are doing the slice header parsing themselves. Therefore, the
> > driver is not really parsing these fields on each slice header.
> > 
> > Currently, we are already using only the first slice in a frame,
> > as you can see from:
> > 
> >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> >                 reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > 
> > Even if these fields are transported in the slice header,
> > I think it makes sense for us to split them into the decode params
> > (per-frame) control.
> > 
> > They are really specified to be the same across all slices,
> > so even I'd say if a bitstream violates this, it's likely
> > either a corrupted bitstream or an encoder bug.
> > 
> > OTOH, one thing this makes me realize is that the slice params control
> > is wrongly specified as an array.
> 
> It is _not_.
> 

We introduced the hold capture buffer specifically to support
this without having a slice array.

I don't think we have a plan to support this control properly
as an array.

If we decide to support the slice control as an array,
we would have to implement a mechanism to specify the array size,
which we currently don't have AFAIK.

> > Namely, this text
> > should be removed:
> > 
> >        This structure is expected to be passed as an array, with one
> >        entry for each slice included in the bitstream buffer.
> > 
> > As the API is really not defined that way.
> > 
> > I'll remove that on next iteration.
> 
> The v4l2_ctrl_h264_slice_params struct has more data than those that
> are deemed to be the same across all the slices. A remarkable example
> are the size and start_byte_offset fields.

Not sure how this applies to this discussion.

Thanks!
Ezequiel

