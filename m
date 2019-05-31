Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB3C316DA
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 23:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfEaV65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 17:58:57 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37855 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfEaV64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 17:58:56 -0400
Received: by mail-ot1-f65.google.com with SMTP id r10so10712650otd.4
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PtBz8Up2N2M3NxTeyempra7V3otT4gUfYK/Ple8JGUY=;
        b=TaFcp0wYzHizNlKlz+SbaJkGay65jMVIv5LCkAa8tEdKfvZIAmfrmxvYDktPo9V642
         pB+vTXUxmnVeOjYAS2wJ/Q88MFTWAXCGLCmorSxXWho3Qd2xwTt6gwvMUazBatJC8+LI
         SCZCRl1qMXWNJ/9gORQ4RESsCNVXdnCNk+1ZBOaKt5fhX0LI4qB3unkPtvbefj2+y6SV
         tfnaE1/r+3oyMfvXhlL6BxKPEmmC3bCv0qHXFkhpJQKWKRNtiLUIBuaqt+4W5AHgp3SK
         7nsEjccEQa+VHi78yw04iHJby3Wj+2hnpgc3OX/mAr5eF3rYWR3DVwmehIPZTpMgm5qz
         n6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PtBz8Up2N2M3NxTeyempra7V3otT4gUfYK/Ple8JGUY=;
        b=e0Z3IvcncXjBNJ+SWjW8gMx1i7AOCGPiVk8Py/8eWt3aInf7k6iOOh5yZfuBj/ddD6
         F76JpBXpsLkBaObNXwBEPaO+kfnS951k4fTZ6M+cBy6CsXZpxVthBM7XetW+UNcnZ5B7
         535Fpy9rRIAasrSUjYh6qo5G+ImFSMjF1MOGeY5Rf0NYDKyTd7Xz1c67/hwwrVcK9V6F
         kk1F3qP7wLReFM0NSZ2sQPcbMnkWtfp1hdIOr+kcm6UxdTTIivaDeAary/YYBMo/LWqJ
         nXF/fFI/6j774J0GLYHLBmq3NRzJnrHpqOobufaQXnnDgJDargGtB/mAMyDu6PL3zUWj
         OLZw==
X-Gm-Message-State: APjAAAXmuitLpl63lvA/NlUnWOkA5nsiKA9qWDc03nCfnfXP3tJPOldu
        1TFxzm1r7mCwrQVEm9x+sclvbTeIJEvmxcgURu4=
X-Google-Smtp-Source: APXvYqyha/jPG3XKh7cHLlX8fum/sk2Eki4XrDiFYqN/h1WIiX4jLCZzJug9sqK0s+kqDmOYTvB4bRHeAZJpJf40wnM=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr3538283oto.224.1559339935235;
 Fri, 31 May 2019 14:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com> <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 31 May 2019 17:58:44 -0400
Message-ID: <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On Thu, May 30, 2019 at 8:26 PM Robin Gong <yibin.gong@nxp.com> wrote:
>         What's soc chip and board you used? Could you post log?

The mainline kernel we've been using does not have any sdma firmware, and
as a result we get this in the log:

# uname -a
Linux Chimera 5.2.0-rc2-00041-g22a1787e8f40 #66 SMP Fri May 31
16:08:15 EDT 2019 armv7l GNU/Linux
# dmesg | grep sdma
[    1.358472] imx-sdma 20ec000.sdma: Direct firmware load for
imx/sdma/sdma-imx6q.bin failed with error -2
[    1.358570] imx-sdma 20ec000.sdma: Falling back to sysfs fallback
for: imx/sdma/sdma-imx6q.bin
[   64.473773] imx-sdma 20ec000.sdma: external firmware not found,
using ROM firmware

I downloaded the latest Freescale sdma firmware (3.3) from
http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware
(file: imx/sdma/sdma-imx6q.bin) and added this to the kernel. This now gets
uploaded to the imx6q, we see this in the log:

[    1.338741] imx-sdma 20ec000.sdma: loaded firmware 3.3

But... the kernel now locks up and crashes. See the dmesg log at the end of
this e-mail.

I have not been able to bisect the exact commit where this crash was introd=
uced.
All I know is:
v4.20 good
v5.0 bad

Also: if I remove CONFIG_NFS_V4 from the defconfig, the problem disappears.

This is on an imx6q:
# cat /proc/cpuinfo
processor : 0
model name : ARMv7 Processor rev 10 (v7l)
BogoMIPS : 7.54
Features : half thumb fastmult vfp edsp neon vfpv3 tls vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant : 0x2
CPU part : 0xc09
CPU revision : 10
<...>
Hardware : Freescale i.MX6 Quad/DualLite (Device Tree)
Revision : 0000
Serial : 0000000000000000

The board is an in-house design, loosely based on the sabre-sd. We have our
own small patch set which adds our devicetree, plus a few very specific
patches we need. We apply this on top of mainline.

We also use imx_v6_v7_defconfig.

Here is the crash log:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.2.0-rc2-00045-gc63ee3cb7134
(sva@svens-asus) (gcc version 7.3.1 20180425 [linaro-7.3-2018.05
revision d29120a424ecfbc167ef90065c0eeb7f91977701] (Linaro GCC
7.3-2018.05)) #67 SMP Fri May 31 17:26:19 EDT 2019
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=3D10=
c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: ARCX Medusa
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Reserved 256 MiB at 0x30000000
[    0.000000] percpu: Embedded 21 pages/cpu s54824 r8192 d23000 u86016
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 52256=
0
[    0.000000] Kernel command line: console=3Dttymxc0,115200
video=3Dmxcfb0:dev=3Dpegasus,640x480M@60,if=3DRGB24,bpp=3D32
video=3Dmxcfb1:dev=3Dhdmi,640x480M@60,if=3DRGB24,bpp=3D32 ip=3Dnone
root=3D/dev/mmcblk0p3 rootwait ro rootfstype=3Dext2
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s)
[    0.000000] Memory: 1788368K/2097152K available (12288K kernel
code, 984K rwdata, 4300K rodata, 1024K init, 6927K bss, 46640K
reserved, 262144K cma-reserved, 1310720K highmem)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] Running RCU self tests
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU event tracing is enabled.
[    0.000000] rcu: RCU lockdep checking is enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 10 jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C: DT/platform modifies aux control register:
0x32070000 -> 0x32470000
[    0.000000] L2C-310 errata 752271 769419 enabled
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
[    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
[    0.000000] random: get_random_bytes called from
start_kernel+0x2ac/0x4c0 with crng_init=3D0
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000008] sched_clock: 32 bits at 3000kHz, resolution 333ns,
wraps every 715827882841ns
[    0.000034] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 637086815595 ns
[    0.002040] Console: colour dummy device 80x30
[    0.002082] Lock dependency validator: Copyright (c) 2006 Red Hat,
Inc., Ingo Molnar
[    0.002099] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.002115] ... MAX_LOCK_DEPTH:          48
[    0.002130] ... MAX_LOCKDEP_KEYS:        8191
[    0.002145] ... CLASSHASH_SIZE:          4096
[    0.002160] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.002176] ... MAX_LOCKDEP_CHAINS:      65536
[    0.002191] ... CHAINHASH_SIZE:          32768
[    0.002206]  memory used by lock dependency info: 4411 kB
[    0.002221]  per task-struct memory footprint: 1536 bytes
[    0.002319] Calibrating delay loop (skipped), value calculated
using timer frequency.. 6.00 BogoMIPS (lpj=3D30000)
[    0.002346] pid_max: default: 32768 minimum: 301
[    0.002804] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.002834] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes)
[    0.004993] *** VALIDATE proc ***
[    0.006217] *** VALIDATE cgroup1 ***
[    0.006244] *** VALIDATE cgroup2 ***
[    0.006274] CPU: Testing write buffer coherency: ok
[    0.006361] CPU0: Spectre v2: using BPIALL workaround
[    0.007728] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.010229] Setting up static identity map for 0x10100000 - 0x10100078
[    0.010805] rcu: Hierarchical SRCU implementation.
[    0.012321] smp: Bringing up secondary CPUs ...
[    0.014731] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.014742] CPU1: Spectre v2: using BPIALL workaround
[    0.017456] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.017467] CPU2: Spectre v2: using BPIALL workaround
[    0.019703] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.019714] CPU3: Spectre v2: using BPIALL workaround
[    0.020158] smp: Brought up 1 node, 4 CPUs
[    0.020182] SMP: Total of 4 processors activated (24.00 BogoMIPS).
[    0.020200] CPU: All CPU(s) started in SVC mode.
[    0.023381] devtmpfs: initialized
[    0.055718] VFP support v0.3: implementor 41 architecture 3 part 30
variant 9 rev 4
[    0.057990] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.058053] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.071931] pinctrl core: initialized pinctrl subsystem
[    0.076633] NET: Registered protocol family 16
[    0.099278] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.102498] cpuidle: using governor menu
[    0.102817] CPU identified as i.MX6Q, silicon rev 1.5
[    0.121955] vdd1p1: supplied by regulator-dummy
[    0.123569] vdd3p0: supplied by regulator-dummy
[    0.124764] vdd2p5: supplied by regulator-dummy
[    0.125968] vddarm: supplied by regulator-dummy
[    0.127280] vddpu: supplied by regulator-dummy
[    0.128480] vddsoc: supplied by regulator-dummy
[    0.156882] No ATAGs?
[    0.157339] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1
watchpoint registers.
[    0.157442] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.161886] imx6q-pinctrl 20e0000.iomuxc: initialized IMX pinctrl driver
[    0.251889] mxs-dma 110000.dma-apbh: initialized
[    0.575723] vgaarb: loaded
[    0.576724] SCSI subsystem initialized
[    0.577976] usbcore: registered new interface driver usbfs
[    0.578177] usbcore: registered new interface driver hub
[    0.578429] usbcore: registered new device driver usb
[    0.578736] usb_phy_generic usbphynop1: usbphynop1 supply vcc not
found, using dummy regulator
[    0.579422] usb_phy_generic usbphynop2: usbphynop2 supply vcc not
found, using dummy regulator
[    0.583328] i2c i2c-0: IMX I2C adapter registered
[    0.585141] i2c i2c-1: IMX I2C adapter registered
[    0.586492] i2c i2c-2: IMX I2C adapter registered
[    0.586857] media: Linux media interface: v0.10
[    0.586961] videodev: Linux video capture interface: v2.00
[    0.587400] pps_core: LinuxPPS API ver. 1 registered
[    0.587421] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.587476] PTP clock support registered
[    0.588382] Advanced Linux Sound Architecture Driver Initialized.
[    0.592138] Bluetooth: Core ver 2.22
[    0.592243] NET: Registered protocol family 31
[    0.592263] Bluetooth: HCI device and connection manager initialized
[    0.592369] Bluetooth: HCI socket layer initialized
[    0.592402] Bluetooth: L2CAP socket layer initialized
[    0.592586] Bluetooth: SCO socket layer initialized
[    0.594195] Registering the MIOB1 driver
[    0.594874] clocksource: Switched to clocksource mxc_timer1
[    1.258934] VFS: Disk quotas dquot_6.6.0
[    1.259111] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 byt=
es)
[    1.285747] NET: Registered protocol family 2
[    1.288032] tcp_listen_portaddr_hash hash table entries: 512
(order: 2, 20480 bytes)
[    1.288161] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes)
[    1.288326] TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
[    1.289306] TCP: Hash tables configured (established 8192 bind 8192)
[    1.289803] UDP hash table entries: 512 (order: 3, 40960 bytes)
[    1.289987] UDP-Lite hash table entries: 512 (order: 3, 40960 bytes)
[    1.290545] NET: Registered protocol family 1
[    1.292659] RPC: Registered named UNIX socket transport module.
[    1.292742] RPC: Registered udp transport module.
[    1.292761] RPC: Registered tcp transport module.
[    1.292779] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.293779] PCI: CLS 0 bytes, default 64
[    1.295797] hw perfevents: no interrupt-affinity property for /pmu, gues=
sing.
[    1.296451] hw perfevents: enabled with armv7_cortex_a9 PMU driver,
7 counters available
[    1.301092] Initialise system trusted keyrings
[    1.301815] workingset: timestamp_bits=3D14 max_order=3D19 bucket_order=
=3D5
[    1.320996] NFS: Registering the id_resolver key type
[    1.321160] Key type id_resolver registered
[    1.321244] Key type id_legacy registered
[    1.321420] jffs2: version 2.2. (NAND) =C2=A9 2001-2006 Red Hat, Inc.
[    1.322546] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    1.323116] fuse: init (API version 7.30)
[    1.324872] Key type asymmetric registered
[    1.324989] Asymmetric key parser 'x509' registered
[    1.325235] bounce: pool size: 64 pages
[    1.325850] io scheduler mq-deadline registered
[    1.325874] io scheduler kyber registered
[    1.329712] imx-weim 21b8000.weim: Driver registered.
[    1.334167] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 range=
s:
[    1.334363] imx6q-pcie 1ffc000.pcie:    IO 0x01f80000..0x01f8ffff
-> 0x00000000
[    1.334561] imx6q-pcie 1ffc000.pcie:   MEM 0x01000000..0x01efffff
-> 0x01000000
[    1.338741] imx-sdma 20ec000.sdma: loaded firmware 3.3
[    1.340843] random: fast init done
[    1.347479] imx-pgc-pd imx-pgc-power-domain.0: DMA mask not set
[    1.347981] imx-pgc-pd imx-pgc-power-domain.1: DMA mask not set
[    1.439680] random: crng init done
[    1.454933] pfuze100-regulator 1-0008: unrecognized pfuze chip ID!
[    1.455678] pfuze100-regulator: probe of 1-0008 failed with error -110
[    1.458693] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq =3D 27,
base_baud =3D 5000000) is a IMX
[    2.332077] printk: console [ttymxc0] enabled
[    2.339264] imx-uart 21e8000.serial: has an ltc2870 combined
rs232/rs485 transceiver
[    2.347647] 21e8000.serial: ttymxc1 at MMIO 0x21e8000 (irq =3D 72,
base_baud =3D 5000000) is a IMX
[    2.357699] 21ec000.serial: ttymxc2 at MMIO 0x21ec000 (irq =3D 73,
base_baud =3D 5000000) is a IMX
[    2.367844] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq =3D 74,
base_baud =3D 5000000) is a IMX
[    2.400377] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
[    2.406647] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
[    2.412736] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
[    2.418491] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[    2.436892] etnaviv-gpu 130000.gpu: command buffer outside valid
memory window
[    2.445272] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[    2.462852] etnaviv-gpu 134000.gpu: command buffer outside valid
memory window
[    2.471107] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[    2.477299] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[    2.486259] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on mino=
r 0
[    2.497848] imx-ipuv3 2400000.ipu: IPUv3H probed
[    2.505207] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.511894] [drm] No driver support for vblank timestamp query.
[    2.519385] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
ipu_crtc_ops)
[    2.527161] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
ipu_crtc_ops)
[    2.534943] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops
ipu_crtc_ops)
[    2.542666] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops
ipu_crtc_ops)
[    2.550431] imx-drm display-subsystem: failed to bind 120000.hdmi
(ops dw_hdmi_imx_ops): -517
[    2.560401] imx-drm display-subsystem: master bind failed: -517
[    2.566519] imx-ipuv3 2800000.ipu: IPUv3H probed
[   27.494777] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[   27.500797] rcu: 0-....: (1 GPs behind) idle=3Db62/0/0x3 softirq=3D39/39=
 fqs=3D1301
[   27.508222] (detected by 1, t=3D2603 jiffies, g=3D-1143, q=3D21)
[   27.513816] Sending NMI from CPU 1 to CPUs 0:
[   27.518568] NMI backtrace for cpu 0
[   27.518576] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.2.0-rc2-00045-gc63ee3cb7134 #67
[   27.518582] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   27.518587] PC is at __do_softirq+0xbc/0x528
[   27.518590] LR is at lockdep_hardirqs_on+0xac/0x1e8
[   27.518595] pc : [<c01022dc>]    lr : [<c01899f8>]    psr: 60000113
[   27.518598] sp : c1301e80  ip : 00000000  fp : c13f0a44
[   27.518602] r10: 00000282  r9 : dc018400  r8 : 00000001
[   27.518605] r7 : 00000000  r6 : c1308ce0  r5 : 00000000  r4 : ffffe000
[   27.518609] r3 : c130c600  r2 : 00000000  r1 : 00000002  r0 : 00000001
[   27.518613] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[   27.518617] Control: 10c5387d  Table: 1000404a  DAC: 00000051
[   27.518622] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.2.0-rc2-00045-gc63ee3cb7134 #67
[   27.518626] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   27.518630] [<c01127e0>] (unwind_backtrace) from [<c010cfd4>]
(show_stack+0x10/0x14)
[   27.518634] [<c010cfd4>] (show_stack) from [<c0c70bac>]
(dump_stack+0xd8/0x110)
[   27.518638] [<c0c70bac>] (dump_stack) from [<c0c77640>]
(nmi_cpu_backtrace+0x6c/0xbc)
[   27.518642] [<c0c77640>] (nmi_cpu_backtrace) from [<c0110b20>]
(handle_IPI+0xe4/0x3ac)
[   27.518646] [<c0110b20>] (handle_IPI) from [<c052e7f0>]
(gic_handle_irq+0x94/0xa8)
[   27.518650] [<c052e7f0>] (gic_handle_irq) from [<c0101a70>]
(__irq_svc+0x70/0x98)
[   27.518654] Exception stack(0xc1301e30 to 0xc1301e78)
[   27.518659] 1e20:                                     00000001
00000002 00000000 c130c600
[   27.518663] 1e40: ffffe000 00000000 c1308ce0 00000000 00000001
dc018400 00000282 c13f0a44
[   27.518667] 1e60: 00000000 c1301e80 c01899f8 c01022dc 60000113 ffffffff
[   27.518671] [<c0101a70>] (__irq_svc) from [<c01022dc>]
(__do_softirq+0xbc/0x528)
[   27.518676] [<c01022dc>] (__do_softirq) from [<c012eff0>]
(irq_exit+0x12c/0x180)
[   27.518680] [<c012eff0>] (irq_exit) from [<c0195eb0>]
(__handle_domain_irq+0x6c/0xe0)
[   27.518684] [<c0195eb0>] (__handle_domain_irq) from [<c052e7a8>]
(gic_handle_irq+0x4c/0xa8)
[   27.518688] [<c052e7a8>] (gic_handle_irq) from [<c0101a70>]
(__irq_svc+0x70/0x98)
[   27.518691] Exception stack(0xc1301f10 to 0xc1301f58)
[   27.518696] 1f00:                                     00000001
00000006 00000000 c130c600
[   27.518700] 1f20: ffffe000 c1308928 00000001 c1308964 00000000
00000000 c1308908 c1308978
[   27.518703] 1f40: 00000000 c1301f60 c0189a48 c0109490 20000013 ffffffff
[   27.518707] [<c0101a70>] (__irq_svc) from [<c0109490>]
(arch_cpu_idle+0x20/0x3c)
[   27.518711] [<c0109490>] (arch_cpu_idle) from [<c0160748>]
(do_idle+0x1b8/0x2c0)
[   27.518715] [<c0160748>] (do_idle) from [<c0160be0>]
(cpu_startup_entry+0x18/0x20)
[   27.518720] [<c0160be0>] (cpu_startup_entry) from [<c1200e24>]
(start_kernel+0x410/0x4c0)
[   27.518725] [<c1200e24>] (start_kernel) from [<00000000>] (0x0)
