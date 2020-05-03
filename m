Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0E61C2CD0
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 15:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgECNgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 09:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728522AbgECNgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 09:36:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D8DC061A0C
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 06:36:46 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so17618733wrm.13
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yu0MGCRvB1xe3Mi7K45NB/kKHMlY1jBQmbdLE9OG89I=;
        b=ZUIIdni2NhX6296CTC0/OCPyQDJ73Zzn9FdkRwuOYMZ42Gvlw6+c6fmvQjHQ+oWutg
         nEIClOzuIgyY/ATRXutGlDk2E8QIz+j3S/rk0Pz4k3OKKUv25hk2ULnzrQRKog4uH9hr
         RMKYwgNMa/ERrfGNL6nFp8gILz4v2aHbTXivg681xLFXcEzjYI9CcdK8iy5Ao6N0BrP3
         Rcs3MmQK+NntUz+zJzD4qOr5DUOnduw8XD7cu5b50F2gXUUM9g5pdaALvxqnd/jJOIVz
         w3GyyhKZ71IcBQPd/MbaVwmxztf2Mwt64gtkQf6enzbun2uHzKoYJR6xgoPjZd+/swQX
         Djpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yu0MGCRvB1xe3Mi7K45NB/kKHMlY1jBQmbdLE9OG89I=;
        b=XK+HwkCUkrrXNY0gbIc2x1Gs0xKGVnz6/EniKyfqlcJrhLc7Yd82i6gRqaJMargsU2
         APrbCDDklQIlUrLjRVjxwP54kmlufx0zmfcIuyJyszSCNZVkQzMXOULywF8pl9CE9L6i
         MytAxCaakRoVJ3W4eXZMcJu6JO+hgGQjtG9Hm1y0gMLB2PcwnSEmYRicY+v0JkMY5rTA
         ED+cI8idkAgB11A8tyz+oZwWKuZg8xGrUi7N9eR3PM6ildioRQxEYQQpNhW+EOfJ83e7
         T5eNAINS9lzW5R458kfkWogiNjbdmbv54EqiDv3woEJbGMyDFWTUaYGGkgnXP3InrAQP
         83aA==
X-Gm-Message-State: AGi0PuaEJZulVL4bfNrtAvm51pJaFr61oS45REwptFK7RKxfN0V84+Zz
        v9GPm31C9oQeY0qA0r9mkaA=
X-Google-Smtp-Source: APiQypKA5wDHG5GbmFBmZ99voqzB/QZh++TwvERH9kOzsVXBn9qqO/rK6HygD444jGmAWQoGZ3Js+Q==
X-Received: by 2002:adf:82cf:: with SMTP id 73mr13923025wrc.411.1588513004688;
        Sun, 03 May 2020 06:36:44 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id s18sm15210824wra.94.2020.05.03.06.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 06:36:44 -0700 (PDT)
Date:   Sun, 3 May 2020 15:36:41 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200503153641.56795e1d@ASUS>
In-Reply-To: <20200503143120.008fa7c0@ASUS>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
        <20200503104612.7da12913@ASUS>
        <20200503122350.2ade79ad@coco.lan>
        <20200503143120.008fa7c0@ASUS>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 3 May 2020 14:31:20 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> wrote:

> On Sun, 3 May 2020 12:23:50 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> 
> > Em Sun, 3 May 2020 10:46:12 +0200
> > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> >   
>  [...]     
>  [...]  
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
> 

The patches have different names (ISP_) than mentioned in the intel
forum post, but there are a lot of changes. When I searched
ISP_3_01.DRIVER.patch for "+++ b/drivers/media/atomisp2/" 
I have 536 hits. I did not find references to ov2680 tough.

But I hope it is something useful.

> > 
> > Thanks,
> > Mauro  
> 

