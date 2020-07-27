Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8A722F256
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbgG0Oj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:39:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39000 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732992AbgG0OjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:39:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 070152948A2
Message-ID: <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax
 elements
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Mon, 27 Jul 2020 11:39:12 -0300
In-Reply-To: <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-9-ezequiel@collabora.com>
         <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

Thanks a lot for the review.

On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > The H.264 specification requires in its "Slice header semantics"
> > section that the following values shall be the same in all slice headers:
> > 
> >   pic_parameter_set_id
> >   frame_num
> >   field_pic_flag
> >   bottom_field_flag
> >   idr_pic_id
> >   pic_order_cnt_lsb
> >   delta_pic_order_cnt_bottom
> >   delta_pic_order_cnt[ 0 ]
> >   delta_pic_order_cnt[ 1 ]
> >   sp_for_switch_flag
> >   slice_group_change_cycle
> > 
> > and can therefore be moved to the per-frame decode parameters control.
> 
> I am really not a H.264 expert, so this question may not be relevant,

All questions are welcome. I'm more than happy to discuss this patchset.

> but are these values specified for every slice header in the
> bitstream, or are they specified only once per frame?
> 
> I am asking this because it would certainly make user-space code
> simpler if we could remain as close to the bitstream as possible. If
> these values are specified once per slice, then factorizing them would
> leave user-space with the burden of deciding what to do if they change
> across slices.
> 
> Note that this is a double-edged sword, because it is not necessarily
> better to leave the firmware in charge of deciding what to do in such
> a case. :) So hopefully these are only specified once per frame in the
> bitstream, in which case your proposal makes complete sense.

Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
are doing the slice header parsing themselves. Therefore, the
driver is not really parsing these fields on each slice header.

Currently, we are already using only the first slice in a frame,
as you can see from:

        if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
                reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;

Even if these fields are transported in the slice header,
I think it makes sense for us to split them into the decode params
(per-frame) control.

They are really specified to be the same across all slices,
so even I'd say if a bitstream violates this, it's likely
either a corrupted bitstream or an encoder bug.

OTOH, one thing this makes me realize is that the slice params control
is wrongly specified as an array. Namely, this text
should be removed:

       This structure is expected to be passed as an array, with one
       entry for each slice included in the bitstream buffer.

As the API is really not defined that way.

I'll remove that on next iteration.

Thanks for raising this point,
Ezequiel


