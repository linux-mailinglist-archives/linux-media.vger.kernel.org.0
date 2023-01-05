Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A511A65F553
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 21:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235500AbjAEUkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 15:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235166AbjAEUkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 15:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DA263D22
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672951180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SxwDDroKvaIwcIlBx0h0G+S9M6E7SUpo3Qxif6uddWE=;
        b=KBDURBUCGUrGlBk52JDI50VNJtQwTi8se6bK4kPd77soNoDh2uPW6yKW9kL/QkbaPvtFKo
        br9lZvP9G9HFyEpRpz/OR66oekJZ01B/HERnieWHzt+D1VQdv8o1FO4FExA1gM/d+mCXvU
        GkioNCJ0Tz7PT7KISt3XrCxvumCkSpk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-V8GkaYBzMk2zU0txxJ6JBQ-1; Thu, 05 Jan 2023 15:39:29 -0500
X-MC-Unique: V8GkaYBzMk2zU0txxJ6JBQ-1
Received: by mail-lf1-f72.google.com with SMTP id i13-20020a056512340d00b004b8825890a1so13087705lfr.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 12:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxwDDroKvaIwcIlBx0h0G+S9M6E7SUpo3Qxif6uddWE=;
        b=GMIk1w2WuvPAQT59IglHjXXxWtdH/wUfADSPwZ2wFGk3/9atIxDwmFHoz7ycRX46tI
         CD0Cr222Yqwfl8j1NgbGGJ+qKvkhdi/C3hu7XWkK3yVJRKWgWnVpv5B/xU5g6EuceFJX
         HxD/T9R3HcSz2n28k6pZ91OOHmuowWsmehrBYYQGA97QGOATfpVkaw5tgeiROUVNIDPj
         8V36WEA5elXWUT+QmBduJAAdcl0STI/5HoHce42WmF99niSK7n+CwcSCkrnnEtNpzhM4
         SykxunFwhjRosfObVlGhToB0Hwu8AQOfka9VLMKgJDiXatYzk6lk/JzgfmxOcGOVzx5I
         GqDA==
X-Gm-Message-State: AFqh2kq0ZgNfdsTbZ5TQ2Vn6VEj4+fion1Zd2lNixLHD0ogeJIP16q8w
        LEQ/rdGBl3/UmAXCCC0CiIkMfQTSBOrZINLM/gQoDIcOLL6NAXmrqduDo95utL2K4FvpNJHD4q6
        U1trVaasswybA8aZqgP7YHs3BXK2OOWhFC3aSZcM=
X-Received: by 2002:a05:651c:22b:b0:27f:b397:db7d with SMTP id z11-20020a05651c022b00b0027fb397db7dmr2780801ljn.323.1672951168096;
        Thu, 05 Jan 2023 12:39:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuO0EmUNsdDw4P7N58EEx/SGxNxwbWPsmuA1YUgxpUc3NLcRgpkaHZLLSD+qOtqHnWWij/1V4jQbqORaFdUb8o=
X-Received: by 2002:a05:651c:22b:b0:27f:b397:db7d with SMTP id
 z11-20020a05651c022b00b0027fb397db7dmr2780796ljn.323.1672951167734; Thu, 05
 Jan 2023 12:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com> <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com> <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com> <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com> <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com> <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com> <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com> <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com> <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
 <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
In-Reply-To: <a4f56b61-7609-5424-b04c-9462764ac73b@amd.com>
From:   Sebastian Wick <sebastian.wick@redhat.com>
Date:   Thu, 5 Jan 2023 21:39:16 +0100
Message-ID: <CA+hFU4xU126J=o9YSRohx4_6Zw=hiKRPwfteO51bgOozn_hvEQ@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 9, 2022 at 11:28 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 09.12.22 um 09:26 schrieb Tomasz Figa:
> > [SNIP]
> > Although I think the most common case on mainstream Linux today is
> > properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> > GPU) and hoping that other devices would accept the buffers just fine,
> > which isn't a given on most platforms (although often it's just about
> > pixel format, width/height/stride alignment, tiling, etc. rather than
> > the memory itself). That's why ChromiumOS has minigbm and Android has
> > gralloc that act as the central point of knowledge on buffer
> > allocation.
>
> Yeah, completely agree. The crux is really that we need to improve those
> user space allocators by providing more information from the kernel.
>
> >> 2. We don't properly communicate allocation requirements to userspace.
> >>
> >> E.g. even if you allocate from DMA-Heaps userspace can currently only
> >> guess if normal, CMA or even device specific memory is needed.
> > DMA-buf heaps actually make it even more difficult for the userspace,
> > because now it needs to pick the right heap. With allocation built
> > into the specific UAPI (like V4L2), it's at least possible to allocate
> > for one specific device without having any knowledge about allocation
> > constraints in the userspace.
>
> Yes, same what Daniel said as well. We need to provide some more hints
> which allocator to use from the kernel.

This information doesn't necessarily have to come from the kernel. For
KMS it makes sense for the kernel to provide it but Vulkan drivers for
example could have the information entirely in the UMD. The important
point is that user space can somehow query which heap can be used with
which constraints for a specific operation. At that point it's
entirely a user space problem.

>
> >>>>>> So if a device driver uses cached system memory on an architecture=
 which
> >>>>>> devices which can't access it the right approach is clearly to rej=
ect
> >>>>>> the access.
> >>>>> I'd like to accent the fact that "requires cache maintenance" !=3D =
"can't access".
> >>>> Well that depends. As said above the exporter exports the buffer as =
it
> >>>> was allocated.
> >>>>
> >>>> If that means the the exporter provides a piece of memory which requ=
ires
> >>>> CPU cache snooping to access correctly then the best thing we can do=
 is
> >>>> to prevent an importer which can't do this from attaching.
> >>> Could you elaborate more about this case? Does it exist in practice?
> >>> Do I assume correctly that it's about sharing a buffer between one DM=
A
> >>> engine that is cache-coherent and another that is non-coherent, where
> >>> the first one ends up having its accesses always go through some kind
> >>> of a cache (CPU cache, L2/L3/... cache, etc.)?
> >> Yes, exactly that. What happens in this particular use case is that on=
e
> >> device driver wrote to it's internal buffer with the CPU (so some cach=
e
> >> lines where dirty) and then a device which couldn't deal with that tri=
ed
> >> to access it.
> > If so, shouldn't that driver surround its CPU accesses with
> > begin/end_cpu_access() in the first place?
>
> The problem is that the roles are reversed. The callbacks let the
> exporter knows that it needs to flush the caches when the importer is
> done accessing the buffer with the CPU.
>
> But here the exporter is the one accessing the buffer with the CPU and
> the importer then accesses stale data because it doesn't snoop the caches=
.
>
> What we could do is to force all exporters to use begin/end_cpu_access()
> even on it's own buffers and look at all the importers when the access
> is completed. But that would increase the complexity of the handling in
> the exporter.
>
> In other words we would then have code in the exporters which is only
> written for handling the constrains of the importers. This has a wide
> variety of consequences, especially that this functionality of the
> exporter can't be tested without a proper importer.
>
> I was also thinking about reversing the role of exporter and importer in
> the kernel, but came to the conclusion that doing this under the hood
> without userspace knowing about it is probably not going to work either.
>
> > The case that I was suggesting was of a hardware block that actually
> > sits behind the CPU cache and thus dirties it on writes, not the
> > driver doing that. (I haven't personally encountered such a system,
> > though.)
>
> Never heard of anything like that either, but who knows.
>
> >> We could say that all device drivers must always look at the coherency
> >> of the devices which want to access their buffers. But that would
> >> horrible complicate things for maintaining the drivers because then
> >> drivers would need to take into account requirements from other driver=
s
> >> while allocating their internal buffers.
> > I think it's partially why we have the allocation part of the DMA
> > mapping API, but currently it's only handling requirements of one
> > device. And we don't have any information from the userspace what
> > other devices the buffer would be used with...
>
> Exactly that, yes.
>
> > Actually, do we even have such information in the userspace today?
> > Let's say I do a video call in a web browser on a typical Linux
> > system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> > V4L2 camera fills in buffers with video frames and both encoder and
> > display consume them. Do we have a central place which would know that
> > a buffer needs to be allocated that works with the producer and all
> > consumers?
>
> Both X11 and Wayland have protocols which can be used to display a
> certain DMA-buf handle, their feedback packages contain information how
> ideal your configuration is, e.g. if the DMA-buf handle could be used or
> if an extra copy was needed etc...
>
> Similar exists between VAAPI and V4L2 as far as I know, but as you noted
> as well here it's indeed more about negotiating pixel format, stride,
> padding, alignment etc...
>
> The best we can do is to reject combinations which won't work in the
> kernel and then userspace could react accordingly.
>
> >> That's essentially the reason why we have DMA-buf heaps. Those heaps
> >> expose system memory buffers with certain properties (size, CMA, DMA b=
it
> >> restrictions etc...) and also implement the callback functions for CPU
> >> cache maintenance.
> >>
> > How do DMA-buf heaps change anything here? We already have CPU cache
> > maintenance callbacks in the DMA-buf API - the begin/end_cpu_access()
> > for CPU accesses and dmabuf_map/unmap_attachment() for device accesses
> > (which arguably shouldn't actually do CPU cache maintenance, unless
> > that's implied by how either of the involved DMA engines work).
>
> DMA-buf heaps are the neutral man in the middle.
>
> The implementation keeps track of all the attached importers and should
> make sure that the allocated memory fits the need of everyone.
> Additional to that calls to the cache DMA-api cache management functions
> are inserted whenever CPU access begins/ends.
>
> That's the best we can do for system memory sharing, only device
> specific memory can't be allocated like this.
>
> >>>> We do have the system and CMA dma-buf heap for cases where a device
> >>>> driver which wants to access the buffer with caches enabled. So this=
 is
> >>>> not a limitation in functionality, it's just a matter of correctly u=
sing it.
> >>>>
> >>> V4L2 also has the ability to allocate buffers and map them with cache=
s enabled.
> >> Yeah, when that's a requirement for the V4L2 device it also makes
> >> perfect sense.
> >>
> >> It's just that we shouldn't force any specific allocation behavior on =
a
> >> device driver because of the requirements of a different device.
> >>
> >> Giving an example a V4L2 device shouldn't be forced to use
> >> videobuf2-dma-contig because some other device needs CMA. Instead we
> >> should use the common DMA-buf heaps which implement this as neutral
> >> supplier of system memory buffers.
> > Agreed, but that's only possible if we have a central entity that
> > understands what devices the requested buffer would be used with. My
> > understanding is that we're nowhere close to that with mainstream
> > Linux today.
> >
> > // As a side note, videobuf2-dma-contig can actually allocate
> > discontiguous memory, if the device is behind an IOMMU. Actually with
> > the recent DMA API improvements, we could probably coalesce
> > vb2-dma-contig and vb2-dma-sg into one vb2-dma backend.
>
> That would probably make live a little bit simpler, yes.
>
> >>>> The problem is that in this particular case the exporter provides th=
e
> >>>> buffer as is, e.g. with dirty CPU caches. And the importer can't dea=
l
> >>>> with that.
> >>> Why does the exporter leave the buffer with dirty CPU caches?
> >> Because exporters always export the buffers as they would use it. And =
in
> >> this case that means writing with the CPU to it.
> >>
> > Sorry for the question not being very clear. I meant: How do the CPU
> > caches get dirty in that case?
>
> The exporter wrote to it. As far as I understand the exporter just
> copies things from A to B with memcpy to construct the buffer content.
>
> > [SNIP]
> >> Yes, totally agree. The problem is really that we moved bunch of MM an=
d
> >> DMA functions in one API.
> >>
> >> The bounce buffers are something we should really have in a separate
> >> component.
> >>
> >> Then the functionality of allocating system memory for a specific devi=
ce
> >> or devices should be something provided by the MM.
> >>
> >> And finally making this memory or any other CPU address accessible to =
a
> >> device (IOMMU programming etc..) should then be part of an DMA API.
> >>
> > Remember that actually making the memory accessible to a device often
> > needs to be handled already as a part of the allocation (e.g. dma_mask
> > in the non-IOMMU case). So I tend to think that the current division
> > of responsibilities is mostly fine - the dma_alloc family should be
> > seen as a part of MM already, especially with all the recent
> > improvements from Christoph, like dma_alloc_pages().
>
> Yes, that's indeed a very interesting development which as far as I can
> see goes into the right direction.
>
> > That said, it may indeed make sense to move things like IOMMU mapping
> > management out of the dma_alloc() and just reduce those functions to
> > simply returning a set of pages that satisfy the allocation
> > constraints. One would need to call dma_map() after the allocation,
> > but that's actually a fair expectation. Sometimes it might be
> > preferred to pre-allocate the memory, but only map it into the device
> > address space when it's really necessary.
>
> What I'm still missing is the functionality to allocate pages for
> multiple devices and proper error codes when dma_map() can't make the
> page accessible to a device.
>
> Regards,
> Christian.
>
> >>>>>>> It's a use-case that is working fine today with many devices (e.g=
. network
> >>>>>>> adapters) in the ARM world, exactly because the architecture spec=
ific
> >>>>>>> implementation of the DMA API inserts the cache maintenance opera=
tions
> >>>>>>> on buffer ownership transfer.
> >>>>>> Yeah, I'm perfectly aware of that. The problem is that exactly tha=
t
> >>>>>> design totally breaks GPUs on Xen DOM0 for example.
> >>>>>>
> >>>>>> And Xen is just one example, I can certainly say from experience t=
hat
> >>>>>> this design was a really really bad idea because it favors just on=
e use
> >>>>>> case while making other use cases practically impossible if not re=
ally
> >>>>>> hard to implement.
> >>>>> Sorry, I haven't worked with Xen. Could you elaborate what's the
> >>>>> problem that this introduces for it?
> >>>> That's a bit longer topic. The AMD XEN devs are already working on t=
his
> >>>> as far as I know. I can ping internally how far they got with sendin=
g
> >>>> the patches out to avoid this problem.
> >>> Hmm, I see. It might be a good data point to understand in which
> >>> direction we should be going, but I guess we can wait until they send
> >>> some patches.
> >> There was just recently a longer thread on the amd-gfx mailing list
> >> about that. I think looking in there as well might be beneficial.
> > Okay, let me check. Thanks,
> >
> > Best regards,
> > Tomasz
>

