Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23762447B7E
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 09:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbhKHIEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 03:04:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:45896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230103AbhKHIEc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 03:04:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C745F61215;
        Mon,  8 Nov 2021 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636358508;
        bh=VXYA20R2SRYdOjmYkLbFw5nQYcDPEhoabZ39B2SUV+8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kOZ1VPOxC1sEfdiy2ntIGt0Rdo7zkYF3gEOmLVLPh/Y6StcJFH5Qv95GMH09ksbzf
         X9T+rWocjQZ2SPgu6QqsRW4Hm2nDBd72aA7+AgGQJ4hdo+vzdUUKWZWeGaOWx01y25
         2Ihqia21w0ReY+aKH4PA3m/6uP8bF2HvS0MmeZHi+MHPbPJul+eS7Bs+ZG/juN0jAB
         bioFsumVvsc3WbUcIZdMcgWyQUCpg/4d+ccHtriV/9G/bdmU9sSLRth9fHvO669vV2
         eZ+FsMImfKSteE53zEUbZ5PGsiQe28vNDe8xyIP+rQzVM2BDtRhFeNSilVei+ozUbB
         KqtdDAsAH0piQ==
Date:   Mon, 8 Nov 2021 08:01:42 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
Message-ID: <20211108080142.0195118e@sal.lan>
In-Reply-To: <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
        <20211017162337.44860-6-kitakar@gmail.com>
        <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
        <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
        <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
        <20211108074101.033af4c5@sal.lan>
        <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 8 Nov 2021 08:55:53 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi Mauro,
> 
> On 11/8/21 08:41, Mauro Carvalho Chehab wrote:
> > Em Mon, 8 Nov 2021 00:39:38 +0100
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> >   
> >> Hi,
> >>
> >> On 10/21/21 11:52, Tsuchiya Yuto wrote:  
> >>> Thank you for your comment :-)
> >>>
> >>> First, I need to correct what I said in the previous mail. I later found
> >>> that loading only "atomisp" (as well as its dependency,
> >>> atomisp_gmin_platform) does not cause this issue.
> >>>
> >>> What causes this issue is rather, loading sensor drivers (as well as its
> >>> dependency, atomisp_gmin_platform).
> >>>
> >>> These sensor drivers for surface3 are both not upstream, but I made them
> >>> as similar as possible to the upstreamed ones. So, I guess this issue
> >>> can still be reproducible on some other devices.    
> >>
> >> I've run some test on my own surface3 and the problem is the writing
> >> of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> >> writing 0x00 to that after loading the sensor driver makes things work
> >> again.
> >>
> >> I have not had time to investigate this further.
> >>
> >> I used media-staging + your sensor drivers from:
> >> https://github.com/kitakar5525/surface3-atomisp-cameras.git
> >>
> >> Which was enough to figure this out, but I've not actually gotten
> >> either of the cameras working :|  I get:
> >>
> >> [user@fedora nvt]$ ./atomisp-test.sh 
> >> p0: OPEN video device `/dev/video2'  
> > 
> > After the patch that moved the output preview to be the first one,
> > you should probably use /dev/video0 here:  
> 
> Thanks for the hint, but I've not rebased my tree to those latest couple
> of patches yet, the same tree does work on the T101HA with /dev/video2 :)
> 
> I think this may be a module load ordering issue, I believe that the
> sensor drivers need to be loaded before the atomisp driver itself
> and on the T101HA we are hitting this "sweet spot", where as on
> the surface I was loading the not yet merged sensor drivers manually,
> causing them to be loaded later.

Could be. The atomisp driver should be using V4L2 async kAPI, in
order to properly register the sensors as their init code finishes
to register.

Right now, the registration logic inside atomisp waits for the first
sensor to be available. So, everything works fine on devices with
just one sensor, like Asus T101, but devices with multiple sensors 
may end having just one of them registered.

Regards,
Mauro
