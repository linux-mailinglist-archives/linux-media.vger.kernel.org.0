Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA1E1E80C5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 16:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgE2OsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 10:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgE2OsU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 10:48:20 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0999C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 07:48:19 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id q13so1939178edi.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yH74hBrtbJY5vHD0jKPwuMd1t5poCuuQc7105L1sJYY=;
        b=jXJ8OpMo9x5Abv71nAHQQ5Cmhd4VsXMhgal/QEx+n9fXmLCyeQP/2cFhV3fBx403Li
         vGdVGkJSXKZZWh8IUMwdz8uJ0OiF91JFGihb53VWsRncRuTQbSrUqW4dqP1vBTssUYzX
         V/xK6Pc0PKm/eWv3cFmGTG4LSGPQvnsjXBYP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yH74hBrtbJY5vHD0jKPwuMd1t5poCuuQc7105L1sJYY=;
        b=j3vD3TlnBxOhx0uyB7qnlZORVTpICEHn9gTZowcYN3YhOKgo/BzIyRwb1krz/qzKzn
         YBdJ825aRNuOXj9hYsnAY91OlzPD9Ejq2W7HXehfmWO12eHRgLuDarcaHU8JM2iqo6Ay
         h1VRPhi5piBo+F77KcdeqfsDkmiZUMO1Q9ngCDcn4XzkOLzGPIaIK4lCXrjaVg/Y/kC3
         /sT65A7ekZ11+FqqzyubhdzrsHOXpw50kzdJwdkDcx6fcNtlnTszuGma9E0sckdduwOV
         gAqtYb0fLqbF3aFNcl2azEBrX/Ta9HZjW5OP1/icOYKVOlvyZO2rLerQgHrojiiKKXMn
         r3lA==
X-Gm-Message-State: AOAM5323bY3NggSShnpaWXJOvtWNOJk8rqmoGonOFi9eo8NJVv/gZaY9
        Yw/7mkUFZqNJs8w1IlBmqNgOa3Yv1t5oOg==
X-Google-Smtp-Source: ABdhPJw2WZUT9S+NVzhD09AiE3OXdxD0mtoBUsTiI/dH96o/KU6fxzGdE90UbmqYv+M7Kwf6m7lnGg==
X-Received: by 2002:a50:a68f:: with SMTP id e15mr8893455edc.285.1590763697817;
        Fri, 29 May 2020 07:48:17 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id ce14sm4330993ejc.3.2020.05.29.07.48.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 07:48:16 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id l11so4019166wru.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 07:48:15 -0700 (PDT)
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr9832353wrx.105.1590763695380;
 Fri, 29 May 2020 07:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com> <CAAFQd5BW9TF0iMRPCUwk3oZn-WrisMW794EuwfqZRTkmNqeKoA@mail.gmail.com>
 <20200526185754.GA25880@pendragon.ideasonboard.com> <50929a55-a071-aa09-eb1a-96776c61c147@collabora.com>
 <CAAFQd5ASEvyzHKQZjunpF-=du5AA0w6b9fGMi9xjTCbMrPhLVw@mail.gmail.com>
 <CAAFQd5Bcu+OP-2Uwkrq79C+0WAvFox-gxmcqYqkB6gpEPoABrw@mail.gmail.com> <7ce3e2cb-60ab-bf0f-6d0a-7bcf0c73d6b8@collabora.com>
In-Reply-To: <7ce3e2cb-60ab-bf0f-6d0a-7bcf0c73d6b8@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 16:48:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BwAZPKSELm29vdfPEn838vy6Mu02WjJp5f1B=ZzLU_5Q@mail.gmail.com>
Message-ID: <CAAFQd5BwAZPKSELm29vdfPEn838vy6Mu02WjJp5f1B=ZzLU_5Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] media: add v4l2_pipeline_stream_{enable,disable}
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 3:49 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Hi,
>
> On 5/29/20 10:27 AM, Tomasz Figa wrote:
> > [Fixing Niklas's address.]
> >
> > On Fri, May 29, 2020 at 3:26 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >>
> >> On Thu, May 28, 2020 at 6:21 PM Dafna Hirschfeld
> >> <dafna.hirschfeld@collabora.com> wrote:
> >>>
> >>> Hi Tomasz, Helen, Laurent
> >>>
> >>> On 26.05.20 20:57, Laurent Pinchart wrote:
> >>>> Hi Tomasz,
> >>>>
> >>>> On Tue, May 26, 2020 at 06:11:00PM +0200, Tomasz Figa wrote:
> >>>>> On Fri, May 22, 2020 at 11:06 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>>>>> On 5/22/20 4:55 AM, Dafna Hirschfeld wrote:
> >>>>>>> Hi,
> >>>>>>> This is v4 of the patchset that was sent by Helen Koike.
> >>>>>>>
> >>>>>>> Media drivers need to iterate through the pipeline and call .s_stream()
> >>>>>>> callbacks in the subdevices.
> >>>>>>>
> >>>>>>> Instead of repeating code, add helpers for this.
> >>>>>>>
> >>>>>>> These helpers will go walk through the pipeline only visiting entities
> >>>>>>> that participates in the stream, i.e. it follows links from sink to source
> >>>>>>> (and not the opposite).
> >>>>>>> For example, in a topology like this https://bit.ly/3b2MxjI
> >>>>>>> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
> >>>>>>> .s_stream(true) for rkisp1_resizer_selfpath.
> >>>>>>>
> >>>>>>> stream_count variable was added in v4l2_subdevice to handle nested calls
> >>>>>>> to the helpers.
> >>>>>>> This is useful when the driver allows streaming from more then one
> >>>>>>> capture device sharing subdevices.
> >>>>>>
> >>>>>> If I understand correctly, this isn't  true anymore right? Nested calls aren't
> >>>>>> possible anymore since this version doesn't contain stream_count in struct v4l2_subdevice.
> >>>>>>
> >>>>>> Documentation of v4l2_pipeline_stream_*() should also be updated.
> >>>>>>
> >>>>>> Just to be clear, without the nested call, vimc will require to add its own
> >>>>>> counters, patch https://patchwork.kernel.org/patch/10948833/ will be
> >>>>>> required again to allow multi streaming.
> >>>>>>
> >>>>>> Also, patch "media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}"
> >>>>>> is cleaner in the previous version (with stream_count in struct v4l2_subdevice).
> >>>>>>
> >>>>>> All drivers that allows multi streaming will need to implement some special handling.
> >>>>>>
> >>>>>> Adding stream_count in struct v4l2_subdevice still seems cleaner to me. I'd like to hear
> >>>>>> what others think.
> >>>>>
> >>>>> I certainly would see this reference counting done in generic code,
> >>>>> because requiring every driver to do it simply adds to the endless
> >>>
> >>> It is required only for drivers that support multistreaming. I don't know much
> >>> about other driver except of the ones I am working on, is it a common case?
> >>>
> >>
> >> I'm not very familiar with the older camera I/F drivers, but multiple
> >> streams isn't anything unusual for camera hardware. I recall the old
> >> Samsung FIMC already having support for separate preview and capture
> >> outputs.
> >>
> >> Also adding the reference counting on framework level probably
> >> wouldn't really hurt drivers which only have 1 stream anyway.
> >>
> >>>>> amount of boiler plate that V4L2 currently requires from the drivers.
> >>>>> :(
> >>>>>
> >>>>> I wonder if it wouldn't be possible to redesign the framework so that
> >>>>> .s_stream() at the subdev level is only called when it's expected to
> >>>>> either start or stop this particular subdev and driver's
> >>>>> implementation can simply execute the requested action.
> >>>
> >>> You mean that a generic code similar to the helper functions in this patchset
> >>> will be used for all drivers, so that drivers don't call s_stream for subdevices
> >>> anymore?
> >>> Anyway, this patchset just adds helper functions, it does not redesign the code.
> >>> Maybe the stream_count can be updated in the v4l2_subdev_call macro ?
> >>> This why it can be used not just for the helper functions.
> >>
> >> Sorry, just thinking out loud. Generally if we look at other kAPIs,
> >> such as the drm_crtc_helper_funcs [1] or regulator_ops [2], the driver
> >> provided implementation doesn't have to care about duplicate
> >> enable/disable requests.
>
> Thanks for this pointer.
>
> >>
> >> [1] https://elixir.bootlin.com/linux/v5.7-rc7/source/include/drm/drm_modeset_helper_vtables.h#L61
> >> [2] https://elixir.bootlin.com/linux/v5.7-rc7/source/include/linux/regulator/driver.h#L144
> >>
> >> If we could prohibit calling v4l2_subdev_ops::s_stream() by the
> >> drivers directly and instead add something like
> >> v4l2_subdev_s_stream(), the latter could do reference counting on its
> >> own and then only call v4l2_subdev_ops::s_stream() when the reference
> >> count changes between 0 and 1.
>
> This is basically how v3 was implemented https://patchwork.kernel.org/patch/11489583/

Not exactly. There are 2 separate problems being addressed here:
1) Iterating over the pipeline and starting streaming on all the entities,
2) Preventing duplicate calls to s_stream().

v3 attempted to address problem 2) by the way of addressing problem
1). However problem 2) can also occur on its own, outside of the
pipeline start/stop, because s_stream is a standalone subdev
operation, exposed both to the userspace via UAPI and to the drivers
via the pseudo-kAPI (v4l2_subdev_call()). If 2) was solved on the
level of the kAPI, i.e. removing v4l2_subdev_call() and replacing it
with dedicated functions for operations like s_stream, refcounting
could be implemented inside of such functions, without the need to do
it in the pipeline iteration helpers.

>
> And the main concern (from what I understood) was to add a stream_count
> under struct v4l2_subdev, that is only touched by the helpers, so this
> stream_count field would be useless for drivers not using the helpers.
> which, imho, it is not a big problem.

I believe that's exactly because the two problems I mentioned above
are actually separate problems and a solution for 1) can't solve 2)
fully.

>
> I think we gain more with a common implementation.
>
> >>
> >> One problem I see with this series is that I'm not sure if it's always
> >> guaranteed that all the drivers in the pipeline would actually use the
> >> generic helpers.
>
> I'm not sure we should always guarantee usage of generic helpers, since
> drivers may want to initialize subdevices in a specific order.
>

If we treat the 2 problems separately, the helpers for 1) could be
still optional, but the new calls for 2) would be mandatory.

> >> If there is a driver in the pipeline which just calls
> >> v4l2_subdev_ops::s_stream() on some other subdev on its own, it
> >> wouldn't be aware of the reference count and bad things could happen
> >> (e.g. the subdev stopped despite the count being > 0).
>
> I don't think this is a problem, since v4l2_subdev_ops::s_stream() are
> usually triggered by a STREAM_ON on a video node. So or the video node driver
> uses the helpers, or it calls v4l2_subdev_ops::s_stream() on subdevices directly.
>

That's not a kAPI guarantee. Any driver is free to call
v4l2_subdev_call(..., s_stream) whenever it wants.

> Unless if, we could have a case where we have multiple video nodes in the
> same topology that is implemented by different drivers, which seems odd
> to me.

That's not the only case. There are some devices, such as the adv748x
CSI-2 transmitter which manage the rest of the pipeline on their own,
e.g.

https://elixir.bootlin.com/linux/v5.7-rc7/source/drivers/media/i2c/adv748x/adv748x-csi2.c#L116

In this case, the generic helpers invoked by the ISP driver would
compete with the explicit configuration done by the driver. However,
if we solve the problem 2) at the kAPI level, that wouldn't be an
issue anymore, because the generic helpers and explicit calls would
simply grab additional reference counts.

Best regards,
Tomasz

>
> Regards,
> Helen
>
> >>
> >> However, I'm afraid this is more of the kAPI design issue and could be
> >> require quite a significant effort to be straightened out.
> >>
> >> Best regards,
> >> Tomasz
> >>
> >>>
> >>> Thanks,
> >>> Dafna
> >>>
> >>>>
> >>>> I'd very much like that. Note that I think a few drivers abuse the on
> >>>> parameter to the function to pass other values than 0 or 1. We'd have to
> >>>> fix those first (or maybe it has been done already, it's been a long
> >>>> time since I last checked).
> >>>>
