Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90FF1D4837
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgEOIco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:32:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727899AbgEOIcn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:32:43 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99FF920657;
        Fri, 15 May 2020 08:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589531562;
        bh=Kdgq+KNRdxG0i/OXkj3gTn5g+m7DgaLYcz72qeFPrpg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lp+5n70sTPS7KfNi64O0fGU4fuoHJ2tI88SSZU6dfqbfwy1WtUfKorMtlL1U8velm
         4wU40yGohnQz9GfG4lUePZhZGeYznpjOqKCjMssmB9JMaHRpKz3pLeN524rxm0W+E7
         KIfMhyBdYxygp4r3BX0tnoYAuOrSe1FCYSzRioKw=
Date:   Fri, 15 May 2020 10:32:32 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Francescodario Cuzzocrea 
        <francescodario.cuzzocrea@mail.polimi.it>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] Ressurect the atomisp staging driver
Message-ID: <20200515103232.47b2a35e@coco.lan>
In-Reply-To: <20200504154420.5dcf505f@ASUS>
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
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 4 May 2020 15:44:20 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> > > Maybe this is related to my partial build (only the module to test if
> > > it builds). I'll now do a full build of the kernel.    
> > 
> > Yeah, either that or there are some config options with different values.
> > 
> > I was able to do a full build here without the above errors, although
> > I had to turn of some CONFIG options that were otherwise failing.  
> 
> Strange - I do not get it :-/ ... can you send me the .config file and
> Makefile you use; probably I missed something.

I posted an alternate version, with the driver from the Yocto Aero tree
ported to Kernel 5.7-rc2. The Kernel sources used are at this directory:

	https://download.01.org/aero/deb/pool/main/l/linux-4.4.76-aero-1.3/

Such port is at the atomisp_yocto_v1:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_yocto_v1

The goal of this port is not for upstreaming it. Instead, it is meant
to be used just for testing, using a version that should work - at least
with the Intel Aero board with the Aero drone's camera (tests needed, as
I don't have myself such hardware). This version is ISP2401 only.

The firmware for it is at:
	https://download.01.org/aero/deb/pool/main/f/firmware-atomisp/firmware-atomisp_0.1.orig.tar.xz

If the ISP revision is equal or bigger than rev 02, this file should be
renamed to:

	shisp_2401b0_v21.bin

Before getting excited, this version didn't work so far on my hardware:

	atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
	atomisp-isp2 0000:00:03.0: css load fw failed.
	atomisp-isp2 0000:00:03.0: Failed to init css.

(I didn't try to check why it is failing yet - maybe it is just
some version port related issue)

If someone has access to the Intel Aero board, I'd appreciate if you
could test it and send the results. If it fails too, it would be
nice to have the dmesg output of this version and the dmesg from
a version which works.

Thanks,
Mauro

[   17.339160] atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
[   17.343551] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[   17.349857] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
[   17.503537] atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
[   17.557614] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=0 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input20
[   17.565192] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=1 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input21
[   17.570399] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=2 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input22
[   17.918031] dw_dmac INTL9C60:00: DesignWare DMA Controller, 8 channels
[   17.952066] dw_dmac INTL9C60:01: DesignWare DMA Controller, 8 channels
[   17.985961] input: Intel HID events as /devices/pci0000:00/INT33D5:00/input/input23
[   18.027489] intel_sst_acpi 808622A8:00: LPE base: 0x91400000 size:0x200000
[   18.031435] intel_sst_acpi 808622A8:00: IRAM base: 0x914c0000
[   18.040266] intel_sst_acpi 808622A8:00: DRAM base: 0x91500000
[   18.046614] intel_sst_acpi 808622A8:00: SHIM base: 0x91540000
[   18.052951] intel_sst_acpi 808622A8:00: Mailbox base: 0x91544000
[   18.060278] intel_sst_acpi 808622A8:00: DDR base: 0x20000000
[   18.064686] rt5645 i2c-10EC3270:00: supply avdd not found, using dummy regulator
[   18.071011] rt5645 i2c-10EC3270:00: supply cpvdd not found, using dummy regulator
[   18.071123] intel_sst_acpi 808622A8:00: Got drv data max stream 25
[   18.108451] atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[   18.136465] ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680
[   18.143419] ov2680 i2c-OVTI2680:00: gmin: power management provided via Dollar Cove TI PMIC (i2c addr 0x5e)
[   18.148928] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CamClk'
[   18.155196] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_ClkSrc'
[   18.160751] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiPort'
[   18.166904] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiLanes'
[   18.173829] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V1P8GPIO'
[   18.180318] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V2P8GPIO'
[   18.268406] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
[   18.277517] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
[   18.297737] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[   18.556333] atomisp-isp2 0000:00:03.0: Probing Subdev OVTI2680:00
[   18.562458] atomisp-isp2 0000:00:03.0: Subdev OVTI2680:00 successfully register
[   18.566047] atomisp-isp2 0000:00:03.0: detected 1 camera sensors
[   18.571349] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port0 was not initialized!
[   18.576474] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port1 was not initialized!
[   18.580409] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port2 was not initialized!
[   18.585391] atomisp-isp2 0000:00:03.0: Entity type for entity file_input_subdev was not initialized!
[   18.590868] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev was not initialized!
[   18.597985] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_0 was not initialized!
[   18.605481] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_1 was not initialized!
[   18.613965] atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
[   18.621420] atomisp-isp2 0000:00:03.0: css load fw failed.
[   18.624687] atomisp-isp2 0000:00:03.0: Failed to init css.
[   17.339160] atomisp-isp2 0000:00:03.0: Detected Cherrytrail version 54 (ISP2401) on T101HA
[   17.343551] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
[   17.349857] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
[   17.503537] atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
[   17.557614] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=0 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input20
[   17.565192] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=1 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input21
[   17.570399] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=2 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input22
[   17.918031] dw_dmac INTL9C60:00: DesignWare DMA Controller, 8 channels
[   17.952066] dw_dmac INTL9C60:01: DesignWare DMA Controller, 8 channels
[   17.985961] input: Intel HID events as /devices/pci0000:00/INT33D5:00/input/input23
[   18.027489] intel_sst_acpi 808622A8:00: LPE base: 0x91400000 size:0x200000
[   18.031435] intel_sst_acpi 808622A8:00: IRAM base: 0x914c0000
[   18.040266] intel_sst_acpi 808622A8:00: DRAM base: 0x91500000
[   18.046614] intel_sst_acpi 808622A8:00: SHIM base: 0x91540000
[   18.052951] intel_sst_acpi 808622A8:00: Mailbox base: 0x91544000
[   18.060278] intel_sst_acpi 808622A8:00: DDR base: 0x20000000
[   18.064686] rt5645 i2c-10EC3270:00: supply avdd not found, using dummy regulator
[   18.071011] rt5645 i2c-10EC3270:00: supply cpvdd not found, using dummy regulator
[   18.071123] intel_sst_acpi 808622A8:00: Got drv data max stream 25
[   18.108451] atomisp_ov2680: module is from the staging directory, the quality is unknown, you have been warned.
[   18.136465] ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680
[   18.143419] ov2680 i2c-OVTI2680:00: gmin: power management provided via Dollar Cove TI PMIC (i2c addr 0x5e)
[   18.148928] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CamClk'
[   18.155196] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_ClkSrc'
[   18.160751] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiPort'
[   18.166904] ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiLanes'
[   18.173829] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V1P8GPIO'
[   18.180318] ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V2P8GPIO'
[   18.268406] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
[   18.277517] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
[   18.297737] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
[   18.556333] atomisp-isp2 0000:00:03.0: Probing Subdev OVTI2680:00
[   18.562458] atomisp-isp2 0000:00:03.0: Subdev OVTI2680:00 successfully register
[   18.566047] atomisp-isp2 0000:00:03.0: detected 1 camera sensors
[   18.571349] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port0 was not initialized!
[   18.576474] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port1 was not initialized!
[   18.580409] atomisp-isp2 0000:00:03.0: Entity type for entity ATOM ISP CSI2-port2 was not initialized!
[   18.585391] atomisp-isp2 0000:00:03.0: Entity type for entity file_input_subdev was not initialized!
[   18.590868] atomisp-isp2 0000:00:03.0: Entity type for entity tpg_subdev was not initialized!
[   18.597985] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_0 was not initialized!
[   18.605481] atomisp-isp2 0000:00:03.0: Entity type for entity ATOMISP_SUBDEV_1 was not initialized!
[   18.613965] atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
[   18.621420] atomisp-isp2 0000:00:03.0: css load fw failed.
[   18.624687] atomisp-isp2 0000:00:03.0: Failed to init css.

