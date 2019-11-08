Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A508F431B
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbfKHJ2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 04:28:21 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40245 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJ2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:28:21 -0500
Received: by mail-lf1-f67.google.com with SMTP id f4so3911705lfk.7
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2019 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LyehGHVmMlTW4RQWb96hyHJ0nEaQPhUkKSLmcayno9Q=;
        b=cg75BuAXItuB57ZrP+0wlCiMJ1YviLvS4o2mWWCQGrHRi9D/mzY28+2d2IfChhS75y
         ndWLZPCkorT661V4oecf+8VUOkS0CblReCnBboMBMugBoKy116soyyWoqH+s9I87QTi0
         j7gt00YGY9Jfn41kap0sl4IfVFxs+FDJI/fCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LyehGHVmMlTW4RQWb96hyHJ0nEaQPhUkKSLmcayno9Q=;
        b=kyMqj+0B91lVmalJBUCba9M1DDt+d8aL+lIJ/a36CPDRYS62gYz8i1IrG6ITqmq34Z
         x4OnU57tkqYJmeplHBjDlz+O/mcWgWSBDh7TDUpYDSR0IBc13iZ4KruJ6AQ8tajJFW3S
         SgPFjdbDGypjq2RFlB2+hMUJ0A/7FPZ2jmIO5nsNcCx3YpuNeMb8SGmKa36wn/MC6oI3
         jeYENWwJfnNY/QT7N4w4Fj5ba4oT/NANUdnBMGgzklkAdACvkaBKWrmGaK7E+9jBM45v
         hS+jdE2i14taMGoEIn34CGU+svM3QpPKtSwLqJ9jMwBVIP6XHD6F8sTmtqdGWSOnOvn+
         cEpQ==
X-Gm-Message-State: APjAAAU4DWFMKBVSzdCKQfV7gSRBH0Y7tHWHgmUz/bdNaRBLSzTqbLKH
        gmFZch6YWGsTGpK+xKljmXWfX1RzNHBHZ9NsBQa1VQ==
X-Google-Smtp-Source: APXvYqxOeZwIKISNxkZcqw8eJxLL12PIFSMnF96JQArTZqyfvy172yD5cDevEsN08IC3OIf6qHvv4lOmUow73XGFSRA=
X-Received: by 2002:ac2:50d6:: with SMTP id h22mr5985451lfm.155.1573205298642;
 Fri, 08 Nov 2019 01:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191107095657.72dlxzm4uz7ndkek@sirius.home.kraxel.org> <1573181413.STYvEGL1rf@os-lin-dmo>
 <CAAFQd5CkTxCYhn70o5oiR4uLA7QyRMUw-XrRWorwZnwXGK0pDQ@mail.gmail.com> <20191108090506.jw4t46d3o4ooy7ns@sirius.home.kraxel.org>
In-Reply-To: <20191108090506.jw4t46d3o4ooy7ns@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Fri, 8 Nov 2019 18:28:07 +0900
Message-ID: <CAD90Vcbr7L2KsyDxPeoKPRt6y_ai8xkJ=J0JCGsW6tGZJGH=0A@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First of all, thanks Dmitry for sharing your protocol here.
I hope we can have a productive discussion to establish a nice protocol by
comparing with virtio-vdec and virtio-video.

On Fri, Nov 8, 2019 at 6:05 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > 1. Both the device and the driver submit requests to each other. For each
> > > request the response is sent as a separate request.
> >
> > To be more precise, in vdec there are no responses. The guest sends
> > commands to the host using one virtqueue. The host signals
> > asynchronous events, which might not have the exact earlier guest
> > request associated to them.
>
> How do you report errors?  Is there an error event for that?

We use a field |result| in virtio_vdec_host_req struct. That's to say
an error is
associated with a host request, not a guest request.
Also, we have VIRTIO_VDEC_HOST_REQ_NOTIFY_GLOBAL_ERROR
event to report an error associated with no host request.

>
> > An example of such special case could be
> > H.264 framebuffer reordering, where one might end up with a few decode
> > requests not resulting in any frames being output and then one decode
> > request that would trigger multiple accumulated frames to be returned.
>
> Note: this can be done with a request/response model too, by simply
> completing the decode request when there is frame data, so in that case
> multiple decode requests simply complete at the same time.  Yes, you can
> have multiple outstanding requests in virtio.  Out-of-order completion
> is also allowed btw.
>
> > > 2. No support for getting/setting video stream parameters. For example
> > > (decoder): output format (NV12, I420), so the driver cannot really select the
> > > output format after headers have been parsed.
> >
> > Getting video stream parameters is there, but they are currently left
> > fully in control of the host video decoder. Ability to select between
> > multiple possible formats could be worth adding, though.
>
> Nice to see you agree on that one ;)
>
> > > 3. No support for getting plane requirements from the device (sg vs contig,
> > > size, stride alignment, plane count).
> >
> > There is actually a bigger difference that results in that. Vdec
> > assumes host-allocated buffers coming from a different device, e.g.
> > virtio-gpu and the host having the right knowledge to allocate the
> > buffers correctly. This is related to the fact that it's generally
> > difficult to convey all the allocation constraints in a generic
> > manner.
>
> Yep, buffer handling is tricky, especially when it comes to decoding
> directly to gpu buffers and also when supporting playback of
> drm-protected streams where the guest might not be allowed to access
> the stream data.
>
> > > 5. Decoder only: new devices will be needed to support encoder, processor or
> > > capture. Currently input is always a bitstream, output is always a video
> > > frame. No way set input format (needed for encoder, see 2).
> >
> > The rationale for this was that this is a point of contact with the
> > host and a possible attack surface, so having a protocol as specific
> > as possible makes the attack surface smaller and is easier to validate
> > in the device implementation.
>
> I think it certainly makes sense to support both video encoding and
> video decoding with a single device spec.
>
> For capture (especially camera) and processor things are less clear,
> although there is at least some overlap too.  IIRC most of the spec is
> "TBD" for those anyway, so I'd suggest to drop them from the spec for
> now and focus on the video parts.
>

I agree that having video codec feature and camera feature in one
protocol sounds too complex.
Also, if we decide to have a buffer sharing device as Gerd suggested
in a different thread,
we'll get less overlaps between video codec feature and camera feature.
e.g. VIRTIO_VIDEO_T_RESOURCE_* would be simplified. (or removed?)


As Tomasz said, I think virtio-vdec can be modified to support encoding as well
without big changes.
I'm happy to update our protocol and driver implementation to support
encoding if
needed.

Best regards,
 Keiichi

> cheers,
>   Gerd
>
