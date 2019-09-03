Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2072DA636C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 10:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfICICx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 04:02:53 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:33123 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfICICw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 04:02:52 -0400
Received: by mail-ed1-f44.google.com with SMTP id o9so6064924edq.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8v5XmqEz9dByedyb9+xZ3O50iuiq+zRH6t0Jbe/d43U=;
        b=ITtJnX+xPYj0tlXMe7jjq74MQaj0azM7Xc/1pAPByOVA9NFb+mkBqBfYbdhUpgdtc7
         cvEQBIdEmfmP9/JT025mUkm2BjRyGyCuMjf1652AIPSI/vvxNmWeT/nFp4FG58RA9/PO
         VE2GimVfvtlu7Bv1dRXRO0VhxCN01QZFn2xoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8v5XmqEz9dByedyb9+xZ3O50iuiq+zRH6t0Jbe/d43U=;
        b=GTGgV7UlHBfV6CzOHOPaNr/VHEb6mss9G14Y7Ri98DsG6/mmG5/4oaO+LNTwxDX1Nk
         IW6r/EE3iQXKQLdLrKbHWeQ1G53oczQNow12VjrU+nrpcsYSxacU5D4Z8tN7zxTpF5X2
         tiuoRXyG1RGkLibAHpyDZK7mUrSOHUMEQVmBvSa1WdKJuYJgxyAvTzXDe7t7BM/BKI+q
         ANRgdwogfLMR1ay5+FHGQlBp8XdXwjNzhi1neQqz0UnL48VjnEjIn++kEZ6Ljd1FHTZ+
         wSyP4029xtt3MznK7doBln87fDoDbRgyf0jPvgUM1B4YDTI3hBA3ZPI1Hc6zc4lqxNVs
         QrIg==
X-Gm-Message-State: APjAAAWkxI5FT+QwtD/RKtUOzyXcl93bAvWHyeTCAs5t9TfzwI3Gmtzv
        uLAwHX/3ZA8jEhRum9C4CRyTyplyI9nGOg==
X-Google-Smtp-Source: APXvYqwofuHNJJmS9JjJ88xky6g1vS6sPtZX77VDbr2g0nRNWjS8e59NlEbKOYyeLUNEhRrVfHHQPg==
X-Received: by 2002:a17:907:1043:: with SMTP id oy3mr19527147ejb.21.1567497770643;
        Tue, 03 Sep 2019 01:02:50 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id j26sm2613662eds.41.2019.09.03.01.02.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2019 01:02:50 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id r17so13673188wme.0
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 01:02:50 -0700 (PDT)
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr7991990wmh.116.1567497769776;
 Tue, 03 Sep 2019 01:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl> <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
In-Reply-To: <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 3 Sep 2019 17:02:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D8EwbpABVp+qauS6TrVOiwOhmhtGhF22KNoGerc=ue9A@mail.gmail.com>
Message-ID: <CAAFQd5D8EwbpABVp+qauS6TrVOiwOhmhtGhF22KNoGerc=ue9A@mail.gmail.com>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 3, 2019 at 4:21 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> I've decided to hold the meeting during the ELCE and not on Thursday.
> Two key people can't be there on Thursday and some travel back Thursday
> evening and so would have to leave early.
>
> Looking at the schedule I propose instead to have one meeting on
> Tuesday morning concentrating on finalizing the codec support.
>
> On Wednesday we have a second meeting for libcamera (morning) and looking
> at future V4L2 developments such as v4l2_ext_buffer/format, Request API and
> complex camera pipelines (afternoon).
>
> Laurent, it would make sense if you or one of the other libcamera devs is
> 'chairing' the libcamera meeting. Do you agree? If so, can you prepare an
> agenda for that meeting?
>
> I plan on leaving Thursday afternoon, so we have the option to continue the
> talks around that last topic on Thursday morning.
>
> I have no idea where we will hold these meetings since I've no idea
> what the conference center looks like and if they have suitable places
> for doing something like this. So I'll look around on the Monday and
> mail the details of where to meet then.
>
> Confirmed attendees:
>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Hans Verkuil <hverkuil@xs4all.nl>
>
> If you are not on this list, but want to join, please let me know.
>
> Since this is really three half-day meetings, each with a different
> topic, please let me know which of those half-day meetings you want
> to attend.

Thanks Hans! I should be there on all the 3 meetings.

>
> Regards,
>
>         Hans
>
> On 8/28/19 12:55 PM, Hans Verkuil wrote:
> > On 8/16/19 10:06 AM, Hans Verkuil wrote:
> >> Rather then discussing topics for a meeting under the subject 'Lisbon'
> >> let's start a new thread referring to the right place :-)
> >>
> >> I will try to organize a room, either during the ELCE or (if that doesn't
> >> work) perhaps on the Thursday afterwards. If that's going to be a problem
> >> for someone, please let me know.
> >
> > I can only get a room for Thursday afternoon (2pm-6pm). I'm inclined to take
> > that room, but if a lot of people who want to come, will already have left
> > on the Thursday, then there is no point in me reserving this room.
> >
> > So if you are unable to attend on Thursday, then please let me know asap!
> >
> > If Thursday is no problem, then I wanted to have more informal meetings
> > somewhere in the conference center during the morning, and after lunch
> > use the room.
> >
> > If Thursday is a no-go, then we will just have to find a place inside
> > the conference center during the ELCE.
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >> I do need to know how many people I can expect. I have the following
> >> confirmed attendees (and please reply if you are not listed!):
> >>
> >> Alexandre Courbot <acourbot@chromium.org>
> >> Tomasz Figa <tfiga@chromium.org>
> >> Jacopo Mondi <jacopo@jmondi.org>
> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Hans Verkuil <hverkuil@xs4all.nl>
> >>
> >> I know there were more who mentioned on irc that they would attend,
> >> but it is easier to keep track if I have it in an email.
> >>
> >> Topics posted under the previous thread:
> >>
> >> Tomasz:
> >>
> >> I would want to discuss various v4l2_buffer improvements, e.g.
> >> - DMA-buf import with plane offsets,
> >> - unifying the buffer structs for M and non-M formats,
> >> - ability to import different FDs with offsets for non-M formats if the
> >> layout matches driver expectations, etc.
> >>
> >> Besides that, I would be interested in the general idea on handling
> >> complex cameras in the Linux kernel in spite of the remaining V4L2
> >> limitations, e.g.
> >> - combinatorial explosion of /dev/video nodes,
> >> - significant ioctl overhead,
> >> - huge amount of historical legacy making the driver and userspace
> >> implementations overly difficult and prone to repetitive mistakes,
> >> - the above also limiting the flexibility of the API - formats, frame
> >> rates, etc. set using distinct APIs, not covered by Request API, with
> >> non-failure "negotiation hell", etc.
> >> - lack of fences, etc.
> >>
> >> Jacopo:
> >>
> >> Apart from discussing libcamera and hope we could kickstart a review of
> >> its API, I would like to re-start discussing multiplexed stream support,
> >> but that would require Sakari to be there, something I'm not certain
> >> about. Sakari?
> >>
> >> Alexandre:
> >>
> >> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> >> codecs, in particular m2m codec helpers and finalize the specification
> >> in general.
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >
>
