Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4CD1C2AC0
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2020 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgECIqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 04:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726802AbgECIqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 04:46:17 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93635C061A0C
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 01:46:17 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u16so5200817wmc.5
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X44CohtJBCIBQKl3eDwR11zWo2B5oJbXRoywYoT2n7k=;
        b=jfVmSlAwIYC7v7pfKwjNWhhP7ex0TvsjnIgBuB9XHZkvDZkx9b6Dy3Q1vyzp8TDsJG
         7YFM1Lv8W8uPnaNMJjuqYtRQ/VHbaI1NZLyoiP9QD0ySfDjWoDOmptgv6PxT6uRAUrIO
         uUTa4Ajgl0gkoFkfqFTH68Tia1qL7Wqr1v/dpPybiM78gGHXXqrgwBDh4gkEURs/uNmC
         FiHraSdeRSyuQP+koDor4H7ACGmWGIKfwUAv9OENPFvgOVD6mhdto56Ukj7RAZTdeuKW
         MGUaGGAZyFa+arKRR6GrGPP9XmZXSJMalbQ7qrWh6Hbb4HeyahEoxKNWTUPuIpu+mtAD
         J9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X44CohtJBCIBQKl3eDwR11zWo2B5oJbXRoywYoT2n7k=;
        b=eN2++jncwQKYZuoX58cApDgmpYMlr6RfBAR5UF4C/xvGJYIQai+vyH++Szht5DZGq8
         6bKv03fGMGOYQa4EBU2iB7bi4JHEJk0qWDkgS8Vg+vjBkIV5d1oV5iRA0ny48ts2tkVD
         xtX+oANaaE/mCnPBDpt4rwYC3iJoAOjq+N3bCmeRO1HHvRkQ7loOwn6NyMyX8vivlQgD
         dkJlb+AQ2MZqToiXb5qanM+g9t+tFJx/xqQrNC8oqufeHEIfETCFvGARRDBR7uhXTsxH
         ap5wMa0vCFOWXWZvN3bLWtol9IpVtkIVP5nUkLOcfnLL9jYYF4D8Ebz+a8XMMm0mkg5/
         /Jew==
X-Gm-Message-State: AGi0PuZNie09NN0Bc+fgRJ7GMzWzee4qBTVDyhpNIjOc1vxPwc4esbpo
        NddxwlJRNxbYcOt/J+92oqw=
X-Google-Smtp-Source: APiQypJQWheuluy1Ds1iurOYEhgtqnhykE95ol9kfH9CTnR756nqnL8nMK6DiQPBxtjzAX3pE4T+KA==
X-Received: by 2002:a1c:e302:: with SMTP id a2mr8187214wmh.96.1588495576230;
        Sun, 03 May 2020 01:46:16 -0700 (PDT)
Received: from ASUS (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id s14sm8008328wme.33.2020.05.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 01:46:16 -0700 (PDT)
Date:   Sun, 3 May 2020 10:46:12 +0200
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200503104612.7da12913@ASUS>
In-Reply-To: <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <CAHp75Vf9M7=Gf=mCgdBgt0-aR+kBOjtE3pvJyEya2OGmqbr6XA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2 May 2020 19:08:36 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

Hi Andy,

> On Sat, Apr 18, 2020 at 5:42 PM Patrik Gfeller <patrik.gfeller@gmail.com> wrote:
> >
> > Hello Mauro et al,
> >
> > I've recently switched to Linux, and I'm very impressed. Almost
> > everything thing works out of the box. Only the webcam on my device does
> > not. I did some digging and if I'm right an atomisp driver would be
> > required. Is this correct? Below the output of lspci:
> >
> > 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
> > x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0
> > VGA compatible controller: Intel Corporation Atom/Celeron/Pentium
> > Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> > 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium
> > Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0
> > Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> > 00:0b.0 Signal processing controller: Intel Corporation
> > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power
> > Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation
> > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI
> > Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation
> > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted
> > Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation
> > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express
> > Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation
> > Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
> > 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
> > Network Adapter (rev 31)
> >
> > According to the history it looks like the driver was removed from the
> > kernel in 2018 and replaced with a dummy driver (to make sure power save
> > works).
> >
> > Is there a chance that the atomisp driver will return to the kernel?
> > There are quite a few older tablets and 2in1 devices that would benefit.
> > Unfortunately I do not understand the removed code (my coding skills are
> > very basic) and can thus not help to change what ever is necessary to
> > make it fit for the kernel :-( (does not sound like a beginner project).
> > However - I would be glad to help out to help testing an ISP driver.
> >
> > However - even without the cam it is a very impressing operating system
> > which I enjoy very much. I would like to thank all of you for your work
> > that benefits so many people!  
> 
> I follow your attempts to enable that driver (I, myself, spent a lot
> of time to an attempt of getting this driver in a shape). However, I
> guess you started from a wrong side. Even with access to internal tree
> for Android firmware we didn't manage to find a proper one to whatever
> has been published in drivers/staging. So, to get it done, one should
> first to find a *working* Android for the certain device. Without that
> it will be a journey of wasted time and big disappointment.

Thank you for your advice, I've tried various Android distros for x86 on
my device. Unfortunately none of the boots. I'll investigate if I can
make one of them to work. I also found that a predecessor of the driver
seemed to have worked for E3800. At lease there is a users guide from intel
(for Fedora 18):

https://cdrdv2.intel.com/v1/dl/getcontent/331329

Unfortunately this targets the 2400, and I have 2401 rev B chip. However -
I'll give Fedora 18 a try, but if the HW detection works as in the
current driver it will not accept my device.

> 
> My achievements end with no getting IRQ from the driver (and I was
> experimenting on MRD-7 CRB).

I could not find information about MRD-7 CRB HW. Do you still have this
HW? Fedora 18 might be worth a try if it uses a 2400 chip.

> P.S. I also have some (semi-) debug patches I can share. Perhaps they
> will give some more ideas. Btw, based on this discussion I think that
> it can be power issues with sensors that possible affect IRQ
> generation inside SiliconHive vector processor. In IPU3 the dedicated
> PMIC is used for camera devices, and I have no idea of the design for
> old ones.
> 

with kind regards,
Patrik 

