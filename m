Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC46B74B902
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 23:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjGGV6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 17:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjGGV63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 17:58:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54EC2107
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 14:58:05 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99313a34b2dso275917666b.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1688767072; x=1691359072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGc60LMap4U2KyLB2XLnWcc63vuPSt+J2YMuCCBeO7c=;
        b=5V57zwYINlzPzQZ/SKqt0hlxX0HWE+xI8SCwabLsEfOAYBKzPMHEM2bd3we3ZURMPG
         6n56zYdlCG/kNujRvHrEdETEXPCYDIo0BJ0T4oJLRcamfi0p0lsBBMF3G1Z6jIUCTMdm
         w32MjxZEvMFLYsWvmrV9RN0fnu5zIq4i9O3Oth9ReBJDGI+Q0mEuvtaKlhT/GVQB4SNs
         xvEWIKKD1m57D9mPwdi32E9RJwGk5VzCG+sfvGoOF3xiTmNquk9PvNGYh/aNlffl2tkx
         SWKj593FjOL+hNRlXiyTXli5DGz5qGH/SNPm/cxcSWh5WbxWdzubae90yHXcRsVlKj1b
         siPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688767072; x=1691359072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGc60LMap4U2KyLB2XLnWcc63vuPSt+J2YMuCCBeO7c=;
        b=CDnaulUTpMn69Gxkl4racfVVIFpSFG99+7po+c07tnzS0kHfAhr81kxeP1BJYKYL6b
         D35WOkPvc0r3Pc/jvdLDVMaY05ELWUnNqNppdiVXkXgFVvJReqMU3bSgmlLK9lNVWigH
         EtnYXayxvpdte6pmI77zqc9OOM+rCztET749lro4G+UMvBaw+AU+xrcWoRrHX4AVhUwQ
         t9QPl0KHKVFlfus9VZanCzNvhGi4y1/M2S8r0FHMvvd0tTPlN2tMcmf6AHPOidN3HZUH
         +i/esNTyowDWNh4qCSGkMMwpivM9ouhchJ5UfB5klJO/Ck7q/uRBciyUv9WLoEtTZVaB
         LpuA==
X-Gm-Message-State: ABy/qLb05SxXdamneHnm/X/+HAl6AqSNsvEDDc+MfU7aStuUnQ45ZhQ+
        b8kZlDGcjJIHDAE9HqN0mdA1cIJOpwOyK7mhhe9xig==
X-Google-Smtp-Source: APBJJlFJQ9BAUTtcD08XR7bMa3LEbSVacpYIhSZ0WIKzdhbGpM3B3IcLojoxpri5wBO4GU/43+7YA84HcRBFzVLP+w4=
X-Received: by 2002:a17:906:79c4:b0:982:9daf:9fcf with SMTP id
 m4-20020a17090679c400b009829daf9fcfmr4724025ejo.66.1688767071911; Fri, 07 Jul
 2023 14:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <9aabef0e-9f48-f8bd-ab7c-e51ac2685116@kontron.de>
 <Y+EdT3uRzmjrxe6r@pendragon.ideasonboard.com> <8965ad7f-0683-81af-2bfd-e6a0a173c95e@kontron.de>
 <Y+EhsjtL5DYBie9u@pendragon.ideasonboard.com> <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <Y+Vxg1lt0aIDRGIR@pendragon.ideasonboard.com> <d275e830-5960-0910-ca34-1b990971cea3@kontron.de>
 <Y+toAcOYNFbbvpPj@pendragon.ideasonboard.com> <07ceda76-3b3e-10d3-ecd3-e9fb2669445f@kontron.de>
 <12ad73f5-ea42-946b-5c89-5b6a07153006@kontron.de>
In-Reply-To: <12ad73f5-ea42-946b-5c89-5b6a07153006@kontron.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 7 Jul 2023 14:57:39 -0700
Message-ID: <CAJ+vNU2R7DKoUcebKBC9Y74v_6FEXAGK=8mYD-CpqRypVdnXfw@mail.gmail.com>
Subject: Re: Capture image from imx219 sensor on i.MX8MM
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 14, 2023 at 5:57=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 14.02.23 14:19, Frieder Schrempf wrote:
> > On 14.02.23 11:52, Laurent Pinchart wrote:
> >> Hi Frieder,
> >>
> >> On Tue, Feb 14, 2023 at 11:18:33AM +0100, Frieder Schrempf wrote:
> >>> On 09.02.23 23:19, Laurent Pinchart wrote:
> >>>> On Tue, Feb 07, 2023 at 04:24:45PM +0100, Frieder Schrempf wrote:
> >>>>> On 06.02.23 16:50, Laurent Pinchart wrote:
> >>>>>> On Mon, Feb 06, 2023 at 04:38:27PM +0100, Frieder Schrempf wrote:
> >>>>>>> On 06.02.23 16:31, Laurent Pinchart wrote:
> >>>>>>>> On Mon, Feb 06, 2023 at 03:24:41PM +0100, Frieder Schrempf wrote=
:
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> I'm trying to get a camera stream on our i.MX8MM board up and r=
unning
> >>>>>>>>> with Linux 6.1. I'm using the RPi v2.1 camera module (imx219) a=
s sensor.
> >>>>>>>>>
> >>>>>>>>> I basically copied the devicetree setup from Tim's overlay at
> >>>>>>>>> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dt=
s.
> >>>>>>>>>
> >>>>>>>>> With all the drivers enabled the devices (imx219, imx7-media-cs=
i,
> >>>>>>>>> imx-mipi-csis) seem to probe just fine and I see /dev/video0 an=
d
> >>>>>>>>> /dev/media0.
> >>>>>>>>>
> >>>>>>>>> For the v4l subdevices I would expect to see one for the sensor=
 and one
> >>>>>>>>> for the CSI bridge. But only the latter is there (see below).
> >>>>>>>>>
> >>>>>>>>> Is this correct? Am I missing something? How can I setup/enable=
 the
> >>>>>>>>> pipeline/stream?
> >>>>>>>>
> >>>>>>>> Your expectations are correct, but the result isn't. You should =
see the
> >>>>>>>> camera sensor in the media graph. Has the imx219 been probed by =
the
> >>>>>>>> driver ? Did probe succeed ?
> >>>>>>>
> >>>>>>> Yes, the imx219_probe() works just fine and returns with code 0. =
I also
> >>>>>>> see v4l2_async_register_subdev_sensor() and the underlying code b=
eing
> >>>>>>> called.
> >>>>>>>
> >>>>>>> So I really don't understand why I'm missing the sensor subdev. A=
ny
> >>>>>>> ideas how to continue debugging?
> >>>>>>
> >>>>>> The issue seems to be with v4l2-async then. There's a debugfs file=
 that
> >>>>>> lists the missing v4l2-async subdevs (I don't recall the path by h=
eard),
> >>>>>> that can give useful information. Enabling the debug messages from
> >>>>>> v4l2-async.c may helpt too.
> >>>>>
> >>>>> +Cc: Dave, Sakari, Javier (thanks for your help and debugging hints=
 via
> >>>>> mail/IRC)
> >>>>>
> >>>>> /sys/kernel/debug/v4l2-async/pending_async_subdevices gives me:
> >>>>>
> >>>>> csis-32e30000.mipi-csi:
> >>>>>  [fwnode] dev=3D1-0010, node=3D/soc@0/bus@30800000/i2c@30a30000/sen=
sor@10/port/endpoint
> >>>>> imx219 1-0010:
> >>>>> imx-media:
> >>>>>
> >>>>> So it looks like the async subdev for the imx219 sensor is still pe=
nding.
> >>>>
> >>>> Indeed, that seems to be the problem.
> >>>>
> >>>>> I have spent quite a few hours trying to understand how the code is
> >>>>> supposed to work, but I'm afraid it's too much for my brain at the =
moment ;)
> >>>>>
> >>>>> I have attached a debug patch [1] adding printks in v4l2-async.c an=
d the
> >>>>> boot log [2] with all the output below. Hopefully someone can have =
a
> >>>>> look and make something out of that. Feel free to let me know via e=
mail
> >>>>> or IRC if I can provide any further information.
> >>>>
> >>>> To be honest your debug messages are quite cryptic. They may be read=
able
> >>>> when tracing the code on a live system, but offline, that's a differ=
ent
> >>>> story.
> >>>
> >>> I know. Sorry for that. I just posted what I hacked together for
> >>> understanding the code flow. Sakari's debug patch is a better start, =
but
> >>> it doesn't really cover the problem I see, as the matching code is ne=
ver
> >>> called. The issue is elsewhere and causes the fwnode matching to not
> >>> take place at all.
> >>>
> >>>> More comments below.
> >>>>
> >>>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd0=
34]
> >>>>> [    0.000000] Linux version 6.2.0-rc7-ktn (oe-user@oe-host) (aarch=
64-ktn-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP =
PREEMPT Tue Feb  7 08:25:13 UTC 2023
> >>>>> [    0.000000] Machine model: Kontron BL i.MX8MM (N801X S)
> >>>>> [    0.000000] efi: UEFI not found.
> >>>>> [    0.000000] NUMA: No NUMA configuration found
> >>>>> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000=
000013fffffff]
> >>>>> [    0.000000] NUMA: NODE_DATA [mem 0x13f7c2b00-0x13f7c4fff]
> >>>>> [    0.000000] Zone ranges:
> >>>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000fffffff=
f]
> >>>>> [    0.000000]   DMA32    empty
> >>>>> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000013ffffff=
f]
> >>>>> [    0.000000] Movable zone start for each node
> >>>>> [    0.000000] Early memory node ranges
> >>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000013fffff=
ff]
> >>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000=
0013fffffff]
> >>>>> [    0.000000] cma: Reserved 1024 MiB at 0x00000000bbe00000
> >>>>> [    0.000000] psci: probing for conduit method from DT.
> >>>>> [    0.000000] psci: PSCIv1.1 detected in firmware.
> >>>>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> >>>>> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
> >>>>> [    0.000000] psci: SMC Calling Convention v1.2
> >>>>> [    0.000000] percpu: Embedded 20 pages/cpu s42024 r8192 d31704 u8=
1920
> >>>>> [    0.000000] Detected VIPT I-cache on CPU0
> >>>>> [    0.000000] CPU features: detected: GIC system register CPU inte=
rface
> >>>>> [    0.000000] CPU features: detected: ARM erratum 845719
> >>>>> [    0.000000] alternatives: applying boot alternatives
> >>>>> [    0.000000] Fallback order for Node 0: 0
> >>>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total page=
s: 1032192
> >>>>> [    0.000000] Policy zone: Normal
> >>>>> [    0.000000] Kernel command line: root=3D/dev/nfs ip=3D192.168.1.=
11:192.168.1.10:::kontron-mx8mm:eth0:any nfsroot=3D192.168.1.10:/nfsroot,v3=
,tcp cma=3D1G rootwait
> >>>>> [    0.000000] Dentry cache hash table entries: 524288 (order: 10, =
4194304 bytes, linear)
> >>>>> [    0.000000] Inode-cache hash table entries: 262144 (order: 9, 20=
97152 bytes, linear)
> >>>>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:=
off
> >>>>> [    0.000000] software IO TLB: area num 4.
> >>>>> [    0.000000] software IO TLB: mapped [mem 0x00000000fbfff000-0x00=
000000fffff000] (64MB)
> >>>>> [    0.000000] Memory: 2976216K/4194304K available (13568K kernel c=
ode, 1222K rwdata, 4840K rodata, 2368K init, 545K bss, 169512K reserved, 10=
48576K cma-reserved)
> >>>>> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPU=
s=3D4, Nodes=3D1
> >>>>> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> >>>>> [    0.000000] rcu:       RCU event tracing is enabled.
> >>>>> [    0.000000] rcu:       RCU restricting CPUs from NR_CPUS=3D256 t=
o nr_cpu_ids=3D4.
> >>>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment de=
lay is 25 jiffies.
> >>>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D4
> >>>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> >>>>> [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> >>>>> [    0.000000] GICv3: 128 SPIs implemented
> >>>>> [    0.000000] GICv3: 0 Extended SPIs implemented
> >>>>> [    0.000000] Root IRQ handler: gic_handle_irq
> >>>>> [    0.000000] GICv3: GICv3 features: 16 PPIs
> >>>>> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000000=
0038880000
> >>>>> [    0.000000] ITS: No ITS available, not enabling LPIs
> >>>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on c=
ontention.
> >>>>> [    0.000000] arch_timer: cp15 timer(s) running at 8.00MHz (phys).
> >>>>> [    0.000000] clocksource: arch_sys_counter: mask: 0xfffffffffffff=
f max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
> >>>>> [    0.000000] sched_clock: 56 bits at 8MHz, resolution 125ns, wrap=
s every 2199023255500ns
> >>>>> [    0.000353] Console: colour dummy device 80x25
> >>>>> [    0.000363] printk: console [tty0] enabled
> >>>>> [    0.000858] Calibrating delay loop (skipped), value calculated u=
sing timer frequency.. 16.00 BogoMIPS (lpj=3D32000)
> >>>>> [    0.000881] pid_max: default: 32768 minimum: 301
> >>>>> [    0.000940] LSM: initializing lsm=3Dcapability,integrity
> >>>>> [    0.001043] Mount-cache hash table entries: 8192 (order: 4, 6553=
6 bytes, linear)
> >>>>> [    0.001072] Mountpoint-cache hash table entries: 8192 (order: 4,=
 65536 bytes, linear)
> >>>>> [    0.002504] rcu: Hierarchical SRCU implementation.
> >>>>> [    0.002526] rcu:       Max phase no-delay instances is 1000.
> >>>>> [    0.003357] EFI services will not be available.
> >>>>> [    0.003583] smp: Bringing up secondary CPUs ...
> >>>>> [    0.004061] Detected VIPT I-cache on CPU1
> >>>>> [    0.004136] GICv3: CPU1: found redistributor 1 region 0:0x000000=
00388a0000
> >>>>> [    0.004178] CPU1: Booted secondary processor 0x0000000001 [0x410=
fd034]
> >>>>> [    0.004649] Detected VIPT I-cache on CPU2
> >>>>> [    0.004712] GICv3: CPU2: found redistributor 2 region 0:0x000000=
00388c0000
> >>>>> [    0.004736] CPU2: Booted secondary processor 0x0000000002 [0x410=
fd034]
> >>>>> [    0.005177] Detected VIPT I-cache on CPU3
> >>>>> [    0.005238] GICv3: CPU3: found redistributor 3 region 0:0x000000=
00388e0000
> >>>>> [    0.005259] CPU3: Booted secondary processor 0x0000000003 [0x410=
fd034]
> >>>>> [    0.005316] smp: Brought up 1 node, 4 CPUs
> >>>>> [    0.005403] SMP: Total of 4 processors activated.
> >>>>> [    0.005414] CPU features: detected: 32-bit EL0 Support
> >>>>> [    0.005424] CPU features: detected: 32-bit EL1 Support
> >>>>> [    0.005440] CPU features: detected: CRC32 instructions
> >>>>> [    0.005506] CPU: All CPU(s) started at EL2
> >>>>> [    0.005524] alternatives: applying system-wide alternatives
> >>>>> [    0.007432] devtmpfs: initialized
> >>>>> [    0.013542] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 7645041785100000 ns
> >>>>> [    0.013594] futex hash table entries: 1024 (order: 4, 65536 byte=
s, linear)
> >>>>> [    0.043563] pinctrl core: initialized pinctrl subsystem
> >>>>> [    0.045549] DMI not present or invalid.
> >>>>> [    0.046159] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> >>>>> [    0.047073] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic=
 allocations
> >>>>> [    0.047276] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool fo=
r atomic allocations
> >>>>> [    0.047441] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool =
for atomic allocations
> >>>>> [    0.047501] audit: initializing netlink subsys (disabled)
> >>>>> [    0.047623] audit: type=3D2000 audit(0.044:1): state=3Dinitializ=
ed audit_enabled=3D0 res=3D1
> >>>>> [    0.048000] thermal_sys: Registered thermal governor 'step_wise'
> >>>>> [    0.048033] cpuidle: using governor menu
> >>>>> [    0.048199] hw-breakpoint: found 6 breakpoint and 4 watchpoint r=
egisters.
> >>>>> [    0.048287] ASID allocator initialised with 65536 entries
> >>>>> [    0.048955] Serial: AMBA PL011 UART driver
> >>>>> [    0.055254] imx8mm-pinctrl 30330000.pinctrl: initialized IMX pin=
ctrl driver
> >>>>> [    0.066886] HugeTLB: registered 1.00 GiB page size, pre-allocate=
d 0 pages
> >>>>> [    0.066917] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 G=
iB page
> >>>>> [    0.066932] HugeTLB: registered 32.0 MiB page size, pre-allocate=
d 0 pages
> >>>>> [    0.066944] HugeTLB: 508 KiB vmemmap can be freed for a 32.0 MiB=
 page
> >>>>> [    0.066958] HugeTLB: registered 2.00 MiB page size, pre-allocate=
d 0 pages
> >>>>> [    0.066972] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB =
page
> >>>>> [    0.066987] HugeTLB: registered 64.0 KiB page size, pre-allocate=
d 0 pages
> >>>>> [    0.067000] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB p=
age
> >>>>> [    0.068588] ACPI: Interpreter disabled.
> >>>>> [    0.069385] iommu: Default domain type: Translated
> >>>>> [    0.069405] iommu: DMA domain TLB invalidation policy: strict mo=
de
> >>>>> [    0.069649] SCSI subsystem initialized
> >>>>> [    0.069932] usbcore: registered new interface driver usbfs
> >>>>> [    0.069969] usbcore: registered new interface driver hub
> >>>>> [    0.070007] usbcore: registered new device driver usb
> >>>>> [    0.070643] mc: Linux media interface: v0.10
> >>>>> [    0.070690] videodev: Linux video capture interface: v2.00
> >>>>> [    0.070754] pps_core: LinuxPPS API ver. 1 registered
> >>>>> [    0.070765] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
> >>>>> [    0.070791] PTP clock support registered
> >>>>> [    0.070920] EDAC MC: Ver: 3.0.0
> >>>>> [    0.071496] FPGA manager framework
> >>>>> [    0.071573] Advanced Linux Sound Architecture Driver Initialized=
.
> >>>>> [    0.072353] vgaarb: loaded
> >>>>> [    0.072652] clocksource: Switched to clocksource arch_sys_counte=
r
> >>>>> [    0.072831] VFS: Disk quotas dquot_6.6.0
> >>>>> [    0.072867] VFS: Dquot-cache hash table entries: 512 (order 0, 4=
096 bytes)
> >>>>> [    0.073038] pnp: PnP ACPI: disabled
> >>>>> [    0.079203] NET: Registered PF_INET protocol family
> >>>>> [    0.079432] IP idents hash table entries: 65536 (order: 7, 52428=
8 bytes, linear)
> >>>>> [    0.082247] tcp_listen_portaddr_hash hash table entries: 2048 (o=
rder: 3, 32768 bytes, linear)
> >>>>> [    0.082335] Table-perturb hash table entries: 65536 (order: 6, 2=
62144 bytes, linear)
> >>>>> [    0.082361] TCP established hash table entries: 32768 (order: 6,=
 262144 bytes, linear)
> >>>>> [    0.082592] TCP bind hash table entries: 32768 (order: 8, 104857=
6 bytes, linear)
> >>>>> [    0.083553] TCP: Hash tables configured (established 32768 bind =
32768)
> >>>>> [    0.083705] UDP hash table entries: 2048 (order: 4, 65536 bytes,=
 linear)
> >>>>> [    0.083806] UDP-Lite hash table entries: 2048 (order: 4, 65536 b=
ytes, linear)
> >>>>> [    0.084021] NET: Registered PF_UNIX/PF_LOCAL protocol family
> >>>>> [    0.084433] RPC: Registered named UNIX socket transport module.
> >>>>> [    0.084451] RPC: Registered udp transport module.
> >>>>> [    0.084462] RPC: Registered tcp transport module.
> >>>>> [    0.084474] RPC: Registered tcp NFSv4.1 backchannel transport mo=
dule.
> >>>>> [    0.084493] PCI: CLS 0 bytes, default 64
> >>>>> [    0.085132] hw perfevents: enabled with armv8_cortex_a53 PMU dri=
ver, 7 counters available
> >>>>> [    0.085846] kvm [1]: IPA Size Limit: 40 bits
> >>>>> [    0.087132] kvm [1]: GICv3: no GICV resource entry
> >>>>> [    0.087146] kvm [1]: disabling GICv2 emulation
> >>>>> [    0.087164] kvm [1]: GIC system register CPU interface enabled
> >>>>> [    0.087258] kvm [1]: vgic interrupt IRQ9
> >>>>> [    0.087360] kvm [1]: Hyp mode initialized successfully
> >>>>> [    0.088486] Initialise system trusted keyrings
> >>>>> [    0.088687] workingset: timestamp_bits=3D42 max_order=3D20 bucke=
t_order=3D0
> >>>>> [    0.088988] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> >>>>> [    0.089207] NFS: Registering the id_resolver key type
> >>>>> [    0.089262] Key type id_resolver registered
> >>>>> [    0.089274] Key type id_legacy registered
> >>>>> [    0.089303] nfs4filelayout_init: NFSv4 File Layout Driver Regist=
ering...
> >>>>> [    0.089317] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Drive=
r Registering...
> >>>>> [    0.089466] 9p: Installing v9fs 9p2000 file system support
> >>>>> [    0.124669] Key type asymmetric registered
> >>>>> [    0.124683] Asymmetric key parser 'x509' registered
> >>>>> [    0.124735] Block layer SCSI generic (bsg) driver version 0.4 lo=
aded (major 244)
> >>>>> [    0.124753] io scheduler mq-deadline registered
> >>>>> [    0.124764] io scheduler kyber registered
> >>>>> [    0.128006] EINJ: ACPI disabled.
> >>>>> [    0.136799] SoC: i.MX8MM revision 1.0
> >>>>> [    0.141870] Serial: 8250/16550 driver, 4 ports, IRQ sharing enab=
led
> >>>>> [    0.143967] 30860000.serial: ttymxc0 at MMIO 0x30860000 (irq =3D=
 16, base_baud =3D 1500000) is a IMX
> >>>>> [    0.144488] 30880000.serial: ttymxc2 at MMIO 0x30880000 (irq =3D=
 17, base_baud =3D 1500000) is a IMX
> >>>>> [    0.144522] imx-uart 30880000.serial: Console IMX rounded baud r=
ate from 114286 to 114300
> >>>>> [    0.144571] printk: console [ttymxc2] enabled
> >>>>> [    1.126108] 30890000.serial: ttymxc1 at MMIO 0x30890000 (irq =3D=
 18, base_baud =3D 1500000) is a IMX
> >>>>> [    1.144256] loop: module loaded
> >>>>> [    1.150889] tun: Universal TUN/TAP device driver, 1.6
> >>>>> [    1.156153] CAN device driver interface
> >>>>> [    1.160606] thunder_xcv, ver 1.0
> >>>>> [    1.163879] thunder_bgx, ver 1.0
> >>>>> [    1.167145] nicpf, ver 1.0
> >>>>> [    1.170627] hns3: Hisilicon Ethernet Network Driver for Hip08 Fa=
mily - version
> >>>>> [    1.177871] hns3: Copyright (c) 2017 Huawei Corporation.
> >>>>> [    1.183231] hclge is initializing
> >>>>> [    1.186586] e1000e: Intel(R) PRO/1000 Network Driver
> >>>>> [    1.191565] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> >>>>> [    1.197519] igb: Intel(R) Gigabit Ethernet Network Driver
> >>>>> [    1.202932] igb: Copyright (c) 2007-2014 Intel Corporation.
> >>>>> [    1.208538] igbvf: Intel(R) Gigabit Virtual Function Network Dri=
ver
> >>>>> [    1.214821] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
> >>>>> [    1.220881] sky2: driver version 1.30
> >>>>> [    1.225044] VFIO - User Level meta-driver version: 0.3
> >>>>> [    1.231934] usbcore: registered new interface driver usb-storage
> >>>>> [    1.240846] snvs_rtc 30370000.snvs:snvs-rtc-lp: registered as rt=
c0
> >>>>> [    1.247080] snvs_rtc 30370000.snvs:snvs-rtc-lp: setting system c=
lock to 1970-01-01T00:00:00 UTC (0)
> >>>>> [    1.256271] i2c_dev: i2c /dev entries driver
> >>>>> [    1.261317] imx7-csi 32e20000.csi: Registered csi capture as /de=
v/video0
> >>>>> [    1.268186] __v4l2_async_nf_register:610
> >>>>> [    1.272130]   imx-media:
> >>>>> [    1.274676] v4l2_async_nf_try_all_subdevs:447
> >>>>> [    1.279048]   imx-media:
> >>>>> [    1.281593] v4l2_async_nf_try_all_subdevs:454
> >>>>> [    1.285965] imx7_csi_notify_complete:2178
> >>>>
> >>>> This doesn't seem right. The complete function should only be called
> >>>> once all the subdevices required by the notifier have been found, an=
d at
> >>>> this point, the csis hasn't even probed. You may want to check the
> >>>> device tree.
> >>>
> >>> But it looks like the notifier for the csi doesn't have any subdev
> >>> dependencies. The "imx-media: " shows that a notifier for the csi is =
in
> >>> the notifier_list, but the notif->waiting is empty.
> >>>
> >>> Is that correct? How is the dependency graph supposed to look like? I=
s
> >>> it csi -> csis -> imx219 or the other way round? In the latter case t=
he
> >>> imx219 should wait for all the other subdevs, right?
> >>
> >> The imx7-media-csi driver registers a notifier in
> >> imx7_csi_async_register(), which should have one entry corresponding t=
o
> >> the imx-mipi-csis.
> >>
> >> The code seems to silently ignore some errors, which I don't think is
> >> right. It originates from the shared code base with the i.MX6 IPUv3
> >> drivers, and should be fixed now. I'd start by checking what happens
> >> there.
> >
> > Ok, I had a look at imx7_csi_async_register() and the call to
> > fwnode_graph_get_endpoint_by_id() returns NULL. This probably should
> > already cause the probe to fail, but is currently ignored.
> >
> > It looks like the remote endpoint lookup cannot be resolved as the csi
> > is probed first and the remote device (mipi_csis) is not yet available.
> >
> > How is this supposed to work in the first place? Do we need to defer th=
e
> > probe of the csi until the mipi_csis is available?
>
> As discussed on IRC, in the attachment there is the DTB from the device
> for further debugging.

Frieder,

Where did you end up with this? I have imx219 capture working on
imx8mm on a 5.15 kernel with lots of backports but have not managed to
repeat it on a 6.4 kernel. I don't run into the issue you are running
into (I have the imx-media device showing) but the media-ctl entities
have changed since my 5.15 kernel and I can't figure out how to link
them up and configure them with media-ctl.

On my imx8mm-venice-gw72xx with imx8mm-venice-gw72xx-0x-imx219.dtso I see:
root@jammy-venice:~# cat /sys/bus/media/devices/media*/model
imx-media
hantro-vpu
hantro-vpu
root@jammy-venice:~# cat /sys/bus/media/devices/media0/model
imx-media
root@jammy-venice:~# media-ctl --device /dev/media0 -p
Media controller API version 6.4.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:32e20000.csi
hw revision     0x0
driver version  6.4.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                <- "csis-32e30000.mipi-csi":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [fmt:UYVY8_2X8/640x480 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: csis-32e30000.mipi-csi (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
        pad0: Sink
                [fmt:UYVY8_1X16/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                <- "imx219 2-0010":0 []
        pad1: Source
                [fmt:UYVY8_1X16/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                -> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: imx219 2-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
        pad0: Source
                [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(8,8)/3280x2464]
                -> "csis-32e30000.mipi-csi":0 []

When I try to link and configure the pipeline I run into issues I
don't know how to resolve:
root@jammy-venice:~# media-ctl --device /dev/media0 --reset
root@jammy-venice:~# media-ctl --device /dev/media0 --links "'imx219
2-0010':0->'csis-32e30000.mipi-csi.0':0[1]"
Unable to parse link: Invalid argument (22)
^^^ not sure why I can't link imx219 source pad with mipi-csi sink pad

What changed for me from my 5.15 kernel is the entities and pads
above. My 5.15 kernel looks like this:
root@jammy-venice:~# cat /sys/bus/media/devices/media2/model
imx-media
root@jammy-venice:~# media-ctl --device /dev/media2 -p
Media controller API version 5.15.15

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info        platform:32e20000.csi
hw revision     0x0
driver version  5.15.15

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video2
        pad0: Sink
                <- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
        pad0: Sink
                [fmt:UYVY8_1X16/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                <- "imx219 2-0010":0 []
        pad1: Source
                [fmt:UYVY8_1X16/640x480 field:none
colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                -> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: imx219 2-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
        pad0: Source
                [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/3280x2464
                 crop:(8,8)/3280x2464]
                -> "imx7-mipi-csis.0":0 []
# configure media controller links
media-ctl --device /dev/media2 --reset
# link the imx219 source pad (0) to the imx7-mipi-csis sink pad (0)
media-ctl --device /dev/media2 --links "'imx219
2-0010':0->'imx7-mipi-csis.0':0[1]"
# configure the imx219 source pad (0) for srgb 640x480
media-ctl --device /dev/media2 -v -V "'imx219 2-0010':0
[fmt:SRGGB8/640x480 field:none]"
# configure the csi sink pad (0) for srgb 640x480
media-ctl --device /dev/media2 -v -V "'csi':0 [fmt:SRGGB8/640x480 field:non=
e]"
# stream 640x480@30fps
gst-launch-1.0 v4l2src device=3D/dev/video0 !
video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
bayer2rgb ! fbdevsink # works

Maybe you have gotten further than this by now?

If you are still having issues getting imx-media to register we can
look at kernel configs. I believe the following are necessary:
CONFIG_VIDEO_IMX219=3Dy
CONFIG_VIDEO_IMX_MIPI_CSIS=3Dy
CONFIG_VIDEO_IMX7_CSI=3Dy

Best regards,

Tim
