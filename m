Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE62440869
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 12:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhJ3Kv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Oct 2021 06:51:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231792AbhJ3Kv6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Oct 2021 06:51:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DA9660E8C;
        Sat, 30 Oct 2021 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635590968;
        bh=ZE/o+fUX5RaL/VjvUwFdpZGdN23FV+1R7Ljx1EF+sCw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NmXin4ZGfDks2/+yfAHEHKPR2CqPCUFGBVBWt+X7llbibQM86ke0psy78z3xirXlW
         BTIM0DEg+OKRm7ZCqMDlgXu/q6SH9CE1t0Piv3fWgkB5dpU6zNXwCE/+sHkGcGae3r
         g2TyMvKagYdp4x4yiXP1wJIfXozrDQL9+bbAV4XgE19vdZhfjj+FENetLydg2CZ+iC
         kk1pS8Oyzj4+mF6rT2BGKou+4gGarAiqu465MQ8vOgPvJ+edJguFzo9V0tCFTVu0iA
         KVUAKvLIej7fCD73bmi9N3JgxDvS0dSxawuj/tH3qLrSt/sgnXYsjNDCjhxnojWXPa
         8XPfgJhFS7hbg==
Date:   Sat, 30 Oct 2021 11:49:23 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211030114923.4feb5a4d@sal.lan>
In-Reply-To: <1a1da60c4464bd163e9c401e04db3b58172ae7fc.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
        <20211028115802.49258990@sal.lan>
        <1a1da60c4464bd163e9c401e04db3b58172ae7fc.camel@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 30 Oct 2021 18:50:14 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> On Thu, 2021-10-28 at 11:58 +0100, Mauro Carvalho Chehab wrote:
> > Em Thu, 28 Oct 2021 13:32:29 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> >   
> > > <Fixed Cc list>
> > > 
> > > On Mon, 2021-10-18 at 01:19 +0900, Tsuchiya Yuto wrote:  
> > > > [...]
> > > >   ## taking a picture with atomisp
> > > > 
> > > > Note that to try to take a picture, please also apply at least the
> > > > this RFC patch ("[BUG][RFC] media: atomisp: pci: assume run_mode is
> > > > PREVIEW") I'll send as almost a BUG report later.
> > > > 
> > > > You need to use firmware version irci_stable_candrpv_0415_20150521_0458,
> > > > which is available from the intel-aero [1]    
> > > 
> > > Just in case, the hash (as well as version) of firmware which I
> > > downloaded from intel-aero and I use to capture is the following:
> > > 
> > >         $ sha256sum /lib/firmware/shisp_2401a0_v21.bin
> > >         e89359f4e4934c410c83d525e283f34c5fcce9cb5caa75ad8a32d66d3842d95c  /lib/firmware/shisp_2401a0_v21.bin
> > > 
> > >         $ strings /lib/firmware/shisp_2401a0_v21.bin | grep 2015
> > >         irci_stable_candrpv_0415_20150521_0458  
> 
> Also note that the firmware file from the intel-aero only supports
> hw_revision 2401a0_v21 as the filename implies. So, if someone have
> Bay Trail (ISP2400) device to test, you need to get a firmware file (from
> somewhere like Android installation/image as the initial commit of atomisp
> mentions) made for version irci_stable_candrpv_0415_20150521_0458 and
> hw_revision 2400b0_v21 then place it under /lib/firmware

Yeah, understood.

> > > > The atomisp (ipu2), like the ipu3, needs userspace support. The libcamera
> > > > has now decent ipu3 support but does not have atomisp support yet.
> > > > 
> > > > I found some userspace tools for atomisp that run on Linux:
> > > > 
> > > >   - capturev4l2 from intel-aero/sample-apps
> > > >     (https://github.com/intel-aero/sample-apps/tree/master/capturev4l2)
> > > >   - hd-camera from intel-aero/sample-apps
> > > >     (https://github.com/intel-aero/sample-apps/tree/master/hd-camera)
> > > >   - intel/nvt
> > > >     (https://github.com/intel/nvt)
> > > > 
> > > > It looks like the nvt is the most feature-rich, like exposure and white
> > > > balance. Note that current upstreamed atomisp dropped 32-bit support.
> > > > So, you need to build it with `-m64` (change it in Makefile). Here is
> > > > the example of usage I use on mipad2:
> > > > 
> > > >         $ ./v4l2n -o testimage_@.raw \
> > > >                 --device /dev/video2 \
> > > >                 --input 0 \
> > > >                 --exposure=30000,30000,30000,30000 \
> > > >                 --parm type=1,capturemode=CI_MODE_PREVIEW \
> > > >                 --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
> > > >                 --reqbufs count=2,memory=USERPTR \
> > > >                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
> > > >                 --capture=2 \
> > > > 
> > > >         ./raw2pnm -x1920 -y1080 -fNV12 testimage_001.raw testimage_001.pnm
> > > >         feh *.pnm # open the converted image
> > > >         rm testimage*  
> > 
> > Great! that worked for me too on Asus T101HA (CHT). I had to tweak the
> > resolution, as ov2680 sensor has a max of 1616x1216 30fps. I had
> > to use a number smaller than that, though (1600x1200).  
> 
> Ah, glad to hear that!
> 
> > I guess the next step is to make a generic app to also work on it.   
> 
> It's great if we can eventually add atomisp support to the libcamera.
> I think this is the easiest way to support generic apps (I mean, like
> cheese). Some ipu3 cameras already work on cheese with libcamera.
> I don't have any knowledge about userspace support though.

There are a lot more to be done in order to make it ready for libcamera
(if ever).

See, libcamera assumes that the device exports its internal pipelines
via the media controller. The atomisp code setups such pipelines
internally, exposing a "normal" [1] V4L2 interface.

[1] Well, it misses several V4L2 ioctl implementations that currently
    causes generic applications to fail, and mis-implement others,
    but the idea behind the driver is to fully control the driver via
    /dev/video? nodes, without requiring the media controller API.

Converting atomisp into a media-controller driver will require a
major rework. I suspect that it is a lot easier to make it work with
normal V4L2 applications by fixing the ioctl implementation than
to port it to MC.

Yet, in order to be able to move it from staging, we'll need to convert
it into an MC-controlled driver.

What I'm saying is that, IMHO, we should:

1. Fix the ioctls in order to allow a normal app to use it. I'm
   already doing some work on this sense. We should ensure that the
   driver will pass v4l2-compliance tests on this step;

2. remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
   register address differences between ISP2400 and ISP2401;

3. Cleanup the driver code, removing the abstraction layers inside it;

4. Migrate the sensor drivers out of staging (or re-using existing
   drivers);

5. Remove the logic which sets up pipelines inside it, moving it to
   libcamera and implement MC support;

6. Move it out of staging.

This is easily said than done, as steps 2-6 are very complex and will
require lots of work. Also, both ISP2400 and 2401 should be tested
while doing some of those major reworks, in order to avoid breakages.

Btw, v4l2grab app (at v4l-utils) already works. This is a very simple
app, written to allow stream testing. It doesn't do anything fancy,
like trying to enumerate the formats, and it needs to be set to a
resolution lower than the one announced by the sensor, probably due
to some bug at the COPY pipeline settings at atomisp driver.

qv4l2, for instance, causes a driver OOPS when it calls G/S_PRIORITY 
ioctls.

Regards,
Mauro
