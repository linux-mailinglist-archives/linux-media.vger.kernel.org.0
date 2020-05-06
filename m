Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8111C755E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbgEFPxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:53:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729417AbgEFPxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 11:53:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59C1820708;
        Wed,  6 May 2020 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588780379;
        bh=5Ml24nbPp+6AL6quJRya43kmFdmuY1+mzGDKmLrVOeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iYVbL9gMCwnHM/HYKWQJn/0BVizANqE58ooD8Hd8cR1xSdbyH3a58WXs3/tITEt4M
         XyQ5jQZg3AKyH/f+PER1iA8AmRrIYg+6W9KtyHUeOGt+CrAVFZ5S+uBee6/1OcteA3
         qmSH3iq/rmYHaOHlxuiQoWglNOywPtSr38QlhX+s=
Date:   Wed, 6 May 2020 17:52:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
Message-ID: <20200506155257.GB3537174@kroah.com>
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
 <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
 <20200506110722.GA2975410@kroah.com>
 <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 06, 2020 at 11:30:22PM +0800, Jia-Ju Bai wrote:
> 
> 
> On 2020/5/6 19:07, Greg KH wrote:
> > On Wed, May 06, 2020 at 06:13:01PM +0800, Jia-Ju Bai wrote:
> > > I have never modified DMA memory in the real world, but an attacker can use
> > > a malicious device to do this.
> > > There is a video that shows how to use the Inception tool to perform DMA
> > > attacks and login in the Windows OS without password:
> > > https://www.youtube.com/watch?v=HDhpy7RpUjM
> > If you have control over the hardware, and can write to any DMA memory,
> > again, there's almost nothing a kernel can do to protect from that.
> 
> I think that each device can only access its own DMA memory, instead of any
> DMA memory for other hardware devices.

That's not true at all for all systems that Linux runs on.

> Thus, it is dangerous that the whole kernel can be attacked via a simple
> malicious device, through some vulnerabilities in the trusted driver.

True, so restrict physical access.  Or use a good iommu if you care
about this :)

> A feasible example is that, the attacker inserts a malicious device via
> PCI-E bus in a locked computer, when the owner of this computer leaves.

This is a semi-well-known issue.  It's been described in the past
regarding thunderbolt devices, and odds are, more people will run across
it again in the future and also complain about it.

The best solution is to solve this at the bus level, preventing
different devices access to other memory areas.

And providing physical access control to systems that you care about
this type of attack for.

Again, this isn't a new thing, but the ability for us to do much about
it depends on the specific hardware control, and how we set defaults up.

If you trust a device enough to plug it in, well, you need to trust it
:)

thanks,

greg k-h
