Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E89B1D9A
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 14:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbfIMMZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 08:25:00 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:45760 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 08:25:00 -0400
Received: by mail-ed1-f41.google.com with SMTP id f19so26837133eds.12
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2019 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aL57Hyp7qIc7KtRevKi0FamY/Yd1TrXMSLBt34si7ZY=;
        b=b0kd/+RsHvZreSjems6QtskL/OBLWSRDy/JJ5bz8RsctTOz2yXO37EYLYUxpp8u4WP
         zzmJcf7st8kSYaxMqvyhJSGOCKZTvzhJXO2rjDXQyZCtVLd7dUimFcVeRJoTK37o13mR
         yq5ppUnEm9jsHtJZ+huRfpWZ2/EI0SjMFKu+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aL57Hyp7qIc7KtRevKi0FamY/Yd1TrXMSLBt34si7ZY=;
        b=hPQbhVzYTUGI3HvpR7d6mKdtlGZUgI8/xjROigP0ypJ0cGyXW86QRh7MWZj9iw5NEj
         A+VXGY2XXKsdz0Tmede6fEQrP02zHJkUJuiTeY/lRaQF+rXP06dbvNvqduWYo6fM8PNI
         WbX2Qy7axS2/D9huEhFki6tW51SNQwylZRaX74fw4t8+VCPGLGNNtwql8lSi8NqqVf3i
         8yp16EVYmBbZnnvzfxzwzb2jjTY/yL/ozcNs6UEk8frTtFx1pbKcijqgtjmp3Ykosy4m
         DHBWpme3z1Mjnm1cvykBGI4v8FdWxa4UPobdqdey3wrySOy48miyTZB2HetheNaC+1YS
         bpUA==
X-Gm-Message-State: APjAAAUsA11l5Li3/OjH+N56eE1R7RxNJ79hkmqi1J2yRndwl6wWqiuH
        n2lmHmz94PfYpUqdoZeXP8uJU5wkiA4N5GP6rnOcBQ==
X-Google-Smtp-Source: APXvYqxeU7J7iBFZxQVTJBZdR+/AC4Xq8HH04gpwYe9aPzvkIbpZpFgxAadVJu+fybClD4oZd1i8FQR2NDsu1qJk1N4=
X-Received: by 2002:aa7:db05:: with SMTP id t5mr48157660eds.242.1568377497917;
 Fri, 13 Sep 2019 05:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl> <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
 <e5b4405a-f0c0-c30f-1ddf-6c10f7d04eed@xs4all.nl>
In-Reply-To: <e5b4405a-f0c0-c30f-1ddf-6c10f7d04eed@xs4all.nl>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Fri, 13 Sep 2019 14:24:46 +0200
Message-ID: <CAH1Ww+QkwP1bSU+h3+XHbwao8jcS8AT-jRmiS1U+2-DFUuOs6A@mail.gmail.com>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 13 Sep 2019 at 13:27, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 9/3/19 9:21 AM, Hans Verkuil wrote:
> > Hi all,
> >
> > I've decided to hold the meeting during the ELCE and not on Thursday.
> > Two key people can't be there on Thursday and some travel back Thursday
> > evening and so would have to leave early.
> >
> > Looking at the schedule I propose instead to have one meeting on
> > Tuesday morning concentrating on finalizing the codec support.
> >
> > On Wednesday we have a second meeting for libcamera (morning) and looking
> > at future V4L2 developments such as v4l2_ext_buffer/format, Request API and
> > complex camera pipelines (afternoon).
> >
> > Laurent, it would make sense if you or one of the other libcamera devs is
> > 'chairing' the libcamera meeting. Do you agree? If so, can you prepare an
> > agenda for that meeting?
> >
> > I plan on leaving Thursday afternoon, so we have the option to continue the
> > talks around that last topic on Thursday morning.
> >
> > I have no idea where we will hold these meetings since I've no idea
> > what the conference center looks like and if they have suitable places
> > for doing something like this. So I'll look around on the Monday and
> > mail the details of where to meet then.
>
> Good news: the Linux Foundation found a room for us, for both the Tuesday
> morning (8-12AM) and the whole of Wednesday (8AM-6PM).
>
> The room is: Terreaux VIP Lounge - Level 0
> It's boardroom seating for 15, screen & Projector, 3 power strips on the tables.
>
> Many thanks to the LF for hosting this for us!
>
> Regards,
>
>         Hans
>

I will be in the ELCE for the first time and since I've also started
to work recently with
Ricardo Ribalda and with industrial cameras (v4l2, sensors,
encoders...)  I would love
to attend all the meetings: codecs, libcamera, and V4L2 development.

> >
> > Confirmed attendees:
> >
> > Boris Brezillon <boris.brezillon@collabora.com>
> > Alexandre Courbot <acourbot@chromium.org>
> > Nicolas Dufresne <nicolas@ndufresne.ca>
> > Tomasz Figa <tfiga@chromium.org>
> > Ezequiel Garcia <ezequiel@collabora.com>
> > Eugen Hristev <Eugen.Hristev@microchip.com>
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Helen Koike <helen.koike@collabora.com>
> > Jacopo Mondi <jacopo@jmondi.org>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Hans Verkuil <hverkuil@xs4all.nl>
> >
> > If you are not on this list, but want to join, please let me know.
> >
> > Since this is really three half-day meetings, each with a different
> > topic, please let me know which of those half-day meetings you want
> > to attend.
> >
> > Regards,
> >
> >       Hans
> >
> > On 8/28/19 12:55 PM, Hans Verkuil wrote:
> >> On 8/16/19 10:06 AM, Hans Verkuil wrote:
> >>> Rather then discussing topics for a meeting under the subject 'Lisbon'
> >>> let's start a new thread referring to the right place :-)
> >>>
> >>> I will try to organize a room, either during the ELCE or (if that doesn't
> >>> work) perhaps on the Thursday afterwards. If that's going to be a problem
> >>> for someone, please let me know.
> >>
> >> I can only get a room for Thursday afternoon (2pm-6pm). I'm inclined to take
> >> that room, but if a lot of people who want to come, will already have left
> >> on the Thursday, then there is no point in me reserving this room.
> >>
> >> So if you are unable to attend on Thursday, then please let me know asap!
> >>
> >> If Thursday is no problem, then I wanted to have more informal meetings
> >> somewhere in the conference center during the morning, and after lunch
> >> use the room.
> >>
> >> If Thursday is a no-go, then we will just have to find a place inside
> >> the conference center during the ELCE.
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>>
> >>> I do need to know how many people I can expect. I have the following
> >>> confirmed attendees (and please reply if you are not listed!):
> >>>
> >>> Alexandre Courbot <acourbot@chromium.org>
> >>> Tomasz Figa <tfiga@chromium.org>
> >>> Jacopo Mondi <jacopo@jmondi.org>
> >>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Hans Verkuil <hverkuil@xs4all.nl>
> >>>
> >>> I know there were more who mentioned on irc that they would attend,
> >>> but it is easier to keep track if I have it in an email.
> >>>
> >>> Topics posted under the previous thread:
> >>>
> >>> Tomasz:
> >>>
> >>> I would want to discuss various v4l2_buffer improvements, e.g.
> >>> - DMA-buf import with plane offsets,
> >>> - unifying the buffer structs for M and non-M formats,
> >>> - ability to import different FDs with offsets for non-M formats if the
> >>> layout matches driver expectations, etc.
> >>>
> >>> Besides that, I would be interested in the general idea on handling
> >>> complex cameras in the Linux kernel in spite of the remaining V4L2
> >>> limitations, e.g.
> >>> - combinatorial explosion of /dev/video nodes,
> >>> - significant ioctl overhead,
> >>> - huge amount of historical legacy making the driver and userspace
> >>> implementations overly difficult and prone to repetitive mistakes,
> >>> - the above also limiting the flexibility of the API - formats, frame
> >>> rates, etc. set using distinct APIs, not covered by Request API, with
> >>> non-failure "negotiation hell", etc.
> >>> - lack of fences, etc.
> >>>
> >>> Jacopo:
> >>>
> >>> Apart from discussing libcamera and hope we could kickstart a review of
> >>> its API, I would like to re-start discussing multiplexed stream support,
> >>> but that would require Sakari to be there, something I'm not certain
> >>> about. Sakari?
> >>>
> >>> Alexandre:
> >>>
> >>> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> >>> codecs, in particular m2m codec helpers and finalize the specification
> >>> in general.
> >>>
> >>> Regards,
> >>>
> >>>     Hans
> >>>
> >>
> >
>
Regards,
Daniel
