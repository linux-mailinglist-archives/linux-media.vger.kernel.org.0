Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334BB125E65
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLSJ7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:59:19 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41846 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfLSJ7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:59:19 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so4238394eds.8
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 01:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvCZyJtNfYnDKMl2uNXPFvRqMOQ0xf1KJQt+pHKHvDc=;
        b=H7M7sT9kt8F69kx8XJ9vvdfZ+umfyW3TkLRFtKkP1x0OCFsXoYrO28LktzrsPvgu65
         hi0Lfo+si/q7C9+06tUWUSdszhQEslo0WBEPvJ8s2dAHwCEHbfaL7f1tkSZe0itf2Jjn
         iuh4AlLF9sUsLQtuwCjosHWGYIN/YABYco/Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvCZyJtNfYnDKMl2uNXPFvRqMOQ0xf1KJQt+pHKHvDc=;
        b=iDSx+RCSuAj2GDnJk2/H3EEMzZoY03yXAoQoF9jVJL+piEVWXUsm0FckP0/oQ9t3xM
         Z4GwemijprnVAuNsO3pwCM4Bf9WsIuYOd0RteflBAv1E5HR+HiCWUzzapPzPfYZmJnfz
         KNtxQPg+TvViAw9KniJ0xYj+VZ7Vf3XY9rYs5kWfkS+Gu/Gpjc3K4qs9Tikohxef5BNR
         t6fQ3EtVDiEiBRb57cAhwBvOKGjM3K0EotbJ0Kf+mkyRPm28GiRTqxm1Qcgh/OZW1P6X
         AkLP8mkgUwlHtr2nADS9U2Q5Ufwm7oO10VCc9DRMPt+uI1ISffCf44tvUgEjoF3v3THg
         02UA==
X-Gm-Message-State: APjAAAXkbCGzZLoOmwc6Cv8aGDrNgxKbR4zqzj4vBTojhykRPO06l+x3
        7TC4tFefntPmbCtzOyh6DjxpTS/+RJCBuA==
X-Google-Smtp-Source: APXvYqw0ncSwIEsq8k9x6J4RFS73wECpaECTWOiSm2HDp7l6ndz0gAZ9okPZMTvhWAhazL6hrBJPpg==
X-Received: by 2002:a17:906:e219:: with SMTP id gf25mr8340589ejb.51.1576749556490;
        Thu, 19 Dec 2019 01:59:16 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id d7sm218181edv.90.2019.12.19.01.59.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 01:59:15 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id c9so5304430wrw.8
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2019 01:59:15 -0800 (PST)
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr8434296wrs.113.1576749554751;
 Thu, 19 Dec 2019 01:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <CAAFQd5AEJ0sUzqrXJAmFnBn0aU8Ef6FwXYo0LgK0NO_CdWXRVg@mail.gmail.com>
 <20191219074639.kdkrqxwb6fdb67hu@sirius.home.kraxel.org> <3550989.gzE5nMqd4t@os-lin-dmo>
In-Reply-To: <3550989.gzE5nMqd4t@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 19 Dec 2019 18:59:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
Message-ID: <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
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

On Thu, Dec 19, 2019 at 6:48 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi,
>
> On Donnerstag, 19. Dezember 2019 08:46:39 CET Gerd Hoffmann wrote:
> > On Wed, Dec 18, 2019 at 11:08:37PM +0900, Tomasz Figa wrote:
> > > On Wed, Dec 18, 2019 at 10:40 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >   Hi,
> > > >
> > > > > +The device MUST mark the last buffer with the
> > > > > +VIRTIO_VIDEO_BUFFER_F_EOS flag to denote completion of the drain
> > > > > +sequence.
> > > >
> > > > No, that would build a race condition into the protocol.  The device
> > > > could complete the last buffer after the driver has sent the drain
> > > > command but before the device saw it.  So the flag would not be
> > > > reliable.
> > > >
> > > > I also can't see why the flag is needed in the first place.  The driver
> > > > should know which buffers are queued still and be able to figure
> > > > whenever the drain is complete or not without depending on that flag.
> > > > So I'd suggest to simply drop it.
> > >
> > > Unfortunately video decoders are not that simple. There are always
> > > going to be some buffers on the decoder side used as reference frames.
> > > Only the decoder knows when to release them, as it continues decoding
> > > the stream.
> >
> > Not clearly defined in the spec:  When is the decoder supposed to send
> > the response for a queue request?  When it finished decoding (i.e. frame
> > is ready for playback), or when it doesn't need the buffer any more for
> > decoding (i.e. buffer can be re-queued or pages can be released)?
> In my eyes the both statements mean almost the same and both are valid. I
> think whatever underlying libraries are used for decoding on the device side,
> they simply won't return us the buffer as long as the HW device needs them to
> continue its normal operation. So your first sentence applies to output buffers,
> the second - to input buffers.
>
> My understanding is as follows: we send the response for a queue request as
> soon as the HW device on the host side passes the buffer ownership back to the
> client (like when VIDIOC_DQBUF has returned a buffer).

That's how it's defined in V4L2 and what makes the most sense from the
video decoding point of view, as one wants to display frames as soon
as they are available.

However that still doesn't let the driver know which buffers will be
dequeued when. A simple example of this scenario is when the guest is
done displaying a frame and requeues the buffer back to the decoder.
Then the decoder will not choose it for decoding next frames into as
long as the frame in that buffer is still used as a reference frame,
even if one sends the drain request.

>
> Thanks for reviewing!
>
> Regards,
> Dmitry.
>
> >
> > > How we defined this in the V4L2 stateful decoder interface is that if
> > > the decoder happened to return the last framebuffer before the drain
> > > request arrived, it would return one more, empty.
> >
> > Ok.  That is not clear from the spec.  I've read the drain request as as
> > "please stop decoding and complete all queue requests which are in the
> > virtqueue, even when you didn't process them yet".  In which case
> > completing the last pending queue request would clearly indicate the
> > draining request is complete.  Also completing the drain request should
> > only happen when the operation is finished.
> >
> > I think the various states a buffer can have and how queuing & deciding
> > & draining changes these states should be clarified in the
> > specification.
> >
> > cheers,
> >   Gerd
>
>
