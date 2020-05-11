Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B53C1CDD45
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 16:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgEKObq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 10:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726173AbgEKObq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 10:31:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF38CC061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 07:31:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA753304;
        Mon, 11 May 2020 16:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589207502;
        bh=oSuLwOGHaFVj3MpyELVNUbPTFWevFH3FlsUl+NAZJU4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nyjABrsZDI1gLqkWjquSTgXs5RGdgURpyNSYZ7DI1/RqRsPX3CiM+Vc1WLMCuh0sp
         nOn/kNmb3tL1TqKCs/cUA+R6GHqc0GGFqzicffsd7pn2Xcr7upDuVTDh6Ia1jiKovp
         iwqcfNNeR17CETZmytmHTx4jtIJnuALC42eKWbSk=
Date:   Mon, 11 May 2020 17:31:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Saket Sinha <saket.sinha89@gmail.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
        libcamera-devel@lists.libcamera.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [libcamera-devel] [virtio-dev] Re: Fwd: Qemu Support for Virtio
 Video V4L2 driver
Message-ID: <20200511143136.GC5830@pendragon.ideasonboard.com>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
 <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
 <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
 <2515515.r9knKAEANn@os-lin-dmo>
 <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
 <CAK25hWNR0WdpddU1kDChUB+PWiLG2A76KJW5u5F-LNkGBREj_g@mail.gmail.com>
 <CAD90VcYJe7+R256RdOQKxFQciq54+PwbyDRF1cynjOzdQBrq-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD90VcYJe7+R256RdOQKxFQciq54+PwbyDRF1cynjOzdQBrq-g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Jumping in the middle of this thread, so I apologize if some of my
comments are a bit out of context.

On Mon, May 11, 2020 at 11:06:34PM +0900, Keiichi Watanabe wrote:
> On Mon, May 11, 2020 at 9:33 PM Saket Sinha <saket.sinha89@gmail.com> wrote:
> > > > > I do not support the approach of  QEMU implementation forwarding
> > > > > requests to the host's vicodec module since  this can limit the scope
> > > > > of the virtio-video device only for testing,
> > > >
> > > > That was my understanding as well.
> > >
> > > Not really because the API which the vicodec provides is V4L2 stateful
> > > decoder interface [1], which are also used by other video drivers on
> > > Linux.
> > > The difference between vicodec and actual device drivers is that
> > > vicodec performs decoding in the kernel space without using special
> > > video devices. In other words, vicodec is a software decoder in kernel
> > > space which provides the same interface with actual video drivers.
> > > Thus, if the QEMU implementation can forward virtio-video requests to
> > > vicodec, it can forward them to the actual V4L2 video decoder devices
> > > as well and VM gets access to a paravirtualized video device.
> > >
> > > The reason why we discussed vicodec in the previous thread was it'll
> > > allow us to test the virtio-video driver without hardware requirement.
> > >
> > > [1] https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
> > >
> >
> > Thanks for clarification.
> >
> > Could  you provide your views if it would be possible to support also
> > paravirtualized v4l-subdev devices which is enabled by media
> > controller to expose ISP processing blocks to linux userspace.
> > Ofcourse, we might need to change implementation and spec to support that
> > Please refer (1) for details.

I don't think this would be the right level of abstraction. The V4L2 API
is way too low-level when it comes to camera paravirtualization (and may
not be the only API we'll have in the future). I thus recommend
virtualizing cameras with a higher-level API, more or less on top of
libcamera or the Android camera HAL (they both sit at the same level in
the camera stack). Anything lower than that won't be practical.

> Again, the current virtio-video protocol and driver only support video
> encoding and decoding. We had no detailed discussion about camera
> supports.
> Moreover, I personally disagree with supporting video capturing in
> virtio-video protocol. Instead, I believe it's better to have a
> separate protocol like "virtio-camera". Decoupling video codec APIs
> and camera APIs should make protocols simpler and easier to maintain.
> I suggested this idea in [1].
> 
> So, the answer to your question is:
> No in virtio-video protocol. But, it's possible to start designing a
> new "virtio-camera" protocol that supports camera features including
> image processing.
> 
> [1] https://markmail.org/message/4q2g5oqniw62pmqd
> 
> > > > > which instead can be used with multiple use cases such as -
> > > > >
> > > > > 1. VM gets access to paravirtualized  camera devices which shares the
> > > > > video frames input through actual HW camera attached to Host.
> > > >
> > > > This use-case is out of the scope of virtio-video. Initially I had a plan to
> > > > support capture-only streams like camera as well, but later the decision was
> > > > made upstream that camera should be implemented as separate device type. We
> > > > still plan to implement a simple frame capture capability as a downstream
> > > > patch though.
> > > >
> > > > >
> > > > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > > > with selective video streams from actual HW video devices.
> > > >
> > > > We do support this in our device implementation. But spec in general has no
> > > > requirements or instructions regarding this. And it is in fact flexible enough
> > > > to provide abstraction on top of several HW devices.
> > > >
> > > > >
> > > > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > > > can also be used inside the VM userspace after getting access to
> > > > > paravirtualized HW camera devices .
> > >
> > > Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> > > can translate virtio-video requests to this API, we can easily support
> > > multiple platforms.
> > > I'm not sure how feasible it is though, as I have no experience of
> > > using this API by myself...
> > >
> > > [2] https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html
> > >
> >
> > Like pointed out above, Gstreamer is not the only framework present there.
> > We have the newer libcamera framework [2] and then Openmax (used in
> > Android Hal )
> > Refer [3] for comparison.
> 
> It seems that we had miscommunication here. While I had mentioned
> Gstreamer as a generic implementation to cover "video decoding" APIs
> on various platforms, you were talking about "camera" APIs.
> As I said above, virtio-video is NOT designed for cameras.
> 
> For abstraction of video decoding APIs, I don't know any better
> library than Gstreamer. For cameras, libcamera sounds good, but I'm
> not so familiar with this area...
> 
> > My intentions are to make the implementation more generic so that it
> > can be used by different frameworks on different platforms.
> >
> > [1]: https://static.sched.com/hosted_files/osseu19/21/libcamera.pdf
> > [2]: http://libcamera.org
> > [3]: https://processors.wiki.ti.com/images/7/7e/OMX_Android_GST_Comparison.pdf

-- 
Regards,

Laurent Pinchart
