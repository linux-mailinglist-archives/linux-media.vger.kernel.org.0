Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0BC1CD9F0
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 14:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgEKMdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 08:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727994AbgEKMdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 08:33:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366A0C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 05:33:14 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so9277173ljd.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHhlRVxZKnZbliAUXL2ki5LHIVcU18t1hWnVODIM8kE=;
        b=tzdxTYYuQDgOTkQaCQIpnv7DeeXpVWH/O+8LNEoRIv98ECHBTZzGk2ub9QLoiz6oKh
         gnThiTBNSw6U8W+V642JnmG1VkQVmCmIhmDTp3P/DbpR8Leur56gTP2MQGqM8iRLkrw8
         z9fo/syVfmXAG7cY1S7A/2PNxE+6chb3tGSqtsyVo82NTi03+hU5S05/t6om9A455YXe
         C4A54P5DURMrEjlrZ7aNLe37qRTzttlPDgkaTUzSSn51aRlsBj0zgiIWu2GX1iqvTYnS
         ienq5BjE9menV4KKH5fLmZBuxo5G4sfQ4BuBda6wn5A/B0OC3AvdahaeYJ4zhLbGUVeW
         M7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHhlRVxZKnZbliAUXL2ki5LHIVcU18t1hWnVODIM8kE=;
        b=tbAkMmrco4lSvdGGAamZHbNFWwXa/WH1up8XRlXqGX09FD4TuQWltP7l8hhSBlfnG+
         mWImLBr+DQ3LLTU6jK45WYPtVZd1lRI/hN7jrqQNTzY6AOy0jGDk3dKJDsFq+lGQKaB5
         MTqykGwB1SA3Vte5oy+/52N23nbQ858+CTCkR53zDTOMRF1HGIBERxpNCGb+aFw+bDsJ
         mUAQFfeyi4HtzK9aHSOHteQClWhQAG9QcZDJ/MpPb+T3903izBvFM/wK5uBbFJFlnF8x
         aokPTxnvdA1X3O/hToF5I8kTeWf9ueIDoUJ/xDosVLpN8+6GEh4r5ou63IaW4v5xEx/g
         8udQ==
X-Gm-Message-State: AOAM533rXPwElyumRlizwLz+wmso/dvEgteYHkOL4wgBLPVqtteUln7v
        8+UffLxBmaIYOvMVz1fAAbCYRBjbQVJqP1RPKTc=
X-Google-Smtp-Source: ABdhPJzRdnYM649Rfmf9USadLnN2By7FRNOk0ZZcMrrjzxwxjn0Wu8vexdR+iPvR1HwfNsuojV+tOqXNMrbF6iMOimQ=
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr10457298ljp.145.1589200392494;
 Mon, 11 May 2020 05:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
 <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
 <2515515.r9knKAEANn@os-lin-dmo> <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
In-Reply-To: <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
From:   Saket Sinha <saket.sinha89@gmail.com>
Date:   Mon, 11 May 2020 14:32:36 +0200
Message-ID: <CAK25hWNR0WdpddU1kDChUB+PWiLG2A76KJW5u5F-LNkGBREj_g@mail.gmail.com>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
To:     Keiichi Watanabe <keiichiw@chromium.org>
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

Hi Keiichi,

> > > I do not support the approach of  QEMU implementation forwarding
> > > requests to the host's vicodec module since  this can limit the scope
> > > of the virtio-video device only for testing,
> >
> > That was my understanding as well.
>
> Not really because the API which the vicodec provides is V4L2 stateful
> decoder interface [1], which are also used by other video drivers on
> Linux.
> The difference between vicodec and actual device drivers is that
> vicodec performs decoding in the kernel space without using special
> video devices. In other words, vicodec is a software decoder in kernel
> space which provides the same interface with actual video drivers.
> Thus, if the QEMU implementation can forward virtio-video requests to
> vicodec, it can forward them to the actual V4L2 video decoder devices
> as well and VM gets access to a paravirtualized video device.
>
> The reason why we discussed vicodec in the previous thread was it'll
> allow us to test the virtio-video driver without hardware requirement.
>
> [1] https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
>

Thanks for clarification.

Could  you provide your views if it would be possible to support also
paravirtualized v4l-subdev devices which is enabled by media
controller to expose ISP processing blocks to linux userspace.
Ofcourse, we might need to change implementation and spec to support that
Please refer (1) for details.

> >
> > > which instead can be used with multiple use cases such as -
> > >
> > > 1. VM gets access to paravirtualized  camera devices which shares the
> > > video frames input through actual HW camera attached to Host.
> >
> > This use-case is out of the scope of virtio-video. Initially I had a plan to
> > support capture-only streams like camera as well, but later the decision was
> > made upstream that camera should be implemented as separate device type. We
> > still plan to implement a simple frame capture capability as a downstream
> > patch though.
> >
> > >
> > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > with selective video streams from actual HW video devices.
> >
> > We do support this in our device implementation. But spec in general has no
> > requirements or instructions regarding this. And it is in fact flexible enough
> > to provide abstraction on top of several HW devices.
> >
> > >
> > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > can also be used inside the VM userspace after getting access to
> > > paravirtualized HW camera devices .
>
> Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> can translate virtio-video requests to this API, we can easily support
> multiple platforms.
> I'm not sure how feasible it is though, as I have no experience of
> using this API by myself...
>
> [2] https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html
>

Like pointed out above, Gstreamer is not the only framework present there.
We have the newer libcamera framework [2] and then Openmax (used in
Android Hal )
Refer [3] for comparison.

My intentions are to make the implementation more generic so that it
can be used by different frameworks on different platforms.

[1]: https://static.sched.com/hosted_files/osseu19/21/libcamera.pdf
[2]: http://libcamera.org
[3]: https://processors.wiki.ti.com/images/7/7e/OMX_Android_GST_Comparison.pdf

Regards,
Saket Sinha
