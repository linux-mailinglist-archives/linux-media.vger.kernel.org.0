Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50C91C83D4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 09:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgEGHwm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 03:52:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:56292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgEGHwm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 03:52:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DF482075E;
        Thu,  7 May 2020 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588837959;
        bh=ujCMRVMfllan9Dbh7F/kka0DBgXEpAIyKSGPSNapBOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ukCLcKniQbJ+p1k6xGU8np7WcT4oId0rAQPLlQ1Nl69qiSkwMs8/VX1DTPIBGNE9J
         CqeyQg2AP4KLedw93hbwe+NxmaoWy0HwRxdqUfzMCC4CGO45h8h5Vx7kj/qhj2KT5n
         qBc6nfkMYSvi6r/6oSTPlC2ZhkZm2Un7NrWKN5mo=
Date:   Thu, 7 May 2020 09:52:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mchehab@kernel.org, kstewart@linuxfoundation.org,
        tomasbortoli@gmail.com, sean@mess.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: usb: ttusb-dec: avoid buffer overflow in
 ttusb_dec_handle_irq() when DMA failures/attacks occur
Message-ID: <20200507075237.GA1024567@kroah.com>
References: <20200505142110.7620-1-baijiaju1990@gmail.com>
 <20200505181042.GD1199718@kroah.com>
 <0e4a86ee-8c4e-4ac3-8499-4e9a6ed7bd1e@gmail.com>
 <20200506110722.GA2975410@kroah.com>
 <b3af10e3-8709-3da0-6841-e5ddd6b4a609@gmail.com>
 <20200506155257.GB3537174@kroah.com>
 <46615f6e-11ec-6546-42a9-3490414f9550@gmail.com>
 <20200506174345.GA3711921@kroah.com>
 <4bc70ec6-e518-5f42-b336-c86e1f92619f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bc70ec6-e518-5f42-b336-c86e1f92619f@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 07, 2020 at 01:15:22PM +0800, Jia-Ju Bai wrote:
> 
> 
> On 2020/5/7 1:43, Greg KH wrote:
> > On Thu, May 07, 2020 at 12:48:47AM +0800, Jia-Ju Bai wrote:
> > > Yes, I agree that this issue is not new, because DMA attacks are old
> > > problems.
> > > But I am a little surprised that many current drivers are still vulnerable
> > > to DMA attacks.
> > Given that the attack vector is very hard to actually do, that's not
> > a suprise.
> > 
> > It's only a very recent thing that Linux drivers have started to work on
> > "we don't trust the data coming from the hardware" path.  Previously we
> > always trusted that, but did not trust data coming from userspace.  So
> > work on fixing up drivers in this area is always encouraged.
> > 
> > An example of this would be all of the fuzzing that USB drivers have
> > been getting with custom loop-back interfaces and the like over the past
> > year or so.  Expanding that to "we don't trust PCI device data" should
> > be the next step on this, and would help out your area as well.
> 
> Okay, I am glad to hear that :)
> Hardware security for the Linux kernel should receive more attention.

If you care about that, yes it should.  At the least it is providing
lots of graduate students with good research papers :)

> Last year some researchers finished an interesting work about fuzzing the
> inputs from hardware:
> https://github.com/securesystemslab/periscope

Nice!

> > > > If you trust a device enough to plug it in, well, you need to trust it
> > > > :)
> > > Well, maybe I need to trust all devices in my computer :)
> > > 
> > > Anyway, thanks a lot for your patient explanation and reply.
> > > If you have encountered other kinds of DMA-related bugs/vulnerabilities,
> > > maybe I can help to detect them using my static-analysis tool :)
> > Did you only find a problem in this one driver?  Have you run it on any
> > more "complex" drivers and gotten any good results showing either that
> > we are programming defensively in this area, or not?
> > 
> 
> At present, I only detect the cases that a DMA value *directly* taints array
> index, loop condition and important kernel-interface calls (such as
> request_irq()).
> In this one driver, I only find two problems that mentioned in this patch.
> With the kernel configuration "allyesconfig" in my x86_64 machine, I find
> nearly 200 such problems (intra-procedurally and inter-procedurally) in all
> the compiled device drivers.
> 
> I also find that several drivers check the data from DMA memory, but some of
> these checks can be bypassed.
> Here is an example in drivers/scsi/esas2r/esas2r_vda.c:
> 
> The function esas2r_read_vda() uses a DMA value "vi":
>   struct atto_ioctl_vda *vi =
>             (struct atto_ioctl_vda *)a->vda_buffer;
> 
> Then esas2r_read_vda() calls esas2r_process_vda_ioctl() with vi:
>   esas2r_process_vda_ioctl(a, vi, rq, &sgc);
> 
> In esas2r_process_vda_ioctl(), the DMA value "vi->function" is
> used at many places, such as:
>   if (vi->function >= vercnt)
>   ...
>   if (vi->version > esas2r_vdaioctl_versions[vi->function])
>   ...
> 
> However, when DMA failures or attacks occur, the value of vi->function can
> be changed at any time. In this case, vi->function can be first smaller than
> vercnt, and then it can be larger than vercnt when it is used as the array
> index of esas2r_vdaioctl_versions, causing a buffer-overflow vulnerability.
> 
> I also submitted this patch, but no one has replied yet:
> https://lore.kernel.org/lkml/20200504172412.25985-1-baijiaju1990@gmail.com/

It's only been a few days, give them time.

But, as with this patch, you might want to change your approach.  Having
the changelog say "this is a security problem!" really isn't that "real"
as the threat model is very obscure at this point in time.

Just say something like I referenced here, "read the value from memory
and test it and use that value instead of constantly reading from memory
each time in case it changes" is nicer and more realistic.  It's a
poential optimization as well, if the complier didn't already do it for
us automatically (which you really should look into...)

If you make up a large series of these, I'd be glad to take them through
one of my trees to try to fix them all up at once, that's usually a
simpler way to do cross-tree changes like this.

thanks,

greg k-h
