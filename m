Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5885244A5C0
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 05:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240215AbhKIEV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 23:21:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236033AbhKIEV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 23:21:28 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8183C061764;
        Mon,  8 Nov 2021 20:18:42 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b13so18618335plg.2;
        Mon, 08 Nov 2021 20:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ix78GK2Ai7YylWGN1G/dwgUbIj6jFnrVnnnI52lvEDk=;
        b=WAOUSuLR53P0drGRSYvrEntpJT1sDxDKH0kQ4o4wMYkMxqFM+7CWH9a+z7+/u5MbY2
         YrInPWdU7O1b44Fpdg/sa6qkde6MTCvc1vSNwMIqw0GIzjiEsVLFF3KiGvuU3JtUbXFp
         lbeH5Gj/+vOP/kSZCv9L+F/oa9BQjxvaaGUDEofBrYYhZGI4Q38aXF8snu/2Kg2CkmQE
         dIVhqwfYVPbR/CSxFXb/vLChJpzbGkyMoMYkXV94stlCdOtS2Vqahq3+0FuVqWG2/wDy
         2oqc2w7SZtlfqhZ3pVLaUba0l0XeGwoEKRvjR6+BsEB1VZWZvmVsy2M2n/cIwdf0X+hM
         E8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ix78GK2Ai7YylWGN1G/dwgUbIj6jFnrVnnnI52lvEDk=;
        b=7eA9SDBiwr45eViHVP/OrC2UI2n72rJaRaQeVy7Mhdn3NC80IpXi1GwoZFRsP9v7SF
         +CM/h7F5HaI90U51UeF7bcCHBCjYDuNLtFeGiLjn2WCxvKWUhqjAb5mgzY7jENNxHFZq
         Qk+sVkHOHYmtzPWgJDFN3CMtGFpgieVT4PaeuSQYFVIaBI0esxXA0rovD6sMLVXPnRmD
         /vbpk1CXfNCnSHmJKVExDZIj0cB+RECa5jV9IY4pJrfthllmyxvmy/9Jp+1s8MTZQE0C
         UvKU4vQvIqkIGqZXCP7Pw1VRNtWVePbxJ3lLyJW1YgxuCkqvwkJW5jy2Vc9aEH5s2t/U
         oG0w==
X-Gm-Message-State: AOAM532qJeq8K6XLnL8uXdpVnzpq9a3Pnl+z1pnObkg8qWrkkL3SIwgM
        k4S+njfaGDos40gcwjTihQ4=
X-Google-Smtp-Source: ABdhPJxuRWfYNUY+42wLvJZbwIoUSEA5xlfKT4Y0eGwrQGAUAU+1lvMm+3LfOUjYugprI7pv2a/kcw==
X-Received: by 2002:a17:90b:4f4c:: with SMTP id pj12mr3942210pjb.218.1636431522328;
        Mon, 08 Nov 2021 20:18:42 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id e15sm806819pja.52.2021.11.08.20.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 20:18:41 -0800 (PST)
Message-ID: <46b212b2f8aeceaf20f7694a53247ae6846ab2b7.camel@gmail.com>
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 13:18:37 +0900
In-Reply-To: <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-6-kitakar@gmail.com>
         <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
         <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
         <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
         <20211108074101.033af4c5@sal.lan>
         <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2021-11-08 at 08:55 +0100, Hans de Goede wrote:
> Hi Mauro,
> 
> On 11/8/21 08:41, Mauro Carvalho Chehab wrote:
> > Em Mon, 8 Nov 2021 00:39:38 +0100
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> > 
> > > Hi,
> > > 
> > > On 10/21/21 11:52, Tsuchiya Yuto wrote:
> > > > Thank you for your comment :-)
> > > > 
> > > > First, I need to correct what I said in the previous mail. I later found
> > > > that loading only "atomisp" (as well as its dependency,
> > > > atomisp_gmin_platform) does not cause this issue.
> > > > 
> > > > What causes this issue is rather, loading sensor drivers (as well as its
> > > > dependency, atomisp_gmin_platform).
> > > > 
> > > > These sensor drivers for surface3 are both not upstream, but I made them
> > > > as similar as possible to the upstreamed ones. So, I guess this issue
> > > > can still be reproducible on some other devices.  
> > > 
> > > I've run some test on my own surface3 and the problem is the writing
> > > of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> > > writing 0x00 to that after loading the sensor driver makes things work
> > > again.
> > > 
> > > I have not had time to investigate this further.
> > > 
> > > I used media-staging + your sensor drivers from:
> > > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> > > 
> > > Which was enough to figure this out, but I've not actually gotten
> > > either of the cameras working :|  I get:
> > > 
> > > [user@fedora nvt]$ ./atomisp-test.sh 
> > > p0: OPEN video device `/dev/video2'
> > 
> > After the patch that moved the output preview to be the first one,
> > you should probably use /dev/video0 here:
> 
> Thanks for the hint, but I've not rebased my tree to those latest couple
> of patches yet, the same tree does work on the T101HA with /dev/video2 :)
> 
> I think this may be a module load ordering issue, I believe that the
> sensor drivers need to be loaded before the atomisp driver itself
> and on the T101HA we are hitting this "sweet spot",

> where as on
> the surface I was loading the not yet merged sensor drivers manually,
> causing them to be loaded later.
> 
> I still need to verify this theory, Tsuchiya can you perhaps confirm 
> that the modules must be loaded in this order?

Sorry I forgot to add a note about a load order in my sensor driver repo
for the case if you insmod external drivers. Yes, you need to load sensor
drivers _before_ the main atomisp driver.

So, here is the script to load sensor drivers in a proper order. Using
rmmod because as I sent a bug report ("[BUG 4/5] [BUG] media: atomisp:
`modprobe -r` not working well (dup video4linux, ATOMISP_SUBDEV_{0,1})"),
`modprobe -r` does not work well for me.

        rmmod atomisp
        insmod atomisp-ar0330.ko
        insmod atomisp-ov883x.ko
        # IIRC, modprobe works but try insmod instead if weird
        modprobe atomisp

Here is the insmod script I use for the record:

        # load drivers needed for atomisp first for insmod
        # for sensor drivers
        sudo modprobe media # needed for older LTS
        sudo modprobe videodev
        sudo modprobe v4l2_common # needed for older LTS
        sudo modprobe v4l2_async # if using async_register
        # for atomisp
        sudo modprobe videobuf-core
        sudo modprobe videobuf-vmalloc

        # load upstreamed atomisp drivers
        sudo insmod upst/atomisp_gmin_platform.ko
        sudo insmod upst/surface3/atomisp-ar0330.ko
        sudo insmod upst/surface3/atomisp-ov883x.ko
        sudo insmod upst/atomisp.ko dbg_level=1 #dyndbg

I'm denylisting all the atomisp drivers and I load these manually
currently to prevent oopses in case I use non-patched kernel.



Btw, this load order issue is indeed another problem even when the sensor
drivers are built as in-tree module. I sometimes see atomisp fails to
register camera device(s) on surface3.

On mipad2, things are worse. It uses regulator driver but sensor drivers
do not wait for the driver to initialize the regulators. This results in
probe failure for sensor drivers.



Regards,
Tsuchiya Yuto


