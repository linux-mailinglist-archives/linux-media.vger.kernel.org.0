Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60317135B37
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 15:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbgAIOVA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 09:21:00 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44476 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgAIOVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 09:21:00 -0500
Received: by mail-ed1-f68.google.com with SMTP id bx28so5710666edb.11
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 06:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0nJwPkHynCXhPFMR6q+iIUUkXlM488ZgEFq/3mlsCBs=;
        b=S6h1KytFT7dqEU8MG5BZAkUKlqrDG73W3dfgQGSjEiqZzv2XX4pHJoMQbDgMK/DNnC
         nBkWkXtuaaXhkOwvI3eH/MLrfOhqebmQfA3Fwe+EJzMREIArGsFcNxfAFgLfSKPjA+RE
         LRc0RP9wcfCLoiUPtATYvMrCw/o9qV1I9a524=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0nJwPkHynCXhPFMR6q+iIUUkXlM488ZgEFq/3mlsCBs=;
        b=UDrV+dgex8Jx2tYiwPyvYnPW2PSkyosVBkRqiJF3yp9CekJxWjq4RXX1osuLnMhdcP
         wyjhWSgrj4agPdRGDTF2BiMd0dEZ/BJ91Zz2nSCRiaYUQ8gFdgMrq6n1moBGZCf9mJ1B
         ri4ae0KHXsDo0XXmdJvKrIz1t+AEJaQSll84DdcK8vqA2nzR0UZxmcX8WJmOgIJBrDbX
         2AUHHP/oz28TnypcaYGQXGdBLGfaVXpyjidkj9lC95KGeJ+3NemTPJDyftXWZezmPQ1w
         pMZBeAmP7nR7dvGNBhxn5Nsmo8laaGXFLmr1Mn6uTcOtSKtN5UGMTXZeVadXhrAihGxd
         jsHg==
X-Gm-Message-State: APjAAAUgnE5y4MW0wWU7zexsZqNYYR5eMwuWkDwvVZ5cb6KAtXxYfRfu
        W+BUNoXXUrHFRO+8bMTX9r7u1BI+11czOw==
X-Google-Smtp-Source: APXvYqy5Jbz+CvxMfFe2jgdBHvV5O9HbYpbLDyftrACMPrgCuL2B0PmrR/P7yyvrqqUBnZ0uye3ZmQ==
X-Received: by 2002:a05:6402:505:: with SMTP id m5mr11239933edv.15.1578579657912;
        Thu, 09 Jan 2020 06:20:57 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id by2sm102470ejb.45.2020.01.09.06.20.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 06:20:56 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id a5so3129309wmb.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2020 06:20:56 -0800 (PST)
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr5113112wmc.168.1578579655936;
 Thu, 09 Jan 2020 06:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <3550989.gzE5nMqd4t@os-lin-dmo> <CAAFQd5BgkEUwBFWdv2ZH98egjm=u0dBRgtexqkzjES+J1SEmag@mail.gmail.com>
 <3878267.TzG3DlCiay@os-lin-dmo> <20191219131234.wm24cazvc7zrnhpn@sirius.home.kraxel.org>
 <CAD90Vcb4Vb49uHGRRg0nJaKo=goH6zOxdQR2d7piLH_byxDYyw@mail.gmail.com>
In-Reply-To: <CAD90Vcb4Vb49uHGRRg0nJaKo=goH6zOxdQR2d7piLH_byxDYyw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 9 Jan 2020 23:20:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DcYWymWyzdiyfy18HkUBsEhALYG+DLwjXGCpRGDaJqyQ@mail.gmail.com>
Message-ID: <CAAFQd5DcYWymWyzdiyfy18HkUBsEhALYG+DLwjXGCpRGDaJqyQ@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v2 1/1] virtio-video: Add virtio video
 device specification
To:     Keiichi Watanabe <keiichiw@chromium.org>
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

On Wed, Jan 8, 2020 at 10:52 PM Keiichi Watanabe <keiichiw@chromium.org> wrote:
>
> Hi Gerd,
>
> On Thu, Dec 19, 2019 at 10:12 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > However that still doesn't let the driver know which buffers will be
> > > > dequeued when. A simple example of this scenario is when the guest is
> > > > done displaying a frame and requeues the buffer back to the decoder.
> > > > Then the decoder will not choose it for decoding next frames into as
> > > > long as the frame in that buffer is still used as a reference frame,
> > > > even if one sends the drain request.
> > > It might be that I'm getting your point wrong, but do you mean some hardware
> > > can mark a buffer as ready to be displayed yet still using the underlying
> > > memory to decode other frames?
> >
> > Yes, this is how I understand Tomasz Figa.
> >
> > > This means, if you occasionally/intentionally
> > > write to the buffer you mess up the whole decoding pipeline.
> >
> > And to avoid this the buffer handling aspect must be clarified in the
> > specification.  Is the device allowed to continue using the buffer after
> > finishing decoding and completing the queue request?  If so, how do we
> > hand over buffer ownership back to the driver so it can free the pages?
> > drain request?  How do we handle re-using buffers?  Can the driver
> > simply re-queue them and expect the device figures by itself whenever it
> > can use the buffer or whenever it is still needed as reference frame?
>
> The device shouldn't be able to access buffers after it completes a
> queue request.
> The device can touch buffer contents from when a queue request is sent
> until the device responds it.
> In contrast, the driver must not modify buffer contents in that period.
>
> Regarding re-using, the driver can simply re-queue buffers returned by
> the device. If the device needs a buffer as reference frame, it must
> not return the buffer.

I think that might not be what we expect. We want the decoder to
return a decoded frame as soon as possible, but that decoded frame may
be also needed for decoding next frames. In V4L2 stateful decoder, the
API is defined that the client must not modify the decoded
framebuffer, otherwise decoding next frames may not be correct. We may
need something similar, with an explicit operation that makes the
buffers not accessible to the host anymore. I think the queue flush
operation could work as such.

> I'll describe this rule in the next version of the patch.
>
> Best regards,
> Keiichi
>
> >
> > cheers,
> >   Gerd
> >
