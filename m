Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D3E44AA23
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 10:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242771AbhKIJLg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 04:11:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:49062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242725AbhKIJLg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Nov 2021 04:11:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7696F6103C;
        Tue,  9 Nov 2021 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636448930;
        bh=yYnkGHhnjo+Q9QV1P176hjrxDUPD/JGJG+8cOpadDAw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KUp1d8MZiO6+zf9A82xf5JJzBmqr/Q+2mQqCidQaW+Zmgu5fHGzHdmljGxlyrACs5
         F2Qj6ZnXqrKEbcj7woi6oHRFZMdBUboyjWKOXz3jReWFK9gCtW5xgVECfalAc0NODO
         SCr+f4n8BYp6JYUSohCbsPe050lgRBov+U5AuvP87JbPLy6m4HSeKK+nncsdF+Vvbb
         og70DjeXFkj2RfP3DZ7b/tehHeSErJjUrjJ+NBICDiwLeZr+uf1HzYi4wIuokeq8wr
         rXc1D2+GamoDYkg0mA5aqOcfTMEc2l7qv8hAGCHuVFKg8l8K8G+etl0GKCgMzFuYsv
         uKgGyy3AzygpQ==
Date:   Tue, 9 Nov 2021 09:08:44 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
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
Message-ID: <20211109090844.4f497196@sal.lan>
In-Reply-To: <46b212b2f8aeceaf20f7694a53247ae6846ab2b7.camel@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
        <20211017162337.44860-6-kitakar@gmail.com>
        <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
        <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
        <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
        <20211108074101.033af4c5@sal.lan>
        <869d0e2c-b04a-ef35-cfe5-b372c646fce9@redhat.com>
        <46b212b2f8aeceaf20f7694a53247ae6846ab2b7.camel@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 09 Nov 2021 13:18:37 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> On Mon, 2021-11-08 at 08:55 +0100, Hans de Goede wrote:
> > Hi Mauro,
> > 
> > On 11/8/21 08:41, Mauro Carvalho Chehab wrote:  
> > > Em Mon, 8 Nov 2021 00:39:38 +0100
> > > Hans de Goede <hdegoede@redhat.com> escreveu:
> > >   
> > > > Hi,
> > > > 
> > > > On 10/21/21 11:52, Tsuchiya Yuto wrote:  
> > > > > Thank you for your comment :-)
> > > > > 
> > > > > First, I need to correct what I said in the previous mail. I later found
> > > > > that loading only "atomisp" (as well as its dependency,
> > > > > atomisp_gmin_platform) does not cause this issue.
> > > > > 
> > > > > What causes this issue is rather, loading sensor drivers (as well as its
> > > > > dependency, atomisp_gmin_platform).
> > > > > 
> > > > > These sensor drivers for surface3 are both not upstream, but I made them
> > > > > as similar as possible to the upstreamed ones. So, I guess this issue
> > > > > can still be reproducible on some other devices.    
> > > > 
> > > > I've run some test on my own surface3 and the problem is the writing
> > > > of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
> > > > writing 0x00 to that after loading the sensor driver makes things work
> > > > again.
> > > > 
> > > > I have not had time to investigate this further.
> > > > 
> > > > I used media-staging + your sensor drivers from:
> > > > https://github.com/kitakar5525/surface3-atomisp-cameras.git
> > > > 
> > > > Which was enough to figure this out, but I've not actually gotten
> > > > either of the cameras working :|  I get:
> > > > 
> > > > [user@fedora nvt]$ ./atomisp-test.sh 
> > > > p0: OPEN video device `/dev/video2'  
> > > 
> > > After the patch that moved the output preview to be the first one,
> > > you should probably use /dev/video0 here:  
> > 
> > Thanks for the hint, but I've not rebased my tree to those latest couple
> > of patches yet, the same tree does work on the T101HA with /dev/video2 :)
> > 
> > I think this may be a module load ordering issue, I believe that the
> > sensor drivers need to be loaded before the atomisp driver itself
> > and on the T101HA we are hitting this "sweet spot",  
> 
> > where as on
> > the surface I was loading the not yet merged sensor drivers manually,
> > causing them to be loaded later.
> > 
> > I still need to verify this theory, Tsuchiya can you perhaps confirm 
> > that the modules must be loaded in this order?  
> 
> Sorry I forgot to add a note about a load order in my sensor driver repo
> for the case if you insmod external drivers. Yes, you need to load sensor
> drivers _before_ the main atomisp driver.
> 
> So, here is the script to load sensor drivers in a proper order. Using
> rmmod because as I sent a bug report ("[BUG 4/5] [BUG] media: atomisp:
> `modprobe -r` not working well (dup video4linux, ATOMISP_SUBDEV_{0,1})"),
> `modprobe -r` does not work well for me.
> 
>         rmmod atomisp
>         insmod atomisp-ar0330.ko
>         insmod atomisp-ov883x.ko
>         # IIRC, modprobe works but try insmod instead if weird
>         modprobe atomisp

Ok, you need to probe first the sensors, because the lack of support
for V4L2 async kAPI at the driver.

See, the way atomisp expects is that it will initialize the
subdevs at:

	atomisp_subdev_probe() function at atomisp_v4l2.

I added a hacky logic there to avoid the need of probing drivers
manually. It makes atomisp driver to wait up to SUBDEV_WAIT_TIMEOUT_MAX_COUNT
for a sensor to be detected, and added a FIXME to remind that this requires
further changes.

Once the first sensor is detected, it waits for 5 * SUBDEV_WAIT_TIMEOUT
for it to finish probing, hoping that everything will be fine after
such time. If the second sensor registers on such time (on devices with
more than one sensor), everything will also be ok, but it seems that
the time there is not enough for the second sensor to register.

The right solution here would be, instead:

1. to return -EPROBE_DEFER, if not all sensors are detected. Some
   care need to be taken doing that, though, in order to avoid
   troubles re-initializing things;
2. to let the sensors register themselves, instead of relying on
   atomisp driver for doing that.

Once the drivers got converted to register themselves as subdevices
without needing atomisp for doing that (nor the ancillary module
atomisp_gmin_platform), the right way would be to use the V4L2 async 
framework, which was designed to ensure that all subdevs are there
during device's init time.

There's a catch, though: the main driver needs to know how many sensors
it will wait to be probed. Right now, the driver doesn't store or
gather this information directly.

Regards,
Mauro
