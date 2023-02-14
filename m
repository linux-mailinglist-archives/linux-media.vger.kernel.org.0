Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC37D69617E
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 11:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbjBNKw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 05:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbjBNKwy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 05:52:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7ED4EF1
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 02:52:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3A073D7;
        Tue, 14 Feb 2023 11:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676371970;
        bh=Aor1bWux/DTi1niS8F00ZHLj54O2oXSZYW9ZxnXh980=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vagfAEicKsme4yxuHrqDJ0tKZ9SNerU9hVbqnhAJXoER4Gqi/4p6fIaVXbweuo7Kf
         Tsyr3bQBlyJ0exf9qPwAiNAKUqsud1FHqVC+bu0x3didEJnAnS6Vb3GBATg3LxSKUP
         6PNYrVO+pQT95ZpPDQGMkB/5NrXZEDnE5g1WOkWE=
Date:   Tue, 14 Feb 2023 12:52:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: Capture image from imx219 sensor on i.MX8MM
Message-ID: <Y+toAcOYNFbbvpPj@pendragon.ideasonboard.com>
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com>
 <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com>
 <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com>
 <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Tue, Feb 14, 2023 at 11:18:33AM +0100, Frieder Schrempf wrote:
> On 09.02.23 23:19, Laurent Pinchart wrote:
> > On Tue, Feb 07, 2023 at 04:24:45PM +0100, Frieder Schrempf wrote:
> >> On 06.02.23 16:50, Laurent Pinchart wrote:
> >>> On Mon, Feb 06, 2023 at 04:38:27PM +0100, Frieder Schrempf wrote:
> >>>> On 06.02.23 16:31, Laurent Pinchart wrote:
> >>>>> On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> I'm trying to get a camera stream on our i.MX8MM board up and running
> >>>>>> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) as sensor.
> >>>>>>
> >>>>>> I basically copied the devicetree setup from Tim's overlay at
> >>>>>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dts.
> >>>>>>
> >>>>>> With all the drivers enabled the devices (imx219, imx7-media-csi,
> >>>>>> imx-mipi-csis) seem to probe just fine and I see /dev/video0 and
> >>>>>> /dev/media0.
> >>>>>>
> >>>>>> For the v4l subdevices I would expect to see one for the sensor and one
> >>>>>> for the CSI bridge. But only the latter is there (see below).
> >>>>>>
> >>>>>> Is this correct? Am I missing something? How can I setup/enable the
> >>>>>> pipeline/stream?
> >>>>>
> >>>>> Your expectations are correct, but the result isn't. You should see the
> >>>>> camera sensor in the media graph. Has the imx219 been probed by the
> >>>>> driver ? Did probe succeed ?
> >>>>
> >>>> Yes, the imx219_probe() works just fine and returns with code 0. I also
> >>>> see v4l2_async_register_subdev_sensor() and the underlying code being
> >>>> called.
> >>>>
> >>>> So I really don't understand why I'm missing the sensor subdev. Any
> >>>> ideas how to continue debugging?
> >>>
> >>> The issue seems to be with v4l2-async then. There's a debugfs file that
> >>> lists the missing v4l2-async subdevs (I don't recall the path by heard),
> >>> that can give useful information. Enabling the debug messages from
> >>> v4l2-async.c may helpt too.
> >>
> >> +Cc: Dave, Sakari, Javier (thanks for your help and debugging hints via
> >> mail/IRC)
> >>
> >> /sys/kernel/debug/v4l2-async/pending_async_subdevices gives me:
> >>
> >> csis-32e30000.mipi-csi:
> >>  [fwnode] dev=1-0010, node=/soc@0/bus@30800000/i2c@30a30000/sensor@10/port/endpoint
> >> imx219 1-0010:
> >> imx-media:
> >>
> >> So it looks like the async subdev for the imx219 sensor is still pending.
> > 
> > Indeed, that seems to be the problem.
> > 
> >> I have spent quite a few hours trying to understand how the code is
> >> supposed to work, but I'm afraid it's too much for my brain at the moment ;)
> >>
> >> I have attached a debug patch [1] adding printks in v4l2-async.c and the
> >> boot log [2] with all the output below. Hopefully someone can have a
> >> look and make something out of that. Feel free to let me know via email
> >> or IRC if I can provide any further information.
> > 
> > To be honest your debug messages are quite cryptic. They may be readable
> > when tracing the code on a live system, but offline, that's a different
> > story.
> 
> I know. Sorry for that. I just posted what I hacked together for
> understanding the code flow. Sakari's debug patch is a better start, but
> it doesn't really cover the problem I see, as the matching code is never
> called. The issue is elsewhere and causes the fwnode matching to not
> take place at all.
> 
> > More comments below.
> > 
> >> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> >> [    0.000000] Linux version 6.2.0-rc7-ktn (oe-user@oe-host) (aarch64-ktn-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP PREEMPT Tue Feb  7 08:25:13 UTC 2023
> >> [    0.000000] Machine model: Kontron BL i.MX8MM (N801X S)
> >> [    0.000000] efi: UEFI not found.
> >> [    0.000000] NUMA: No NUMA configuration found
> >> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
> >> [    0.000000] NUMA: NODE_DATA [mem 0x13f7c2b00-0x13f7c4fff]
> >> [    0.000000] Zone ranges:
> >> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
> >> [    0.000000]   DMA32    empty
> >> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> >> [    0.000000] Movable zone start for each node
> >> [    0.000000] Early memory node ranges
> >> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000013fffffff]
> >> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
> >> [    0.000000] cma: Reserved 1024 MiB at 0x00000000bbe00000
> >> [    0.000000] psci: probing for conduit method from DT.
> >> [    0.000000] psci: PSCIv1.1 detected in firmware.
> >> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> >> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> >> [    0.000000] psci: SMC Calling Convention v1.2
> >> [    0.000000] percpu: Embedded 20 pages/cpu s42024 r8192 d31704 u81920
> >> [    0.000000] Detected VIPT I-cache on CPU0
> >> [    0.000000] CPU features: detected: GIC system register CPU interface
> >> [    0.000000] CPU features: detected: ARM erratum 845719
> >> [    0.000000] alternatives: applying boot alternatives
> >> [    0.000000] Fallback order for Node 0: 0
> >> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1032192
> >> [    0.000000] Policy zone: Normal
> >> [    0.000000] Kernel command line: root=/dev/nfs ip=192.168.1.11:192.168.1.10:::kontron-mx8mm:eth0:any nfsroot=192.168.1.10:/nfsroot,v3,tcp cma=1G rootwait
> >> [    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
> >> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> >> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> >> [    0.000000] software IO TLB: area num 4.
> >> [    0.000000] software IO TLB: mapped [mem 0x00000000fbfff000-0x00000000fffff000] (64MB)
> >> [    0.000000] Memory: 2976216K/4194304K available (13568K kernel code, 1222K rwdata, 4840K rodata, 2368K init, 545K bss, 169512K reserved, 1048576K cma-reserved)
> >> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> >> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> >> [    0.000000] rcu: 	RCU event tracing is enabled.
> >> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
> >> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> >> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> >> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> >> [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> >> [    0.000000] GICv3: 128 SPIs implemented
> >> [    0.000000] GICv3: 0 Extended SPIs implemented
> >> [    0.000000] Root IRQ handler: gic_handle_irq
> >> [    0.000000] GICv3: GICv3 features: 16 PPIs
> >> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000038880000
> >> [    0.000000] ITS: No ITS available, not enabling LPIs
> >> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> >> [    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (phys).
> >> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
> >> [    0.000000] sched_clock: 56 bits at 8MHz, resolution 125ns, wraps every 2199023255500ns
> >> [    0.000353] Console: colour dummy device 80x25
> >> [    0.000363] printk: console [tty0] enabled
> >> [    0.000858] Calibrating delay loop (skipped), value calculated using timer frequency.. 16.00 BogoMIPS (lpj=32000)
> >> [    0.000881] pid_max: default: 32768 minimum: 301
> >> [    0.000940] LSM: initializing lsm=capability,integrity
> >> [    0.001043] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
> >> [    0.001072] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
> >> [    0.002504] rcu: Hierarchical SRCU implementation.
> >> [    0.002526] rcu: 	Max phase no-delay instances is 1000.
> >> [    0.003357] EFI services will not be available.
> >> [    0.003583] smp: Bringing up secondary CPUs ...
> >> [    0.004061] Detected VIPT I-cache on CPU1
> >> [    0.004136] GICv3: CPU1: found redistributor 1 region 0:0x00000000388a0000
> >> [    0.004178] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> >> [    0.004649] Detected VIPT I-cache on CPU2
> >> [    0.004712] GICv3: CPU2: found redistributor 2 region 0:0x00000000388c0000
> >> [    0.004736] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
> >> [    0.005177] Detected VIPT I-cache on CPU3
> >> [    0.005238] GICv3: CPU3: found redistributor 3 region 0:0x00000000388e0000
> >> [    0.005259] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
> >> [    0.005316] smp: Brought up 1 node, 4 CPUs
> >> [    0.005403] SMP: Total of 4 processors activated.
> >> [    0.005414] CPU features: detected: 32-bit EL0 Support
> >> [    0.005424] CPU features: detected: 32-bit EL1 Support
> >> [    0.005440] CPU features: detected: CRC32 instructions
> >> [    0.005506] CPU: All CPU(s) started at EL2
> >> [    0.005524] alternatives: applying system-wide alternatives
> >> [    0.007432] devtmpfs: initialized
> >> [    0.013542] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> >> [    0.013594] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
> >> [    0.043563] pinctrl core: initialized pinctrl subsystem
> >> [    0.045549] DMI not present or invalid.
> >> [    0.046159] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> >> [    0.047073] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
> >> [    0.047276] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> >> [    0.047441] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> >> [    0.047501] audit: initializing netlink subsys (disabled)
> >> [    0.047623] audit: type=2000 audit(0.044:1): state=initialized audit_enabled=0 res=1
> >> [    0.048000] thermal_sys: Registered thermal governor 'step_wise'
> >> [    0.048033] cpuidle: using governor menu
> >> [    0.048199] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> >> [    0.048287] ASID allocator initialised with 65536 entries
> >> [    0.048955] Serial: AMBA PL011 UART driver
> >> [    0.055254] imx8mm-pinctrl 30330000.pinctrl: initialized IMX pinctrl driver
> >> [    0.066886] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> >> [    0.066917] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> >> [    0.066932] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
> >> [    0.066944] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB page
> >> [    0.066958] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> >> [    0.066972] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> >> [    0.066987] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
> >> [    0.067000] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
> >> [    0.068588] ACPI: Interpreter disabled.
> >> [    0.069385] iommu: Default domain type: Translated
> >> [    0.069405] iommu: DMA domain TLB invalidation policy: strict mode
> >> [    0.069649] SCSI subsystem initialized
> >> [    0.069932] usbcore: registered new interface driver usbfs
> >> [    0.069969] usbcore: registered new interface driver hub
> >> [    0.070007] usbcore: registered new device driver usb
> >> [    0.070643] mc: Linux media interface: v0.10
> >> [    0.070690] videodev: Linux video capture interface: v2.00
> >> [    0.070754] pps_core: LinuxPPS API ver. 1 registered
> >> [    0.070765] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> >> [    0.070791] PTP clock support registered
> >> [    0.070920] EDAC MC: Ver: 3.0.0
> >> [    0.071496] FPGA manager framework
> >> [    0.071573] Advanced Linux Sound Architecture Driver Initialized.
> >> [    0.072353] vgaarb: loaded
> >> [    0.072652] clocksource: Switched to clocksource arch_sys_counter
> >> [    0.072831] VFS: Disk quotas dquot_6.6.0
> >> [    0.072867] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> >> [    0.073038] pnp: PnP ACPI: disabled
> >> [    0.079203] NET: Registered PF_INET protocol family
> >> [    0.079432] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
> >> [    0.082247] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
> >> [    0.082335] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> >> [    0.082361] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
> >> [    0.082592] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, linear)
> >> [    0.083553] TCP: Hash tables configured (established 32768 bind 32768)
> >> [    0.083705] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
> >> [    0.083806] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
> >> [    0.084021] NET: Registered PF_UNIX/PF_LOCAL protocol family
> >> [    0.084433] RPC: Registered named UNIX socket transport module.
> >> [    0.084451] RPC: Registered udp transport module.
> >> [    0.084462] RPC: Registered tcp transport module.
> >> [    0.084474] RPC: Registered tcp NFSv4.1 backchannel transport module.
> >> [    0.084493] PCI: CLS 0 bytes, default 64
> >> [    0.085132] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 counters available
> >> [    0.085846] kvm [1]: IPA Size Limit: 40 bits
> >> [    0.087132] kvm [1]: GICv3: no GICV resource entry
> >> [    0.087146] kvm [1]: disabling GICv2 emulation
> >> [    0.087164] kvm [1]: GIC system register CPU interface enabled
> >> [    0.087258] kvm [1]: vgic interrupt IRQ9
> >> [    0.087360] kvm [1]: Hyp mode initialized successfully
> >> [    0.088486] Initialise system trusted keyrings
> >> [    0.088687] workingset: timestamp_bits=42 max_order=20 bucket_order=0
> >> [    0.088988] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> >> [    0.089207] NFS: Registering the id_resolver key type
> >> [    0.089262] Key type id_resolver registered
> >> [    0.089274] Key type id_legacy registered
> >> [    0.089303] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> >> [    0.089317] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> >> [    0.089466] 9p: Installing v9fs 9p2000 file system support
> >> [    0.124669] Key type asymmetric registered
> >> [    0.124683] Asymmetric key parser 'x509' registered
> >> [    0.124735] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
> >> [    0.124753] io scheduler mq-deadline registered
> >> [    0.124764] io scheduler kyber registered
> >> [    0.128006] EINJ: ACPI disabled.
> >> [    0.136799] SoC: i.MX8MM revision 1.0
> >> [    0.141870] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> >> [    0.143967] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq = 16, base_baud = 1500000) is a IMX
> >> [    0.144488] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq = 17, base_baud = 1500000) is a IMX
> >> [    0.144522] imx-uart 30880000.serial: Console IMX rounded baud rate from 114286 to 114300
> >> [    0.144571] printk: console [ttymxc2] enabled
> >> [    1.126108] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq = 18, base_baud = 1500000) is a IMX
> >> [    1.144256] loop: module loaded
> >> [    1.150889] tun: Universal TUN/TAP device driver, 1.6
> >> [    1.156153] CAN device driver interface
> >> [    1.160606] thunder_xcv, ver 1.0
> >> [    1.163879] thunder_bgx, ver 1.0
> >> [    1.167145] nicpf, ver 1.0
> >> [    1.170627] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
> >> [    1.177871] hns3: Copyright (c) 2017 Huawei Corporation.
> >> [    1.183231] hclge is initializing
> >> [    1.186586] e1000e: Intel(R) PRO/1000 Network Driver
> >> [    1.191565] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> >> [    1.197519] igb: Intel(R) Gigabit Ethernet Network Driver
> >> [    1.202932] igb: Copyright (c) 2007-2014 Intel Corporation.
> >> [    1.208538] igbvf: Intel(R) Gigabit Virtual Function Network Driver
> >> [    1.214821] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> >> [    1.220881] sky2: driver version 1.30
> >> [    1.225044] VFIO - User Level meta-driver version: 0.3
> >> [    1.231934] usbcore: registered new interface driver usb-storage
> >> [    1.240846] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rtc0
> >> [    1.247080] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system clock to 1970-01-01T00:00:00 UTC (0)
> >> [    1.256271] i2c_dev: i2c /dev entries driver
> >> [    1.261317] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0
> >> [    1.268186] __v4l2_async_nf_register:610
> >> [    1.272130]   imx-media:
> >> [    1.274676] v4l2_async_nf_try_all_subdevs:447
> >> [    1.279048]   imx-media:
> >> [    1.281593] v4l2_async_nf_try_all_subdevs:454
> >> [    1.285965] imx7_csi_notify_complete:2178
> > 
> > This doesn't seem right. The complete function should only be called
> > once all the subdevices required by the notifier have been found, and at
> > this point, the csis hasn't even probed. You may want to check the
> > device tree.
> 
> But it looks like the notifier for the csi doesn't have any subdev
> dependencies. The "imx-media: " shows that a notifier for the csi is in
> the notifier_list, but the notif->waiting is empty.
> 
> Is that correct? How is the dependency graph supposed to look like? Is
> it csi -> csis -> imx219 or the other way round? In the latter case the
> imx219 should wait for all the other subdevs, right?

The imx7-media-csi driver registers a notifier in
imx7_csi_async_register(), which should have one entry corresponding to
the imx-mipi-csis.

The code seems to silently ignore some errors, which I don't think is
right. It originates from the shared code base with the i.MX6 IPUv3
drivers, and should be fixed now. I'd start by checking what happens
there.

-- 
Regards,

Laurent Pinchart
