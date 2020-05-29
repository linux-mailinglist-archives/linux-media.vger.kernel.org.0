Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8811F1E7EA4
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgE2N2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 09:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgE2N2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 09:28:12 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A02C03E969
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:28:11 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id mb16so2082032ejb.4
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1LYVsAqNQ4JAOyO8daBn9HUI8khey1QngutDjiEIeE=;
        b=TYywXClz70EPvqi5111umHc+eThnDNmvy2FyhWYd5Fm57BDViStBsq3cdJZxym8fxO
         iN+nPNkKaN8O0JzTUMik1rtvclkhiyvuRzk0D0jaQBw4w5DVYf4IZaKAY/aYvdpxPtAO
         ZFT9C0YjiyB8FaJFlh0Kk1dEsV1giliNwZvIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1LYVsAqNQ4JAOyO8daBn9HUI8khey1QngutDjiEIeE=;
        b=Qi3nm8ByxjuGhqtrqtZMA+QF3xCOUWgKadkb4GHlJdeB/0Nc680wFCQPZpWIpaEVVQ
         NXBFRCdG37oViIXZ9L9ZxcANYuFTMLhA+hL5S1jjdB1I8WsuQpSHmgx8fD/9y09MN7f3
         1z54xs5BsWqMIbyWtEsg42nDgwXiE0Qu6e1+d1MWY8odhlxXuJzofwXWRJWc/Z3K1mvr
         862Aoxp8dnfcALUT90qc+DRXzUSvtlHRTCTcijRqOJDdIusxH93h43AO7cJNigYZB62I
         O9OCt4XDZPdF4JhVzoLj6gIOtTs6ayw0atFpzmpdRYH32SP/nP7W7MwIGHeyzD8oC+6B
         BIEg==
X-Gm-Message-State: AOAM5327EiUhxFKEOjhXk2s92VYDfQWnKrj3woVIyoq/QmFGvB0RpwIn
        0fn0MKzkLQ+NqM56ESOMa6E3YgzoEfGveg==
X-Google-Smtp-Source: ABdhPJx1lG7b1da3RXiSus6bA2mTyChzc/QkpmDE/7pWB5eKqs/QOiICXCjRgzNOeIaaYIBixn3I7A==
X-Received: by 2002:a17:906:1359:: with SMTP id x25mr8267851ejb.42.1590758889494;
        Fri, 29 May 2020 06:28:09 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id d26sm7888810ejo.1.2020.05.29.06.28.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 06:28:08 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id l26so3277552wme.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2020 06:28:07 -0700 (PDT)
X-Received: by 2002:a7b:c622:: with SMTP id p2mr8600143wmk.55.1590758887486;
 Fri, 29 May 2020 06:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com> <CAAFQd5BW9TF0iMRPCUwk3oZn-WrisMW794EuwfqZRTkmNqeKoA@mail.gmail.com>
 <20200526185754.GA25880@pendragon.ideasonboard.com> <50929a55-a071-aa09-eb1a-96776c61c147@collabora.com>
 <CAAFQd5ASEvyzHKQZjunpF-=du5AA0w6b9fGMi9xjTCbMrPhLVw@mail.gmail.com>
In-Reply-To: <CAAFQd5ASEvyzHKQZjunpF-=du5AA0w6b9fGMi9xjTCbMrPhLVw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 May 2020 15:27:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bcu+OP-2Uwkrq79C+0WAvFox-gxmcqYqkB6gpEPoABrw@mail.gmail.com>
Message-ID: <CAAFQd5Bcu+OP-2Uwkrq79C+0WAvFox-gxmcqYqkB6gpEPoABrw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] media: add v4l2_pipeline_stream_{enable,disable}
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
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

[Fixing Niklas's address.]

On Fri, May 29, 2020 at 3:26 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Thu, May 28, 2020 at 6:21 PM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
> >
> > Hi Tomasz, Helen, Laurent
> >
> > On 26.05.20 20:57, Laurent Pinchart wrote:
> > > Hi Tomasz,
> > >
> > > On Tue, May 26, 2020 at 06:11:00PM +0200, Tomasz Figa wrote:
> > >> On Fri, May 22, 2020 at 11:06 AM Helen Koike <helen.koike@collabora.com> wrote:
> > >>> On 5/22/20 4:55 AM, Dafna Hirschfeld wrote:
> > >>>> Hi,
> > >>>> This is v4 of the patchset that was sent by Helen Koike.
> > >>>>
> > >>>> Media drivers need to iterate through the pipeline and call .s_stream()
> > >>>> callbacks in the subdevices.
> > >>>>
> > >>>> Instead of repeating code, add helpers for this.
> > >>>>
> > >>>> These helpers will go walk through the pipeline only visiting entities
> > >>>> that participates in the stream, i.e. it follows links from sink to source
> > >>>> (and not the opposite).
> > >>>> For example, in a topology like this https://bit.ly/3b2MxjI
> > >>>> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
> > >>>> .s_stream(true) for rkisp1_resizer_selfpath.
> > >>>>
> > >>>> stream_count variable was added in v4l2_subdevice to handle nested calls
> > >>>> to the helpers.
> > >>>> This is useful when the driver allows streaming from more then one
> > >>>> capture device sharing subdevices.
> > >>>
> > >>> If I understand correctly, this isn't  true anymore right? Nested calls aren't
> > >>> possible anymore since this version doesn't contain stream_count in struct v4l2_subdevice.
> > >>>
> > >>> Documentation of v4l2_pipeline_stream_*() should also be updated.
> > >>>
> > >>> Just to be clear, without the nested call, vimc will require to add its own
> > >>> counters, patch https://patchwork.kernel.org/patch/10948833/ will be
> > >>> required again to allow multi streaming.
> > >>>
> > >>> Also, patch "media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}"
> > >>> is cleaner in the previous version (with stream_count in struct v4l2_subdevice).
> > >>>
> > >>> All drivers that allows multi streaming will need to implement some special handling.
> > >>>
> > >>> Adding stream_count in struct v4l2_subdevice still seems cleaner to me. I'd like to hear
> > >>> what others think.
> > >>
> > >> I certainly would see this reference counting done in generic code,
> > >> because requiring every driver to do it simply adds to the endless
> >
> > It is required only for drivers that support multistreaming. I don't know much
> > about other driver except of the ones I am working on, is it a common case?
> >
>
> I'm not very familiar with the older camera I/F drivers, but multiple
> streams isn't anything unusual for camera hardware. I recall the old
> Samsung FIMC already having support for separate preview and capture
> outputs.
>
> Also adding the reference counting on framework level probably
> wouldn't really hurt drivers which only have 1 stream anyway.
>
> > >> amount of boiler plate that V4L2 currently requires from the drivers.
> > >> :(
> > >>
> > >> I wonder if it wouldn't be possible to redesign the framework so that
> > >> .s_stream() at the subdev level is only called when it's expected to
> > >> either start or stop this particular subdev and driver's
> > >> implementation can simply execute the requested action.
> >
> > You mean that a generic code similar to the helper functions in this patchset
> > will be used for all drivers, so that drivers don't call s_stream for subdevices
> > anymore?
> > Anyway, this patchset just adds helper functions, it does not redesign the code.
> > Maybe the stream_count can be updated in the v4l2_subdev_call macro ?
> > This why it can be used not just for the helper functions.
>
> Sorry, just thinking out loud. Generally if we look at other kAPIs,
> such as the drm_crtc_helper_funcs [1] or regulator_ops [2], the driver
> provided implementation doesn't have to care about duplicate
> enable/disable requests.
>
> [1] https://elixir.bootlin.com/linux/v5.7-rc7/source/include/drm/drm_modeset_helper_vtables.h#L61
> [2] https://elixir.bootlin.com/linux/v5.7-rc7/source/include/linux/regulator/driver.h#L144
>
> If we could prohibit calling v4l2_subdev_ops::s_stream() by the
> drivers directly and instead add something like
> v4l2_subdev_s_stream(), the latter could do reference counting on its
> own and then only call v4l2_subdev_ops::s_stream() when the reference
> count changes between 0 and 1.
>
> One problem I see with this series is that I'm not sure if it's always
> guaranteed that all the drivers in the pipeline would actually use the
> generic helpers. If there is a driver in the pipeline which just calls
> v4l2_subdev_ops::s_stream() on some other subdev on its own, it
> wouldn't be aware of the reference count and bad things could happen
> (e.g. the subdev stopped despite the count being > 0).
>
> However, I'm afraid this is more of the kAPI design issue and could be
> require quite a significant effort to be straightened out.
>
> Best regards,
> Tomasz
>
> >
> > Thanks,
> > Dafna
> >
> > >
> > > I'd very much like that. Note that I think a few drivers abuse the on
> > > parameter to the function to pass other values than 0 or 1. We'd have to
> > > fix those first (or maybe it has been done already, it's been a long
> > > time since I last checked).
> > >
