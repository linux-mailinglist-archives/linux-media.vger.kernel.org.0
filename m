Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A04E7C27
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 23:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfJ1WE7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 18:04:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37488 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbfJ1WE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 18:04:58 -0400
Received: by mail-ed1-f65.google.com with SMTP id e12so9035461edr.4
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ly/bpYm2tfScawCXMiF8ePC/v0hoyzqN56Ct/bc3O/Y=;
        b=s2InEYVWK4rLDNUaQl9JjwfhM26TalqnlyQ86W33p4w8M1h9aV1APAne6Rc6wkztPw
         FoAXll7awUL246zSO4ZPNzz1HayrjdX68C0P//kEz1DOqO3XFO9ktJJvddIH0GdKNb5T
         Ei8DT6ibwxYnfY3Cyk+Y5Nt05g+/egZf8ZkKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ly/bpYm2tfScawCXMiF8ePC/v0hoyzqN56Ct/bc3O/Y=;
        b=WEyAGka0qbJq6xSgKGApBLulS30LYcjjw57q1W4UaZdMmSK+uk58VcRDF74u6QmpxB
         ffKUIwdjw3MQry3WUs7Vlb+YHOZu2zXJdnLmayHh1WdmSRq+gjYe+69T8AWbyzqqqZBg
         at4WFy7zAsL7WM1auDyDq2UNhdfLEmpybKI4NkaSAMpIVxG5kJCYFZKqHAtoF6SPB+Lc
         XlZYFfoG75dFnPFftNos9RyIKQNntwK/05ZDhu7SI0F49eTNLmdxsk2w/p9aD2cRUo19
         8o2LHsqBepRu+RXE6fq0/NZJfxEcxX61zrrEDJzCGE7I9fJ1YiNwnkyqd9rWpGpELbsl
         J8dg==
X-Gm-Message-State: APjAAAVeCBOIOPfVXwqzkcYTxVPmYH1yuY8/UVPRL5URbMXwi+lxf8Hc
        KKbYjoqd/YNadvL4b2g6z+1kah8eNKEfCCSQn8Hq0w==
X-Google-Smtp-Source: APXvYqwgj9DKJDjXiSA5pd21tWIe8EekWYcFvqjfVJW8AFSGHPVCrKfKqxQS7wV+aH6Ml0r/aL3wHidUNYLnpQqIjDA=
X-Received: by 2002:a50:b6f8:: with SMTP id f53mr22013413ede.29.1572300295323;
 Mon, 28 Oct 2019 15:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <f35e5aaa-cb3d-a0ad-ebc8-ed9410eb33b1@xs4all.nl> <7dbe2044-aad2-22b0-9e81-0e806127db97@linaro.org>
In-Reply-To: <7dbe2044-aad2-22b0-9e81-0e806127db97@linaro.org>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Mon, 28 Oct 2019 23:04:44 +0100
Message-ID: <CAH1Ww+Taq+po9YAwYAxHH+YdqNvszmqnsFC_NmB4fXhX3Z7SDQ@mail.gmail.com>
Subject: Re: [ANN v2] Media sessions in Lyon in October: codecs
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, 28 Oct 2019 at 19:55, Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Hans,
>
> On 10/17/19 1:25 PM, Hans Verkuil wrote:
> > Hi all,
> >
> > Since we have three separate half-day sessions for different topics I decided
> > to split the announcement for this in three emails as well, so these things
> > can be discussed in separate threads.
> >
> > All sessions are in room Terreaux VIP Lounge - Level 0.
> > There is a maximum of 15 people.
> >
> > The first session deals with the codec API and is on Tuesday morning from
> > 8:30 to 12:00 (we have to vacate the room at that time). Note that 8:30
> > start time!
> >
> > Confirmed attendees for this session:
> >
> > Boris Brezillon <boris.brezillon@collabora.com>
> > Alexandre Courbot <acourbot@chromium.org>
> > Nicolas Dufresne <nicolas@ndufresne.ca>
> > Tomasz Figa <tfiga@chromium.org>
> > Ezequiel Garcia <ezequiel@collabora.com>
> > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Maxime Ripard <mripard@kernel.org>
> > Dave Stevenson <dave.stevenson@raspberrypi.org>
> > Michael Tretter <m.tretter@pengutronix.de>
> > Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > Hans Verkuil <hverkuil@xs4all.nl>
> >
> > Please let me know asap if I missed someone, or if you are listed, but
> > can't join for some reason.
>
> I'll late for this session for unforeseen reasons (I stuck at Frankfurt
> airport), please feel free to reallocate my seat for someone who
> interested. Sorry for inconvenience.
>
> >
> > There are three seats left, and I have five on the 'just interested'
> > list:
> >
> > Daniel Gomez <daniel@qtec.com>
> > Eugen Hristev <Eugen.Hristev@microchip.com>
> > Helen Koike <helen.koike@collabora.com>
> > Jacopo Mondi <jacopo@jmondi.org>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > If you still want to join, please mail me. First come, first served :-)
> >
> > Agenda:
> >
> > Note: I didn't assign start times, we'll just go through these items one-by-one.
> >
> > - Status of any pending patches related to codec support.
> >   I'll provide a list of those patches by the end of next week so we
> >   can go through them.
> >
> > - Requirements of moving codec drivers out of staging.
> >
> > - Finalize the stateful encoder API. There are two pieces that need
> >   to be defined:
> >
> >   1) Setting the frame rate so bitrate control can make sense, since
> >      they need to know this information. This is also relevant for the
> >      stateless codec (and this may have to change on a per-frame basis
> >      for stateless codecs!).
> >
> >      This can either be implemented via ENUM_FRAMEINTERVALS for the coded
> >      pixelformats plus S_PARM support, or we just add a new control for this.
> >      E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL using struct v4l2_fract.
> >
> >      I am inclined to go with a control, since the semantics don't really
> >      match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
> >      for legacy drivers. Open question: some drivers (mediatek, hva, coda)
> >      require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
> >      S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
> >      vs OUTPUT thing, it is global to both queues.
> >
> >   2) Interactions between OUTPUT and CAPTURE formats.
> >
> >      The main problem is what to do if the capture sizeimage is too small
> >      for the OUTPUT resolution when streaming starts.
> >
> >      Proposal: width and height of S_FMT(OUTPUT) plus max-bitrate plus frame
> >      interval plus key frame interval info are used to calculate a minimum
> >      CAPTURE sizeimage (app may request more). This is codec-specific, I think,
> >      so it should be possible to provide helper functions for this.
> >
> >      However, it may be quite difficult to make a good calculation. I just
> >      don't know enough to determine this.
> >
> >      V4L2_FMT_FLAG_DYN_RESOLUTION is always cleared for codec formats
> >      for the encoder (i.e. we don't support mid-stream resolution
> >      changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> >      supported.
> >
> >      Of course, if we start to support mid-stream resolution
> >      changes (or other changes that require a source change event),
> >      then this flag should be set by the encoder driver and
> >      documentation on how to handle the source change event should
> >      be documented in the encoder spec. I prefer to postpone this
> >      until we have an encoder than can actually do mid-stream
> >      resolution changes.
> >
> >      If sizeimage of the OUTPUT is too small for the CAPTURE
> >      resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> >      then the second STREAMON (either CAPTURE or OUTPUT) will
> >      return -ENOMEM since there is not enough memory to do the
> >      encode.
> >
> >      If V4L2_FMT_FLAG_DYN_RESOLUTION is cleared (i.e. that is
> >      the case for all current encoders), then any bitrate controls
> >      will be limited in range to what the current state (CAPTURE and
> >      OUTPUT formats and frame interval) supports.
> >
> > - Stateless encoder support
> >
> >   Overall goals:
> >
> >   - Find out if there is a common set of per frame encoding parameters
> >   - Find out if bitrate control can be reused for multiple HW
> >   - Decide if we do in-kernel bitrate control or not
> >   - Decide if we keep bitstream header crafting external (unlike Hantro
> >     JPEG encoder, but like VAAPI)
> >   - Decide if we provide (and maintain) a libv4l2 plugin like ChromeOS
> >     folks opted for.
> >
> >   I hope Nicolas and Tomasz can prepare for this.
> >
> >   The one requirement that Cisco would have for these devices is that
> >   we must be able to do per-frame bitrate control from userspace.
> >
> > Regards,
> >
> >       Hans
> >
>
> --
> regards,
> Stan

Same here, I would like to know if there is more people you plan to
add to the attendee's list.
If not, I would like to be there.

Thanks,
Daniel
