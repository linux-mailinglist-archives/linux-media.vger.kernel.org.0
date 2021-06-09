Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF003A1B88
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 19:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhFIRKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 13:10:15 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:20821 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhFIRKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 13:10:14 -0400
X-Greylist: delayed 7169 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 13:10:13 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1623258492; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ruMg+3Q+BhP0FkxX0pvoNSjJY+I1p7e9FjQf1cX1aKQc/+KWvIiWpYzRp23040Vu29
    jvdGpBpBLe9DXkQIAKJVn9Ed1CO1rRD2uUUl0nB2sdztYS3YccakZhOLty/g/4HLxVjS
    aZbvqoP9vLHL3aHj7fgMc1L6GQRtgjE326HJO5q/oeLmXR+DxzdI19fZQZ+thReXUZtj
    zLk50k2G1iOYT04mxT5GLIwTmSgg5Nsx10NQqlEE5JSidFSQBF5qcU1LkXFvvJlFO1Sg
    RTxr0H0o8++4lSEautU8bJzQosU8nB1J2zh9BMx5I1LQiZoWUa/79A3DknGWRQA9o3tD
    HBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623258492;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:Subject:References:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Up/ZHClClZW5LGTwv3zciUrDJ3c4mUlweME7Cm43dn8=;
    b=LxJF6DMDy4WsP7GbcgiZyJWIliQFvdn9GxvCAm7+TGHPfBmSvjw6dwwk5ywJZyFIjf
    +WDNr9u20SCBQBQiWQHEEKLLO2Y/SmPkxbk+6t9Ki/LMjA+W4obYmBruKNv7yLscTVBK
    b5weA7wfiaXXalMlE3wsKfCAD/HwUfaBlPJXMlqhK5+ZLyfzG9PHkEtuz8o6wRfnAVnE
    f6iPTmrAPyeIZqgZcZ5ZdWgVlB7wzIG6AWsaLOecy47/G+ZXYsXT+WLz+Pb5UGjrjAYi
    RdVgYVAgJX2S+KSNre7KV5O/zfSCGTaCXioBYv9PnvwHGG2k5rR7HAGe78NyqXsVfTg6
    UmZw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623258492;
    s=strato-dkim-0002; d=jm0.eu;
    h=In-Reply-To:Date:Message-ID:Subject:References:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Up/ZHClClZW5LGTwv3zciUrDJ3c4mUlweME7Cm43dn8=;
    b=sAOzuj3Nmga5kR0ntYgt9/+nbN6LsJpQrOh84Gevk2I4hkK3jpaB/dupcKPUAO3V5v
    KAJl/gYwD92spsnMag/H3pAVkADgb6uiLsMcaPAHyPeTvnev89dqeXcCh0a5Z+AnCQEl
    hGOEJ4K/xktrkgjqAdBZvhjhdRsAu+Ku+ueD40+bdT90Cf8Qi2IkNmNgfbpBP0NIHABi
    3MIHPNLUpRqON7YhxmpYnW5FhFEN0fgyZbhk3MQTXLtFesKU3BTk64XxemqFEE7odQ10
    MQ6cr68ZMp0ZMZ9sygu/OcvA6E6RaxsbeIaGPTC8B/eM1ycmY/Ul0TM5AYCd+3p5r2EE
    b5XA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPXvQCbXgI7t69COvinsMtCHQc3/AhnhpXVQ=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.2.163]
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id j09f72x59H8CbNd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 9 Jun 2021 19:08:12 +0200 (CEST)
From:   "Ing. Josua Mayer" <josua.mayer@jm0.eu>
To:     matrandg@cisco.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <427466e4-1b6f-f7c3-3d5e-89c7a7f2ec79@jm0.eu>
 <19a143de-818d-4c21-94c1-f4ebf57e3802@jm0.eu>
Subject: Re: [BUG] tc358743: division by zero
Message-ID: <35096323-4f28-6c04-2308-de9895c2751d@jm0.eu>
Date:   Wed, 9 Jun 2021 19:08:12 +0200
MIME-Version: 1.0
In-Reply-To: <19a143de-818d-4c21-94c1-f4ebf57e3802@jm0.eu>
Content-Type: multipart/mixed;
 boundary="------------C8E9470D09B2A4C62CE82231"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------C8E9470D09B2A4C62CE82231
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello again,

I added debug prints to tc358743_probe_of and 
tc358743_num_csi_lanes_needed, tracking the values of pll_prd and pll_fbd.

I believe the bug is caused by probe returning early when it encounters 
an unsupported datarate of more than 1gbps per lane, which skips the 
code that would initialize pll_fbd.
Hence later in tc358743_num_csi_lanes_needed, pll_fbd is zero - leading 
to divide by zero.

The interesting parts of dmesg leading to this conclusion:
[   16.393072] imx6_mipi_csi2: module is from the staging directory, the 
quality is unknown, you have been warned.
[   16.891557] tc358743 0-000f: initialized pll_prd = 4
[   16.896618] tc358743 0-000f: unsupported bps per lane: 1188000000 bps
# pll_prd has been initialized, but pll_fbd has not
[   17.203559] tc358743 0-000f: pll_prd = 4
[   17.207588] tc358743 0-000f: pll_fbd = 0
# using pll_fbd value 0
[   17.211539] Division by zero in kernel.
[   17.215415] CPU: 1 PID: 208 Comm: systemd-udevd Tainted: G        WC 
  E     5.10.0-7-armmp #1 Debian 5.10.40-2
[   17.225418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   17.231947] Backtrace:
[   17.234417] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] 
(show_stack+0x20/0x24)
[   17.247662] [<c0cf2374>] (show_stack) from [<c0cf74c4>] 
(dump_stack+0xc8/0xdc)
[   17.254892] [<c0cf73fc>] (dump_stack) from [<c0cf216c>] 
(__div0+0x24/0x28)
[   17.267442] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
[   17.273844] [<bf4cea34>] (tc358743_num_csi_lanes_needed [tc358743]) 
from [<bf4cec3c>] (tc358743_set_csi+0x1c/0x2f8 [tc358743])
[   17.290929] [<bf4cec20>] (tc358743_set_csi [tc358743]) from 
[<bf4ccaac>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
[   17.307430] [<bf4cc9a8>] (tc358743_s_dv_timings [tc358743]) from 
[<bf4ce384>] (tc358743_probe+0x93c/0xfec [tc358743])
[   17.323757] [<bf4cda48>] (tc358743_probe [tc358743]) from 
[<c0a3ace4>] (i2c_device_probe+0x100/0x2e0)

I don't really know where this condition should be checked for, or 
avoided. Hopefully though this gives somebody else enough information to 
find a solution.

Yours sincerely
Josua Mayer


Am 09.06.21 um 17:08 schrieb Ing. Josua Mayer:
> and I forgot about the promised dts :( .. I am realyl sorry for spamming 
> your mailbox like this ...
> 
> Am 09.06.21 um 17:07 schrieb Ing. Josua Mayer:
>> Dear Maintainers,
>>
>> During my attempts at capturing HDMI via the csi-2 port on i.MX6 
>> HummingBoard, I triggered a division by zero in 
>> tc358743_num_csi_lanes_needed!
>> I am running Debian testing, with linux 5.10.40 - built from debian 
>> sources with the tc358743 driver enabled:
>> Linux sr-imx6 5.10.0-7-armmp #1 SMP Debian 5.10.40-2 (2021-05-29) 
>> armv7l GNU/Linux
>>
>> The crash is triggered from userspace as I execute:
>> media-ctl -l "'tc358743 0-000f':0->'imx6-mipi-csi2':0[1]"
>> media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
>> media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
>> media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"
>> v4l2-ctl -d /dev/v4l-subdev7 --set-edid=file=tc358743-edid.hex && sleep 1
>> v4l2-ctl -d /dev/v4l-subdev7 --set-dv-bt-timings query && sleep 1
>>
>> [   60.985439] Division by zero in kernel.
>> [   60.989333] CPU: 1 PID: 395 Comm: v4l2-ctl Tainted: G        WC  E 
>>   5.10.0-7-armmp #1 Debian 5.10.40-2
>> [   60.998904] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
>> [   61.005438] Backtrace:
>> [   61.007911] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] 
>> (show_stack+0x20/0x24)
>> [   61.015489]  r7:00000018 r6:600b0013 r5:00000000 r4:c14cdc90
>> [   61.021162] [<c0cf2374>] (show_stack) from [<c0cf74c4>] 
>> (dump_stack+0xc8/0xdc)
>> [   61.028394] [<c0cf73fc>] (dump_stack) from [<c0cf216c>] 
>> (__div0+0x24/0x28)
>> [   61.035276]  r7:00000018 r6:034bc000 r5:c1f67890 r4:4f1a0000
>> [   61.040951] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
>> [   61.047336] [<bf412000>] (tc358743_num_csi_lanes_needed [tc358743]) 
>> from [<bf412a44>] (tc358743_set_csi+0x1c/0x3f0 [tc358743])
>> [   61.058734]  r9:00000000 r8:c2b8b400 r7:c1f67a59 r6:bf419380 
>> r5:c1f679e8 r4:c1f67890
>> [   61.066495] [<bf412a28>] (tc358743_set_csi [tc358743]) from 
>> [<bf413f64>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
>> [   61.077283]  r7:c1f67a59 r6:bf419380 r5:c1f679e8 r4:c1f67890
>> [   61.082961] [<bf413e60>] (tc358743_s_dv_timings [tc358743]) from 
>> [<c0a79fd4>] (subdev_do_ioctl+0x430/0xd0c)
>> [   61.092708]  r7:c1f67890 r6:c2ea0780 r5:c2d91c00 r4:c0845657
>> [   61.098376] [<c0a79ba4>] (subdev_do_ioctl) from [<c0a7a934>] 
>> (subdev_do_ioctl_lock+0x84/0xb4)
>> [   61.106909]  r10:c2d91c00 r9:bea08dec r8:c0845657 r7:00000000 
>> r6:c2d91c00 r5:c2ea0780
>> [   61.114741]  r4:c2e35000
>> [   61.117294] [<c0a7a8b0>] (subdev_do_ioctl_lock) from [<c0a6c4b4>] 
>> (video_usercopy+0x190/0x674)
>> [   61.125913]  r9:bea08dec r8:c2d91c00 r7:bea08dec r6:c0845657 
>> r5:00000000 r4:c0845657
>> [   61.133668] [<c0a6c324>] (video_usercopy) from [<c0a79254>] 
>> (subdev_ioctl+0x20/0x24)
>> [   61.141419]  r10:c30372a8 r9:00000003 r8:c2ea0780 r7:bea08dec 
>> r6:c2ea0780 r5:00000000
>> [   61.149251]  r4:c0a79234
>> [   61.151797] [<c0a79234>] (subdev_ioctl) from [<c0a64920>] 
>> (v4l2_ioctl+0x4c/0x60)
>> [   61.159207] [<c0a648d4>] (v4l2_ioctl) from [<c05a90ac>] 
>> (sys_ioctl+0x130/0xa74)
>> [   61.166520]  r5:00000000 r4:c0845657
>> [   61.170107] [<c05a8f7c>] (sys_ioctl) from [<c03000c0>] 
>> (ret_fast_syscall+0x0/0x54)
>> [   61.177681] Exception stack(0xc48adfa8 to 0xc48adff0)
>> [   61.182742] dfa0:                   005023a4 004dad3c 00000003 
>> c0845657 bea08dec 00000000
>> [   61.190927] dfc0: 005023a4 004dad3c 00000003 00000036 0050c808 
>> bea09494 bea08fa0 00000000
>> [   61.199109] dfe0: 00500df8 bea08d2c 004a635d b6cde418
>> [   61.204169]  r10:00000036 r9:c48ac000 r8:c03002c4 r7:00000036 
>> r6:00000003 r5:004dad3c
>> [   61.212000]  r4:005023a4
>>
>> I am attaching the device-tree changes as a file for reference. Any 
>> ideas what is happening here?
>>
>> I can see 2 divisions:
>> 1. pdata->refclk_hz / pdata->pll_prd
>> 2. DIV_ROUND_UP(bps, bps_pr_lane)
>>
>> 1. should never be 0, since it is initialized during probe and then 
>> never changed
>>
>> 2. see how the divisor can be 0
>> pdata->refclk_hz / pdata->pll_prd is the inversion of how pll_prd is 
>> calculated, and should equal to 6MHz from probe.
>> pll_fbd is also set in probe: pll_fbd = bps_pr_lane / refclk_hz * pll_prd
>> As I have specified a link-frequency of 594MHz, that produces:
>> bps_pr_lane = 2 * 594MHz
>> pll_fbd = 2 * 594MHz / 27MHz * (27MHz / 6MHz) = 2 * 594MHz / 6MHz = 198
>>
>> Apparently from initialization, the division by zero can not occur :(
>> (unless I made a mistake here).
>>
>> Thank you for reading this far!
>> Yours sincerely
>> Josua Mayer

--------------C8E9470D09B2A4C62CE82231
Content-Type: text/x-log; charset=UTF-8;
 name="imx6-tc358743-div0.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="imx6-tc358743-div0.log"

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.0-7-armmp (debian-kernel@lists.debian.o=
rg) (arm-linux-gnueabihf-gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld=
 (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.40-2 (2021-05-29)
[    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=3D=
10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing ins=
truction cache
[    0.000000] OF: fdt: Machine model: SolidRun HummingBoard Dual/Quad
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x4f000000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   Normal   empty
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004ff=
fffff]
[    0.000000] On node 0 totalpages: 262144
[    0.000000]   DMA zone: 1728 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 196608 pages, LIFO batch:63
[    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
[    0.000000] percpu: Embedded 21 pages/cpu s54540 r8192 d23284 u86016
[    0.000000] pcpu-alloc: s54540 r8192 d23284 u86016 alloc=3D21*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 260=
416
[    0.000000] Kernel command line:   console=3Dttymxc0,115200 deferred_p=
robe_timeout=3D10 ahci_imx.hotplug=3D1 log_level=3D7 net.ifnames=3D0
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 =
bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.000000] Memory: 978788K/1048576K available (11264K kernel code, 16=
65K rwdata, 3184K rodata, 2048K init, 335K bss, 53404K reserved, 16384K c=
ma-reserved, 245760K highmem)
[    0.000000] random: get_random_u32 called from __kmem_cache_create+0x3=
0/0x42c with crng_init=3D0
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
[    0.000000] ftrace: allocating 37350 entries in 73 pages
[    0.000000] ftrace: allocated 73 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D=
2.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is=
 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] L2C-310 errata 752271 769419 enabled
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9
[    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
[    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
[    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled=

[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
[    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000007] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps e=
very 715827882841ns
[    0.000028] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 637086815595 ns
[    0.003258] Console: colour dummy device 80x30
[    0.003313] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 6.00 BogoMIPS (lpj=3D12000)
[    0.003335] pid_max: default: 32768 minimum: 301
[    0.003684] LSM: Security Framework initializing
[    0.003790] Yama: disabled by default; enable with sysctl kernel.yama.=
*
[    0.004077] AppArmor: AppArmor initialized
[    0.004098] TOMOYO Linux initialized
[    0.004221] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes=
, linear)
[    0.004250] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 =
bytes, linear)
[    0.005554] CPU: Testing write buffer coherency: ok
[    0.005605] CPU0: Spectre v2: using BPIALL workaround
[    0.006027] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.007252] Setting up static identity map for 0x10300000 - 0x103000ac=

[    0.008739] rcu: Hierarchical SRCU implementation.
[    0.011544] EFI services will not be available.
[    0.012025] smp: Bringing up secondary CPUs ...
[    0.013179] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.013190] CPU1: Spectre v2: using BPIALL workaround
[    0.013375] smp: Brought up 1 node, 2 CPUs
[    0.013391] SMP: Total of 2 processors activated (12.00 BogoMIPS).
[    0.013402] CPU: All CPU(s) started in SVC mode.
[    0.014247] devtmpfs: initialized
[    0.025464] VFP support v0.3: implementor 41 architecture 3 part 30 va=
riant 9 rev 4
[    0.025813] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
[    0.025901] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)
[    0.027136] pinctrl core: initialized pinctrl subsystem
[    0.028586] DMI not present or invalid.
[    0.029028] NET: Registered protocol family 16
[    0.032760] DMA: preallocated 256 KiB pool for atomic coherent allocat=
ions
[    0.033791] audit: initializing netlink subsys (disabled)
[    0.034096] audit: type=3D2000 audit(0.032:1): state=3Dinitialized aud=
it_enabled=3D0 res=3D1
[    0.035617] thermal_sys: Registered thermal governor 'fair_share'
[    0.035627] thermal_sys: Registered thermal governor 'bang_bang'
[    0.035641] thermal_sys: Registered thermal governor 'step_wise'
[    0.035651] thermal_sys: Registered thermal governor 'user_space'
[    0.035662] thermal_sys: Registered thermal governor 'power_allocator'=

[    0.036036] CPU identified as i.MX6Q, silicon rev 1.5
[    0.560362] No ATAGs?
[    0.560507] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watc=
hpoint registers.
[    0.560521] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.562373] debugfs: Directory 'dummy-iomuxc-gpr@20e0000' with parent =
'regmap' already present!
[    0.562715] imx6q-pinctrl 20e0000.pinctrl: initialized IMX pinctrl dri=
ver
[    0.564701] Serial: AMBA PL011 UART driver
[    0.572988] Kprobes globally optimized
[    2.285860] mxs-dma 110000.dma-apbh: initialized
[    2.291656] iommu: Default domain type: Translated=20
[    2.292955] vgaarb: loaded
[    2.294216] mc: Linux media interface: v0.10
[    2.294280] videodev: Linux video capture interface: v2.00
[    2.296290] NetLabel: Initializing
[    2.296304] NetLabel:  domain hash size =3D 128
[    2.296313] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    2.296412] NetLabel:  unlabeled traffic allowed by default
[    2.296890] clocksource: Switched to clocksource mxc_timer1
[    2.392598] VFS: Disk quotas dquot_6.6.0
[    2.392731] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 b=
ytes)
[    2.393716] AppArmor: AppArmor Filesystem Enabled
[    2.407665] NET: Registered protocol family 2
[    2.408091] IP idents hash table entries: 16384 (order: 5, 131072 byte=
s, linear)
[    2.409866] tcp_listen_portaddr_hash hash table entries: 512 (order: 0=
, 6144 bytes, linear)
[    2.409971] TCP established hash table entries: 8192 (order: 3, 32768 =
bytes, linear)
[    2.410186] TCP bind hash table entries: 8192 (order: 4, 65536 bytes, =
linear)
[    2.410321] TCP: Hash tables configured (established 8192 bind 8192)
[    2.410651] UDP hash table entries: 512 (order: 2, 16384 bytes, linear=
)
[    2.410726] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, l=
inear)
[    2.411544] NET: Registered protocol family 1
[    2.411617] NET: Registered protocol family 44
[    2.411641] PCI: CLS 0 bytes, default 64
[    2.412405] Trying to unpack rootfs image as initramfs...
[    4.465878] Freeing initrd memory: 23648K
[    4.466546] hw perfevents: no interrupt-affinity property for /pmu, gu=
essing.
[    4.466841] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 =
counters available
[    4.469759] Initialise system trusted keyrings
[    4.469819] Key type blacklist registered
[    4.470149] workingset: timestamp_bits=3D14 max_order=3D18 bucket_orde=
r=3D4
[    4.478148] zbud: loaded
[    4.479412] integrity: Platform Keyring initialized
[    4.479435] Key type asymmetric registered
[    4.479448] Asymmetric key parser 'x509' registered
[    4.480076] bounce: pool size: 64 pages
[    4.480169] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 250)
[    4.480510] io scheduler mq-deadline registered
[    4.502160] imx-sdma 20ec000.sdma: firmware: direct-loading firmware i=
mx/sdma/sdma-imx6q.bin
[    4.502838] imx-sdma 20ec000.sdma: loaded firmware 3.5
[    4.510355] Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
[    4.514129] Serial: AMBA driver
[    4.515057] 2020000.serial: ttymxc0 at MMIO 0x2020000 (irq =3D 34, bas=
e_baud =3D 5000000) is a IMX
[    5.286778] printk: console [ttymxc0] enabled
[    5.292649] 21f0000.serial: ttymxc3 at MMIO 0x21f0000 (irq =3D 79, bas=
e_baud =3D 5000000) is a IMX
[    5.303792] STM32 USART driver initialized
[    5.311408] libphy: Fixed MDIO Bus: probed
[    5.317626] mousedev: PS/2 mouse device common for all mice
[    5.326659] snvs_rtc 20cc000.snvs:snvs-rtc-lp: registered as rtc0
[    5.332860] snvs_rtc 20cc000.snvs:snvs-rtc-lp: setting system clock to=
 1970-01-01T00:00:00 UTC (0)
[    5.347709] ledtrig-cpu: registered to indicate activity on CPUs
[    5.356033] NET: Registered protocol family 10
[    5.418433] Segment Routing with IPv6
[    5.422279] mip6: Mobile IPv6
[    5.425279] NET: Registered protocol family 17
[    5.429928] mpls_gso: MPLS GSO support
[    5.434272] ThumbEE CPU extension supported.
[    5.438585] Registering SWP/SWPB emulation handler
[    5.443591] registered taskstats version 1
[    5.447729] Loading compiled-in X.509 certificates
[    5.847346] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f=
6149f3dd27dfcc5cbb419ea1'
[    5.856213] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux:=
 4b6ef5abca669825178e052c84667ccbc0531f8c'
[    5.866603] zswap: loaded using pool lzo/zbud
[    5.871774] Key type ._fscrypt registered
[    5.875846] Key type .fscrypt registered
[    5.879834] Key type fscrypt-provisioning registered
[    5.885118] AppArmor: AppArmor sha1 policy hashing enabled
[    5.948120] Freeing unused kernel memory: 2048K
[    5.965608] ------------[ cut here ]------------
[    5.970288] WARNING: CPU: 1 PID: 1 at arch/arm/mm/dump.c:248 note_page=
+0x3d0/0x3dc
[    5.977887] arm/mm: Found insecure W+X mapping at address 0xf0879000
[    5.984264] Modules linked in:
[    5.987359] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.10.0-7-armmp #=
1 Debian 5.10.40-2
[    5.995454] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)=

[    6.001985] Backtrace:=20
[    6.004457] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] (show_stac=
k+0x20/0x24)
[    6.012038]  r7:000000f8 r6:600e0013 r5:00000000 r4:c14cdc90
[    6.017710] [<c0cf2374>] (show_stack) from [<c0cf74c4>] (dump_stack+0x=
c8/0xdc)
[    6.024952] [<c0cf73fc>] (dump_stack) from [<c034d770>] (__warn+0xfc/0=
x158)
[    6.031921]  r7:000000f8 r6:00000009 r5:c031f5dc r4:c0fbbaf4
[    6.037593] [<c034d674>] (__warn) from [<c0cf3148>] (warn_slowpath_fmt=
+0xa4/0xe4)
[    6.045083]  r7:c031f5dc r6:000000f8 r5:c0fbbaf4 r4:c0fbbac0
[    6.050750] [<c0cf30a8>] (warn_slowpath_fmt) from [<c031f5dc>] (note_p=
age+0x3d0/0x3dc)
[    6.058674]  r8:00000000 r7:00000000 r6:00000005 r5:c140c4a0 r4:c195bf=
28
[    6.065382] [<c031f20c>] (note_page) from [<c031f6d0>] (walk_pmd+0xe8/=
0x1a4)
[    6.072438]  r10:c195bf28 r9:c0207c20 r8:c18db800 r7:00000000 r6:c0fbb=
b3c r5:f087b000
[    6.080271]  r4:c18db1ec
[    6.082814] [<c031f5e8>] (walk_pmd) from [<c031f8d0>] (ptdump_check_wx=
+0x88/0x104)
[    6.090392]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:c0208=
000 r5:f0800000
[    6.098225]  r4:c0207c28
[    6.100776] [<c031f848>] (ptdump_check_wx) from [<c03197d8>] (mark_rod=
ata_ro+0x3c/0x40)
[    6.108784]  r6:00000000 r5:c0d0167c r4:00000000
[    6.113420] [<c031979c>] (mark_rodata_ro) from [<c0d016c0>] (kernel_in=
it+0x44/0x130)
[    6.121175] [<c0d0167c>] (kernel_init) from [<c03001a8>] (ret_from_for=
k+0x14/0x2c)
[    6.128748] Exception stack(0xc195bfb0 to 0xc195bff8)
[    6.133806] bfa0:                                     00000000 0000000=
0 00000000 00000000
[    6.141990] bfc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0 00000000 00000000
[    6.150174] bfe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
[    6.156792]  r5:c0d0167c r4:00000000
[    6.160408] ---[ end trace ab8e425bd50a74a1 ]---
[    6.165270] Checked W+X mappings: FAILED, 1 W+X pages found
[    6.170890] Run /init as init process
[    6.174577]   with arguments:
[    6.174584]     /init
[    6.174591]   with environment:
[    6.174599]     HOME=3D/
[    6.174606]     TERM=3Dlinux
[    6.174612]     log_level=3D7
[    6.992804] gpio_mxc: module verification failed: signature and/or req=
uired key missing - tainting kernel
[    7.040467] v_3v2: supplied by v_5v0
[    7.044181] vcc_3v3: supplied by v_3v2
[    7.060202] v_usb2: supplied by v_5v0
[    7.081024] v_usb1: supplied by v_5v0
[    7.098272] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ran=
ges:
[    7.101211] vdd1p1: supplied by regulator-dummy
[    7.110471] vdd3p0: supplied by regulator-dummy
[    7.119572] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ff=
ff -> 0x0000000000
[    7.122380] libphy: fec_enet_mii_bus: probed
[    7.127778] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efff=
ff -> 0x0001000000
[    7.134435] vdd2p5: supplied by regulator-dummy
[    7.173532] vddarm: supplied by regulator-dummy
[    7.178688] vddpu: supplied by regulator-dummy
[    7.183686] vddsoc: supplied by regulator-dummy
[    7.232179] mdio_bus 2188000.ethernet-1: MDIO device at address 4 is m=
issing.
[    7.260186] v_sd: supplied by v_3v2
[    7.273570] SCSI subsystem initialized
[    7.305525] libata version 3.00 loaded.
[    7.311979] ahci-imx 2200000.sata: fsl,transmit-level-mV value 1025, u=
sing 00000024
[    7.319719] ahci-imx 2200000.sata: fsl,transmit-boost-mdB value 3330, =
using 00000480
[    7.327524] ahci-imx 2200000.sata: fsl,transmit-atten-16ths value 9, u=
sing 00002000
[    7.335227] ahci-imx 2200000.sata: fsl,receive-eq-mdB value 3000, usin=
g 05000000
[    7.361945] ahci-imx 2200000.sata: supply ahci not found, using dummy =
regulator
[    7.369561] ahci-imx 2200000.sata: supply phy not found, using dummy r=
egulator
[    7.372409] sdhci: Secure Digital Host Controller Interface driver
[    7.376989] ahci-imx 2200000.sata: supply target not found, using dumm=
y regulator
[    7.383067] sdhci: Copyright(c) Pierre Ossman
[    7.393166] ahci-imx 2200000.sata: SSS flag set, parallel bus scan dis=
abled
[    7.401437] sdhci-pltfm: SDHCI platform and OF driver helper
[    7.401997] ahci-imx 2200000.sata: AHCI 0001.0300 32 slots 1 ports 3 G=
bps 0x1 impl platform mode
[    7.416386] ahci-imx 2200000.sata: flags: ncq sntf stag pm led clo onl=
y pmp pio slum part ccc apst=20
[    7.434548] scsi host0: ahci-imx
[    7.437898] rtc-pcf8523 0-0068: low voltage detected, time is unreliab=
le
[    7.446738] ata1: SATA max UDMA/133 mmio [mem 0x02200000-0x02203fff] p=
ort 0x100 irq 82
[    7.465218] rtc-pcf8523 0-0068: registered as rtc1
[    7.466410] usbcore: registered new interface driver usbfs
[    7.475851] usbcore: registered new interface driver hub
[    7.481376] usbcore: registered new device driver usb
[    7.493993] sdhci-esdhc-imx 2190000.mmc: allocated mmc-pwrseq
[    7.509403] i2c i2c-0: IMX I2C adapter registered
[    7.511790] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver=

[    7.525729] sdhci-esdhc-imx 2194000.mmc: Got CD GPIO
[    7.527985] i2c i2c-1: IMX I2C adapter registered
[    7.546975] usb_phy_generic usbphynop1: supply vcc not found, using du=
mmy regulator
[    7.555182] usb_phy_generic usbphynop2: supply vcc not found, using du=
mmy regulator
[    7.590986] ci_hdrc ci_hdrc.0: EHCI Host Controller
[    7.597462] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus nu=
mber 1
[    7.621241] mmc1: SDHCI controller on 2194000.mmc [2194000.mmc] using =
ADMA
[    7.628711] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
[    7.635824] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    7.644176] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    7.651430] usb usb1: Product: EHCI Host Controller
[    7.656382] usb usb1: Manufacturer: Linux 5.10.0-7-armmp ehci_hcd
[    7.662523] usb usb1: SerialNumber: ci_hdrc.0
[    7.670136] hub 1-0:1.0: USB hub found
[    7.675254] hub 1-0:1.0: 1 port detected
[    7.690281] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    7.696531] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus nu=
mber 2
[    7.714567] mmc1: host does not support reading read-only switch, assu=
ming write-enable
[    7.723905] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    7.731000] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    7.739386] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    7.746643] usb usb2: Product: EHCI Host Controller
[    7.751550] usb usb2: Manufacturer: Linux 5.10.0-7-armmp ehci_hcd
[    7.757670] usb usb2: SerialNumber: ci_hdrc.1
[    7.763676] mmc1: new high speed SDXC card at address 0001
[    7.771359] hub 2-0:1.0: USB hub found
[    7.777603] mmcblk1: mmc1:0001 00000 59.6 GiB=20
[    7.782565] hub 2-0:1.0: 1 port detected
[    7.792453]  mmcblk1: p1
[    7.824990] mmc0: SDHCI controller on 2190000.mmc [2190000.mmc] using =
ADMA
[    7.932995] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    7.940699] ata1.00: ATA-9: TS32GMSA370, 20140516, max UDMA/133
[    7.946691] ata1.00: 62533296 sectors, multi 1: LBA48 NCQ (depth 32)
[    7.954547] ata1.00: configured for UDMA/133
[    8.124932] usb 2-1: new high-speed USB device number 2 using ci_hdrc
[    8.256928] imx6q-pcie 1ffc000.pcie: Phy link never came up
[    8.265844] imx6q-pcie 1ffc000.pcie: PCI host bridge to bus 0000:00
[    8.272221] pci_bus 0000:00: root bus resource [bus 00-ff]
[    8.277746] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    8.283958] pci_bus 0000:00: root bus resource [mem 0x01000000-0x01eff=
fff]
[    8.290956] pci 0000:00:00.0: [16c3:abcd] type 01 class 0x060400
[    8.297051] pci 0000:00:00.0: reg 0x10: [mem 0x00000000-0x000fffff]
[    8.303378] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pre=
f]
[    8.310134] pci 0000:00:00.0: Limiting cfg_size to 512
[    8.315412] pci 0000:00:00.0: supports D1
[    8.319496] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
[    8.327294] usb 2-1: New USB device found, idVendor=3D04b4, idProduct=3D=
6570, bcdDevice=3D32.99
[    8.331929] PCI: bus0: Fast back to back transfers disabled
[    8.335547] usb 2-1: New USB device strings: Mfr=3D0, Product=3D1, Ser=
ialNumber=3D0
[    8.345881] PCI: bus1: Fast back to back transfers enabled
[    8.348279] usb 2-1: Product: USB2.0 Hub
[    8.353887] pci 0000:00:00.0: BAR 0: assigned [mem 0x01000000-0x010fff=
ff]
[    8.358859] hub 2-1:1.0: USB hub found
[    8.364541] pci 0000:00:00.0: BAR 6: assigned [mem 0x01100000-0x0110ff=
ff pref]
[    8.364553] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
[    8.365126] pcieport 0000:00:00.0: PME: Signaling with IRQ 311
[    8.370972] hub 2-1:1.0: 4 ports detected
[    8.382227] pcieport 0000:00:00.0: AER: enabled with IRQ 311
[    8.398969] scsi 0:0:0:0: Direct-Access     ATA      TS32GMSA370      =
0516 PQ: 0 ANSI: 5
[    8.466092] sd 0:0:0:0: [sda] 62533296 512-byte logical blocks: (32.0 =
GB/29.8 GiB)
[    8.474094] sd 0:0:0:0: [sda] Write Protect is off
[    8.478963] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    8.479384] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enable=
d, doesn't support DPO or FUA
[    8.512980] sd 0:0:0:0: [sda] Attached SCSI disk
[    8.524046] random: fast init done
[    9.029163] EXT4-fs (mmcblk1p1): mounted filesystem with ordered data =
mode. Opts: (null)
[    9.365741] Not activating Mandatory Access Control as /sbin/tomoyo-in=
it does not exist.
[    9.863746] systemd[1]: System time before build time, advancing clock=
=2E
[    9.963825] systemd[1]: Inserted module 'autofs4'
[   10.079555] systemd[1]: systemd 247.3-5 running in system mode. (+PAM =
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCR=
YPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -ID=
N +PCRE2 default-hierarchy=3Dunified)
[   10.102714] systemd[1]: Detected architecture arm.
[   10.138127] systemd[1]: Set hostname to <sr-imx6>.
[   11.138009] systemd[1]: Queued start job for default target Multi-User=
 System.
[   11.146808] random: systemd: uninitialized urandom read (16 bytes read=
)
[   11.159138] systemd[1]: Created slice system-getty.slice.
[   11.181193] random: systemd: uninitialized urandom read (16 bytes read=
)
[   11.189890] systemd[1]: Created slice system-modprobe.slice.
[   11.213123] random: systemd: uninitialized urandom read (16 bytes read=
)
[   11.221868] systemd[1]: Created slice system-serial\x2dgetty.slice.
[   11.246753] systemd[1]: Created slice User and Session Slice.
[   11.269572] systemd[1]: Started Dispatch Password Requests to Console =
Directory Watch.
[   11.293462] systemd[1]: Started Forward Password Requests to Wall Dire=
ctory Watch.
[   11.318360] systemd[1]: Set up automount Arbitrary Executable File For=
mats File System Automount Point.
[   11.345362] systemd[1]: Reached target Local Encrypted Volumes.
[   11.369471] systemd[1]: Reached target Paths.
[   11.385235] systemd[1]: Reached target Remote File Systems.
[   11.405174] systemd[1]: Reached target Slices.
[   11.421361] systemd[1]: Reached target Swap.
[   11.438031] systemd[1]: Listening on fsck to fsckd communication Socke=
t.
[   11.461518] systemd[1]: Listening on initctl Compatibility Named Pipe.=

[   11.486160] systemd[1]: Listening on Journal Audit Socket.
[   11.509958] systemd[1]: Listening on Journal Socket (/dev/log).
[   11.534013] systemd[1]: Listening on Journal Socket.
[   11.560717] systemd[1]: Listening on udev Control Socket.
[   11.581891] systemd[1]: Listening on udev Kernel Socket.
[   11.601982] systemd[1]: Condition check resulted in Huge Pages File Sy=
stem being skipped.
[   11.616056] systemd[1]: Mounting POSIX Message Queue File System...
[   11.643295] systemd[1]: Mounting Kernel Debug File System...
[   11.667718] systemd[1]: Mounting Kernel Trace File System...
[   11.696180] systemd[1]: Starting Create list of static device nodes fo=
r the current kernel...
[   11.728195] systemd[1]: Starting Load Kernel Module configfs...
[   11.755978] systemd[1]: Starting Load Kernel Module drm...
[   11.782029] systemd[1]: Starting Load Kernel Module fuse...
[   11.807917] systemd[1]: Condition check resulted in Set Up Additional =
Binary Formats being skipped.
[   11.817473] systemd[1]: Condition check resulted in File System Check =
on Root Device being skipped.
[   11.841654] systemd[1]: Starting Journal Service...
[   11.860488] fuse: init (API version 7.32)
[   11.885351] systemd[1]: Starting Load Kernel Modules...
[   11.919130] systemd[1]: Starting Remount Root and Kernel File Systems.=
=2E.
[   11.959354] systemd[1]: Starting Coldplug All udev Devices...
[   12.025200] systemd[1]: Mounted POSIX Message Queue File System.
[   12.030455] EXT4-fs (mmcblk1p1): re-mounted. Opts: (null)
[   12.049904] systemd[1]: Mounted Kernel Debug File System.
[   12.074058] systemd[1]: Mounted Kernel Trace File System.
[   12.091534] systemd[1]: Finished Create list of static device nodes fo=
r the current kernel.
[   12.131773] systemd[1]: modprobe@configfs.service: Succeeded.
[   12.143130] systemd[1]: Finished Load Kernel Module configfs.
[   12.171445] systemd[1]: modprobe@drm.service: Succeeded.
[   12.187480] systemd[1]: Finished Load Kernel Module drm.
[   12.219541] systemd[1]: modprobe@fuse.service: Succeeded.
[   12.235092] systemd[1]: Finished Load Kernel Module fuse.
[   12.259916] systemd[1]: Finished Load Kernel Modules.
[   12.283765] systemd[1]: Finished Remount Root and Kernel File Systems.=

[   12.324279] systemd[1]: Mounting FUSE Control File System...
[   12.366804] systemd[1]: Mounting Kernel Configuration File System...
[   12.402602] systemd[1]: Condition check resulted in Rebuild Hardware D=
atabase being skipped.
[   12.411552] systemd[1]: Condition check resulted in Platform Persisten=
t Storage Archival being skipped.
[   12.426957] systemd[1]: Starting Load/Save Random Seed...
[   12.451212] systemd[1]: Starting Apply Kernel Variables...
[   12.480087] systemd[1]: Starting Create System Users...
[   12.507851] systemd[1]: Started Journal Service.
[   12.720971] systemd-journald[176]: Received client request to flush ru=
ntime journal.
[   12.754991] systemd-journald[176]: File /var/log/journal/9bbcae0a3ade4=
af68637450cb7940ea7/system.journal corrupted or uncleanly shut down, rena=
ming and replacing.
[   14.488383] Registered IR keymap rc-empty
[   14.519846] imx-ipuv3 2400000.ipu: IPUv3H probed
[   14.537117] rc rc0: gpio_ir_recv as /devices/platform/ir-receiver/rc/r=
c0
[   14.564692] rc rc0: lirc_dev: driver gpio_ir_recv registered at minor =
=3D 0, raw IR receiver, no transmitter
[   14.585628] imx-ipuv3 2800000.ipu: IPUv3H probed
[   14.634052] input: gpio_ir_recv as /devices/platform/ir-receiver/rc/rc=
0/input0
[   14.725036] rc rc0: two consecutive events of type space
[   14.785167] imx_media_common: module is from the staging directory, th=
e quality is unknown, you have been warned.
[   14.808298] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
[   14.885127] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
[   14.913150] imx6_media: module is from the staging directory, the qual=
ity is unknown, you have been warned.
[   14.923953] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])=

[   14.930569] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[   15.008976] random: crng init done
[   15.014400] random: 7 urandom warning(s) missed due to ratelimiting
[   15.061910] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[   15.076995] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[   15.083315] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[   15.141725] coda 2040000.vpu: firmware: failed to load vpu_fw_imx6q.bi=
n (-2)
[   15.148860] firmware_class: See https://wiki.debian.org/Firmware for i=
nformation about missing firmware
[   15.158384] coda 2040000.vpu: Direct firmware load for vpu_fw_imx6q.bi=
n failed with error -2
[   15.186742] CAN device driver interface
[   15.226649] [drm] Initialized etnaviv 1.3.0 20151214 for etnaviv on mi=
nor 0
[   15.246427] coda 2040000.vpu: firmware: direct-loading firmware vpu/vp=
u_fw_imx6q.bin
[   15.254350] coda 2040000.vpu: Using fallback firmware vpu/vpu_fw_imx6q=
=2Ebin
[   15.274730] coda 2040000.vpu: Firmware code revision: 46076
[   15.280378] coda 2040000.vpu: Initialized CODA960.
[   15.285223] coda 2040000.vpu: Firmware version: 3.1.1
[   15.291967] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops imx=
_drm_exit [imxdrm])
[   15.300471] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops imx=
_drm_exit [imxdrm])
[   15.309700] coda 2040000.vpu: encoder registered as video0
[   15.315613] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops imx=
_drm_exit [imxdrm])
[   15.323903] coda 2040000.vpu: decoder registered as video1
[   15.350147] coda 2040000.vpu: encoder registered as video2
[   15.377312] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops imx=
_drm_exit [imxdrm])
[   15.411721] coda 2040000.vpu: decoder registered as video3
[   15.458987] dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a=
 with HDCP (DWC HDMI 3D TX PHY)
[   15.495675] fsl-ssi-dai 2028000.ssi: No cache defaults, reading back f=
rom HW
[   15.550325] imx-drm display-subsystem: bound 120000.hdmi (ops dw_hdmi_=
imx_ops [dw_hdmi_imx])
[   15.645640] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsy=
stem on minor 1
[   15.665222] imx-drm display-subsystem: [drm] Cannot find any crtc or s=
izes
[   16.100460] platform imx6q-cpufreq: deferred probe pending
[   16.106562] platform 20c8000.anatop:tempmon: deferred probe pending
[   16.330566] imx_thermal 20c8000.anatop:tempmon: Extended Commercial CP=
U temperature grade - max:105C critical:100C passive:95C
[   16.393072] imx6_mipi_csi2: module is from the staging directory, the =
quality is unknown, you have been warned.
[   16.464751] sgtl5000 0-000a: Error reading chip id -6
[   16.891557] tc358743 0-000f: initialized pll_prd =3D 4
[   16.896618] tc358743 0-000f: unsupported bps per lane: 1188000000 bps
[   16.960267] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   17.175326] systemd-journald[176]: Failed to read journal file /var/lo=
g/journal/9bbcae0a3ade4af68637450cb7940ea7/user-1000.journal for rotation=
, trying to move it out of the way: Text file busy
[   17.203559] tc358743 0-000f: pll_prd =3D 4
[   17.207588] tc358743 0-000f: pll_fbd =3D 0
[   17.211539] Division by zero in kernel.
[   17.215415] CPU: 1 PID: 208 Comm: systemd-udevd Tainted: G        WC  =
E     5.10.0-7-armmp #1 Debian 5.10.40-2
[   17.225418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)=

[   17.231947] Backtrace:=20
[   17.234417] [<c0cf1fe8>] (dump_backtrace) from [<c0cf2394>] (show_stac=
k+0x20/0x24)
[   17.241993]  r7:c28c5659 r6:60030013 r5:00000000 r4:c14cdc90
[   17.247662] [<c0cf2374>] (show_stack) from [<c0cf74c4>] (dump_stack+0x=
c8/0xdc)
[   17.254892] [<c0cf73fc>] (dump_stack) from [<c0cf216c>] (__div0+0x24/0=
x28)
[   17.261770]  r7:c28c5659 r6:c28c5504 r5:1a5e0000 r4:c28c5490
[   17.267442] [<c0cf2148>] (__div0) from [<c07b1254>] (Ldiv0+0x8/0x10)
[   17.273844] [<bf4cea34>] (tc358743_num_csi_lanes_needed [tc358743]) fr=
om [<bf4cec3c>] (tc358743_set_csi+0x1c/0x2f8 [tc358743])
[   17.285239]  r7:c28c5659 r6:bf4d2380 r5:c28c55e8 r4:c28c5490
[   17.290929] [<bf4cec20>] (tc358743_set_csi [tc358743]) from [<bf4ccaac=
>] (tc358743_s_dv_timings+0x104/0x1a8 [tc358743])
[   17.301724]  r7:c28c5659 r6:bf4d2380 r5:c28c55e8 r4:c28c5490
[   17.307430] [<bf4cc9a8>] (tc358743_s_dv_timings [tc358743]) from [<bf4=
ce384>] (tc358743_probe+0x93c/0xfec [tc358743])
[   17.318060]  r7:00008502 r6:c28c5574 r5:c28c5490 r4:c28c5440
[   17.323757] [<bf4cda48>] (tc358743_probe [tc358743]) from [<c0a3ace4>]=
 (i2c_device_probe+0x100/0x2e0)
[   17.332987]  r10:00000054 r9:bf4d20a0 r8:00000000 r7:bf4d20a0 r6:c1ae5=
c00 r5:00000000
[   17.340818]  r4:c1ae5c20
[   17.343366] [<c0a3abe4>] (i2c_device_probe) from [<c098b3d8>] (really_=
probe+0x108/0x514)
[   17.351464]  r9:bf4d20a0 r8:00000000 r7:c15ed5a4 r6:00000000 r5:c15ed5=
9c r4:c1ae5c20
[   17.359214] [<c098b2d0>] (really_probe) from [<c098bc88>] (driver_prob=
e_device+0x100/0x1d4)
[   17.367571]  r10:c1404e00 r9:bf4d2140 r8:c0fd4e44 r7:bf4d20a0 r6:c1ae5=
c64 r5:bf4d20a0
[   17.375401]  r4:c1ae5c20
[   17.377944] [<c098bb88>] (driver_probe_device) from [<c098c08c>] (devi=
ce_driver_attach+0xb8/0xc0)
[   17.386822]  r9:bf4d2140 r8:c0fd4e44 r7:bf4d20a0 r6:c1ae5c64 r5:000000=
00 r4:c1ae5c20
[   17.394587] [<c098bfd4>] (device_driver_attach) from [<c098c130>] (__d=
river_attach+0x9c/0x150)
[   17.403207]  r7:c155cff4 r6:c1ae5c20 r5:bf4d20a0 r4:00000000
[   17.408876] [<c098c094>] (__driver_attach) from [<c0988bb8>] (bus_for_=
each_dev+0x84/0xd0)
[   17.417060]  r7:c155cff4 r6:c098c094 r5:bf4d20a0 r4:00000000
[   17.422727] [<c0988b34>] (bus_for_each_dev) from [<c098aaac>] (driver_=
attach+0x2c/0x30)
[   17.430742]  r6:00000000 r5:c2d3cb00 r4:bf4d20a0
[   17.435371] [<c098aa80>] (driver_attach) from [<c098a460>] (bus_add_dr=
iver+0x120/0x20c)
[   17.443382] [<c098a340>] (bus_add_driver) from [<c098cd24>] (driver_re=
gister+0x98/0x128)
[   17.451479]  r7:00000000 r6:bf4d214c r5:00000000 r4:bf4d20a0
[   17.457151] [<c098cc8c>] (driver_register) from [<c0a3a2d8>] (i2c_regi=
ster_driver+0x50/0xd0)
[   17.465593]  r5:c2d3e980 r4:bf4d2084
[   17.469203] [<c0a3a288>] (i2c_register_driver) from [<bf4d5024>] (tc35=
8743_driver_init+0x24/0x1000 [tc358743])
[   17.479208]  r5:c2d3e980 r4:bf4d5000
[   17.482810] [<bf4d5000>] (tc358743_driver_init [tc358743]) from [<c030=
2948>] (do_one_initcall+0x50/0x27c)
[   17.492387] [<c03028f8>] (do_one_initcall) from [<c040e27c>] (do_init_=
module+0x70/0x2a4)
[   17.500482]  r7:bf4d2270 r6:bf4d214c r5:c2d3e980 r4:bf4d2140
[   17.506149] [<c040e20c>] (do_init_module) from [<c04108f8>] (load_modu=
le+0x232c/0x2760)
[   17.514155]  r6:bf4d214c r5:00000000 r4:c2985f30
[   17.518778] [<c040e5cc>] (load_module) from [<c0411014>] (sys_finit_mo=
dule+0xc8/0x12c)
[   17.526703]  r10:0000017b r9:c2984000 r8:c03002c4 r7:0000017b r6:b6f28=
504 r5:00000006
[   17.534533]  r4:00000000
[   17.537078] [<c0410f4c>] (sys_finit_module) from [<c03002a4>] (__sys_t=
race_return+0x0/0x1c)
[   17.545434] Exception stack(0xc2985fa8 to 0xc2985ff0)
[   17.550493] 5fa0:                   b6f29708 00000000 00000006 b6f2850=
4 00000000 b6f2927c
[   17.558677] 5fc0: b6f29708 00000000 cbc85200 0000017b 01cd1370 004c972=
b 01cd2da8 01ccebb8
[   17.566857] 5fe0: bed716e8 bed716d8 b6f22d49 b6e0f4f2
[   17.571913]  r6:cbc85200 r5:00000000 r4:b6f29708
[   17.736927] raid6: neonx8   gen()   613 MB/s
[   17.745874] imx6_media_csi: module is from the staging directory, the =
quality is unknown, you have been warned.
[   17.765646] imx6_media_csi: module is from the staging directory, the =
quality is unknown, you have been warned.
[   17.808914] raid6: neonx8   xor()   489 MB/s
[   17.813414] tc358743 0-000f: tc358743 found @ 0x1e (21a0000.i2c)
[   17.833031] imx6_media_csi: module is from the staging directory, the =
quality is unknown, you have been warned.
[   17.843876] imx6_media_csi: module is from the staging directory, the =
quality is unknown, you have been warned.
[   17.880928] raid6: neonx4   gen()  1506 MB/s
[   17.909235] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video4
[   17.952927] raid6: neonx4   xor()   974 MB/s
[   17.961480] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/=
video5
[   18.024898] raid6: neonx2   gen()  1403 MB/s
[   18.052109] ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as /dev/vi=
deo6
[   18.096914] raid6: neonx2   xor()   949 MB/s
[   18.113013] ipu1_csi1: Registered ipu1_csi1 capture as /dev/video7
[   18.166398] ipu2_csi0: Registered ipu2_csi0 capture as /dev/video8
[   18.168919] raid6: neonx1   gen()  1254 MB/s
[   18.219902] ipu2_ic_prpenc: Registered ipu2_ic_prpenc capture as /dev/=
video9
[   18.244899] raid6: neonx1   xor()   862 MB/s
[   18.284123] ipu2_ic_prpvf: Registered ipu2_ic_prpvf capture as /dev/vi=
deo10
[   18.316941] raid6: int32x8  gen()   283 MB/s
[   18.350464] ipu2_csi1: Registered ipu2_csi1 capture as /dev/video11
[   18.388929] raid6: int32x8  xor()   185 MB/s
[   18.413948] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video12=

[   18.461011] raid6: int32x4  gen()   307 MB/s
[   18.532923] raid6: int32x4  xor()   198 MB/s
[   18.604965] raid6: int32x2  gen()   391 MB/s
[   18.676931] raid6: int32x2  xor()   198 MB/s
[   18.748921] raid6: int32x1  gen()   398 MB/s
[   18.820945] raid6: int32x1  xor()   175 MB/s
[   18.825253] raid6: using algorithm neonx4 gen() 1506 MB/s
[   18.830694] raid6: .... xor() 974 MB/s, rmw enabled
[   18.835608] raid6: using neon recovery algorithm
[   19.631405] xor: measuring software checksum speed
[   19.642821]    arm4regs        :  1529 MB/sec
[   19.655866]    8regs           :  1140 MB/sec
[   19.668500]    32regs          :  1220 MB/sec
[   19.681464]    neon            :  1151 MB/sec
[   19.685844] xor: using function: arm4regs (1529 MB/sec)
[   20.018070] Qualcomm Atheros AR8035 2188000.ethernet-1:00: attached PH=
Y driver [Qualcomm Atheros AR8035] (mii_bus:phy_addr=3D2188000.ethernet-1=
:00, irq=3DPOLL)
[   20.051889] Btrfs loaded, crc32c=3Dcrc32c-generic
[   20.065199] BTRFS: device label ssd devid 1 transid 33605 /dev/sda sca=
nned by systemd-udevd (209)
[   24.125326] fec 2188000.ethernet eth0: Link is Up - 1Gbps/Full - flow =
control rx/tx
[   24.140969] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   37.853014] brcm_reg: disabling

--------------C8E9470D09B2A4C62CE82231--
