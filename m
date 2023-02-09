Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B55D691325
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 23:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbjBIWT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 17:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBIWTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 17:19:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA6B12F14
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 14:19:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DEB79CA;
        Thu,  9 Feb 2023 23:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675981188;
        bh=BLgeoM3Xv+Lt4kpPdSwG9oyM3URIQk8KGqjV2lINuUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QN1+eWANOCVAhMX1szARnL9RgzrMrOo0mPtpJAbJR7ANAxeju9XcKneSVOPJ9AZwQ
         oR/SmzzA3crSBrU+Eh8ynuqQJ1PDwVs6cqeopAYFQ87Xsa0WHqeMDOabYp8cqoZ/wU
         2ecpX6WuiJ7g1uDbWahJMisjV2AruVTg0jANxO4g=
Date:   Fri, 10 Feb 2023 00:19:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Message-ID: <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com>
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
 <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com>
 <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 07, 2023 at 04:24:45PM +0100, Frieder Schrempf wrote:
> On 06.02.23 16:50, Laurent Pinchart wrote:
> > On Mon, Feb 06, 2023 at 04:38:27PM +0100, Frieder Schrempf wrote:
> >> On 06.02.23 16:31, Laurent Pinchart wrote:
> >>> On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
> >>>> Hi,
> >>>>
> >>>> I'm trying to get a camera stream on our i.MX8MM board up and running
> >>>> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
> >>>>
> >>>> I basically copied the devicetree setup from Tim's overlay at
> >>>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
> >>>>
> >>>> With all the drivers enabled the devices (imx219, imx7-media-csi,
> >>>> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
> >>>> /dev/media0.
> >>>>
> >>>> For the v4l subdevices I would expect to see one for the sensor and one
> >>>> for the CSI bridge. But only the latter is there (see below).
> >>>>
> >>>> Is this correct? Am I missing something? How can I setup/enable the
> >>>> pipeline/stream?
> >>>
> >>> Your expectations are correct, but the result isn't. You should see the
> >>> camera sensor in the media graph. Has the imx219 been probed by the
> >>> driver ? Did probe succeed ?
> >>
> >> Yes, the imx219_probe() works just fine and returns with code 0. I also
> >> see v4l2_async_register_subdev_sensor() and the underlying code being
> >> called.
> >>
> >> So I really don't understand why I'm missing the sensor subdev. Any
> >> ideas how to continue debugging?
> > 
> > The issue seems to be with v4l2-async then. There's a debugfs file that
> > lists the missing v4l2-async subdevs (I don't recall the path by heard),
> > that can give useful information. Enabling the debug messages from
> > v4l2-async.c may helpt too.
> 
> +Cc: Dave, Sakari, Javier (thanks for your help and debugging hints via
> mail/IRC)
> 
> /sys/kernel/debug/v4l2-async/pending_async_subdevices gives me:
> 
> csis-32e30000.mipi-csi:
>  [fwnode] dev=1-0010, node=/soc@0/bus@30800000/i2c@30a30000/sensor@10/port/endpoint
> imx219 1-0010:
> imx-media:
> 
> So it looks like the async subdev for the imx219 sensor is still pending.

Indeed, that seems to be the problem.

> I have spent quite a few hours trying to understand how the code is
> supposed to work, but I'm afraid it's too much for my brain at the moment ;)
> 
> I have attached a debug patch [1] adding printks in v4l2-async.c and the
> boot log [2] with all the output below. Hopefully someone can have a
> look and make something out of that. Feel free to let me know via email
> or IRC if I can provide any further information.

To be honest your debug messages are quite cryptic. They may be readable
when tracing the code on a live system, but offline, that's a different
story.

More comments below.

> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.2.0-rc7-ktn (oe-user@oe-host) (aarch64-ktn-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP PREEMPT Tue Feb  7 08:25:13 UTC 2023
> [    0.000000] Machine model: Kontron BL i.MX8MM (N801X S)
> [    0.000000] efi: UEFI not found.
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x13f7c2b00-0x13f7c4fff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
> [    0.000000] cma: Reserved 1024 MiB at 0x00000000bbe00000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [    0.000000] psci: SMC Calling Convention v1.2
> [    0.000000] percpu: Embedded 20 pages/cpu s42024 r8192 d31704 u81920
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] alternatives: applying boot alternatives
> [    0.000000] Fallback order for Node 0: 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1032192
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line: root=/dev/nfs ip=192.168.1.11:192.168.1.10:::kontron-mx8mm:eth0:any nfsroot=192.168.1.10:/nfsroot,v3,tcp cma=1G rootwait
> [    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] software IO TLB: area num 4.
> [    0.000000] software IO TLB: mapped [mem 0x00000000fbfff000-0x00000000fffff000] (64MB)
> [    0.000000] Memory: 2976216K/4194304K available (13568K kernel code, 1222K rwdata, 4840K rodata, 2368K init, 545K bss, 169512K reserved, 1048576K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU event tracing is enabled.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> [    0.000000] GICv3: 128 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] GICv3: GICv3 features: 16 PPIs
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000038880000
> [    0.000000] ITS: No ITS available, not enabling LPIs
> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (phys).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
> [    0.000000] sched_clock: 56 bits at 8MHz, resolution 125ns, wraps every 2199023255500ns
> [    0.000353] Console: colour dummy device 80x25
> [    0.000363] printk: console [tty0] enabled
> [    0.000858] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.00 BogoMIPS (lpj=32000)
> [    0.000881] pid_max: default: 32768 minimum: 301
> [    0.000940] LSM: initializing lsm=capability,integrity
> [    0.001043] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.001072] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.002504] rcu: Hierarchical SRCU implementation.
> [    0.002526] rcu: 	Max phase no-delay instances is 1000.
> [    0.003357] EFI services will not be available.
> [    0.003583] smp: Bringing up secondary CPUs ...
> [    0.004061] Detected VIPT I-cache on CPU1
> [    0.004136] GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
> [    0.004178] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.004649] Detected VIPT I-cache on CPU2
> [    0.004712] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
> [    0.004736] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> [    0.005177] Detected VIPT I-cache on CPU3
> [    0.005238] GICv3: CPU3: found redistributor 3 region 0:0x00000000388e0000
> [    0.005259] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
> [    0.005316] smp: Brought up 1 node, 4 CPUs
> [    0.005403] SMP: Total of 4 processors activated.
> [    0.005414] CPU features: detected: 32-bit EL0 Support
> [    0.005424] CPU features: detected: 32-bit EL1 Support
> [    0.005440] CPU features: detected: CRC32 instructions
> [    0.005506] CPU: All CPU(s) started at EL2
> [    0.005524] alternatives: applying system-wide alternatives
> [    0.007432] devtmpfs: initialized
> [    0.013542] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.013594] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> [    0.043563] pinctrl core: initialized pinctrl subsystem
> [    0.045549] DMI not present or invalid.
> [    0.046159] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.047073] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
> [    0.047276] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.047441] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.047501] audit: initializing netlink subsys (disabled)
> [    0.047623] audit: type=2000 audit(0.044:1): state=initialized audit_enabled=0 res=1
> [    0.048000] thermal_sys: Registered thermal governor 'step_wise'
> [    0.048033] cpuidle: using governor menu
> [    0.048199] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.048287] ASID allocator initialised with 65536 entries
> [    0.048955] Serial: AMBA PL011 UART driver
> [    0.055254] imx8mm-pinctrl 30330000.pinctrl: initialized IMX pinctrl driver
> [    0.066886] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.066917] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.066932] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.066944] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
> [    0.066958] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.066972] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.066987] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.067000] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
> [    0.068588] ACPI: Interpreter disabled.
> [    0.069385] iommu: Default domain type: Translated
> [    0.069405] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.069649] SCSI subsystem initialized
> [    0.069932] usbcore: registered new interface driver usbfs
> [    0.069969] usbcore: registered new interface driver hub
> [    0.070007] usbcore: registered new device driver usb
> [    0.070643] mc: Linux media interface: v0.10
> [    0.070690] videodev: Linux video capture interface: v2.00
> [    0.070754] pps_core: LinuxPPS API ver. 1 registered
> [    0.070765] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.070791] PTP clock support registered
> [    0.070920] EDAC MC: Ver: 3.0.0
> [    0.071496] FPGA manager framework
> [    0.071573] Advanced Linux Sound Architecture Driver Initialized.
> [    0.072353] vgaarb: loaded
> [    0.072652] clocksource: Switched to clocksource arch_sys_counter
> [    0.072831] VFS: Disk quotas dquot_6.6.0
> [    0.072867] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.073038] pnp: PnP ACPI: disabled
> [    0.079203] NET: Registered PF_INET protocol family
> [    0.079432] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    0.082247] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
> [    0.082335] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.082361] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    0.082592] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, linear)
> [    0.083553] TCP: Hash tables configured (established 32768 bind 32768)
> [    0.083705] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
> [    0.083806] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
> [    0.084021] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.084433] RPC: Registered named UNIX socket transport module.
> [    0.084451] RPC: Registered udp transport module.
> [    0.084462] RPC: Registered tcp transport module.
> [    0.084474] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.084493] PCI: CLS 0 bytes, default 64
> [    0.085132] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
> [    0.085846] kvm [1]: IPA Size Limit: 40 bits
> [    0.087132] kvm [1]: GICv3: no GICV resource entry
> [    0.087146] kvm [1]: disabling GICv2 emulation
> [    0.087164] kvm [1]: GIC system register CPU interface enabled
> [    0.087258] kvm [1]: vgic interrupt IRQ9
> [    0.087360] kvm [1]: Hyp mode initialized successfully
> [    0.088486] Initialise system trusted keyrings
> [    0.088687] workingset: timestamp_bits=42 max_order=20 bucket_order=0
> [    0.088988] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.089207] NFS: Registering the id_resolver key type
> [    0.089262] Key type id_resolver registered
> [    0.089274] Key type id_legacy registered
> [    0.089303] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [    0.089317] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [    0.089466] 9p: Installing v9fs 9p2000 file system support
> [    0.124669] Key type asymmetric registered
> [    0.124683] Asymmetric key parser 'x509' registered
> [    0.124735] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
> [    0.124753] io scheduler mq-deadline registered
> [    0.124764] io scheduler kyber registered
> [    0.128006] EINJ: ACPI disabled.
> [    0.136799] SoC: i.MX8MM revision 1.0
> [    0.141870] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.143967] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq = 16, base_baud = 1500000) is a IMX
> [    0.144488] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq = 17, base_baud = 1500000) is a IMX
> [    0.144522] imx-uart 30880000.serial: Console IMX rounded baud rate from 114286 to 114300
> [    0.144571] printk: console [ttymxc2] enabled
> [    1.126108] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq = 18, base_baud = 1500000) is a IMX
> [    1.144256] loop: module loaded
> [    1.150889] tun: Universal TUN/TAP device driver, 1.6
> [    1.156153] CAN device driver interface
> [    1.160606] thunder_xcv, ver 1.0
> [    1.163879] thunder_bgx, ver 1.0
> [    1.167145] nicpf, ver 1.0
> [    1.170627] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
> [    1.177871] hns3: Copyright (c) 2017 Huawei Corporation.
> [    1.183231] hclge is initializing
> [    1.186586] e1000e: Intel(R) PRO/1000 Network Driver
> [    1.191565] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    1.197519] igb: Intel(R) Gigabit Ethernet Network Driver
> [    1.202932] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    1.208538] igbvf: Intel(R) Gigabit Virtual Function Network Driver
> [    1.214821] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> [    1.220881] sky2: driver version 1.30
> [    1.225044] VFIO - User Level meta-driver version: 0.3
> [    1.231934] usbcore: registered new interface driver usb-storage
> [    1.240846] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc0
> [    1.247080] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system clock to 1970-01-01T00:00:00 UTC (0)
> [    1.256271] i2c_dev: i2c /dev entries driver
> [    1.261317] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0
> [    1.268186] __v4l2_async_nf_register:610
> [    1.272130]   imx-media:
> [    1.274676] v4l2_async_nf_try_all_subdevs:447
> [    1.279048]   imx-media:
> [    1.281593] v4l2_async_nf_try_all_subdevs:454
> [    1.285965] imx7_csi_notify_complete:2178

This doesn't seem right. The complete function should only be called
once all the subdevices required by the notifier have been found, and at
this point, the csis hasn't even probed. You may want to check the
device tree.

> [    1.291153] i.mx8mm_thermal 30260000.tmu: No OCOTP nvmem reference found, SoC-specific calibration not loaded. Please update your DT.
> [    1.303945] ghes_edac: GHES probing device list is empty
> [    1.304979] sdhci: Secure Digital Host Controller Interface driver
> [    1.316524] sdhci: Copyright(c) Pierre Ossman
> [    1.321082] Synopsys Designware Multimedia Card Interface Driver
> [    1.327600] sdhci-pltfm: SDHCI platform and OF driver helper
> [    1.334945] ledtrig-cpu: registered to indicate activity on CPUs
> [    1.341184] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
> [    1.348164] caam 30900000.crypto: device ID = 0x0a16040100000000 (Era 9)
> [    1.354896] caam 30900000.crypto: job rings = 2, qi = 0
> [    1.362676] caam algorithms registered in /proc/crypto
> [    1.368007] caam 30900000.crypto: caam pkc algorithms registered in /proc/crypto
> [    1.375430] caam 30900000.crypto: registering rng-caam
> [    1.382285] caam 30900000.crypto: rng crypto API alg registered prng-caam
> [    1.390544] usbcore: registered new interface driver usbhid
> [    1.396148] usbhid: USB HID core driver
> [    1.404433] NET: Registered PF_PACKET protocol family
> [    1.409533] can: controller area network core
> [    1.413943] NET: Registered PF_CAN protocol family
> [    1.418750] can: raw protocol
> [    1.421735] can: broadcast manager protocol
> [    1.425933] can: netlink gateway - max_hops=1
> [    1.430383] 9pnet: Installing 9P2000 support
> [    1.434710] Key type dns_resolver registered
> [    1.448009] Loading compiled-in X.509 certificates
> [    1.471560] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.481811] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.492337] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.501638] random: crng init done
> [    1.502850] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.515529] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> [    1.526485] usb_phy_generic usbphynop1: dummy supplies not allowed for exclusive requests
> [    1.534906] usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests
> [    1.563552] nxp-pca9450 0-0025: pca9450a probed.
> [    1.568286] i2c i2c-0: IMX I2C adapter registered
> [    1.574158] i2c 1-0010: Fixing up cyclic dependency with 32e30000.mipi-csi
> [    1.581331] imx219 1-0010: supply VANA not found, using dummy regulator
> [    1.588140] imx219 1-0010: supply VDDL not found, using dummy regulator
> [    1.604714] v4l2_async_register_subdev_sensor:1296
> [    1.609531] v4l2_async_register_subdev_sensor:1311
> [    1.614336] __v4l2_async_nf_register:610
> [    1.618273]   imx219 1-0010:
> [    1.621166] v4l2_async_nf_try_all_subdevs:447
> [    1.625534]   imx219 1-0010:
> [    1.628423]   imx-media:
> [    1.630968] v4l2_async_register_subdev_sensor:1317
> [    1.635773] v4l2_async_register_subdev:858
> [    1.639880]   imx219 1-0010:
> [    1.642771]   imx-media:
> [    1.645317] v4l2_async_register_subdev:866
> [    1.649426]   imx219 1-0010:
> [    1.652309] v4l2_async_register_subdev:866
> [    1.656422]   imx-media:
> [    1.658964] v4l2_async_register_subdev:872
> [    1.663075] v4l2_async_find_match:231
> [    1.666749] v4l2_async_register_subdev_sensor:1323
> [    1.671693] i2c i2c-1: IMX I2C adapter registered
> [    1.678216] rtc-rv8803 3-0032: An alarm maybe have been missed.
> [    1.689415] rtc-rv8803 3-0032: registered as rtc1
> [    1.694258] i2c i2c-3: IMX I2C adapter registered
> [    1.701296] imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> [    1.708603] imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff -> 0x0000000000
> [    1.710257] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)
> [    1.716820] imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff -> 0x0018000000
> [    1.723602] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)
> [    1.736530] etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
> [    1.742802] etnaviv-gpu 38000000.gpu: Need to move linear window on MC1.0, disabling TS
> [    1.750837] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
> [    1.758304] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on minor 0
> [    1.768636] pps pps0: new PPS source ptp0
> [    1.839197] fec 30be0000.ethernet eth0: registered PHC device 0
> [    1.945171] imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K, limit 4G
> [    1.960957] ci_hdrc ci_hdrc.1: EHCI Host Controller
> [    1.965895] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
> [    1.989045] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
> [    1.995595] hub 1-0:1.0: USB hub found
> [    1.999385] hub 1-0:1.0: 1 port detected
> [    2.005195] pwm-beeper pwm-beeper: supply amp not found, using dummy regulator
> [    2.012684] input: pwm-beeper as /devices/platform/pwm-beeper/input/input0
> [    2.021068] __v4l2_async_nf_register:610
> [    2.025028]   csis-32e30000.mipi-csi:
> [    2.028714] __v4l2_async_nf_register:619
> [    2.032653]  [fwnode] dev=1-0010, node=/soc@0/bus@30800000/i2c@30a30000/sensor@10/port/endpoint
> [    2.041386] __v4l2_async_nf_register:625
> [    2.045323] v4l2_async_nf_try_all_subdevs:447
> [    2.049694]   csis-32e30000.mipi-csi:
> [    2.053375]   imx219 1-0010:
> [    2.053677] imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> [    2.056256]   imx-media:
> [    2.056259] v4l2_async_register_subdev:858
> [    2.068481]   csis-32e30000.mipi-csi:
> [    2.072157]  [fwnode] dev=1-0010, node=/soc@0/bus@30800000/i2c@30a30000/sensor@10/port/endpoint
> [    2.080888]   imx219 1-0010:
> [    2.083772]   imx-media:
> [    2.086319] v4l2_async_register_subdev:866
> [    2.090426]   csis-32e30000.mipi-csi:
> [    2.094099] v4l2_async_register_subdev:866
> [    2.098210]   imx219 1-0010:
> [    2.101103] v4l2_async_register_subdev:866
> [    2.105211]   imx-media:
> [    2.107752] v4l2_async_register_subdev:872
> [    2.111860] v4l2_async_find_match:231
> [    2.115586] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 333000000
> [    2.122481] imx-cpufreq-dt imx-cpufreq-dt: cpu speed grade 2 mkt segment 2 supported-hw 0x4 0x4
> [    2.135942] sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO
> [    2.156722] imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> [    2.161522] mmc0: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA
> [    2.162324] imx6q-pcie 33800000.pcie: Link up, Gen2
> [    2.173599] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
> [    2.174245] imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> [    2.187152] imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> [    2.193541] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.199042] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
> [    2.205236] pci_bus 0000:00: root bus resource [mem 0x18000000-0x1fefffff]
> [    2.212149] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
> [    2.218177] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
> [    2.224462] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]
> [    2.228210] mmc1: host does not support reading read-only switch, assuming write-enable
> [    2.231208] pci 0000:00:00.0: supports D1
> [    2.243214] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    2.251105] pci 0000:01:00.0: [1d79:2263] type 00 class 0x010802
> [    2.257216] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
> [    2.262659] mmc0: new HS400 Enhanced strobe MMC card at address 0001
> [    2.264520] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 15.752 Gb/s with 8.0 GT/s PCIe x2 link)
> [    2.264662] usb 1-1: new high-speed USB device number 2 using ci_hdrc
> [    2.271786] mmcblk0: mmc0:0001 032GB2 29.1 GiB
> [    2.285638] pci 0000:00:00.0: BAR 0: assigned [mem 0x18000000-0x180fffff]
> [    2.295739] mmcblk0boot0: mmc0:0001 032GB2 4.00 MiB
> [    2.296312] pci 0000:00:00.0: BAR 14: assigned [mem 0x18100000-0x181fffff]
> [    2.304956] mmcblk0boot1: mmc0:0001 032GB2 4.00 MiB
> [    2.308058] pci 0000:00:00.0: BAR 6: assigned [mem 0x18200000-0x1820ffff pref]
> [    2.316622] mmcblk0rpmb: mmc0:0001 032GB2 4.00 MiB, chardev (241:0)
> [    2.319904] pci 0000:01:00.0: BAR 0: assigned [mem 0x18100000-0x18103fff 64bit]
> [    2.340843] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    2.346091] pci 0000:00:00.0:   bridge window [mem 0x18100000-0x181fffff]
> [    2.350724] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
> [    2.353190] pcieport 0000:00:00.0: PME: Signaling with IRQ 215
> [    2.360527] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
> [    2.375373]  mmcblk1: p1 p2
> [    2.428063] hub 1-1:1.0: USB hub found
> [    2.432315] hub 1-1:1.0: 5 ports detected
> [    2.512067] Microsemi VSC8531 30be0000.ethernet-1:00: attached PHY driver (mii_bus:phy_addr=30be0000.ethernet-1:00, irq=POLL)
> [    2.729028] usb 1-1.1: new high-speed USB device number 3 using ci_hdrc
> [    5.602118] fec 30be0000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> [    5.625029] IP-Config: Guessing netmask 255.255.255.0
> [    5.630108] IP-Config: Complete:
> [    5.633354]      device=eth0, hwaddr=70:82:0e:13:9a:32, ipaddr=192.168.1.11, mask=255.255.255.0, gw=255.255.255.255
> [    5.643814]      host=kontron-mx8mm, domain=, nis-domain=(none)
> [    5.649751]      bootserver=192.168.1.10, rootserver=192.168.1.10, rootpath=
> [    5.651593] ALSA device list:
> [    5.661655]   No soundcards found.
> [    5.688286] VFS: Mounted root (nfs filesystem) readonly on device 0:20.
> [    5.696353] devtmpfs: mounted
> [    5.699869] Freeing unused kernel memory: 2368K
> [    5.708679] Run /sbin/init as init process

> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 905072871ed2..eb35657bb7a2 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1275,6 +1275,8 @@ static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
>  	struct mipi_csis_device *csis = mipi_notifier_to_csis_state(notifier);
>  	struct media_pad *sink = &csis->sd.entity.pads[CSIS_PAD_SINK];
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	return v4l2_create_fwnode_links_to_pad(sd, sink, 0);
>  }
>  
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 886374d3a6ff..6fc7bafdd436 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2165,6 +2165,8 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
>  
>  	csi->src_sd = sd;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>  					       MEDIA_LNK_FL_IMMUTABLE);
>  }
> @@ -2173,6 +2175,8 @@ static int imx7_csi_notify_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	return v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  }
>  
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 2f1b718a9189..820abb5ce77c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -86,6 +86,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	bool sd_fwnode_is_ep;
>  	struct device *dev;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * Both the subdev and the async subdev can provide either an endpoint
>  	 * fwnode or a device fwnode. Start with the simple case of direct
> @@ -94,6 +96,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	if (sd_fwnode == asd->match.fwnode)
>  		return true;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>  	 * endpoint or a device. If they're of the same type, there's no match.
> @@ -108,6 +112,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
>  		return false;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * The sd and asd fwnodes are of different types. Get the device fwnode
>  	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> @@ -125,6 +131,8 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
>  	if (dev_fwnode != other_fwnode)
>  		return false;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * We have a heterogeneous match. Retrieve the struct device of the side
>  	 * that matched on a device fwnode to print its driver name.
> @@ -163,6 +171,55 @@ static LIST_HEAD(subdev_list);
>  static LIST_HEAD(notifier_list);
>  static DEFINE_MUTEX(list_lock);
>  
> +static const char *
> +v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
> +{
> +	if (notifier->v4l2_dev)
> +		return notifier->v4l2_dev->name;
> +	else if (notifier->sd)
> +		return notifier->sd->name;
> +	else
> +		return "nil";
> +}
> +
> +static void print_subdev(struct v4l2_async_subdev *asd)
> +{
> +	switch (asd->match_type) {
> +	case V4L2_ASYNC_MATCH_I2C:
> +		printk(" [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> +			   asd->match.i2c.address);
> +		break;
> +	case V4L2_ASYNC_MATCH_FWNODE: {
> +		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
> +
> +		devnode = fwnode_graph_is_endpoint(fwnode) ?
> +			  fwnode_graph_get_port_parent(fwnode) :
> +			  fwnode_handle_get(fwnode);
> +
> +		printk(" [fwnode] dev=%s, node=%pfw\n",
> +			   devnode->dev ? dev_name(devnode->dev) : "nil",
> +			   fwnode);
> +
> +		fwnode_handle_put(devnode);
> +		break;
> +	}
> +	}
> +}
> +
> +static int print_notifiers_subdevs(void)
> +{
> +	struct v4l2_async_notifier *notif;
> +	struct v4l2_async_subdev *asd;
> +
> +	list_for_each_entry(notif, &notifier_list, list) {
> +		printk("  %s:\n", v4l2_async_nf_name(notif));
> +		list_for_each_entry(asd, &notif->waiting, list)
> +			print_subdev(asd);
> +	}
> +
> +	return 0;
> +}
> +
>  static struct v4l2_async_subdev *
>  v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd)
> @@ -171,7 +228,11 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
>  	struct v4l2_async_subdev *asd;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	list_for_each_entry(asd, &notifier->waiting, list) {
> +		printk("%s:%d\n", __func__, __LINE__);
> +		print_subdev(asd);
>  		/* bus_type has been verified valid before */
>  		switch (asd->match_type) {
>  		case V4L2_ASYNC_MATCH_I2C:
> @@ -317,16 +378,22 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  	struct v4l2_async_notifier *subdev_notifier;
>  	int ret;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	ret = v4l2_device_register_subdev(v4l2_dev, sd);
>  	if (ret < 0)
>  		return ret;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	ret = v4l2_async_nf_call_bound(notifier, sd, asd);
>  	if (ret < 0) {
>  		v4l2_device_unregister_subdev(sd);
>  		return ret;
>  	}
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * Depending of the function of the entities involved, we may want to
>  	 * create links between them (for example between a sensor and its lens
> @@ -340,6 +407,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/* Remove from the waiting list */
>  	list_del(&asd->list);
>  	sd->asd = asd;
> @@ -355,6 +424,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
>  	if (!subdev_notifier || subdev_notifier->parent)
>  		return 0;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	/*
>  	 * Proceed with checking for the sub-device notifier's async
>  	 * sub-devices, and return the result. The error will be handled by the
> @@ -373,18 +444,29 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier)
>  		v4l2_async_nf_find_v4l2_dev(notifier);
>  	struct v4l2_subdev *sd;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +	printk("  %s:\n", v4l2_async_nf_name(notifier));
> +	print_notifiers_subdevs();
> +
>  	if (!v4l2_dev)
>  		return 0;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  again:
>  	list_for_each_entry(sd, &subdev_list, async_list) {
>  		struct v4l2_async_subdev *asd;
>  		int ret;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
> +
>  		asd = v4l2_async_find_match(notifier, sd);
>  		if (!asd)
>  			continue;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
> +		print_subdev(asd);
> +
>  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
>  		if (ret < 0)
>  			return ret;
> @@ -525,16 +607,22 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	struct v4l2_async_subdev *asd;
>  	int ret, i = 0;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +	printk("  %s:\n", v4l2_async_nf_name(notifier));
> +
>  	INIT_LIST_HEAD(&notifier->waiting);
>  	INIT_LIST_HEAD(&notifier->done);
>  
>  	mutex_lock(&list_lock);
>  
>  	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
> +		printk("%s:%d\n", __func__, __LINE__);
> +		print_subdev(asd);
>  		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
>  		if (ret)
>  			goto err_unlock;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
>  		list_add_tail(&asd->list, &notifier->waiting);
>  	}
>  
> @@ -767,18 +855,29 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  
>  	INIT_LIST_HEAD(&sd->async_list);
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +	print_notifiers_subdevs();
> +
>  	list_for_each_entry(notifier, &notifier_list, list) {
>  		struct v4l2_device *v4l2_dev =
>  			v4l2_async_nf_find_v4l2_dev(notifier);
>  		struct v4l2_async_subdev *asd;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
> +		printk("  %s:\n", v4l2_async_nf_name(notifier));
> +
>  		if (!v4l2_dev)
>  			continue;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
> +
>  		asd = v4l2_async_find_match(notifier, sd);
>  		if (!asd)
>  			continue;
>  
> +		printk("%s:%d\n", __func__, __LINE__);
> +		print_subdev(asd);
> +
>  		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
>  		if (ret)
>  			goto err_unbind;
> @@ -868,17 +967,6 @@ static void print_waiting_subdev(struct seq_file *s,
>  	}
>  }
>  
> -static const char *
> -v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
> -{
> -	if (notifier->v4l2_dev)
> -		return notifier->v4l2_dev->name;
> -	else if (notifier->sd)
> -		return notifier->sd->name;
> -	else
> -		return "nil";
> -}
> -
>  static int pending_subdevs_show(struct seq_file *s, void *data)
>  {
>  	struct v4l2_async_notifier *notif;
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 3d9533c1b202..45ed62b16327 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1293,6 +1293,8 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	struct v4l2_async_notifier *notifier;
>  	int ret;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	if (WARN_ON(!sd->dev))
>  		return -ENODEV;
>  
> @@ -1306,14 +1308,20 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	ret = v4l2_async_subdev_nf_register(sd, notifier);
>  	if (ret < 0)
>  		goto out_cleanup;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	ret = v4l2_async_register_subdev(sd);
>  	if (ret < 0)
>  		goto out_unregister;
>  
> +	printk("%s:%d\n", __func__, __LINE__);
> +
>  	sd->subdev_notifier = notifier;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
