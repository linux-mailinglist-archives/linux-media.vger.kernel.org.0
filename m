Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87411A8DC5
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 23:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633947AbgDNVdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 17:33:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:41652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2633934AbgDNVdx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 17:33:53 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B356920644;
        Tue, 14 Apr 2020 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586900032;
        bh=rdmPMTavuwD05fQFm3lRuHU2A3YTNuYNBOLxSPIVcLQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U4cpVSNCZ+hsXqe8rQKFaSi81Q9nsqFd7RcpfN2sASQ9QNYh5c86xv3VFoegQ/qW2
         Ih/p+vlnb4UieF0x6RFvgTy8t9nn/eorW1WDn7OADyUJ91LR2pxJI/t+vd2guTlsTn
         HayeXTPCdijuN221rkA9edqk0BHE0A5tKbhJjTfw=
Date:   Tue, 14 Apr 2020 23:33:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: media/master bisection: v4l2-compliance-vivid.device-presence
 on qemu_x86_64
Message-ID: <20200414233347.2a844b85@coco.lan>
In-Reply-To: <24564393-f229-6e29-7883-9605ed0d48b4@collabora.com>
References: <5e960bf5.1c69fb81.8a349.6851@mx.google.com>
        <24564393-f229-6e29-7883-9605ed0d48b4@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 Apr 2020 22:23:52 +0100
Guillaume Tucker <guillaume.tucker@collabora.com> escreveu:

> Please see the bisection report below about absence of the vivid
> driver, which caused v4l2-compliance to fail to run.
> 
> Presumably we need to update the configuration fragment used by
> kernelci.org to enable platform drivers.  Until now we've been
> using this:
> 
>     CONFIG_MEDIA_SUPPORT=y
>     CONFIG_MEDIA_CAMERA_SUPPORT=y
>     CONFIG_VIDEO_DEV=y
>     CONFIG_VIDEO_V4L2=y
>     CONFIG_V4L_TEST_DRIVERS=y
>     CONFIG_VIDEO_VIVID=y
>     CONFIG_VIDEO_VIVID_MAX_DEVS=64
> 
> Do we simply need to add this one in v5.7 onwards?
> 
>     CONFIG_MEDIA_PLATFORM_SUPPORT=y

No, this shouldn't be needed.

Helen sent us a patch that should likely fix it:

	https://git.linuxtv.org/media_tree.git/commit/?id=860b511766a3d95308a942ac09a34e4d1839e706

Could you please check if this solves the issue?

Thanks,
Mauro

> 
> 
> On 14/04/2020 20:16, kernelci.org bot wrote:
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > 
> > media/master bisection: v4l2-compliance-vivid.device-presence on qemu_x86_64
> > 
> > Summary:
> >   Start:      ba445b7ff43b3 media: dt-bindings: rockchip-vpu: Convert bindings to json-schema
> >   Plain log:  https://storage.kernelci.org//media/master/v5.7-rc1-63-gba445b7ff43b/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.txt
> >   HTML log:   https://storage.kernelci.org//media/master/v5.7-rc1-63-gba445b7ff43b/x86_64/x86_64_defconfig+virtualvideo/gcc-8/lab-collabora/v4l2-compliance-vivid-qemu_x86_64.html
> >   Result:     06b93644f4d10 media: Kconfig: add an option to filter in/out platform drivers
> > 
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> > 
> > Parameters:
> >   Tree:       media
> >   URL:        https://git.linuxtv.org/media_tree.git
> >   Branch:     master
> >   Target:     qemu_x86_64
> >   CPU arch:   x86_64
> >   Lab:        lab-collabora
> >   Compiler:   gcc-8
> >   Config:     x86_64_defconfig+virtualvideo
> >   Test case:  v4l2-compliance-vivid.device-presence
> > 
> > Breaking commit found:
> > 
> > -------------------------------------------------------------------------------
> > commit 06b93644f4d102bdfc297159121acc1de794d68d
> > Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Date:   Tue Mar 24 10:27:15 2020 +0100
> > 
> >     media: Kconfig: add an option to filter in/out platform drivers
> >     
> >     Most systems don't need support for those, while others only
> >     need those, instead of the others.
> >     
> >     So, add an option to filter in/out platform drivers.
> >     
> >     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 9dfea5c4b6ab7..2b6ea8beb9199 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -87,6 +87,18 @@ config MEDIA_CEC_SUPPORT
> >  	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
> >  	  adapter that supports HDMI CEC.
> >  
> > +config MEDIA_PLATFORM_SUPPORT
> > +	bool "Platform-specific devices support"
> > +	help
> > +	  Enable support for complex cameras, codecs, and other hardware
> > +	  that are integrated at the CPU, GPU or on Image Signalling Processor
> > +	  and don't use PCI, USB or Firewire buses.
> > +
> > +	  This is found on Embedded hardware (SoC), on V4L2 codecs and
> > +	  on some GPU and newer CPU chipsets.
> > +
> > +	  Say Y when you want to be able so see such devices.
> > +
> >  source "drivers/media/cec/Kconfig"
> >  
> >  source "drivers/media/mc/Kconfig"
> > @@ -161,15 +173,14 @@ source "drivers/media/dvb-core/Kconfig"
> >  
> >  comment "Media drivers"
> >  
> > -#
> > -# V4L platform/mem2mem drivers
> > -#
> > -
> >  source "drivers/media/usb/Kconfig"
> >  source "drivers/media/pci/Kconfig"
> > +source "drivers/media/radio/Kconfig"
> > +
> > +if MEDIA_PLATFORM_SUPPORT
> >  source "drivers/media/platform/Kconfig"
> >  source "drivers/media/mmc/Kconfig"
> > -source "drivers/media/radio/Kconfig"
> > +endif
> >  
> >  comment "Supported FireWire (IEEE 1394) Adapters"
> >  	depends on DVB_CORE && FIREWIRE
> > -------------------------------------------------------------------------------
> > 
> > 
> > Git bisection log:
> > 
> > -------------------------------------------------------------------------------
> > git bisect start
> > # good: [2632e7b618a7730969f9782593c29ca53553aa22] media: venus: firmware: Ignore secure call error on first resume
> > git bisect good 2632e7b618a7730969f9782593c29ca53553aa22
> > # bad: [ba445b7ff43b3e45836a9a290efdc3a36ea63941] media: dt-bindings: rockchip-vpu: Convert bindings to json-schema
> > git bisect bad ba445b7ff43b3e45836a9a290efdc3a36ea63941
> > # good: [29d9f30d4ce6c7a38745a54a8cddface10013490] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > git bisect good 29d9f30d4ce6c7a38745a54a8cddface10013490
> > # good: [e109f506074152b7241bcbd3949a099e776cb802] Merge tag 'mtd/for-5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> > git bisect good e109f506074152b7241bcbd3949a099e776cb802
> > # good: [aa1a8ce533324d12696a9f4b71dbc5eb561a2e04] Merge tag 'trace-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace
> > git bisect good aa1a8ce533324d12696a9f4b71dbc5eb561a2e04
> > # good: [c7b6a566b98524baea6a244186e665d22b633545] mm/gup: Mark lock taken only after a successful retake
> > git bisect good c7b6a566b98524baea6a244186e665d22b633545
> > # good: [e4da01d8333e500e15a674d75885a9dfcfd31e77] Merge tag 'powerpc-5.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> > git bisect good e4da01d8333e500e15a674d75885a9dfcfd31e77
> > # good: [6900433e0fbca146d8170bdf876271cdf3053021] Merge tag 'for-linus-5.7-1' of git://github.com/cminyard/linux-ipmi
> > git bisect good 6900433e0fbca146d8170bdf876271cdf3053021
> > # good: [b753101a4ac0b906064a72feec43f5b80a1fe2e5] Merge tag 'kbuild-v5.7-2' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> > git bisect good b753101a4ac0b906064a72feec43f5b80a1fe2e5
> > # bad: [4b32216adb010a364f23a055c45e06e839b089f9] media: split test drivers from platform directory
> > git bisect bad 4b32216adb010a364f23a055c45e06e839b089f9
> > # good: [20e2aa812620439d010a3f78ba4e05bc0b3e2861] Merge tag 'perf-urgent-2020-04-12' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect good 20e2aa812620439d010a3f78ba4e05bc0b3e2861
> > # good: [0785249f8b93836986e9d1bdeefd2a2c13f160af] Merge tag 'timers-urgent-2020-04-12' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> > git bisect good 0785249f8b93836986e9d1bdeefd2a2c13f160af
> > # good: [3b50142d8528e1efc1c07f69c540f926c58ab3ad] MAINTAINERS: sort field names for all entries
> > git bisect good 3b50142d8528e1efc1c07f69c540f926c58ab3ad
> > # bad: [06b93644f4d102bdfc297159121acc1de794d68d] media: Kconfig: add an option to filter in/out platform drivers
> > git bisect bad 06b93644f4d102bdfc297159121acc1de794d68d
> > # good: [d9d6e1f3d5bbca799910072b2110963250e0b9c6] media: dvb-usb: auto-select CYPRESS_FIRMWARE
> > git bisect good d9d6e1f3d5bbca799910072b2110963250e0b9c6
> > # first bad commit: [06b93644f4d102bdfc297159121acc1de794d68d] media: Kconfig: add an option to filter in/out platform drivers
> > -------------------------------------------------------------------------------
> >   
> 



Thanks,
Mauro
