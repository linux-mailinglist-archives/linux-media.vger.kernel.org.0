Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAB031B8DC
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 13:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhBOMR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 07:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhBOMRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 07:17:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D22C061786
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 04:16:44 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lBcns-0008Lc-J4; Mon, 15 Feb 2021 13:16:36 +0100
Message-ID: <04f2e57540896d2c51120236889a6ae293e711d8.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Simon Ser <contact@emersion.fr>
Cc:     linaro-mm-sig@lists.linaro.org,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Date:   Mon, 15 Feb 2021 13:16:35 +0100
In-Reply-To: <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
         <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
         <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
         <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, dem 15.02.2021 um 13:04 +0100 schrieb Christian König:
> Am 15.02.21 um 12:53 schrieb Lucas Stach:
> > Am Montag, dem 15.02.2021 um 10:34 +0100 schrieb Christian König:
> > > Am 15.02.21 um 10:06 schrieb Simon Ser:
> > > > On Monday, February 15th, 2021 at 9:58 AM, Christian König <christian.koenig@amd.com> wrote:
> > > > 
> > > > > we are currently working an Freesync and direct scan out from system
> > > > > memory on AMD APUs in A+A laptops.
> > > > > 
> > > > > On problem we stumbled over is that our display hardware needs to scan
> > > > > out from uncached system memory and we currently don't have a way to
> > > > > communicate that through DMA-buf.
> > > > > 
> > > > > For our specific use case at hand we are going to implement something
> > > > > driver specific, but the question is should we have something more
> > > > > generic for this?
> > > > > 
> > > > > After all the system memory access pattern is a PCIe extension and as
> > > > > such something generic.
> > > > Intel also needs uncached system memory if I'm not mistaken?
> > > No idea, that's why I'm asking. Could be that this is also interesting
> > > for I+A systems.
> > > 
> > > > Where are the buffers allocated? If GBM, then it needs to allocate memory that
> > > > can be scanned out if the USE_SCANOUT flag is set or if a scanout-capable
> > > > modifier is picked.
> > > > 
> > > > If this is about communicating buffer constraints between different components
> > > > of the stack, there were a few proposals about it. The most recent one is [1].
> > > Well the problem here is on a different level of the stack.
> > > 
> > > See resolution, pitch etc:.. can easily communicated in userspace
> > > without involvement of the kernel. The worst thing which can happen is
> > > that you draw garbage into your own application window.
> > > 
> > > But if you get the caching attributes in the page tables (both CPU as
> > > well as IOMMU, device etc...) wrong then ARM for example has the
> > > tendency to just spontaneously reboot
> > > 
> > > X86 is fortunately a bit more gracefully and you only end up with random
> > > data corruption, but that is only marginally better.
> > > 
> > > So to sum it up that is not something which we can leave in the hands of
> > > userspace.
> > > 
> > > I think that exporters in the DMA-buf framework should have the ability
> > > to tell importers if the system memory snooping is necessary or not.
> > There is already a coarse-grained way to do so: the dma_coherent
> > property in struct device, which you can check at dmabuf attach time.
> > 
> > However it may not be enough for the requirements of a GPU where the
> > engines could differ in their dma coherency requirements. For that you
> > need to either have fake struct devices for the individual engines or
> > come up with a more fine-grained way to communicate those requirements.
> 
> Yeah, that won't work. We need this on a per buffer level.
> 
> > > Userspace components can then of course tell the exporter what the
> > > importer needs, but validation if that stuff is correct and doesn't
> > > crash the system must happen in the kernel.
> > What exactly do you mean by "scanout requires non-coherent memory"?
> > Does the scanout requestor always set the no-snoop PCI flag, so you get
> > garbage if some writes to memory are still stuck in the caches, or is
> > it some other requirement?
> 
> Snooping the CPU caches introduces some extra latency, so what can 
> happen is that the response to the PCIe read comes to late for the 
> scanout. The result is an underflow and flickering whenever something is 
> in the cache which needs to be flushed first.

Okay, that confirms my theory on why this is needed. So things don't
totally explode if you don't do it, but to in order to guarantee access
latency you need to take the no-snoop path, which means your device
effectively gets dma-noncoherent.

> On the other hand when the don't snoop the CPU caches we at least get 
> garbage/stale data on the screen. That wouldn't be that worse, but the 
> big problem is that we have also seen machine check exceptions when 
> don't snoop and the cache is dirty.

If you attach to the dma-buf with a struct device which is non-coherent
it's the exporters job to flush any dirty caches. Unfortunately the DRM
caching of the dma-buf attachments in the DRM framework will get a bit
in the way here, so a DRM specific flush might be be needed. :/ Maybe
moving the whole buffer to uncached sysmem location on first attach of
a non-coherent importer would be enough?

> So this should better be coherent or you can crash the box. ARM seems to 
> be really susceptible for this, x86 is fortunately much more graceful 
> and I'm not sure about other architectures.

ARM really dislikes pagetable setups with different attributes pointing
to the same physical page, however you should be fine as long as all
cached aliases are properly flushed from the cache before access via a
different alias.

Regards,
Lucas

