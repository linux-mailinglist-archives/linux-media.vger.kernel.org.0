Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD08103639
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 09:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbfKTIun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 03:50:43 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41817 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfKTIun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 03:50:43 -0500
Received: by mail-ed1-f68.google.com with SMTP id a21so19597023edj.8
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 00:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jn/9RqzChFkDSxCN5qB+QqQUago/THDFoJBxRmcC3AE=;
        b=bV8DDyxnoa8/rTGcztrWm2RcOK2+2tZmkwpHHc6CQ1CfhaDv97NLoj5gdg7OxJPP5S
         FxWKnU+31FsMzUYmh8x8jJ735/IR1wBCE2aHzP0hor5OOkjgvcDFI6obpZ7kVxrp/jNS
         DO08ag6CC2DR7CcL1O9ZNRwfciErQoRiNuIWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jn/9RqzChFkDSxCN5qB+QqQUago/THDFoJBxRmcC3AE=;
        b=qeui3p8lzGXsN4SGBgOxC36lPUJ1cXVtACXp7mSuDJKvEuLB2KotS+Y60TfYwKsU45
         ch8zgxW4YakBfM4g5KXDjzOCy5Ub1KDzeTdjDCKfTThVwIX4YOTt+xFxCo+xjHucsmQS
         rPpadCtNawruto1uI4TP8tLaSKWzKBM0nX46S66dfg3p7uzIO0JT28V9Si2Yy+sTMamm
         idoLexTW0Fck0a/QHFK31ATHvZQEMVOTmomvz2T8OQV2XMM2LOdpTaz5q9+MP4kMDeLj
         ynDWf1ih7eM1l9kDgGdWN6nWzMPl51edyosDsF2EhGI/fBizXlACqbABqzmTxJDGzzc2
         aQ0A==
X-Gm-Message-State: APjAAAW3jG7Gd98H71MVFB69XctN753sYaJB5TLrxKBz+JYeLpvxjg4C
        FNUhW2OZmMIVcXspEr+Qv/LN7U3/AvjjfQ==
X-Google-Smtp-Source: APXvYqzdRACb3+o3CE9iDAjz+uZGV5+/CknLGfinTVD9untMRXIapGeQlHanzEoRx34GM6EDWCBN+w==
X-Received: by 2002:a17:906:4dc8:: with SMTP id f8mr3774490ejw.62.1574239839534;
        Wed, 20 Nov 2019 00:50:39 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id z25sm390293ejb.78.2019.11.20.00.50.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 00:50:39 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id b3so27098128wrs.13
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 00:50:38 -0800 (PST)
X-Received: by 2002:adf:e505:: with SMTP id j5mr1765040wrm.46.1574239837505;
 Wed, 20 Nov 2019 00:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20191008091119.7294-1-boris.brezillon@collabora.com>
 <20191008091119.7294-2-boris.brezillon@collabora.com> <9b289f76-6c09-b088-204d-ce5b5009bd7b@xs4all.nl>
 <CAAFQd5C7D24teYQThou+ZvZrZ7iH6-hAumSCiRi8U6tDKSdzuA@mail.gmail.com>
 <ce4639c3-fcae-e8ca-d2b8-dd79b14f7204@xs4all.nl> <CAAFQd5BJ9OiABCdOFPhgqv1j7=z-K4Y2DsGyH13-QzeZ-cJaAA@mail.gmail.com>
 <0a6d8c2a-ab0d-873e-8a08-25a9d0df1e65@xs4all.nl>
In-Reply-To: <0a6d8c2a-ab0d-873e-8a08-25a9d0df1e65@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 17:50:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cr754Eo4WiaY2jFMxuYsBsoQxVJiienci5tEsuL6qV9Q@mail.gmail.com>
Message-ID: <CAAFQd5Cr754Eo4WiaY2jFMxuYsBsoQxVJiienci5tEsuL6qV9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/6] media: v4l2: Extend pixel formats to unify
 single/multi-planar handling (and more)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 21, 2019 at 7:17 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/21/19 11:48 AM, Tomasz Figa wrote:
> > On Mon, Oct 21, 2019 at 6:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 10/21/19 11:26 AM, Tomasz Figa wrote:
> >>> On Mon, Oct 21, 2019 at 5:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>>
> >>>> On 10/8/19 11:11 AM, Boris Brezillon wrote:
> >>>>> This is part of the multiplanar and singleplanar unification process.
> >>>>> v4l2_ext_pix_format is supposed to work for both cases.
> >>>>>
> >>>>> We also add the concept of modifiers already employed in DRM to expose
> >>>>> HW-specific formats (like tiled or compressed formats) and allow
> >>>>> exchanging this information with the DRM subsystem in a consistent way.
> >>>>>
> >>>>> Note that V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY and
> >>>>> V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE types are no longer accepted
> >>>>> in v4l2_ext_format and will be rejected if you use the {G,S,TRY}EXT_FMT
> >>>>> ioctls. V4L2_BUF_TYPE_VIDEO_{CAPTURE,OUTPUT}_MPLANE is dropped as part
> >>>>> of the multiplanar/singleplanar unification.
> >>>>> V4L2_BUF_TYPE_VIDEO[_OUTPUT]_OVERLAY seems to be used mostly on old
> >>>>> drivers and supporting it would require some extra rework.
> >>>>>
> >>>>> New hooks have been added to v4l2_ioctl_ops to support those new ioctls
> >>>>> in drivers, but, in the meantime, the core takes care of converting
> >>>>> {S,G,TRY}_EXT_FMT requests into {S,G,TRY}_FMT so that old drivers can
> >>>>> still work if the userspace app/lib uses the new ioctls.
> >>>>> The conversion is also done the other around to allow userspace
> >>>>> apps/libs using {S,G,TRY}_FMT to work with drivers implementing the
> >>>>> _ext_ hooks.
> >>>>>
> >>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>>>> ---
> >>>>
> >>>> <snip>
> >>>>
> >>>>>
> >>>>> +#define VIDIOC_G_EXT_FMT     _IOWR('V', 104, struct v4l2_ext_format)
> >>>>> +#define VIDIOC_S_EXT_FMT     _IOWR('V', 105, struct v4l2_ext_format)
> >>>>> +#define VIDIOC_TRY_EXT_FMT   _IOWR('V', 106, struct v4l2_ext_format)
> >>>>>  /* Reminder: when adding new ioctls please add support for them to
> >>>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> >>>>>
> >>>>>
> >>>>
> >>>> Since we're extending g/s/try_fmt, we should also provide a replacement for
> >>>> enum_fmt, esp. given this thread:
> >>>>
> >>>> https://www.mail-archive.com/linux-media@vger.kernel.org/msg150871.html
> >>>
> >>> While that's a completely valid problem that should be addressed, I'm
> >>> not sure if putting all the things in one bag would have a positive
> >>> effect on solving all the problems in a reasonable timeline.
> >>
> >> I'm not sure what you mean with this. We can't ignore this either, and if
> >> we're going to add these new ioctls, then let's try to fix as much as we can.
> >>
> >
> > My point is that this series solves a completely orthogonal problem
> > without a need to touch ENUM_FMT at all. Is there any reason why
> > solving this particular problem separately would make solving the
> > ENUM_FMT problem more difficult in the future?
>
> I do not agree with you that this is an orthogonal problem. If we are creating
> new FMT ioctls to solve various problems, then it makes sense to look at ALL the
> problems, including this. We might decide to postpone creating a EXT_ENUM_FMT
> ioctl, but during the discussion we should look at this issue as well.
>
> To take one suggestion you made: use of the active/try slots for existing non-MC
> drivers. If we decide to go into that direction (and I think it is a very interesting
> idea), then that requires that ENUM_FMT is taken into account anyway. And probably
> other ioctls such as the selection API as well.
>
> I think we need to think big here, and try to at least explore the possibility
> of creating an API that tries to limit the differences between video and subdev
> nodes.
>

Okay, agreed on this.

> >
> >>>
> >>>>
> >>>> So here is a preliminary suggestion:
> >>>>
> >>>> struct v4l2_ext_fmtdesc {
> >>>>         __u32               index;             /* Format number      */
> >>>>         __u32               type;              /* enum v4l2_buf_type */
> >>>>         __u32               which;             /* enum v4l2_subdev_format_whence, ignored if mbus_code == 0 */
> >>>>         __u32               mbus_code;         /* Mediabus Code (set to 0 if n/a) */
> >>>>         __u32               flags;
> >>>>         __u8                description[32];   /* Description string */
> >>>>         __u32               pixelformat;       /* Format fourcc      */
> >>>> };
> >>>>
> >>>> This would solve (I think) the issue raised in the thread since you can now get
> >>>> just for formats that are valid for the given mediabus code and the which field.
> >>>>
> >>>
> >>> Hmm, why only mbus_code? We have the same problem with mem2mem
> >>> devices, where the format set on one queue affects the formats
> >>> supported on another queue. Perhaps it should be defined to return
> >>> formats valid with the current state of the driver? If we want to
> >>> extend it to return formats for arbitrary states, perhaps we should
> >>> use a mechanism similar to the TRY_FMT slot in subdevices, where we
> >>> can set the configuration we want to test against and then ENUM_FMT
> >>> would return the formats valid for that configuration?
> >>
> >> Good point.
> >>
> >
> > We might want to keep the control'ification of the API in mind, which
> > should simplify dealing with state inter-dependencies, because all the
> > state would be represented in a uniform way.
>
> I still don't know what Laurent wants to do with that.
>

Not sure why Laurent specifically. :)

On the other hand, that's a much more invasive change, so maybe better
not to mix it with the things discussed here.

> >
> >>>
> >>>> Other improvements that could be made is to return more information about the
> >>>> format (similar to struct v4l2_format_info). In particular v4l2_pixel_encoding
> >>>> and mem/comp_planes would be useful for userspace to know.
> >>>
> >>> An alternative would be to go away from mixing mem_planes and
> >>> pixelformats and just having the "planarity" queryable and
> >>> configurable separately. The existing duplicated FourCCs would have to
> >>> remain for compatibility reasons, though.
> >>
> >> Interesting idea, but I don't know if this would make the API more or less confusing.
> >>
> >
> > Yeah, this definitely needs more thought. My experience with working
> > with many people trying to use V4L2 in the userspace tells me that the
> > existing model is confusing, though. DRM and most userspace libraries
> > use FourCCs only to define the pixelformats themselves and planarity
> > is a separate aspect.
> >
> > The target model that I'd see happening would be to have the
> > multiple-memory plane semantics used everywhere, so all color planes
> > are described as separate entities, up to having different DMA-buf
> > FDs. Then the single memory plane case would be just one of the
> > specific cases, where all the DMA-buf FDs point to the same buffer and
> > color plane offsets are laid out contiguously, which could be enforced
> > by generic code when queuing the buffer if that's a hardware
> > requirement.
>
> Do you think you can come up with a rough proposal before the ELCE session?

Sorry, I wasn't able to come up with anything formal, but I believe we
discussed this well during the session and it's written down in the
notes.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> >>>
> >>>>
> >>>> Finally, we can also add a new ioctl that combines ENUM_FMT/ENUM_FRAMESIZES/ENUM_FRAMEINTERVALS
> >>>> and returns an array of all valid formats/sizes/intervals, requiring just a single ioctl
> >>>> to obtain all this information.
> >>>
> >>> While it definitely sounds like a useful thing to have, it would be an
> >>> interesting problem to solve given the inter-dependencies between
> >>> pads, queues and other state, as in the mbus example above.
> >>
> >> This is definitely a separate issue for further in the future.
> >
> > Agreed.
> >
> > Best regards,
> > Tomasz
> >
>
