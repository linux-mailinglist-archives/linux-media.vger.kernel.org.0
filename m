Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBF61261AB
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 13:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfLSMGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 07:06:15 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33574 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLSMGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 07:06:14 -0500
Received: by mail-ed1-f67.google.com with SMTP id r21so4654454edq.0
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 04:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XIAhps/+ifYr7Rb7CFWBGadYP4lae5rc+o3YgNr7BxY=;
        b=bYft5kZURSbQSr2bGp8TQE0W0vcbDA0osRKRIW/Fkg/qBuG8OvVUeaj9ppYqjmEoyn
         FHmrADmbnxGRoywDYgBJ2Wr+Zz0wJYEEp+/fVxCON/O73OK84pdwUYntc/foKbu9tUJt
         LlZ1DJ4wh/TePZYe3HzoBdbYsyR4YDrnZx1z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XIAhps/+ifYr7Rb7CFWBGadYP4lae5rc+o3YgNr7BxY=;
        b=pyjs6Cz2LuZ5Pr5x8mFlbNHNL9COtU/IfQvSeGnb2s7Ashw2FYN3dsOm34DvsSIaHz
         enBOsPHvi4MGPPJtehemj6WX+7eTZsu6T2IhlmCPDNDEek82bAUGvoBBZaNyyCzAkQKe
         1SqFYRqq+Xl2a9Gdc0wNcUa2ANASArn0vT7IVJ8rUmWbzW1qaK4gCBJy/nqiIezhJTqa
         uH1qBznAPxKEf1s6aiqePODM4EsCxsCR1qdI1ZQuzz5c6dfc9xe+6q6cfpS3dcmqzrK7
         6bQFZL4j62jiAw8Q/U8JgMhBDgx9Zh5cZL4KKJqxihTgEl35VUrr71VJ13yWuLsAMt6l
         zZrQ==
X-Gm-Message-State: APjAAAVyhMuglWRbLx0+49O2hNtZsVWYDAGDs7hV7xymLiDJfE+mD/lq
        klyufttlz1O25Cje0YnMX+kXj8wo4zm91w==
X-Google-Smtp-Source: APXvYqwJmhHqQLg3souzArB4F6tJoT1bJbOkHLvOcmmGRxUfWm9FaRfU32yUsbMykQsaLKa881wt0g==
X-Received: by 2002:aa7:c811:: with SMTP id a17mr8524209edt.272.1576757171807;
        Thu, 19 Dec 2019 04:06:11 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id u2sm338083edx.35.2019.12.19.04.06.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 04:06:11 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id c9so5716418wrw.8
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 04:06:10 -0800 (PST)
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr9617250wrt.100.1576757169872;
 Thu, 19 Dec 2019 04:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <3550989.gzE5nMqd4t@os-lin-dmo> <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
 <3878267.TzG3DlCiay@os-lin-dmo>
In-Reply-To: <3878267.TzG3DlCiay@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 19 Dec 2019 21:05:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bs5Aerr++gc=D_nyHu4KaWw6RfW-TXHRGEjVaf2dTx2Q@mail.gmail.com>
Message-ID: <CAAFQd5Bs5Aerr++gc=D_nyHu4KaWw6RfW-TXHRGEjVaf2dTx2Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        Enrico Granata <egranata@google.com>, fziglio@redhat.com,
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

On Thu, Dec 19, 2019 at 7:55 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Tomasz,
>
> On Donnerstag, 19. Dezember 2019 10:59:02 CET Tomasz Figa wrote:
> > On Thu, Dec 19, 2019 at 6:48 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > Hi,
> > >
> > > On Donnerstag, 19. Dezember 2019 08:46:39 CET Gerd Hoffmann wrote:
> > > > On Wed, Dec 18, 2019 at 11:08:37PM +0900, Tomasz Figa wrote:
> > > > > On Wed, Dec 18, 2019 at 10:40 PM Gerd Hoffmann <kraxel@redhat.com>
> wrote:
> > > > > >   Hi,
> > > > > >
> > > > > > > +The device MUST mark the last buffer with the
> > > > > > > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > > > > > > +sequence.
> > > > > >
> > > > > > No, that would build a race condition into the protocol.  The device
> > > > > > could complete the last buffer after the driver has sent the drain
> > > > > > command but before the device saw it.  So the flag would not be
> > > > > > reliable.
> > > > > >
> > > > > > I also can't see why the flag is needed in the first place.  The
> > > > > > driver
> > > > > > should know which buffers are queued still and be able to figure
> > > > > > whenever the drain is complete or not without depending on that
> > > > > > flag.
> > > > > > So I'd suggest to simply drop it.
> > > > >
> > > > > Unfortunately video decoders are not that simple. There are always
> > > > > going to be some buffers on the decoder side used as reference frames.
> > > > > Only the decoder knows when to release them, as it continues decoding
> > > > > the stream.
> > > >
> > > > Not clearly defined in the spec:  When is the decoder supposed to send
> > > > the response for a queue request?  When it finished decoding (i.e. frame
> > > > is ready for playback), or when it doesn't need the buffer any more for
> > > > decoding (i.e. buffer can be re-queued or pages can be released)?
> > >
> > > In my eyes the both statements mean almost the same and both are valid. I
> > > think whatever underlying libraries are used for decoding on the device
> > > side, they simply won't return us the buffer as long as the HW device
> > > needs them to continue its normal operation. So your first sentence
> > > applies to output buffers, the second - to input buffers.
> > >
> > > My understanding is as follows: we send the response for a queue request
> > > as
> > > soon as the HW device on the host side passes the buffer ownership back to
> > > the client (like when VIDIOC_DQBUF has returned a buffer).
> >
> > That's how it's defined in V4L2 and what makes the most sense from the
> > video decoding point of view, as one wants to display frames as soon
> > as they are available.
> >
> > However that still doesn't let the driver know which buffers will be
> > dequeued when. A simple example of this scenario is when the guest is
> > done displaying a frame and requeues the buffer back to the decoder.
> > Then the decoder will not choose it for decoding next frames into as
> > long as the frame in that buffer is still used as a reference frame,
> > even if one sends the drain request.
> It might be that I'm getting your point wrong, but do you mean some hardware
> can mark a buffer as ready to be displayed yet still using the underlying
> memory to decode other frames? This means, if you occasionally/intentionally
> write to the buffer you mess up the whole decoding pipeline. That would be
> strange at least...

That's correct. It depends on the hardware, but in principle we don't
want to copy the frames decoded to temporary buffers for using them as
reference frames, as that would waste bandwidth and increase latency.
The contract between the kernel and the application is that it must
not write to the frame buffers if it wants to get correct decoding
results. But after all, I don't see a reason why the application would
write to those buffers.

Best regards,
Tomasz
