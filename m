Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F82A72C5B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 12:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfGXKcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 06:32:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52644 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfGXKcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 06:32:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so41321090wms.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkk5Q3qyvhTp8QsC3EwSoNW6fzNzFjgAUWXeXFLEdq0=;
        b=p/fle8jSm7pk0x9yeWm2C1fVVwWx/MMWkycfDWjZUreBeGLt4jVjiM/PfNO9Kb8zDK
         u7J1Qen7PTby50yPjpm4y5GWyArKWkHZzlPT6biZV4rRZCE0x9OT9eEe6LWF+zb5StKv
         U+vbft7LF07CXClXlr9ypOc2/cxOHTlEAGH2azNeSWzCgI2+BtLbK+MBPcybR60ZHU1a
         JuUA7Cfgt9mc22SCI5KKLI4uaWn5kC1scNMaGgShcYv0S+hdC4+gwYQLMGG7cpmFHuq6
         LLFAl2Fqbd42FyPAoHzTh0QmWRFd3kdymY59qdWm52qSkD4S94uODCRMMfLdypJjUIKQ
         5Ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkk5Q3qyvhTp8QsC3EwSoNW6fzNzFjgAUWXeXFLEdq0=;
        b=tseJIqwxxOUb2sDAr0+6m/j/UY/qi6sVgJ+UUQ80jV6zwQ6exoLvs+JGeEPp0NNBe7
         o9m0OPaESxvruruvkpbvjYW3g2o/vGqOsPGFOgvja/4+Y3zpdbpe9R6ECopyAkRyErS3
         mv3GPKFHThYK4xKOoJ7ghk3eW42y0N3BJ2G/Q659pY2U0y0a0axoQvEzS/s9Srb2ewMI
         /0BU4T81d1HJ5Wnj6y4GIBLZwqrOt2E085zMmkv6Hyj4YGGo+rTpF/1eZurzIgeKzpJt
         7mzMPOQ9x+N8jdvroeeQpafDzQJJGpbmud1R1lpcdOuXLhnkFbHYTmv1vmX0aKvWe7TI
         R44Q==
X-Gm-Message-State: APjAAAWhme5uEA0ZTk4I5hE42+DKuwJpRpMNXBT9+suebsL4EDu/pEMK
        xkIuyEEbL0cH4ugBduBKSe8yaxjwWQZ2mXHk8U1m7A==
X-Google-Smtp-Source: APXvYqxnuIXmkNCnJmE4Sk2rA0dei/ea6xlF9EFe3yUAd9yMplC+hIl/Xzox8YrAt0KPXa+p3HpKZiOOLQ0+qS47oOM=
X-Received: by 2002:a1c:c706:: with SMTP id x6mr72466642wmf.162.1563964338176;
 Wed, 24 Jul 2019 03:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl> <CAMO6nawAyxV=kK5PWOM2658DQqyoPZGYaSGbwfn6ReiDbOW1DQ@mail.gmail.com>
 <6450d9d6-70bf-6a8d-5f73-e4fe57557539@xs4all.nl>
In-Reply-To: <6450d9d6-70bf-6a8d-5f73-e4fe57557539@xs4all.nl>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Wed, 24 Jul 2019 12:32:07 +0200
Message-ID: <CAMO6naxJDopbY6LA+J4Ts4KzPSyodaXWVjKWsB27Ntm13Daikw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 18, 2019 at 11:22 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 7/18/19 10:39 AM, Maxime Jourdan wrote:
> > On Mon, Jul 15, 2019 at 2:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 6/11/19 10:13 AM, Hans Verkuil wrote:
> >>> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> >>>> Hello,
> >>>>
> >>>> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
> >>>> to tag coded formats for which the device supports dynamic resolution
> >>>> switching, via V4L2_EVENT_SOURCE_CHANGE.
> >>>> This includes the initial "source change" where the device is able to
> >>>> tell userspace about the coded resolution and the DPB size (which
> >>>> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
> >>>
> >>> Shouldn't the initial source change still be there? The amlogic decoder
> >>> is capable of determining the resolution of the stream, right? It just
> >>> can't handle mid-stream changes.
> >>
> >> I've been thinking about this a bit more: there are three different HW capabilities:
> >>
> >> 1) The hardware cannot parse the resolution at all and userspace has to tell it
> >> via S_FMT.
> >>
> >> 2) The hardware can parse the initial resolution, but is not able to handle
> >> mid-stream resolution changes.
> >>
> >> 3) The hardware can parse the initial resolution and all following mid-stream
> >> resolution changes.
> >>
> >> We can consider 2 the default situation.
> >>
> >> In case of 1 the SOURCE_CHANGE event is absent and userspace cannot subscribe
> >> to it. Question: do we want to flag this with the format as well? I.e. with a
> >> V4L2_FMT_FLAG_MANUAL_RESOLUTION? I think just not implementing the SOURCE_CHANGE
> >> event (and documenting this) is sufficient.
> >>
> >
> > I think that not implementing SOURCE_CHANGE is sufficient as well. The
> > issue (in my case), is that the amlogic decoder _does_ support the
> > event (case 3) for anything recent (H264, HEVC, VP9), but not for e.g
> > MPEG 1/2 (case 1).
> >
> > A possible solution would be to create 2 separate devices, one
> > implementing the event, the other not. Do you think this is reasonable
> > ? This would discard the need for all the proposed flags, unless there
> > are other decoder drivers that fall in case 2.
>
> I don't think it is a good idea to create two device nodes, that's really
> confusing. Instead I think we just need a V4L2_FMT_FLAG_MANUAL_RESOLUTION
> flag.
>

I guess I just feel bad about adding a flag (MANUAL_RESOLUTION) for
what is basically a problem with one compression standard for one
driver, with the root cause being bad firmware design. Then again I
don't see a way around it, and case 1 & 2 are indeed two possibilities
that need their own flag.

I'll prepare 2 new patch series if that is okay with you:
 - DYN_RESOLUTION format flag updated series (in this current RFC,
there are issues with the explanation of the flag in the doc)
 - Adding MANUAL_RESOLUTION format flag

> BTW, what happens if the application sets the format to e.g. 640x480 but
> the MPEG file is a different resolution? Does the decoder fail to produce
> anything? Or does it internally parse the resolution from the bitstream
> and start decoding it? What if the bitstream resolution is larger than the
> resolution set with S_FMT? Does it check for the buffer size?
>
> I just want to make sure it won't write past the end of the buffer.
>

I tested this case a long while ago.The DMAs are programmed with the
allocated VB2 buffers, so you get cropped pictures (and no DMA
overflow).


> Regards,
>
>         Hans
>
> >
> >> In case of 3 the format sets the V4L2_FMT_FLAG_DYN_RESOLUTION flag.
> >>
> >> What do you think?
> >>
> >> Regards,
> >>
> >>         Hans
