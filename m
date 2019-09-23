Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA58BBBB45
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 20:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732999AbfIWS0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 14:26:25 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36921 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731405AbfIWS0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 14:26:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id r4so13878422edy.4
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VuF5N264jZi/vn74ti/hatiCcrodRUlFaZBKWWqlUWE=;
        b=IteJTSiV9YyCPniYKTPMT3BJaY0oJimziLZxhcvrjkW0ydJne9vxXO5jNBXnk/eLrh
         5jRNXpAtrxbKK0obF05JFBoKRDkl0fdiO3eA9QMpqkSIxoqv1ecpY3Jut69TM2Z5Ex0O
         sIIzTDYLbwNzrVdTvUEQ/vqxIi8yMzGkx+vCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VuF5N264jZi/vn74ti/hatiCcrodRUlFaZBKWWqlUWE=;
        b=Fv3WYI2jGPHDrOangJt8EMia8uUqgJcZ1JRj347Ha+NxsYptELssZcfXrCDzDyvXmW
         atbAljhAwpge0hwzUCUuWQEwi7lQlKLg8ccNjmrwAynBrWM35HWdNjgNmdby6SOgcwM9
         8SEN/gYdwtkArbmX8x2xS8KSOOLz0+2DmTSzGtBOK2jxHIGSwtA2MBwbtO/rgBR3KR01
         8E54aFcTLMDvodBbT3J6fR1/xDNh56JGef5tk8u37BpeZme0W+vpgt9v88r62L3h2Lq3
         wnAOYLwpi4Ze43tf41xW5gij1C2yQP+i10PpcRCfv7bV43WxehBPA++rcTJPB8Z89dIE
         LXvQ==
X-Gm-Message-State: APjAAAX8N+G160QtLIxYvn6BvIfsYpIzcmJcscDry4la9Vfgvxmq9HsO
        fQiomMzEQSdk49UotWr/VInMLr8+G77nj47fYnM3wA==
X-Google-Smtp-Source: APXvYqzo3BPdycAse3Htdf7dfy4CaRvWLFYYksrIdHe8DlxT8HjTEYGrjafcJ0UqTs0pCqgQA8CF9clWAYPjunoO3LI=
X-Received: by 2002:a17:906:6bd5:: with SMTP id t21mr1091270ejs.128.1569263183453;
 Mon, 23 Sep 2019 11:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <20190923150213.2ub26ys4mhpp2hm5@uno.localdomain> <20190923161934.GF5056@pendragon.ideasonboard.com>
In-Reply-To: <20190923161934.GF5056@pendragon.ideasonboard.com>
From:   Daniel Gomez <daniel@qtec.com>
Date:   Mon, 23 Sep 2019 20:26:12 +0200
Message-ID: <CAH1Ww+SRuvttmTB3uXsWpDOwv5K-KiOM8eWXSZizcZ3TmWQ6hg@mail.gmail.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
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
        Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Hans

On Mon, 23 Sep 2019 at 18:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> (CC'ing Maxime)
>
> On Mon, Sep 23, 2019 at 05:02:13PM +0200, Jacopo Mondi wrote:
> > On Mon, Sep 23, 2019 at 04:12:55PM +0200, Hans Verkuil wrote:
> > > Hi all,
> > >
> > > Since we have three separate half-day sessions for different topics I decided
> > > to split the announcement for this in three emails as well, so these things
> > > can be discussed in separate threads.
> > >
> > > All sessions are in room Terreaux VIP Lounge - Level 0.
> > > There is a maximum of 15 people.
> > >
> > > The first session deals with the codec API and is on Tuesday morning from
> > > 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> > > time).
> > >
> > > Confirmed attendees for this session:
> > >
> > > Boris Brezillon <boris.brezillon@collabora.com>
> > > Alexandre Courbot <acourbot@chromium.org>
> > > Nicolas Dufresne <nicolas@ndufresne.ca>
> > > Tomasz Figa <tfiga@chromium.org>
> > > Ezequiel Garcia <ezequiel@collabora.com>
> > > Daniel Gomez <daniel@qtec.com>
> > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > Eugen Hristev <Eugen.Hristev@microchip.com>
> > > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Helen Koike <helen.koike@collabora.com>
> > > Michael Tretter <m.tretter@pengutronix.de>
> > > Hans Verkuil <hverkuil@xs4all.nl>
> > >
> > > Tentative:
> > >
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Jacopo Mondi <jacopo@jmondi.org>
> > >
> > > Jacopo, please confirm if you want to attend this session. I didn't find
> > > an email with explicit confirmation, so it was probably done via irc. But since
> > > this session is getting close to capacity I would prefer to keep attendance to
> > > those are actually working with codecs (or will work with it in the near future).
> >
> > I'm not really working on codecs, so if you're running almost at full
> > capacity please feel free to re-assign my seat.
>
> Same here. I think that Maxime Ripard, who isn't in the above list,
> would be able to contribute more than I could.
>
Same with codecs. Not a problem to give my seat if necessary.
> > If there are free seats I might flock in, but without contributing too
> > much to the discussions :)
> >
> > > If I missed someone, or you are on the list but won't attend after all, then
> > > please let me know.
> > >
> > >
> > >
> > > Agenda:
> > >
> > > - Status of any pending patches related to codec support.
> > >
> > > - Requirements of moving codec drivers out of staging.
> > >
> > > - Finalize the stateful encoder API. There are two pieces that need
> > >   to be defined:
> > >
> > > 1) Setting the frame rate so bitrate control can make sense, since
> > >    they need to know this information. This is also relevant for the
> > >    stateless codec (and this may have to change on a per-frame basis
> > >    for stateless codecs!).
> > >
> > >    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
> > >    pixelformats and S_PARM support, or we just add a new control for this.
> > >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
> > >    go for a control, then we need to consider the unit. We can use a
> > >    fraction as well. See this series that puts in the foundation for that:
> > >    https://patchwork.linuxtv.org/cover/58857/
> > >
> > >    I am inclined to go with a control, since the semantics don't really
> > >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
> > >    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
> > >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
> > >    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
> > >    vs OUTPUT thing, it is global to both queues.
> > >
> > > 2) Interactions between OUTPUT and CAPTURE formats.
> > >
> > >    The main problem is what to do if the capture sizeimage is too small
> > >    for the OUTPUT resolution when streaming starts.
> > >
> > >    Proposal: width and height of S_FMT(OUTPUT) are used to
> > >    calculate a minimum sizeimage (app may request more). This is
> > >    driver-specific. (Is it? Or is this codec-specific?)
> > >
> > >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> > >    for the encoder (i.e. we don't support mid-stream resolution
> > >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> > >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> > >    the patch adding this flag.
> > >
> > >    Of course, if we start to support mid-stream resolution
> > >    changes (or other changes that require a source change event),
> > >    then this flag should be dropped by the encoder driver and
> > >    documentation on how to handle the source change event should
> > >    be documented in the encoder spec. I prefer to postpone this
> > >    until we have an encoder than can actually do mid-stream
> > >    resolution changes.
> > >
> > >    If sizeimage of the OUTPUT is too small for the CAPTURE
> > >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> > >    then the second STREAMON (either CAPTURE or OUTPUT) will
> > >    return -ENOMEM since there is not enough memory to do the
> > >    encode.
> > >
> > >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> > >    be the case for all current encoders), then any bitrate controls
> > >    will be limited in range to what the current state (CAPTURE and
> > >    OUTPUT formats and frame rate) supports.
> > >
> > > - Stateless encoders?
> > >
> > > - Anything else? (I have a feeling I missed a codec-related topic, but
> > >   I can't find it in my mailbox)
>
> --
> Regards,
>
> Laurent Pinchart
