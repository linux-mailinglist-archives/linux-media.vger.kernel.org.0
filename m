Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE0122F75B
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 20:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgG0SKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 14:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728663AbgG0SKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 14:10:18 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49756C0619D2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 11:10:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id g7so9726458ejw.12
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 11:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4QxOm62T7cLBVumNmkxBcX70WS+ZyLV/uGeaA5Yi0I=;
        b=dumtdY0VczqQ+QU6R96PDWCDuvnG1h/EJf1eTVn/O7/cMDaPpwJQvx9cc9LSm3YIzu
         OIQ7k2Z5xfyGXJMIxqjaV1eT/3eYIK7NMC4RCpiycEE0LNebpVExO9dhqVy1XRlmDNUw
         N3nxV0RTtOjNMa7GFQ3ggM/4HbC7D4yh20LNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4QxOm62T7cLBVumNmkxBcX70WS+ZyLV/uGeaA5Yi0I=;
        b=Tum1AFOX2E64eFzQd4LydJ2tuZvJw34jM1u+CJZaPj1xg+mdW/Jqc4A5oD3jKrvT2W
         ueb832DhFRq4syoEaSjI7MiwDcQ6h5eXuXirM45z6mxTqsREoi07tQ3nwQZd1IeXyt7D
         HJWnOb1qDyqs0IWRCT2+ejDayPN2w4rIgjEkyI2mpNWa5OUN9Kuy+LhW98CAMgRUJykc
         Q5fOmgVAdnz/kXz8AJA0EYR8w0i49WQhb+uByfuj/sVbKaLYDyMxgC3/h2Wxv4FE8RhR
         QMQxHU2wTcd/0S3pWBD7vA/3KmP6GDuUYWEUPk8NX5zjLneqd3sjhNTGDbWVVFnvgBpo
         99+g==
X-Gm-Message-State: AOAM533p33te2zB1Rr0q1HLQOUqJJ75Ae2eTxmyXpJLV/7zLvYRmhFO3
        nj0EsVJ88bRy7HbMVHscxpYiUlbpETcW1w==
X-Google-Smtp-Source: ABdhPJyq4SAXL3iLDE7H0dznHtS9s1cYJVWl8fqmCnsA+B49Fro/QBTq0ftsp9zQNLF8cIerUlQR2g==
X-Received: by 2002:a17:907:408c:: with SMTP id nt20mr14451133ejb.503.1595873416172;
        Mon, 27 Jul 2020 11:10:16 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id m6sm7372983ejn.99.2020.07.27.11.10.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 11:10:15 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id f1so15266565wro.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 11:10:14 -0700 (PDT)
X-Received: by 2002:adf:fe12:: with SMTP id n18mr21409892wrr.295.1595873414404;
 Mon, 27 Jul 2020 11:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-9-ezequiel@collabora.com> <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
 <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
 <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com> <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
In-Reply-To: <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 Jul 2020 20:10:01 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com>
Message-ID: <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax elements
To:     Ezequiel Garcia <ezequiel@collabora.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 6:18 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Mon, 2020-07-27 at 16:52 +0200, Tomasz Figa wrote:
> > On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > Hi Alexandre,
> > >
> > > Thanks a lot for the review.
> > >
> > > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > > The H.264 specification requires in its "Slice header semantics"
> > > > > section that the following values shall be the same in all slice headers:
> > > > >
> > > > >   pic_parameter_set_id
> > > > >   frame_num
> > > > >   field_pic_flag
> > > > >   bottom_field_flag
> > > > >   idr_pic_id
> > > > >   pic_order_cnt_lsb
> > > > >   delta_pic_order_cnt_bottom
> > > > >   delta_pic_order_cnt[ 0 ]
> > > > >   delta_pic_order_cnt[ 1 ]
> > > > >   sp_for_switch_flag
> > > > >   slice_group_change_cycle
> > > > >
> > > > > and can therefore be moved to the per-frame decode parameters control.
> > > >
> > > > I am really not a H.264 expert, so this question may not be relevant,
> > >
> > > All questions are welcome. I'm more than happy to discuss this patchset.
> > >
> > > > but are these values specified for every slice header in the
> > > > bitstream, or are they specified only once per frame?
> > > >
> > > > I am asking this because it would certainly make user-space code
> > > > simpler if we could remain as close to the bitstream as possible. If
> > > > these values are specified once per slice, then factorizing them would
> > > > leave user-space with the burden of deciding what to do if they change
> > > > across slices.
> > > >
> > > > Note that this is a double-edged sword, because it is not necessarily
> > > > better to leave the firmware in charge of deciding what to do in such
> > > > a case. :) So hopefully these are only specified once per frame in the
> > > > bitstream, in which case your proposal makes complete sense.
> > >
> > > Frame-based hardwares accelerators such as Hantro and Rockchip VDEC
> > > are doing the slice header parsing themselves. Therefore, the
> > > driver is not really parsing these fields on each slice header.
> > >
> > > Currently, we are already using only the first slice in a frame,
> > > as you can see from:
> > >
> > >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > >                 reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > >
> > > Even if these fields are transported in the slice header,
> > > I think it makes sense for us to split them into the decode params
> > > (per-frame) control.
> > >
> > > They are really specified to be the same across all slices,
> > > so even I'd say if a bitstream violates this, it's likely
> > > either a corrupted bitstream or an encoder bug.
> > >
> > > OTOH, one thing this makes me realize is that the slice params control
> > > is wrongly specified as an array.
> >
> > It is _not_.
> >
>
> We introduced the hold capture buffer specifically to support
> this without having a slice array.
>
> I don't think we have a plan to support this control properly
> as an array.
>
> If we decide to support the slice control as an array,
> we would have to implement a mechanism to specify the array size,
> which we currently don't have AFAIK.
>

That wasn't the conclusion when we discussed this last time on IRC.
+Nicolas Dufresne

Currently the 1-slice per buffer model is quite impractical:
1) the maximum number of buffers is 32, which for some streams can be
less than needed to queue a single frame,
2) even more system call overhead due to the need to repeat various
operations (e.g. qbuf/dqbuf) per-slice rather than per-frame,
3) no way to do hardware batching for hardware which supports queuing
multiple slices at a time,
4) waste of memory - one needs to allocate all the OUTPUT buffers
pessimistically to accommodate the biggest possible slice, while with
all-slices-per-frame 1 buffer could be just heuristically allocated to
be enough for the whole frame.

These need to be carefully evaluated, with some proper testing done to
confirm whether they are really a problem or not.

> > > Namely, this text
> > > should be removed:
> > >
> > >        This structure is expected to be passed as an array, with one
> > >        entry for each slice included in the bitstream buffer.
> > >
> > > As the API is really not defined that way.
> > >
> > > I'll remove that on next iteration.
> >
> > The v4l2_ctrl_h264_slice_params struct has more data than those that
> > are deemed to be the same across all the slices. A remarkable example
> > are the size and start_byte_offset fields.
>
> Not sure how this applies to this discussion.

These fields need to be specified for each slice in the buffer to make
it possible to handle multiple slices per buffer.

Best regards,
Tomasz
