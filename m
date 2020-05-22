Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C75B1DE5B6
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 13:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgEVLmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 07:42:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728469AbgEVLmI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 07:42:08 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66EA1206C3;
        Fri, 22 May 2020 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590147727;
        bh=r07N7AfzHK599ZkKEMSSxoBsfiAcnc5E5medDwadxAs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FZ3Kq09MX0RjJv8NJbR7tF8T+/J8lUvcJWsKgO38tUPOr43uLdPbTK+0rPGiTZCy6
         tNjKtVtqQ8uZzEStIYIFuls4KiPzIyhqUkLcwJJWEVWhW245YQdb08W8ip53/EXQMb
         Q+B6sPmYb24qMUuW8gVEEd5lphlgJiafmviNJB3I=
Date:   Fri, 22 May 2020 13:42:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200522134203.0fe139d6@coco.lan>
In-Reply-To: <4dd760d6-6445-f3b5-cb14-1705e05820bc@redhat.com>
References: <20200501215741.3be05695@coco.lan>
        <3f551a8f87808ee7828dc03d41c7a23faac89f3c.camel@mail.polimi.it>
        <20200503173213.78ae6aaa@coco.lan>
        <CADnVkj96W0QfthukTKQ0a-i2fH1buooH3BEgfy22J9H9=_PcKA@mail.gmail.com>
        <20200503180751.0b1e29c4@ASUS>
        <20200504101628.0f632bf2@ASUS>
        <20200504104934.7873cee3@coco.lan>
        <20200504124539.77eac397@ASUS>
        <20200504140833.11dd5622@coco.lan>
        <20200504154420.5dcf505f@ASUS>
        <20200515103232.47b2a35e@coco.lan>
        <be0935ce-4d88-e7de-5013-6651b8c4edac@redhat.com>
        <20200515114245.266a6fc8@coco.lan>
        <20200519093920.7bb22161@coco.lan>
        <20200519193635.14e806b6@coco.lan>
        <4dd760d6-6445-f3b5-cb14-1705e05820bc@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 22 May 2020 12:46:07 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 5/19/20 7:36 PM, Mauro Carvalho Chehab wrote:
> 
> <snip>
> 
> > I did a lot of progress today. After identified the above bug, which
> > was turning down the ISP device, causing the firmware load to fail
> > (as the turn on code is not OK), I solved several other issues there.
> > 
> > The current status is that:
> > 
> > - the ISP firmware is properly loading;
> > - it can properly communicate with the camera sensor;
> > - Userspace can read video controls (tested with v4l2-ctl and qv4l2);
> > - set a video format is now working;
> > - buffers are being queued, and per-frame IRQs are arriving.
> > 
> > I did a really quick test today of trying to get a video from it,
> > using a simple tool I developed for such kind of tests (v4l2grab
> > from v4l-utils package, changed to work with the only format that
> > my camera sensor supports). This tool needs uses a bare minimum
> > set of ioctls, with would avoid hitting a bug somewhere else.
> > 
> > Running it makes the device to start receiving frames from the
> > hardware. Yet, there's something wrong at the part with stores
> > the data into the video frame buffers. This driver has a weird
> > mm/DMA code, based on a fork of get_user_pages() taken probably
> > during Kernel 3.10 old days.
> > 
> > Addressing it has a high chance of grabbing some image from it.
> > 
> > Ok, driver is at staging quality: there are lots of crap there that
> > will require changes, but it seems we're getting there.  
> 
> This is very good news. Hopefully you will get an actual image
> out of these soon. That would be awesome.
> 
> I happened to notice an advert for a second-hand Asus T101HA
> locally, for not too much money. So now I'm the happy owner of
> an Asus T101HA myself.

Great!

> So once you have something working I can
> try to reproduce your work on identical hardware then as time
> permits help with cleaning things up.   Although I might focus
> at first on trying to get your work to run on more Cherry Trail
> based models, to find out what bits we need to make configurable
> and if we can get the info from ACPI or if we need to have a
> DMI based table with model specific info.

The main ACPI related code is at this file:

	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c

Originally, this was a platform driver. Now, it is just an ancillary
driver.

Inside the sensor drivers, there's just the ACPI tables, in order
for them to be probed.

I updated the driver's TODO list, but there are probably more to be
said than what's there.

Let me list the things I remember that should be done:

1) The atomisp doesn't rely at the usual i2c stuff to discover the
sensors. Instead, it calls a function from atomisp_gmin_platform.c.
There are some hacks I added there for it to wait for sensors to be
probed (with a timeout of 2 seconds or so). This should be converted 
to the usual way, using V4L2 async subdev framework to wait for cameras 
to be probed;

2) The Asus T101HA support (and other board-specific data) uses the a
DMI match table to retrieve sensor's data, using hard-coded values. 
I did some research last week: it sounds possible to retrieve those
data directly from ACPI via this _DSM table, associated with CAM1
sensor (UUID: dc2f6c4f-045b-4f1d-97b9-882a6860a4be):

            Name (C1CD, Buffer (0x0220){})
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("dc2f6c4f-045b-4f1d-97b9-882a6860a4be")))
                {
                    Local0 = Package (0x12)
                        {
                            "CamId", 
                            "ov2680", 
                            "CamType", 
                            "1", 
                            "CsiPort", 
                            "0", 
                            "CsiLanes", 
                            "1", 
                            "CsiFmt", 
                            "15", 
                            "CsiBayer", 
                            "0", 
                            "CamClk", 
                            "1", 
                            "Regulator1p8v", 
                            "0", 
                            "Regulator2p8v", 
                            "0"
                        }
                    Return (Local0)
                }

The code there at atomisp_gmin_platform has an EFI parser, but it assumes
that the information would be stored on a different way.

Kernel has support for reading data from _DSM, via acpi_evaluate_dsm().

I suspect that it should be doable to use such infra and remove the
TA101HA DMI match. This will likely allow covering more devices that
could also be using the same EFI UUID.

3) Switch the driver to use pm_runtime stuff. Right now, it probes the
existing PMIC code and sensors call it directly.

4) There's a problem at the sensor drivers (I hacked the ov2880
to avoid that): when trying to set a video format, atomisp calls 
the sensor drivers with the sensor turned off. This causes them
to fail.

I guess the right fix would be to power on the sensor when a video
device is opened (or at the first VIDIOC_ ioctl - except for
VIDIOC_QUERYCAP), powering it down at close() syscall.

5) There are several issues related to memory management, causing
crashes. This is probably something that we need to fix asap.

The atomisp splits the memory management on three separate regions:

	- dynamic pool;
	- reserved pool;
	- generic pool

The code implementing it is at:

	drivers/staging/media/atomisp/pci/hmm/

It also has a separate code for managing DMA buffers at:
	
	drivers/staging/media/atomisp/pci/mmu/

The code there is really dirty, ugly and probably wrong. I fixed
one bug there already, but the best would be to just trash it and use
something else. Maybe the code from the newer intel driver could
serve as a model:

	drivers/staging/media/ipu3/ipu3-mmu.c

But converting it to use something like that is painful and may
cause some breakages.

6) there is some issue at the frame receive logic. This is currently
my main focus.

Btw, this is the branch I'm using on my tests:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v3

It has basically the stuff from linux-media, plus the ACPI patch
that enables the OpRegion:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v3&id=d8613fcbb3c9cb21b6818b0245e320054ecb5deb

(I didn't cherry-picked the Kconfig ones here, since I have already
everything enabled at the .config file I'm using here).

Besides that, it has some patches that I'm working to address (5) and
(6).

PS.: I'm constantly rebasing the stuff there (specially the patches with
weird names, like "foo" and "HACK").

Thanks,
Mauro
