Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EECD5576AA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 11:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiFWJdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 05:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiFWJdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 05:33:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB8B44775
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 02:33:39 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1o4JDQ-00062c-Ax; Thu, 23 Jun 2022 11:33:32 +0200
Message-ID: <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        linaro-mm-sig@lists.linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Date:   Thu, 23 Jun 2022 11:33:30 +0200
In-Reply-To: <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
         <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
         <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
         <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
         <20220623101326.18beeab3@eldfell>
         <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
         <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
         <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
         <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
         <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, dem 23.06.2022 um 11:09 +0200 schrieb Christian König:
> Am 23.06.22 um 10:58 schrieb Lucas Stach:
> > Am Donnerstag, dem 23.06.2022 um 10:14 +0200 schrieb Christian König:
> > > Am 23.06.22 um 10:04 schrieb Lucas Stach:
> > > > Am Donnerstag, dem 23.06.2022 um 09:26 +0200 schrieb Christian König:
> > > > > Am 23.06.22 um 09:13 schrieb Pekka Paalanen:
> > > > > > On Thu, 23 Jun 2022 08:59:41 +0200
> > > > > > Christian König <christian.koenig@amd.com> wrote:
> > > > > > 
> > > > > > > The exporter isn't doing anything wrong here. DMA-buf are supposed to be
> > > > > > > CPU cached and can also be cache hot.
> > > > > > Hi,
> > > > > > 
> > > > > > what is that statement based on?
> > > > > On the design documentation of DMA-buf and the actual driver
> > > > > implementations.
> > > > > 
> > > > > Coherency and snooping of the CPU cache is mandatory for devices and
> > > > > root complexes in the PCI specification. Incoherent access is just an
> > > > > extension.
> > > > > 
> > > > > We inherited that by basing DMA-buf on the Linux kernel DMA-API which in
> > > > > turn is largely based on the PCI specification.
> > > > > 
> > > > > > Were the (mandatory for CPU access) cpu_access_begin/end functions &
> > > > > > ioctls not supposed to ensure that CPU cache is up-to-date / CPU cache
> > > > > > is fully flushed out?
> > > > > No, those functions are to inform the exporter that the importer has
> > > > > started and finished accessing the buffer using the CPU.
> > > > > 
> > > > > There is no signaling in the other direction. In other words the
> > > > > exporter doesn't inform the importer about CPU accesses because it is
> > > > > the owner of the buffer.
> > > > > 
> > > > > It's the responsibility of the importer to make sure that it can
> > > > > actually access the data in the buffer. If it can't guarantee that the
> > > > > importer shouldn't import the buffer in the first place.
> > > > This is not really correct. DMA-buf inherited the the map/unmap part
> > > > from the DMA API, which on cache coherent architecture is mostly a no-
> > > > op or ties into the IOMMU implementation to set up the pagetables for
> > > > the translation. On non cache coherent architectures this is the point
> > > > where any any necessary cache maintenance happens. DRM breaks this
> > > > model by caching the DMA-buf mapping for performance reasons.
> > > That's not only because of performance reasons, but also because of
> > > correctness.
> > > 
> > > At least the Vulkan API and a bunch of OpenGL extensions make it
> > > mandatory for the buffer to be cache coherent. The kernel is simply not
> > > informed about domain transfers.
> > > 
> > > For example you can just do a CPU copy to a ring buffer and the
> > > expectation is that an already running shader sees that.
> > Yes, that one is not really an issue as you know that at buffer
> > creation time and can make sure to map those buffers uncached on non
> > coherent arches. If there are no explicit domain transfer points non
> > coherent must bite the bullet and bypass the CPU caches, running
> > performance into the ground.
> 
> Yes, exactly that was what this mail thread was about. But this case is 
> currently not supported by DMA-buf.
> 
> In other words, cache coherency is currently mandatory for everybody 
> involved.
> 
> > > > In the DMA API keeping things mapped is also a valid use-case, but then
> > > > you need to do explicit domain transfers via the dma_sync_* family,
> > > > which DMA-buf has not inherited. Again those sync are no-ops on cache
> > > > coherent architectures, but do any necessary cache maintenance on non
> > > > coherent arches.
> > > Correct, yes. Coherency is mandatory for DMA-buf, you can't use
> > > dma_sync_* on it when you are the importer.
> > > 
> > > The exporter could of course make use of that because he is the owner of
> > > the buffer.
> > In the example given here with UVC video, you don't know that the
> > buffer will be exported and needs to be coherent without
> > synchronization points, due to the mapping cache at the DRM side. So
> > V4L2 naturally allocates the buffers from CPU cached memory. If the
> > expectation is that those buffers are device coherent without relying
> > on the map/unmap_attachment calls, then V4L2 needs to always
> > synchronize caches on DQBUF when the  buffer is allocated from CPU
> > cached memory and a single DMA-buf attachment exists. And while writing
> > this I realize that this is probably exactly what V4L2 should do...
> 
> No, the expectation is that the importer can deal with whatever the 
> exporter provides.
> 
> If the importer can't access the DMA-buf coherently it's his job to 
> handle that gracefully.

How does the importer know that the memory behind the DMA-buf is in CPU
cached memory?

If you now tell me that an importer always needs to assume this and
reject the import if it can't do snooping, then any DMA-buf usage on
most ARM SoCs is currently invalid usage. On most of the multimedia
targeted ARM SoCs being unable to snoop the cache is the norm, not an
exception.

> 
> See for example on AMD/Intel hardware most of the engines can perfectly 
> deal with cache coherent memory accesses. Only the display engines can't.
> 
> So on import time we can't even say if the access can be coherent and 
> snoop the CPU cache or not because we don't know how the imported 
> DMA-buf will be used later on.
> 
So for those mixed use cases, wouldn't it help to have something
similar to the dma_sync in the DMA-buf API, so your scanout usage can
tell the exporter that it's going to do non-snoop access and any dirty
cache lines must be cleaned? Signaling this to the exporter would allow
to skip the cache maintenance if the buffer is in CPU uncached memory,
which again is a default case for the ARM SoC world.

Regards,
Lucas

