Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F498CF5E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 11:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfHNJZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 05:25:23 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:50332 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfHNJZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 05:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5GLM7RMxsKlu95OsL0kg2mBOR6Zhm7I2lVDy7A35wJ0=; b=xgt3PUpGxruDLmQsNo3O6HHL4
        v2NBK4HN3SAU7VUtgcRkutSUmeMqouex8yVULUUl1epWMxyqJzMMawALWW7qhMqQNoeUzpWfqkuJd
        Jcm37JenhMjf1DBhc5Ve0reGZsbQz3rsLZ5uSCLiRQb24Spr/QVz5fWnT3HXhWPGA/LF4S/cGI9b1
        fyfJKikmluUbw55wsLeu3Cv+mUDqtb25BWBYHjURxgaNSRbW8VGoUkGlghZEb9M6VJ6eXb/nEsX3d
        yKXYQeSJOhRU6vCXxmQDk7Z96NddegtX4ythKgGg5JzknfZk1NHs3j7D7J/7wG+ZuL9WfU51K4O+5
        qYaCWDjhA==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:44794)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hxpWt-0005aw-Mu; Wed, 14 Aug 2019 10:25:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hxpWl-0008LR-3s; Wed, 14 Aug 2019 10:25:07 +0100
Date:   Wed, 14 Aug 2019 10:25:07 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [BUG] removing and reinserting imx-media causes kernel to explode
Message-ID: <20190814092506.GH13294@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I just did this:

rmmod imx-media
modprobe imx-media

and was greeted by the below kernel messages.  I don't think this has
been the first issue I found with the iMX media stuff involving a module
unload/reload cycle - may I suggest that this is added to the testing
regime for this code?  Thanks.

imx-media: Removing imx-media
ipu1_vdic: Removing
ipu1_ic_prp: Removing
ipu1_ic_prpenc: Removing
ipu1_ic_prpvf: Removing
ipu2_vdic: Removing
ipu2_ic_prp: Removing
ipu2_ic_prpenc: Removing
ipu2_ic_prpvf: Removing
imx_media: module is from the staging directory, the quality is unknown, you have been warned.
ipu2_ic_prpvf: Registered ipu2_ic_prpvf capture as /dev/video2
imx-media: subdev ipu2_ic_prpvf bound
ipu2_ic_prpenc: Registered ipu2_ic_prpenc capture as /dev/video3
imx-media: subdev ipu2_ic_prpenc bound
imx-media: subdev ipu2_ic_prp bound
imx-media: subdev ipu2_vdic bound
ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as /dev/video4
imx-media: subdev ipu1_ic_prpvf bound
ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video5
imx-media: subdev ipu1_ic_prpenc bound
imx-media: subdev ipu1_ic_prp bound
imx-media: subdev ipu1_vdic bound
kobject (ddca68f0): tried to init an initialized object, something is seriously wrong.
CPU: 1 PID: 31521 Comm: modprobe Tainted: G         C        5.2.0+ #325
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[<c0019560>] (unwind_backtrace) from [<c0014734>] (show_stack+0x10/0x14)
[<c0014734>] (show_stack) from [<c084573c>] (dump_stack+0x9c/0xd4)
[<c084573c>] (dump_stack) from [<c084a878>] (kobject_init+0x74/0x94)
[<c084a878>] (kobject_init) from [<c04b2a70>] (device_initialize+0x1c/0xec)
[<c04b2a70>] (device_initialize) from [<c04b4ad0>] (device_register+0xc/0x18)
[<c04b4ad0>] (device_register) from [<c0599484>] (__video_register_device+0x9b4/0x1228)
[<c0599484>] (__video_register_device) from [<bf129fac>] (imx_media_capture_device_register+0x44/0x1f4 [imx_media_capture])
[<bf129fac>] (imx_media_capture_device_register [imx_media_capture]) from [<bf130bf8>] (csi_registered+0x154/0x19c [imx_media_csi])
[<bf130bf8>] (csi_registered [imx_media_csi]) from [<c05a062c>] (v4l2_device_register_subdev+0xd0/0x164)
[<c05a062c>] (v4l2_device_register_subdev) from [<c05abed0>] (v4l2_async_match_notify+0x1c/0x130)
[<c05abed0>] (v4l2_async_match_notify) from [<c05ac02c>] (v4l2_async_notifier_try_all_subdevs+0x48/0x94)
[<c05ac02c>] (v4l2_async_notifier_try_all_subdevs) from [<c05ac6f4>] (__v4l2_async_notifier_register+0xa8/0x110)
[<c05ac6f4>] (__v4l2_async_notifier_register) from [<c05ac7ec>] (v4l2_async_notifier_register+0x3c/0x54)
[<c05ac7ec>] (v4l2_async_notifier_register) from [<bf01ef64>] (imx_media_dev_notifier_register+0x2c/0x70 [imx_media])
[<bf01ef64>] (imx_media_dev_notifier_register [imx_media]) from [<bf01e090>] (imx_media_probe+0x3c/0x8c [imx_media])
[<bf01e090>] (imx_media_probe [imx_media]) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
[<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
[<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
[<c04b7554>] (driver_probe_device) from [<c04b7814>] (device_driver_attach+0x58/0x60)
[<c04b7814>] (device_driver_attach) from [<c04b78a0>] (__driver_attach+0x84/0xc0)
[<c04b78a0>] (__driver_attach) from [<c04b5968>] (bus_for_each_dev+0x58/0x7c)
[<c04b5968>] (bus_for_each_dev) from [<c04b6768>] (bus_add_driver+0xd0/0x1cc)
[<c04b6768>] (bus_add_driver) from [<c04b848c>] (driver_register+0x7c/0x110)
[<c04b848c>] (driver_register) from [<c000b05c>] (do_one_initcall+0x74/0x308)
[<c000b05c>] (do_one_initcall) from [<c00d9b78>] (do_init_module+0x5c/0x1f4)
[<c00d9b78>] (do_init_module) from [<c00d8be4>] (load_module+0x19a4/0x2020)
[<c00d8be4>] (load_module) from [<c00d9438>] (sys_finit_module+0x8c/0x98)
[<c00d9438>] (sys_finit_module) from [<c0009000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xdb677fa8 to 0xdb677ff0)
7fa0:                   00b04170 00000000 00000003 007bd84c 00000000 00b05cb8
7fc0: 00b04170 00000000 1ee84500 0000017b 00040000 00000000 00b04eb8 00000000
7fe0: be958178 be958168 007b54bb b6c28712
ipu1_csi0: Registered ipu1_csi0 capture as /dev/video6
imx-media: subdev ipu1_csi0 bound
kobject (dcd780f0): tried to init an initialized object, something is seriously wrong.
CPU: 1 PID: 31521 Comm: modprobe Tainted: G         C        5.2.0+ #325
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[<c0019560>] (unwind_backtrace) from [<c0014734>] (show_stack+0x10/0x14)
[<c0014734>] (show_stack) from [<c084573c>] (dump_stack+0x9c/0xd4)
[<c084573c>] (dump_stack) from [<c084a878>] (kobject_init+0x74/0x94)
[<c084a878>] (kobject_init) from [<c04b2a70>] (device_initialize+0x1c/0xec)
[<c04b2a70>] (device_initialize) from [<c04b4ad0>] (device_register+0xc/0x18)
[<c04b4ad0>] (device_register) from [<c0599484>] (__video_register_device+0x9b4/0x1228)
[<c0599484>] (__video_register_device) from [<bf129fac>] (imx_media_capture_device_register+0x44/0x1f4 [imx_media_capture])
[<bf129fac>] (imx_media_capture_device_register [imx_media_capture]) from [<bf130bf8>] (csi_registered+0x154/0x19c [imx_media_csi])
[<bf130bf8>] (csi_registered [imx_media_csi]) from [<c05a062c>] (v4l2_device_register_subdev+0xd0/0x164)
[<c05a062c>] (v4l2_device_register_subdev) from [<c05abed0>] (v4l2_async_match_notify+0x1c/0x130)
[<c05abed0>] (v4l2_async_match_notify) from [<c05ac02c>] (v4l2_async_notifier_try_all_subdevs+0x48/0x94)
[<c05ac02c>] (v4l2_async_notifier_try_all_subdevs) from [<c05ac6f4>] (__v4l2_async_notifier_register+0xa8/0x110)
[<c05ac6f4>] (__v4l2_async_notifier_register) from [<c05ac7ec>] (v4l2_async_notifier_register+0x3c/0x54)
[<c05ac7ec>] (v4l2_async_notifier_register) from [<bf01ef64>] (imx_media_dev_notifier_register+0x2c/0x70 [imx_media])
[<bf01ef64>] (imx_media_dev_notifier_register [imx_media]) from [<bf01e090>] (imx_media_probe+0x3c/0x8c [imx_media])
[<bf01e090>] (imx_media_probe [imx_media]) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
[<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
[<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
[<c04b7554>] (driver_probe_device) from [<c04b7814>] (device_driver_attach+0x58/0x60)
[<c04b7814>] (device_driver_attach) from [<c04b78a0>] (__driver_attach+0x84/0xc0)
[<c04b78a0>] (__driver_attach) from [<c04b5968>] (bus_for_each_dev+0x58/0x7c)
[<c04b5968>] (bus_for_each_dev) from [<c04b6768>] (bus_add_driver+0xd0/0x1cc)
[<c04b6768>] (bus_add_driver) from [<c04b848c>] (driver_register+0x7c/0x110)
[<c04b848c>] (driver_register) from [<c000b05c>] (do_one_initcall+0x74/0x308)
[<c000b05c>] (do_one_initcall) from [<c00d9b78>] (do_init_module+0x5c/0x1f4)
[<c00d9b78>] (do_init_module) from [<c00d8be4>] (load_module+0x19a4/0x2020)
[<c00d8be4>] (load_module) from [<c00d9438>] (sys_finit_module+0x8c/0x98)
[<c00d9438>] (sys_finit_module) from [<c0009000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xdb677fa8 to 0xdb677ff0)
7fa0:                   00b04170 00000000 00000003 007bd84c 00000000 00b05cb8
7fc0: 00b04170 00000000 1ee84500 0000017b 00040000 00000000 00b04eb8 00000000
7fe0: be958178 be958168 007b54bb b6c28712
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000064
pgd = db720000
[00000064] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in: imx_media(C+) caam_jr imx_media_vdic(C) imx_media_ic(C) snd_soc_imx_spdif imx_thermal imx_media_csi(C) imx_media_capture(C) snd_soc_imx_audmux imx219 snd_soc_sgtl5000 imx6_mipi_csi2(C) nvmem_imx_ocotp mux_mmio video_mux caam mux_core error imx_sdma virt_dma coda v4l2_mem2mem rc_cec snd_soc_fsl_spdif imx_vdoa videobuf2_dma_contig snd_soc_fsl_ssi imx_pcm_dma dw_hdmi_ahb_audio dw_hdmi_cec etnaviv gpu_sched v4l2_fwnode imx_media_common(C) imx6q_cpufreq rc_pinnacle_pctv_hd nfsd [last unloaded: imx_media]
CPU: 1 PID: 31521 Comm: modprobe Tainted: G         C        5.2.0+ #325
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
PC is at kobject_get+0x10/0x54
LR is at klist_node_init+0x40/0x58
pc : [<c084a61c>]    lr : [<c084a304>]    psr: 200d0013
sp : db677b20  ip : 600d0013  fp : dcd78000
r10: c08c9044  r9 : c0c97d20  r8 : 00000000
r7 : 00000000  r6 : deb34c10  r5 : deb049c0  r4 : 00000044
r3 : c04b23bc  r2 : c0c17c94  r1 : dcc04930  r0 : 00000044
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5387d  Table: 2b72004a  DAC: 00000051
Process modprobe (pid: 31521, stack limit = 0xdb676218)
Stack: (0xdb677b20 to 0xdb678000)
7b20: 00000000 dcc9f300 dcc04930 c084a304 00000000 deb049c0 dcc04930 c084a3cc
7b40: 00000000 dcd780f0 00000000 c04b47b4 3a3138f0 c13c0037 00000001 c04b2af8
7b60: c13c6208 00000007 dcd780f0 000003ac c13c6608 c0599484 c0cb7f90 60060013
7b80: 00000000 00000001 00000001 c0ab9740 00000001 00000000 1bef8335 8c000030
7ba0: 7e000f99 00000080 00000000 00000000 00000000 ddca7040 dcd78000 ddca7858
7bc0: ddca784c 00000001 00000000 ddca71a0 00000000 bf129fac bf12ad00 ddd1c96c
7be0: da51f2c0 60060013 c05975cc c0089908 00000000 00000002 ddd1c938 ddca7970
7c00: db677c18 c139a374 00000003 00000000 ddca784c c0862d4c 00000001 db677c18
7c20: 00000003 ddca7970 ddd1c840 ddca784c 00000003 00000000 ddca784c 00000003
7c40: ddca7840 ddca7858 ddca78a0 00000001 ddca784c bf130bf8 00000001 ddca7a6c
7c60: c0cb8120 00002017 bf02089c ddca784c ddd1ca60 00000000 c0c97ebc ddd1ca60
7c80: 00000030 bf02089c 00000124 c05a062c d5a1c8c0 ddca784c d5a1c8c0 ddd1cbb8
7ca0: c0c97ebc c05abed0 d5a1c8c0 ddca784c ddd1cbb8 c0c97f08 c0c97ebc c05ac02c
7cc0: ddd1cbb4 ddd1cbb8 ddd1cbc8 ddd1cbd0 00000000 c05ac6f4 ddd1cbb8 00000000
7ce0: bf02089c c13c3b8c 00000000 c05ac7ec bf020518 ddd1c840 00000000 bf01ef64
7d00: fffffffe ddd1c840 00000000 bf01e090 bf01e054 deb34c10 00000000 c04b9178
7d20: c04b9130 deb34c10 c13c3a88 00000000 c13c3b8c c04b7298 deb34c10 00000000
7d40: bf02089c 00000000 c0c1e560 00000028 deb34c10 c04b7554 deb34c10 bf02089c
7d60: 00000000 deb34c10 00000000 bf02089c 00000000 c0c1e560 00000028 dce1ac00
7d80: 00000124 c04b7814 bf02089c deb34c10 00000000 c04b78a0 deb34c10 bf02089c
7da0: c04b781c c04b5968 df0812a4 deb04a10 bf02089c c403d700 c0c84cc0 c04b6768
7dc0: bf0206bc bf02089c bf023000 bf02089c bf023000 c0cb7c20 00000000 c04b848c
7de0: c04b8d04 c0cb6bc0 bf023000 c000b05c 00000001 c0c1eca4 c0cb6daf 00000cc0
7e00: 00000040 c00d9b3c 00000008 c00aa7e8 d5a1c700 c01b2110 dddcfb80 df001e00
7e20: 00000001 00000cc0 df001e00 000ecf78 c00d8b98 bf020900 c0c1e560 bf020900
7e40: d5a1c700 bf020900 c0cb8120 bf020948 dce1ac00 c00d9b78 c0cb8120 bf020948
7e60: c0cb6ca7 c0c1e560 bf020900 c00d8be4 bf02090c 00007fff bf020900 c00d688c
7e80: bf02469e c13abc64 f0a21000 bf020b20 000000c5 db677eb4 000051b8 c01cf3a0
7ea0: 00000001 00000000 c01cf4a8 00000006 00000000 00000000 00000000 bf01f0b8
7ec0: 00000003 00000000 00000000 00000000 00000000 00000000 00000000 00000000
7ee0: 00000000 00000000 00000000 00000000 00000003 7fffffff 00000000 00000000
7f00: 00000003 007bd84c db676000 0000017b 00000000 c00d9438 7fffffff 00000000
7f20: 00000003 b6ccb000 00000000 f0a21000 000051b8 00000000 00000002 f0a2371d
7f40: f0a23a80 f0a21000 000051b8 f0a25b50 f0a23d49 f0a24b58 00002b50 00003170
7f60: 00001624 000035c8 00000000 00000000 00000000 00001614 00000027 00000028
7f80: 00000020 00000000 00000017 00000000 00b04170 00000000 1ee84500 0000017b
7fa0: c00091c4 c0009000 00b04170 00000000 00000003 007bd84c 00000000 00b05cb8
7fc0: 00b04170 00000000 1ee84500 0000017b 00040000 00000000 00b04eb8 00000000
7fe0: be958178 be958168 007b54bb b6c28712 800e0030 00000003 00000000 00000000
[<c084a61c>] (kobject_get) from [<c084a304>] (klist_node_init+0x40/0x58)
[<c084a304>] (klist_node_init) from [<c084a3cc>] (klist_add_tail+0x18/0x44)
[<c084a3cc>] (klist_add_tail) from [<c04b47b4>] (device_add+0x3dc/0x59c)
[<c04b47b4>] (device_add) from [<c0599484>] (__video_register_device+0x9b4/0x1228)
[<c0599484>] (__video_register_device) from [<bf129fac>] (imx_media_capture_device_register+0x44/0x1f4 [imx_media_capture])
[<bf129fac>] (imx_media_capture_device_register [imx_media_capture]) from [<bf130bf8>] (csi_registered+0x154/0x19c [imx_media_csi])
[<bf130bf8>] (csi_registered [imx_media_csi]) from [<c05a062c>] (v4l2_device_register_subdev+0xd0/0x164)
[<c05a062c>] (v4l2_device_register_subdev) from [<c05abed0>] (v4l2_async_match_notify+0x1c/0x130)
[<c05abed0>] (v4l2_async_match_notify) from [<c05ac02c>] (v4l2_async_notifier_try_all_subdevs+0x48/0x94)
[<c05ac02c>] (v4l2_async_notifier_try_all_subdevs) from [<c05ac6f4>] (__v4l2_async_notifier_register+0xa8/0x110)
[<c05ac6f4>] (__v4l2_async_notifier_register) from [<c05ac7ec>] (v4l2_async_notifier_register+0x3c/0x54)
[<c05ac7ec>] (v4l2_async_notifier_register) from [<bf01ef64>] (imx_media_dev_notifier_register+0x2c/0x70 [imx_media])
[<bf01ef64>] (imx_media_dev_notifier_register [imx_media]) from [<bf01e090>] (imx_media_probe+0x3c/0x8c [imx_media])
[<bf01e090>] (imx_media_probe [imx_media]) from [<c04b9178>] (platform_drv_probe+0x48/0x98)
[<c04b9178>] (platform_drv_probe) from [<c04b7298>] (really_probe+0x1d8/0x2c0)
[<c04b7298>] (really_probe) from [<c04b7554>] (driver_probe_device+0x5c/0x174)
[<c04b7554>] (driver_probe_device) from [<c04b7814>] (device_driver_attach+0x58/0x60)
[<c04b7814>] (device_driver_attach) from [<c04b78a0>] (__driver_attach+0x84/0xc0)
[<c04b78a0>] (__driver_attach) from [<c04b5968>] (bus_for_each_dev+0x58/0x7c)
[<c04b5968>] (bus_for_each_dev) from [<c04b6768>] (bus_add_driver+0xd0/0x1cc)
[<c04b6768>] (bus_add_driver) from [<c04b848c>] (driver_register+0x7c/0x110)
[<c04b848c>] (driver_register) from [<c000b05c>] (do_one_initcall+0x74/0x308)
[<c000b05c>] (do_one_initcall) from [<c00d9b78>] (do_init_module+0x5c/0x1f4)
[<c00d9b78>] (do_init_module) from [<c00d8be4>] (load_module+0x19a4/0x2020)
[<c00d8be4>] (load_module) from [<c00d9438>] (sys_finit_module+0x8c/0x98)
[<c00d9438>] (sys_finit_module) from [<c0009000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xdb677fa8 to 0xdb677ff0)
7fa0:                   00b04170 00000000 00000003 007bd84c 00000000 00b05cb8
7fc0: 00b04170 00000000 1ee84500 0000017b 00040000 00000000 00b04eb8 00000000
7fe0: be958178 be958168 007b54bb b6c28712
Code: e92d4010 e2504000 e24dd008 0a000004 (e5d43020) 
---[ end trace c0709acc637cb5de ]---

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
