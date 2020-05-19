Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761B91D9DF9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 19:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgESRgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 13:36:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729001AbgESRgo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 13:36:44 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00458206C3;
        Tue, 19 May 2020 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589909800;
        bh=p0tSDzSef2otaXYtB0eiggGGWraghGhmq/9BT8Xwd7s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=phlsFoPFnb6Qy2DG+ErQjF2UTJuOkZp/XDBPIq/HXT0hXdThRrzZ/J2CUhKm0RL14
         CHjU+iI0ni08lsLSQC8CYbZm4TL4/KcygbIIl1fal6a40hYuiLiy7rS33VAh9y5QQi
         M2WZ+JTrwTGL1vJbGX0GumDJrAo/DDf34aD4RCLk=
Date:   Tue, 19 May 2020 19:36:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200519193635.14e806b6@coco.lan>
In-Reply-To: <20200519093920.7bb22161@coco.lan>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 19 May 2020 09:39:20 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Fri, 15 May 2020 11:42:45 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> 
> > Em Fri, 15 May 2020 11:10:21 +0200
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> >   
> > > Hi all,
> > > 
> > > On 5/15/20 10:32 AM, Mauro Carvalho Chehab wrote:    
> > > > Em Mon, 4 May 2020 15:44:20 +0200
> > > > Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
> > > >       
> > > >>>> Maybe this is related to my partial build (only the module to test if
> > > >>>> it builds). I'll now do a full build of the kernel.      
> > > >>>
> > > >>> Yeah, either that or there are some config options with different values.
> > > >>>
> > > >>> I was able to do a full build here without the above errors, although
> > > >>> I had to turn of some CONFIG options that were otherwise failing.      
> > > >>
> > > >> Strange - I do not get it :-/ ... can you send me the .config file and
> > > >> Makefile you use; probably I missed something.      
> > > > 
> > > > I posted an alternate version, with the driver from the Yocto Aero tree
> > > > ported to Kernel 5.7-rc2. The Kernel sources used are at this directory:
> > > > 
> > > > 	https://download.01.org/aero/deb/pool/main/l/linux-4.4.76-aero-1.3/
> > > > 
> > > > Such port is at the atomisp_yocto_v1:
> > > > 
> > > > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_yocto_v1
> > > > 
> > > > The goal of this port is not for upstreaming it. Instead, it is meant
> > > > to be used just for testing, using a version that should work - at least
> > > > with the Intel Aero board with the Aero drone's camera (tests needed, as
> > > > I don't have myself such hardware). This version is ISP2401 only.
> > > > 
> > > > The firmware for it is at:
> > > > 	https://download.01.org/aero/deb/pool/main/f/firmware-atomisp/firmware-atomisp_0.1.orig.tar.xz
> > > > 
> > > > If the ISP revision is equal or bigger than rev 02, this file should be
> > > > renamed to:
> > > > 
> > > > 	shisp_2401b0_v21.bin
> > > > 
> > > > Before getting excited, this version didn't work so far on my hardware:
> > > > 
> > > > 	atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
> > > > 	atomisp-isp2 0000:00:03.0: css load fw failed.
> > > > 	atomisp-isp2 0000:00:03.0: Failed to init css.
> > > > 
> > > > (I didn't try to check why it is failing yet - maybe it is just
> > > > some version port related issue)
> > > > 
> > > > If someone has access to the Intel Aero board, I'd appreciate if you
> > > > could test it and send the results. If it fails too, it would be
> > > > nice to have the dmesg output of this version and the dmesg from
> > > > a version which works.      
> > > 
> > > Mauro, first of all thank you for working on this.
> > > 
> > > I wonder if you have tried to build and run the linux-4.4.76-aero-1.3
> > > kernel on your T101HA ? It would be interesting to see if that one
> > > does (not) have the "css load fw failed" errors and who knows you
> > > might even be able to get that to actually show some sort of picture
> > > from one of the 2 sensors on the T101HA ?    
> > 
> > Yes, I tried, but the Kernel doesn't even boot. Grub2 simply doesn't 
> > show any messages when trying to boot a Kernel 4.4 Kernel on it.
> > 
> > As this device doesn't have any physical serial ports, and the only 
> > USB cables I have are based on a chipset not supported by GRUB[1], I
> > can't see where it is failing.
> > 
> > [1] A side note to myself: I need to spend some time checking what
> > serial cables would work with grub2 and try to buy one such cable.  
> 
> Eureka!
> 
> Looking at the Yocto's port, I noticed this comment:
> 
> 	#ifdef CONFIG_INTEL_MID_ISP
> 	/* Moorefield lacks PCI PM, BYT advertises it but it's broken, use PUNIT */
> 	#define ATOMISP_INTERNAL_PM    (IS_MOFD || IS_BYT || IS_CHT)
> 	#endif
> 
> And some other codes like this:
> 
> 	#ifdef CONFIG_INTEL_MID_ISP
> 	       if (ATOMISP_INTERNAL_PM) {
> 	               ret = atomisp_mrfld_power_up(isp);
> 	               if (ret)
> 	                       return ret;
> 	       }
> 	#endif
> 
> 
> Basically, for some types of hardware, it has to disable the 
> atomisp_mrfld_power_up() and atomisp_mrfld_power_down() calls.
> 
> So, a hack like this:
> 
> <code snip>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 8c7b42221659..5c1f8bcc24f4 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -824,12 +824,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
>  /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
>  int atomisp_mrfld_power_down(struct atomisp_device *isp)
>  {
> +return 0;
> +
>  	return atomisp_mrfld_power(isp, false);
>  }
>  
>  /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
>  int atomisp_mrfld_power_up(struct atomisp_device *isp)
>  {
> +return 0;
>  	return atomisp_mrfld_power(isp, true);
>  }
> </code snip>
>  
> Made the firmware to properly load, and the driver now shows signs of life:
> 
> v4l2-ctl --all
> Driver Info:
> 	Driver name      : atomisp
> 	Card type        : ATOM ISP
> 	Bus info         : PCI:0000:00:03.0
> 	Driver version   : 5.7.0
> 	Capabilities     : 0xa4200003
> 		Video Capture
> 		Video Output
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x24200003
> 		Video Capture
> 		Video Output
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : atomisp-isp2
> 	Model            : Intel Atom ISP
> 	Serial           : 
> 	Bus info         : 
> 	Media version    : 5.7.0
> 	Hardware revision: 0x00002010 (8208)
> 	Driver version   : 5.7.0
> Interface Info:
> 	ID               : 0x03000016
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000014 (20)
> 	Name             : ATOMISP ISP CAPTURE output
> 	Function         : V4L2 I/O
> 	Pad 0x01000015   : 0: Sink
> 	  Link 0x02000062: from remote pad 0x1000010 of entity 'ATOMISP_SUBDEV_0': Data
> Priority: 0
> Video input : 0 (ATOMISP ISP CAPTURE output: ok)
> Format Video Capture:
> 	Width/Height      : 0/0
> 	Pixel Format      : ''
> 	Field             : Any
> 	Bytes per Line    : 0
> 	Size Image        : 0
> 	Colorspace        : Default
> 	Transfer Function : Default (maps to Rec. 709)
> 	YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> 	Quantization      : Default (maps to Full Range)
> 	Flags             : 
> Streaming Parameters Video Capture:
> 	Frames per second: invalid (0/0)
> 	Read buffers     : 0
> error 22 getting ctrl Automatic White Balance
> error 22 getting ctrl Red Balance
> error 22 getting ctrl Blue Balance
> error 22 getting ctrl Gamma
> error 22 getting ctrl exposure
> error 22 getting ctrl Light frequency filter
>              image_color_effect 0x0098091f (int)    : min=0 max=9 step=1 default=0 value=0
> error 22 getting ctrl Image Color Effect CbCr
>            bad_pixel_correction 0x08000000 (int)    : min=0 max=1 step=1 default=0 value=1
>                         gdc_cac 0x08000001 (int)    : min=0 max=1 step=1 default=0 value=0
>              video_stablization 0x08000002 (int)    : min=0 max=1 step=1 default=0 value=0
>   fixed_pattern_noise_reduction 0x08000003 (int)    : min=0 max=1 step=1 default=0 value=0
>          false_color_correction 0x08000004 (int)    : min=0 max=1 step=1 default=0 value=0
>                  low_light_mode 0x08000005 (bool)   : default=1 value=0
> 
> 
> It doesn't stream on yet:
> 
> 	[ 1040.688130] atomisp-isp2 0000:00:03.0: sh_css_init success
> 	[ 1040.688748] BUG: unable to handle page fault for address: 0000000000004518
> 	[ 1040.688754] #PF: supervisor read access in kernel mode
> 	[ 1040.688757] #PF: error_code(0x0000) - not-present page
> 	[ 1040.688760] PGD 0 P4D 0 
> 
> But at least it is now showing some signals of life.
> 
> There are still lots of  work to do before it can run, but it sounds 
> that we'll eventually get there.
> Thanks,
> Mauro


I did a lot of progress today. After identified the above bug, which
was turning down the ISP device, causing the firmware load to fail
(as the turn on code is not OK), I solved several other issues there.

The current status is that:

- the ISP firmware is properly loading;
- it can properly communicate with the camera sensor;
- Userspace can read video controls (tested with v4l2-ctl and qv4l2);
- set a video format is now working;
- buffers are being queued, and per-frame IRQs are arriving.

I did a really quick test today of trying to get a video from it,
using a simple tool I developed for such kind of tests (v4l2grab 
from v4l-utils package, changed to work with the only format that
my camera sensor supports). This tool needs uses a bare minimum
set of ioctls, with would avoid hitting a bug somewhere else.

Running it makes the device to start receiving frames from the
hardware. Yet, there's something wrong at the part with stores
the data into the video frame buffers. This driver has a weird
mm/DMA code, based on a fork of get_user_pages() taken probably
during Kernel 3.10 old days. 

Addressing it has a high chance of grabbing some image from it.

Ok, driver is at staging quality: there are lots of crap there that
will require changes, but it seems we're getting there.

Thanks,
Mauro


[   16.992312] atomisp_gmin_platform: module is from the staging directory, the quality is unknown, you have been warned.
[   17.149892] atomisp: module is from the staging directory, the quality is unknown, you have been warned.
[   17.300671] atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
[   17.304865] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[   17.309779] atomisp-isp2 0000:00:03.0: start: 0x91000000
[   17.309844] atomisp-isp2 0000:00:03.0: base: 00000000b729c9ce
[   17.309847] atomisp-isp2 0000:00:03.0: atomisp_io_base: 00000000b729c9ce
[   17.309858] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
[   17.466845] atomisp-isp2 0000:00:03.0: Firmware version may not be compatible with this driver
[   17.472253] atomisp-isp2 0000:00:03.0: Expecting version 'irci_ecr - master_20150911_0724', but firmware is 'irci_stable_candrpv_0415_20150521_0458'.
[   17.993376] atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[   18.180880] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[   18.468046] atomisp-isp2 0000:00:03.0: Probing Subdev OVTI2680:00
[   18.475814] atomisp-isp2 0000:00:03.0: Subdev OVTI2680:00 successfully register
[   18.479475] atomisp-isp2 0000:00:03.0: raw_index: 0
[   18.479478] atomisp-isp2 0000:00:03.0: SOC_INDEX: 0
[   18.479482] atomisp-isp2 0000:00:03.0: detected 1 camera sensors
[   18.483036] atomisp-isp2 0000:00:03.0: atomisp_csi_lane_config: the portconfig is 1-1-0, CSI_CONTROL is 0x0003008C
[   18.483041] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port0 was not initialized!
[   18.487850] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port1 was not initialized!
[   18.492186] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port2 was not initialized!
[   18.498354] atomisp-isp2 0000:00:03.0: Entity type for entity file_input_subdev was not initialized!
[   18.501774] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev was not initialized!
[   18.505156] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_0 was not initialized!
[   18.512876] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_1 was not initialized!
[   18.520554] atomisp-isp2 0000:00:03.0: FILE_INPUT enable, camera_cnt: 1
[   18.520558] atomisp-isp2 0000:00:03.0: TPG detected, camera_cnt: 2
[   18.521886] atomisp-isp2 0000:00:03.0: atomisp_save_iunit_reg
[   18.521933] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   18.521936] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   18.521948] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   18.522052] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   18.522172] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   18.523350] atomisp-isp2 0000:00:03.0: Firmware version may not be compatible with this driver
[   18.526725] atomisp-isp2 0000:00:03.0: Expecting version 'irci_ecr - master_20150911_0724', but firmware is 'irci_stable_candrpv_0415_20150521_0458'.
[   22.695171] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIEWFINDER output
[   22.695245] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[   22.695265] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.695268] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.695280] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.695384] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.703634] atomisp-isp2 0000:00:03.0: sh_css_init success
[   22.703755] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP VIEWFINDER output
[   22.703766] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.703772] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.703777] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.703780] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.703784] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.703787] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.703791] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.703794] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.703798] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.703801] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.703804] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.704805] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.704810] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.704821] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.704926] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   22.704983] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.704987] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.770633] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP PREVIEW output
[   22.770707] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[   22.770728] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.770731] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.770743] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.782506] atomisp-isp2 0000:00:03.0: sh_css_init success
[   22.782642] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP PREVIEW output
[   22.782652] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.782659] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.782664] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.782667] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.782671] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.782674] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.782678] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.782681] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.782685] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.782688] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.782691] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.783645] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.783649] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.783660] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.783765] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   22.783803] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.783807] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.794753] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIEWFINDER output
[   22.794824] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[   22.794843] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.794846] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.794857] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.794977] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.797849] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP MEMORY input
[   22.800926] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
[   22.812712] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
[   22.817645] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP ACC
[   22.819822] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIDEO output
[   22.898738] atomisp-isp2 0000:00:03.0: sh_css_init success
[   22.899079] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.899215] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.899246] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.899307] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.899337] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.899445] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP VIEWFINDER output
[   22.899456] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.899462] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899467] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899471] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899475] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899478] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899482] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899485] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899489] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899492] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899495] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899504] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899507] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899531] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP MEMORY input
[   22.899542] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.899548] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899553] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899557] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899561] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899564] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899568] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899571] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899574] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899577] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899581] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899589] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899593] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899596] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899600] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899603] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899607] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899610] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899614] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.899617] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.899620] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903400] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP CAPTURE output
[   22.903414] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.903420] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903425] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903429] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903433] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903436] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903440] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903443] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903447] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903450] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903453] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.903485] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.903488] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.904196] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP ACC
[   22.904203] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.904285] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP ACC
[   22.907132] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP CAPTURE output
[   22.907145] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.907150] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907156] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907159] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.907163] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907167] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.907171] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907174] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.907178] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907181] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.907184] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.907193] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.907196] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.911162] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP ACC
[   22.913194] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP VIDEO output
[   22.913207] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.913213] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.913220] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.913223] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.913227] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.913230] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.913234] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.913237] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.913241] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.913244] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.913248] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.914487] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.914491] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.914503] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.914612] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.914717] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   22.914756] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.914760] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.954745] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIDEO output
[   22.955327] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[   22.955345] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.955348] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.955360] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.955859] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.986125] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP PREVIEW output
[   22.986246] atomisp-isp2 0000:00:03.0: sh_css_init success
[   22.986282] atomisp-isp2 0000:00:03.0: skip init isp in open
[   22.986782] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP PREVIEW output
[   22.986792] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.986798] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986803] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986806] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.986810] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986813] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.986817] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986820] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.986824] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986827] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.986831] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.986840] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.986843] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.998304] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP VIDEO output
[   22.998316] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[   22.998323] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.998328] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.998331] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.998335] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.998338] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.998342] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.998345] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.998349] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.998352] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.998355] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[   22.999578] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[   22.999583] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[   22.999594] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[   22.999699] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[   22.999740] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[   22.999743] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0

When I start v4l2grab, I got the stuff below	

[  209.961974] atomisp-isp2 0000:00:03.0: open device ATOMISP ISP CAPTURE output
[  209.962131] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[  209.962170] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[  209.962174] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[  209.962187] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  209.962293] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  209.972377] isys dma store at addr(0xcd408) val(0)
[  209.973180] atomisp-isp2 0000:00:03.0: sh_css_init success
[  209.975785] atomisp-isp2 0000:00:03.0: try_mbus_fmt: asking for 1616x1216
[  209.975794] ov2680 i2c-OVTI2680:00: ov2680_set_fmt: try: pad: 0, fmt: 000000001caa5ada
[  209.975798] atomisp-isp2 0000:00:03.0: try_mbus_fmt: got 1616x1216
[  209.975816] atomisp-isp2 0000:00:03.0: setting resolution 1616x1216 on pad 1 for asd0, bytesperline 0
[  209.975820] atomisp-isp2 0000:00:03.0: try_mbus_fmt: asking for 1616x1216
[  209.975824] ov2680 i2c-OVTI2680:00: ov2680_set_fmt: try: pad: 0, fmt: 0000000088f2a982
[  209.975827] atomisp-isp2 0000:00:03.0: try_mbus_fmt: got 1616x1216
[  209.975832] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE w 0 h 0 code 0x00003007 which V4L2_SUBDEV_FORMAT_ACTIVE
[  209.975838] atomisp-isp2 0000:00:03.0: s_mbus_fmt: ask 1616x1216 (padding 0x0, dvs 0x0)
[  209.975840] atomisp-isp2 0000:00:03.0: sensor width: 1616, height: 1216
[  209.975844] ov2680 i2c-OVTI2680:00: ov2680_set_fmt: set: pad: 0, fmt: 000000009b679c7a
[  209.975846] ov2680 i2c-OVTI2680:00: ov2680_set_fmt: Resolution index: 0
[  209.975849] ov2680 i2c-OVTI2680:00: ov2680_set_fmt: i=0, w=1616, h=1216
[  209.975852] ov2680 i2c-OVTI2680:00: power_ctrl: on
[  210.072235] ov2680 i2c-OVTI2680:00: ++++ov2680_get_intg_factor
[  210.074133] OVTI2680:00: 
               ov2680_set_fmt idx 0
[  210.074157] atomisp-isp2 0000:00:03.0: sensor width: 1616, height: 1216
[  210.074171] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 1616 h 1216 code 0x00003007 which V4L2_SUBDEV_FORMAT_ACTIVE
[  210.074187] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074201] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074210] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074221] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074229] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074240] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074248] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074258] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074267] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074275] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074292] atomisp-isp2 0000:00:03.0: css_input_resolution_changed to 1616x1216
[  210.074312] atomisp-isp2 0000:00:03.0: atomisp_csi_lane_config: the portconfig is 1-1-0, CSI_CONTROL is 0x0303008C
[  210.074320] atomisp-isp2 0000:00:03.0: copy_mode: 1
[  210.074332] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000004
[  210.074340] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074351] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 1616 h 1216 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074359] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 1616 h 1216
[  210.074376] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 640 h 480 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  210.074386] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 640 h 480
[  210.074395] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SOURCE_VF w 0 h 0 code 0x00008001 which V4L2_SUBDEV_FORMAT_ACTIVE
[  210.074408] atomisp-isp2 0000:00:03.0: configuring pipe[3] vf output info w=640.h=480.f=1.
[  210.074421] atomisp-isp2 0000:00:03.0: configuring pipe[1] output info w=1616.h=1216.f=17.
[  210.074462] atomisp-isp2 0000:00:03.0: dumping pipe[1] config:
[  210.074470] atomisp-isp2 0000:00:03.0: pipe_config.pipe_mode:4.
[  210.074477] atomisp-isp2 0000:00:03.0: pipe_config.output_info[0] w=1616, h=1216.
[  210.074484] atomisp-isp2 0000:00:03.0: pipe_config.vf_pp_in_res w=0, h=0.
[  210.074491] atomisp-isp2 0000:00:03.0: pipe_config.capt_pp_in_res w=0, h=0.
[  210.074498] atomisp-isp2 0000:00:03.0: pipe_config.output.padded w=0.
[  210.074505] atomisp-isp2 0000:00:03.0: pipe_config.vf_output_info[0] w=0, h=0.
[  210.074512] atomisp-isp2 0000:00:03.0: pipe_config.bayer_ds_out_res w=0, h=0.
[  210.074518] atomisp-isp2 0000:00:03.0: pipe_config.envelope w=0, h=0.
[  210.074524] atomisp-isp2 0000:00:03.0: pipe_config.dvs_frame_delay=1.
[  210.074530] atomisp-isp2 0000:00:03.0: pipe_config.isp_pipe_version:2.
[  210.074540] atomisp-isp2 0000:00:03.0: pipe_config.acc_extension=00000000352f4d07.
[  210.074548] atomisp-isp2 0000:00:03.0: pipe_config.acc_stages=00000000352f4d07.
[  210.074554] atomisp-isp2 0000:00:03.0: pipe_config.num_acc_stages=0.
[  210.074560] atomisp-isp2 0000:00:03.0: pipe_config.acc_num_execs=-1.
[  210.074567] atomisp-isp2 0000:00:03.0: pipe_config.default_capture_config.capture_mode=0.
[  210.074573] atomisp-isp2 0000:00:03.0: pipe_config.enable_dz=0.
[  210.074579] atomisp-isp2 0000:00:03.0: pipe_config.default_capture_config.enable_xnr=0.
[  210.074585] atomisp-isp2 0000:00:03.0: dumping pipe[1] extra config:
[  210.074593] atomisp-isp2 0000:00:03.0: pipe_extra_config.enable_raw_binning:0.
[  210.074599] atomisp-isp2 0000:00:03.0: pipe_extra_config.enable_yuv_ds:0.
[  210.074605] atomisp-isp2 0000:00:03.0: pipe_extra_config.enable_high_speed:0.
[  210.074611] atomisp-isp2 0000:00:03.0: pipe_extra_config.enable_dvs_6axis:0.
[  210.074618] atomisp-isp2 0000:00:03.0: pipe_extra_config.enable_reduced_pipe:0.
[  210.074624] atomisp-isp2 0000:00:03.0: pipe_(extra_)config.enable_dz:0.
[  210.074630] atomisp-isp2 0000:00:03.0: pipe_extra_config.disable_vf_pp:0.
[  210.074636] atomisp-isp2 0000:00:03.0: stream_config.mode=5.
[  210.074642] atomisp-isp2 0000:00:03.0: stream_config.source.port.port=0.
[  210.074648] atomisp-isp2 0000:00:03.0: stream_config.source.port.num_lanes=1.
[  210.074655] atomisp-isp2 0000:00:03.0: stream_config.source.port.timeout=1048564.
[  210.074662] atomisp-isp2 0000:00:03.0: stream_config.source.port.rxcount=0x4040404.
[  210.074668] atomisp-isp2 0000:00:03.0: stream_config.source.port.compression.type=0.
[  210.074674] atomisp-isp2 0000:00:03.0: stream_config.source.port.compression.compressed_bits_per_pixel=0.
[  210.074680] atomisp-isp2 0000:00:03.0: stream_config.source.port.compression.uncompressed_bits_per_pixel=0.
[  210.074688] atomisp-isp2 0000:00:03.0: stream_configisys_config[0].input_res w=1616, h=1216.
[  210.074695] atomisp-isp2 0000:00:03.0: stream_configisys_config[0].linked_isys_stream_id=-1
[  210.074702] atomisp-isp2 0000:00:03.0: stream_configisys_config[0].format=15
[  210.074708] atomisp-isp2 0000:00:03.0: stream_configisys_config[0].valid=1.
[  210.074716] atomisp-isp2 0000:00:03.0: stream_configisys_config[1].input_res w=0, h=0.
[  210.074722] atomisp-isp2 0000:00:03.0: stream_configisys_config[1].linked_isys_stream_id=0
[  210.074729] atomisp-isp2 0000:00:03.0: stream_configisys_config[1].format=0
[  210.074736] atomisp-isp2 0000:00:03.0: stream_configisys_config[1].valid=0.
[  210.074743] atomisp-isp2 0000:00:03.0: stream_config.input_config.input_res w=1616, h=1216.
[  210.074752] atomisp-isp2 0000:00:03.0: stream_config.input_config.effective_res w=1616, h=1216.
[  210.074758] atomisp-isp2 0000:00:03.0: stream_config.input_config.format=15
[  210.074765] atomisp-isp2 0000:00:03.0: stream_config.input_config.bayer_order=2.
[  210.074771] atomisp-isp2 0000:00:03.0: stream_config.pixels_per_clock=1.
[  210.074777] atomisp-isp2 0000:00:03.0: stream_config.online=0.
[  210.074783] atomisp-isp2 0000:00:03.0: stream_config.continuous=0.
[  210.074789] atomisp-isp2 0000:00:03.0: stream_config.disable_cont_viewfinder=0.
[  210.074795] atomisp-isp2 0000:00:03.0: stream_config.channel_id=0.
[  210.074801] atomisp-isp2 0000:00:03.0: stream_config.init_num_cont_raw_buf=0.
[  210.074807] atomisp-isp2 0000:00:03.0: stream_config.target_num_cont_raw_buf=3.
[  210.074813] atomisp-isp2 0000:00:03.0: stream_config.left_padding=-1.
[  210.074821] atomisp-isp2 0000:00:03.0: stream_config.sensor_binning_factor=0.
[  210.074827] atomisp-isp2 0000:00:03.0: stream_config.pixels_per_clock=1.
[  210.074834] atomisp-isp2 0000:00:03.0: stream_config.pack_raw_pixels=0.
[  210.074840] atomisp-isp2 0000:00:03.0: stream_config.flash_gpio_pin=0.
[  210.074847] atomisp-isp2 0000:00:03.0: stream_config.mipi_buffer_config.size_mem_words=93633.
[  210.074853] atomisp-isp2 0000:00:03.0: stream_config.mipi_buffer_config.contiguous=0.
[  210.074859] atomisp-isp2 0000:00:03.0: stream_config.metadata_config.data_type=30.
[  210.074866] atomisp-isp2 0000:00:03.0: stream_config.metadata_config.resolution w=0, h=0.
[  210.075684] atomisp-isp2 0000:00:03.0: getting main frame info.
[  210.075695] atomisp-isp2 0000:00:03.0: get frame info: w=1616, h=1216, num_invalid_frames 0.
[  210.075708] atomisp-isp2 0000:00:03.0: grid info change escape. memcmp=1, s3a_user_stat=0,dvs_stat=0, s3a.width=0, s3a.height=0, metadata width =0
[  210.075780] atomisp-isp2 0000:00:03.0: allocating 11 metadata buffers for type 0
[  210.075794] atomisp-isp2 0000:00:03.0: allocating 11 metadata buffers for type 1
[  210.096689] atomisp-isp2 0000:00:03.0: qbuf buffer 0 (ATOMISP ISP CAPTURE output) for asd0
[  210.096754] atomisp-isp2 0000:00:03.0: qbuf buffer 1 (ATOMISP ISP CAPTURE output) for asd0
[  210.096780] atomisp-isp2 0000:00:03.0: Start stream on pad 1 for asd0
[  210.096824] atomisp-isp2 0000:00:03.0: atomisp_css_update_isp_params: ia_css_stream_set_isp_config() not supported in copy mode!.
[  210.097552] atomisp-isp2 0000:00:03.0: irq:0x20
[  210.097581] atomisp-isp2 0000:00:03.0: irq:0x20
[  210.097596] atomisp-isp2 0000:00:03.0: irq:0x20
[  210.097619] atomisp-isp2 0000:00:03.0: irq:0x20
[  210.097638] atomisp-isp2 0000:00:03.0: irq:0x20
[  210.097709] atomisp-isp2 0000:00:03.0: stream[0] started.
[  210.097809] atomisp-isp2 0000:00:03.0: atomisp_css_irq_enable:Invalid irq info.
[  210.097822] atomisp-isp2 0000:00:03.0: dfs failed!
[  210.097830] ov2680 i2c-OVTI2680:00: ov2680_s_stream one
[  210.098036] atomisp-isp2 0000:00:03.0: WDT starts with 2000 ms period (ATOMISP ISP CAPTURE output)
[  210.098572] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.098594] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 1, asd 0
[  210.098605] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 2, asd 0
[  210.098625] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.098725] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.098740] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 3, asd 0
[  210.098849] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.098865] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 4, asd 0
[  210.098975] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.098992] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 5, asd 0
[  210.099099] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099116] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 6, asd 0
[  210.099309] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099327] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 7, asd 0
[  210.099338] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 8, asd 0
[  210.099351] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099524] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099541] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 9, asd 0
[  210.099595] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099610] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 10, asd 0
[  210.099692] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099707] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 11, asd 0
[  210.099815] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099829] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 12, asd 0
[  210.099938] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.099951] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 13, asd 0
[  210.100063] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100077] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 14, asd 0
[  210.100186] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100200] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 15, asd 0
[  210.100311] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100325] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 16, asd 0
[  210.100434] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100450] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 17, asd 0
[  210.100556] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100571] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 18, asd 0
[  210.100679] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100693] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 19, asd 0
[  210.100801] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100816] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 20, asd 0
[  210.100926] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.100940] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 21, asd 0
[  210.101049] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101063] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 22, asd 0
[  210.101174] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101188] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 23, asd 0
[  210.101348] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101362] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 24, asd 0
[  210.101474] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101488] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 25, asd 0
[  210.101548] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101562] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 26, asd 0
[  210.101668] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101682] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 27, asd 0
[  210.101791] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101804] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 28, asd 0
[  210.101914] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.101927] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 29, asd 0
[  210.102039] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.102055] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 30, asd 0
[  210.102163] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.102178] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 31, asd 0
[  210.102290] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.102305] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 32, asd 0
[  210.102410] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.102425] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 33, asd 0
[  210.102534] atomisp-isp2 0000:00:03.0: irq:0x200000
[  210.102549] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 34, asd 0
[  210.102656] atomisp-isp2 0000:00:03.0: irq:0x200000
...
[  213.264176] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 207, asd 0
[  213.264292] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264306] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 208, asd 0
[  213.264420] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264434] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 209, asd 0
[  213.264543] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264556] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 210, asd 0
[  213.264671] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264686] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 211, asd 0
[  213.264795] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264809] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 212, asd 0
[  213.264922] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.264939] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 213, asd 0
[  213.265047] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265061] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 214, asd 0
[  213.265176] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265192] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 215, asd 0
[  213.265302] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265317] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 216, asd 0
[  213.265428] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265442] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 217, asd 0
[  213.265554] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265569] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 218, asd 0
[  213.265678] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265691] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 219, asd 0
[  213.265806] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265822] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 220, asd 0
[  213.265932] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.265949] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 221, asd 0
[  213.266057] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266072] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 222, asd 0
[  213.266181] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266195] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 223, asd 0
[  213.266308] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266322] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 224, asd 0
[  213.266435] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266451] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 225, asd 0
[  213.266558] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266571] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 226, asd 0
[  213.266684] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.266698] atomisp-isp2 0000:00:03.0: atomisp_isr EOF exp_id 227, asd 0
[  213.266745] atomisp-isp2 0000:00:03.0: release device ATOMISP ISP CAPTURE output
[  213.266749] atomisp-isp2 0000:00:03.0: atomisp_release: ISP still streaming while closing!
[  213.266757] atomisp-isp2 0000:00:03.0: Stop stream on pad 1 for asd0
[  213.266761] atomisp-isp2 0000:00:03.0: WDT stop:
[  213.266765] atomisp-isp2 0000:00:03.0: atomisp_css_irq_enable:Invalid irq info.
[  213.270681] atomisp-isp2 0000:00:03.0: irq:0x200000
[  213.275332] atomisp-isp2 0000:00:03.0: irq:0x20
[  213.286460] ov2680 i2c-OVTI2680:00: ov2680_s_stream off
[  213.289045] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[  213.289050] atomisp-isp2 0000:00:03.0: atomisp_reset
[  213.289055] atomisp-isp2 0000:00:03.0: atomisp_reset
[  213.290686] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[  213.290691] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[  213.290703] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  213.290807] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  213.290928] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[  213.290940] atomisp-isp2 0000:00:03.0: atomisp_restore_iunit_reg
[  213.290957] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[  213.290960] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[  213.290970] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  213.293897] isys dma store at addr(0xcd408) val(0)
[  213.294546] atomisp-isp2 0000:00:03.0: ffmt: pad ATOMISP_SUBDEV_PAD_SINK w 0 h 0 code 0x00000000 which V4L2_SUBDEV_FORMAT_ACTIVE
[  213.294552] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SINK tgt V4L2_SEL_TGT_CROP l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.294557] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.294561] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.294565] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VF tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.294568] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.294573] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.294576] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.294580] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_VIDEO tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.294583] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.294587] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.294628] ov2680 i2c-OVTI2680:00: power_ctrl: off
[  213.304032] atomisp-isp2 0000:00:03.0: DFS target frequency=100.
[  213.304035] atomisp-isp2 0000:00:03.0: Programming DFS frequency to 100
[  213.304046] atomisp-isp2 0000:00:03.0: waiting for ISPSSPM1 valid bit to be 0.
[  213.304152] atomisp-isp2 0000:00:03.0: atomisp_ospm_dphy_down
[  213.304189] atomisp-isp2 0000:00:03.0: sel: pad ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE tgt V4L2_SEL_TGT_COMPOSE l 0 t 0 w 0 h 0 which V4L2_SUBDEV_FORMAT_ACTIVE f 0x00000000
[  213.304193] atomisp-isp2 0000:00:03.0: sel actual: l 0 t 0 w 0 h 0
[  213.304898] BUG: non-zero pgtables_bytes on freeing mm: 24576





Thanks,
Mauro
