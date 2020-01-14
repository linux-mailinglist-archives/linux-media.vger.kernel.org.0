Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6125E13A190
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 08:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgANHTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 02:19:04 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45548 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgANHTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 02:19:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id j26so13070163ljc.12
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 23:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ospLVYL9sDL8+CsgfHnXVpLCGfOd0unA8100B46a2zQ=;
        b=alwVWoUZselOA01ZSKqYZHI0l6qc6u1qEpt1qLWVnlTKeEu1+lSGlw2DvZbpHMbDnR
         ZgdUUnJs/n+NFbLV7pWs6vjPWgUgOu77cs8kvz1G1O6gCe5avBVXQvM/icrARbQG40HS
         R0xaSXcz3kuVSxAXLNlE0ULfYsP9W+QIN/vVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ospLVYL9sDL8+CsgfHnXVpLCGfOd0unA8100B46a2zQ=;
        b=WlJPXo97Jt0aCCADeeDPPzBfQLhwbS1pAZUdpRN6ghnWG+cDoc6LHVIryD4curQt6S
         b/5jyxSURolliQ836mI8jrb/kOnXnCWBUv3s6OPrQnzRlqzUfnYr3Lu0HHC428RA9ZVE
         gwNDHuvq08U/9PtOJFSkt29KG9QIFiz1KPZbx9nyPTDFm7Pn4t/cQpgUaYSORFRe1GRv
         tLCpuByEYdr8g35FQWBIZV/JDqD8zq0IOvnx47e1YT8ex6K5P1oee6wABHuKyMT6GNAF
         W1WPOTpWJTxZHBazIcQwzxzkM/AgjQk3tfI5x2fxsbptQhMOXM9F6yuIbMnKi1D+uIX+
         qI+g==
X-Gm-Message-State: APjAAAVumkmf9ul4KnugzeBRH3FxfWOl4r6xetXNiz7TjIo17TCFdwWy
        vEGi+zAZRzz6DXlLJpiD73kWsramIZiqHRF1xGKAvA==
X-Google-Smtp-Source: APXvYqzx8NPny6ogCvjHy3itvwHdoD8lDAWNjp1MTxBKtgyNose7YCuW5An+iQS7XB9UTToSFlTn0xBvZsIy/89cI6E=
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr13271832ljj.129.1578986341768;
 Mon, 13 Jan 2020 23:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <3550989.gzE5nMqd4t@os-lin-dmo> <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
 <3878267.TzG3DlCiay@os-lin-dmo> <20191219131234.wm24cazvc7zrnhpn@sirius.home.kraxel.org>
 <CAD90Vcb4Vb49uHGRRg0nJaKo=goH6zOxdQR2d7piLH_byxDYyw@mail.gmail.com> <CAAFQd5DcYWymWyzdiyfy18HkUBsEhALYG+DLwjXGCpRGDaJqyQ@mail.gmail.com>
In-Reply-To: <CAAFQd5DcYWymWyzdiyfy18HkUBsEhALYG+DLwjXGCpRGDaJqyQ@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Tue, 14 Jan 2020 16:18:50 +0900
Message-ID: <CAD90VcbG6kR1Nw6DTr2RjwFrDja2B=Ohje_2MMeKBwpXGZ_MyA@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>, uril@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Jan 9, 2020 at 11:21 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Wed, Jan 8, 2020 at 10:52 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
> >
> > Hi Gerd,
> >
> > On Thu, Dec 19, 2019 at 10:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > >   Hi,
> > >
> > > > > However that still doesn't let the driver know which buffers will be
> > > > > dequeued when. A simple example of this scenario is when the guest is
> > > > > done displaying a frame and requeues the buffer back to the decoder.
> > > > > Then the decoder will not choose it for decoding next frames into as
> > > > > long as the frame in that buffer is still used as a reference frame,
> > > > > even if one sends the drain request.
> > > > It might be that I'm getting your point wrong, but do you mean some hardware
> > > > can mark a buffer as ready to be displayed yet still using the underlying
> > > > memory to decode other frames?
> > >
> > > Yes, this is how I understand Tomasz Figa.
> > >
> > > > This means, if you occasionally/intentionally
> > > > write to the buffer you mess up the whole decoding pipeline.
> > >
> > > And to avoid this the buffer handling aspect must be clarified in the
> > > specification.  Is the device allowed to continue using the buffer after
> > > finishing decoding and completing the queue request?  If so, how do we
> > > hand over buffer ownership back to the driver so it can free the pages?
> > > drain request?  How do we handle re-using buffers?  Can the driver
> > > simply re-queue them and expect the device figures by itself whenever it
> > > can use the buffer or whenever it is still needed as reference frame?
> >
> > The device shouldn't be able to access buffers after it completes a
> > queue request.
> > The device can touch buffer contents from when a queue request is sent
> > until the device responds it.
> > In contrast, the driver must not modify buffer contents in that period.
> >
> > Regarding re-using, the driver can simply re-queue buffers returned by
> > the device. If the device needs a buffer as reference frame, it must
> > not return the buffer.
>
> I think that might not be what we expect. We want the decoder to
> return a decoded frame as soon as possible, but that decoded frame may
> be also needed for decoding next frames. In V4L2 stateful decoder, the
> API is defined that the client must not modify the decoded
> framebuffer, otherwise decoding next frames may not be correct.

Thanks Tomasz! I didn't know the V4L2's convention.
So, the host should be able to read a frame buffer after it is
returned by responding RESOURCE_QUEUE command.


> We may
> need something similar, with an explicit operation that makes the
> buffers not accessible to the host anymore. I think the queue flush
> operation could work as such.

After offline discussion with Tomasz, I suspect the queue flush
operation (= VIRTIO_VIDEO_CMD_QUEUE_CLEAR) shouldn't work so, as it
just forces pending QUEUE requests to be backed for video seek.
So, a buffer can be readable from the device once it's queued until
STREAM_DESTROY or RESOURCE_DESTROY is called.

In my understanding, the life cycle of video buffers is defined as
this state machine.
https://drive.google.com/file/d/1c6oY5S_9bhpJlrOt4UfoQex0CanpG-kZ/view?usp=sharing

```
# The definition of the state machine in DOT language
digraph G {
  graph [ rankdir = LR, layout = dot ];

  init [shape=point]
  created [label="created", shape=circle]
  dequeued [label="dequeued", shape=circle]
  queued [label="queued", shape=circle]

  init -> created [label="RESOURCE_CREATE"]

  created -> queued [label="RESOURCE_QUEUE \n is sent"]
  dequeued -> queued [label="RESOURCE_QUEUE \n is sent"]
  queued -> dequeued [label="RESOURCE_QUEUE \n is returned"]

  created -> init [label="DESTROY"]
  dequeued -> init [label="DESTROY"]
}
```

In each state of this figure, the accessibility of each buffer should
be like the following:

# Input buffers
 state   |   Guest    |    Host
-----------------------------------
created  | Read/Write | -
queued   | -          | Read
dequeued | Read/Write | -

# Output buffers
 state   |   Guest    |    Host
----------------------------------
created  | Read       | -
queued   | -          | Read/Write
dequeued | Read       | Read

Does it make sense?
If ok, I'll have this state machine and tables in the next version of
spec to describe device/driver requirements by adding a subsection
about buffer life cycle.


By the way, regarding destruction of buffers, I suspect it doesn't
make much sense to have RESOURCE_DESTROY command. Though it was
suggested as a per-buffer command, it doesn't match the existing V4L2
API, as REQBUFS(0) destroys all buffers at once. I guess per-buffer
destruction would require hardware or firmware supports.
Even if we want to destroy buffers at once, we can destroy the stream
and recreate one. So, I wonder if we can remove RESOURCE_DESTROY
command from the first version of spec at least.
What do you think?

Best regards,
Keiichi


>
> > I'll describe this rule in the next version of the patch.
> >
> > Best regards,
> > Keiichi
> >
> > >
> > > cheers,
> > >   Gerd
> > >
