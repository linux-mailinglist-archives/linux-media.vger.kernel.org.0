Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D071C1CDC9F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbgEKOGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 10:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730105AbgEKOGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 10:06:48 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD146C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 07:06:47 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l19so9638986lje.10
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=haJMwOvTf5fIl1NGZ/2blWPLBhZV7nR/CzNYhK0YNtE=;
        b=n3b7+DIaKbaJmEW0MOOdepTs9odKwvh9njPSmX33PZuzNcsHSDv4wcNL+zteym8y9v
         uchnC8mXHH90NCTwe+7m75OrDXq8d7DIMq37JOc1KHKC8LmQM7MH7ilxQ1AdTWAjf3Ty
         oHI3GCazdgs0X92bI+TDo9xWGu31EV6mzm9ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=haJMwOvTf5fIl1NGZ/2blWPLBhZV7nR/CzNYhK0YNtE=;
        b=odXZ4FC+fP2fg5vPOgJvCJNMfnxfzX4VRHQDme8zfHaNIcqMCbVVdgmSDoDjpcdnGM
         JEpRIAbmafYXm+fdH8mIRu3o4VSXzwrWfNU93qAJl5Z9ve13eZmt1nHlGgZuA003lqWJ
         k5Gp8AcuqbW/twD1cJdpG7P0YNekC1Na3GBPyaCOBbGq2HKf5UfKkFHP/5CLmE2C6QW5
         Htp73xQ3x37ewW0roQx2jMEO29WOAxywUSYiybZb27xEm78bFGKiezVFD6kYyMrV2ewC
         A3/bG3L+SyHdsh36sNG9sMtFj4Vq3xzl+VgW946mF56j/2Paq/SLuy/XAf5j3THaSdtt
         lBeA==
X-Gm-Message-State: AOAM5339ksLHMQAbWv6quQzppIhk98XiTKq/khaS9PtcDKYh9O7IbyYB
        Cu+lexWhBmk4hgRTcQwXtTbKOchJfOHq+aZM+dqPbg==
X-Google-Smtp-Source: ABdhPJwBH1E+ecdt/FDIZFNnCScP8N2GvNenf9y6DgFEQTQkGQSP9zS/tKDGLkdIcNibwUzh5C9ZKuEYv8PXGjGaVso=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr10453920ljp.277.1589206005853;
 Mon, 11 May 2020 07:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
 <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
 <2515515.r9knKAEANn@os-lin-dmo> <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
 <CAK25hWNR0WdpddU1kDChUB+PWiLG2A76KJW5u5F-LNkGBREj_g@mail.gmail.com>
In-Reply-To: <CAK25hWNR0WdpddU1kDChUB+PWiLG2A76KJW5u5F-LNkGBREj_g@mail.gmail.com>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Mon, 11 May 2020 23:06:34 +0900
Message-ID: <CAD90VcYJe7+R256RdOQKxFQciq54+PwbyDRF1cynjOzdQBrq-g@mail.gmail.com>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
To:     Saket Sinha <saket.sinha89@gmail.com>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
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
        Pawel Osciak <posciak@chromium.org>,
        libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Saket,

On Mon, May 11, 2020 at 9:33 PM Saket Sinha <saket.sinha89@gmail.com> wrote:
>
> Hi Keiichi,
>
> > > > I do not support the approach of  QEMU implementation forwarding
> > > > requests to the host's vicodec module since  this can limit the scope
> > > > of the virtio-video device only for testing,
> > >
> > > That was my understanding as well.
> >
> > Not really because the API which the vicodec provides is V4L2 stateful
> > decoder interface [1], which are also used by other video drivers on
> > Linux.
> > The difference between vicodec and actual device drivers is that
> > vicodec performs decoding in the kernel space without using special
> > video devices. In other words, vicodec is a software decoder in kernel
> > space which provides the same interface with actual video drivers.
> > Thus, if the QEMU implementation can forward virtio-video requests to
> > vicodec, it can forward them to the actual V4L2 video decoder devices
> > as well and VM gets access to a paravirtualized video device.
> >
> > The reason why we discussed vicodec in the previous thread was it'll
> > allow us to test the virtio-video driver without hardware requirement.
> >
> > [1] https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
> >
>
> Thanks for clarification.
>
> Could  you provide your views if it would be possible to support also
> paravirtualized v4l-subdev devices which is enabled by media
> controller to expose ISP processing blocks to linux userspace.
> Ofcourse, we might need to change implementation and spec to support that
> Please refer (1) for details.

Again, the current virtio-video protocol and driver only support video
encoding and decoding. We had no detailed discussion about camera
supports.
Moreover, I personally disagree with supporting video capturing in
virtio-video protocol. Instead, I believe it's better to have a
separate protocol like "virtio-camera". Decoupling video codec APIs
and camera APIs should make protocols simpler and easier to maintain.
I suggested this idea in [1].

So, the answer to your question is:
No in virtio-video protocol. But, it's possible to start designing a
new "virtio-camera" protocol that supports camera features including
image processing.

[1] https://markmail.org/message/4q2g5oqniw62pmqd

>
> > >
> > > > which instead can be used with multiple use cases such as -
> > > >
> > > > 1. VM gets access to paravirtualized  camera devices which shares the
> > > > video frames input through actual HW camera attached to Host.
> > >
> > > This use-case is out of the scope of virtio-video. Initially I had a plan to
> > > support capture-only streams like camera as well, but later the decision was
> > > made upstream that camera should be implemented as separate device type. We
> > > still plan to implement a simple frame capture capability as a downstream
> > > patch though.
> > >
> > > >
> > > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > > with selective video streams from actual HW video devices.
> > >
> > > We do support this in our device implementation. But spec in general has no
> > > requirements or instructions regarding this. And it is in fact flexible enough
> > > to provide abstraction on top of several HW devices.
> > >
> > > >
> > > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > > can also be used inside the VM userspace after getting access to
> > > > paravirtualized HW camera devices .
> >
> > Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> > can translate virtio-video requests to this API, we can easily support
> > multiple platforms.
> > I'm not sure how feasible it is though, as I have no experience of
> > using this API by myself...
> >
> > [2] https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html
> >
>
> Like pointed out above, Gstreamer is not the only framework present there.
> We have the newer libcamera framework [2] and then Openmax (used in
> Android Hal )
> Refer [3] for comparison.

It seems that we had miscommunication here. While I had mentioned
Gstreamer as a generic implementation to cover "video decoding" APIs
on various platforms, you were talking about "camera" APIs.
As I said above, virtio-video is NOT designed for cameras.

For abstraction of video decoding APIs, I don't know any better
library than Gstreamer. For cameras, libcamera sounds good, but I'm
not so familiar with this area...

Best regards,
Keiichi


>
> My intentions are to make the implementation more generic so that it
> can be used by different frameworks on different platforms.
>
> [1]: https://static.sched.com/hosted_files/osseu19/21/libcamera.pdf
> [2]: http://libcamera.org
> [3]: https://processors.wiki.ti.com/images/7/7e/OMX_Android_GST_Comparison.pdf
>
> Regards,
> Saket Sinha
