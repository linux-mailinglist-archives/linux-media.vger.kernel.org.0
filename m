Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE3C1C2D11
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 16:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgECOnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 10:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbgECOnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 May 2020 10:43:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4C4C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 07:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=7jMh6lqUCoJCkGcY4Q3WQSE12Fg78dXw9bCN/RDcmF0=; b=SCxsQP1f5ZhIo98uTcCL/ozUZh
        cYCBaqTSIenCLjqZD1FHHLTneWA6dTVh1LH5FZPzFUdZgoDhIb4c1XksDS6yiFtlICav7OfITbn0w
        WRa077yJsLTXEimVE2DfpDOWrE5Em9R2HoSmWmcz7sJCXLKkbuUYQHgNCCJtbDKZxkq0KK0RjQarT
        LJfMr8yUqlAd/2mthVr5etYTIfaSGXpeFIBqB38BBWAQTxEnq44+EtiJRxL7wqCETrRQj4SoKCi2p
        1gMHq6X2KmQZeFMT62SNDtfTs0Ibt96Gr+17Im2tirBzCPUu/WkKh4n61It3Jj+jHEbo44YVlbXlV
        QuUGRKwQ==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jVFpl-0005O6-8v; Sun, 03 May 2020 14:43:09 +0000
Date:   Sun, 3 May 2020 16:43:05 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200503164305.678298d7@coco.lan>
In-Reply-To: <20200503143120.008fa7c0@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200503104612.7da12913@ASUS>
        <20200503122350.2ade79ad@coco.lan>
        <20200503143120.008fa7c0@ASUS>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 3 May 2020 14:31:20 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> On Sun, 3 May 2020 12:23:50 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> 
> > Em Sun, 3 May 2020 10:46:12 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >   
> > > On Sat, 2 May 2020 19:08:36 +0300
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > 
> > > Hi Andy,
> > >     
> >  [...]  
> >  [...]  
> >  [...]    
> > > 
> > > Thank you for your advice, I've tried various Android distros for x86 on
> > > my device. Unfortunately none of the boots. I'll investigate if I can
> > > make one of them to work. I also found that a predecessor of the driver
> > > seemed to have worked for E3800. At lease there is a users guide from intel
> > > (for Fedora 18):
> > > 
> > > https://cdrdv2.intel.com/v1/dl/getcontent/331329
> > > 
> > > Unfortunately this targets the 2400, and I have 2401 rev B chip. However -
> > > I'll give Fedora 18 a try, but if the HW detection works as in the
> > > current driver it will not accept my device.    
> > 
> > Wow, that sounds promising! Did you find where the Kernel patches
> > and userspace applications are stored?  
> 
>  
> I've downloaded the Fedora 18 .iso file, unfortunately the USB stick
> created is not able to boot. According to wikipedia the kernel used in
> Fedora 18 is 3.6.10. I've downloaded the source an scanned it for
> "atomisp" and "ov2680" - but did not find anything. After some more
> research I've found a forum post about a patched kernel from timesys:
> 
>   "... I have got a copy of atomisp driver from Timesys, which named
>   kernel-3.8.0-1.src.rpm. The driver be written by intel. But the
>   driver can not be correctly work on my platfrom(E3827). So i come to
>   be suspicious of the compatibility. And i want to know whether the
>   driver can be suitable for my platfrom?
> 
>   Drivers infomation as blow:
>   - The version of atomisp driver: BYT_LSP_3.8_ISP_2013-12-06.patch
>   - The version of atomisp firmware: iaisp_2400_css.bin ..."
> 
> It looks as if this src.rpm is available here:
> http://repository.timesys.com/buildsources/fedora/18/x86_64/source/ 
> 
> I'll now figure out how to open the .rpm package to have a look if
> there is something about atomisp.

A .rpm package can be opened either with "rpm" or with "alien". 
Yet, this is how binary packages are distributed, although I saw a few
rpm files that would be building something dynamically when installed.

Something like:

	$ alien emgd-ddx-2.0-3685.i686.rpm -t 
	Warning: alien is not running as root!
	Warning: Ownerships of files in the generated packages will probably be wrong.
	emgd-ddx-2.0.tgz generated
	$ tar xvf ../emgd-ddx-2.0.tgz 
	./
	./usr/
	./usr/lib/
	./usr/lib/xorg/
	./usr/lib/xorg/modules/
	./usr/lib/xorg/modules/drivers/
	./usr/lib/xorg/modules/drivers/emgd_drv.so

Thanks,
Mauro
