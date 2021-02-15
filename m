Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C02F31B870
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 12:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBOLyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 06:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhBOLy1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 06:54:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D699C061788
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 03:53:44 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lBcRZ-0005X3-Sr; Mon, 15 Feb 2021 12:53:33 +0100
Message-ID: <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
Subject: Re: DMA-buf and uncached system memory
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Simon Ser <contact@emersion.fr>
Cc:     linaro-mm-sig@lists.linaro.org,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>
Date:   Mon, 15 Feb 2021 12:53:32 +0100
In-Reply-To: <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
         <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
         <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
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

Am Montag, dem 15.02.2021 um 10:34 +0100 schrieb Christian König:
> 
> Am 15.02.21 um 10:06 schrieb Simon Ser:
> > On Monday, February 15th, 2021 at 9:58 AM, Christian König <christian.koenig@amd.com> wrote:
> > 
> > > we are currently working an Freesync and direct scan out from system
> > > memory on AMD APUs in A+A laptops.
> > > 
> > > On problem we stumbled over is that our display hardware needs to scan
> > > out from uncached system memory and we currently don't have a way to
> > > communicate that through DMA-buf.
> > > 
> > > For our specific use case at hand we are going to implement something
> > > driver specific, but the question is should we have something more
> > > generic for this?
> > > 
> > > After all the system memory access pattern is a PCIe extension and as
> > > such something generic.
> > Intel also needs uncached system memory if I'm not mistaken?
> 
> No idea, that's why I'm asking. Could be that this is also interesting 
> for I+A systems.
> 
> > Where are the buffers allocated? If GBM, then it needs to allocate memory that
> > can be scanned out if the USE_SCANOUT flag is set or if a scanout-capable
> > modifier is picked.
> > 
> > If this is about communicating buffer constraints between different components
> > of the stack, there were a few proposals about it. The most recent one is [1].
> 
> Well the problem here is on a different level of the stack.
> 
> See resolution, pitch etc:.. can easily communicated in userspace 
> without involvement of the kernel. The worst thing which can happen is 
> that you draw garbage into your own application window.
> 
> But if you get the caching attributes in the page tables (both CPU as 
> well as IOMMU, device etc...) wrong then ARM for example has the 
> tendency to just spontaneously reboot
> 
> X86 is fortunately a bit more gracefully and you only end up with random 
> data corruption, but that is only marginally better.
> 
> So to sum it up that is not something which we can leave in the hands of 
> userspace.
> 
> I think that exporters in the DMA-buf framework should have the ability 
> to tell importers if the system memory snooping is necessary or not.

There is already a coarse-grained way to do so: the dma_coherent
property in struct device, which you can check at dmabuf attach time.

However it may not be enough for the requirements of a GPU where the 
engines could differ in their dma coherency requirements. For that you
need to either have fake struct devices for the individual engines or
come up with a more fine-grained way to communicate those requirements.

> Userspace components can then of course tell the exporter what the 
> importer needs, but validation if that stuff is correct and doesn't 
> crash the system must happen in the kernel.

What exactly do you mean by "scanout requires non-coherent memory"?
Does the scanout requestor always set the no-snoop PCI flag, so you get
garbage if some writes to memory are still stuck in the caches, or is
it some other requirement?

Regards,
Lucas

