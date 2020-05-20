Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D2C1DBA5D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 18:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgETQ4k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 12:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgETQ4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 12:56:40 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC73C061A0E
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 09:56:39 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id dh1so1632989qvb.13
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 09:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CR0UjEAJ5fUm/PylDlZ/8c9kFq5LzRQaNT74clG4xsM=;
        b=VrNduQTstllm+ZCc8PWPCn6zY63CUDlVzkKUeGXEknEo1NTlyCjsWybDrXnS9kv8Fi
         xDABYu6QqrE60SStECO7Vq3/afCs0z3IrCVlJ0VdEmtP37cC8sftvUGgs39LB5wBekMF
         gIzLORT2nsV7riGsr3iaK0M3m8IEmL4n4bzlpgXltjpgKdcO+RaOs1RgB4mhWMmihdde
         hLcxNJU+lNePOV47o5hk3vaVQI4zSVH8l+nwbB7mYcbCfdijwnv/5dIkCnK3021vpL+d
         qCUkcwd3LkNesW+dkx7TpRHUEiBGlhKyqx2BSukoOXgwhK1GXuGm7+AgPDgfTxt83Pwv
         rQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CR0UjEAJ5fUm/PylDlZ/8c9kFq5LzRQaNT74clG4xsM=;
        b=RoEYo8ggEjHElRwOvGDi1wjK643ctST6/lSu4Ph/m+f+HRZ2hvmLaf8WJ2xC9YwnNO
         gv19USj7OznJkxtiuk1wmPmxzhNYFwcuFluyP2VTLRbxvfp8eJ1OTAEy2bb7vBxctwfF
         Am0u33skXgMQIOqWFVlmLAhhcLBrrXZW60FcayfO/V0KEKWlialnl69eYEYF8iU3PlzS
         yKCfECV6ktfQH/K+NoZoMQCV6JQcHe7uC47jpic0d6ExGsV1Oi9ZxexKAqwyah2IhdIu
         iz9ipjgdymPMzEjcCWurSQhd/WmTbCjmnWmJ4/dypi4iBe6lL+5ru1WJWuK7KSs30lP7
         1SOQ==
X-Gm-Message-State: AOAM533MD5esLVjlTkUw3N9oiHzqDTZ97g/uTmujddUqQhUamEpiFgeX
        ncxW5TN9YOFiMx2ZXmaEtOLwhw==
X-Google-Smtp-Source: ABdhPJyxNexoOwTlSUSx/H2cOIygfR+HYTcBTDxp509wV9eRDYSAPAQDvAeI+qa7gxXcygCqhZv3RA==
X-Received: by 2002:a0c:c342:: with SMTP id j2mr5611978qvi.209.1589993798931;
        Wed, 20 May 2020 09:56:38 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id u27sm99475qku.13.2020.05.20.09.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 09:56:38 -0700 (PDT)
Message-ID: <e3c2b56494e210c4f42db423e24409de84f21ec3.camel@ndufresne.ca>
Subject: Re: [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>
Date:   Wed, 20 May 2020 12:56:36 -0400
In-Reply-To: <20200520122421-mutt-send-email-mst@kernel.org>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com>
         <CAD90Vcb-x1KV++fWrmx+fLV5eNc2DiTtn8=OjQi7aUf7B0ULdA@mail.gmail.com>
         <CAK25hWM-hLdk=MSKgceumOUo9ZNBrrmM8qSe7MvTUAPGmur_HQ@mail.gmail.com>
         <2515515.r9knKAEANn@os-lin-dmo>
         <CAD90VcYeF7drbYNDiEioPBHcQcifqDYUia_CKqNLv_5VAMjPKw@mail.gmail.com>
         <67e1ba850c5fbf84b09ec8266ab70dd08a10c2e3.camel@ndufresne.ca>
         <CAD90VcaqE7PsLV=-xwWHXkct61wsiAuOCH78aLGSObfX9LqGsw@mail.gmail.com>
         <92ac2db087ccf8fae853284ecc8bdf187e292097.camel@ndufresne.ca>
         <CAPBb6MXUsMtNhxEPAdn4aTN8kNgt1eL8oLDDyNtXrD9bew_kMA@mail.gmail.com>
         <17ef7d07c50d419324a9191b216c8cc9ee95b1ae.camel@ndufresne.ca>
         <20200520122421-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 20 mai 2020 à 12:27 -0400, Michael S. Tsirkin a écrit :
> On Wed, May 20, 2020 at 12:21:05PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 20 mai 2020 Ã  12:19 +0900, Alexandre Courbot a Ã©crit :
> > > On Wed, May 20, 2020 at 2:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > Le mardi 19 mai 2020 Ã  17:37 +0900, Keiichi Watanabe a Ã©crit :
> > > > > Hi Nicolas,
> > > > > 
> > > > > On Fri, May 15, 2020 at 8:38 AM Nicolas Dufresne <
> > > > > nicolas@ndufresne.ca
> > > > > > wrote:
> > > > > > Le lundi 11 mai 2020 Ã  20:49 +0900, Keiichi Watanabe a Ã©crit :
> > > > > > > Hi,
> > > > > > > 
> > > > > > > Thanks Saket for your feedback. As Dmitry mentioned, we're focusing on
> > > > > > > video encoding and decoding, not camera. So, my reply was about how to
> > > > > > > implement paravirtualized video codec devices.
> > > > > > > 
> > > > > > > On Mon, May 11, 2020 at 8:25 PM Dmitry Sepp <
> > > > > > > dmitry.sepp@opensynergy.com
> > > > > > > wrote:
> > > > > > > > Hi Saket,
> > > > > > > > 
> > > > > > > > On Montag, 11. Mai 2020 13:05:53 CEST Saket Sinha wrote:
> > > > > > > > > Hi Keiichi,
> > > > > > > > > 
> > > > > > > > > I do not support the approach of  QEMU implementation forwarding
> > > > > > > > > requests to the host's vicodec module since  this can limit the scope
> > > > > > > > > of the virtio-video device only for testing,
> > > > > > > > 
> > > > > > > > That was my understanding as well.
> > > > > > > 
> > > > > > > Not really because the API which the vicodec provides is V4L2 stateful
> > > > > > > decoder interface [1], which are also used by other video drivers on
> > > > > > > Linux.
> > > > > > > The difference between vicodec and actual device drivers is that
> > > > > > > vicodec performs decoding in the kernel space without using special
> > > > > > > video devices. In other words, vicodec is a software decoder in kernel
> > > > > > > space which provides the same interface with actual video drivers.
> > > > > > > Thus, if the QEMU implementation can forward virtio-video requests to
> > > > > > > vicodec, it can forward them to the actual V4L2 video decoder devices
> > > > > > > as well and VM gets access to a paravirtualized video device.
> > > > > > > 
> > > > > > > The reason why we discussed vicodec in the previous thread was it'll
> > > > > > > allow us to test the virtio-video driver without hardware requirement.
> > > > > > > 
> > > > > > > [1]
> > > > > > > https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html
> > > > > > > 
> > > > > > > 
> > > > > > > > > which instead can be used with multiple use cases such as -
> > > > > > > > > 
> > > > > > > > > 1. VM gets access to paravirtualized  camera devices which shares the
> > > > > > > > > video frames input through actual HW camera attached to Host.
> > > > > > > > 
> > > > > > > > This use-case is out of the scope of virtio-video. Initially I had a plan to
> > > > > > > > support capture-only streams like camera as well, but later the decision was
> > > > > > > > made upstream that camera should be implemented as separate device type. We
> > > > > > > > still plan to implement a simple frame capture capability as a downstream
> > > > > > > > patch though.
> > > > > > > > 
> > > > > > > > > 2. If Host has multiple video devices (especially in ARM SOCs over
> > > > > > > > > MIPI interfaces or USB), different VM can be started or hotplugged
> > > > > > > > > with selective video streams from actual HW video devices.
> > > > > > > > 
> > > > > > > > We do support this in our device implementation. But spec in general has no
> > > > > > > > requirements or instructions regarding this. And it is in fact flexible
> > > > > > > > enough
> > > > > > > > to provide abstraction on top of several HW devices.
> > > > > > > > 
> > > > > > > > > Also instead of using libraries like Gstreamer in Host userspace, they
> > > > > > > > > can also be used inside the VM userspace after getting access to
> > > > > > > > > paravirtualized HW camera devices .
> > > > > > > 
> > > > > > > Regarding Gstreamer, I intended this video decoding API [2]. If QEMU
> > > > > > > can translate virtio-video requests to this API, we can easily support
> > > > > > > multiple platforms.
> > > > > > > I'm not sure how feasible it is though, as I have no experience of
> > > > > > > using this API by myself...
> > > > > > 
> > > > > > Not sure which API you aim exactly, but what one need to remember is that
> > > > > > mapping virtio-video CODEC on top of VAAPI, V4L2 Stateless, NVDEC or other type
> > > > > > of "stateless" CODEC is not trivial and can't be done without userspace. Notably
> > > > > > because we don't want to do bitstream parsing in the kernel on the main CPU as
> > > > > > security would otherwise be very hard to guaranty. The other driver using same
> > > > > > API as virtio-video do bitstream parsing on a dedicated co-processor (through
> > > > > > firmware blobs though).
> > > > > > 
> > > > > > Having bridges between virtio-video, qemu and some abstraction library like
> > > > > > FFMPEG or GStreamer is certainly the best solution if you want to virtualize any
> > > > > > type of HW accelerated decoder or if you need to virtualized something
> > > > > > proprietary (like NVDEC). Please shout if you need help.
> > > > > > 
> > > > > 
> > > > > Yeah, I meant we should map virtio-video commands to a set of
> > > > > abstracted userspace APIs to avoid having many platform-dependent code
> > > > > in QEMU.
> > > > > This is the same with what we implemented in crosvm, a VMM on
> > > > > ChromiumOS. Crosvm's video device translates virtio-video commands
> > > > > into our own video decoding APIs [1, 2] which supports VAAPI, V4L2
> > > > > stateful and V4L2 stateless. Unfortunately, since our library is
> > > > > highly depending on Chrome, we cannot reuse this for QEMU.
> > > > > 
> > > > > So, I agree that using FFMPEG or GStreamer is a good idea. Probably,
> > > > > APIs in my previous link weren't for this purpose.
> > > > > Nicolas, do you know any good references for FFMPEG or GStreamer's
> > > > > abstracted video decoding APIs? Then, I may be able to think about how
> > > > > virtio-video protocols can be mapped to them.
> > > > 
> > > > The FFMpeg API for libavcodec can be found here:
> > > > 
> > > >   http://git.videolan.org/?p=ffmpeg.git;a=blob;f=libavcodec/avcodec.h
> > > > 
> > > > GStreamer does not really have such a low level CODEC API. So while
> > > > it's possible to use it (Wine project uses it for it's parsers as an
> > > > example, and Firefox use to have CODEC support wrapping GStreamer
> > > > CODEC), there will not be any one-to-one mapping. GStreamer is often
> > > > chosen as it's LGPL code does not carry directly any patented
> > > > implementation. It instead rely on plugins, which maybe provided as
> > > > third party, allowing to distribute your project while giving uses the
> > > > option to install potentially non-free technologies.
> > > > 
> > > > But overall, I can describe GStreamer API for CODEC wrapping (pipeline
> > > > less) as:
> > > > 
> > > >   - Push GstCaps describing the stream format
> > > >   - Push bitstream buffer on sink pad
> > > >   - When ready, buffers will be pushed through the push function
> > > >     callback on src pad
> > > > 
> > > > Of course nothing prevent adding something like the vda abstraction in
> > > > qemu and make this multi-backend capable.
> > > 
> > > My understanding is that we don't need a particularly low-level API to
> > > interact with. The host virtual device is receiving the whole encoded
> > > data, and can thus easily reconstruct the original stream (minus the
> > > container) and pass it to ffmpeg/gstreamer. So we can be pretty
> > > high-level here.
> > > 
> > > Now the choice of API will also determine whether we want to allow
> > > emulation of codec devices, or whether we stay on a purely
> > > para-virtual track. If we use e.g. gstreamer, then the host can
> > > provide a virtual device that is backed by a purely software
> > > implementation. This can be useful for testing purposes, but for
> > > real-life usage the guest would be just as well using gstreamer
> > > itself.
> > 
> > Agreed.
> > 
> > > If we want to make sure that there is hardware on the host side, then
> > > an API like libva might make more sense, but it would be more
> > > complicated and may not support all hardware (I don't know if the V4L2
> > > backends are usable for instance).
> > 
> > To bring VAAPI into Qemu directly you'd have to introduce bitstream
> > parser, DPB management and other CODEC specific bits. I cannot speak
> > for the project, but that's re-inventing the wheel again with very
> > little gain. Best is to open the discussion with them early.
> > 
> > Note that it's relatively simple in both framework to only choose HW
> > accelerated CODECs. In ffmpeg, HW accelerator codecs can only be used
> > with HWContext, so your wrapper need to know specific HWContext for the
> > specific accelerator. In GStreamer, since 1.16, we add a metadata that
> > let the user know which decoder is hardware accelerated. (This is
> > usually used to disable HW acceleration at the moment).
> 
> I don't know too much about the options here, unfortunately. But I
> wonder about security implications of all these approaches.
> 
> We have this issue with other cases such as libusb where the
> library we are using is not expecting hostile input so does
> not validate it fully.
> This is often the case for pass-through approaches.
> Do all the options here expect untrusted input?

Both project cares as much as ChromeOS backend do. FFMPEG the main
backend in Firefox notably, GStreamer is used in many embedded
applications. We haven't started a complete rewrite in RUST (yet)
though.

Bitstream parsers (which are strictly requires for VAAPI and V4L2
Stateless CODEC handling through virtio-video) will always have
possible security issues, they deal with user bitstream and a very
large amount of parameters. A RUST rewrite only protects you from
taking control through buffer overflows, it does not mean your code
won't still have few crashers caused by hostile bitstream. The logical
thing to do if it get integrated into QEmu will be to sandbox this bit.
If you already virtualize your GPU, you likely have larger issues, as
for many GPUs, malicious shaders could freeze few GPU cores for
multiple seconds (or forever if you have older GPU drivers or a GPU
that does not have preemption/reset support).

Writing a backend from scratch just for QEmu will likely lead to no or
little maintenance, as it's would be very niche in the project. Relying
strictly on ChromeOS backend will mean a world without HEVC, without
interlaced content, but is already better in my view then redoing that.
Now it's unclear if Google will maintain a stable API there, something
that GStreamer and FFMPEG seems to do well now. It was also mention in
this discussion that it was not really an option, but I haven't yet
captured why.

There is plenty of approaches that could be taken of course. One could
completely abstract that backend, and use PipeWire to stream the
buffers between a sandboxed CODEC manager service and your QEmu
instance (the codec handling could even run in a PipeWire real-time
node to guaranty lowest latency). Or you could go with a custom, but
more targeted design. I think that's all open to who will implement and
what are the requirements. It also depends on the trend in the resource
management that QEmu project tries to achieve (or if that's delegated
somehow, I don't know). For CODECs, it can be quite variable how
resources are available.

Some V4L2 statefull driver offers only 1 or 2 instances which cannot be
multiplexed. The highest resolution and rate might only be possible for
1 stream too. Most VAAPI / V4L2 sateless drivers can be multiplex
without bound, but won't operate in real-time anymore if you have too
many streams. So I think from a QEmu perspective point of view, the
backend should enable few constraints, which in a real life deployement
will endup having to be configured manually. All sort of things that
need userspace for. Basically were I want to get with, is that the
kernel will never fully offer this service.

