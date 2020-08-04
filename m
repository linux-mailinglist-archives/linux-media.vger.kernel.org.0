Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBA723BB36
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 15:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgHDNfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 09:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgHDNfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 09:35:41 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C35AC06174A
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 06:35:41 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id di22so22695275edb.12
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DLHgImnPBfTdvYTmInmn36fUeVsx4tB4k4noJiW2PpI=;
        b=UkLC6cMjO47R2Msmp8P3x57XYLaCejqZwe7Ff+Xj/k1AgiZxSCOuY4DnfHJPociAlV
         1PKbJktLyTO+HydXZHWM+BCatev12OaTZpvGF1OMVoQUnH4g1U1Se0GlfBz8WFOveair
         G4OWV1F5HhKD6uIhIpQEyKlNBb+P/6t058d7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DLHgImnPBfTdvYTmInmn36fUeVsx4tB4k4noJiW2PpI=;
        b=q7qVFlTp68e9zlsFPebWCDgMUiE6wrNxn+D8cfXD83oCk2nShf+iHMKfrCdBYQ7QTA
         vkDjpjy8NKuv6Py0iz/TlIU40QMR+5WWDM09Zhul5DnvugNpH8AN9XfOHUTkrQEXvIMm
         hqh0x4Cn/JuUObI6ju5bvKRsKpDTwN3fVsyV6CG181hr5/APJNLlOQWUHolACIdo0zhS
         gArGFqEUBQm8XYthO51mc2Z6nxBAiCrZb0IwQUENyBkK0HpmPlTsD58c/dSPIA/jXpn4
         0SRh7o2OBUPAsxgtMERY3M9ypOEZg7zVjpswK4DkiXaPpfQj1Ox3OtPvm0BjRDZLAOP6
         H7ww==
X-Gm-Message-State: AOAM530VtZRjMWAZHkyAS8dpUm4QKY3QFMh7FBM15cJTkKkWskUPM6bI
        TMdC+Kotf9lzhFu5qpA9FFVhMp7ieQHJ+w==
X-Google-Smtp-Source: ABdhPJzvcf40SkGig2IYcFUGMPPr+TY5Bi6QLbgEjwiL7hQ30b9wbmn2fzE+mMaSsRU4tVZLrWCLJA==
X-Received: by 2002:aa7:d5d5:: with SMTP id d21mr20706913eds.229.1596548139490;
        Tue, 04 Aug 2020 06:35:39 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id j11sm18026428ejx.0.2020.08.04.06.35.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 06:35:38 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id f1so36884093wro.2
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 06:35:38 -0700 (PDT)
X-Received: by 2002:adf:fe12:: with SMTP id n18mr19542439wrr.295.1596548137383;
 Tue, 04 Aug 2020 06:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-9-ezequiel@collabora.com> <CAPBb6MVMXeTcUfb-98McYCKjh=eM=BTo2dSY=L1c6dv2jHqXcg@mail.gmail.com>
 <636aab0a2be83e751a82a84ac3946afec2c87a17.camel@collabora.com>
 <CAAFQd5DVfroAXRw+OT=EktDtVzRjPZYxnUS8daWQ5=3LLwn=SA@mail.gmail.com>
 <e49635b95db0e295a85f1be9a3909f7f29495e3a.camel@collabora.com>
 <CAAFQd5AeMcqk1MpWNeh1Vgt2rBOxjFj8Ar7=LLo80e8QKhYn3g@mail.gmail.com> <dc7f9f199788581a4b37fc7e34466f7bd2173efb.camel@collabora.com>
In-Reply-To: <dc7f9f199788581a4b37fc7e34466f7bd2173efb.camel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 4 Aug 2020 15:35:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BeWXUZZDZNg6u7i=kgMbXRh=KjLa7OqjFD9JgPqC7OMg@mail.gmail.com>
Message-ID: <CAAFQd5BeWXUZZDZNg6u7i=kgMbXRh=KjLa7OqjFD9JgPqC7OMg@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: uapi: h264: Clean slice invariants syntax elements
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 9:43 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le lundi 27 juillet 2020 =C3=A0 20:10 +0200, Tomasz Figa a =C3=A9crit :
> > On Mon, Jul 27, 2020 at 6:18 PM Ezequiel Garcia <ezequiel@collabora.com=
> wrote:
> > > On Mon, 2020-07-27 at 16:52 +0200, Tomasz Figa wrote:
> > > > On Mon, Jul 27, 2020 at 4:39 PM Ezequiel Garcia <ezequiel@collabora=
.com> wrote:
> > > > > Hi Alexandre,
> > > > >
> > > > > Thanks a lot for the review.
> > > > >
> > > > > On Sat, 2020-07-25 at 23:34 +0900, Alexandre Courbot wrote:
> > > > > > On Thu, Jul 16, 2020 at 5:23 AM Ezequiel Garcia <ezequiel@colla=
bora.com> wrote:
> > > > > > > The H.264 specification requires in its "Slice header semanti=
cs"
> > > > > > > section that the following values shall be the same in all sl=
ice headers:
> > > > > > >
> > > > > > >   pic_parameter_set_id
> > > > > > >   frame_num
> > > > > > >   field_pic_flag
> > > > > > >   bottom_field_flag
> > > > > > >   idr_pic_id
> > > > > > >   pic_order_cnt_lsb
> > > > > > >   delta_pic_order_cnt_bottom
> > > > > > >   delta_pic_order_cnt[ 0 ]
> > > > > > >   delta_pic_order_cnt[ 1 ]
> > > > > > >   sp_for_switch_flag
> > > > > > >   slice_group_change_cycle
> > > > > > >
> > > > > > > and can therefore be moved to the per-frame decode parameters=
 control.
> > > > > >
> > > > > > I am really not a H.264 expert, so this question may not be rel=
evant,
> > > > >
> > > > > All questions are welcome. I'm more than happy to discuss this pa=
tchset.
> > > > >
> > > > > > but are these values specified for every slice header in the
> > > > > > bitstream, or are they specified only once per frame?
> > > > > >
> > > > > > I am asking this because it would certainly make user-space cod=
e
> > > > > > simpler if we could remain as close to the bitstream as possibl=
e. If
> > > > > > these values are specified once per slice, then factorizing the=
m would
> > > > > > leave user-space with the burden of deciding what to do if they=
 change
> > > > > > across slices.
> > > > > >
> > > > > > Note that this is a double-edged sword, because it is not neces=
sarily
> > > > > > better to leave the firmware in charge of deciding what to do i=
n such
> > > > > > a case. :) So hopefully these are only specified once per frame=
 in the
> > > > > > bitstream, in which case your proposal makes complete sense.
> > > > >
> > > > > Frame-based hardwares accelerators such as Hantro and Rockchip VD=
EC
> > > > > are doing the slice header parsing themselves. Therefore, the
> > > > > driver is not really parsing these fields on each slice header.
> > > > >
> > > > > Currently, we are already using only the first slice in a frame,
> > > > > as you can see from:
> > > > >
> > > > >         if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
> > > > >                 reg |=3D G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
> > > > >
> > > > > Even if these fields are transported in the slice header,
> > > > > I think it makes sense for us to split them into the decode param=
s
> > > > > (per-frame) control.
> > > > >
> > > > > They are really specified to be the same across all slices,
> > > > > so even I'd say if a bitstream violates this, it's likely
> > > > > either a corrupted bitstream or an encoder bug.
> > > > >
> > > > > OTOH, one thing this makes me realize is that the slice params co=
ntrol
> > > > > is wrongly specified as an array.
> > > >
> > > > It is _not_.
> > > >
> > >
> > > We introduced the hold capture buffer specifically to support
> > > this without having a slice array.
> > >
> > > I don't think we have a plan to support this control properly
> > > as an array.
> > >
> > > If we decide to support the slice control as an array,
> > > we would have to implement a mechanism to specify the array size,
> > > which we currently don't have AFAIK.
> > >
> >
> > That wasn't the conclusion when we discussed this last time on IRC.
> > +Nicolas Dufresne
> >
> > Currently the 1-slice per buffer model is quite impractical:
> > 1) the maximum number of buffers is 32, which for some streams can be
> > less than needed to queue a single frame,
>
> To give more context, it seems the discussion was about being able to
> use slice decoder with a 1 poll() per frame model. Of course this will
> never be as efficient as when using a frame base decoder, but as
> current design, you can keep a list of pending request (each request is
> 1 slice/buffer), and simply use memory pressure to poll a mid point and
> dequeue the remaining. An example, yo have 8 pending request, and reach
> your memory limit:
>
>   [R1, R2, R3, R4, R5, R6, R7, R8]
>
> As requests are in order and behaves like memory fences, you can pick
> R6, and poll() that one. When R6 is ready, you can then dequeue R1 to
> R6 without blocking. In this context, a limit of 16 or 32 buffers seems
> fair, the optimization we can do in userspace is likely sufficient. So
> I'd like to drop problem 1) from our list.
>

Okay, I forgot about the ability to poll the requests. I guess this
solves a part of the problem indeed.

> > 2) even more system call overhead due to the need to repeat various
> > operations (e.g. qbuf/dqbuf) per-slice rather than per-frame,
> > 3) no way to do hardware batching for hardware which supports queuing
> > multiple slices at a time,
> > 4) waste of memory - one needs to allocate all the OUTPUT buffers
> > pessimistically to accommodate the biggest possible slice, while with
> > all-slices-per-frame 1 buffer could be just heuristically allocated to
> > be enough for the whole frame.
> >
> > These need to be carefully evaluated, with some proper testing done to
> > confirm whether they are really a problem or not.
>
> 2, 3 and 4 seems to match what the currently unimplemented API propose.
> You can mitigate 2) but having multiple slices per buffers. That came
> with a byte offset to we can program the HW as if it was separate slice
> buffers. But was limited to 16 buffers, likely a fair compromise.
>

Do we have some ideas on how these problems could be addressed in the
future? It would be unfortunate to freeze the current API just to
realize that it can't be made efficient anymore and yet another API
would have to be invented to redo things in an efficient way.

With the request polling method, I guess we could solve 2) by making
it possible to dequeue and enqueue multiple buffers at a time. It
could be achieved by introducing DQBUF/QBUF variants which operate on
an array of buffer indexes.

> 3) is about batching, in the only use case we know, the batching
> acceleration consist of programming the next operation on the
> completion IRQ. I already looked with the Cedrus developers if and how
> that was feasible, but we don't have a PoC yet. The optimization is
> about removing context switches between operations, which could prevent
> fully using the HW.

Right, but still, we have to check whether the API we're going to
stabilize wouldn't prevent implementing it in the future.

One idea is to solve it opportunistically. If there are already some
slices queued and not being processed by the hardware yet, queuing
more would just join them to the existing (staging) batch. When the
hardware finishes its current batch, the staging batch would be closed
and handed to the hardware for decoding.

>
> 4) is also well covered with being able to multiplex 1 buffer with
> multiple slices.

Note that with MMAP memory type it's not possible, because 1 buffer
can be only queued once. However, I guess that with DMABUF, one can
just allocate one large buffer and queue it at different V4L2 buffer
indexes with different .data_offset (or whatever we introduce for
proper, well-defined offset handling).

>
> To be fair, I understand why we'd like to drop this API, as none of the
> active developers here of slice decoder (cedrus) have time to engage in
> supporting this untested "optimization". It's not only about kernel
> support, but also requires userspace work. I also agree that it could
> be added later, as an extension. It could be done with 3 new controls,
> an array of slice_params and an array of slice start offset and the
> number of slices, or just one, introduce a new structure that have a
> slice_params structure embedded, num_slices and an array of
> slice_start_offset. I don't have preference myself, but I'm just
> illustrating that yes, we could drop the slice batching to avoid
> pushing untested APIs without scarifying our ability to decode a valid
> stream.

Sure, that makes sense, but as I mentioned above, there are problems
with the existing API and if we don't want to solve them right now, we
at least have to make sure that the problems can be solved later after
stabilizing it.

Best regards,
Tomasz
