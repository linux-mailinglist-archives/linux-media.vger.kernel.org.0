Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83ED1D49C6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 11:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgEOJhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 05:37:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgEOJhl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 05:37:41 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B9B6206B6;
        Fri, 15 May 2020 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589535460;
        bh=R5Xg/gWlLa5I+e3o28d5sZscgh9aWZfQqY79LRKeWn0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Yp2gLzXfimIcA+tbcza1PBEsYv3ZPXXjfGWvDAvRSbU8qGDeUy2/D1/zKIzRaNo48
         68/TzcxFlvWeAxpGojlI3QhDYE8ingmT1dOdD6BUIGVFXfnfz/YLA7aStrPoyPOgil
         Dhr7fdxWrV03pcqB4+lSuQQPsPxMK9Xrh9XqgxAc=
Date:   Fri, 15 May 2020 11:37:36 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-media@vger.kernel.org
Subject: Ressurect the atomisp staging driver - current progress
Message-ID: <20200515113736.6af67e0a@coco.lan>
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

Hi,

I've been trying to ressurrect the driver for the Atom camera hardware,
for systems based on ISP2401, e. g. the ones with this ISP:

	00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev ff) (prog-if ff)
		!!! Unknown header type 7f
		Kernel modules: atomisp_css2401a0_v21

	00:0a.0 Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
		Subsystem: ASUSTeK Computer Inc. Device 13a0
		Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
		Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
		Latency: 0, Cache Line Size: 64 bytes
		Interrupt: pin A routed to IRQ 20
		Region 0: Memory at 91a3a000 (32-bit, non-prefetchable) [size=4K]
		Capabilities: <access denied>
		Kernel driver in use: intel_ish_ipc
		Kernel modules: intel_ish_ipc

Right now, the patches are on this branch:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2.1

This is based on a previous attempt of upstreaming it to staging,
started by Alan Cox. This was removed back in 2018. I fixed it
to work with Kernel 5.7 and solved several issues that were preventing
it from powering the cameras. This version should support earlier
versions (ISP2400-based), by selecting an option compile-time.

The initial goal is to have a working version. One of the problems with
this device is that firmware and drivers are very closely linked. 
As I was unable to find the versions used on Alan's port, I also 
made an alternate version, using a driver from the Yocto Aero tree
ported to Kernel 5.7-rc2, re-using the work we've done so far at the
original port for it to work with the current Kernel kAPI.

For such second version, I used the Kernel sources found on this
repository:

	https://download.01.org/aero/deb/pool/main/l/linux-4.4.76-aero-1.3/

Such port is at the atomisp_yocto_v1:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_yocto_v1

(there's a variant of it at https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp-with-yocto-patchset,
 with would preserve the history of atomisp changes from Yocto's tree)

The firmware used on such version is at:
	https://download.01.org/aero/deb/pool/main/f/firmware-atomisp/firmware-atomisp_0.1.orig.tar.xz

If the ISP revision is equal or bigger than rev 02, this file should be
renamed to:

	shisp_2401b0_v21.bin

The goal of the alternate fork is just to use a driver code base that
it is known to work in the past and has a firmware that it is still
available. It should be noticed that the alternate version is for
ISP2401 only (PCI ID 8086:22d8). It would probe on other versions, but
it probably won't work.

As I don't have the Intel Aero controller card (nor the camera, with 
comes with the drone hardware), I'm doing my tests on an Asus T101HA.

Before getting excited, both versions failed at the tests I've been
doing so far.

The camera sensor detection is working fine and it is able to power
the camera off/on (when driver loads, it makes the camera usage led
indicator to quickly flash):

	ov2680 i2c-OVTI2680:00: ov2680_probe: ACPI detected it on bus ID=CAM1, HID=OVTI2680
	ov2680 i2c-OVTI2680:00: gmin: power management provided via Dollar Cove TI PMIC (i2c addr 0x5e)
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CamClk'
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_ClkSrc'
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiPort'
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'OVTI2680:00_CsiLanes'
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V1P8GPIO'
	ov2680 i2c-OVTI2680:00: Found DMI entry for 'gmin_V2P8GPIO'
	ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
	ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
	ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1

However, the ISP code still have issues that seem to be firmware-related.

At the first version, testing with either the original firmware from 
Windows or the version from Intel Aero causes a warning when the
devnode is opened:

	atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIEWFINDER output
	sh_css_hrt_system_is_idle() 44: warning: SP not idle
	sh_css_hrt_system_is_idle() 49: warning: ISP not idle
	atomisp-isp2 0000:00:03.0: open device ATOMISP ISP VIDEO output
	sh_css_hrt_system_is_idle() 56: warning: FIFO channel 12 is not empty
	sh_css_hrt_system_is_idle() 56: warning: FIFO channel 26 is not empty
	atomisp-isp2 0000:00:03.0: css init failed --- bad firmware?
	atomisp-isp2 0000:00:03.0: atomisp_mrfld_pre_power_down: error in iunit interrupt. status reg=0xffffffff

It sounds that the firmware was properly loaded there, but somehow,
it is not answering as expected.

The second version produces this error:

	atomisp: Loaded firmware version 'irci_stable_candrpv_0415_20150521_0458'.
	atomisp-isp2 0000:00:03.0: css load fw failed.
	atomisp-isp2 0000:00:03.0: Failed to init css.

I didn't try to check why it is failing yet - maybe it is just
something related to the port itself.

If someone has access to the Intel Aero board, I'd appreciate if you
could test it and send the results. If it fails too, it would be
nice to have the dmesg output of this version and the dmesg from
a version which works.

It would also be good to have a second pair of eyes on it.

Thanks,
Mauro
