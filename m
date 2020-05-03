Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF91C2B4E
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 12:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgECKXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 06:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgECKXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 May 2020 06:23:55 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEFAC061A0C
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=irE9avXxWF9X94gghTS//U/v9GckRlDTcihbjUkoD6A=; b=qpBUtOzClpXqhXO/GJGqk5w5Dv
        WbHu3nCYY78Th7XnKqc3g0MpkXO9Bfz/973JFYTArJAu3JY3av3WhYyNHU75AViH1/le1VMAp96xU
        o8qG8aS/EDUjag2zrT4i76mLocg6GBm8Nv4g42Z9smNCRAtRXEjmjpg8hgBPcFFeVRg2pRlY3Uwzf
        fduG9zSLZaKCXfmB2sqGLDt5m71kvLHCQ2xl8uSJ1KxHqXLesdiOdJ629oegV1iayMJQ1ItOTl7Gb
        c04o0L8rZTi4hyx8NSfLgTfTWKgnXEuVXg6fiSvuGWvEFpyLwXRW57NvZsdp+FYY3DqW+N3u8L0m6
        wPaH9bfg==;
Received: from [95.90.213.197] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVBmr-0001Kq-S4; Sun, 03 May 2020 10:23:54 +0000
Date:   Sun, 3 May 2020 12:23:50 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200503122350.2ade79ad@coco.lan>
In-Reply-To: <20200503104612.7da12913@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200503104612.7da12913@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 3 May 2020 10:46:12 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Sat, 2 May 2020 19:08:36 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> 
> Hi Andy,
> 
> > On Sat, Apr 18, 2020 at 5:42 PM Patrik Gfeller <patrik.gfeller@gmail.com> wrote:  
> > >
> > > Hello Mauro et al,
> > >
> > > I've recently switched to Linux, and I'm very impressed. Almost
> > > everything thing works out of the box. Only the webcam on my device does
> > > not. I did some digging and if I'm right an atomisp driver would be
> > > required. Is this correct? Below the output of lspci:
> > >
> > > 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
> > > x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
> > > VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
> > > Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> > > 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
> > > Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
> > > Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> > > 00:0b.0 Signal processing controller: Intel Corporation
> > > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
> > > Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
> > > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
> > > Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
> > > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
> > > Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
> > > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
> > > Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
> > > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
> > > 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
> > > Network Adapter (rev 31)
> > >
> > > According to the history it looks like the driver was removed from the
> > > kernel in 2018 and replaced with a dummy driver (to make sure power save
> > > works).
> > >
> > > Is there a chance that the atomisp driver will return to the kernel?
> > > There are quite a few older tablets and 2in1 devices that would benefit.
> > > Unfortunately I do not understand the removed code (my coding skills are
> > > very basic) and can thus not help to change what ever is necessary to
> > > make it fit for the kernel :-( (does not sound like a beginner project).
> > > However - I would be glad to help out to help testing an ISP driver.
> > >
> > > However - even without the cam it is a very impressing operating system
> > > which I enjoy very much. I would like to thank all of you for your work
> > > that benefits so many people!    
> > 
> > I follow your attempts to enable that driver (I, myself, spent a lot
> > of time to an attempt of getting this driver in a shape). However, I
> > guess you started from a wrong side. Even with access to internal tree
> > for Android firmware we didn't manage to find a proper one to whatever
> > has been published in drivers/staging. So, to get it done, one should
> > first to find a *working* Android for the certain device. Without that
> > it will be a journey of wasted time and big disappointment.  
> 
> Thank you for your advice, I've tried various Android distros for x86 on
> my device. Unfortunately none of the boots. I'll investigate if I can
> make one of them to work. I also found that a predecessor of the driver
> seemed to have worked for E3800. At lease there is a users guide from intel
> (for Fedora 18):
> 
> https://cdrdv2.intel.com/v1/dl/getcontent/331329
> 
> Unfortunately this targets the 2400, and I have 2401 rev B chip. However -
> I'll give Fedora 18 a try, but if the HW detection works as in the
> current driver it will not accept my device.

Wow, that sounds promising! Did you find where the Kernel patches
and userspace applications are stored?

> > My achievements end with no getting IRQ from the driver (and I was
> > experimenting on MRD-7 CRB).  
> 
> I could not find information about MRD-7 CRB HW. Do you still have this
> HW? Fedora 18 might be worth a try if it uses a 2400 chip.
> 
> > P.S. I also have some (semi-) debug patches I can share. Perhaps they
> > will give some more ideas. Btw, based on this discussion I think that
> > it can be power issues with sensors that possible affect IRQ
> > generation inside SiliconHive vector processor. In IPU3 the dedicated
> > PMIC is used for camera devices, and I have no idea of the design for
> > old ones.
> >   
> 
> with kind regards,
> Patrik 
> 



Thanks,
Mauro
