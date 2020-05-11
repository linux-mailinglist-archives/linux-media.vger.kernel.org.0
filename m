Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3111CD8DD
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgEKLtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727019AbgEKLts (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:49:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01984C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:49:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id a9so7227027lfb.8
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B21F7CiOg+DDDaqcnQJW0RYfm2fpIW2cEenamiuDnaA=;
        b=A53Unz8Owy5JTyr9M5bWp9gLHNtWnSvJtGt1v6oqr3IeXsxJ0ugGzoCAjVun/M/448
         mYD/I+0FPQMyINWyPxjg898kLjLdGFL2kILNGhDnTlefdcj34ZjP1MJpzch+FlY+yW79
         6X+0zmCJbzk0LggSaFKu/+39KHg4CtDlf/hqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B21F7CiOg+DDDaqcnQJW0RYfm2fpIW2cEenamiuDnaA=;
        b=jCZtbb9Zn8+vH2LgA12xwDJE+rk3hljbqZ37DFEzkXdR/t7bKxvNuz1DOm19QxNR7Y
         qBqZQBEMrsVTvkvUwSkrV7RaYAhvMD3gJ3bM+Tt5aGXAq2BsKp6uPQFneTH9r1kh60sz
         JRpVaCEonTMI4eNNCssyd/wJraxVz4zUJzWU0wngGrz6CnuWk9iTbg5qpR763XioUynv
         OU+S1t+KBlXYZhhmuqoIPCgQ/bliAAtvkZJ1FtUc6zVSuuvu5J3j6CGL+Lc92r4BFm7E
         yfuqHD59r2+y/hmjJv8nsELULg8DmWaEy3N3KKyGE5BHNc/iWYwJLr+OsKc0nDkNC3Hi
         tONQ==
X-Gm-Message-State: AOAM531JzAZWkNI0S4nXwxqnP1XmK5dgOzdWo3V6u7kk/Tk/mTtmH1Ms
        ZhDqYC20hmLD+W+6ADUXAAftymYcufZBEpEFZuW5Rg==
X-Google-Smtp-Source: ABdhPJy2dm/OSzYbLWWpaDMwsa/U0AXERYmQvZeMpWlmx2lpQWzJ5BXYK0R27wI7E9fHJmoZpAWuq7QjCsf4UJPK3RE=
X-Received: by 2002:a19:6b13:: with SMTP id d19mr11026821lfa.126.1589197785384;
 Mon, 11 May 2020 04:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
 <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com> <2515515.r9knKAEANn@os-lin-dmo>
In-Reply-To: <2515515.r9knKAEANn@os-lin-dmo>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 11 May 2020 20:49:33 +0900
Message-ID: <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Saket Sinha <saket.sinha89@gmail.com>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Pawel Osciak <posciak@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thanks Saket for your feedback. As Dmitry mentioned, we're focusing on
video encoding and decoding, not camera. So, my reply was about how to
implement paravirtualized video codec devices.

On Mon, May 11, 2020 at 8:25 PM Dmitry Sepp <dmitry.sepp@opensynergy.com> wrote:
>
> Hi Saket,
>
> On Montag, 11. Mai 2020 13:05:53 CEST Saket Sinha wrote:
> > Hi Keiichi,
> >
> > I do not support the approach of  QEMU implementation forwarding
> > requests to the host's vicodec module since  this can limit the scope
> > of the virtio-video device only for testing,
>
> That was my understanding as well.

Not really because the API which the vicodec provides is V4L2 stateful
decoder interface [1], which are also used by other video drivers on
Linux.
The difference between vicodec and actual device drivers is that
vicodec performs decoding in the kernel space without using special
video devices. In other words, vicodec is a software decoder in kernel
space which provides the same interface with actual video drivers.
Thus, if the QEMU implementation can forward virtio-video requests to
vicodec, it can forward them to the actual V4L2 video decoder devices
as well and VM gets access to a paravirtualized video device.

The reason why we discussed vicodec in the previous thread was it'll
allow us to test the virtio-video driver without hardware requirement.

[1] https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html

>
> > which instead can be used with multiple use cases such as -
> >
> > 1. VM gets access to paravirtualized  camera devices which shares the
> > video frames input through actual HW camera attached to Host.
>
> This use-case is out of the scope of virtio-video. Initially I had a plan to
> support capture-only streams like camera as well, but later the decision was
> made upstream that camera should be implemented as separate device type. We
> still plan to implement a simple frame capture capability as a downstream
> patch though.
>
> >
> > 2. If Host has multiple video devices (especially in ARM SOCs over
> > MIPI interfaces or USB), different VM can be started or hotplugged
> > with selective video streams from actual HW video devices.
>
> We do support this in our device implementation. But spec in general has no
> requirements or instructions regarding this. And it is in fact flexible enough
> to provide abstraction on top of several HW devices.
>
> >
> > Also instead of using libraries like Gstreamer in Host userspace, they
> > can also be used inside the VM userspace after getting access to
> > paravirtualized HW camera devices .

Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
can translate virtio-video requests to this API, we can easily support
multiple platforms.
I'm not sure how feasible it is though, as I have no experience of
using this API by myself...

[2] https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html

Best regards,
Keiichi

> >
>
> Regarding the cameras, unfortunately same as above.
>
> Best regards,
> Dmitry.
>
> > Regards,
> > Saket Sinha
> >
> > On Mon, May 11, 2020 at 12:20 PM Keiichi Watanabe <keiichiw@chromium.org>
> wrote:
> > > Hi Dmitry,
> > >
> > > On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <dmitry.sepp@opensynergy.com>
> wrote:
> > > > Hi Saket and all,
> > > >
> > > > As we are working with automotive platforms, unfortunately we don't plan
> > > > any Qemu reference implementation so far.
> > > >
> > > > Of course we are ready to support the community if any help is needed.
> > > > Is
> > > > there interest in support for the FWHT format only for testing purpose
> > > > or you want a full-featured implementation on the QEMU side?
> > >
> > > I guess we don't need to implement the codec algorithm in QEMU.
> > > Rather, QEMU forwards virtio-video requests to the host video device
> > > or a software library such as GStreamer or ffmpeg.
> > > So, what we need to implement in QEMU is a kind of API translation,
> > > which shouldn't care about actual video formats so much.
> > >
> > > Regarding the FWHT format discussed in the patch thread [1], in my
> > > understanding, Hans suggested to have QEMU implementation forwarding
> > > requests to the host's vicodec module [2].
> > > Then, we'll be able to test the virtio-video driver on QEMU on Linux
> > > even if the host Linux has no hardware video decoder.
> > > (Please correct me if I'm wrong.)
> > >
> > > Let me add Hans and Linux media ML in CC.
> > >
> > > [1]  https://patchwork.linuxtv.org/patch/61717/
> > > [2] https://lwn.net/Articles/760650/
> > >
> > > Best regards,
> > > Keiichi
> > >
> > > > Please note that the spec is not finalized yet and a major update is now
> > > > discussed with upstream and the Chrome OS team, which is also interested
> > > > and deeply involved in the process. The update mostly implies some
> > > > rewording and reorganization of data structures, but for sure will
> > > > require a driver rework.
> > > >
> > > > Best regards,
> > > > Dmitry.
> > > >
> > > > On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > > > > Hi,
> > > > >
> > > > > As suggested on #qemu-devel IRC channel, I am including virtio-dev,
> > > > > Gerd and Michael to point in the right direction how to move forward
> > > > > with Qemu support for Virtio Video V4L2 driver
> > > > > posted in [1].
> > > > >
> > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > >
> > > > > Regards,
> > > > > Saket Sinha
> > > > >
> > > > > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <saket.sinha89@gmail.com>
> wrote:
> > > > > > Hi ,
> > > > > >
> > > > > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > > > > posted in [1].
> > > > > > I am currently not aware of any upstream effort for Qemu reference
> > > > > > implementation and would like to discuss how to proceed with the
> > > > > > same.
> > > > > >
> > > > > > [1]: https://patchwork.linuxtv.org/patch/61717/
> > > > > >
> > > > > > Regards,
> > > > > > Saket Sinha
> > > >
> > > > ---------------------------------------------------------------------
> > > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
>
