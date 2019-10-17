Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A3DDA6EB
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403841AbfJQIGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:06:24 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41618 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfJQIGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:06:24 -0400
Received: by mail-ed1-f65.google.com with SMTP id f20so991611edv.8
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrXzI59kSFWh8A0YCE3/Vu/m0YTemF22LKXq17LU8ac=;
        b=DLjlf/sSFGYeyj13Vp74uqYyk+d4+Ox0Tg5+1d63p3r/3N+gAVlbYA9tPC9lFQ3Tdy
         NKAR4YIxFzHj0K9gMd4aXi7/kmMNF9Aei541RQwoXYeNzzMD+BEz6x1ZyUAv+MgoT7S8
         yKPz2EGC4aMm43PFLGUY3qKIpCwXW+lbelSms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrXzI59kSFWh8A0YCE3/Vu/m0YTemF22LKXq17LU8ac=;
        b=IEEGW0x34PNIqR8g+aTsdC7DnYpNkNzEQ8D8FoxMVScd4EFTBtr8j64j6pZfgBbEK5
         bRT3/P2seBaL1Z46240vORs1jZcKANr+LXpgPNyqsln5U88QYybJigTzGXxiy6mzDbcv
         pAAPecfviwRTnuaIAyxZNETY0TqUWZFdKbg208TKM+Uo9edXzNg/DjMYFvfHHZMnqxfX
         MPG69+Z0NLw5yYd3mIdjF8NvDYyDpABmIOZJKH7XJFidkOFVp3niiMPghVJtThZujtvS
         m1mQzDg4A07+WsdRspp5OhftzJhg2L9ATxYPH5Es+SUqNlz5p99xATYRA2Rc07SKPnpS
         xhRA==
X-Gm-Message-State: APjAAAUx0Lm0uGsz57SBkc2VSBUb51z1sdTkvtC6W5V+bgdBsbBkGVnn
        WNd0hf/ycKlILlF2mW3mqfgJwwMACPlqNw==
X-Google-Smtp-Source: APXvYqwg18RON7FfkB0SezVaYSKC4OHYNuY6mJeYpujIrOQl0XfcTPvr3we111VDKbtFs2irVCg/8g==
X-Received: by 2002:a17:906:6d08:: with SMTP id m8mr2220503ejr.150.1571299581612;
        Thu, 17 Oct 2019 01:06:21 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id b7sm73730eda.67.2019.10.17.01.06.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 01:06:20 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id p14so1199456wro.4
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:06:19 -0700 (PDT)
X-Received: by 2002:a5d:6283:: with SMTP id k3mr1756292wru.46.1571299579113;
 Thu, 17 Oct 2019 01:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <12599990.jpbsygJuY9@os-lin-dmo> <20191015075422.yeknnqlsy3nun44r@sirius.home.kraxel.org>
 <9670471.GKRsIjc3Fr@os-lin-dmo>
In-Reply-To: <9670471.GKRsIjc3Fr@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Oct 2019 17:06:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D_dq6HyXfAYCG9dhuRg6onrJDoecXqf0As+e91wpVzfg@mail.gmail.com>
Message-ID: <CAAFQd5D_dq6HyXfAYCG9dhuRg6onrJDoecXqf0As+e91wpVzfg@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Stevens <stevensd@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 11:06 PM Dmitry Morozov
<dmitry.morozov@opensynergy.com> wrote:
>
> Hello Gerd,
>
> On Dienstag, 15. Oktober 2019 09:54:22 CEST Gerd Hoffmann wrote:
> > On Mon, Oct 14, 2019 at 03:05:03PM +0200, Dmitry Morozov wrote:
> > > On Montag, 14. Oktober 2019 14:34:43 CEST Gerd Hoffmann wrote:
> > > >   Hi,
> > > >
> > > > > My take on this (for a decoder) would be to allocate memory for output
> > > > > buffers from a secure ION heap, import in the v4l2 driver, and then to
> > > > > provide those to the device using virtio. The device side then uses
> > > > > the
> > > > > dmabuf framework to make the buffers accessible for the hardware. I'm
> > > > > not
> > > > > sure about that, it's just an idea.
> > > >
> > > > Virtualization aside, how does the complete video decoding workflow
> > > > work?  I assume along the lines of ...
> > > >
> > > >   (1) allocate buffer for decoded video frames (from ion).
> > > >   (2) export those buffers as dma-buf.
> > > >   (3) import dma-buf to video decoder.
> > > >   (4) import dma-buf to gpu.
> > > >
> > > > ... to establish buffers shared between video decoder and gpu?
> > > >
> > > > Then feed the video stream into the decoder, which decodes into the ion
> > > > buffers?  Ask the gpu to scanout the ion buffers to show the video?
> > > >
> > > > cheers,
> > > >
> > > >   Gerd
> > >
> > > Yes, exactly.
> > >
> > > [decoder]
> > > 1) Input buffers are allocated using  VIDIOC_*BUFS.
> >
> > Ok.
> >
> > > 2) Output buffers are allocated in a guest specific manner (ION, gbm).
> >
> > Who decides whenever ION or gbm is used?  The phrase "secure ION heap"
> > used above sounds like using ION is required for decoding drm-protected
> > content.
>
> I mention the secure ION heap to address this Chrome OS related point:
> > 3) protected content decoding: the memory for decoded video frames
> > must not be accessible to the guest at all
>
> There was an RFC to implement a secure memory allocation framework, but
> apparently it was not accepted: https://lwn.net/Articles/661549/.
>
> In case of Android, it allocates GPU buffers for output frames, so it is the
> gralloc implementation who decides how to allocate memory. It can use some
> dedicated ION heap or can use libgbm. It can also be some proprietary
> implementation.
>
> >
> > So, do we have to worry about ION here?  Or can we just use gbm?
>
> If we replace vendor specific code in the Android guest and provide a way to
> communicate meatdata for buffer allocations from the device to the driver, we
> can use gbm. In the PC world it might be easier.
>
> >
> > [ Note: don't know much about ion, other than that it is used by
> >         android, is in staging right now and patches to move it
> >         out of staging are floating around @ dri-devel ]

Chrome OS has cros_gralloc, which is an open source implementation of
gralloc on top of minigbm (which itself is built on top of the Linux
DRM interfaces). It's not limited to Chrome OS and I believe Intel
also uses it for their native Android setups. With that, we could
completely disregard ION, but I feel like it's not a core problem
here. Whoever wants to use ION should be still able to do so if they
back the allocations with guest pages or memory coming from the host
using some other interface and it can be described using an identifier
compatible with what we're discussing here.

Best regards,
Tomasz
