Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC93A1C2C2A
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 14:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgECMb0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 08:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbgECMbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 May 2020 08:31:25 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77841C061A0C
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 05:31:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x18so17562846wrq.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7hB0v9orNCgAZ0adgsrenrlaBxV+qMT8gpRITUqhO2U=;
        b=RlrzHV1jnS074qHtjJrRw/MwxQfWAtTzOX2hTFt/S+KyQ4xnOEsu3QQdSMQSq1YcmO
         EiHh1EoA2tR8fi4M8ACa+2yWiQGSDR3Uxlo24RvKWN7W2ijvCVz1nFKdamCtJ2wlZZIC
         9UZkDddSH4Qm4Wj08YrG4xFDrErXFI7wFdF2coeYhb4kGR88WjNMw9cyiCj9ypw8K354
         GVYVCqOLI4R2oScKFZNw9h8QM674Sl9g/NZS/+x7lX3n08H0neguuOByvWVNV2fBIfdX
         UFyE6cpMiZzoogb0i8PLKkoLTheaJCfX74UDgSg9ZTnzozFhDOqsqgy5kQu43jReWcvG
         NDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7hB0v9orNCgAZ0adgsrenrlaBxV+qMT8gpRITUqhO2U=;
        b=VoLerPfRfaCYFb8fvgKiL1P6zHm8zTyPGmgV4H/TD6grw8erAZAGiWli+SvEMI6Mv9
         yNud6wUafAFIZkL+p94T1jWpVyg21qoD0489bGRR1zhBSX2KHqRPOn0Sl5Nhq0+PWqX1
         W98EKwEEmr6fjJ8+sH9uduzjpiN6ZoaZzZ96NJg6hxQ8jgDLo+yiRTV7mNUCI61Z4RKz
         VoqdT4ycnksVI+/Uc3xnd/0dmYN8Dn7Q6zX6xedjYFCY2EWxrTTiBfbKovuKe0fOj92z
         6U9iEbl3wPGpvu0gOoScHiN8tzZFfuCdGSWVGy/lFudUY6/Y5EZakObrSfrQLG9BGKe5
         Wipw==
X-Gm-Message-State: AGi0PuZTk54rXjsbIU5ghyYMhaEZSetUdDwiUP/A9JL0AIAzpfBs8LRR
        HYrkyxF4Cq66YZidXbbpiAs=
X-Google-Smtp-Source: APiQypIBDI2tk59MJcdZpy0k+pjx0QTSyAUnD86nRo9oUFoB1IYRWj49VNGR40lDCqjDn08x6ij1Bg==
X-Received: by 2002:adf:d841:: with SMTP id k1mr6338449wrl.129.1588509084032;
        Sun, 03 May 2020 05:31:24 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id i13sm13327014wro.50.2020.05.03.05.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 05:31:23 -0700 (PDT)
Date:   Sun, 3 May 2020 14:31:20 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200503143120.008fa7c0@ASUS>
In-Reply-To: <20200503122350.2ade79ad@coco.lan>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200503104612.7da12913@ASUS>
        <20200503122350.2ade79ad@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 May 2020 12:23:50 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> Em Sun, 3 May 2020 10:46:12 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> 
> > On Sat, 2 May 2020 19:08:36 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > 
> > Hi Andy,
> >   
>  [...]  
>  [...]  
>  [...]  
> > 
> > Thank you for your advice, I've tried various Android distros for x86 on
> > my device. Unfortunately none of the boots. I'll investigate if I can
> > make one of them to work. I also found that a predecessor of the driver
> > seemed to have worked for E3800. At lease there is a users guide from intel
> > (for Fedora 18):
> > 
> > https://cdrdv2.intel.com/v1/dl/getcontent/331329
> > 
> > Unfortunately this targets the 2400, and I have 2401 rev B chip. However -
> > I'll give Fedora 18 a try, but if the HW detection works as in the
> > current driver it will not accept my device.  
> 
> Wow, that sounds promising! Did you find where the Kernel patches
> and userspace applications are stored?

 
I've downloaded the Fedora 18 .iso file, unfortunately the USB stick
created is not able to boot. According to wikipedia the kernel used in
Fedora 18 is 3.6.10. I've downloaded the source an scanned it for
"atomisp" and "ov2680" - but did not find anything. After some more
research I've found a forum post about a patched kernel from timesys:

  "... I have got a copy of atomisp driver from Timesys, which named
  kernel-3.8.0-1.src.rpm. The driver be written by intel. But the
  driver can not be correctly work on my platfrom(E3827). So i come to
  be suspicious of the compatibility. And i want to know whether the
  driver can be suitable for my platfrom?

  Drivers infomation as blow:
  - The version of atomisp driver: BYT_LSP_3.8_ISP_2013-12-06.patch
  - The version of atomisp firmware: iaisp_2400_css.bin ..."

It looks as if this src.rpm is available here:
http://repository.timesys.com/buildsources/fedora/18/x86_64/source/ 

I'll now figure out how to open the .rpm package to have a look if
there is something about atomisp.

> 
>  [...]  
> > 
> > I could not find information about MRD-7 CRB HW. Do you still have this
> > HW? Fedora 18 might be worth a try if it uses a 2400 chip.
> >   
>  [...]  
> > 
> > with kind regards,
> > Patrik 
> >   
> 
> 
> 
> Thanks,
> Mauro

