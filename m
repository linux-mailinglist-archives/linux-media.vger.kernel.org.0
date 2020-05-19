Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DD31D9DE7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 19:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgESR3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 13:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbgESR3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 13:29:38 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6943C08C5C0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 10:29:38 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id m64so262002qtd.4
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wkAQrt/QZ02YfB0Dlvt6hkvv0K9Gt8A3M2LmM+q+IYc=;
        b=n+OsgAYn6ku0Pc2ck7u0bL9hFV8sjFkFcV57lIKqgh9bcoOMz1PWnTir5mqhWeqvbI
         hXXPsPe59N3DA0+863kjIFZcQlU/8x4gSIcSjF71GlOaVVbsPBYb8BCoJBxH0LNzY5Jb
         fDK7RyOYHtnT+bsoz6VrydwL4KMMDAl5Tymh1ynXIp71+DeG4xCzui41AK4SRp6r3p2N
         xg/M8oGpxtHu2RKpQbSJvT91/7o7NPC555ACPVk1KnelaWOieUu2UJFiJWLEHz6YHukL
         oADRQ3FyqQlljmsXUREOjnsJsoR5i9pTQxmvLKBLUjVyZRFky2YZiZ1LTo4GFMCSWG2J
         6WzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wkAQrt/QZ02YfB0Dlvt6hkvv0K9Gt8A3M2LmM+q+IYc=;
        b=HK64No4y1R+aZKClwNvDUhU2wO+CBdpGzryntmwG2IiI8l3TXcxNjofbf2Uo5A5ptu
         K6iLio21RGb5l6RLgJaNMdweBnd+68E5FMyNg+1ZCWSNQLwbWK6bZT/8inoO9ImrrPbS
         lBHk0KP6odQxGg/ZjeWhHTKjpaHXsMwZm/Sagf68V5UIcMFksKjsM0xN0dkoHx47YeQD
         GL7fjAa7yBetONp9QBhMLT8WbYJpFhXVJ97waUSph7fe/WbHFjlSJUPfQ1mvV2DWQ83V
         4fxLro7nw4UneRMnLrD2oYjpeZ2JsPT2MaTrv8UkM96+24WgYLQS7bBonWBhEfFgSGbs
         Agxg==
X-Gm-Message-State: AOAM532ILqyJYadXJabdO8d4VLuNYbwJZA3khZPEG2z9eOrb8A+75A3l
        OKx2BLxRxuRx4v4YDUiXdu13SA==
X-Google-Smtp-Source: ABdhPJyG/+SPtbPU7sgZkWnIlc7Q8EUY+74vFhMeoDGz0YrICiPi+rzcx78sEKbplJvjubXnHYZjeg==
X-Received: by 2002:ac8:5504:: with SMTP id j4mr851837qtq.383.1589909377528;
        Tue, 19 May 2020 10:29:37 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id 4sm111319qky.130.2020.05.19.10.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 10:29:36 -0700 (PDT)
Message-ID: <92ac2db087ccf8fae853284ecc8bdf187e292097.camel@ndufresne.ca>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
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
        Emil Velikov <emil.velikov@collabora.com>
Date:   Tue, 19 May 2020 13:29:35 -0400
In-Reply-To: <CAD90VcaqE7PsLV=-xwWHXkct61wsiAuOCH78aLGSObfX9LqGsw@mail.gmail.com>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
         <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
         <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
         <2515515.r9knKAEANn@os-lin-dmo>
         <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
         <67e1ba850c5fbf84b09ec8266ab70dd08a10c2e3.camel@ndufresne.ca>
         <CAD90VcaqE7PsLV=-xwWHXkct61wsiAuOCH78aLGSObfX9LqGsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 19 mai 2020 à 17:37 +0900, Keiichi Watanabe a écrit :
> Hi Nicolas,
> 
> On Fri, May 15, 2020 at 8:38 AM Nicolas Dufresne <
> nicolas@ndufresne.ca
> > wrote:
> > Le lundi 11 mai 2020 à 20:49 +0900, Keiichi Watanabe a écrit :
> > > Hi,
> > > 
> > > Thanks Saket for your feedback. As Dmitry mentioned, we're focusing on
> > > video encoding and decoding, not camera. So, my reply was about how to
> > > implement paravirtualized video codec devices.
> > > 
> > > On Mon, May 11, 2020 at 8:25 PM Dmitry Sepp <
> > > dmitry.sepp@opensynergy.com
> > > >
> > > wrote:
> > > > Hi Saket,
> > > > 
> > > > On Montag, 11. Mai 2020 13:05:53 CEST Saket Sinha wrote:
> > > > > Hi Keiichi,
> > > > > 
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
> > > [1] 
> > > https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
> > > 
> > > 
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
> > > > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > > > with selective video streams from actual HW video devices.
> > > > 
> > > > We do support this in our device implementation. But spec in general has no
> > > > requirements or instructions regarding this. And it is in fact flexible
> > > > enough
> > > > to provide abstraction on top of several HW devices.
> > > > 
> > > > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > > > can also be used inside the VM userspace after getting access to
> > > > > paravirtualized HW camera devices .
> > > 
> > > Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> > > can translate virtio-video requests to this API, we can easily support
> > > multiple platforms.
> > > I'm not sure how feasible it is though, as I have no experience of
> > > using this API by myself...
> > 
> > Not sure which API you aim exactly, but what one need to remember is that
> > mapping virtio-video CODEC on top of VAAPI, V4L2 Stateless, NVDEC or other type
> > of "stateless" CODEC is not trivial and can't be done without userspace. Notably
> > because we don't want to do bitstream parsing in the kernel on the main CPU as
> > security would otherwise be very hard to guaranty. The other driver using same
> > API as virtio-video do bitstream parsing on a dedicated co-processor (through
> > firmware blobs though).
> > 
> > Having bridges between virtio-video, qemu and some abstraction library like
> > FFMPEG or GStreamer is certainly the best solution if you want to virtualize any
> > type of HW accelerated decoder or if you need to virtualized something
> > proprietary (like NVDEC). Please shout if you need help.
> > 
> 
> Yeah, I meant we should map virtio-video commands to a set of
> abstracted userspace APIs to avoid having many platform-dependent code
> in QEMU.
> This is the same with what we implemented in crosvm, a VMM on
> ChromiumOS. Crosvm's video device translates virtio-video commands
> into our own video decoding APIs [1, 2] which supports VAAPI, V4L2
> stateful and V4L2 stateless. Unfortunately, since our library is
> highly depending on Chrome, we cannot reuse this for QEMU.
> 
> So, I agree that using FFMPEG or GStreamer is a good idea. Probably,
> APIs in my previous link weren't for this purpose.
> Nicolas, do you know any good references for FFMPEG or GStreamer's
> abstracted video decoding APIs? Then, I may be able to think about how
> virtio-video protocols can be mapped to them.

The FFMpeg API for libavcodec can be found here:

  http://git.videolan.org/?p=ffmpeg.git;a=blob;f=libavcodec/avcodec.h

GStreamer does not really have such a low level CODEC API. So while
it's possible to use it (Wine project uses it for it's parsers as an
example, and Firefox use to have CODEC support wrapping GStreamer
CODEC), there will not be any one-to-one mapping. GStreamer is often
chosen as it's LGPL code does not carry directly any patented
implementation. It instead rely on plugins, which maybe provided as
third party, allowing to distribute your project while giving uses the
option to install potentially non-free technologies.

But overall, I can describe GStreamer API for CODEC wrapping (pipeline
less) as:

  - Push GstCaps describing the stream format
  - Push bitstream buffer on sink pad
  - When ready, buffers will be pushed through the push function 
    callback on src pad

Of course nothing prevent adding something like the vda abstraction in
qemu and make this multi-backend capable.

> 
> [1] libvda's C interface:
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/arc/vm/libvda/libvda_decode.h
> 
> [2] libvda's Rust interface:
> https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/arc/vm/libvda/rust/
> 
> 
> Best regards,
> Keiichi
> 
> > > [2]
> > > https://gstreamer.freedesktop.org/documentation/tutorials/playback/hardware-accelerated-video-decoding.html
> > > 
> > > 
> > > Best regards,
> > > Keiichi
> > > 
> > > > Regarding the cameras, unfortunately same as above.
> > > > 
> > > > Best regards,
> > > > Dmitry.
> > > > 
> > > > > Regards,
> > > > > Saket Sinha
> > > > > 
> > > > > On Mon, May 11, 2020 at 12:20 PM Keiichi Watanabe <
> > > > > keiichiw@chromium.org
> > > > > >
> > > > 
> > > > wrote:
> > > > > > Hi Dmitry,
> > > > > > 
> > > > > > On Mon, May 11, 2020 at 6:40 PM Dmitry Sepp <
> > > > > > dmitry.sepp@opensynergy.com
> > > > > > 
> > > > 
> > > > wrote:
> > > > > > > Hi Saket and all,
> > > > > > > 
> > > > > > > As we are working with automotive platforms, unfortunately we don't
> > > > > > > plan
> > > > > > > any Qemu reference implementation so far.
> > > > > > > 
> > > > > > > Of course we are ready to support the community if any help is needed.
> > > > > > > Is
> > > > > > > there interest in support for the FWHT format only for testing purpose
> > > > > > > or you want a full-featured implementation on the QEMU side?
> > > > > > 
> > > > > > I guess we don't need to implement the codec algorithm in QEMU.
> > > > > > Rather, QEMU forwards virtio-video requests to the host video device
> > > > > > or a software library such as GStreamer or ffmpeg.
> > > > > > So, what we need to implement in QEMU is a kind of API translation,
> > > > > > which shouldn't care about actual video formats so much.
> > > > > > 
> > > > > > Regarding the FWHT format discussed in the patch thread [1], in my
> > > > > > understanding, Hans suggested to have QEMU implementation forwarding
> > > > > > requests to the host's vicodec module [2].
> > > > > > Then, we'll be able to test the virtio-video driver on QEMU on Linux
> > > > > > even if the host Linux has no hardware video decoder.
> > > > > > (Please correct me if I'm wrong.)
> > > > > > 
> > > > > > Let me add Hans and Linux media ML in CC.
> > > > > > 
> > > > > > [1]  
> > > > > > https://patchwork.linuxtv.org/patch/61717/
> > > > > > 
> > > > > > [2] 
> > > > > > https://lwn.net/Articles/760650/
> > > > > > 
> > > > > > 
> > > > > > Best regards,
> > > > > > Keiichi
> > > > > > 
> > > > > > > Please note that the spec is not finalized yet and a major update is
> > > > > > > now
> > > > > > > discussed with upstream and the Chrome OS team, which is also
> > > > > > > interested
> > > > > > > and deeply involved in the process. The update mostly implies some
> > > > > > > rewording and reorganization of data structures, but for sure will
> > > > > > > require a driver rework.
> > > > > > > 
> > > > > > > Best regards,
> > > > > > > Dmitry.
> > > > > > > 
> > > > > > > On Samstag, 9. Mai 2020 16:11:43 CEST Saket Sinha wrote:
> > > > > > > > Hi,
> > > > > > > > 
> > > > > > > > As suggested on #qemu-devel IRC channel, I am including virtio-dev,
> > > > > > > > Gerd and Michael to point in the right direction how to move forward
> > > > > > > > with Qemu support for Virtio Video V4L2 driver
> > > > > > > > posted in [1].
> > > > > > > > 
> > > > > > > > [1]: 
> > > > > > > > https://patchwork.linuxtv.org/patch/61717/
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Saket Sinha
> > > > > > > > 
> > > > > > > > On Sat, May 9, 2020 at 1:09 AM Saket Sinha <
> > > > > > > > saket.sinha89@gmail.com
> > > > > > > > >
> > > > 
> > > > wrote:
> > > > > > > > > Hi ,
> > > > > > > > > 
> > > > > > > > > This is to inquire about Qemu support for Virtio Video V4L2 driver
> > > > > > > > > posted in [1].
> > > > > > > > > I am currently not aware of any upstream effort for Qemu reference
> > > > > > > > > implementation and would like to discuss how to proceed with the
> > > > > > > > > same.
> > > > > > > > > 
> > > > > > > > > [1]: 
> > > > > > > > > https://patchwork.linuxtv.org/patch/61717/
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Regards,
> > > > > > > > > Saket Sinha
> > > > > > > 
> > > > > > > ---------------------------------------------------------------------
> > > > > > > To unsubscribe, e-mail: 
> > > > > > > virtio-dev-unsubscribe@lists.oasis-open.org
> > > > > > > 
> > > > > > > For additional commands, e-mail: 
> > > > > > > virtio-dev-help@lists.oasis-open.org
> > > > > > > 

