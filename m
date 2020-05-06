Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116181C7842
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 19:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbgEFRnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 13:43:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728094AbgEFRnu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 13:43:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CB86208DB;
        Wed,  6 May 2020 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588787028;
        bh=YZsANvSKjkoobhC/OjUVOA5jZyPR7sjiwNq8DDRVE/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VCtirk6C29s2nVSDVOrYapTNbzYm63MyYgr17LGRvuO6vCElDhTgO1+AuvxTipmqG
         hU7lSDiUy+reDa0qGe66XRwl8SHOYbjhgb/xFm/pdU41rZZlTXynq8HoV2/srgybxE
         TuY+I2rNtSNHafGqhznobx5MCHS1gADJdc3idqQE=
Date:   Wed, 6 May 2020 19:43:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
Message-ID: <20200506174345.GA3711921@kroah.com>
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
 <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
 <20200506110722.GA2975410@kroah.com>
 <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
 <20200506155257.GB3537174@kroah.com>
 <46615f6e-11ec-6546-42a9-3490414f9550@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46615f6e-11ec-6546-42a9-3490414f9550@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 12:48:47AM +0800, Jia-Ju Bai wrote:
> 
> 
> On 2020/5/6 23:52, Greg KH wrote:
> > On Wed, May 06, 2020 at 11:30:22PM +0800, Jia-Ju Bai wrote:
> > > 
> > > On 2020/5/6 19:07, Greg KH wrote:
> > > > On Wed, May 06, 2020 at 06:13:01PM +0800, Jia-Ju Bai wrote:
> > > > > I have never modified DMA memory in the real world, but an attacker can use
> > > > > a malicious device to do this.
> > > > > There is a video that shows how to use the Inception tool to perform DMA
> > > > > attacks and login in the Windows OS without password:
> > > > > https://www.youtube.com/watch?v=HDhpy7RpUjM
> > > > If you have control over the hardware, and can write to any DMA memory,
> > > > again, there's almost nothing a kernel can do to protect from that.
> > > I think that each device can only access its own DMA memory, instead of any
> > > DMA memory for other hardware devices.
> > That's not true at all for all systems that Linux runs on.
> 
> I am not sure to understand this.
> For example, a driver requests DMA memory with "len" size by using:
>    mem = dma_alloc_coherent(..., len, ...);
> I think that the driver can only access DMA memory between "mem" and "mem +
> len", is it true?
> Can the driver access other DMA memory using some code like "mem + len *
> 10"?

Depends on the hardware platform.

> > > A feasible example is that, the attacker inserts a malicious device via
> > > PCI-E bus in a locked computer, when the owner of this computer leaves.
> > This is a semi-well-known issue.  It's been described in the past
> > regarding thunderbolt devices, and odds are, more people will run across
> > it again in the future and also complain about it.
> > 
> > The best solution is to solve this at the bus level, preventing
> > different devices access to other memory areas.
> > 
> > And providing physical access control to systems that you care about
> > this type of attack for.
> > 
> > Again, this isn't a new thing, but the ability for us to do much about
> > it depends on the specific hardware control, and how we set defaults up.
> 
> Yes, I agree that this issue is not new, because DMA attacks are old
> problems.
> But I am a little surprised that many current drivers are still vulnerable
> to DMA attacks.

Given that the attack vector is very hard to actually do, that's not
a suprise.

It's only a very recent thing that Linux drivers have started to work on
"we don't trust the data coming from the hardware" path.  Previously we
always trusted that, but did not trust data coming from userspace.  So
work on fixing up drivers in this area is always encouraged.

An example of this would be all of the fuzzing that USB drivers have
been getting with custom loop-back interfaces and the like over the past
year or so.  Expanding that to "we don't trust PCI device data" should
be the next step on this, and would help out your area as well.

> > If you trust a device enough to plug it in, well, you need to trust it
> > :)
> 
> Well, maybe I need to trust all devices in my computer :)
> 
> Anyway, thanks a lot for your patient explanation and reply.
> If you have encountered other kinds of DMA-related bugs/vulnerabilities,
> maybe I can help to detect them using my static-analysis tool :)

Did you only find a problem in this one driver?  Have you run it on any
more "complex" drivers and gotten any good results showing either that
we are programming defensively in this area, or not?

thanks,

greg k-h
