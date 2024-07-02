Return-Path: <linux-media+bounces-14535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8692408A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 16:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD561C22EE6
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 14:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CB91BA062;
	Tue,  2 Jul 2024 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEJ3BlSu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD1BE7F
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930176; cv=none; b=YhLoWg+XcbcuXP3GnzL0taTsoDfXhNF6Rgdrc54+5Pcc7d7j4zxaGHkc3oZOA+hVTRhE1VGvZNNpVY/pnOMdVbx8x6w2EA4ewx6ailIkTeKWuaI77woNNsedKaJFka+wJYqpd+1Fa/Pz9ZtfzLHftgR8JcsLtBF84GMO/zIkrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930176; c=relaxed/simple;
	bh=GwzDDEGgVfX6hJttl1neXl6Hooma89o5jnO8GKCWZPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XE+oIwL0c5ISTaIU2wZCzFSo1Dqhxldyneb2jz71r2OByJMgBIeJnamQ9vUdzqLtThjy378HyY3RkMSYneLCPzwotnsds9X9TSzmkzdG18hbBSxw6tAA/MVbC3lrYLWYONxDxeyLoixQ8yKgja4dgjiR1I+oqhiorMGDGGxVGnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEJ3BlSu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1BBC116B1;
	Tue,  2 Jul 2024 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719930175;
	bh=GwzDDEGgVfX6hJttl1neXl6Hooma89o5jnO8GKCWZPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEJ3BlSuH4sndLFls5RFcgpviFciHgc1pYC5Hhiu7vPyr8fJSZc3IV5IEjmA61hdx
	 buSUIwakpg234gw8Sa1fO6OKbHFlP6h8hq7S+/nTYLQnM/QWpS0fvErTWo1WTrQV2Q
	 lnvxvCcKAGRmDSwVmsCFntERtsyFhjXoyW3iMzjF61d5YwjrOGMZJZRB8oKYKXh2go
	 7+olz9gQi+CFc2aoPSb5nU5747qkolPZlDtkz/oOAlw3R6Qmhx3Y+4c9zx+lr/4wku
	 FNl/6hzjr99i1MJU6Qs65acbEhjaGBuksz8RYVY5PY3v3TgGpkTVqZ6E4a+R5pLzB1
	 BhRcOgqJLQHaw==
Date: Tue, 2 Jul 2024 16:22:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	linux-media@vger.kernel.org
Subject: Re: tc358743 EDID / hotplug bug?
Message-ID: <20240702-certain-lion-of-focus-692c12@houat>
References: <20240628-stoic-bettong-of-fortitude-e25611@houat>
 <f780e747-0159-48d5-aef9-2ed324feeae2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="it2ta7rqzbpk6nb3"
Content-Disposition: inline
In-Reply-To: <f780e747-0159-48d5-aef9-2ed324feeae2@xs4all.nl>


--it2ta7rqzbpk6nb3
Content-Type: multipart/mixed; boundary="pjdtt227atrbpttr"
Content-Disposition: inline


--pjdtt227atrbpttr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 01, 2024 at 10:29:55AM GMT, Hans Verkuil wrote:
> Hi Maxime,
>=20
> On 28/06/2024 10:50, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > I've been playing with the unicam driver and the TC358743 HDMI -> CSI
> > bridge recently.
> >=20
> > The program I was testing it with had a (arguably suboptimal) pattern
> > where it would (in a non-blocking way):
> >=20
> > In a loop:
> >   - set EDID
> >   - In a loop:
> >     - call query_dv_timings
> >     - if we have a timing matching the mode we expect:
> >       - break the loop
> >=20
> >   - Call s_dv_timings
> >   - Call s_fmt
> >   - Call reqbufs
> >   - Query and Queue all requested buffers
> >   - Call streamon
> >   - In a loop:
> >     - Dequeue the events
> >     - If there's a resolution change:
> >       - Call streamoff
> >       - Call reqbufs with 0 buffers to clear all buffers
> >       - Restart the entire sequence
> >     - Dequeue a buffer
> >     - Queue it again
> >=20
> > This works mostly fine, but when trying to capture the boot of a device
> > connected on the other end, I'm always getting at some point an
> > resolution change event in the very first iteration.
> >=20
> > The event itself looks fine: there's no remaining events at any point,
> > the sequence is correct, etc. However, this puts the s_edid call super
> > close to streamoff and the next s_edid call.
> >=20
> > And it looks like the tc358743 driver doesn't like that very much and
> > the HPD pin ends up in the wrong state on the next iteration: both the
> > driver itself and the device at the other reports the hotplug pin as
> > being low, and thus, not connected.
> >=20
> > I'm not entirely sure what is the reason, but I suspect a race in:
> > https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/i2c/tc3587=
43.c#L403
> >=20
> > Possibly due to the 100ms delay?
> >=20
> > I've attached a kernel log with debug logs from both v4l2 and the driver
> > enabled.
>=20
> You forgot to attach the logs :-)

Of course I did :)

It should be attached this time

> I don't off-hand see a race condition.

Yeah, me neither. The code looked sane to me, hence that mail.

> But there is an important thing to remember: the HPD is only pulled
> high if the 5V line from the source is also high. I.e., if no source
> is detected, then the HPD remains low.
>
> I don't think you state what the source device is, but make sure it
> has 5V high. If it is low, or it toggles the 5V for some reason, then
> that might be related to the problem. But without logs it is hard to
> tell.

It's a RaspberryPi. I was looking at the register and it doesn't detect
HPD being high, but I'll try to see if I can find a testpoint to read
the level.

Maxime

--pjdtt227atrbpttr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="test-dmesg-output.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 6.1.72-v8+ (dom@buildbot) (aarch64-linux-gnu-g=
cc-8 (Ubuntu/Linaro 8.4.0-3ubuntu1) 8.4.0, GNU ld (GNU Binutils for Ubuntu)=
 2.34) #1717 SMP PREEMPT Thu Jan 11 16:15:12 GMT 2024
[    0.000000] random: crng init done
[    0.000000] Machine model: Raspberry Pi 4 Model B Rev 1.1
[    0.000000] efi: UEFI not found.
[    0.000000] Reserved memory: created CMA memory pool at 0x000000000ec000=
00, size 512 MiB
[    0.000000] OF: reserved mem: initialized node linux,cma, compatible id =
shared-dma-pool
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000003fffffff]
[    0.000000]   DMA32    [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000003b3fffff]
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000007ffff=
fff]
[    0.000000] On node 0, zone DMA32: 19456 pages in unavailable ranges
[    0.000000] percpu: Embedded 29 pages/cpu s79208 r8192 d31384 u118784
[    0.000000] pcpu-alloc: s79208 r8192 d31384 u118784 alloc=3D29*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3=20
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: Spectre-v2
[    0.000000] CPU features: detected: Spectre-v3a
[    0.000000] CPU features: detected: Spectre-v4
[    0.000000] CPU features: detected: Spectre-BHB
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: ARM erratum 1742098
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530=
923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 496944
[    0.000000] Kernel command line: coherent_pool=3D1M 8250.nr_uarts=3D1 sn=
d_bcm2835.enable_headphones=3D0 snd_bcm2835.enable_headphones=3D1 snd_bcm28=
35.enable_hdmi=3D1 snd_bcm2835.enable_hdmi=3D0  smsc95xx.macaddr=3DDC:A6:32=
:10:8D:F7 vc_mem.mem_base=3D0x3ec00000 vc_mem.mem_size=3D0x40000000  consol=
e=3DttyAMA0,115200 root=3DPARTUUID=3D042e3038-ccc8-4c8c-aff4-54b2b6610cee f=
sck.repair=3Dyes rootwait log_buf_len=3D16M tc358743.debug=3D2
[    0.000000] printk: log_buf_len: 16777216 bytes
[    0.000000] printk: early log buf free: 128792(98%)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x0000000037400000-0x000000003b=
400000] (64MB)
[    0.000000] Memory: 1290204K/2019328K available (12224K kernel code, 217=
2K rwdata, 4120K rodata, 4352K init, 1083K bss, 204836K reserved, 524288K c=
ma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
[    0.000000] ftrace: allocating 41384 entries in 162 pages
[    0.000000] ftrace: allocated 162 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=
=3D4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0xc743ce346, max_idle_ns: 440795203123 ns
[    0.000000] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every =
4398046511102ns
[    0.000296] Console: colour dummy device 80x25
[    0.000345] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 108.00 BogoMIPS (lpj=3D216000)
[    0.000361] pid_max: default: 32768 minimum: 301
[    0.000449] LSM: Security Framework initializing
[    0.000608] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,=
 linear)
[    0.000642] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes, linear)
[    0.001562] cgroup: Disabling memory control group subsystem
[    0.002917] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.002925] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.003030] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.003036] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.003134] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.003140] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.003401] rcu: Hierarchical SRCU implementation.
[    0.003407] rcu: 	Max phase no-delay instances is 1000.
[    0.005276] EFI services will not be available.
[    0.005601] smp: Bringing up secondary CPUs ...
[    0.006247] Detected PIPT I-cache on CPU1
[    0.006395] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.007065] Detected PIPT I-cache on CPU2
[    0.007183] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.007839] Detected PIPT I-cache on CPU3
[    0.007959] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.008043] smp: Brought up 1 node, 4 CPUs
[    0.008055] SMP: Total of 4 processors activated.
[    0.008062] CPU features: detected: 32-bit EL0 Support
[    0.008066] CPU features: detected: 32-bit EL1 Support
[    0.008074] CPU features: detected: CRC32 instructions
[    0.008170] CPU: All CPU(s) started at EL2
[    0.008185] alternatives: applying system-wide alternatives
[    0.009629] devtmpfs: initialized
[    0.019555] Enabled cp15_barrier support
[    0.019581] Enabled setend support
[    0.019732] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.019754] futex hash table entries: 1024 (order: 4, 65536 bytes, linea=
r)
[    0.032616] pinctrl core: initialized pinctrl subsystem
[    0.033279] DMI not present or invalid.
[    0.033827] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.035661] DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.035910] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.036371] DMA: preallocated 1024 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.036443] audit: initializing netlink subsys (disabled)
[    0.036606] audit: type=3D2000 audit(0.036:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.037093] thermal_sys: Registered thermal governor 'step_wise'
[    0.037149] cpuidle: using governor menu
[    0.037466] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.037586] ASID allocator initialised with 32768 entries
[    0.038475] Serial: AMBA PL011 UART driver
[    0.045078] bcm2835-mbox fe00b880.mailbox: mailbox enabled
[    0.056112] raspberrypi-firmware soc:firmware: Attached to firmware from=
 2023-10-17T15:39:16, variant start
[    0.060124] raspberrypi-firmware soc:firmware: Firmware hash is 30f0c5e4=
d076da3ab4f341d88e7d505760b93ad7
[    0.069851] KASLR enabled
[    0.097713] bcm2835-dma fe007000.dma: DMA legacy API manager, dmachans=
=3D0x1
[    0.100345] iommu: Default domain type: Translated=20
[    0.100355] iommu: DMA domain TLB invalidation policy: strict mode=20
[    0.100701] SCSI subsystem initialized
[    0.100878] usbcore: registered new interface driver usbfs
[    0.100919] usbcore: registered new interface driver hub
[    0.100954] usbcore: registered new device driver usb
[    0.101107] usb_phy_generic phy: supply vcc not found, using dummy regul=
ator
[    0.101466] pps_core: LinuxPPS API ver. 1 registered
[    0.101473] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.101490] PTP clock support registered
[    0.102371] vgaarb: loaded
[    0.102936] clocksource: Switched to clocksource arch_sys_counter
[    0.103366] VFS: Disk quotas dquot_6.6.0
[    0.103414] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.103504] FS-Cache: Loaded
[    0.103631] CacheFiles: Loaded
[    0.111538] NET: Registered PF_INET protocol family
[    0.112050] IP idents hash table entries: 32768 (order: 6, 262144 bytes,=
 linear)
[    0.114719] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2,=
 16384 bytes, linear)
[    0.114755] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.114775] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes, linear)
[    0.114891] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, =
linear)
[    0.115538] TCP: Hash tables configured (established 16384 bind 16384)
[    0.115873] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes,=
 linear)
[    0.115974] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    0.116015] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, li=
near)
[    0.116214] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.116691] RPC: Registered named UNIX socket transport module.
[    0.116700] RPC: Registered udp transport module.
[    0.116705] RPC: Registered tcp transport module.
[    0.116710] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.116722] PCI: CLS 0 bytes, default 64
[    0.118318] hw perfevents: enabled with armv8_cortex_a72 PMU driver, 7 c=
ounters available
[    0.118593] kvm [1]: IPA Size Limit: 44 bits
[    0.119905] kvm [1]: vgic interrupt IRQ9
[    0.120029] kvm [1]: Hyp mode initialized successfully
[    1.161646] Initialise system trusted keyrings
[    1.162050] workingset: timestamp_bits=3D46 max_order=3D19 bucket_order=
=3D0
[    1.168223] zbud: loaded
[    1.170404] NFS: Registering the id_resolver key type
[    1.170437] Key type id_resolver registered
[    1.170443] Key type id_legacy registered
[    1.170529] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.170537] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Regist=
ering...
[    1.171708] Key type asymmetric registered
[    1.171718] Asymmetric key parser 'x509' registered
[    1.171773] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 247)
[    1.171965] io scheduler mq-deadline registered
[    1.171974] io scheduler kyber registered
[    1.173499] irq_brcmstb_l2: registered L2 intc (/soc/interrupt-controlle=
r@7ef00100, parent irq: 27)
[    1.178336] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 rang=
es:
[    1.178366] brcm-pcie fd500000.pcie:   No bus range found for /scb/pcie@=
7d500000, using [bus 00-ff]
[    1.178404] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x063fffffff=
 -> 0x00c0000000
[    1.178441] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x007fffffff=
 -> 0x0400000000
[    1.178956] brcm-pcie fd500000.pcie: setting SCB_ACCESS_EN, READ_UR_MODE=
, MAX_BURST_SIZE
[    1.179268] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    1.179280] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.179292] pci_bus 0000:00: root bus resource [mem 0x600000000-0x63ffff=
fff] (bus address [0xc0000000-0xffffffff])
[    1.179333] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    1.179425] pci 0000:00:00.0: PME# supported from D0 D3hot
[    1.183217] pci_bus 0000:01: supply vpcie3v3 not found, using dummy regu=
lator
[    1.183348] pci_bus 0000:01: supply vpcie3v3aux not found, using dummy r=
egulator
[    1.183399] pci_bus 0000:01: supply vpcie12v not found, using dummy regu=
lator
[    1.293018] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
[    1.293118] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330
[    1.293211] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    1.293497] pci 0000:01:00.0: PME# supported from D0 D3cold
[    1.303041] pci 0000:00:00.0: BAR 8: assigned [mem 0x600000000-0x6000fff=
ff]
[    1.303059] pci 0000:01:00.0: BAR 0: assigned [mem 0x600000000-0x600000f=
ff 64bit]
[    1.303118] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.303128] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fff=
ff]
[    1.303333] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
[    1.303470] pcieport 0000:00:00.0: PME: Signaling with IRQ 31
[    1.303786] pcieport 0000:00:00.0: AER: enabled with IRQ 31
[    1.311632] Serial: 8250/16550 driver, 1 ports, IRQ sharing enabled
[    1.313409] iproc-rng200 fe104000.rng: hwrng registered
[    1.313666] vc-mem: phys_addr:0x00000000 mem_base=3D0x3ec00000 mem_size:=
0x40000000(1024 MiB)
[    1.324230] brd: module loaded
[    1.330237] loop: module loaded
[    1.330861] Loading iSCSI transport class v2.0-870.
[    1.334717] bcmgenet fd580000.ethernet: GENET 5.0 EPHY: 0x0000
[    1.435009] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
[    1.435848] usbcore: registered new device driver r8152-cfgselector
[    1.435899] usbcore: registered new interface driver r8152
[    1.435952] usbcore: registered new interface driver lan78xx
[    1.435993] usbcore: registered new interface driver smsc95xx
[    1.437404] xhci_hcd 0000:01:00.0: enabling device (0000 -> 0002)
[    1.437474] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.437500] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 1
[    1.438077] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x1=
00 quirks 0x0f00040000000890
[    1.438508] xhci_hcd 0000:01:00.0: xHCI Host Controller
[    1.438522] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus =
number 2
[    1.438537] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[    1.438725] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.01
[    1.438738] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.438748] usb usb1: Product: xHCI Host Controller
[    1.438756] usb usb1: Manufacturer: Linux 6.1.72-v8+ xhci-hcd
[    1.438764] usb usb1: SerialNumber: 0000:01:00.0
[    1.439289] hub 1-0:1.0: USB hub found
[    1.439328] hub 1-0:1.0: 1 port detected
[    1.439924] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.01
[    1.439938] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.439948] usb usb2: Product: xHCI Host Controller
[    1.439956] usb usb2: Manufacturer: Linux 6.1.72-v8+ xhci-hcd
[    1.439963] usb usb2: SerialNumber: 0000:01:00.0
[    1.440387] hub 2-0:1.0: USB hub found
[    1.440446] hub 2-0:1.0: 4 ports detected
[    1.441478] dwc_otg: version 3.00a 10-AUG-2012 (platform bus)
[    1.441589] dwc_otg: FIQ enabled
[    1.441594] dwc_otg: NAK holdoff enabled
[    1.441598] dwc_otg: FIQ split-transaction FSM enabled
[    1.441606] Module dwc_common_port init
[    1.442278] usbcore: registered new interface driver uas
[    1.442355] usbcore: registered new interface driver usb-storage
[    1.442765] mousedev: PS/2 mouse device common for all mice
[    1.446052] sdhci: Secure Digital Host Controller Interface driver
[    1.446063] sdhci: Copyright(c) Pierre Ossman
[    1.446296] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.449008] ledtrig-cpu: registered to indicate activity on CPUs
[    1.449256] hid: raw HID events driver (C) Jiri Kosina
[    1.449376] usbcore: registered new interface driver usbhid
[    1.449409] usbhid: USB HID core driver
[    1.454418] NET: Registered PF_PACKET protocol family
[    1.454501] Key type dns_resolver registered
[    1.455480] registered taskstats version 1
[    1.455527] Loading compiled-in X.509 certificates
[    1.456113] Key type .fscrypt registered
[    1.456121] Key type fscrypt-provisioning registered
[    1.472422] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
[    1.472681] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains =
driver
[    1.473424] mmc-bcm2835 fe300000.mmcnr: mmc_debug:0 mmc_debug2:0
[    1.473436] mmc-bcm2835 fe300000.mmcnr: DMA channel allocated
[    1.499088] uart-pl011 fe201000.serial: there is not valid maps for stat=
e default
[    1.499352] uart-pl011 fe201000.serial: cts_event_workaround enabled
[    1.499442] fe201000.serial: ttyAMA0 at MMIO 0xfe201000 (irq =3D 37, bas=
e_baud =3D 0) is a PL011 rev2
[    1.537764] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc] using =
ADMA
[    1.543875] printk: console [ttyAMA0] enabled
[    1.618771] mmc1: new high speed SDIO card at address 0001
[    1.628751] of_cfs_init
[    1.652698] mmc0: new ultra high speed DDR50 SDHC card at address aaaa
[    1.657341] of_cfs_init: OK
[    1.663045] mmcblk0: mmc0:aaaa SC16G 14.8 GiB=20
[    1.702955] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.714846]  mmcblk0: p1 p2
[    1.941341] usb 1-1: New USB device found, idVendor=3D2109, idProduct=3D=
3431, bcdDevice=3D 4.21
[    1.947955] mmcblk0: mmc0:aaaa SC16G 14.8 GiB (quirks 0x00004000)
[    1.954649] usb 1-1: New USB device strings: Mfr=3D0, Product=3D1, Seria=
lNumber=3D0
[    1.954660] usb 1-1: Product: USB2.0 Hub
[    1.975587] hub 1-1:1.0: USB hub found
[    3.024190] uart-pl011 fe201000.serial: no DMA platform data
[    3.024519] hub 1-1:1.0: 4 ports detected
[    3.054512] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mo=
de. Quota mode: none.
[    3.063153] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    3.075331] devtmpfs: mounted
[    3.085399] Freeing unused kernel memory: 4352K
[    3.090052] Run /sbin/init as init process
[    3.094163]   with arguments:
[    3.094168]     /sbin/init
[    3.094174]   with environment:
[    3.094178]     HOME=3D/
[    3.094184]     TERM=3Dlinux
[    3.481987] systemd[1]: System time before build time, advancing clock.
[    3.656022] NET: Registered PF_INET6 protocol family
[    3.662306] Segment Routing with IPv6
[    3.666024] In-situ OAM (IOAM) with IPv6
[    3.744771] systemd[1]: systemd 252.19-1~deb12u1 running in system mode =
(+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENS=
SL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP=
 +LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB =
+ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[    3.777533] systemd[1]: Detected architecture arm64.
[    3.813637] systemd[1]: Hostname set to <pegasus-ab2f2485>.
[    4.484493] systemd[1]: Queued start job for default target graphical.ta=
rget.
[    4.509897] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[    4.536279] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[    4.560280] systemd[1]: Created slice system-serial\x2dgetty.slice - Sli=
ce /system/serial-getty.
[    4.587856] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    4.611412] systemd[1]: Started systemd-ask-password-console.path - Disp=
atch Password Requests to Console Directory Watch.
[    4.639338] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[    4.667856] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[    4.695184] systemd[1]: Reached target cryptsetup.target - Local Encrypt=
ed Volumes.
[    4.719117] systemd[1]: Reached target integritysetup.target - Local Int=
egrity Protected Volumes.
[    4.743212] systemd[1]: Reached target paths.target - Path Units.
[    4.763099] systemd[1]: Reached target remote-fs.target - Remote File Sy=
stems.
[    4.787093] systemd[1]: Reached target slices.target - Slice Units.
[    4.807113] systemd[1]: Reached target swap.target - Swaps.
[    4.827122] systemd[1]: Reached target veritysetup.target - Local Verity=
 Protected Volumes.
[    4.851664] systemd[1]: Listening on systemd-fsckd.socket - fsck to fsck=
d communication Socket.
[    4.875327] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[    4.900198] systemd[1]: Listening on systemd-journald-audit.socket - Jou=
rnal Audit Socket.
[    4.927811] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[    4.955681] systemd[1]: Listening on systemd-journald.socket - Journal S=
ocket.
[    4.979842] systemd[1]: Listening on systemd-networkd.socket - Network S=
ervice Netlink Socket.
[    5.003782] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[    5.027516] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[    5.051648] systemd[1]: dev-hugepages.mount - Huge Pages File System was=
 skipped because of an unmet condition check (ConditionPathExists=3D/sys/ke=
rnel/mm/hugepages).
[    5.087269] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[    5.115108] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[    5.142850] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[    5.171671] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[    5.199342] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[    5.227284] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel M=
odule dm_mod...
[    5.255531] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[    5.278258] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised:=
 dm-devel@redhat.com
[    5.295458] systemd[1]: Starting modprobe@efi_pstore.service - Load Kern=
el Module efi_pstore...
[    5.323525] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[    5.351683] systemd[1]: Starting modprobe@loop.service - Load Kernel Mod=
ule loop...
[    5.370584] fuse: init (API version 7.37)
[    5.379632] systemd[1]: Starting systemd-fsck-root.service - File System=
 Check on Root Device...
[    5.431659] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[    5.451641] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[    5.464573] systemd[1]: Starting systemd-network-generator.service - Gen=
erate network units from Kernel command line...
[    5.482765] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[    5.507273] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[    5.515994] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[    5.526779] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[    5.538117] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[    5.551377] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    5.560945] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[    5.574040] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    5.583337] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel M=
odule dm_mod.
[    5.641005] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.648427] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[    5.671861] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    6.056023] EXT4-fs (mmcblk0p2): re-mounted. Quota mode: none.
[    6.215922] systemd-journald[143]: Received client request to flush runt=
ime journal.
[    6.231966] systemd-journald[143]: File /var/log/journal/5c608c6b6307425=
a945dbab163cd9e13/system.journal corrupted or uncleanly shut down, renaming=
 and replacing.
[    7.359609] bcmgenet fd580000.ethernet end0: renamed from eth0
[    7.497022] systemd-journald[143]: Oldest entry in /var/log/journal/5c60=
8c6b6307425a945dbab163cd9e13/system.journal is older than the configured fi=
le retention duration (1month), suggesting rotation.
[    7.523011] systemd-journald[143]: /var/log/journal/5c608c6b6307425a945d=
bab163cd9e13/system.journal: Journal header limits reached or header out-of=
-date, rotating.
[    7.654155] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    7.663525] mc: Linux media interface: v0.10
[    7.690408] cfg80211: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0=
e820821ba7b54b4961b8b4fadf'
[    7.700659] cfg80211: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6=
ec146e09d1b6016ab9d6cf71dd233f0328'
[    7.711710] cfg80211: Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff=
06c7248db18c600'
[    7.720955] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    7.727728] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    7.736468] cfg80211: failed to load regulatory.db
[    7.897047] rpi-gpiomem fe200000.gpiomem: window base 0xfe200000 size 0x=
00001000
[    7.898397] vc_sm_cma: module is from the staging directory, the quality=
 is unknown, you have been warned.
[    7.916177] bcm2835_vc_sm_cma_probe: Videocore shared memory driver
[    7.922514] [vc_sm_connected_init]: start
[    7.923031] rpi-gpiomem fe200000.gpiomem: initialised 1 regions as /dev/=
gpiomem
[    7.935214] [vc_sm_connected_init]: installed successfully
[    7.970347] videodev: Linux video capture interface: v2.00
[    8.285888] brcmstb-i2c fef04500.i2c:  @97500hz registered in polling mo=
de
[    8.293791] brcmstb-i2c fef09500.i2c:  @97500hz registered in polling mo=
de
[    8.331494] snd_bcm2835: module is from the staging directory, the quali=
ty is unknown, you have been warned.
[    8.357553] bcm2835_audio bcm2835_audio: card created with 8 channels
[    8.388065] bcm2835_mmal_vchiq: module is from the staging directory, th=
e quality is unknown, you have been warned.
[    8.424819] bcm2835_mmal_vchiq: module is from the staging directory, th=
e quality is unknown, you have been warned.
[    8.429327] bcm2835_mmal_vchiq: module is from the staging directory, th=
e quality is unknown, you have been warned.
[    8.445762] rpivid_hevc: module is from the staging directory, the quali=
ty is unknown, you have been warned.
[    8.496200] rpivid feb10000.codec: Device registered as /dev/video19
[    8.512165] i2c i2c-22: Added multiplexed i2c bus 0
[    8.516388] bcm2835_isp: module is from the staging directory, the quali=
ty is unknown, you have been warned.
[    8.524417] i2c 10-000f: Fixed dependency cycle(s) with /soc/csi@7e80100=
0/port/endpoint
[    8.532168] bcm2835_codec: module is from the staging directory, the qua=
lity is unknown, you have been warned.
[    8.575331] i2c i2c-22: Added multiplexed i2c bus 10
[    8.577380] bcm2835_v4l2: module is from the staging directory, the qual=
ity is unknown, you have been warned.
[    8.604843] brcmfmac: F1 signature read @0x18000000=3D0x15264345
[    8.608830] bcm2835-isp bcm2835-isp: Device node output[0] registered as=
 /dev/video13
[    8.619764] bcmgenet fd580000.ethernet: configuring instance for externa=
l RGMII (RX delay)
[    8.625919] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43455-s=
dio for chip BCM4345/6
[    8.628977] bcm2835-codec bcm2835-codec: Device registered as /dev/video=
10
[    8.640838] bcmgenet fd580000.ethernet end0: Link is Down
[    8.643550] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac=
43455-sdio.raspberrypi,4-model-b.bin failed with error -2
[    8.643606] brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac=
43455-sdio.bin failed with error -2
[    8.644048] usbcore: registered new interface driver brcmfmac
[    8.647420] bcm2835-codec bcm2835-codec: Loaded V4L2 decode
[    8.647898] bcm2835-isp bcm2835-isp: Device node capture[0] registered a=
s /dev/video14
[    8.650226] bcm2835-isp bcm2835-isp: Device node capture[1] registered a=
s /dev/video15
[    8.710550] bcm2835-codec bcm2835-codec: Device registered as /dev/video=
11
[    8.718740] bcm2835-codec bcm2835-codec: Loaded V4L2 encode
[    8.731745] bcm2835-isp bcm2835-isp: Device node stats[2] registered as =
/dev/video16
[    8.736507] [drm] Initialized v3d 1.0.0 20180419 for fec00000.v3d on min=
or 0
[    8.740774] bcm2835-isp bcm2835-isp: Register output node 0 with media c=
ontroller
[    8.755087] bcm2835-isp bcm2835-isp: Register capture node 1 with media =
controller
[    8.763336] bcm2835-isp bcm2835-isp: Register capture node 2 with media =
controller
[    8.774063] bcm2835-isp bcm2835-isp: Register capture node 3 with media =
controller
[    8.784755] bcm2835-codec bcm2835-codec: Device registered as /dev/video=
12
[    8.792668] bcm2835-codec bcm2835-codec: Loaded V4L2 isp
[    8.799088] tc358743 10-000f: chip found @ 0x1e (i2c-22-mux (chan_id 1))
[    8.802762] bcm2835-codec bcm2835-codec: Device registered as /dev/video=
18
[    8.804668] tc358743 10-000f: Consider updating driver tc358743 to match=
 on endpoints
[    8.810636] bcm2835-codec bcm2835-codec: Loaded V4L2 image_fx
[    8.811390] bcm2835-isp bcm2835-isp: Device node output[0] registered as=
 /dev/video20
[    8.818082] bcm2835-isp bcm2835-isp: Device node capture[0] registered a=
s /dev/video21
[    8.840572] bcm2835-isp bcm2835-isp: Device node capture[1] registered a=
s /dev/video22
[    8.851719] bcm2835-isp bcm2835-isp: Device node stats[2] registered as =
/dev/video23
[    8.852327] bcm2835-codec bcm2835-codec: Device registered as /dev/video=
31
[    8.868519] bcm2835-codec bcm2835-codec: Loaded V4L2 encode_image
[    8.868556] bcm2835-isp bcm2835-isp: Register output node 0 with media c=
ontroller
[    8.892322] bcm2835-isp bcm2835-isp: Register capture node 1 with media =
controller
[    8.902046] bcm2835-isp bcm2835-isp: Register capture node 2 with media =
controller
[    8.911684] bcm2835-isp bcm2835-isp: Register capture node 3 with media =
controller
[    8.920586] bcm2835-isp bcm2835-isp: Loaded V4L2 bcm2835-isp
[    8.964219] tc358743 10-000f: tc358743_set_hdmi_hdcp: disable
[    8.982535] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
[    8.990583] Registered IR keymap rc-cec
[    8.993523] tc358743 10-000f: tc358743_s_dv_timings: 640x480p59.94 (800x=
525)
[    8.994622] rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc=
/rc0
[    9.010157] input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/=
rc0/input0
[    9.012044] tc358743 10-000f: tc358743_set_pll:
[    9.024141] tc358743 10-000f: tc358743_set_pll: updating PLL clock
[    9.024583] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
[    9.033741] Registered IR keymap rc-cec
[    9.037827] rc rc1: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc=
/rc1
[    9.045181] input: vc4-hdmi-1 as /devices/platform/soc/fef05700.hdmi/rc/=
rc1/input1
[    9.055843] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
[    9.065703] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
[    9.073903] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [vc=
4])
[    9.082611] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [vc=
4])
[    9.089874] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [vc=
4])
[    9.096452] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[    9.097068] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [vc=
4])
[    9.104341] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops [vc=
4])
[    9.113900] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 1
[    9.120808] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    9.131144] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[    9.134106] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    9.138229] tc358743 10-000f: tc358743 found @ 0x1e (i2c-22-mux (chan_id=
 1))
[    9.147320] vc4-drm gpu: [drm] Cannot find any crtc or sizes
[    9.663991] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkc=
tl 0x50
[    9.759761] FAT-fs (mmcblk0p1): Volume was not properly unmounted. Some =
data may be corrupt. Please run fsck.
[   10.143549] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   11.167620] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   12.191615] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   12.735086] IPv6: ADDRCONF(NETDEV_CHANGE): end0: link becomes ready
[   12.741795] bcmgenet fd580000.ethernet end0: Link is Up - 1Gbps/Full - f=
low control rx/tx
[   13.215622] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   14.239576] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   15.263576] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   16.291584] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   17.315577] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   18.335546] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   19.363571] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   20.383550] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   21.407542] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   22.431532] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   23.455530] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   24.479545] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   25.503534] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   26.527530] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   27.551531] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   28.575560] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   29.599543] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   30.623531] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   31.647539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   32.671549] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   33.695533] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   34.719539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   35.743537] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   36.767537] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   37.791543] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   38.815534] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   39.839533] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   40.863531] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   41.887541] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   42.911539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   43.935539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   44.959536] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   45.983534] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   47.007538] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   48.031549] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   49.055533] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   50.079552] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   51.103547] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   52.127547] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   53.151546] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   54.175552] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   55.199537] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   56.223541] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   57.247544] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   58.271537] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   59.295535] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   60.319531] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   61.343532] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   62.367531] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   63.391529] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   64.415535] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   65.439538] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   66.463557] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   67.487547] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   68.511538] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   69.535537] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   70.559534] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   71.583530] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   72.607548] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   73.631542] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   74.655539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   75.679546] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   76.703538] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   77.727539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   78.751546] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   79.775540] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   80.799541] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   81.823553] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   82.847564] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   83.871570] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   84.895600] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   85.919595] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   86.943611] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[   86.955119] tc358743 10-000f: tc358743_format_change: New format: 640x48=
0p60.00 (800x525)
[   86.964716] tc358743 10-000f: tc358743_hdmi_clk_int_handler: DE size or =
position has changed
[   86.973784] tc358743 10-000f: tc358743_format_change: New format: 640x48=
0p60.00 (800x525)
[   87.967610] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   88.991609] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   89.468325] video0: VIDIOC_QUERYCAP
[   89.468351] video0: VIDIOC_SUBSCRIBE_EVENT
[   89.468365] Starting new Test
[   89.471452] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[   89.471461] tc358743 10-000f: tc358743_disable_edid:
[   89.497332] tc358743 10-000f: tc358743_enable_edid:
[   89.497341] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[   89.499829] video0: VIDIOC_S_EDID
[   89.506410] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   89.513816] video0: VIDIOC_QUERY_DV_TIMINGS
[   89.599006] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
[   89.620469] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   89.627868] video0: VIDIOC_QUERY_DV_TIMINGS
[   89.734518] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   89.741917] video0: VIDIOC_QUERY_DV_TIMINGS
[   89.848566] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   89.855983] video0: VIDIOC_QUERY_DV_TIMINGS
[   89.962633] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   89.970031] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.015612] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   90.076679] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.084079] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.190727] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.198124] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.304770] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.312168] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.418826] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.426253] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.532903] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.540300] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.646949] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.654346] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.760994] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.768391] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.875040] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.882453] video0: VIDIOC_QUERY_DV_TIMINGS
[   90.989102] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   90.996499] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.039611] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   91.103147] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.110543] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.217190] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.224587] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.331237] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.338634] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.445281] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.452678] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.559326] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.566722] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.673368] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.680765] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.787413] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.794809] video0: VIDIOC_QUERY_DV_TIMINGS
[   91.901455] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   91.908862] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.015511] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.022906] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.063616] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   92.129553] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.136949] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.243596] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.250992] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.357638] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.365035] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.471679] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.479090] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.585751] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.593153] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.699804] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.707201] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.813850] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.821246] video0: VIDIOC_QUERY_DV_TIMINGS
[   92.927894] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   92.935310] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.041958] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.049355] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.087622] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   93.156003] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.163399] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.270047] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.277443] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.384093] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.391490] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.498139] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.505535] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.612183] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.619580] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.726228] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.733624] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.840272] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.847682] video0: VIDIOC_QUERY_DV_TIMINGS
[   93.954330] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   93.961725] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.068377] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.075780] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.111630] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   94.182429] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.189826] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.296473] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.303869] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.410523] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.417925] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.524574] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.531992] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.638654] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.646064] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.752733] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.760149] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.866820] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.874277] video0: VIDIOC_QUERY_DV_TIMINGS
[   94.980982] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   94.988429] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.095121] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.102558] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.135649] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   95.209261] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.216708] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.323406] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.330838] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.437539] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.444974] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.551667] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.559190] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.665999] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.673587] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.780309] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.787792] video0: VIDIOC_QUERY_DV_TIMINGS
[   95.894468] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   95.901894] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.008549] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.015949] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.122597] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.129994] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.159640] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   96.236643] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.244041] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.350689] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.358087] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.464734] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.472132] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.578777] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.586201] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.692859] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.700259] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.806903] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.814300] video0: VIDIOC_QUERY_DV_TIMINGS
[   96.920949] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   96.928359] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.035009] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.042408] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.149061] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.156457] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.183643] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   97.263107] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.270504] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.377151] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.384547] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.491197] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.498594] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.605242] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.612638] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.719286] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.726682] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.833328] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.840724] video0: VIDIOC_QUERY_DV_TIMINGS
[   97.947398] tc358743 10-000f: tc358743_query_dv_timings: 640x480p60.00 (=
800x525)
[   97.954810] video0: VIDIOC_QUERY_DV_TIMINGS
[   98.055897] tc358743 10-000f: tc358743_get_detected_timings: no sync on =
signal
[   98.055902] video0: VIDIOC_QUERY_DV_TIMINGS: error -37
[   98.156536] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.156543] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.207649] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[   98.210576] tc358743 10-000f: tc358743_reset_phy:
[   98.214869] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.216353] tc358743 10-000f: tc358743_format_change: No signal
[   98.257168] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.257182] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.357814] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.357821] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.458431] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.458439] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.559065] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.559079] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.659734] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.659748] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.760404] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.760418] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.861070] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.861084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   98.961720] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   98.961729] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.062361] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.062378] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.163029] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.163048] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.231650] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[   99.263663] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.263669] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.364283] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.364289] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.464904] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.464913] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.565541] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.565551] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.666181] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.666187] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.766798] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.766804] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.867417] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.867425] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[   99.968036] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[   99.968042] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.068659] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.068666] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.169279] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.169285] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.255657] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  100.269892] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.269897] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.370504] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.370510] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.471118] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.471124] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.571730] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.571736] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.672342] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.672348] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.772955] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.772961] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.873565] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.873571] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  100.974177] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  100.974184] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.074795] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.074802] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.175412] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.175418] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.276023] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.276029] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.279654] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  101.376636] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.376641] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.477248] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.477254] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.577862] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.577868] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.678474] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.678480] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.779087] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.779093] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.879696] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.879701] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  101.980303] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  101.980310] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.080916] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.080922] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.181527] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.181533] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.282139] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.282145] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.303659] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  102.382751] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.382757] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.483363] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.483369] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.583973] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.583980] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.684588] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.684594] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.785198] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.785204] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.885806] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.885812] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  102.986416] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  102.986422] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.087033] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.087043] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.187688] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.187696] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.288303] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.288310] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.327660] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  103.388942] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.388959] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.489612] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.489620] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.590262] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.590279] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.690933] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.690943] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.791582] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.791591] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.892205] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.892213] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  103.992860] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  103.992877] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.093549] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.093566] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.194213] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.194221] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.294835] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.294841] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.351670] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  104.395454] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.395460] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.496077] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.496084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.596694] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.596700] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.697315] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.697324] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.797946] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.797953] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.898561] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.898567] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  104.999176] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  104.999182] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.099787] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.099793] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.200400] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.200406] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.301013] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.301019] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.375667] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  105.401627] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.401633] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.502241] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.502248] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.602856] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.602862] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.703469] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.703475] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.804081] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.804087] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  105.904690] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  105.904696] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.005300] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.005306] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.105940] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.105945] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.206577] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.206583] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.307215] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.307220] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.399667] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  106.407851] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.407856] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.508488] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.508494] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.609124] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.609130] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.709759] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.709766] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.810398] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.810404] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  106.911032] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  106.911038] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.011714] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.011720] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.112350] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.112355] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.212984] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.212990] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.313620] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.313626] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.414256] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.414262] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.423670] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  107.514890] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.514896] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.615537] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.615547] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.716205] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.716215] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.816872] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.816881] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  107.917529] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  107.917536] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.018170] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.018175] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.118806] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.118811] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.219448] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.219455] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.320096] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.320103] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.420756] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.420770] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.447679] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  108.521450] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.521456] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.622098] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.622104] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.722737] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.722744] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.823378] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.823384] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  108.924016] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  108.924023] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.024658] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.024665] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.125303] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.125308] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.225944] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.225952] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.326601] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.326608] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.427248] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.427255] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.471674] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  109.527893] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.527900] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.628558] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.628572] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.729264] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.729281] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.829985] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.829997] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  109.930657] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  109.930665] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.031311] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.031322] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.131980] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.131989] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.232633] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.232640] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.333274] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.333281] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.433917] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.433924] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.495677] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  110.534713] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.534719] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.635509] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.635519] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.736353] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.736360] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.837151] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.837158] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  110.937959] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  110.937965] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.038775] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.038782] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.139589] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.139597] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.240411] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.240420] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.341250] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.341262] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.442094] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.442101] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.519688] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  111.542899] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.542904] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.643750] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.643760] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.744558] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.744566] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.845365] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.845375] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  111.946188] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  111.946197] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.047015] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.047030] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.147998] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.148013] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.248755] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.248770] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.349450] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.349461] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.450109] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.450115] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.543685] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  112.550741] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.550746] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.651372] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.651379] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.752002] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  112.752007] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  112.853154] tc358743 10-000f: tc358743_get_detected_timings: no sync on =
signal
[  112.853167] video0: VIDIOC_QUERY_DV_TIMINGS: error -37
[  112.954388] tc358743 10-000f: tc358743_get_detected_timings: no sync on =
signal
[  112.954420] video0: VIDIOC_QUERY_DV_TIMINGS: error -37
[  113.061235] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  113.068856] video0: VIDIOC_QUERY_DV_TIMINGS
[  113.068973] tc358743 10-000f: tc358743_s_dv_timings: 1280x720p60.00 (165=
0x750)
[  113.078945] tc358743 10-000f: tc358743_set_pll:
[  113.093337] video0: VIDIOC_S_DV_TIMINGS
[  113.093372] video0: VIDIOC_ENUM_FMT
[  113.093382] video0: VIDIOC_G_FMT
[  113.096073] tc358743 10-000f: tc358743_set_pll:
[  113.110352] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  113.113286] video0: VIDIOC_S_FMT
[  113.113320] video0: VIDIOC_REQBUFS
[  113.113331] video0: VIDIOC_QUERYBUF
[  113.115602] video0: VIDIOC_QUERYBUF
[  113.117446] video0: VIDIOC_QUERYBUF
[  113.119164] video0: VIDIOC_QUERYBUF
[  113.121085] video0: VIDIOC_QUERYBUF
[  113.129270] video0: VIDIOC_STREAMON
[  113.129298] video0: VIDIOC_DQEVENT
[  113.146841] video0: VIDIOC_STREAMOFF
[  113.147587] video0: VIDIOC_REQBUFS
[  113.148663] Starting new Test
[  113.151812] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  113.151824] tc358743 10-000f: tc358743_disable_edid:
[  113.177714] tc358743 10-000f: tc358743_enable_edid:
[  113.177735] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  113.180275] video0: VIDIOC_S_EDID
[  113.186934] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  113.194526] video0: VIDIOC_QUERY_DV_TIMINGS
[  113.194628] video0: VIDIOC_S_DV_TIMINGS
[  113.194642] video0: VIDIOC_ENUM_FMT
[  113.194653] video0: VIDIOC_G_FMT
[  113.197387] tc358743 10-000f: tc358743_set_pll:
[  113.211631] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  113.214532] video0: VIDIOC_S_FMT
[  113.214564] video0: VIDIOC_REQBUFS
[  113.214578] video0: VIDIOC_QUERYBUF
[  113.216274] video0: VIDIOC_QUERYBUF
[  113.217774] video0: VIDIOC_QUERYBUF
[  113.218985] video0: VIDIOC_QUERYBUF
[  113.220377] video0: VIDIOC_QUERYBUF
[  113.228192] video0: VIDIOC_STREAMON
[  113.228223] video0: VIDIOC_DQEVENT: error -2
[  113.233354] video0: VIDIOC_DQEVENT: error -2
[  113.238480] video0: VIDIOC_DQEVENT: error -2
[  113.243591] video0: VIDIOC_DQEVENT: error -2
[  113.251923] video0: VIDIOC_DQEVENT: error -2
[  113.257043] video0: VIDIOC_DQEVENT: error -2
[  113.262165] video0: VIDIOC_DQEVENT: error -2
[  113.270884] video0: VIDIOC_DQEVENT: error -2
[  113.276004] video0: VIDIOC_DQEVENT: error -2
[  113.279098] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
[  113.281130] video0: VIDIOC_DQEVENT: error -2
[  113.287141] video0: VIDIOC_DQEVENT: error -2
[  113.292259] video0: VIDIOC_DQEVENT: error -2
[  113.297375] video0: VIDIOC_DQEVENT: error -2
[  113.303200] video0: VIDIOC_DQEVENT: error -2
[  113.308318] video0: VIDIOC_DQEVENT: error -2
[  113.313451] video0: VIDIOC_DQEVENT: error -2
[  113.319353] video0: VIDIOC_DQEVENT: error -2
[  113.324475] video0: VIDIOC_DQEVENT: error -2
[  113.329608] video0: VIDIOC_DQEVENT: error -2
[  113.334600] video0: VIDIOC_DQEVENT: error -2
[  113.339726] video0: VIDIOC_DQEVENT: error -2
[  113.344860] video0: VIDIOC_DQEVENT: error -2
[  113.350140] video0: VIDIOC_DQEVENT: error -2
[  113.355351] video0: VIDIOC_DQEVENT: error -2
[  113.360572] video0: VIDIOC_DQEVENT: error -2
[  113.365863] video0: VIDIOC_DQEVENT: error -2
[  113.371023] video0: VIDIOC_DQEVENT: error -2
[  113.376189] video0: VIDIOC_DQEVENT: error -2
[  113.381369] video0: VIDIOC_DQEVENT: error -2
[  113.386569] video0: VIDIOC_DQEVENT: error -2
[  113.391812] video0: VIDIOC_DQEVENT: error -2
[  113.397010] video0: VIDIOC_DQEVENT: error -2
[  113.402247] video0: VIDIOC_DQEVENT: error -2
[  113.407500] video0: VIDIOC_DQEVENT: error -2
[  113.412630] video0: VIDIOC_DQEVENT: error -2
[  113.417188] video0: VIDIOC_DQEVENT: error -2
[  113.422313] video0: VIDIOC_DQEVENT: error -2
[  113.427443] video0: VIDIOC_DQEVENT: error -2
[  113.432050] video0: VIDIOC_DQEVENT: error -2
[  113.437167] video0: VIDIOC_DQEVENT: error -2
[  113.442281] video0: VIDIOC_DQEVENT: error -2
[  113.447395] video0: VIDIOC_DQEVENT: error -2
[  113.452005] video0: VIDIOC_DQEVENT: error -2
[  113.457122] video0: VIDIOC_DQEVENT: error -2
[  113.462235] video0: VIDIOC_DQEVENT: error -2
[  113.466843] video0: VIDIOC_DQEVENT: error -2
[  113.471968] video0: VIDIOC_DQEVENT: error -2
[  113.477090] video0: VIDIOC_DQEVENT: error -2
[  113.481697] video0: VIDIOC_DQEVENT: error -2
[  113.486818] video0: VIDIOC_DQEVENT: error -2
[  113.491933] video0: VIDIOC_DQEVENT: error -2
[  113.497046] video0: VIDIOC_DQEVENT: error -2
[  113.501591] video0: VIDIOC_DQEVENT: error -2
[  113.506715] video0: VIDIOC_DQEVENT: error -2
[  113.511843] video0: VIDIOC_DQEVENT: error -2
[  113.516457] video0: VIDIOC_DQEVENT: error -2
[  113.521575] video0: VIDIOC_DQEVENT: error -2
[  113.526689] video0: VIDIOC_DQEVENT: error -2
[  113.531303] video0: VIDIOC_DQEVENT: error -2
[  113.536426] video0: VIDIOC_DQEVENT: error -2
[  113.541551] video0: VIDIOC_DQEVENT: error -2
[  113.546673] video0: VIDIOC_DQEVENT: error -2
[  113.551337] video0: VIDIOC_DQEVENT: error -2
[  113.556456] video0: VIDIOC_DQEVENT: error -2
[  113.561575] video0: VIDIOC_DQEVENT: error -2
[  113.566243] video0: VIDIOC_DQEVENT: error -2
[  113.567703] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[  113.571362] video0: VIDIOC_DQEVENT: error -2
[  113.576481] video0: VIDIOC_DQEVENT: error -2
[  113.577961] tc358743 10-000f: tc358743_format_change: New format: 1280x7=
20p60.00 (1650x750)
[  113.580995] video0: VIDIOC_DQEVENT: error -2
[  113.588036] tc358743 10-000f: tc358743_hdmi_clk_int_handler: DE size or =
position has changed
[  113.591521] video0: VIDIOC_DQEVENT
[  113.600194] tc358743 10-000f: tc358743_format_change: New format: 1280x7=
20p60.00 (1650x750)
[  113.611638] tc358743 10-000f: tc358743_hdmi_sys_int_handler: DVI->HDMI c=
hange detected
[  113.615006] video0: VIDIOC_STREAMOFF
[  113.615883] video0: VIDIOC_REQBUFS
[  113.617642] Starting new Test
[  113.621111] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  113.621126] tc358743 10-000f: tc358743_disable_edid:
[  113.647020] tc358743 10-000f: tc358743_enable_edid:
[  113.647039] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  113.649543] video0: VIDIOC_S_EDID
[  113.656309] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  113.663913] video0: VIDIOC_QUERY_DV_TIMINGS
[  113.663975] video0: VIDIOC_S_DV_TIMINGS
[  113.663989] video0: VIDIOC_ENUM_FMT
[  113.664000] video0: VIDIOC_G_FMT
[  113.666766] tc358743 10-000f: tc358743_set_pll:
[  113.681090] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  113.684015] video0: VIDIOC_S_FMT
[  113.684051] video0: VIDIOC_REQBUFS
[  113.684063] video0: VIDIOC_QUERYBUF
[  113.685683] video0: VIDIOC_QUERYBUF
[  113.687203] video0: VIDIOC_QUERYBUF
[  113.688714] video0: VIDIOC_QUERYBUF
[  113.690018] video0: VIDIOC_QUERYBUF
[  113.697937] video0: VIDIOC_STREAMON
[  113.697966] video0: VIDIOC_DQEVENT
[  113.715418] video0: VIDIOC_STREAMOFF
[  113.716105] video0: VIDIOC_REQBUFS
[  113.717112] Starting new Test
[  113.720221] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  113.720234] tc358743 10-000f: tc358743_disable_edid:
[  113.746129] tc358743 10-000f: tc358743_enable_edid:
[  113.746145] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  113.748665] video0: VIDIOC_S_EDID
[  113.755318] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  113.762908] video0: VIDIOC_QUERY_DV_TIMINGS
[  113.763008] video0: VIDIOC_S_DV_TIMINGS
[  113.763023] video0: VIDIOC_ENUM_FMT
[  113.763034] video0: VIDIOC_G_FMT
[  113.765739] tc358743 10-000f: tc358743_set_pll:
[  113.780087] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  113.783007] video0: VIDIOC_S_FMT
[  113.783045] video0: VIDIOC_REQBUFS
[  113.783057] video0: VIDIOC_QUERYBUF
[  113.784814] video0: VIDIOC_QUERYBUF
[  113.786313] video0: VIDIOC_QUERYBUF
[  113.787634] video0: VIDIOC_QUERYBUF
[  113.788943] video0: VIDIOC_QUERYBUF
[  113.796707] video0: VIDIOC_STREAMON
[  113.796737] video0: VIDIOC_DQEVENT: error -2
[  113.801865] video0: VIDIOC_DQEVENT: error -2
[  113.806990] video0: VIDIOC_DQEVENT: error -2
[  113.812181] video0: VIDIOC_DQEVENT: error -2
[  113.818242] video0: VIDIOC_DQEVENT: error -2
[  113.823406] video0: VIDIOC_DQEVENT: error -2
[  113.828589] video0: VIDIOC_DQEVENT: error -2
[  113.834682] video0: VIDIOC_DQEVENT: error -2
[  113.839848] video0: VIDIOC_DQEVENT: error -2
[  113.845014] video0: VIDIOC_DQEVENT: error -2
[  113.847187] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
[  113.851194] video0: VIDIOC_DQEVENT: error -2
[  113.856361] video0: VIDIOC_DQEVENT: error -2
[  113.861541] video0: VIDIOC_DQEVENT: error -2
[  113.867560] video0: VIDIOC_DQEVENT: error -2
[  113.872723] video0: VIDIOC_DQEVENT: error -2
[  113.877892] video0: VIDIOC_DQEVENT: error -2
[  113.884016] video0: VIDIOC_DQEVENT: error -2
[  113.889178] video0: VIDIOC_DQEVENT: error -2
[  113.894341] video0: VIDIOC_DQEVENT: error -2
[  113.899157] video0: VIDIOC_DQEVENT: error -2
[  113.904326] video0: VIDIOC_DQEVENT: error -2
[  113.909507] video0: VIDIOC_DQEVENT: error -2
[  113.914689] video0: VIDIOC_DQEVENT: error -2
[  113.919540] video0: VIDIOC_DQEVENT: error -2
[  113.924701] video0: VIDIOC_DQEVENT: error -2
[  113.929862] video0: VIDIOC_DQEVENT: error -2
[  113.934783] video0: VIDIOC_DQEVENT: error -2
[  113.939948] video0: VIDIOC_DQEVENT: error -2
[  113.945129] video0: VIDIOC_DQEVENT: error -2
[  113.949870] video0: VIDIOC_DQEVENT: error -2
[  113.955032] video0: VIDIOC_DQEVENT: error -2
[  113.960218] video0: VIDIOC_DQEVENT: error -2
[  113.965018] video0: VIDIOC_DQEVENT: error -2
[  113.970179] video0: VIDIOC_DQEVENT: error -2
[  113.975345] video0: VIDIOC_DQEVENT: error -2
[  113.980495] video0: VIDIOC_DQEVENT: error -2
[  113.985117] video0: VIDIOC_DQEVENT: error -2
[  113.990279] video0: VIDIOC_DQEVENT: error -2
[  113.995444] video0: VIDIOC_DQEVENT: error -2
[  114.000258] video0: VIDIOC_DQEVENT: error -2
[  114.005416] video0: VIDIOC_DQEVENT: error -2
[  114.010594] video0: VIDIOC_DQEVENT: error -2
[  114.015392] video0: VIDIOC_DQEVENT: error -2
[  114.020551] video0: VIDIOC_DQEVENT: error -2
[  114.025718] video0: VIDIOC_DQEVENT: error -2
[  114.030896] video0: VIDIOC_DQEVENT: error -2
[  114.035798] video0: VIDIOC_DQEVENT: error -2
[  114.040964] video0: VIDIOC_DQEVENT: error -2
[  114.046165] video0: VIDIOC_DQEVENT: error -2
[  114.051520] video0: VIDIOC_DQEVENT: error -2
[  114.056723] video0: VIDIOC_DQEVENT: error -2
[  114.061979] video0: VIDIOC_DQEVENT: error -2
[  114.067805] video0: VIDIOC_DQEVENT: error -2
[  114.072995] video0: VIDIOC_DQEVENT: error -2
[  114.078201] video0: VIDIOC_DQEVENT: error -2
[  114.083234] video0: VIDIOC_DQEVENT: error -2
[  114.088406] video0: VIDIOC_DQEVENT: error -2
[  114.093572] video0: VIDIOC_DQEVENT: error -2
[  114.098527] video0: VIDIOC_DQEVENT: error -2
[  114.103704] video0: VIDIOC_DQEVENT: error -2
[  114.108907] video0: VIDIOC_DQEVENT: error -2
[  114.114076] video0: VIDIOC_DQEVENT: error -2
[  114.118897] video0: VIDIOC_DQEVENT: error -2
[  114.124059] video0: VIDIOC_DQEVENT: error -2
[  114.129244] video0: VIDIOC_DQEVENT: error -2
[  114.134333] video0: VIDIOC_DQEVENT: error -2
[  114.139504] video0: VIDIOC_DQEVENT: error -2
[  114.144695] video0: VIDIOC_DQEVENT: error -2
[  114.149369] video0: VIDIOC_DQEVENT: error -2
[  114.154492] video0: VIDIOC_DQEVENT: error -2
[  114.159614] video0: VIDIOC_DQEVENT: error -2
[  114.164745] video0: VIDIOC_DQEVENT: error -2
[  114.169346] video0: VIDIOC_DQEVENT: error -2
[  114.174466] video0: VIDIOC_DQEVENT: error -2
[  114.179582] video0: VIDIOC_DQEVENT: error -2
[  114.184156] video0: VIDIOC_DQEVENT: error -2
[  114.189279] video0: VIDIOC_DQEVENT: error -2
[  114.194400] video0: VIDIOC_DQEVENT: error -2
[  114.198897] video0: VIDIOC_DQEVENT: error -2
[  114.204017] video0: VIDIOC_DQEVENT: error -2
[  114.209128] video0: VIDIOC_DQEVENT: error -2
[  114.214237] video0: VIDIOC_DQEVENT: error -2
[  114.218819] video0: VIDIOC_DQEVENT: error -2
[  114.223946] video0: VIDIOC_DQEVENT: error -2
[  114.229077] video0: VIDIOC_DQEVENT: error -2
[  114.233687] video0: VIDIOC_DQEVENT: error -2
[  114.238807] video0: VIDIOC_DQEVENT: error -2
[  114.243921] video0: VIDIOC_DQEVENT: error -2
[  114.248465] video0: VIDIOC_DQEVENT: error -2
[  114.253587] video0: VIDIOC_DQEVENT: error -2
[  114.258716] video0: VIDIOC_DQEVENT: error -2
[  114.263838] video0: VIDIOC_DQEVENT: error -2
[  114.268398] video0: VIDIOC_DQEVENT: error -2
[  114.273516] video0: VIDIOC_DQEVENT: error -2
[  114.278636] video0: VIDIOC_DQEVENT: error -2
[  114.283397] video0: VIDIOC_DQEVENT: error -2
[  114.288517] video0: VIDIOC_DQEVENT: error -2
[  114.293634] video0: VIDIOC_DQEVENT: error -2
[  114.298199] video0: VIDIOC_DQEVENT: error -2
[  114.303324] video0: VIDIOC_DQEVENT: error -2
[  114.308440] video0: VIDIOC_DQEVENT: error -2
[  114.313546] video0: VIDIOC_DQEVENT: error -2
[  114.318127] video0: VIDIOC_DQEVENT: error -2
[  114.323250] video0: VIDIOC_DQEVENT: error -2
[  114.328374] video0: VIDIOC_DQEVENT: error -2
[  114.332898] video0: VIDIOC_DQEVENT: error -2
[  114.338018] video0: VIDIOC_DQEVENT: error -2
[  114.343134] video0: VIDIOC_DQEVENT: error -2
[  114.347672] video0: VIDIOC_DQEVENT: error -2
[  114.352796] video0: VIDIOC_DQEVENT: error -2
[  114.357932] video0: VIDIOC_DQEVENT: error -2
[  114.363050] video0: VIDIOC_DQEVENT: error -2
[  114.367686] video0: VIDIOC_DQEVENT: error -2
[  114.372813] video0: VIDIOC_DQEVENT: error -2
[  114.377945] video0: VIDIOC_DQEVENT: error -2
[  114.382882] video0: VIDIOC_DQEVENT: error -2
[  114.388009] video0: VIDIOC_DQEVENT: error -2
[  114.393135] video0: VIDIOC_DQEVENT: error -2
[  114.397851] video0: VIDIOC_DQEVENT: error -2
[  114.402983] video0: VIDIOC_DQEVENT: error -2
[  114.408129] video0: VIDIOC_DQEVENT: error -2
[  114.413265] video0: VIDIOC_DQEVENT: error -2
[  114.418018] video0: VIDIOC_DQEVENT: error -2
[  114.423145] video0: VIDIOC_DQEVENT: error -2
[  114.428272] video0: VIDIOC_DQEVENT: error -2
[  114.433010] video0: VIDIOC_DQEVENT: error -2
[  114.438138] video0: VIDIOC_DQEVENT: error -2
[  114.443276] video0: VIDIOC_DQEVENT: error -2
[  114.447958] video0: VIDIOC_DQEVENT: error -2
[  114.453075] video0: VIDIOC_DQEVENT: error -2
[  114.458196] video0: VIDIOC_DQEVENT: error -2
[  114.463312] video0: VIDIOC_DQEVENT: error -2
[  114.468192] video0: VIDIOC_DQEVENT: error -2
[  114.473317] video0: VIDIOC_DQEVENT: error -2
[  114.478442] video0: VIDIOC_DQEVENT: error -2
[  114.483049] video0: VIDIOC_DQEVENT: error -2
[  114.488202] video0: VIDIOC_DQEVENT: error -2
[  114.493334] video0: VIDIOC_DQEVENT: error -2
[  114.497956] video0: VIDIOC_DQEVENT: error -2
[  114.503087] video0: VIDIOC_DQEVENT: error -2
[  114.508202] video0: VIDIOC_DQEVENT: error -2
[  114.513308] video0: VIDIOC_DQEVENT: error -2
[  114.517885] video0: VIDIOC_DQEVENT: error -2
[  114.523005] video0: VIDIOC_DQEVENT: error -2
[  114.528146] video0: VIDIOC_DQEVENT: error -2
[  114.532700] video0: VIDIOC_DQEVENT: error -2
[  114.537819] video0: VIDIOC_DQEVENT: error -2
[  114.542933] video0: VIDIOC_DQEVENT: error -2
[  114.548042] video0: VIDIOC_DQEVENT: error -2
[  114.552719] video0: VIDIOC_DQEVENT: error -2
[  114.557837] video0: VIDIOC_DQEVENT: error -2
[  114.562952] video0: VIDIOC_DQEVENT: error -2
[  114.567530] video0: VIDIOC_DQEVENT: error -2
[  114.572650] video0: VIDIOC_DQEVENT: error -2
[  114.577769] video0: VIDIOC_DQEVENT: error -2
[  114.582488] video0: VIDIOC_DQEVENT: error -2
[  114.587624] video0: VIDIOC_DQEVENT: error -2
[  114.591702] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[  114.592737] video0: VIDIOC_DQEVENT: error -2
[  114.594128] tc358743 10-000f: tc358743_hdmi_cbit_int_handler: Audio pres=
ent changed
[  114.597843] video0: VIDIOC_DQEVENT: error -2
[  114.602441] video0: VIDIOC_DQEVENT: error -2
[  114.607561] video0: VIDIOC_DQEVENT: error -2
[  114.612685] video0: VIDIOC_DQEVENT: error -2
[  114.617287] video0: VIDIOC_DQEVENT: error -2
[  114.622405] video0: VIDIOC_DQEVENT: error -2
[  114.627520] video0: VIDIOC_DQEVENT: error -2
[  114.632115] video0: VIDIOC_DQEVENT: error -2
[  114.637263] video0: VIDIOC_DQEVENT: error -2
[  114.642385] video0: VIDIOC_DQEVENT: error -2
[  114.647494] video0: VIDIOC_DQEVENT: error -2
[  114.652062] video0: VIDIOC_DQEVENT: error -2
[  114.657178] video0: VIDIOC_DQEVENT: error -2
[  114.662293] video0: VIDIOC_DQEVENT: error -2
[  114.666945] video0: VIDIOC_DQEVENT: error -2
[  114.672062] video0: VIDIOC_DQEVENT: error -2
[  114.677177] video0: VIDIOC_DQEVENT: error -2
[  114.681685] video0: VIDIOC_DQEVENT: error -2
[  114.686803] video0: VIDIOC_DQEVENT: error -2
[  114.691921] video0: VIDIOC_DQEVENT: error -2
[  114.697052] video0: VIDIOC_DQEVENT: error -2
[  114.701635] video0: VIDIOC_DQEVENT: error -2
[  114.706753] video0: VIDIOC_DQEVENT: error -2
[  114.711865] video0: VIDIOC_DQEVENT: error -2
[  114.716395] video0: VIDIOC_DQEVENT: error -2
[  114.721520] video0: VIDIOC_DQEVENT: error -2
[  114.726643] video0: VIDIOC_DQEVENT: error -2
[  114.731278] video0: VIDIOC_DQEVENT: error -2
[  114.736397] video0: VIDIOC_DQEVENT: error -2
[  114.741518] video0: VIDIOC_DQEVENT: error -2
[  114.746630] video0: VIDIOC_DQEVENT: error -2
[  114.751334] video0: VIDIOC_DQEVENT: error -2
[  114.756453] video0: VIDIOC_DQEVENT: error -2
[  114.761566] video0: VIDIOC_DQEVENT: error -2
[  114.766118] video0: VIDIOC_DQEVENT: error -2
[  114.771234] video0: VIDIOC_DQEVENT: error -2
[  114.776353] video0: VIDIOC_DQEVENT: error -2
[  114.781475] video0: VIDIOC_DQEVENT: error -2
[  114.786102] video0: VIDIOC_DQEVENT: error -2
[  114.791220] video0: VIDIOC_DQEVENT: error -2
[  114.796334] video0: VIDIOC_DQEVENT: error -2
[  114.800839] video0: VIDIOC_DQEVENT: error -2
[  114.805958] video0: VIDIOC_DQEVENT: error -2
[  114.811087] video0: VIDIOC_DQEVENT: error -2
[  114.815668] video0: VIDIOC_DQEVENT: error -2
[  114.820780] video0: VIDIOC_DQEVENT: error -2
[  114.825889] video0: VIDIOC_DQEVENT: error -2
[  114.830998] video0: VIDIOC_DQEVENT: error -2
[  114.835753] video0: VIDIOC_DQEVENT: error -2
[  114.840877] video0: VIDIOC_DQEVENT: error -2
[  114.845997] video0: VIDIOC_DQEVENT: error -2
[  114.850658] video0: VIDIOC_DQEVENT: error -2
[  114.855774] video0: VIDIOC_DQEVENT: error -2
[  114.860890] video0: VIDIOC_DQEVENT: error -2
[  114.865485] video0: VIDIOC_DQEVENT: error -2
[  114.870601] video0: VIDIOC_DQEVENT: error -2
[  114.875717] video0: VIDIOC_DQEVENT: error -2
[  114.880830] video0: VIDIOC_DQEVENT: error -2
[  114.885404] video0: VIDIOC_DQEVENT: error -2
[  114.890525] video0: VIDIOC_DQEVENT: error -2
[  114.895654] video0: VIDIOC_DQEVENT: error -2
[  114.900275] video0: VIDIOC_DQEVENT: error -2
[  114.905392] video0: VIDIOC_DQEVENT: error -2
[  114.910507] video0: VIDIOC_DQEVENT: error -2
[  114.915057] video0: VIDIOC_DQEVENT: error -2
[  114.920202] video0: VIDIOC_DQEVENT: error -2
[  114.925328] video0: VIDIOC_DQEVENT: error -2
[  114.930450] video0: VIDIOC_DQEVENT: error -2
[  114.935054] video0: VIDIOC_DQEVENT: error -2
[  114.940224] video0: VIDIOC_DQEVENT: error -2
[  114.945340] video0: VIDIOC_DQEVENT: error -2
[  114.949945] video0: VIDIOC_DQEVENT: error -2
[  114.955064] video0: VIDIOC_DQEVENT: error -2
[  114.960195] video0: VIDIOC_DQEVENT: error -2
[  114.964825] video0: VIDIOC_DQEVENT: error -2
[  114.969943] video0: VIDIOC_DQEVENT: error -2
[  114.975060] video0: VIDIOC_DQEVENT: error -2
[  114.980204] video0: VIDIOC_DQEVENT: error -2
[  114.984810] video0: VIDIOC_DQEVENT: error -2
[  114.989928] video0: VIDIOC_DQEVENT: error -2
[  114.995042] video0: VIDIOC_DQEVENT: error -2
[  114.999575] video0: VIDIOC_DQEVENT: error -2
[  115.004693] video0: VIDIOC_DQEVENT: error -2
[  115.009824] video0: VIDIOC_DQEVENT: error -2
[  115.014546] video0: VIDIOC_DQEVENT: error -2
[  115.019683] video0: VIDIOC_DQEVENT: error -2
[  115.024796] video0: VIDIOC_DQEVENT: error -2
[  115.029907] video0: VIDIOC_DQEVENT: error -2
[  115.034561] video0: VIDIOC_DQEVENT: error -2
[  115.039680] video0: VIDIOC_DQEVENT: error -2
[  115.044794] video0: VIDIOC_DQEVENT: error -2
[  115.049365] video0: VIDIOC_DQEVENT: error -2
[  115.054483] video0: VIDIOC_DQEVENT: error -2
[  115.059602] video0: VIDIOC_DQEVENT: error -2
[  115.064729] video0: VIDIOC_DQEVENT: error -2
[  115.069316] video0: VIDIOC_DQEVENT: error -2
[  115.074434] video0: VIDIOC_DQEVENT: error -2
[  115.079549] video0: VIDIOC_DQEVENT: error -2
[  115.084068] video0: VIDIOC_DQEVENT: error -2
[  115.089184] video0: VIDIOC_DQEVENT: error -2
[  115.094310] video0: VIDIOC_DQEVENT: error -2
[  115.098980] video0: VIDIOC_DQEVENT: error -2
[  115.104098] video0: VIDIOC_DQEVENT: error -2
[  115.109212] video0: VIDIOC_DQEVENT: error -2
[  115.114320] video0: VIDIOC_DQEVENT: error -2
[  115.118989] video0: VIDIOC_DQEVENT: error -2
[  115.124112] video0: VIDIOC_DQEVENT: error -2
[  115.129227] video0: VIDIOC_DQEVENT: error -2
[  115.133760] video0: VIDIOC_DQEVENT: error -2
[  115.138880] video0: VIDIOC_DQEVENT: error -2
[  115.144000] video0: VIDIOC_DQEVENT: error -2
[  115.148591] video0: VIDIOC_DQEVENT: error -2
[  115.153707] video0: VIDIOC_DQEVENT: error -2
[  115.158821] video0: VIDIOC_DQEVENT: error -2
[  115.163926] video0: VIDIOC_DQEVENT: error -2
[  115.168448] video0: VIDIOC_DQEVENT: error -2
[  115.173571] video0: VIDIOC_DQEVENT: error -2
[  115.178698] video0: VIDIOC_DQEVENT: error -2
[  115.183344] video0: VIDIOC_DQEVENT: error -2
[  115.188461] video0: VIDIOC_DQEVENT: error -2
[  115.193573] video0: VIDIOC_DQEVENT: error -2
[  115.198135] video0: VIDIOC_DQEVENT: error -2
[  115.203255] video0: VIDIOC_DQEVENT: error -2
[  115.208386] video0: VIDIOC_DQEVENT: error -2
[  115.213508] video0: VIDIOC_DQEVENT: error -2
[  115.218208] video0: VIDIOC_DQEVENT: error -2
[  115.223325] video0: VIDIOC_DQEVENT: error -2
[  115.228442] video0: VIDIOC_DQEVENT: error -2
[  115.233043] video0: VIDIOC_DQEVENT: error -2
[  115.238163] video0: VIDIOC_DQEVENT: error -2
[  115.243280] video0: VIDIOC_DQEVENT: error -2
[  115.247819] video0: VIDIOC_DQEVENT: error -2
[  115.252932] video0: VIDIOC_DQEVENT: error -2
[  115.258050] video0: VIDIOC_DQEVENT: error -2
[  115.263184] video0: VIDIOC_DQEVENT: error -2
[  115.267906] video0: VIDIOC_DQEVENT: error -2
[  115.273017] video0: VIDIOC_DQEVENT: error -2
[  115.278131] video0: VIDIOC_DQEVENT: error -2
[  115.282795] video0: VIDIOC_DQEVENT: error -2
[  115.287915] video0: VIDIOC_DQEVENT: error -2
[  115.293050] video0: VIDIOC_DQEVENT: error -2
[  115.298174] video0: VIDIOC_DQEVENT: error -2
[  115.302856] video0: VIDIOC_DQEVENT: error -2
[  115.307974] video0: VIDIOC_DQEVENT: error -2
[  115.313097] video0: VIDIOC_DQEVENT: error -2
[  115.317786] video0: VIDIOC_DQEVENT: error -2
[  115.322903] video0: VIDIOC_DQEVENT: error -2
[  115.328019] video0: VIDIOC_DQEVENT: error -2
[  115.332556] video0: VIDIOC_DQEVENT: error -2
[  115.337677] video0: VIDIOC_DQEVENT: error -2
[  115.342795] video0: VIDIOC_DQEVENT: error -2
[  115.347920] video0: VIDIOC_DQEVENT: error -2
[  115.352554] video0: VIDIOC_DQEVENT: error -2
[  115.357674] video0: VIDIOC_DQEVENT: error -2
[  115.362789] video0: VIDIOC_DQEVENT: error -2
[  115.367369] video0: VIDIOC_DQEVENT: error -2
[  115.372491] video0: VIDIOC_DQEVENT: error -2
[  115.377618] video0: VIDIOC_DQEVENT: error -2
[  115.382285] video0: VIDIOC_DQEVENT: error -2
[  115.387404] video0: VIDIOC_DQEVENT: error -2
[  115.392518] video0: VIDIOC_DQEVENT: error -2
[  115.397628] video0: VIDIOC_DQEVENT: error -2
[  115.402292] video0: VIDIOC_DQEVENT: error -2
[  115.407413] video0: VIDIOC_DQEVENT: error -2
[  115.412527] video0: VIDIOC_DQEVENT: error -2
[  115.417057] video0: VIDIOC_DQEVENT: error -2
[  115.422175] video0: VIDIOC_DQEVENT: error -2
[  115.427292] video0: VIDIOC_DQEVENT: error -2
[  115.431866] video0: VIDIOC_DQEVENT: error -2
[  115.436981] video0: VIDIOC_DQEVENT: error -2
[  115.442095] video0: VIDIOC_DQEVENT: error -2
[  115.447200] video0: VIDIOC_DQEVENT: error -2
[  115.451740] video0: VIDIOC_DQEVENT: error -2
[  115.456856] video0: VIDIOC_DQEVENT: error -2
[  115.461983] video0: VIDIOC_DQEVENT: error -2
[  115.466663] video0: VIDIOC_DQEVENT: error -2
[  115.471781] video0: VIDIOC_DQEVENT: error -2
[  115.476898] video0: VIDIOC_DQEVENT: error -2
[  115.481422] video0: VIDIOC_DQEVENT: error -2
[  115.486546] video0: VIDIOC_DQEVENT: error -2
[  115.491678] video0: VIDIOC_DQEVENT: error -2
[  115.496800] video0: VIDIOC_DQEVENT: error -2
[  115.501393] video0: VIDIOC_DQEVENT: error -2
[  115.506511] video0: VIDIOC_DQEVENT: error -2
[  115.511623] video0: VIDIOC_DQEVENT: error -2
[  115.516194] video0: VIDIOC_DQEVENT: error -2
[  115.521314] video0: VIDIOC_DQEVENT: error -2
[  115.526435] video0: VIDIOC_DQEVENT: error -2
[  115.531543] video0: VIDIOC_DQEVENT: error -2
[  115.536082] video0: VIDIOC_DQEVENT: error -2
[  115.541198] video0: VIDIOC_DQEVENT: error -2
[  115.546318] video0: VIDIOC_DQEVENT: error -2
[  115.551142] video0: VIDIOC_DQEVENT: error -2
[  115.556255] video0: VIDIOC_DQEVENT: error -2
[  115.561366] video0: VIDIOC_DQEVENT: error -2
[  115.565883] video0: VIDIOC_DQEVENT: error -2
[  115.570998] video0: VIDIOC_DQEVENT: error -2
[  115.576117] video0: VIDIOC_DQEVENT: error -2
[  115.581248] video0: VIDIOC_DQEVENT: error -2
[  115.585906] video0: VIDIOC_DQEVENT: error -2
[  115.591027] video0: VIDIOC_DQEVENT: error -2
[  115.596279] video0: VIDIOC_DQEVENT: error -2
[  115.602648] video0: VIDIOC_DQEVENT: error -2
[  115.608018] video0: VIDIOC_DQEVENT: error -2
[  115.613159] video0: VIDIOC_DQEVENT: error -2
[  115.615781] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  115.619364] video0: VIDIOC_DQEVENT: error -2
[  115.624718] video0: VIDIOC_DQEVENT: error -2
[  115.629846] video0: VIDIOC_DQEVENT: error -2
[  115.635702] video0: VIDIOC_DQEVENT: error -2
[  115.640900] video0: VIDIOC_DQEVENT: error -2
[  115.646019] video0: VIDIOC_DQEVENT: error -2
[  115.651793] video0: VIDIOC_DQEVENT: error -2
[  115.656911] video0: VIDIOC_DQEVENT: error -2
[  115.662033] video0: VIDIOC_DQEVENT: error -2
[  115.667807] video0: VIDIOC_DQEVENT: error -2
[  115.672933] video0: VIDIOC_DQEVENT: error -2
[  115.678067] video0: VIDIOC_DQEVENT: error -2
[  115.682585] video0: VIDIOC_DQEVENT: error -2
[  115.687709] video0: VIDIOC_DQEVENT: error -2
[  115.692990] video0: VIDIOC_DQEVENT: error -2
[  115.698136] video0: VIDIOC_DQEVENT: error -2
[  115.704242] video0: VIDIOC_DQEVENT: error -2
[  115.709448] video0: VIDIOC_DQEVENT: error -2
[  115.714578] video0: VIDIOC_DQEVENT: error -2
[  115.720369] video0: VIDIOC_DQEVENT: error -2
[  115.725573] video0: VIDIOC_DQEVENT: error -2
[  115.730697] video0: VIDIOC_DQEVENT: error -2
[  115.736364] video0: VIDIOC_DQEVENT: error -2
[  115.741567] video0: VIDIOC_DQEVENT: error -2
[  115.746711] video0: VIDIOC_DQEVENT: error -2
[  115.752500] video0: VIDIOC_DQEVENT: error -2
[  115.757619] video0: VIDIOC_DQEVENT: error -2
[  115.762839] video0: VIDIOC_DQEVENT: error -2
[  115.768802] video0: VIDIOC_DQEVENT: error -2
[  115.774044] video0: VIDIOC_DQEVENT: error -2
[  115.779181] video0: VIDIOC_DQEVENT: error -2
[  115.784839] video0: VIDIOC_DQEVENT: error -2
[  115.790036] video0: VIDIOC_DQEVENT: error -2
[  115.795166] video0: VIDIOC_DQEVENT: error -2
[  115.801012] video0: VIDIOC_DQEVENT: error -2
[  115.806132] video0: VIDIOC_DQEVENT: error -2
[  115.811254] video0: VIDIOC_DQEVENT: error -2
[  115.816997] video0: VIDIOC_DQEVENT: error -2
[  115.822123] video0: VIDIOC_DQEVENT: error -2
[  115.827265] video0: VIDIOC_DQEVENT: error -2
[  115.833022] video0: VIDIOC_DQEVENT: error -2
[  115.838263] video0: VIDIOC_DQEVENT: error -2
[  115.843386] video0: VIDIOC_DQEVENT: error -2
[  115.849270] video0: VIDIOC_DQEVENT: error -2
[  115.854514] video0: VIDIOC_DQEVENT: error -2
[  115.859644] video0: VIDIOC_DQEVENT: error -2
[  115.864763] video0: VIDIOC_DQEVENT: error -2
[  115.870422] video0: VIDIOC_DQEVENT: error -2
[  115.875546] video0: VIDIOC_DQEVENT: error -2
[  115.880774] video0: VIDIOC_DQEVENT: error -2
[  115.886536] video0: VIDIOC_DQEVENT: error -2
[  115.891654] video0: VIDIOC_DQEVENT: error -2
[  115.896782] video0: VIDIOC_DQEVENT: error -2
[  115.902640] video0: VIDIOC_DQEVENT: error -2
[  115.907846] video0: VIDIOC_DQEVENT: error -2
[  115.912983] video0: VIDIOC_DQEVENT: error -2
[  115.918704] video0: VIDIOC_DQEVENT: error -2
[  115.923822] video0: VIDIOC_DQEVENT: error -2
[  115.928953] video0: VIDIOC_DQEVENT: error -2
[  115.934853] video0: VIDIOC_DQEVENT: error -2
[  115.940004] video0: VIDIOC_DQEVENT: error -2
[  115.945136] video0: VIDIOC_DQEVENT: error -2
[  115.950796] video0: VIDIOC_DQEVENT: error -2
[  115.955920] video0: VIDIOC_DQEVENT: error -2
[  115.961121] video0: VIDIOC_DQEVENT: error -2
[  115.966847] video0: VIDIOC_DQEVENT: error -2
[  115.972082] video0: VIDIOC_DQEVENT: error -2
[  115.977205] video0: VIDIOC_DQEVENT: error -2
[  115.983134] video0: VIDIOC_DQEVENT: error -2
[  115.988349] video0: VIDIOC_DQEVENT: error -2
[  115.993488] video0: VIDIOC_DQEVENT: error -2
[  115.999216] video0: VIDIOC_DQEVENT: error -2
[  116.004335] video0: VIDIOC_DQEVENT: error -2
[  116.009504] video0: VIDIOC_DQEVENT: error -2
[  116.014643] video0: VIDIOC_DQEVENT: error -2
[  116.020469] video0: VIDIOC_DQEVENT: error -2
[  116.025591] video0: VIDIOC_DQEVENT: error -2
[  116.030716] video0: VIDIOC_DQEVENT: error -2
[  116.036756] video0: VIDIOC_DQEVENT: error -2
[  116.041878] video0: VIDIOC_DQEVENT: error -2
[  116.047011] video0: VIDIOC_DQEVENT: error -2
[  116.052749] video0: VIDIOC_DQEVENT: error -2
[  116.057868] video0: VIDIOC_DQEVENT: error -2
[  116.062995] video0: VIDIOC_DQEVENT: error -2
[  116.067686] video0: VIDIOC_DQEVENT: error -2
[  116.072806] video0: VIDIOC_DQEVENT: error -2
[  116.077923] video0: VIDIOC_DQEVENT: error -2
[  116.082507] video0: VIDIOC_DQEVENT: error -2
[  116.087626] video0: VIDIOC_DQEVENT: error -2
[  116.092749] video0: VIDIOC_DQEVENT: error -2
[  116.097877] video0: VIDIOC_DQEVENT: error -2
[  116.102516] video0: VIDIOC_DQEVENT: error -2
[  116.107635] video0: VIDIOC_DQEVENT: error -2
[  116.112750] video0: VIDIOC_DQEVENT: error -2
[  116.117263] video0: VIDIOC_DQEVENT: error -2
[  116.122383] video0: VIDIOC_DQEVENT: error -2
[  116.127515] video0: VIDIOC_DQEVENT: error -2
[  116.132099] video0: VIDIOC_DQEVENT: error -2
[  116.137211] video0: VIDIOC_DQEVENT: error -2
[  116.142323] video0: VIDIOC_DQEVENT: error -2
[  116.147433] video0: VIDIOC_DQEVENT: error -2
[  116.152038] video0: VIDIOC_DQEVENT: error -2
[  116.157150] video0: VIDIOC_DQEVENT: error -2
[  116.162264] video0: VIDIOC_DQEVENT: error -2
[  116.166866] video0: VIDIOC_DQEVENT: error -2
[  116.171985] video0: VIDIOC_DQEVENT: error -2
[  116.177109] video0: VIDIOC_DQEVENT: error -2
[  116.181773] video0: VIDIOC_DQEVENT: error -2
[  116.186891] video0: VIDIOC_DQEVENT: error -2
[  116.192010] video0: VIDIOC_DQEVENT: error -2
[  116.197118] video0: VIDIOC_DQEVENT: error -2
[  116.201681] video0: VIDIOC_DQEVENT: error -2
[  116.206799] video0: VIDIOC_DQEVENT: error -2
[  116.211921] video0: VIDIOC_DQEVENT: error -2
[  116.216445] video0: VIDIOC_DQEVENT: error -2
[  116.221562] video0: VIDIOC_DQEVENT: error -2
[  116.226676] video0: VIDIOC_DQEVENT: error -2
[  116.231357] video0: VIDIOC_DQEVENT: error -2
[  116.236476] video0: VIDIOC_DQEVENT: error -2
[  116.241598] video0: VIDIOC_DQEVENT: error -2
[  116.246705] video0: VIDIOC_DQEVENT: error -2
[  116.251309] video0: VIDIOC_DQEVENT: error -2
[  116.256426] video0: VIDIOC_DQEVENT: error -2
[  116.261555] video0: VIDIOC_DQEVENT: error -2
[  116.266198] video0: VIDIOC_DQEVENT: error -2
[  116.271317] video0: VIDIOC_DQEVENT: error -2
[  116.276434] video0: VIDIOC_DQEVENT: error -2
[  116.281543] video0: VIDIOC_DQEVENT: error -2
[  116.286199] video0: VIDIOC_DQEVENT: error -2
[  116.291321] video0: VIDIOC_DQEVENT: error -2
[  116.296448] video0: VIDIOC_DQEVENT: error -2
[  116.300978] video0: VIDIOC_DQEVENT: error -2
[  116.306095] video0: VIDIOC_DQEVENT: error -2
[  116.311214] video0: VIDIOC_DQEVENT: error -2
[  116.315761] video0: VIDIOC_DQEVENT: error -2
[  116.320874] video0: VIDIOC_DQEVENT: error -2
[  116.325995] video0: VIDIOC_DQEVENT: error -2
[  116.331105] video0: VIDIOC_DQEVENT: error -2
[  116.335627] video0: VIDIOC_DQEVENT: error -2
[  116.340743] video0: VIDIOC_DQEVENT: error -2
[  116.345867] video0: VIDIOC_DQEVENT: error -2
[  116.350515] video0: VIDIOC_DQEVENT: error -2
[  116.355632] video0: VIDIOC_DQEVENT: error -2
[  116.360747] video0: VIDIOC_DQEVENT: error -2
[  116.365279] video0: VIDIOC_DQEVENT: error -2
[  116.370398] video0: VIDIOC_DQEVENT: error -2
[  116.375525] video0: VIDIOC_DQEVENT: error -2
[  116.380648] video0: VIDIOC_DQEVENT: error -2
[  116.385216] video0: VIDIOC_DQEVENT: error -2
[  116.390333] video0: VIDIOC_DQEVENT: error -2
[  116.395454] video0: VIDIOC_DQEVENT: error -2
[  116.400077] video0: VIDIOC_DQEVENT: error -2
[  116.405194] video0: VIDIOC_DQEVENT: error -2
[  116.410310] video0: VIDIOC_DQEVENT: error -2
[  116.414886] video0: VIDIOC_DQEVENT: error -2
[  116.420007] video0: VIDIOC_DQEVENT: error -2
[  116.425128] video0: VIDIOC_DQEVENT: error -2
[  116.430254] video0: VIDIOC_DQEVENT: error -2
[  116.434924] video0: VIDIOC_DQEVENT: error -2
[  116.440045] video0: VIDIOC_DQEVENT: error -2
[  116.445161] video0: VIDIOC_DQEVENT: error -2
[  116.449704] video0: VIDIOC_DQEVENT: error -2
[  116.454825] video0: VIDIOC_DQEVENT: error -2
[  116.459951] video0: VIDIOC_DQEVENT: error -2
[  116.464493] video0: VIDIOC_DQEVENT: error -2
[  116.469612] video0: VIDIOC_DQEVENT: error -2
[  116.474728] video0: VIDIOC_DQEVENT: error -2
[  116.479842] video0: VIDIOC_DQEVENT: error -2
[  116.484481] video0: VIDIOC_DQEVENT: error -2
[  116.489600] video0: VIDIOC_DQEVENT: error -2
[  116.494717] video0: VIDIOC_DQEVENT: error -2
[  116.499285] video0: VIDIOC_DQEVENT: error -2
[  116.504404] video0: VIDIOC_DQEVENT: error -2
[  116.509570] video0: VIDIOC_DQEVENT: error -2
[  116.514686] video0: VIDIOC_DQEVENT: error -2
[  116.519332] video0: VIDIOC_DQEVENT: error -2
[  116.524447] video0: VIDIOC_DQEVENT: error -2
[  116.529566] video0: VIDIOC_DQEVENT: error -2
[  116.534159] video0: VIDIOC_DQEVENT: error -2
[  116.539282] video0: VIDIOC_DQEVENT: error -2
[  116.544412] video0: VIDIOC_DQEVENT: error -2
[  116.548937] video0: VIDIOC_DQEVENT: error -2
[  116.554056] video0: VIDIOC_DQEVENT: error -2
[  116.559171] video0: VIDIOC_DQEVENT: error -2
[  116.564283] video0: VIDIOC_DQEVENT: error -2
[  116.568951] video0: VIDIOC_DQEVENT: error -2
[  116.574070] video0: VIDIOC_DQEVENT: error -2
[  116.579186] video0: VIDIOC_DQEVENT: error -2
[  116.583685] video0: VIDIOC_DQEVENT: error -2
[  116.588799] video0: VIDIOC_DQEVENT: error -2
[  116.593927] video0: VIDIOC_DQEVENT: error -2
[  116.598626] video0: VIDIOC_DQEVENT: error -2
[  116.603743] video0: VIDIOC_DQEVENT: error -2
[  116.608859] video0: VIDIOC_DQEVENT: error -2
[  116.613971] video0: VIDIOC_DQEVENT: error -2
[  116.618628] video0: VIDIOC_DQEVENT: error -2
[  116.623749] video0: VIDIOC_DQEVENT: error -2
[  116.628874] video0: VIDIOC_DQEVENT: error -2
[  116.633398] video0: VIDIOC_DQEVENT: error -2
[  116.638515] video0: VIDIOC_DQEVENT: error -2
[  116.639699] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  116.643638] video0: VIDIOC_DQEVENT: error -2
[  116.648250] video0: VIDIOC_DQEVENT: error -2
[  116.653368] video0: VIDIOC_DQEVENT: error -2
[  116.658486] video0: VIDIOC_DQEVENT: error -2
[  116.663595] video0: VIDIOC_DQEVENT: error -2
[  116.668114] video0: VIDIOC_DQEVENT: error -2
[  116.673233] video0: VIDIOC_DQEVENT: error -2
[  116.678360] video0: VIDIOC_DQEVENT: error -2
[  116.683019] video0: VIDIOC_DQEVENT: error -2
[  116.688157] video0: VIDIOC_DQEVENT: error -2
[  116.693276] video0: VIDIOC_DQEVENT: error -2
[  116.697806] video0: VIDIOC_DQEVENT: error -2
[  116.702926] video0: VIDIOC_DQEVENT: error -2
[  116.708053] video0: VIDIOC_DQEVENT: error -2
[  116.713175] video0: VIDIOC_DQEVENT: error -2
[  116.717725] video0: VIDIOC_DQEVENT: error -2
[  116.722844] video0: VIDIOC_DQEVENT: error -2
[  116.727964] video0: VIDIOC_DQEVENT: error -2
[  116.732594] video0: VIDIOC_DQEVENT: error -2
[  116.737711] video0: VIDIOC_DQEVENT: error -2
[  116.742828] video0: VIDIOC_DQEVENT: error -2
[  116.747940] video0: VIDIOC_DQEVENT: error -2
[  116.752463] video0: VIDIOC_DQEVENT: error -2
[  116.757584] video0: VIDIOC_DQEVENT: error -2
[  116.762712] video0: VIDIOC_DQEVENT: error -2
[  116.767346] video0: VIDIOC_DQEVENT: error -2
[  116.772462] video0: VIDIOC_DQEVENT: error -2
[  116.777579] video0: VIDIOC_DQEVENT: error -2
[  116.782130] video0: VIDIOC_DQEVENT: error -2
[  116.787250] video0: VIDIOC_DQEVENT: error -2
[  116.792374] video0: VIDIOC_DQEVENT: error -2
[  116.797485] video0: VIDIOC_DQEVENT: error -2
[  116.802064] video0: VIDIOC_DQEVENT: error -2
[  116.807184] video0: VIDIOC_DQEVENT: error -2
[  116.812324] video0: VIDIOC_DQEVENT: error -2
[  116.818241] video0: VIDIOC_DQEVENT: error -2
[  116.823482] video0: VIDIOC_DQEVENT: error -2
[  116.828667] video0: VIDIOC_DQEVENT: error -2
[  116.835705] video0: VIDIOC_DQEVENT: error -2
[  116.840859] video0: VIDIOC_DQEVENT: error -2
[  116.846131] video0: VIDIOC_DQEVENT: error -2
[  116.853175] video0: VIDIOC_DQEVENT: error -2
[  116.858427] video0: VIDIOC_DQEVENT: error -2
[  116.863606] video0: VIDIOC_DQEVENT: error -2
[  116.870423] video0: VIDIOC_DQEVENT: error -2
[  116.875574] video0: VIDIOC_DQEVENT: error -2
[  116.880758] video0: VIDIOC_DQEVENT: error -2
[  116.887605] video0: VIDIOC_DQEVENT: error -2
[  116.892825] video0: VIDIOC_DQEVENT: error -2
[  116.898046] video0: VIDIOC_DQEVENT: error -2
[  116.905415] video0: VIDIOC_DQEVENT: error -2
[  116.910664] video0: VIDIOC_DQEVENT: error -2
[  116.925178] video0: VIDIOC_DQEVENT: error -2
[  116.930327] video0: VIDIOC_DQEVENT: error -2
[  116.937523] video0: VIDIOC_DQEVENT: error -2
[  116.942657] video0: VIDIOC_DQEVENT: error -2
[  116.947891] video0: VIDIOC_DQEVENT: error -2
[  116.954648] video0: VIDIOC_DQEVENT: error -2
[  116.959784] video0: VIDIOC_DQEVENT: error -2
[  116.966851] video0: VIDIOC_DQEVENT: error -2
[  116.972002] video0: VIDIOC_DQEVENT: error -2
[  116.977181] video0: VIDIOC_DQEVENT: error -2
[  116.984000] video0: VIDIOC_DQEVENT: error -2
[  116.989201] video0: VIDIOC_DQEVENT: error -2
[  116.994381] video0: VIDIOC_DQEVENT: error -2
[  117.001475] video0: VIDIOC_DQEVENT: error -2
[  117.006615] video0: VIDIOC_DQEVENT: error -2
[  117.011859] video0: VIDIOC_DQEVENT: error -2
[  117.024200] video0: VIDIOC_DQEVENT: error -2
[  117.029399] video0: VIDIOC_DQEVENT: error -2
[  117.036773] video0: VIDIOC_DQEVENT: error -2
[  117.042030] video0: VIDIOC_DQEVENT: error -2
[  117.047302] video0: VIDIOC_DQEVENT: error -2
[  117.054018] video0: VIDIOC_DQEVENT: error -2
[  117.059170] video0: VIDIOC_DQEVENT: error -2
[  117.064351] video0: VIDIOC_DQEVENT: error -2
[  117.071013] video0: VIDIOC_DQEVENT: error -2
[  117.076151] video0: VIDIOC_DQEVENT: error -2
[  117.081399] video0: VIDIOC_DQEVENT: error -2
[  117.088525] video0: VIDIOC_DQEVENT: error -2
[  117.093663] video0: VIDIOC_DQEVENT: error -2
[  117.100586] video0: VIDIOC_DQEVENT: error -2
[  117.105741] video0: VIDIOC_DQEVENT: error -2
[  117.110924] video0: VIDIOC_DQEVENT: error -2
[  117.120511] video0: VIDIOC_DQEVENT: error -2
[  117.125693] video0: VIDIOC_DQEVENT: error -2
[  117.130891] video0: VIDIOC_DQEVENT: error -2
[  117.137888] video0: VIDIOC_DQEVENT: error -2
[  117.143120] video0: VIDIOC_DQEVENT: error -2
[  117.150222] video0: VIDIOC_DQEVENT: error -2
[  117.155412] video0: VIDIOC_DQEVENT: error -2
[  117.160595] video0: VIDIOC_DQEVENT: error -2
[  117.167361] video0: VIDIOC_DQEVENT: error -2
[  117.172563] video0: VIDIOC_DQEVENT: error -2
[  117.177740] video0: VIDIOC_DQEVENT: error -2
[  117.184698] video0: VIDIOC_DQEVENT: error -2
[  117.189937] video0: VIDIOC_DQEVENT: error -2
[  117.195179] video0: VIDIOC_DQEVENT: error -2
[  117.201893] video0: VIDIOC_DQEVENT: error -2
[  117.207030] video0: VIDIOC_DQEVENT: error -2
[  117.212341] video0: VIDIOC_DQEVENT: error -2
[  117.219684] video0: VIDIOC_DQEVENT: error -2
[  117.224826] video0: VIDIOC_DQEVENT: error -2
[  117.230038] video0: VIDIOC_DQEVENT: error -2
[  117.236336] video0: VIDIOC_DQEVENT: error -2
[  117.241488] video0: VIDIOC_DQEVENT: error -2
[  117.246628] video0: VIDIOC_DQEVENT: error -2
[  117.252897] video0: VIDIOC_DQEVENT: error -2
[  117.258034] video0: VIDIOC_DQEVENT: error -2
[  117.263180] video0: VIDIOC_DQEVENT: error -2
[  117.269018] video0: VIDIOC_DQEVENT: error -2
[  117.274255] video0: VIDIOC_DQEVENT: error -2
[  117.279375] video0: VIDIOC_DQEVENT: error -2
[  117.284970] video0: VIDIOC_DQEVENT: error -2
[  117.290191] video0: VIDIOC_DQEVENT: error -2
[  117.295332] video0: VIDIOC_DQEVENT: error -2
[  117.301093] video0: VIDIOC_DQEVENT: error -2
[  117.306214] video0: VIDIOC_DQEVENT: error -2
[  117.311389] video0: VIDIOC_DQEVENT: error -2
[  117.316180] video0: VIDIOC_DQEVENT: error -2
[  117.321314] video0: VIDIOC_DQEVENT: error -2
[  117.326460] video0: VIDIOC_DQEVENT: error -2
[  117.331193] video0: VIDIOC_DQEVENT: error -2
[  117.336319] video0: VIDIOC_DQEVENT: error -2
[  117.341473] video0: VIDIOC_DQEVENT: error -2
[  117.346641] video0: VIDIOC_DQEVENT: error -2
[  117.351608] video0: VIDIOC_DQEVENT: error -2
[  117.356777] video0: VIDIOC_DQEVENT: error -2
[  117.361995] video0: VIDIOC_DQEVENT: error -2
[  117.367102] video0: VIDIOC_DQEVENT: error -2
[  117.372281] video0: VIDIOC_DQEVENT: error -2
[  117.377504] video0: VIDIOC_DQEVENT: error -2
[  117.382411] video0: VIDIOC_DQEVENT: error -2
[  117.387590] video0: VIDIOC_DQEVENT: error -2
[  117.392939] video0: VIDIOC_DQEVENT: error -2
[  117.400586] video0: VIDIOC_DQEVENT: error -2
[  117.405813] video0: VIDIOC_DQEVENT: error -2
[  117.411070] video0: VIDIOC_DQEVENT: error -2
[  117.419260] video0: VIDIOC_DQEVENT: error -2
[  117.424584] video0: VIDIOC_DQEVENT: error -2
[  117.429921] video0: VIDIOC_DQEVENT: error -2
[  117.442805] video0: VIDIOC_DQEVENT: error -2
[  117.448115] video0: VIDIOC_DQEVENT: error -2
[  117.454611] video0: VIDIOC_DQEVENT: error -2
[  117.459864] video0: VIDIOC_DQEVENT: error -2
[  117.466930] video0: VIDIOC_DQEVENT: error -2
[  117.472310] video0: VIDIOC_DQEVENT: error -2
[  117.477651] video0: VIDIOC_DQEVENT: error -2
[  117.485154] video0: VIDIOC_DQEVENT: error -2
[  117.490448] video0: VIDIOC_DQEVENT: error -2
[  117.495747] video0: VIDIOC_DQEVENT: error -2
[  117.501710] video0: VIDIOC_DQEVENT: error -2
[  117.506887] video0: VIDIOC_DQEVENT: error -2
[  117.512175] video0: VIDIOC_DQEVENT: error -2
[  117.518248] video0: VIDIOC_DQEVENT: error -2
[  117.523421] video0: VIDIOC_DQEVENT: error -2
[  117.528671] video0: VIDIOC_DQEVENT: error -2
[  117.535131] video0: VIDIOC_DQEVENT: error -2
[  117.540423] video0: VIDIOC_DQEVENT: error -2
[  117.545645] video0: VIDIOC_DQEVENT: error -2
[  117.551686] video0: VIDIOC_DQEVENT: error -2
[  117.556862] video0: VIDIOC_DQEVENT: error -2
[  117.562144] video0: VIDIOC_DQEVENT: error -2
[  117.568393] video0: VIDIOC_DQEVENT: error -2
[  117.573670] video0: VIDIOC_DQEVENT: error -2
[  117.578884] video0: VIDIOC_DQEVENT: error -2
[  117.585287] video0: VIDIOC_DQEVENT: error -2
[  117.590504] video0: VIDIOC_DQEVENT: error -2
[  117.595891] video0: VIDIOC_DQEVENT: error -2
[  117.601917] video0: VIDIOC_DQEVENT: error -2
[  117.607134] video0: VIDIOC_DQEVENT: error -2
[  117.612424] video0: VIDIOC_DQEVENT: error -2
[  117.618619] video0: VIDIOC_DQEVENT: error -2
[  117.623899] video0: VIDIOC_DQEVENT: error -2
[  117.629121] video0: VIDIOC_DQEVENT: error -2
[  117.635304] video0: VIDIOC_DQEVENT: error -2
[  117.640485] video0: VIDIOC_DQEVENT: error -2
[  117.645775] video0: VIDIOC_DQEVENT: error -2
[  117.651881] video0: VIDIOC_DQEVENT: error -2
[  117.657049] video0: VIDIOC_DQEVENT: error -2
[  117.662297] video0: VIDIOC_DQEVENT: error -2
[  117.663753] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  117.668584] video0: VIDIOC_DQEVENT: error -2
[  117.673840] video0: VIDIOC_DQEVENT: error -2
[  117.679016] video0: VIDIOC_DQEVENT: error -2
[  117.685425] video0: VIDIOC_DQEVENT: error -2
[  117.690670] video0: VIDIOC_DQEVENT: error -2
[  117.695879] video0: VIDIOC_DQEVENT: error -2
[  117.701877] video0: VIDIOC_DQEVENT: error -2
[  117.707048] video0: VIDIOC_DQEVENT: error -2
[  117.712328] video0: VIDIOC_DQEVENT: error -2
[  117.718421] video0: VIDIOC_DQEVENT: error -2
[  117.723713] video0: VIDIOC_DQEVENT: error -2
[  117.728910] video0: VIDIOC_DQEVENT: error -2
[  117.734777] video0: VIDIOC_DQEVENT: error -2
[  117.740020] video0: VIDIOC_DQEVENT: error -2
[  117.745199] video0: VIDIOC_DQEVENT: error -2
[  117.751262] video0: VIDIOC_DQEVENT: error -2
[  117.756430] video0: VIDIOC_DQEVENT: error -2
[  117.761684] video0: VIDIOC_DQEVENT: error -2
[  117.768066] video0: VIDIOC_DQEVENT: error -2
[  117.773239] video0: VIDIOC_DQEVENT: error -2
[  117.778606] video0: VIDIOC_DQEVENT: error -2
[  117.784565] video0: VIDIOC_DQEVENT: error -2
[  117.789876] video0: VIDIOC_DQEVENT: error -2
[  117.795107] video0: VIDIOC_DQEVENT: error -2
[  117.801361] video0: VIDIOC_DQEVENT: error -2
[  117.806533] video0: VIDIOC_DQEVENT: error -2
[  117.811809] video0: VIDIOC_DQEVENT: error -2
[  117.817688] video0: VIDIOC_DQEVENT: error -2
[  117.822954] video0: VIDIOC_DQEVENT: error -2
[  117.828139] video0: VIDIOC_DQEVENT: error -2
[  117.834241] video0: VIDIOC_DQEVENT: error -2
[  117.839484] video0: VIDIOC_DQEVENT: error -2
[  117.844658] video0: VIDIOC_DQEVENT: error -2
[  117.850539] video0: VIDIOC_DQEVENT: error -2
[  117.855718] video0: VIDIOC_DQEVENT: error -2
[  117.860945] video0: VIDIOC_DQEVENT: error -2
[  117.866884] video0: VIDIOC_DQEVENT: error -2
[  117.872049] video0: VIDIOC_DQEVENT: error -2
[  117.877236] video0: VIDIOC_DQEVENT: error -2
[  117.882684] video0: VIDIOC_DQEVENT: error -2
[  117.887856] video0: VIDIOC_DQEVENT: error -2
[  117.893057] video0: VIDIOC_DQEVENT: error -2
[  117.898235] video0: VIDIOC_DQEVENT: error -2
[  117.903419] video0: VIDIOC_DQEVENT: error -2
[  117.908631] video0: VIDIOC_DQEVENT: error -2
[  117.913877] video0: VIDIOC_DQEVENT: error -2
[  117.919065] video0: VIDIOC_DQEVENT: error -2
[  117.924400] video0: VIDIOC_DQEVENT: error -2
[  117.929557] video0: VIDIOC_DQEVENT: error -2
[  117.934728] video0: VIDIOC_DQEVENT: error -2
[  117.939903] video0: VIDIOC_DQEVENT: error -2
[  117.945131] video0: VIDIOC_DQEVENT: error -2
[  117.950335] video0: VIDIOC_DQEVENT: error -2
[  117.955569] video0: VIDIOC_DQEVENT: error -2
[  117.960754] video0: VIDIOC_DQEVENT: error -2
[  117.965986] video0: VIDIOC_DQEVENT: error -2
[  117.971220] video0: VIDIOC_DQEVENT: error -2
[  117.976437] video0: VIDIOC_DQEVENT: error -2
[  117.981575] video0: VIDIOC_DQEVENT: error -2
[  117.986835] video0: VIDIOC_DQEVENT: error -2
[  117.992066] video0: VIDIOC_DQEVENT: error -2
[  117.997285] video0: VIDIOC_DQEVENT: error -2
[  118.002545] video0: VIDIOC_DQEVENT: error -2
[  118.007750] video0: VIDIOC_DQEVENT: error -2
[  118.012964] video0: VIDIOC_DQEVENT: error -2
[  118.018163] video0: VIDIOC_DQEVENT: error -2
[  118.023402] video0: VIDIOC_DQEVENT: error -2
[  118.028598] video0: VIDIOC_DQEVENT: error -2
[  118.033772] video0: VIDIOC_DQEVENT: error -2
[  118.039006] video0: VIDIOC_DQEVENT: error -2
[  118.044290] video0: VIDIOC_DQEVENT: error -2
[  118.049540] video0: VIDIOC_DQEVENT: error -2
[  118.054754] video0: VIDIOC_DQEVENT: error -2
[  118.059965] video0: VIDIOC_DQEVENT: error -2
[  118.065103] video0: VIDIOC_DQEVENT: error -2
[  118.070332] video0: VIDIOC_DQEVENT: error -2
[  118.075514] video0: VIDIOC_DQEVENT: error -2
[  118.080775] video0: VIDIOC_DQEVENT: error -2
[  118.086455] video0: VIDIOC_DQEVENT: error -2
[  118.091575] video0: VIDIOC_DQEVENT: error -2
[  118.096693] video0: VIDIOC_DQEVENT: error -2
[  118.101251] video0: VIDIOC_DQEVENT: error -2
[  118.106380] video0: VIDIOC_DQEVENT: error -2
[  118.111526] video0: VIDIOC_DQEVENT: error -2
[  118.116162] video0: VIDIOC_DQEVENT: error -2
[  118.121278] video0: VIDIOC_DQEVENT: error -2
[  118.126395] video0: VIDIOC_DQEVENT: error -2
[  118.131520] video0: VIDIOC_DQEVENT: error -2
[  118.136143] video0: VIDIOC_DQEVENT: error -2
[  118.141266] video0: VIDIOC_DQEVENT: error -2
[  118.146394] video0: VIDIOC_DQEVENT: error -2
[  118.150985] video0: VIDIOC_DQEVENT: error -2
[  118.156119] video0: VIDIOC_DQEVENT: error -2
[  118.161270] video0: VIDIOC_DQEVENT: error -2
[  118.165883] video0: VIDIOC_DQEVENT: error -2
[  118.171012] video0: VIDIOC_DQEVENT: error -2
[  118.176164] video0: VIDIOC_DQEVENT: error -2
[  118.181286] video0: VIDIOC_DQEVENT: error -2
[  118.186033] video0: VIDIOC_DQEVENT: error -2
[  118.191152] video0: VIDIOC_DQEVENT: error -2
[  118.196274] video0: VIDIOC_DQEVENT: error -2
[  118.201023] video0: VIDIOC_DQEVENT: error -2
[  118.206144] video0: VIDIOC_DQEVENT: error -2
[  118.211261] video0: VIDIOC_DQEVENT: error -2
[  118.215806] video0: VIDIOC_DQEVENT: error -2
[  118.220927] video0: VIDIOC_DQEVENT: error -2
[  118.226057] video0: VIDIOC_DQEVENT: error -2
[  118.231176] video0: VIDIOC_DQEVENT: error -2
[  118.235774] video0: VIDIOC_DQEVENT: error -2
[  118.240888] video0: VIDIOC_DQEVENT: error -2
[  118.246000] video0: VIDIOC_DQEVENT: error -2
[  118.250744] video0: VIDIOC_DQEVENT: error -2
[  118.255867] video0: VIDIOC_DQEVENT: error -2
[  118.260995] video0: VIDIOC_DQEVENT: error -2
[  118.265606] video0: VIDIOC_DQEVENT: error -2
[  118.270724] video0: VIDIOC_DQEVENT: error -2
[  118.275850] video0: VIDIOC_DQEVENT: error -2
[  118.281002] video0: VIDIOC_DQEVENT: error -2
[  118.286022] video0: VIDIOC_DQEVENT: error -2
[  118.291232] video0: VIDIOC_DQEVENT: error -2
[  118.296477] video0: VIDIOC_DQEVENT: error -2
[  118.301482] video0: VIDIOC_DQEVENT: error -2
[  118.306678] video0: VIDIOC_DQEVENT: error -2
[  118.312187] video0: VIDIOC_DQEVENT: error -2
[  118.317216] video0: VIDIOC_DQEVENT: error -2
[  118.322376] video0: VIDIOC_DQEVENT: error -2
[  118.327546] video0: VIDIOC_DQEVENT: error -2
[  118.332250] video0: VIDIOC_DQEVENT: error -2
[  118.337412] video0: VIDIOC_DQEVENT: error -2
[  118.342600] video0: VIDIOC_DQEVENT: error -2
[  118.347775] video0: VIDIOC_DQEVENT: error -2
[  118.352618] video0: VIDIOC_DQEVENT: error -2
[  118.357818] video0: VIDIOC_DQEVENT: error -2
[  118.363022] video0: VIDIOC_DQEVENT: error -2
[  118.367979] video0: VIDIOC_DQEVENT: error -2
[  118.373193] video0: VIDIOC_DQEVENT: error -2
[  118.378405] video0: VIDIOC_DQEVENT: error -2
[  118.383383] video0: VIDIOC_DQEVENT: error -2
[  118.388592] video0: VIDIOC_DQEVENT: error -2
[  118.393794] video0: VIDIOC_DQEVENT: error -2
[  118.398747] video0: VIDIOC_DQEVENT: error -2
[  118.403955] video0: VIDIOC_DQEVENT: error -2
[  118.409175] video0: VIDIOC_DQEVENT: error -2
[  118.414440] video0: VIDIOC_DQEVENT: error -2
[  118.420141] video0: VIDIOC_DQEVENT: error -2
[  118.425439] video0: VIDIOC_DQEVENT: error -2
[  118.430872] video0: VIDIOC_DQEVENT: error -2
[  118.436578] video0: VIDIOC_DQEVENT: error -2
[  118.441870] video0: VIDIOC_DQEVENT: error -2
[  118.447292] video0: VIDIOC_DQEVENT: error -2
[  118.453013] video0: VIDIOC_DQEVENT: error -2
[  118.458310] video0: VIDIOC_DQEVENT: error -2
[  118.463738] video0: VIDIOC_DQEVENT: error -2
[  118.469347] video0: VIDIOC_DQEVENT: error -2
[  118.474639] video0: VIDIOC_DQEVENT: error -2
[  118.479980] video0: VIDIOC_DQEVENT: error -2
[  118.485705] video0: VIDIOC_DQEVENT: error -2
[  118.490994] video0: VIDIOC_DQEVENT: error -2
[  118.496240] video0: VIDIOC_DQEVENT: error -2
[  118.501188] video0: VIDIOC_DQEVENT: error -2
[  118.506388] video0: VIDIOC_DQEVENT: error -2
[  118.511602] video0: VIDIOC_DQEVENT: error -2
[  118.516838] video0: VIDIOC_DQEVENT: error -2
[  118.522068] video0: VIDIOC_DQEVENT: error -2
[  118.527350] video0: VIDIOC_DQEVENT: error -2
[  118.532605] video0: VIDIOC_DQEVENT: error -2
[  118.537817] video0: VIDIOC_DQEVENT: error -2
[  118.543098] video0: VIDIOC_DQEVENT: error -2
[  118.548152] video0: VIDIOC_DQEVENT: error -2
[  118.553359] video0: VIDIOC_DQEVENT: error -2
[  118.558639] video0: VIDIOC_DQEVENT: error -2
[  118.563908] video0: VIDIOC_DQEVENT: error -2
[  118.569031] video0: VIDIOC_DQEVENT: error -2
[  118.574241] video0: VIDIOC_DQEVENT: error -2
[  118.579527] video0: VIDIOC_DQEVENT: error -2
[  118.584602] video0: VIDIOC_DQEVENT: error -2
[  118.589825] video0: VIDIOC_DQEVENT: error -2
[  118.595147] video0: VIDIOC_DQEVENT: error -2
[  118.601271] video0: VIDIOC_DQEVENT: error -2
[  118.606616] video0: VIDIOC_DQEVENT: error -2
[  118.611913] video0: VIDIOC_DQEVENT: error -2
[  118.618113] video0: VIDIOC_DQEVENT: error -2
[  118.623461] video0: VIDIOC_DQEVENT: error -2
[  118.629202] video0: VIDIOC_DQEVENT: error -2
[  118.633924] video0: VIDIOC_DQEVENT: error -2
[  118.639070] video0: VIDIOC_DQEVENT: error -2
[  118.644314] video0: VIDIOC_DQEVENT: error -2
[  118.649331] video0: VIDIOC_DQEVENT: error -2
[  118.654549] video0: VIDIOC_DQEVENT: error -2
[  118.659728] video0: VIDIOC_DQEVENT: error -2
[  118.667287] video0: VIDIOC_DQEVENT: error -2
[  118.672426] video0: VIDIOC_DQEVENT: error -2
[  118.677656] video0: VIDIOC_DQEVENT: error -2
[  118.685851] video0: VIDIOC_DQEVENT: error -2
[  118.687744] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  118.690993] video0: VIDIOC_DQEVENT: error -2
[  118.696354] video0: VIDIOC_DQEVENT: error -2
[  118.704101] video0: VIDIOC_DQEVENT: error -2
[  118.709235] video0: VIDIOC_DQEVENT: error -2
[  118.714424] video0: VIDIOC_DQEVENT: error -2
[  118.720636] video0: VIDIOC_DQEVENT: error -2
[  118.725939] video0: VIDIOC_DQEVENT: error -2
[  118.731152] video0: VIDIOC_DQEVENT: error -2
[  118.737547] video0: VIDIOC_DQEVENT: error -2
[  118.742672] video0: VIDIOC_DQEVENT: error -2
[  118.747942] video0: VIDIOC_DQEVENT: error -2
[  118.754090] video0: VIDIOC_DQEVENT: error -2
[  118.759211] video0: VIDIOC_DQEVENT: error -2
[  118.764345] video0: VIDIOC_DQEVENT: error -2
[  118.770713] video0: VIDIOC_DQEVENT: error -2
[  118.775880] video0: VIDIOC_DQEVENT: error -2
[  118.781047] video0: VIDIOC_DQEVENT: error -2
[  118.787426] video0: VIDIOC_DQEVENT: error -2
[  118.792551] video0: VIDIOC_DQEVENT: error -2
[  118.797723] video0: VIDIOC_DQEVENT: error -2
[  118.804032] video0: VIDIOC_DQEVENT: error -2
[  118.809306] video0: VIDIOC_DQEVENT: error -2
[  118.814450] video0: VIDIOC_DQEVENT: error -2
[  118.822113] video0: VIDIOC_DQEVENT: error -2
[  118.827241] video0: VIDIOC_DQEVENT: error -2
[  118.833412] video0: VIDIOC_DQEVENT: error -2
[  118.838532] video0: VIDIOC_DQEVENT: error -2
[  118.843672] video0: VIDIOC_DQEVENT: error -2
[  118.850126] video0: VIDIOC_DQEVENT: error -2
[  118.855307] video0: VIDIOC_DQEVENT: error -2
[  118.860481] video0: VIDIOC_DQEVENT: error -2
[  118.866883] video0: VIDIOC_DQEVENT: error -2
[  118.872216] video0: VIDIOC_DQEVENT: error -2
[  118.877513] video0: VIDIOC_DQEVENT: error -2
[  118.883893] video0: VIDIOC_DQEVENT: error -2
[  118.889011] video0: VIDIOC_DQEVENT: error -2
[  118.894143] video0: VIDIOC_DQEVENT: error -2
[  118.900786] video0: VIDIOC_DQEVENT: error -2
[  118.906067] video0: VIDIOC_DQEVENT: error -2
[  118.911205] video0: VIDIOC_DQEVENT: error -2
[  118.919343] video0: VIDIOC_DQEVENT: error -2
[  118.924471] video0: VIDIOC_DQEVENT: error -2
[  118.929630] video0: VIDIOC_DQEVENT: error -2
[  118.935802] video0: VIDIOC_DQEVENT: error -2
[  118.940920] video0: VIDIOC_DQEVENT: error -2
[  118.946077] video0: VIDIOC_DQEVENT: error -2
[  118.952481] video0: VIDIOC_DQEVENT: error -2
[  118.957631] video0: VIDIOC_DQEVENT: error -2
[  118.962822] video0: VIDIOC_DQEVENT: error -2
[  118.968944] video0: VIDIOC_DQEVENT: error -2
[  118.974067] video0: VIDIOC_DQEVENT: error -2
[  118.979197] video0: VIDIOC_DQEVENT: error -2
[  118.985446] video0: VIDIOC_DQEVENT: error -2
[  118.990707] video0: VIDIOC_DQEVENT: error -2
[  118.995869] video0: VIDIOC_DQEVENT: error -2
[  119.002146] video0: VIDIOC_DQEVENT: error -2
[  119.007315] video0: VIDIOC_DQEVENT: error -2
[  119.012493] video0: VIDIOC_DQEVENT: error -2
[  119.018578] video0: VIDIOC_DQEVENT: error -2
[  119.023695] video0: VIDIOC_DQEVENT: error -2
[  119.028822] video0: VIDIOC_DQEVENT: error -2
[  119.035056] video0: VIDIOC_DQEVENT: error -2
[  119.040357] video0: VIDIOC_DQEVENT: error -2
[  119.045550] video0: VIDIOC_DQEVENT: error -2
[  119.053481] video0: VIDIOC_DQEVENT: error -2
[  119.058769] video0: VIDIOC_DQEVENT: error -2
[  119.063982] video0: VIDIOC_DQEVENT: error -2
[  119.071430] video0: VIDIOC_DQEVENT: error -2
[  119.076572] video0: VIDIOC_DQEVENT: error -2
[  119.084216] video0: VIDIOC_DQEVENT: error -2
[  119.089349] video0: VIDIOC_DQEVENT: error -2
[  119.094548] video0: VIDIOC_DQEVENT: error -2
[  119.100750] video0: VIDIOC_DQEVENT: error -2
[  119.105870] video0: VIDIOC_DQEVENT: error -2
[  119.110998] video0: VIDIOC_DQEVENT: error -2
[  119.117414] video0: VIDIOC_DQEVENT: error -2
[  119.122538] video0: VIDIOC_DQEVENT: error -2
[  119.127715] video0: VIDIOC_DQEVENT: error -2
[  119.133831] video0: VIDIOC_DQEVENT: error -2
[  119.138969] video0: VIDIOC_DQEVENT: error -2
[  119.144157] video0: VIDIOC_DQEVENT: error -2
[  119.150550] video0: VIDIOC_DQEVENT: error -2
[  119.155669] video0: VIDIOC_DQEVENT: error -2
[  119.160850] video0: VIDIOC_DQEVENT: error -2
[  119.167284] video0: VIDIOC_DQEVENT: error -2
[  119.172407] video0: VIDIOC_DQEVENT: error -2
[  119.177553] video0: VIDIOC_DQEVENT: error -2
[  119.183743] video0: VIDIOC_DQEVENT: error -2
[  119.188862] video0: VIDIOC_DQEVENT: error -2
[  119.193997] video0: VIDIOC_DQEVENT: error -2
[  119.200436] video0: VIDIOC_DQEVENT: error -2
[  119.205565] video0: VIDIOC_DQEVENT: error -2
[  119.210758] video0: VIDIOC_DQEVENT: error -2
[  119.216895] video0: VIDIOC_DQEVENT: error -2
[  119.222028] video0: VIDIOC_DQEVENT: error -2
[  119.227213] video0: VIDIOC_DQEVENT: error -2
[  119.233453] video0: VIDIOC_DQEVENT: error -2
[  119.238571] video0: VIDIOC_DQEVENT: error -2
[  119.243697] video0: VIDIOC_DQEVENT: error -2
[  119.250334] video0: VIDIOC_DQEVENT: error -2
[  119.255466] video0: VIDIOC_DQEVENT: error -2
[  119.260632] video0: VIDIOC_DQEVENT: error -2
[  119.266905] video0: VIDIOC_DQEVENT: error -2
[  119.272029] video0: VIDIOC_DQEVENT: error -2
[  119.277251] video0: VIDIOC_DQEVENT: error -2
[  119.283718] video0: VIDIOC_DQEVENT: error -2
[  119.289021] video0: VIDIOC_DQEVENT: error -2
[  119.294210] video0: VIDIOC_DQEVENT: error -2
[  119.300035] video0: VIDIOC_DQEVENT: error -2
[  119.305155] video0: VIDIOC_DQEVENT: error -2
[  119.310269] video0: VIDIOC_DQEVENT: error -2
[  119.315096] video0: VIDIOC_DQEVENT: error -2
[  119.320215] video0: VIDIOC_DQEVENT: error -2
[  119.325333] video0: VIDIOC_DQEVENT: error -2
[  119.330475] video0: VIDIOC_DQEVENT: error -2
[  119.336837] video0: VIDIOC_DQEVENT: error -2
[  119.342017] video0: VIDIOC_DQEVENT: error -2
[  119.347218] video0: VIDIOC_DQEVENT: error -2
[  119.353776] video0: VIDIOC_DQEVENT: error -2
[  119.358949] video0: VIDIOC_DQEVENT: error -2
[  119.364081] video0: VIDIOC_DQEVENT: error -2
[  119.370459] video0: VIDIOC_DQEVENT: error -2
[  119.375581] video0: VIDIOC_DQEVENT: error -2
[  119.380710] video0: VIDIOC_DQEVENT: error -2
[  119.385355] video0: VIDIOC_DQEVENT: error -2
[  119.390474] video0: VIDIOC_DQEVENT: error -2
[  119.395610] video0: VIDIOC_DQEVENT: error -2
[  119.400228] video0: VIDIOC_DQEVENT: error -2
[  119.405355] video0: VIDIOC_DQEVENT: error -2
[  119.410488] video0: VIDIOC_DQEVENT: error -2
[  119.414986] video0: VIDIOC_DQEVENT: error -2
[  119.420105] video0: VIDIOC_DQEVENT: error -2
[  119.425211] video0: VIDIOC_DQEVENT: error -2
[  119.430308] video0: VIDIOC_DQEVENT: error -2
[  119.434814] video0: VIDIOC_DQEVENT: error -2
[  119.439932] video0: VIDIOC_DQEVENT: error -2
[  119.445059] video0: VIDIOC_DQEVENT: error -2
[  119.449680] video0: VIDIOC_DQEVENT: error -2
[  119.454797] video0: VIDIOC_DQEVENT: error -2
[  119.459927] video0: VIDIOC_DQEVENT: error -2
[  119.464527] video0: VIDIOC_DQEVENT: error -2
[  119.469642] video0: VIDIOC_DQEVENT: error -2
[  119.474762] video0: VIDIOC_DQEVENT: error -2
[  119.479894] video0: VIDIOC_DQEVENT: error -2
[  119.484396] video0: VIDIOC_DQEVENT: error -2
[  119.489518] video0: VIDIOC_DQEVENT: error -2
[  119.494639] video0: VIDIOC_DQEVENT: error -2
[  119.499186] video0: VIDIOC_DQEVENT: error -2
[  119.504298] video0: VIDIOC_DQEVENT: error -2
[  119.509421] video0: VIDIOC_DQEVENT: error -2
[  119.514563] video0: VIDIOC_DQEVENT: error -2
[  119.519104] video0: VIDIOC_DQEVENT: error -2
[  119.524224] video0: VIDIOC_DQEVENT: error -2
[  119.529358] video0: VIDIOC_DQEVENT: error -2
[  119.534288] video0: VIDIOC_DQEVENT: error -2
[  119.539440] video0: VIDIOC_DQEVENT: error -2
[  119.544578] video0: VIDIOC_DQEVENT: error -2
[  119.549616] video0: VIDIOC_DQEVENT: error -2
[  119.554814] video0: VIDIOC_DQEVENT: error -2
[  119.559985] video0: VIDIOC_DQEVENT: error -2
[  119.564700] video0: VIDIOC_DQEVENT: error -2
[  119.569854] video0: VIDIOC_DQEVENT: error -2
[  119.574955] video0: VIDIOC_DQEVENT: error -2
[  119.580050] video0: VIDIOC_DQEVENT: error -2
[  119.584722] video0: VIDIOC_DQEVENT: error -2
[  119.589860] video0: VIDIOC_DQEVENT: error -2
[  119.594961] video0: VIDIOC_DQEVENT: error -2
[  119.599542] video0: VIDIOC_DQEVENT: error -2
[  119.604696] video0: VIDIOC_DQEVENT: error -2
[  119.609795] video0: VIDIOC_DQEVENT: error -2
[  119.614887] video0: VIDIOC_DQEVENT: error -2
[  119.619479] video0: VIDIOC_DQEVENT: error -2
[  119.624641] video0: VIDIOC_DQEVENT: error -2
[  119.629744] video0: VIDIOC_DQEVENT: error -2
[  119.634351] video0: VIDIOC_DQEVENT: error -2
[  119.639507] video0: VIDIOC_DQEVENT: error -2
[  119.644608] video0: VIDIOC_DQEVENT: error -2
[  119.649412] video0: VIDIOC_DQEVENT: error -2
[  119.654559] video0: VIDIOC_DQEVENT: error -2
[  119.659705] video0: VIDIOC_DQEVENT: error -2
[  119.664812] video0: VIDIOC_DQEVENT: error -2
[  119.669460] video0: VIDIOC_DQEVENT: error -2
[  119.674599] video0: VIDIOC_DQEVENT: error -2
[  119.679704] video0: VIDIOC_DQEVENT: error -2
[  119.684284] video0: VIDIOC_DQEVENT: error -2
[  119.689417] video0: VIDIOC_DQEVENT: error -2
[  119.694518] video0: VIDIOC_DQEVENT: error -2
[  119.699137] video0: VIDIOC_DQEVENT: error -2
[  119.704266] video0: VIDIOC_DQEVENT: error -2
[  119.709366] video0: VIDIOC_DQEVENT: error -2
[  119.711696] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  119.714462] video0: VIDIOC_DQEVENT: error -2
[  119.719067] video0: VIDIOC_DQEVENT: error -2
[  119.724217] video0: VIDIOC_DQEVENT: error -2
[  119.729320] video0: VIDIOC_DQEVENT: error -2
[  119.733908] video0: VIDIOC_DQEVENT: error -2
[  119.739039] video0: VIDIOC_DQEVENT: error -2
[  119.744183] video0: VIDIOC_DQEVENT: error -2
[  119.749106] video0: VIDIOC_DQEVENT: error -2
[  119.754336] video0: VIDIOC_DQEVENT: error -2
[  119.759459] video0: VIDIOC_DQEVENT: error -2
[  119.764555] video0: VIDIOC_DQEVENT: error -2
[  119.769125] video0: VIDIOC_DQEVENT: error -2
[  119.774258] video0: VIDIOC_DQEVENT: error -2
[  119.779363] video0: VIDIOC_DQEVENT: error -2
[  119.783945] video0: VIDIOC_DQEVENT: error -2
[  119.789077] video0: VIDIOC_DQEVENT: error -2
[  119.794179] video0: VIDIOC_DQEVENT: error -2
[  119.798838] video0: VIDIOC_DQEVENT: error -2
[  119.803983] video0: VIDIOC_DQEVENT: error -2
[  119.809086] video0: VIDIOC_DQEVENT: error -2
[  119.814180] video0: VIDIOC_DQEVENT: error -2
[  119.818941] video0: VIDIOC_DQEVENT: error -2
[  119.824068] video0: VIDIOC_DQEVENT: error -2
[  119.829181] video0: VIDIOC_DQEVENT: error -2
[  119.834010] video0: VIDIOC_DQEVENT: error -2
[  119.839155] video0: VIDIOC_DQEVENT: error -2
[  119.844268] video0: VIDIOC_DQEVENT: error -2
[  119.849062] video0: VIDIOC_DQEVENT: error -2
[  119.854186] video0: VIDIOC_DQEVENT: error -2
[  119.859305] video0: VIDIOC_DQEVENT: error -2
[  119.864424] video0: VIDIOC_DQEVENT: error -2
[  119.869255] video0: VIDIOC_DQEVENT: error -2
[  119.874394] video0: VIDIOC_DQEVENT: error -2
[  119.879502] video0: VIDIOC_DQEVENT: error -2
[  119.884067] video0: VIDIOC_DQEVENT: error -2
[  119.889199] video0: VIDIOC_DQEVENT: error -2
[  119.894299] video0: VIDIOC_DQEVENT: error -2
[  119.898927] video0: VIDIOC_DQEVENT: error -2
[  119.904066] video0: VIDIOC_DQEVENT: error -2
[  119.909176] video0: VIDIOC_DQEVENT: error -2
[  119.914280] video0: VIDIOC_DQEVENT: error -2
[  119.918923] video0: VIDIOC_DQEVENT: error -2
[  119.924061] video0: VIDIOC_DQEVENT: error -2
[  119.929162] video0: VIDIOC_DQEVENT: error -2
[  119.933730] video0: VIDIOC_DQEVENT: error -2
[  119.938867] video0: VIDIOC_DQEVENT: error -2
[  119.943967] video0: VIDIOC_DQEVENT: error -2
[  119.948551] video0: VIDIOC_DQEVENT: error -2
[  119.953689] video0: VIDIOC_DQEVENT: error -2
[  119.958789] video0: VIDIOC_DQEVENT: error -2
[  119.963884] video0: VIDIOC_DQEVENT: error -2
[  119.968557] video0: VIDIOC_DQEVENT: error -2
[  119.973693] video0: VIDIOC_DQEVENT: error -2
[  119.978795] video0: VIDIOC_DQEVENT: error -2
[  119.983352] video0: VIDIOC_DQEVENT: error -2
[  119.988494] video0: VIDIOC_DQEVENT: error -2
[  119.993595] video0: VIDIOC_DQEVENT: error -2
[  119.998200] video0: VIDIOC_DQEVENT: error -2
[  120.003342] video0: VIDIOC_DQEVENT: error -2
[  120.008450] video0: VIDIOC_DQEVENT: error -2
[  120.013545] video0: VIDIOC_DQEVENT: error -2
[  120.018253] video0: VIDIOC_DQEVENT: error -2
[  120.023377] video0: VIDIOC_DQEVENT: error -2
[  120.028478] video0: VIDIOC_DQEVENT: error -2
[  120.033071] video0: VIDIOC_DQEVENT: error -2
[  120.038207] video0: VIDIOC_DQEVENT: error -2
[  120.043308] video0: VIDIOC_DQEVENT: error -2
[  120.047841] video0: VIDIOC_DQEVENT: error -2
[  120.052949] video0: VIDIOC_DQEVENT: error -2
[  120.058046] video0: VIDIOC_DQEVENT: error -2
[  120.063140] video0: VIDIOC_DQEVENT: error -2
[  120.067695] video0: VIDIOC_DQEVENT: error -2
[  120.072828] video0: VIDIOC_DQEVENT: error -2
[  120.077929] video0: VIDIOC_DQEVENT: error -2
[  120.082575] video0: VIDIOC_DQEVENT: error -2
[  120.087699] video0: VIDIOC_DQEVENT: error -2
[  120.092800] video0: VIDIOC_DQEVENT: error -2
[  120.097893] video0: VIDIOC_DQEVENT: error -2
[  120.102502] video0: VIDIOC_DQEVENT: error -2
[  120.107639] video0: VIDIOC_DQEVENT: error -2
[  120.112740] video0: VIDIOC_DQEVENT: error -2
[  120.117307] video0: VIDIOC_DQEVENT: error -2
[  120.122443] video0: VIDIOC_DQEVENT: error -2
[  120.127545] video0: VIDIOC_DQEVENT: error -2
[  120.132077] video0: VIDIOC_DQEVENT: error -2
[  120.137209] video0: VIDIOC_DQEVENT: error -2
[  120.142312] video0: VIDIOC_DQEVENT: error -2
[  120.147407] video0: VIDIOC_DQEVENT: error -2
[  120.151954] video0: VIDIOC_DQEVENT: error -2
[  120.157090] video0: VIDIOC_DQEVENT: error -2
[  120.162195] video0: VIDIOC_DQEVENT: error -2
[  120.166824] video0: VIDIOC_DQEVENT: error -2
[  120.171964] video0: VIDIOC_DQEVENT: error -2
[  120.177064] video0: VIDIOC_DQEVENT: error -2
[  120.181625] video0: VIDIOC_DQEVENT: error -2
[  120.186762] video0: VIDIOC_DQEVENT: error -2
[  120.191863] video0: VIDIOC_DQEVENT: error -2
[  120.196958] video0: VIDIOC_DQEVENT: error -2
[  120.201555] video0: VIDIOC_DQEVENT: error -2
[  120.206688] video0: VIDIOC_DQEVENT: error -2
[  120.211790] video0: VIDIOC_DQEVENT: error -2
[  120.216356] video0: VIDIOC_DQEVENT: error -2
[  120.221491] video0: VIDIOC_DQEVENT: error -2
[  120.226592] video0: VIDIOC_DQEVENT: error -2
[  120.231154] video0: VIDIOC_DQEVENT: error -2
[  120.236301] video0: VIDIOC_DQEVENT: error -2
[  120.241401] video0: VIDIOC_DQEVENT: error -2
[  120.246493] video0: VIDIOC_DQEVENT: error -2
[  120.251117] video0: VIDIOC_DQEVENT: error -2
[  120.256243] video0: VIDIOC_DQEVENT: error -2
[  120.261345] video0: VIDIOC_DQEVENT: error -2
[  120.265974] video0: VIDIOC_DQEVENT: error -2
[  120.271110] video0: VIDIOC_DQEVENT: error -2
[  120.276208] video0: VIDIOC_DQEVENT: error -2
[  120.281301] video0: VIDIOC_DQEVENT: error -2
[  120.285909] video0: VIDIOC_DQEVENT: error -2
[  120.291047] video0: VIDIOC_DQEVENT: error -2
[  120.296167] video0: VIDIOC_DQEVENT: error -2
[  120.300752] video0: VIDIOC_DQEVENT: error -2
[  120.305889] video0: VIDIOC_DQEVENT: error -2
[  120.310995] video0: VIDIOC_DQEVENT: error -2
[  120.315682] video0: VIDIOC_DQEVENT: error -2
[  120.320819] video0: VIDIOC_DQEVENT: error -2
[  120.325919] video0: VIDIOC_DQEVENT: error -2
[  120.331014] video0: VIDIOC_DQEVENT: error -2
[  120.335622] video0: VIDIOC_DQEVENT: error -2
[  120.340756] video0: VIDIOC_DQEVENT: error -2
[  120.345857] video0: VIDIOC_DQEVENT: error -2
[  120.350473] video0: VIDIOC_DQEVENT: error -2
[  120.355612] video0: VIDIOC_DQEVENT: error -2
[  120.360713] video0: VIDIOC_DQEVENT: error -2
[  120.365273] video0: VIDIOC_DQEVENT: error -2
[  120.370410] video0: VIDIOC_DQEVENT: error -2
[  120.375512] video0: VIDIOC_DQEVENT: error -2
[  120.380605] video0: VIDIOC_DQEVENT: error -2
[  120.385207] video0: VIDIOC_DQEVENT: error -2
[  120.390331] video0: VIDIOC_DQEVENT: error -2
[  120.395431] video0: VIDIOC_DQEVENT: error -2
[  120.400005] video0: VIDIOC_DQEVENT: error -2
[  120.405214] video0: VIDIOC_DQEVENT: error -2
[  120.410321] video0: VIDIOC_DQEVENT: error -2
[  120.414927] video0: VIDIOC_DQEVENT: error -2
[  120.420068] video0: VIDIOC_DQEVENT: error -2
[  120.425169] video0: VIDIOC_DQEVENT: error -2
[  120.430263] video0: VIDIOC_DQEVENT: error -2
[  120.434892] video0: VIDIOC_DQEVENT: error -2
[  120.440031] video0: VIDIOC_DQEVENT: error -2
[  120.445132] video0: VIDIOC_DQEVENT: error -2
[  120.449694] video0: VIDIOC_DQEVENT: error -2
[  120.454831] video0: VIDIOC_DQEVENT: error -2
[  120.459931] video0: VIDIOC_DQEVENT: error -2
[  120.464481] video0: VIDIOC_DQEVENT: error -2
[  120.469616] video0: VIDIOC_DQEVENT: error -2
[  120.474717] video0: VIDIOC_DQEVENT: error -2
[  120.479814] video0: VIDIOC_DQEVENT: error -2
[  120.484385] video0: VIDIOC_DQEVENT: error -2
[  120.489522] video0: VIDIOC_DQEVENT: error -2
[  120.494624] video0: VIDIOC_DQEVENT: error -2
[  120.499210] video0: VIDIOC_DQEVENT: error -2
[  120.504345] video0: VIDIOC_DQEVENT: error -2
[  120.509447] video0: VIDIOC_DQEVENT: error -2
[  120.514539] video0: VIDIOC_DQEVENT: error -2
[  120.519128] video0: VIDIOC_DQEVENT: error -2
[  120.524268] video0: VIDIOC_DQEVENT: error -2
[  120.529366] video0: VIDIOC_DQEVENT: error -2
[  120.533928] video0: VIDIOC_DQEVENT: error -2
[  120.539064] video0: VIDIOC_DQEVENT: error -2
[  120.544178] video0: VIDIOC_DQEVENT: error -2
[  120.548734] video0: VIDIOC_DQEVENT: error -2
[  120.553875] video0: VIDIOC_DQEVENT: error -2
[  120.558978] video0: VIDIOC_DQEVENT: error -2
[  120.564077] video0: VIDIOC_DQEVENT: error -2
[  120.568656] video0: VIDIOC_DQEVENT: error -2
[  120.573793] video0: VIDIOC_DQEVENT: error -2
[  120.578896] video0: VIDIOC_DQEVENT: error -2
[  120.583476] video0: VIDIOC_DQEVENT: error -2
[  120.588612] video0: VIDIOC_DQEVENT: error -2
[  120.593711] video0: VIDIOC_DQEVENT: error -2
[  120.598309] video0: VIDIOC_DQEVENT: error -2
[  120.603447] video0: VIDIOC_DQEVENT: error -2
[  120.608547] video0: VIDIOC_DQEVENT: error -2
[  120.613639] video0: VIDIOC_DQEVENT: error -2
[  120.618220] video0: VIDIOC_DQEVENT: error -2
[  120.623360] video0: VIDIOC_DQEVENT: error -2
[  120.628460] video0: VIDIOC_DQEVENT: error -2
[  120.633020] video0: VIDIOC_DQEVENT: error -2
[  120.638158] video0: VIDIOC_DQEVENT: error -2
[  120.643259] video0: VIDIOC_DQEVENT: error -2
[  120.647813] video0: VIDIOC_DQEVENT: error -2
[  120.652943] video0: VIDIOC_DQEVENT: error -2
[  120.658047] video0: VIDIOC_DQEVENT: error -2
[  120.663155] video0: VIDIOC_DQEVENT: error -2
[  120.667735] video0: VIDIOC_DQEVENT: error -2
[  120.672865] video0: VIDIOC_DQEVENT: error -2
[  120.677964] video0: VIDIOC_DQEVENT: error -2
[  120.682598] video0: VIDIOC_DQEVENT: error -2
[  120.687734] video0: VIDIOC_DQEVENT: error -2
[  120.692834] video0: VIDIOC_DQEVENT: error -2
[  120.697928] video0: VIDIOC_DQEVENT: error -2
[  120.702553] video0: VIDIOC_DQEVENT: error -2
[  120.707690] video0: VIDIOC_DQEVENT: error -2
[  120.712792] video0: VIDIOC_DQEVENT: error -2
[  120.717362] video0: VIDIOC_DQEVENT: error -2
[  120.722498] video0: VIDIOC_DQEVENT: error -2
[  120.727601] video0: VIDIOC_DQEVENT: error -2
[  120.732148] video0: VIDIOC_DQEVENT: error -2
[  120.735707] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  120.737279] video0: VIDIOC_DQEVENT: error -2
[  120.742379] video0: VIDIOC_DQEVENT: error -2
[  120.747477] video0: VIDIOC_DQEVENT: error -2
[  120.752038] video0: VIDIOC_DQEVENT: error -2
[  120.757171] video0: VIDIOC_DQEVENT: error -2
[  120.762272] video0: VIDIOC_DQEVENT: error -2
[  120.766854] video0: VIDIOC_DQEVENT: error -2
[  120.771992] video0: VIDIOC_DQEVENT: error -2
[  120.777093] video0: VIDIOC_DQEVENT: error -2
[  120.781663] video0: VIDIOC_DQEVENT: error -2
[  120.786801] video0: VIDIOC_DQEVENT: error -2
[  120.791901] video0: VIDIOC_DQEVENT: error -2
[  120.796994] video0: VIDIOC_DQEVENT: error -2
[  120.801582] video0: VIDIOC_DQEVENT: error -2
[  120.806717] video0: VIDIOC_DQEVENT: error -2
[  120.811818] video0: VIDIOC_DQEVENT: error -2
[  120.816413] video0: VIDIOC_DQEVENT: error -2
[  120.821548] video0: VIDIOC_DQEVENT: error -2
[  120.826650] video0: VIDIOC_DQEVENT: error -2
[  120.831244] video0: VIDIOC_DQEVENT: error -2
[  120.836360] video0: VIDIOC_DQEVENT: error -2
[  120.841461] video0: VIDIOC_DQEVENT: error -2
[  120.846556] video0: VIDIOC_DQEVENT: error -2
[  120.851030] video0: VIDIOC_DQEVENT: error -2
[  120.856197] video0: VIDIOC_DQEVENT: error -2
[  120.861300] video0: VIDIOC_DQEVENT: error -2
[  120.865766] video0: VIDIOC_DQEVENT: error -2
[  120.870895] video0: VIDIOC_DQEVENT: error -2
[  120.875999] video0: VIDIOC_DQEVENT: error -2
[  120.881093] video0: VIDIOC_DQEVENT: error -2
[  120.885509] video0: VIDIOC_DQEVENT: error -2
[  120.890624] video0: VIDIOC_DQEVENT: error -2
[  120.895726] video0: VIDIOC_DQEVENT: error -2
[  120.900140] video0: VIDIOC_DQEVENT: error -2
[  120.905270] video0: VIDIOC_DQEVENT: error -2
[  120.910374] video0: VIDIOC_DQEVENT: error -2
[  120.914872] video0: VIDIOC_DQEVENT: error -2
[  120.919991] video0: VIDIOC_DQEVENT: error -2
[  120.925093] video0: VIDIOC_DQEVENT: error -2
[  120.930187] video0: VIDIOC_DQEVENT: error -2
[  120.934642] video0: VIDIOC_DQEVENT: error -2
[  120.939759] video0: VIDIOC_DQEVENT: error -2
[  120.944862] video0: VIDIOC_DQEVENT: error -2
[  120.949306] video0: VIDIOC_DQEVENT: error -2
[  120.954421] video0: VIDIOC_DQEVENT: error -2
[  120.959520] video0: VIDIOC_DQEVENT: error -2
[  120.964613] video0: VIDIOC_DQEVENT: error -2
[  120.969164] video0: VIDIOC_DQEVENT: error -2
[  120.974281] video0: VIDIOC_DQEVENT: error -2
[  120.979382] video0: VIDIOC_DQEVENT: error -2
[  120.983816] video0: VIDIOC_DQEVENT: error -2
[  120.988941] video0: VIDIOC_DQEVENT: error -2
[  120.994039] video0: VIDIOC_DQEVENT: error -2
[  120.998523] video0: VIDIOC_DQEVENT: error -2
[  121.003656] video0: VIDIOC_DQEVENT: error -2
[  121.008757] video0: VIDIOC_DQEVENT: error -2
[  121.013849] video0: VIDIOC_DQEVENT: error -2
[  121.018309] video0: VIDIOC_DQEVENT: error -2
[  121.023424] video0: VIDIOC_DQEVENT: error -2
[  121.028524] video0: VIDIOC_DQEVENT: error -2
[  121.032955] video0: VIDIOC_DQEVENT: error -2
[  121.038085] video0: VIDIOC_DQEVENT: error -2
[  121.043188] video0: VIDIOC_DQEVENT: error -2
[  121.047590] video0: VIDIOC_DQEVENT: error -2
[  121.052740] video0: VIDIOC_DQEVENT: error -2
[  121.057843] video0: VIDIOC_DQEVENT: error -2
[  121.062943] video0: VIDIOC_DQEVENT: error -2
[  121.067677] video0: VIDIOC_DQEVENT: error -2
[  121.072811] video0: VIDIOC_DQEVENT: error -2
[  121.077919] video0: VIDIOC_DQEVENT: error -2
[  121.082678] video0: VIDIOC_DQEVENT: error -2
[  121.087805] video0: VIDIOC_DQEVENT: error -2
[  121.092910] video0: VIDIOC_DQEVENT: error -2
[  121.098008] video0: VIDIOC_DQEVENT: error -2
[  121.102790] video0: VIDIOC_DQEVENT: error -2
[  121.107960] video0: VIDIOC_DQEVENT: error -2
[  121.113066] video0: VIDIOC_DQEVENT: error -2
[  121.117802] video0: VIDIOC_DQEVENT: error -2
[  121.122933] video0: VIDIOC_DQEVENT: error -2
[  121.128045] video0: VIDIOC_DQEVENT: error -2
[  121.132776] video0: VIDIOC_DQEVENT: error -2
[  121.137908] video0: VIDIOC_DQEVENT: error -2
[  121.143015] video0: VIDIOC_DQEVENT: error -2
[  121.148113] video0: VIDIOC_DQEVENT: error -2
[  121.152889] video0: VIDIOC_DQEVENT: error -2
[  121.158063] video0: VIDIOC_DQEVENT: error -2
[  121.163175] video0: VIDIOC_DQEVENT: error -2
[  121.167908] video0: VIDIOC_DQEVENT: error -2
[  121.173033] video0: VIDIOC_DQEVENT: error -2
[  121.178136] video0: VIDIOC_DQEVENT: error -2
[  121.182958] video0: VIDIOC_DQEVENT: error -2
[  121.188087] video0: VIDIOC_DQEVENT: error -2
[  121.193194] video0: VIDIOC_DQEVENT: error -2
[  121.197967] video0: VIDIOC_DQEVENT: error -2
[  121.203193] video0: VIDIOC_DQEVENT: error -2
[  121.208298] video0: VIDIOC_DQEVENT: error -2
[  121.213395] video0: VIDIOC_DQEVENT: error -2
[  121.218176] video0: VIDIOC_DQEVENT: error -2
[  121.223303] video0: VIDIOC_DQEVENT: error -2
[  121.228413] video0: VIDIOC_DQEVENT: error -2
[  121.233157] video0: VIDIOC_DQEVENT: error -2
[  121.238289] video0: VIDIOC_DQEVENT: error -2
[  121.243394] video0: VIDIOC_DQEVENT: error -2
[  121.248115] video0: VIDIOC_DQEVENT: error -2
[  121.253243] video0: VIDIOC_DQEVENT: error -2
[  121.258348] video0: VIDIOC_DQEVENT: error -2
[  121.263448] video0: VIDIOC_DQEVENT: error -2
[  121.268141] video0: VIDIOC_DQEVENT: error -2
[  121.273315] video0: VIDIOC_DQEVENT: error -2
[  121.278418] video0: VIDIOC_DQEVENT: error -2
[  121.283209] video0: VIDIOC_DQEVENT: error -2
[  121.288335] video0: VIDIOC_DQEVENT: error -2
[  121.293442] video0: VIDIOC_DQEVENT: error -2
[  121.298194] video0: VIDIOC_DQEVENT: error -2
[  121.303327] video0: VIDIOC_DQEVENT: error -2
[  121.308432] video0: VIDIOC_DQEVENT: error -2
[  121.313532] video0: VIDIOC_DQEVENT: error -2
[  121.318303] video0: VIDIOC_DQEVENT: error -2
[  121.323477] video0: VIDIOC_DQEVENT: error -2
[  121.328584] video0: VIDIOC_DQEVENT: error -2
[  121.333334] video0: VIDIOC_DQEVENT: error -2
[  121.338465] video0: VIDIOC_DQEVENT: error -2
[  121.343571] video0: VIDIOC_DQEVENT: error -2
[  121.348290] video0: VIDIOC_DQEVENT: error -2
[  121.353465] video0: VIDIOC_DQEVENT: error -2
[  121.358573] video0: VIDIOC_DQEVENT: error -2
[  121.363671] video0: VIDIOC_DQEVENT: error -2
[  121.368383] video0: VIDIOC_DQEVENT: error -2
[  121.373516] video0: VIDIOC_DQEVENT: error -2
[  121.378622] video0: VIDIOC_DQEVENT: error -2
[  121.383232] video0: VIDIOC_DQEVENT: error -2
[  121.388351] video0: VIDIOC_DQEVENT: error -2
[  121.393453] video0: VIDIOC_DQEVENT: error -2
[  121.397915] video0: VIDIOC_DQEVENT: error -2
[  121.403047] video0: VIDIOC_DQEVENT: error -2
[  121.408172] video0: VIDIOC_DQEVENT: error -2
[  121.413274] video0: VIDIOC_DQEVENT: error -2
[  121.417739] video0: VIDIOC_DQEVENT: error -2
[  121.422873] video0: VIDIOC_DQEVENT: error -2
[  121.427978] video0: VIDIOC_DQEVENT: error -2
[  121.432418] video0: VIDIOC_DQEVENT: error -2
[  121.437550] video0: VIDIOC_DQEVENT: error -2
[  121.442653] video0: VIDIOC_DQEVENT: error -2
[  121.447749] video0: VIDIOC_DQEVENT: error -2
[  121.452181] video0: VIDIOC_DQEVENT: error -2
[  121.457310] video0: VIDIOC_DQEVENT: error -2
[  121.462416] video0: VIDIOC_DQEVENT: error -2
[  121.466989] video0: VIDIOC_DQEVENT: error -2
[  121.472161] video0: VIDIOC_DQEVENT: error -2
[  121.477263] video0: VIDIOC_DQEVENT: error -2
[  121.481754] video0: VIDIOC_DQEVENT: error -2
[  121.486887] video0: VIDIOC_DQEVENT: error -2
[  121.491993] video0: VIDIOC_DQEVENT: error -2
[  121.497088] video0: VIDIOC_DQEVENT: error -2
[  121.501527] video0: VIDIOC_DQEVENT: error -2
[  121.506658] video0: VIDIOC_DQEVENT: error -2
[  121.511764] video0: VIDIOC_DQEVENT: error -2
[  121.516208] video0: VIDIOC_DQEVENT: error -2
[  121.521340] video0: VIDIOC_DQEVENT: error -2
[  121.526444] video0: VIDIOC_DQEVENT: error -2
[  121.531538] video0: VIDIOC_DQEVENT: error -2
[  121.536095] video0: VIDIOC_DQEVENT: error -2
[  121.541205] video0: VIDIOC_DQEVENT: error -2
[  121.546307] video0: VIDIOC_DQEVENT: error -2
[  121.550782] video0: VIDIOC_DQEVENT: error -2
[  121.555917] video0: VIDIOC_DQEVENT: error -2
[  121.561027] video0: VIDIOC_DQEVENT: error -2
[  121.565465] video0: VIDIOC_DQEVENT: error -2
[  121.570595] video0: VIDIOC_DQEVENT: error -2
[  121.575697] video0: VIDIOC_DQEVENT: error -2
[  121.580789] video0: VIDIOC_DQEVENT: error -2
[  121.585248] video0: VIDIOC_DQEVENT: error -2
[  121.590377] video0: VIDIOC_DQEVENT: error -2
[  121.595483] video0: VIDIOC_DQEVENT: error -2
[  121.600049] video0: VIDIOC_DQEVENT: error -2
[  121.605187] video0: VIDIOC_DQEVENT: error -2
[  121.610291] video0: VIDIOC_DQEVENT: error -2
[  121.615069] video0: VIDIOC_DQEVENT: error -2
[  121.620265] video0: VIDIOC_DQEVENT: error -2
[  121.625370] video0: VIDIOC_DQEVENT: error -2
[  121.630469] video0: VIDIOC_DQEVENT: error -2
[  121.635229] video0: VIDIOC_DQEVENT: error -2
[  121.640405] video0: VIDIOC_DQEVENT: error -2
[  121.645508] video0: VIDIOC_DQEVENT: error -2
[  121.650311] video0: VIDIOC_DQEVENT: error -2
[  121.655436] video0: VIDIOC_DQEVENT: error -2
[  121.660544] video0: VIDIOC_DQEVENT: error -2
[  121.665307] video0: VIDIOC_DQEVENT: error -2
[  121.670439] video0: VIDIOC_DQEVENT: error -2
[  121.675547] video0: VIDIOC_DQEVENT: error -2
[  121.680647] video0: VIDIOC_DQEVENT: error -2
[  121.685391] video0: VIDIOC_DQEVENT: error -2
[  121.690562] video0: VIDIOC_DQEVENT: error -2
[  121.695670] video0: VIDIOC_DQEVENT: error -2
[  121.700413] video0: VIDIOC_DQEVENT: error -2
[  121.705544] video0: VIDIOC_DQEVENT: error -2
[  121.710652] video0: VIDIOC_DQEVENT: error -2
[  121.715428] video0: VIDIOC_DQEVENT: error -2
[  121.720554] video0: VIDIOC_DQEVENT: error -2
[  121.725659] video0: VIDIOC_DQEVENT: error -2
[  121.730758] video0: VIDIOC_DQEVENT: error -2
[  121.735462] video0: VIDIOC_DQEVENT: error -2
[  121.740585] video0: VIDIOC_DQEVENT: error -2
[  121.745692] video0: VIDIOC_DQEVENT: error -2
[  121.750152] video0: VIDIOC_DQEVENT: error -2
[  121.755270] video0: VIDIOC_DQEVENT: error -2
[  121.759701] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  121.760376] video0: VIDIOC_DQEVENT: error -2
[  121.764769] video0: VIDIOC_DQEVENT: error -2
[  121.769884] video0: VIDIOC_DQEVENT: error -2
[  121.774986] video0: VIDIOC_DQEVENT: error -2
[  121.780079] video0: VIDIOC_DQEVENT: error -2
[  121.784467] video0: VIDIOC_DQEVENT: error -2
[  121.789581] video0: VIDIOC_DQEVENT: error -2
[  121.794685] video0: VIDIOC_DQEVENT: error -2
[  121.799097] video0: VIDIOC_DQEVENT: error -2
[  121.804215] video0: VIDIOC_DQEVENT: error -2
[  121.809317] video0: VIDIOC_DQEVENT: error -2
[  121.814410] video0: VIDIOC_DQEVENT: error -2
[  121.818817] video0: VIDIOC_DQEVENT: error -2
[  121.823934] video0: VIDIOC_DQEVENT: error -2
[  121.829045] video0: VIDIOC_DQEVENT: error -2
[  121.833438] video0: VIDIOC_DQEVENT: error -2
[  121.838552] video0: VIDIOC_DQEVENT: error -2
[  121.843655] video0: VIDIOC_DQEVENT: error -2
[  121.848041] video0: VIDIOC_DQEVENT: error -2
[  121.853150] video0: VIDIOC_DQEVENT: error -2
[  121.858252] video0: VIDIOC_DQEVENT: error -2
[  121.863348] video0: VIDIOC_DQEVENT: error -2
[  121.867730] video0: VIDIOC_DQEVENT: error -2
[  121.872838] video0: VIDIOC_DQEVENT: error -2
[  121.877939] video0: VIDIOC_DQEVENT: error -2
[  121.882364] video0: VIDIOC_DQEVENT: error -2
[  121.887479] video0: VIDIOC_DQEVENT: error -2
[  121.892581] video0: VIDIOC_DQEVENT: error -2
[  121.897674] video0: VIDIOC_DQEVENT: error -2
[  121.902066] video0: VIDIOC_DQEVENT: error -2
[  121.907180] video0: VIDIOC_DQEVENT: error -2
[  121.912285] video0: VIDIOC_DQEVENT: error -2
[  121.916686] video0: VIDIOC_DQEVENT: error -2
[  121.921799] video0: VIDIOC_DQEVENT: error -2
[  121.926901] video0: VIDIOC_DQEVENT: error -2
[  121.931278] video0: VIDIOC_DQEVENT: error -2
[  121.936390] video0: VIDIOC_DQEVENT: error -2
[  121.941491] video0: VIDIOC_DQEVENT: error -2
[  121.946584] video0: VIDIOC_DQEVENT: error -2
[  121.950982] video0: VIDIOC_DQEVENT: error -2
[  121.956097] video0: VIDIOC_DQEVENT: error -2
[  121.961199] video0: VIDIOC_DQEVENT: error -2
[  121.965591] video0: VIDIOC_DQEVENT: error -2
[  121.970705] video0: VIDIOC_DQEVENT: error -2
[  121.975811] video0: VIDIOC_DQEVENT: error -2
[  121.980904] video0: VIDIOC_DQEVENT: error -2
[  121.985268] video0: VIDIOC_DQEVENT: error -2
[  121.990382] video0: VIDIOC_DQEVENT: error -2
[  121.995485] video0: VIDIOC_DQEVENT: error -2
[  121.999864] video0: VIDIOC_DQEVENT: error -2
[  122.004971] video0: VIDIOC_DQEVENT: error -2
[  122.010071] video0: VIDIOC_DQEVENT: error -2
[  122.014485] video0: VIDIOC_DQEVENT: error -2
[  122.019601] video0: VIDIOC_DQEVENT: error -2
[  122.024704] video0: VIDIOC_DQEVENT: error -2
[  122.029795] video0: VIDIOC_DQEVENT: error -2
[  122.034210] video0: VIDIOC_DQEVENT: error -2
[  122.039324] video0: VIDIOC_DQEVENT: error -2
[  122.044426] video0: VIDIOC_DQEVENT: error -2
[  122.048808] video0: VIDIOC_DQEVENT: error -2
[  122.053923] video0: VIDIOC_DQEVENT: error -2
[  122.059025] video0: VIDIOC_DQEVENT: error -2
[  122.064120] video0: VIDIOC_DQEVENT: error -2
[  122.068494] video0: VIDIOC_DQEVENT: error -2
[  122.073607] video0: VIDIOC_DQEVENT: error -2
[  122.078712] video0: VIDIOC_DQEVENT: error -2
[  122.083115] video0: VIDIOC_DQEVENT: error -2
[  122.088231] video0: VIDIOC_DQEVENT: error -2
[  122.093329] video0: VIDIOC_DQEVENT: error -2
[  122.097708] video0: VIDIOC_DQEVENT: error -2
[  122.102822] video0: VIDIOC_DQEVENT: error -2
[  122.107928] video0: VIDIOC_DQEVENT: error -2
[  122.113022] video0: VIDIOC_DQEVENT: error -2
[  122.117409] video0: VIDIOC_DQEVENT: error -2
[  122.122524] video0: VIDIOC_DQEVENT: error -2
[  122.127629] video0: VIDIOC_DQEVENT: error -2
[  122.131996] video0: VIDIOC_DQEVENT: error -2
[  122.137105] video0: VIDIOC_DQEVENT: error -2
[  122.142206] video0: VIDIOC_DQEVENT: error -2
[  122.147301] video0: VIDIOC_DQEVENT: error -2
[  122.151671] video0: VIDIOC_DQEVENT: error -2
[  122.156777] video0: VIDIOC_DQEVENT: error -2
[  122.161878] video0: VIDIOC_DQEVENT: error -2
[  122.166315] video0: VIDIOC_DQEVENT: error -2
[  122.171427] video0: VIDIOC_DQEVENT: error -2
[  122.176529] video0: VIDIOC_DQEVENT: error -2
[  122.180903] video0: VIDIOC_DQEVENT: error -2
[  122.186017] video0: VIDIOC_DQEVENT: error -2
[  122.191119] video0: VIDIOC_DQEVENT: error -2
[  122.196211] video0: VIDIOC_DQEVENT: error -2
[  122.200599] video0: VIDIOC_DQEVENT: error -2
[  122.205712] video0: VIDIOC_DQEVENT: error -2
[  122.210815] video0: VIDIOC_DQEVENT: error -2
[  122.215213] video0: VIDIOC_DQEVENT: error -2
[  122.220326] video0: VIDIOC_DQEVENT: error -2
[  122.225428] video0: VIDIOC_DQEVENT: error -2
[  122.230519] video0: VIDIOC_DQEVENT: error -2
[  122.234903] video0: VIDIOC_DQEVENT: error -2
[  122.240017] video0: VIDIOC_DQEVENT: error -2
[  122.245118] video0: VIDIOC_DQEVENT: error -2
[  122.249502] video0: VIDIOC_DQEVENT: error -2
[  122.254616] video0: VIDIOC_DQEVENT: error -2
[  122.259721] video0: VIDIOC_DQEVENT: error -2
[  122.264816] video0: VIDIOC_DQEVENT: error -2
[  122.269203] video0: VIDIOC_DQEVENT: error -2
[  122.274316] video0: VIDIOC_DQEVENT: error -2
[  122.279417] video0: VIDIOC_DQEVENT: error -2
[  122.283800] video0: VIDIOC_DQEVENT: error -2
[  122.288908] video0: VIDIOC_DQEVENT: error -2
[  122.294008] video0: VIDIOC_DQEVENT: error -2
[  122.298437] video0: VIDIOC_DQEVENT: error -2
[  122.303549] video0: VIDIOC_DQEVENT: error -2
[  122.308651] video0: VIDIOC_DQEVENT: error -2
[  122.313744] video0: VIDIOC_DQEVENT: error -2
[  122.318151] video0: VIDIOC_DQEVENT: error -2
[  122.323267] video0: VIDIOC_DQEVENT: error -2
[  122.328367] video0: VIDIOC_DQEVENT: error -2
[  122.332746] video0: VIDIOC_DQEVENT: error -2
[  122.337860] video0: VIDIOC_DQEVENT: error -2
[  122.342964] video0: VIDIOC_DQEVENT: error -2
[  122.348057] video0: VIDIOC_DQEVENT: error -2
[  122.352434] video0: VIDIOC_DQEVENT: error -2
[  122.357549] video0: VIDIOC_DQEVENT: error -2
[  122.362654] video0: VIDIOC_DQEVENT: error -2
[  122.367038] video0: VIDIOC_DQEVENT: error -2
[  122.372181] video0: VIDIOC_DQEVENT: error -2
[  122.377284] video0: VIDIOC_DQEVENT: error -2
[  122.381664] video0: VIDIOC_DQEVENT: error -2
[  122.386778] video0: VIDIOC_DQEVENT: error -2
[  122.391880] video0: VIDIOC_DQEVENT: error -2
[  122.396972] video0: VIDIOC_DQEVENT: error -2
[  122.401340] video0: VIDIOC_DQEVENT: error -2
[  122.406455] video0: VIDIOC_DQEVENT: error -2
[  122.411561] video0: VIDIOC_DQEVENT: error -2
[  122.415956] video0: VIDIOC_DQEVENT: error -2
[  122.421066] video0: VIDIOC_DQEVENT: error -2
[  122.426167] video0: VIDIOC_DQEVENT: error -2
[  122.431261] video0: VIDIOC_DQEVENT: error -2
[  122.435627] video0: VIDIOC_DQEVENT: error -2
[  122.440733] video0: VIDIOC_DQEVENT: error -2
[  122.445833] video0: VIDIOC_DQEVENT: error -2
[  122.450243] video0: VIDIOC_DQEVENT: error -2
[  122.455359] video0: VIDIOC_DQEVENT: error -2
[  122.460460] video0: VIDIOC_DQEVENT: error -2
[  122.464818] video0: VIDIOC_DQEVENT: error -2
[  122.469934] video0: VIDIOC_DQEVENT: error -2
[  122.475035] video0: VIDIOC_DQEVENT: error -2
[  122.480129] video0: VIDIOC_DQEVENT: error -2
[  122.484623] video0: VIDIOC_DQEVENT: error -2
[  122.489740] video0: VIDIOC_DQEVENT: error -2
[  122.494839] video0: VIDIOC_DQEVENT: error -2
[  122.499247] video0: VIDIOC_DQEVENT: error -2
[  122.504366] video0: VIDIOC_DQEVENT: error -2
[  122.509465] video0: VIDIOC_DQEVENT: error -2
[  122.514558] video0: VIDIOC_DQEVENT: error -2
[  122.518972] video0: VIDIOC_DQEVENT: error -2
[  122.524107] video0: VIDIOC_DQEVENT: error -2
[  122.529214] video0: VIDIOC_DQEVENT: error -2
[  122.533716] video0: VIDIOC_DQEVENT: error -2
[  122.538831] video0: VIDIOC_DQEVENT: error -2
[  122.543929] video0: VIDIOC_DQEVENT: error -2
[  122.548337] video0: VIDIOC_DQEVENT: error -2
[  122.553456] video0: VIDIOC_DQEVENT: error -2
[  122.558554] video0: VIDIOC_DQEVENT: error -2
[  122.563648] video0: VIDIOC_DQEVENT: error -2
[  122.568026] video0: VIDIOC_DQEVENT: error -2
[  122.573135] video0: VIDIOC_DQEVENT: error -2
[  122.578237] video0: VIDIOC_DQEVENT: error -2
[  122.582764] video0: VIDIOC_DQEVENT: error -2
[  122.587890] video0: VIDIOC_DQEVENT: error -2
[  122.592989] video0: VIDIOC_DQEVENT: error -2
[  122.598081] video0: VIDIOC_DQEVENT: error -2
[  122.602513] video0: VIDIOC_DQEVENT: error -2
[  122.607628] video0: VIDIOC_DQEVENT: error -2
[  122.612730] video0: VIDIOC_DQEVENT: error -2
[  122.617230] video0: VIDIOC_DQEVENT: error -2
[  122.622345] video0: VIDIOC_DQEVENT: error -2
[  122.627446] video0: VIDIOC_DQEVENT: error -2
[  122.631899] video0: VIDIOC_DQEVENT: error -2
[  122.637007] video0: VIDIOC_DQEVENT: error -2
[  122.642105] video0: VIDIOC_DQEVENT: error -2
[  122.647198] video0: VIDIOC_DQEVENT: error -2
[  122.651569] video0: VIDIOC_DQEVENT: error -2
[  122.656677] video0: VIDIOC_DQEVENT: error -2
[  122.661780] video0: VIDIOC_DQEVENT: error -2
[  122.666444] video0: VIDIOC_DQEVENT: error -2
[  122.671559] video0: VIDIOC_DQEVENT: error -2
[  122.676670] video0: VIDIOC_DQEVENT: error -2
[  122.681261] video0: VIDIOC_DQEVENT: error -2
[  122.686380] video0: VIDIOC_DQEVENT: error -2
[  122.691539] video0: VIDIOC_DQEVENT: error -2
[  122.696654] video0: VIDIOC_DQEVENT: error -2
[  122.701356] video0: VIDIOC_DQEVENT: error -2
[  122.706472] video0: VIDIOC_DQEVENT: error -2
[  122.711587] video0: VIDIOC_DQEVENT: error -2
[  122.716110] video0: VIDIOC_DQEVENT: error -2
[  122.721226] video0: VIDIOC_DQEVENT: error -2
[  122.726349] video0: VIDIOC_DQEVENT: error -2
[  122.731457] video0: VIDIOC_DQEVENT: error -2
[  122.735964] video0: VIDIOC_DQEVENT: error -2
[  122.741077] video0: VIDIOC_DQEVENT: error -2
[  122.746195] video0: VIDIOC_DQEVENT: error -2
[  122.750916] video0: VIDIOC_DQEVENT: error -2
[  122.756033] video0: VIDIOC_DQEVENT: error -2
[  122.761150] video0: VIDIOC_DQEVENT: error -2
[  122.765637] video0: VIDIOC_DQEVENT: error -2
[  122.770755] video0: VIDIOC_DQEVENT: error -2
[  122.775877] video0: VIDIOC_DQEVENT: error -2
[  122.781000] video0: VIDIOC_DQEVENT: error -2
[  122.783747] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  122.785713] video0: VIDIOC_DQEVENT: error -2
[  122.790839] video0: VIDIOC_DQEVENT: error -2
[  122.795954] video0: VIDIOC_DQEVENT: error -2
[  122.800506] video0: VIDIOC_DQEVENT: error -2
[  122.805625] video0: VIDIOC_DQEVENT: error -2
[  122.810748] video0: VIDIOC_DQEVENT: error -2
[  122.815402] video0: VIDIOC_DQEVENT: error -2
[  122.820524] video0: VIDIOC_DQEVENT: error -2
[  122.825647] video0: VIDIOC_DQEVENT: error -2
[  122.830767] video0: VIDIOC_DQEVENT: error -2
[  122.835430] video0: VIDIOC_DQEVENT: error -2
[  122.840546] video0: VIDIOC_DQEVENT: error -2
[  122.845657] video0: VIDIOC_DQEVENT: error -2
[  122.850322] video0: VIDIOC_DQEVENT: error -2
[  122.855438] video0: VIDIOC_DQEVENT: error -2
[  122.860553] video0: VIDIOC_DQEVENT: error -2
[  122.865271] video0: VIDIOC_DQEVENT: error -2
[  122.870403] video0: VIDIOC_DQEVENT: error -2
[  122.875518] video0: VIDIOC_DQEVENT: error -2
[  122.880624] video0: VIDIOC_DQEVENT: error -2
[  122.885156] video0: VIDIOC_DQEVENT: error -2
[  122.890292] video0: VIDIOC_DQEVENT: error -2
[  122.895416] video0: VIDIOC_DQEVENT: error -2
[  122.900003] video0: VIDIOC_DQEVENT: error -2
[  122.905120] video0: VIDIOC_DQEVENT: error -2
[  122.910230] video0: VIDIOC_DQEVENT: error -2
[  122.914826] video0: VIDIOC_DQEVENT: error -2
[  122.919945] video0: VIDIOC_DQEVENT: error -2
[  122.925069] video0: VIDIOC_DQEVENT: error -2
[  122.930178] video0: VIDIOC_DQEVENT: error -2
[  122.934765] video0: VIDIOC_DQEVENT: error -2
[  122.939886] video0: VIDIOC_DQEVENT: error -2
[  122.945002] video0: VIDIOC_DQEVENT: error -2
[  122.949674] video0: VIDIOC_DQEVENT: error -2
[  122.954793] video0: VIDIOC_DQEVENT: error -2
[  122.959909] video0: VIDIOC_DQEVENT: error -2
[  122.964436] video0: VIDIOC_DQEVENT: error -2
[  122.969560] video0: VIDIOC_DQEVENT: error -2
[  122.974687] video0: VIDIOC_DQEVENT: error -2
[  122.979797] video0: VIDIOC_DQEVENT: error -2
[  122.984469] video0: VIDIOC_DQEVENT: error -2
[  122.989587] video0: VIDIOC_DQEVENT: error -2
[  122.994708] video0: VIDIOC_DQEVENT: error -2
[  122.999406] video0: VIDIOC_DQEVENT: error -2
[  123.004523] video0: VIDIOC_DQEVENT: error -2
[  123.009642] video0: VIDIOC_DQEVENT: error -2
[  123.014749] video0: VIDIOC_DQEVENT: error -2
[  123.019339] video0: VIDIOC_DQEVENT: error -2
[  123.024469] video0: VIDIOC_DQEVENT: error -2
[  123.029584] video0: VIDIOC_DQEVENT: error -2
[  123.034319] video0: VIDIOC_DQEVENT: error -2
[  123.039452] video0: VIDIOC_DQEVENT: error -2
[  123.044569] video0: VIDIOC_DQEVENT: error -2
[  123.049173] video0: VIDIOC_DQEVENT: error -2
[  123.054290] video0: VIDIOC_DQEVENT: error -2
[  123.059415] video0: VIDIOC_DQEVENT: error -2
[  123.064524] video0: VIDIOC_DQEVENT: error -2
[  123.069198] video0: VIDIOC_DQEVENT: error -2
[  123.074323] video0: VIDIOC_DQEVENT: error -2
[  123.079435] video0: VIDIOC_DQEVENT: error -2
[  123.083963] video0: VIDIOC_DQEVENT: error -2
[  123.089079] video0: VIDIOC_DQEVENT: error -2
[  123.094201] video0: VIDIOC_DQEVENT: error -2
[  123.098847] video0: VIDIOC_DQEVENT: error -2
[  123.103964] video0: VIDIOC_DQEVENT: error -2
[  123.109076] video0: VIDIOC_DQEVENT: error -2
[  123.114186] video0: VIDIOC_DQEVENT: error -2
[  123.118845] video0: VIDIOC_DQEVENT: error -2
[  123.123965] video0: VIDIOC_DQEVENT: error -2
[  123.129081] video0: VIDIOC_DQEVENT: error -2
[  123.133678] video0: VIDIOC_DQEVENT: error -2
[  123.138800] video0: VIDIOC_DQEVENT: error -2
[  123.143932] video0: VIDIOC_DQEVENT: error -2
[  123.148635] video0: VIDIOC_DQEVENT: error -2
[  123.153750] video0: VIDIOC_DQEVENT: error -2
[  123.158860] video0: VIDIOC_DQEVENT: error -2
[  123.163965] video0: VIDIOC_DQEVENT: error -2
[  123.168495] video0: VIDIOC_DQEVENT: error -2
[  123.173614] video0: VIDIOC_DQEVENT: error -2
[  123.178739] video0: VIDIOC_DQEVENT: error -2
[  123.183408] video0: VIDIOC_DQEVENT: error -2
[  123.188531] video0: VIDIOC_DQEVENT: error -2
[  123.193642] video0: VIDIOC_DQEVENT: error -2
[  123.198290] video0: VIDIOC_DQEVENT: error -2
[  123.203410] video0: VIDIOC_DQEVENT: error -2
[  123.208536] video0: VIDIOC_DQEVENT: error -2
[  123.213644] video0: VIDIOC_DQEVENT: error -2
[  123.218305] video0: VIDIOC_DQEVENT: error -2
[  123.223426] video0: VIDIOC_DQEVENT: error -2
[  123.228556] video0: VIDIOC_DQEVENT: error -2
[  123.233200] video0: VIDIOC_DQEVENT: error -2
[  123.238315] video0: VIDIOC_DQEVENT: error -2
[  123.243430] video0: VIDIOC_DQEVENT: error -2
[  123.247931] video0: VIDIOC_DQEVENT: error -2
[  123.253044] video0: VIDIOC_DQEVENT: error -2
[  123.258173] video0: VIDIOC_DQEVENT: error -2
[  123.263292] video0: VIDIOC_DQEVENT: error -2
[  123.267859] video0: VIDIOC_DQEVENT: error -2
[  123.272969] video0: VIDIOC_DQEVENT: error -2
[  123.278083] video0: VIDIOC_DQEVENT: error -2
[  123.282701] video0: VIDIOC_DQEVENT: error -2
[  123.287823] video0: VIDIOC_DQEVENT: error -2
[  123.292948] video0: VIDIOC_DQEVENT: error -2
[  123.298055] video0: VIDIOC_DQEVENT: error -2
[  123.302597] video0: VIDIOC_DQEVENT: error -2
[  123.307718] video0: VIDIOC_DQEVENT: error -2
[  123.312844] video0: VIDIOC_DQEVENT: error -2
[  123.317506] video0: VIDIOC_DQEVENT: error -2
[  123.322622] video0: VIDIOC_DQEVENT: error -2
[  123.327736] video0: VIDIOC_DQEVENT: error -2
[  123.332256] video0: VIDIOC_DQEVENT: error -2
[  123.337377] video0: VIDIOC_DQEVENT: error -2
[  123.342509] video0: VIDIOC_DQEVENT: error -2
[  123.347630] video0: VIDIOC_DQEVENT: error -2
[  123.352206] video0: VIDIOC_DQEVENT: error -2
[  123.357320] video0: VIDIOC_DQEVENT: error -2
[  123.362433] video0: VIDIOC_DQEVENT: error -2
[  123.367023] video0: VIDIOC_DQEVENT: error -2
[  123.372142] video0: VIDIOC_DQEVENT: error -2
[  123.377267] video0: VIDIOC_DQEVENT: error -2
[  123.381773] video0: VIDIOC_DQEVENT: error -2
[  123.386891] video0: VIDIOC_DQEVENT: error -2
[  123.392008] video0: VIDIOC_DQEVENT: error -2
[  123.397122] video0: VIDIOC_DQEVENT: error -2
[  123.401791] video0: VIDIOC_DQEVENT: error -2
[  123.406910] video0: VIDIOC_DQEVENT: error -2
[  123.412025] video0: VIDIOC_DQEVENT: error -2
[  123.416538] video0: VIDIOC_DQEVENT: error -2
[  123.421657] video0: VIDIOC_DQEVENT: error -2
[  123.426786] video0: VIDIOC_DQEVENT: error -2
[  123.431398] video0: VIDIOC_DQEVENT: error -2
[  123.436514] video0: VIDIOC_DQEVENT: error -2
[  123.441626] video0: VIDIOC_DQEVENT: error -2
[  123.446731] video0: VIDIOC_DQEVENT: error -2
[  123.451294] video0: VIDIOC_DQEVENT: error -2
[  123.456411] video0: VIDIOC_DQEVENT: error -2
[  123.461532] video0: VIDIOC_DQEVENT: error -2
[  123.466065] video0: VIDIOC_DQEVENT: error -2
[  123.471182] video0: VIDIOC_DQEVENT: error -2
[  123.476295] video0: VIDIOC_DQEVENT: error -2
[  123.481404] video0: VIDIOC_DQEVENT: error -2
[  123.486093] video0: VIDIOC_DQEVENT: error -2
[  123.491209] video0: VIDIOC_DQEVENT: error -2
[  123.496322] video0: VIDIOC_DQEVENT: error -2
[  123.500816] video0: VIDIOC_DQEVENT: error -2
[  123.505933] video0: VIDIOC_DQEVENT: error -2
[  123.511049] video0: VIDIOC_DQEVENT: error -2
[  123.515679] video0: VIDIOC_DQEVENT: error -2
[  123.520798] video0: VIDIOC_DQEVENT: error -2
[  123.525913] video0: VIDIOC_DQEVENT: error -2
[  123.531019] video0: VIDIOC_DQEVENT: error -2
[  123.535544] video0: VIDIOC_DQEVENT: error -2
[  123.540663] video0: VIDIOC_DQEVENT: error -2
[  123.545784] video0: VIDIOC_DQEVENT: error -2
[  123.550367] video0: VIDIOC_DQEVENT: error -2
[  123.555484] video0: VIDIOC_DQEVENT: error -2
[  123.560600] video0: VIDIOC_DQEVENT: error -2
[  123.565133] video0: VIDIOC_DQEVENT: error -2
[  123.570253] video0: VIDIOC_DQEVENT: error -2
[  123.575379] video0: VIDIOC_DQEVENT: error -2
[  123.580486] video0: VIDIOC_DQEVENT: error -2
[  123.584975] video0: VIDIOC_DQEVENT: error -2
[  123.590093] video0: VIDIOC_DQEVENT: error -2
[  123.595211] video0: VIDIOC_DQEVENT: error -2
[  123.599847] video0: VIDIOC_DQEVENT: error -2
[  123.604959] video0: VIDIOC_DQEVENT: error -2
[  123.610069] video0: VIDIOC_DQEVENT: error -2
[  123.614612] video0: VIDIOC_DQEVENT: error -2
[  123.619731] video0: VIDIOC_DQEVENT: error -2
[  123.624861] video0: VIDIOC_DQEVENT: error -2
[  123.629979] video0: VIDIOC_DQEVENT: error -2
[  123.634568] video0: VIDIOC_DQEVENT: error -2
[  123.639686] video0: VIDIOC_DQEVENT: error -2
[  123.644797] video0: VIDIOC_DQEVENT: error -2
[  123.649312] video0: VIDIOC_DQEVENT: error -2
[  123.654440] video0: VIDIOC_DQEVENT: error -2
[  123.659578] video0: VIDIOC_DQEVENT: error -2
[  123.664688] video0: VIDIOC_DQEVENT: error -2
[  123.669209] video0: VIDIOC_DQEVENT: error -2
[  123.674324] video0: VIDIOC_DQEVENT: error -2
[  123.679445] video0: VIDIOC_DQEVENT: error -2
[  123.684085] video0: VIDIOC_DQEVENT: error -2
[  123.689199] video0: VIDIOC_DQEVENT: error -2
[  123.694312] video0: VIDIOC_DQEVENT: error -2
[  123.698872] video0: VIDIOC_DQEVENT: error -2
[  123.703994] video0: VIDIOC_DQEVENT: error -2
[  123.709120] video0: VIDIOC_DQEVENT: error -2
[  123.714228] video0: VIDIOC_DQEVENT: error -2
[  123.718851] video0: VIDIOC_DQEVENT: error -2
[  123.723969] video0: VIDIOC_DQEVENT: error -2
[  123.729084] video0: VIDIOC_DQEVENT: error -2
[  123.733599] video0: VIDIOC_DQEVENT: error -2
[  123.738714] video0: VIDIOC_DQEVENT: error -2
[  123.743838] video0: VIDIOC_DQEVENT: error -2
[  123.748354] video0: VIDIOC_DQEVENT: error -2
[  123.753470] video0: VIDIOC_DQEVENT: error -2
[  123.758582] video0: VIDIOC_DQEVENT: error -2
[  123.763692] video0: VIDIOC_DQEVENT: error -2
[  123.768380] video0: VIDIOC_DQEVENT: error -2
[  123.773496] video0: VIDIOC_DQEVENT: error -2
[  123.778609] video0: VIDIOC_DQEVENT: error -2
[  123.783237] video0: VIDIOC_DQEVENT: error -2
[  123.788354] video0: VIDIOC_DQEVENT: error -2
[  123.793469] video0: VIDIOC_DQEVENT: error -2
[  123.798090] video0: VIDIOC_DQEVENT: error -2
[  123.803211] video0: VIDIOC_DQEVENT: error -2
[  123.807704] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  123.808333] video0: VIDIOC_DQEVENT: error -2
[  123.813433] video0: VIDIOC_DQEVENT: error -2
[  123.817967] video0: VIDIOC_DQEVENT: error -2
[  123.823095] video0: VIDIOC_DQEVENT: error -2
[  123.828195] video0: VIDIOC_DQEVENT: error -2
[  123.832696] video0: VIDIOC_DQEVENT: error -2
[  123.837811] video0: VIDIOC_DQEVENT: error -2
[  123.842911] video0: VIDIOC_DQEVENT: error -2
[  123.848005] video0: VIDIOC_DQEVENT: error -2
[  123.852490] video0: VIDIOC_DQEVENT: error -2
[  123.857616] video0: VIDIOC_DQEVENT: error -2
[  123.862719] video0: VIDIOC_DQEVENT: error -2
[  123.867226] video0: VIDIOC_DQEVENT: error -2
[  123.872351] video0: VIDIOC_DQEVENT: error -2
[  123.877452] video0: VIDIOC_DQEVENT: error -2
[  123.881943] video0: VIDIOC_DQEVENT: error -2
[  123.887068] video0: VIDIOC_DQEVENT: error -2
[  123.892182] video0: VIDIOC_DQEVENT: error -2
[  123.897274] video0: VIDIOC_DQEVENT: error -2
[  123.901651] video0: VIDIOC_DQEVENT: error -2
[  123.906765] video0: VIDIOC_DQEVENT: error -2
[  123.911869] video0: VIDIOC_DQEVENT: error -2
[  123.916262] video0: VIDIOC_DQEVENT: error -2
[  123.921375] video0: VIDIOC_DQEVENT: error -2
[  123.926479] video0: VIDIOC_DQEVENT: error -2
[  123.931577] video0: VIDIOC_DQEVENT: error -2
[  123.935971] video0: VIDIOC_DQEVENT: error -2
[  123.941081] video0: VIDIOC_DQEVENT: error -2
[  123.946184] video0: VIDIOC_DQEVENT: error -2
[  123.950624] video0: VIDIOC_DQEVENT: error -2
[  123.955741] video0: VIDIOC_DQEVENT: error -2
[  123.960845] video0: VIDIOC_DQEVENT: error -2
[  123.965326] video0: VIDIOC_DQEVENT: error -2
[  123.970440] video0: VIDIOC_DQEVENT: error -2
[  123.975553] video0: VIDIOC_DQEVENT: error -2
[  123.980680] video0: VIDIOC_DQEVENT: error -2
[  123.985418] video0: VIDIOC_DQEVENT: error -2
[  123.990540] video0: VIDIOC_DQEVENT: error -2
[  123.995655] video0: VIDIOC_DQEVENT: error -2
[  124.000322] video0: VIDIOC_DQEVENT: error -2
[  124.005450] video0: VIDIOC_DQEVENT: error -2
[  124.010562] video0: VIDIOC_DQEVENT: error -2
[  124.015231] video0: VIDIOC_DQEVENT: error -2
[  124.020353] video0: VIDIOC_DQEVENT: error -2
[  124.025465] video0: VIDIOC_DQEVENT: error -2
[  124.030569] video0: VIDIOC_DQEVENT: error -2
[  124.035063] video0: VIDIOC_DQEVENT: error -2
[  124.040204] video0: VIDIOC_DQEVENT: error -2
[  124.045307] video0: VIDIOC_DQEVENT: error -2
[  124.049701] video0: VIDIOC_DQEVENT: error -2
[  124.054817] video0: VIDIOC_DQEVENT: error -2
[  124.059925] video0: VIDIOC_DQEVENT: error -2
[  124.064285] video0: VIDIOC_DQEVENT: error -2
[  124.069400] video0: VIDIOC_DQEVENT: error -2
[  124.074506] video0: VIDIOC_DQEVENT: error -2
[  124.079601] video0: VIDIOC_DQEVENT: error -2
[  124.083967] video0: VIDIOC_DQEVENT: error -2
[  124.089077] video0: VIDIOC_DQEVENT: error -2
[  124.094178] video0: VIDIOC_DQEVENT: error -2
[  124.098592] video0: VIDIOC_DQEVENT: error -2
[  124.103708] video0: VIDIOC_DQEVENT: error -2
[  124.108812] video0: VIDIOC_DQEVENT: error -2
[  124.113904] video0: VIDIOC_DQEVENT: error -2
[  124.118339] video0: VIDIOC_DQEVENT: error -2
[  124.123453] video0: VIDIOC_DQEVENT: error -2
[  124.128556] video0: VIDIOC_DQEVENT: error -2
[  124.132956] video0: VIDIOC_DQEVENT: error -2
[  124.138071] video0: VIDIOC_DQEVENT: error -2
[  124.143174] video0: VIDIOC_DQEVENT: error -2
[  124.147516] video0: VIDIOC_DQEVENT: error -2
[  124.152622] video0: VIDIOC_DQEVENT: error -2
[  124.157723] video0: VIDIOC_DQEVENT: error -2
[  124.162821] video0: VIDIOC_DQEVENT: error -2
[  124.167241] video0: VIDIOC_DQEVENT: error -2
[  124.172356] video0: VIDIOC_DQEVENT: error -2
[  124.177459] video0: VIDIOC_DQEVENT: error -2
[  124.181857] video0: VIDIOC_DQEVENT: error -2
[  124.186974] video0: VIDIOC_DQEVENT: error -2
[  124.192078] video0: VIDIOC_DQEVENT: error -2
[  124.197170] video0: VIDIOC_DQEVENT: error -2
[  124.201559] video0: VIDIOC_DQEVENT: error -2
[  124.206678] video0: VIDIOC_DQEVENT: error -2
[  124.211782] video0: VIDIOC_DQEVENT: error -2
[  124.216151] video0: VIDIOC_DQEVENT: error -2
[  124.221263] video0: VIDIOC_DQEVENT: error -2
[  124.226365] video0: VIDIOC_DQEVENT: error -2
[  124.231460] video0: VIDIOC_DQEVENT: error -2
[  124.235815] video0: VIDIOC_DQEVENT: error -2
[  124.240923] video0: VIDIOC_DQEVENT: error -2
[  124.246022] video0: VIDIOC_DQEVENT: error -2
[  124.250463] video0: VIDIOC_DQEVENT: error -2
[  124.255579] video0: VIDIOC_DQEVENT: error -2
[  124.260683] video0: VIDIOC_DQEVENT: error -2
[  124.265089] video0: VIDIOC_DQEVENT: error -2
[  124.270205] video0: VIDIOC_DQEVENT: error -2
[  124.275308] video0: VIDIOC_DQEVENT: error -2
[  124.280403] video0: VIDIOC_DQEVENT: error -2
[  124.284782] video0: VIDIOC_DQEVENT: error -2
[  124.289897] video0: VIDIOC_DQEVENT: error -2
[  124.294999] video0: VIDIOC_DQEVENT: error -2
[  124.299400] video0: VIDIOC_DQEVENT: error -2
[  124.304516] video0: VIDIOC_DQEVENT: error -2
[  124.309619] video0: VIDIOC_DQEVENT: error -2
[  124.314713] video0: VIDIOC_DQEVENT: error -2
[  124.319104] video0: VIDIOC_DQEVENT: error -2
[  124.324223] video0: VIDIOC_DQEVENT: error -2
[  124.329323] video0: VIDIOC_DQEVENT: error -2
[  124.333706] video0: VIDIOC_DQEVENT: error -2
[  124.338821] video0: VIDIOC_DQEVENT: error -2
[  124.343924] video0: VIDIOC_DQEVENT: error -2
[  124.348299] video0: VIDIOC_DQEVENT: error -2
[  124.353411] video0: VIDIOC_DQEVENT: error -2
[  124.358517] video0: VIDIOC_DQEVENT: error -2
[  124.363613] video0: VIDIOC_DQEVENT: error -2
[  124.367990] video0: VIDIOC_DQEVENT: error -2
[  124.373101] video0: VIDIOC_DQEVENT: error -2
[  124.378203] video0: VIDIOC_DQEVENT: error -2
[  124.382619] video0: VIDIOC_DQEVENT: error -2
[  124.387742] video0: VIDIOC_DQEVENT: error -2
[  124.392858] video0: VIDIOC_DQEVENT: error -2
[  124.397961] video0: VIDIOC_DQEVENT: error -2
[  124.402579] video0: VIDIOC_DQEVENT: error -2
[  124.407698] video0: VIDIOC_DQEVENT: error -2
[  124.412811] video0: VIDIOC_DQEVENT: error -2
[  124.417451] video0: VIDIOC_DQEVENT: error -2
[  124.422570] video0: VIDIOC_DQEVENT: error -2
[  124.427682] video0: VIDIOC_DQEVENT: error -2
[  124.432114] video0: VIDIOC_DQEVENT: error -2
[  124.437227] video0: VIDIOC_DQEVENT: error -2
[  124.442328] video0: VIDIOC_DQEVENT: error -2
[  124.447423] video0: VIDIOC_DQEVENT: error -2
[  124.451806] video0: VIDIOC_DQEVENT: error -2
[  124.456916] video0: VIDIOC_DQEVENT: error -2
[  124.462016] video0: VIDIOC_DQEVENT: error -2
[  124.466433] video0: VIDIOC_DQEVENT: error -2
[  124.471550] video0: VIDIOC_DQEVENT: error -2
[  124.476652] video0: VIDIOC_DQEVENT: error -2
[  124.481023] video0: VIDIOC_DQEVENT: error -2
[  124.486139] video0: VIDIOC_DQEVENT: error -2
[  124.491246] video0: VIDIOC_DQEVENT: error -2
[  124.496339] video0: VIDIOC_DQEVENT: error -2
[  124.500722] video0: VIDIOC_DQEVENT: error -2
[  124.505838] video0: VIDIOC_DQEVENT: error -2
[  124.510940] video0: VIDIOC_DQEVENT: error -2
[  124.515347] video0: VIDIOC_DQEVENT: error -2
[  124.520464] video0: VIDIOC_DQEVENT: error -2
[  124.525565] video0: VIDIOC_DQEVENT: error -2
[  124.530659] video0: VIDIOC_DQEVENT: error -2
[  124.535072] video0: VIDIOC_DQEVENT: error -2
[  124.540214] video0: VIDIOC_DQEVENT: error -2
[  124.545315] video0: VIDIOC_DQEVENT: error -2
[  124.549700] video0: VIDIOC_DQEVENT: error -2
[  124.554814] video0: VIDIOC_DQEVENT: error -2
[  124.559915] video0: VIDIOC_DQEVENT: error -2
[  124.564276] video0: VIDIOC_DQEVENT: error -2
[  124.569389] video0: VIDIOC_DQEVENT: error -2
[  124.574490] video0: VIDIOC_DQEVENT: error -2
[  124.579584] video0: VIDIOC_DQEVENT: error -2
[  124.583961] video0: VIDIOC_DQEVENT: error -2
[  124.589072] video0: VIDIOC_DQEVENT: error -2
[  124.594176] video0: VIDIOC_DQEVENT: error -2
[  124.598602] video0: VIDIOC_DQEVENT: error -2
[  124.603718] video0: VIDIOC_DQEVENT: error -2
[  124.608820] video0: VIDIOC_DQEVENT: error -2
[  124.613911] video0: VIDIOC_DQEVENT: error -2
[  124.618313] video0: VIDIOC_DQEVENT: error -2
[  124.623433] video0: VIDIOC_DQEVENT: error -2
[  124.628575] video0: VIDIOC_DQEVENT: error -2
[  124.633347] video0: VIDIOC_DQEVENT: error -2
[  124.638513] video0: VIDIOC_DQEVENT: error -2
[  124.643702] video0: VIDIOC_DQEVENT: error -2
[  124.648573] video0: VIDIOC_DQEVENT: error -2
[  124.653687] video0: VIDIOC_DQEVENT: error -2
[  124.658784] video0: VIDIOC_DQEVENT: error -2
[  124.663878] video0: VIDIOC_DQEVENT: error -2
[  124.668299] video0: VIDIOC_DQEVENT: error -2
[  124.673412] video0: VIDIOC_DQEVENT: error -2
[  124.678518] video0: VIDIOC_DQEVENT: error -2
[  124.682915] video0: VIDIOC_DQEVENT: error -2
[  124.688030] video0: VIDIOC_DQEVENT: error -2
[  124.693131] video0: VIDIOC_DQEVENT: error -2
[  124.698222] video0: VIDIOC_DQEVENT: error -2
[  124.702632] video0: VIDIOC_DQEVENT: error -2
[  124.707749] video0: VIDIOC_DQEVENT: error -2
[  124.712851] video0: VIDIOC_DQEVENT: error -2
[  124.717219] video0: VIDIOC_DQEVENT: error -2
[  124.722336] video0: VIDIOC_DQEVENT: error -2
[  124.727441] video0: VIDIOC_DQEVENT: error -2
[  124.731798] video0: VIDIOC_DQEVENT: error -2
[  124.736906] video0: VIDIOC_DQEVENT: error -2
[  124.742006] video0: VIDIOC_DQEVENT: error -2
[  124.747100] video0: VIDIOC_DQEVENT: error -2
[  124.751464] video0: VIDIOC_DQEVENT: error -2
[  124.756571] video0: VIDIOC_DQEVENT: error -2
[  124.761672] video0: VIDIOC_DQEVENT: error -2
[  124.766066] video0: VIDIOC_DQEVENT: error -2
[  124.771182] video0: VIDIOC_DQEVENT: error -2
[  124.776281] video0: VIDIOC_DQEVENT: error -2
[  124.781374] video0: VIDIOC_DQEVENT: error -2
[  124.785772] video0: VIDIOC_DQEVENT: error -2
[  124.790887] video0: VIDIOC_DQEVENT: error -2
[  124.795989] video0: VIDIOC_DQEVENT: error -2
[  124.800358] video0: VIDIOC_DQEVENT: error -2
[  124.805472] video0: VIDIOC_DQEVENT: error -2
[  124.810572] video0: VIDIOC_DQEVENT: error -2
[  124.814960] video0: VIDIOC_DQEVENT: error -2
[  124.820079] video0: VIDIOC_DQEVENT: error -2
[  124.825182] video0: VIDIOC_DQEVENT: error -2
[  124.830276] video0: VIDIOC_DQEVENT: error -2
[  124.831831] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  124.834700] video0: VIDIOC_DQEVENT: error -2
[  124.839817] video0: VIDIOC_DQEVENT: error -2
[  124.844919] video0: VIDIOC_DQEVENT: error -2
[  124.849291] video0: VIDIOC_DQEVENT: error -2
[  124.854406] video0: VIDIOC_DQEVENT: error -2
[  124.859507] video0: VIDIOC_DQEVENT: error -2
[  124.864597] video0: VIDIOC_DQEVENT: error -2
[  124.868969] video0: VIDIOC_DQEVENT: error -2
[  124.874082] video0: VIDIOC_DQEVENT: error -2
[  124.879183] video0: VIDIOC_DQEVENT: error -2
[  124.883540] video0: VIDIOC_DQEVENT: error -2
[  124.888645] video0: VIDIOC_DQEVENT: error -2
[  124.893745] video0: VIDIOC_DQEVENT: error -2
[  124.898151] video0: VIDIOC_DQEVENT: error -2
[  124.903267] video0: VIDIOC_DQEVENT: error -2
[  124.908368] video0: VIDIOC_DQEVENT: error -2
[  124.913459] video0: VIDIOC_DQEVENT: error -2
[  124.917846] video0: VIDIOC_DQEVENT: error -2
[  124.922963] video0: VIDIOC_DQEVENT: error -2
[  124.928080] video0: VIDIOC_DQEVENT: error -2
[  124.932515] video0: VIDIOC_DQEVENT: error -2
[  124.937631] video0: VIDIOC_DQEVENT: error -2
[  124.942733] video0: VIDIOC_DQEVENT: error -2
[  124.947827] video0: VIDIOC_DQEVENT: error -2
[  124.952197] video0: VIDIOC_DQEVENT: error -2
[  124.957311] video0: VIDIOC_DQEVENT: error -2
[  124.962416] video0: VIDIOC_DQEVENT: error -2
[  124.967076] video0: VIDIOC_DQEVENT: error -2
[  124.972212] video0: VIDIOC_DQEVENT: error -2
[  124.977314] video0: VIDIOC_DQEVENT: error -2
[  124.981708] video0: VIDIOC_DQEVENT: error -2
[  124.986822] video0: VIDIOC_DQEVENT: error -2
[  124.991924] video0: VIDIOC_DQEVENT: error -2
[  124.997019] video0: VIDIOC_DQEVENT: error -2
[  125.001405] video0: VIDIOC_DQEVENT: error -2
[  125.006519] video0: VIDIOC_DQEVENT: error -2
[  125.011624] video0: VIDIOC_DQEVENT: error -2
[  125.016002] video0: VIDIOC_DQEVENT: error -2
[  125.021109] video0: VIDIOC_DQEVENT: error -2
[  125.026210] video0: VIDIOC_DQEVENT: error -2
[  125.031304] video0: VIDIOC_DQEVENT: error -2
[  125.035679] video0: VIDIOC_DQEVENT: error -2
[  125.040786] video0: VIDIOC_DQEVENT: error -2
[  125.045888] video0: VIDIOC_DQEVENT: error -2
[  125.050315] video0: VIDIOC_DQEVENT: error -2
[  125.055432] video0: VIDIOC_DQEVENT: error -2
[  125.060534] video0: VIDIOC_DQEVENT: error -2
[  125.064912] video0: VIDIOC_DQEVENT: error -2
[  125.070025] video0: VIDIOC_DQEVENT: error -2
[  125.075128] video0: VIDIOC_DQEVENT: error -2
[  125.080219] video0: VIDIOC_DQEVENT: error -2
[  125.084593] video0: VIDIOC_DQEVENT: error -2
[  125.089708] video0: VIDIOC_DQEVENT: error -2
[  125.094812] video0: VIDIOC_DQEVENT: error -2
[  125.099230] video0: VIDIOC_DQEVENT: error -2
[  125.104344] video0: VIDIOC_DQEVENT: error -2
[  125.109444] video0: VIDIOC_DQEVENT: error -2
[  125.114539] video0: VIDIOC_DQEVENT: error -2
[  125.118935] video0: VIDIOC_DQEVENT: error -2
[  125.124052] video0: VIDIOC_DQEVENT: error -2
[  125.129156] video0: VIDIOC_DQEVENT: error -2
[  125.133546] video0: VIDIOC_DQEVENT: error -2
[  125.138661] video0: VIDIOC_DQEVENT: error -2
[  125.143764] video0: VIDIOC_DQEVENT: error -2
[  125.148148] video0: VIDIOC_DQEVENT: error -2
[  125.153259] video0: VIDIOC_DQEVENT: error -2
[  125.158358] video0: VIDIOC_DQEVENT: error -2
[  125.163452] video0: VIDIOC_DQEVENT: error -2
[  125.167824] video0: VIDIOC_DQEVENT: error -2
[  125.172931] video0: VIDIOC_DQEVENT: error -2
[  125.178032] video0: VIDIOC_DQEVENT: error -2
[  125.182468] video0: VIDIOC_DQEVENT: error -2
[  125.187585] video0: VIDIOC_DQEVENT: error -2
[  125.192691] video0: VIDIOC_DQEVENT: error -2
[  125.197785] video0: VIDIOC_DQEVENT: error -2
[  125.202205] video0: VIDIOC_DQEVENT: error -2
[  125.207320] video0: VIDIOC_DQEVENT: error -2
[  125.212420] video0: VIDIOC_DQEVENT: error -2
[  125.216808] video0: VIDIOC_DQEVENT: error -2
[  125.221922] video0: VIDIOC_DQEVENT: error -2
[  125.227023] video0: VIDIOC_DQEVENT: error -2
[  125.231413] video0: VIDIOC_DQEVENT: error -2
[  125.236529] video0: VIDIOC_DQEVENT: error -2
[  125.241632] video0: VIDIOC_DQEVENT: error -2
[  125.246727] video0: VIDIOC_DQEVENT: error -2
[  125.251148] video0: VIDIOC_DQEVENT: error -2
[  125.256261] video0: VIDIOC_DQEVENT: error -2
[  125.261363] video0: VIDIOC_DQEVENT: error -2
[  125.265775] video0: VIDIOC_DQEVENT: error -2
[  125.270889] video0: VIDIOC_DQEVENT: error -2
[  125.275994] video0: VIDIOC_DQEVENT: error -2
[  125.281088] video0: VIDIOC_DQEVENT: error -2
[  125.285456] video0: VIDIOC_DQEVENT: error -2
[  125.290570] video0: VIDIOC_DQEVENT: error -2
[  125.295671] video0: VIDIOC_DQEVENT: error -2
[  125.300057] video0: VIDIOC_DQEVENT: error -2
[  125.305169] video0: VIDIOC_DQEVENT: error -2
[  125.310272] video0: VIDIOC_DQEVENT: error -2
[  125.314678] video0: VIDIOC_DQEVENT: error -2
[  125.319793] video0: VIDIOC_DQEVENT: error -2
[  125.324894] video0: VIDIOC_DQEVENT: error -2
[  125.329987] video0: VIDIOC_DQEVENT: error -2
[  125.334426] video0: VIDIOC_DQEVENT: error -2
[  125.339543] video0: VIDIOC_DQEVENT: error -2
[  125.344643] video0: VIDIOC_DQEVENT: error -2
[  125.349022] video0: VIDIOC_DQEVENT: error -2
[  125.354138] video0: VIDIOC_DQEVENT: error -2
[  125.359241] video0: VIDIOC_DQEVENT: error -2
[  125.364333] video0: VIDIOC_DQEVENT: error -2
[  125.368709] video0: VIDIOC_DQEVENT: error -2
[  125.373823] video0: VIDIOC_DQEVENT: error -2
[  125.378924] video0: VIDIOC_DQEVENT: error -2
[  125.383321] video0: VIDIOC_DQEVENT: error -2
[  125.388438] video0: VIDIOC_DQEVENT: error -2
[  125.393542] video0: VIDIOC_DQEVENT: error -2
[  125.397948] video0: VIDIOC_DQEVENT: error -2
[  125.403063] video0: VIDIOC_DQEVENT: error -2
[  125.408180] video0: VIDIOC_DQEVENT: error -2
[  125.413276] video0: VIDIOC_DQEVENT: error -2
[  125.417662] video0: VIDIOC_DQEVENT: error -2
[  125.422778] video0: VIDIOC_DQEVENT: error -2
[  125.427881] video0: VIDIOC_DQEVENT: error -2
[  125.432253] video0: VIDIOC_DQEVENT: error -2
[  125.437365] video0: VIDIOC_DQEVENT: error -2
[  125.442467] video0: VIDIOC_DQEVENT: error -2
[  125.447563] video0: VIDIOC_DQEVENT: error -2
[  125.451947] video0: VIDIOC_DQEVENT: error -2
[  125.457057] video0: VIDIOC_DQEVENT: error -2
[  125.462159] video0: VIDIOC_DQEVENT: error -2
[  125.466585] video0: VIDIOC_DQEVENT: error -2
[  125.471701] video0: VIDIOC_DQEVENT: error -2
[  125.476803] video0: VIDIOC_DQEVENT: error -2
[  125.481173] video0: VIDIOC_DQEVENT: error -2
[  125.486288] video0: VIDIOC_DQEVENT: error -2
[  125.491392] video0: VIDIOC_DQEVENT: error -2
[  125.496484] video0: VIDIOC_DQEVENT: error -2
[  125.500872] video0: VIDIOC_DQEVENT: error -2
[  125.505988] video0: VIDIOC_DQEVENT: error -2
[  125.511090] video0: VIDIOC_DQEVENT: error -2
[  125.515483] video0: VIDIOC_DQEVENT: error -2
[  125.520591] video0: VIDIOC_DQEVENT: error -2
[  125.525691] video0: VIDIOC_DQEVENT: error -2
[  125.530782] video0: VIDIOC_DQEVENT: error -2
[  125.535229] video0: VIDIOC_DQEVENT: error -2
[  125.540341] video0: VIDIOC_DQEVENT: error -2
[  125.545441] video0: VIDIOC_DQEVENT: error -2
[  125.549840] video0: VIDIOC_DQEVENT: error -2
[  125.554954] video0: VIDIOC_DQEVENT: error -2
[  125.560057] video0: VIDIOC_DQEVENT: error -2
[  125.564425] video0: VIDIOC_DQEVENT: error -2
[  125.569539] video0: VIDIOC_DQEVENT: error -2
[  125.574640] video0: VIDIOC_DQEVENT: error -2
[  125.579736] video0: VIDIOC_DQEVENT: error -2
[  125.584114] video0: VIDIOC_DQEVENT: error -2
[  125.589225] video0: VIDIOC_DQEVENT: error -2
[  125.594327] video0: VIDIOC_DQEVENT: error -2
[  125.598738] video0: VIDIOC_DQEVENT: error -2
[  125.603855] video0: VIDIOC_DQEVENT: error -2
[  125.608964] video0: VIDIOC_DQEVENT: error -2
[  125.614054] video0: VIDIOC_DQEVENT: error -2
[  125.618523] video0: VIDIOC_DQEVENT: error -2
[  125.623638] video0: VIDIOC_DQEVENT: error -2
[  125.628738] video0: VIDIOC_DQEVENT: error -2
[  125.633159] video0: VIDIOC_DQEVENT: error -2
[  125.638274] video0: VIDIOC_DQEVENT: error -2
[  125.643378] video0: VIDIOC_DQEVENT: error -2
[  125.647745] video0: VIDIOC_DQEVENT: error -2
[  125.652852] video0: VIDIOC_DQEVENT: error -2
[  125.657950] video0: VIDIOC_DQEVENT: error -2
[  125.663044] video0: VIDIOC_DQEVENT: error -2
[  125.667439] video0: VIDIOC_DQEVENT: error -2
[  125.672554] video0: VIDIOC_DQEVENT: error -2
[  125.677657] video0: VIDIOC_DQEVENT: error -2
[  125.682065] video0: VIDIOC_DQEVENT: error -2
[  125.687180] video0: VIDIOC_DQEVENT: error -2
[  125.692281] video0: VIDIOC_DQEVENT: error -2
[  125.697375] video0: VIDIOC_DQEVENT: error -2
[  125.701781] video0: VIDIOC_DQEVENT: error -2
[  125.706897] video0: VIDIOC_DQEVENT: error -2
[  125.712002] video0: VIDIOC_DQEVENT: error -2
[  125.716402] video0: VIDIOC_DQEVENT: error -2
[  125.721516] video0: VIDIOC_DQEVENT: error -2
[  125.726616] video0: VIDIOC_DQEVENT: error -2
[  125.731015] video0: VIDIOC_DQEVENT: error -2
[  125.736131] video0: VIDIOC_DQEVENT: error -2
[  125.741234] video0: VIDIOC_DQEVENT: error -2
[  125.746333] video0: VIDIOC_DQEVENT: error -2
[  125.750768] video0: VIDIOC_DQEVENT: error -2
[  125.755883] video0: VIDIOC_DQEVENT: error -2
[  125.760986] video0: VIDIOC_DQEVENT: error -2
[  125.765375] video0: VIDIOC_DQEVENT: error -2
[  125.770490] video0: VIDIOC_DQEVENT: error -2
[  125.775591] video0: VIDIOC_DQEVENT: error -2
[  125.780683] video0: VIDIOC_DQEVENT: error -2
[  125.785068] video0: VIDIOC_DQEVENT: error -2
[  125.790183] video0: VIDIOC_DQEVENT: error -2
[  125.795285] video0: VIDIOC_DQEVENT: error -2
[  125.799659] video0: VIDIOC_DQEVENT: error -2
[  125.804765] video0: VIDIOC_DQEVENT: error -2
[  125.809864] video0: VIDIOC_DQEVENT: error -2
[  125.814285] video0: VIDIOC_DQEVENT: error -2
[  125.819401] video0: VIDIOC_DQEVENT: error -2
[  125.824505] video0: VIDIOC_DQEVENT: error -2
[  125.829602] video0: VIDIOC_DQEVENT: error -2
[  125.834013] video0: VIDIOC_DQEVENT: error -2
[  125.839129] video0: VIDIOC_DQEVENT: error -2
[  125.844234] video0: VIDIOC_DQEVENT: error -2
[  125.848630] video0: VIDIOC_DQEVENT: error -2
[  125.853745] video0: VIDIOC_DQEVENT: error -2
[  125.855708] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  125.858846] video0: VIDIOC_DQEVENT: error -2
[  125.863941] video0: VIDIOC_DQEVENT: error -2
[  125.868327] video0: VIDIOC_DQEVENT: error -2
[  125.873440] video0: VIDIOC_DQEVENT: error -2
[  125.878541] video0: VIDIOC_DQEVENT: error -2
[  125.882942] video0: VIDIOC_DQEVENT: error -2
[  125.888057] video0: VIDIOC_DQEVENT: error -2
[  125.893159] video0: VIDIOC_DQEVENT: error -2
[  125.898253] video0: VIDIOC_DQEVENT: error -2
[  125.902685] video0: VIDIOC_DQEVENT: error -2
[  125.907800] video0: VIDIOC_DQEVENT: error -2
[  125.912904] video0: VIDIOC_DQEVENT: error -2
[  125.917284] video0: VIDIOC_DQEVENT: error -2
[  125.922401] video0: VIDIOC_DQEVENT: error -2
[  125.927509] video0: VIDIOC_DQEVENT: error -2
[  125.931925] video0: VIDIOC_DQEVENT: error -2
[  125.937034] video0: VIDIOC_DQEVENT: error -2
[  125.942135] video0: VIDIOC_DQEVENT: error -2
[  125.947227] video0: VIDIOC_DQEVENT: error -2
[  125.951597] video0: VIDIOC_DQEVENT: error -2
[  125.956703] video0: VIDIOC_DQEVENT: error -2
[  125.961803] video0: VIDIOC_DQEVENT: error -2
[  125.966233] video0: VIDIOC_DQEVENT: error -2
[  125.971349] video0: VIDIOC_DQEVENT: error -2
[  125.976451] video0: VIDIOC_DQEVENT: error -2
[  125.981544] video0: VIDIOC_DQEVENT: error -2
[  125.985939] video0: VIDIOC_DQEVENT: error -2
[  125.991054] video0: VIDIOC_DQEVENT: error -2
[  125.996173] video0: VIDIOC_DQEVENT: error -2
[  126.000564] video0: VIDIOC_DQEVENT: error -2
[  126.005681] video0: VIDIOC_DQEVENT: error -2
[  126.010783] video0: VIDIOC_DQEVENT: error -2
[  126.015222] video0: VIDIOC_DQEVENT: error -2
[  126.020335] video0: VIDIOC_DQEVENT: error -2
[  126.025435] video0: VIDIOC_DQEVENT: error -2
[  126.030528] video0: VIDIOC_DQEVENT: error -2
[  126.034932] video0: VIDIOC_DQEVENT: error -2
[  126.040051] video0: VIDIOC_DQEVENT: error -2
[  126.045153] video0: VIDIOC_DQEVENT: error -2
[  126.049532] video0: VIDIOC_DQEVENT: error -2
[  126.054647] video0: VIDIOC_DQEVENT: error -2
[  126.059750] video0: VIDIOC_DQEVENT: error -2
[  126.064844] video0: VIDIOC_DQEVENT: error -2
[  126.069224] video0: VIDIOC_DQEVENT: error -2
[  126.074338] video0: VIDIOC_DQEVENT: error -2
[  126.079442] video0: VIDIOC_DQEVENT: error -2
[  126.083813] video0: VIDIOC_DQEVENT: error -2
[  126.088921] video0: VIDIOC_DQEVENT: error -2
[  126.094022] video0: VIDIOC_DQEVENT: error -2
[  126.098461] video0: VIDIOC_DQEVENT: error -2
[  126.103576] video0: VIDIOC_DQEVENT: error -2
[  126.108680] video0: VIDIOC_DQEVENT: error -2
[  126.113773] video0: VIDIOC_DQEVENT: error -2
[  126.118231] video0: VIDIOC_DQEVENT: error -2
[  126.123347] video0: VIDIOC_DQEVENT: error -2
[  126.128449] video0: VIDIOC_DQEVENT: error -2
[  126.132843] video0: VIDIOC_DQEVENT: error -2
[  126.137958] video0: VIDIOC_DQEVENT: error -2
[  126.143059] video0: VIDIOC_DQEVENT: error -2
[  126.148170] video0: VIDIOC_DQEVENT: error -2
[  126.152545] video0: VIDIOC_DQEVENT: error -2
[  126.157660] video0: VIDIOC_DQEVENT: error -2
[  126.162763] video0: VIDIOC_DQEVENT: error -2
[  126.167175] video0: VIDIOC_DQEVENT: error -2
[  126.172287] video0: VIDIOC_DQEVENT: error -2
[  126.177388] video0: VIDIOC_DQEVENT: error -2
[  126.181781] video0: VIDIOC_DQEVENT: error -2
[  126.186897] video0: VIDIOC_DQEVENT: error -2
[  126.192002] video0: VIDIOC_DQEVENT: error -2
[  126.197095] video0: VIDIOC_DQEVENT: error -2
[  126.201503] video0: VIDIOC_DQEVENT: error -2
[  126.206618] video0: VIDIOC_DQEVENT: error -2
[  126.211720] video0: VIDIOC_DQEVENT: error -2
[  126.216093] video0: VIDIOC_DQEVENT: error -2
[  126.221202] video0: VIDIOC_DQEVENT: error -2
[  126.226304] video0: VIDIOC_DQEVENT: error -2
[  126.231398] video0: VIDIOC_DQEVENT: error -2
[  126.235783] video0: VIDIOC_DQEVENT: error -2
[  126.240891] video0: VIDIOC_DQEVENT: error -2
[  126.245992] video0: VIDIOC_DQEVENT: error -2
[  126.250425] video0: VIDIOC_DQEVENT: error -2
[  126.255541] video0: VIDIOC_DQEVENT: error -2
[  126.260643] video0: VIDIOC_DQEVENT: error -2
[  126.265027] video0: VIDIOC_DQEVENT: error -2
[  126.270142] video0: VIDIOC_DQEVENT: error -2
[  126.275243] video0: VIDIOC_DQEVENT: error -2
[  126.280336] video0: VIDIOC_DQEVENT: error -2
[  126.284715] video0: VIDIOC_DQEVENT: error -2
[  126.289830] video0: VIDIOC_DQEVENT: error -2
[  126.294931] video0: VIDIOC_DQEVENT: error -2
[  126.299336] video0: VIDIOC_DQEVENT: error -2
[  126.304451] video0: VIDIOC_DQEVENT: error -2
[  126.309550] video0: VIDIOC_DQEVENT: error -2
[  126.314644] video0: VIDIOC_DQEVENT: error -2
[  126.319033] video0: VIDIOC_DQEVENT: error -2
[  126.324186] video0: VIDIOC_DQEVENT: error -2
[  126.329288] video0: VIDIOC_DQEVENT: error -2
[  126.333688] video0: VIDIOC_DQEVENT: error -2
[  126.338802] video0: VIDIOC_DQEVENT: error -2
[  126.343905] video0: VIDIOC_DQEVENT: error -2
[  126.348294] video0: VIDIOC_DQEVENT: error -2
[  126.353407] video0: VIDIOC_DQEVENT: error -2
[  126.358507] video0: VIDIOC_DQEVENT: error -2
[  126.363600] video0: VIDIOC_DQEVENT: error -2
[  126.367956] video0: VIDIOC_DQEVENT: error -2
[  126.373064] video0: VIDIOC_DQEVENT: error -2
[  126.378164] video0: VIDIOC_DQEVENT: error -2
[  126.382589] video0: VIDIOC_DQEVENT: error -2
[  126.387706] video0: VIDIOC_DQEVENT: error -2
[  126.392810] video0: VIDIOC_DQEVENT: error -2
[  126.397904] video0: VIDIOC_DQEVENT: error -2
[  126.402349] video0: VIDIOC_DQEVENT: error -2
[  126.407466] video0: VIDIOC_DQEVENT: error -2
[  126.412568] video0: VIDIOC_DQEVENT: error -2
[  126.416949] video0: VIDIOC_DQEVENT: error -2
[  126.422064] video0: VIDIOC_DQEVENT: error -2
[  126.427167] video0: VIDIOC_DQEVENT: error -2
[  126.431552] video0: VIDIOC_DQEVENT: error -2
[  126.436658] video0: VIDIOC_DQEVENT: error -2
[  126.441757] video0: VIDIOC_DQEVENT: error -2
[  126.446850] video0: VIDIOC_DQEVENT: error -2
[  126.451269] video0: VIDIOC_DQEVENT: error -2
[  126.456383] video0: VIDIOC_DQEVENT: error -2
[  126.461484] video0: VIDIOC_DQEVENT: error -2
[  126.465995] video0: VIDIOC_DQEVENT: error -2
[  126.471120] video0: VIDIOC_DQEVENT: error -2
[  126.476222] video0: VIDIOC_DQEVENT: error -2
[  126.481318] video0: VIDIOC_DQEVENT: error -2
[  126.485711] video0: VIDIOC_DQEVENT: error -2
[  126.490825] video0: VIDIOC_DQEVENT: error -2
[  126.495928] video0: VIDIOC_DQEVENT: error -2
[  126.500325] video0: VIDIOC_DQEVENT: error -2
[  126.505438] video0: VIDIOC_DQEVENT: error -2
[  126.510542] video0: VIDIOC_DQEVENT: error -2
[  126.514977] video0: VIDIOC_DQEVENT: error -2
[  126.520095] video0: VIDIOC_DQEVENT: error -2
[  126.525197] video0: VIDIOC_DQEVENT: error -2
[  126.530293] video0: VIDIOC_DQEVENT: error -2
[  126.534815] video0: VIDIOC_DQEVENT: error -2
[  126.539942] video0: VIDIOC_DQEVENT: error -2
[  126.545044] video0: VIDIOC_DQEVENT: error -2
[  126.549533] video0: VIDIOC_DQEVENT: error -2
[  126.554658] video0: VIDIOC_DQEVENT: error -2
[  126.559759] video0: VIDIOC_DQEVENT: error -2
[  126.564855] video0: VIDIOC_DQEVENT: error -2
[  126.569358] video0: VIDIOC_DQEVENT: error -2
[  126.574483] video0: VIDIOC_DQEVENT: error -2
[  126.579585] video0: VIDIOC_DQEVENT: error -2
[  126.584071] video0: VIDIOC_DQEVENT: error -2
[  126.589188] video0: VIDIOC_DQEVENT: error -2
[  126.594288] video0: VIDIOC_DQEVENT: error -2
[  126.598825] video0: VIDIOC_DQEVENT: error -2
[  126.603951] video0: VIDIOC_DQEVENT: error -2
[  126.609053] video0: VIDIOC_DQEVENT: error -2
[  126.614145] video0: VIDIOC_DQEVENT: error -2
[  126.618673] video0: VIDIOC_DQEVENT: error -2
[  126.623798] video0: VIDIOC_DQEVENT: error -2
[  126.628898] video0: VIDIOC_DQEVENT: error -2
[  126.633313] video0: VIDIOC_DQEVENT: error -2
[  126.638428] video0: VIDIOC_DQEVENT: error -2
[  126.643531] video0: VIDIOC_DQEVENT: error -2
[  126.647907] video0: VIDIOC_DQEVENT: error -2
[  126.653015] video0: VIDIOC_DQEVENT: error -2
[  126.658117] video0: VIDIOC_DQEVENT: error -2
[  126.663213] video0: VIDIOC_DQEVENT: error -2
[  126.667690] video0: VIDIOC_DQEVENT: error -2
[  126.672807] video0: VIDIOC_DQEVENT: error -2
[  126.677906] video0: VIDIOC_DQEVENT: error -2
[  126.682346] video0: VIDIOC_DQEVENT: error -2
[  126.687462] video0: VIDIOC_DQEVENT: error -2
[  126.692566] video0: VIDIOC_DQEVENT: error -2
[  126.697658] video0: VIDIOC_DQEVENT: error -2
[  126.702073] video0: VIDIOC_DQEVENT: error -2
[  126.707188] video0: VIDIOC_DQEVENT: error -2
[  126.712290] video0: VIDIOC_DQEVENT: error -2
[  126.716694] video0: VIDIOC_DQEVENT: error -2
[  126.721809] video0: VIDIOC_DQEVENT: error -2
[  126.726910] video0: VIDIOC_DQEVENT: error -2
[  126.731425] video0: VIDIOC_DQEVENT: error -2
[  126.736550] video0: VIDIOC_DQEVENT: error -2
[  126.741652] video0: VIDIOC_DQEVENT: error -2
[  126.746747] video0: VIDIOC_DQEVENT: error -2
[  126.751281] video0: VIDIOC_DQEVENT: error -2
[  126.756404] video0: VIDIOC_DQEVENT: error -2
[  126.761504] video0: VIDIOC_DQEVENT: error -2
[  126.765921] video0: VIDIOC_DQEVENT: error -2
[  126.771035] video0: VIDIOC_DQEVENT: error -2
[  126.776144] video0: VIDIOC_DQEVENT: error -2
[  126.781246] video0: VIDIOC_DQEVENT: error -2
[  126.785939] video0: VIDIOC_DQEVENT: error -2
[  126.791060] video0: VIDIOC_DQEVENT: error -2
[  126.796184] video0: VIDIOC_DQEVENT: error -2
[  126.800689] video0: VIDIOC_DQEVENT: error -2
[  126.805807] video0: VIDIOC_DQEVENT: error -2
[  126.810907] video0: VIDIOC_DQEVENT: error -2
[  126.815312] video0: VIDIOC_DQEVENT: error -2
[  126.820430] video0: VIDIOC_DQEVENT: error -2
[  126.825530] video0: VIDIOC_DQEVENT: error -2
[  126.830622] video0: VIDIOC_DQEVENT: error -2
[  126.835024] video0: VIDIOC_DQEVENT: error -2
[  126.840147] video0: VIDIOC_DQEVENT: error -2
[  126.845259] video0: VIDIOC_DQEVENT: error -2
[  126.849687] video0: VIDIOC_DQEVENT: error -2
[  126.854802] video0: VIDIOC_DQEVENT: error -2
[  126.859905] video0: VIDIOC_DQEVENT: error -2
[  126.864270] video0: VIDIOC_DQEVENT: error -2
[  126.869384] video0: VIDIOC_DQEVENT: error -2
[  126.874488] video0: VIDIOC_DQEVENT: error -2
[  126.879581] video0: VIDIOC_DQEVENT: error -2
[  126.879706] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  126.883957] video0: VIDIOC_DQEVENT: error -2
[  126.889065] video0: VIDIOC_DQEVENT: error -2
[  126.894164] video0: VIDIOC_DQEVENT: error -2
[  126.898594] video0: VIDIOC_DQEVENT: error -2
[  126.903712] video0: VIDIOC_DQEVENT: error -2
[  126.908814] video0: VIDIOC_DQEVENT: error -2
[  126.913904] video0: VIDIOC_DQEVENT: error -2
[  126.918333] video0: VIDIOC_DQEVENT: error -2
[  126.923450] video0: VIDIOC_DQEVENT: error -2
[  126.928551] video0: VIDIOC_DQEVENT: error -2
[  126.932929] video0: VIDIOC_DQEVENT: error -2
[  126.938044] video0: VIDIOC_DQEVENT: error -2
[  126.943146] video0: VIDIOC_DQEVENT: error -2
[  126.948238] video0: VIDIOC_DQEVENT: error -2
[  126.952625] video0: VIDIOC_DQEVENT: error -2
[  126.957739] video0: VIDIOC_DQEVENT: error -2
[  126.962840] video0: VIDIOC_DQEVENT: error -2
[  126.967248] video0: VIDIOC_DQEVENT: error -2
[  126.972361] video0: VIDIOC_DQEVENT: error -2
[  126.977463] video0: VIDIOC_DQEVENT: error -2
[  126.981864] video0: VIDIOC_DQEVENT: error -2
[  126.986979] video0: VIDIOC_DQEVENT: error -2
[  126.992082] video0: VIDIOC_DQEVENT: error -2
[  126.997176] video0: VIDIOC_DQEVENT: error -2
[  127.001573] video0: VIDIOC_DQEVENT: error -2
[  127.006690] video0: VIDIOC_DQEVENT: error -2
[  127.011794] video0: VIDIOC_DQEVENT: error -2
[  127.016171] video0: VIDIOC_DQEVENT: error -2
[  127.021284] video0: VIDIOC_DQEVENT: error -2
[  127.026391] video0: VIDIOC_DQEVENT: error -2
[  127.031485] video0: VIDIOC_DQEVENT: error -2
[  127.035900] video0: VIDIOC_DQEVENT: error -2
[  127.041008] video0: VIDIOC_DQEVENT: error -2
[  127.046109] video0: VIDIOC_DQEVENT: error -2
[  127.050541] video0: VIDIOC_DQEVENT: error -2
[  127.055657] video0: VIDIOC_DQEVENT: error -2
[  127.060758] video0: VIDIOC_DQEVENT: error -2
[  127.065135] video0: VIDIOC_DQEVENT: error -2
[  127.070250] video0: VIDIOC_DQEVENT: error -2
[  127.075351] video0: VIDIOC_DQEVENT: error -2
[  127.080445] video0: VIDIOC_DQEVENT: error -2
[  127.084851] video0: VIDIOC_DQEVENT: error -2
[  127.089966] video0: VIDIOC_DQEVENT: error -2
[  127.095068] video0: VIDIOC_DQEVENT: error -2
[  127.099437] video0: VIDIOC_DQEVENT: error -2
[  127.104551] video0: VIDIOC_DQEVENT: error -2
[  127.109651] video0: VIDIOC_DQEVENT: error -2
[  127.114744] video0: VIDIOC_DQEVENT: error -2
[  127.119193] video0: VIDIOC_DQEVENT: error -2
[  127.124307] video0: VIDIOC_DQEVENT: error -2
[  127.129408] video0: VIDIOC_DQEVENT: error -2
[  127.133788] video0: VIDIOC_DQEVENT: error -2
[  127.138904] video0: VIDIOC_DQEVENT: error -2
[  127.144008] video0: VIDIOC_DQEVENT: error -2
[  127.148392] video0: VIDIOC_DQEVENT: error -2
[  127.153506] video0: VIDIOC_DQEVENT: error -2
[  127.158608] video0: VIDIOC_DQEVENT: error -2
[  127.163701] video0: VIDIOC_DQEVENT: error -2
[  127.168065] video0: VIDIOC_DQEVENT: error -2
[  127.173175] video0: VIDIOC_DQEVENT: error -2
[  127.178274] video0: VIDIOC_DQEVENT: error -2
[  127.182705] video0: VIDIOC_DQEVENT: error -2
[  127.187823] video0: VIDIOC_DQEVENT: error -2
[  127.192924] video0: VIDIOC_DQEVENT: error -2
[  127.198014] video0: VIDIOC_DQEVENT: error -2
[  127.202443] video0: VIDIOC_DQEVENT: error -2
[  127.207559] video0: VIDIOC_DQEVENT: error -2
[  127.212660] video0: VIDIOC_DQEVENT: error -2
[  127.217034] video0: VIDIOC_DQEVENT: error -2
[  127.222148] video0: VIDIOC_DQEVENT: error -2
[  127.227249] video0: VIDIOC_DQEVENT: error -2
[  127.231598] video0: VIDIOC_DQEVENT: error -2
[  127.236707] video0: VIDIOC_DQEVENT: error -2
[  127.241805] video0: VIDIOC_DQEVENT: error -2
[  127.246896] video0: VIDIOC_DQEVENT: error -2
[  127.251300] video0: VIDIOC_DQEVENT: error -2
[  127.256415] video0: VIDIOC_DQEVENT: error -2
[  127.261517] video0: VIDIOC_DQEVENT: error -2
[  127.265915] video0: VIDIOC_DQEVENT: error -2
[  127.271030] video0: VIDIOC_DQEVENT: error -2
[  127.276133] video0: VIDIOC_DQEVENT: error -2
[  127.281226] video0: VIDIOC_DQEVENT: error -2
[  127.285638] video0: VIDIOC_DQEVENT: error -2
[  127.290759] video0: VIDIOC_DQEVENT: error -2
[  127.295859] video0: VIDIOC_DQEVENT: error -2
[  127.300262] video0: VIDIOC_DQEVENT: error -2
[  127.305383] video0: VIDIOC_DQEVENT: error -2
[  127.310487] video0: VIDIOC_DQEVENT: error -2
[  127.315018] video0: VIDIOC_DQEVENT: error -2
[  127.320167] video0: VIDIOC_DQEVENT: error -2
[  127.325266] video0: VIDIOC_DQEVENT: error -2
[  127.330356] video0: VIDIOC_DQEVENT: error -2
[  127.334793] video0: VIDIOC_DQEVENT: error -2
[  127.339907] video0: VIDIOC_DQEVENT: error -2
[  127.345010] video0: VIDIOC_DQEVENT: error -2
[  127.349443] video0: VIDIOC_DQEVENT: error -2
[  127.354565] video0: VIDIOC_DQEVENT: error -2
[  127.359670] video0: VIDIOC_DQEVENT: error -2
[  127.364769] video0: VIDIOC_DQEVENT: error -2
[  127.369466] video0: VIDIOC_DQEVENT: error -2
[  127.374587] video0: VIDIOC_DQEVENT: error -2
[  127.379696] video0: VIDIOC_DQEVENT: error -2
[  127.384371] video0: VIDIOC_DQEVENT: error -2
[  127.389489] video0: VIDIOC_DQEVENT: error -2
[  127.394597] video0: VIDIOC_DQEVENT: error -2
[  127.399339] video0: VIDIOC_DQEVENT: error -2
[  127.404458] video0: VIDIOC_DQEVENT: error -2
[  127.409563] video0: VIDIOC_DQEVENT: error -2
[  127.414661] video0: VIDIOC_DQEVENT: error -2
[  127.419364] video0: VIDIOC_DQEVENT: error -2
[  127.424485] video0: VIDIOC_DQEVENT: error -2
[  127.429593] video0: VIDIOC_DQEVENT: error -2
[  127.434323] video0: VIDIOC_DQEVENT: error -2
[  127.439443] video0: VIDIOC_DQEVENT: error -2
[  127.444548] video0: VIDIOC_DQEVENT: error -2
[  127.449190] video0: VIDIOC_DQEVENT: error -2
[  127.454310] video0: VIDIOC_DQEVENT: error -2
[  127.459415] video0: VIDIOC_DQEVENT: error -2
[  127.464513] video0: VIDIOC_DQEVENT: error -2
[  127.469140] video0: VIDIOC_DQEVENT: error -2
[  127.474260] video0: VIDIOC_DQEVENT: error -2
[  127.479363] video0: VIDIOC_DQEVENT: error -2
[  127.483956] video0: VIDIOC_DQEVENT: error -2
[  127.489071] video0: VIDIOC_DQEVENT: error -2
[  127.494173] video0: VIDIOC_DQEVENT: error -2
[  127.498861] video0: VIDIOC_DQEVENT: error -2
[  127.503984] video0: VIDIOC_DQEVENT: error -2
[  127.509088] video0: VIDIOC_DQEVENT: error -2
[  127.514187] video0: VIDIOC_DQEVENT: error -2
[  127.518889] video0: VIDIOC_DQEVENT: error -2
[  127.524010] video0: VIDIOC_DQEVENT: error -2
[  127.529114] video0: VIDIOC_DQEVENT: error -2
[  127.533736] video0: VIDIOC_DQEVENT: error -2
[  127.538855] video0: VIDIOC_DQEVENT: error -2
[  127.543960] video0: VIDIOC_DQEVENT: error -2
[  127.548603] video0: VIDIOC_DQEVENT: error -2
[  127.553722] video0: VIDIOC_DQEVENT: error -2
[  127.558826] video0: VIDIOC_DQEVENT: error -2
[  127.563923] video0: VIDIOC_DQEVENT: error -2
[  127.568542] video0: VIDIOC_DQEVENT: error -2
[  127.573662] video0: VIDIOC_DQEVENT: error -2
[  127.578771] video0: VIDIOC_DQEVENT: error -2
[  127.583508] video0: VIDIOC_DQEVENT: error -2
[  127.588630] video0: VIDIOC_DQEVENT: error -2
[  127.593742] video0: VIDIOC_DQEVENT: error -2
[  127.598629] video0: VIDIOC_DQEVENT: error -2
[  127.603755] video0: VIDIOC_DQEVENT: error -2
[  127.608865] video0: VIDIOC_DQEVENT: error -2
[  127.613968] video0: VIDIOC_DQEVENT: error -2
[  127.618688] video0: VIDIOC_DQEVENT: error -2
[  127.623809] video0: VIDIOC_DQEVENT: error -2
[  127.628914] video0: VIDIOC_DQEVENT: error -2
[  127.633291] video0: VIDIOC_DQEVENT: error -2
[  127.638409] video0: VIDIOC_DQEVENT: error -2
[  127.643511] video0: VIDIOC_DQEVENT: error -2
[  127.647885] video0: VIDIOC_DQEVENT: error -2
[  127.652992] video0: VIDIOC_DQEVENT: error -2
[  127.658090] video0: VIDIOC_DQEVENT: error -2
[  127.663184] video0: VIDIOC_DQEVENT: error -2
[  127.667552] video0: VIDIOC_DQEVENT: error -2
[  127.672659] video0: VIDIOC_DQEVENT: error -2
[  127.677759] video0: VIDIOC_DQEVENT: error -2
[  127.682161] video0: VIDIOC_DQEVENT: error -2
[  127.687276] video0: VIDIOC_DQEVENT: error -2
[  127.692377] video0: VIDIOC_DQEVENT: error -2
[  127.697474] video0: VIDIOC_DQEVENT: error -2
[  127.701869] video0: VIDIOC_DQEVENT: error -2
[  127.706983] video0: VIDIOC_DQEVENT: error -2
[  127.712084] video0: VIDIOC_DQEVENT: error -2
[  127.716457] video0: VIDIOC_DQEVENT: error -2
[  127.721573] video0: VIDIOC_DQEVENT: error -2
[  127.726674] video0: VIDIOC_DQEVENT: error -2
[  127.731047] video0: VIDIOC_DQEVENT: error -2
[  127.736189] video0: VIDIOC_DQEVENT: error -2
[  127.741289] video0: VIDIOC_DQEVENT: error -2
[  127.746383] video0: VIDIOC_DQEVENT: error -2
[  127.750793] video0: VIDIOC_DQEVENT: error -2
[  127.755908] video0: VIDIOC_DQEVENT: error -2
[  127.761007] video0: VIDIOC_DQEVENT: error -2
[  127.765404] video0: VIDIOC_DQEVENT: error -2
[  127.770520] video0: VIDIOC_DQEVENT: error -2
[  127.775624] video0: VIDIOC_DQEVENT: error -2
[  127.780719] video0: VIDIOC_DQEVENT: error -2
[  127.785094] video0: VIDIOC_DQEVENT: error -2
[  127.790208] video0: VIDIOC_DQEVENT: error -2
[  127.795311] video0: VIDIOC_DQEVENT: error -2
[  127.799683] video0: VIDIOC_DQEVENT: error -2
[  127.804790] video0: VIDIOC_DQEVENT: error -2
[  127.809888] video0: VIDIOC_DQEVENT: error -2
[  127.814293] video0: VIDIOC_DQEVENT: error -2
[  127.819407] video0: VIDIOC_DQEVENT: error -2
[  127.824508] video0: VIDIOC_DQEVENT: error -2
[  127.829599] video0: VIDIOC_DQEVENT: error -2
[  127.833972] video0: VIDIOC_DQEVENT: error -2
[  127.839095] video0: VIDIOC_DQEVENT: error -2
[  127.844193] video0: VIDIOC_DQEVENT: error -2
[  127.848562] video0: VIDIOC_DQEVENT: error -2
[  127.853676] video0: VIDIOC_DQEVENT: error -2
[  127.858775] video0: VIDIOC_DQEVENT: error -2
[  127.863871] video0: VIDIOC_DQEVENT: error -2
[  127.868237] video0: VIDIOC_DQEVENT: error -2
[  127.873349] video0: VIDIOC_DQEVENT: error -2
[  127.878449] video0: VIDIOC_DQEVENT: error -2
[  127.882854] video0: VIDIOC_DQEVENT: error -2
[  127.887970] video0: VIDIOC_DQEVENT: error -2
[  127.893070] video0: VIDIOC_DQEVENT: error -2
[  127.898162] video0: VIDIOC_DQEVENT: error -2
[  127.902575] video0: VIDIOC_DQEVENT: error -2
[  127.903713] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  127.907692] video0: VIDIOC_DQEVENT: error -2
[  127.912792] video0: VIDIOC_DQEVENT: error -2
[  127.917173] video0: VIDIOC_DQEVENT: error -2
[  127.922287] video0: VIDIOC_DQEVENT: error -2
[  127.927390] video0: VIDIOC_DQEVENT: error -2
[  127.931747] video0: VIDIOC_DQEVENT: error -2
[  127.936854] video0: VIDIOC_DQEVENT: error -2
[  127.941955] video0: VIDIOC_DQEVENT: error -2
[  127.947048] video0: VIDIOC_DQEVENT: error -2
[  127.951432] video0: VIDIOC_DQEVENT: error -2
[  127.956547] video0: VIDIOC_DQEVENT: error -2
[  127.961649] video0: VIDIOC_DQEVENT: error -2
[  127.966046] video0: VIDIOC_DQEVENT: error -2
[  127.971162] video0: VIDIOC_DQEVENT: error -2
[  127.976262] video0: VIDIOC_DQEVENT: error -2
[  127.981355] video0: VIDIOC_DQEVENT: error -2
[  127.985756] video0: VIDIOC_DQEVENT: error -2
[  127.990870] video0: VIDIOC_DQEVENT: error -2
[  127.995970] video0: VIDIOC_DQEVENT: error -2
[  128.000349] video0: VIDIOC_DQEVENT: error -2
[  128.005463] video0: VIDIOC_DQEVENT: error -2
[  128.010564] video0: VIDIOC_DQEVENT: error -2
[  128.014955] video0: VIDIOC_DQEVENT: error -2
[  128.020072] video0: VIDIOC_DQEVENT: error -2
[  128.025175] video0: VIDIOC_DQEVENT: error -2
[  128.030272] video0: VIDIOC_DQEVENT: error -2
[  128.034700] video0: VIDIOC_DQEVENT: error -2
[  128.039815] video0: VIDIOC_DQEVENT: error -2
[  128.044919] video0: VIDIOC_DQEVENT: error -2
[  128.049297] video0: VIDIOC_DQEVENT: error -2
[  128.054411] video0: VIDIOC_DQEVENT: error -2
[  128.059512] video0: VIDIOC_DQEVENT: error -2
[  128.064605] video0: VIDIOC_DQEVENT: error -2
[  128.068972] video0: VIDIOC_DQEVENT: error -2
[  128.074086] video0: VIDIOC_DQEVENT: error -2
[  128.079187] video0: VIDIOC_DQEVENT: error -2
[  128.083566] video0: VIDIOC_DQEVENT: error -2
[  128.088673] video0: VIDIOC_DQEVENT: error -2
[  128.093772] video0: VIDIOC_DQEVENT: error -2
[  128.098170] video0: VIDIOC_DQEVENT: error -2
[  128.103287] video0: VIDIOC_DQEVENT: error -2
[  128.108389] video0: VIDIOC_DQEVENT: error -2
[  128.113480] video0: VIDIOC_DQEVENT: error -2
[  128.117867] video0: VIDIOC_DQEVENT: error -2
[  128.122983] video0: VIDIOC_DQEVENT: error -2
[  128.128084] video0: VIDIOC_DQEVENT: error -2
[  128.132450] video0: VIDIOC_DQEVENT: error -2
[  128.137565] video0: VIDIOC_DQEVENT: error -2
[  128.142667] video0: VIDIOC_DQEVENT: error -2
[  128.147762] video0: VIDIOC_DQEVENT: error -2
[  128.152132] video0: VIDIOC_DQEVENT: error -2
[  128.157243] video0: VIDIOC_DQEVENT: error -2
[  128.162344] video0: VIDIOC_DQEVENT: error -2
[  128.166745] video0: VIDIOC_DQEVENT: error -2
[  128.171861] video0: VIDIOC_DQEVENT: error -2
[  128.176964] video0: VIDIOC_DQEVENT: error -2
[  128.181343] video0: VIDIOC_DQEVENT: error -2
[  128.186459] video0: VIDIOC_DQEVENT: error -2
[  128.191559] video0: VIDIOC_DQEVENT: error -2
[  128.196653] video0: VIDIOC_DQEVENT: error -2
[  128.201034] video0: VIDIOC_DQEVENT: error -2
[  128.206148] video0: VIDIOC_DQEVENT: error -2
[  128.211250] video0: VIDIOC_DQEVENT: error -2
[  128.215608] video0: VIDIOC_DQEVENT: error -2
[  128.220714] video0: VIDIOC_DQEVENT: error -2
[  128.225813] video0: VIDIOC_DQEVENT: error -2
[  128.230906] video0: VIDIOC_DQEVENT: error -2
[  128.235295] video0: VIDIOC_DQEVENT: error -2
[  128.240409] video0: VIDIOC_DQEVENT: error -2
[  128.245510] video0: VIDIOC_DQEVENT: error -2
[  128.249909] video0: VIDIOC_DQEVENT: error -2
[  128.255025] video0: VIDIOC_DQEVENT: error -2
[  128.260127] video0: VIDIOC_DQEVENT: error -2
[  128.264520] video0: VIDIOC_DQEVENT: error -2
[  128.269637] video0: VIDIOC_DQEVENT: error -2
[  128.274741] video0: VIDIOC_DQEVENT: error -2
[  128.279835] video0: VIDIOC_DQEVENT: error -2
[  128.284202] video0: VIDIOC_DQEVENT: error -2
[  128.289314] video0: VIDIOC_DQEVENT: error -2
[  128.294417] video0: VIDIOC_DQEVENT: error -2
[  128.298837] video0: VIDIOC_DQEVENT: error -2
[  128.303955] video0: VIDIOC_DQEVENT: error -2
[  128.309056] video0: VIDIOC_DQEVENT: error -2
[  128.314149] video0: VIDIOC_DQEVENT: error -2
[  128.318644] video0: VIDIOC_DQEVENT: error -2
[  128.323760] video0: VIDIOC_DQEVENT: error -2
[  128.328861] video0: VIDIOC_DQEVENT: error -2
[  128.333253] video0: VIDIOC_DQEVENT: error -2
[  128.338369] video0: VIDIOC_DQEVENT: error -2
[  128.343473] video0: VIDIOC_DQEVENT: error -2
[  128.347832] video0: VIDIOC_DQEVENT: error -2
[  128.352939] video0: VIDIOC_DQEVENT: error -2
[  128.358039] video0: VIDIOC_DQEVENT: error -2
[  128.363131] video0: VIDIOC_DQEVENT: error -2
[  128.367491] video0: VIDIOC_DQEVENT: error -2
[  128.372601] video0: VIDIOC_DQEVENT: error -2
[  128.377700] video0: VIDIOC_DQEVENT: error -2
[  128.382104] video0: VIDIOC_DQEVENT: error -2
[  128.387220] video0: VIDIOC_DQEVENT: error -2
[  128.392324] video0: VIDIOC_DQEVENT: error -2
[  128.397419] video0: VIDIOC_DQEVENT: error -2
[  128.401834] video0: VIDIOC_DQEVENT: error -2
[  128.406949] video0: VIDIOC_DQEVENT: error -2
[  128.412052] video0: VIDIOC_DQEVENT: error -2
[  128.416447] video0: VIDIOC_DQEVENT: error -2
[  128.421564] video0: VIDIOC_DQEVENT: error -2
[  128.426666] video0: VIDIOC_DQEVENT: error -2
[  128.431041] video0: VIDIOC_DQEVENT: error -2
[  128.436184] video0: VIDIOC_DQEVENT: error -2
[  128.441288] video0: VIDIOC_DQEVENT: error -2
[  128.446384] video0: VIDIOC_DQEVENT: error -2
[  128.450918] video0: VIDIOC_DQEVENT: error -2
[  128.456036] video0: VIDIOC_DQEVENT: error -2
[  128.461138] video0: VIDIOC_DQEVENT: error -2
[  128.465632] video0: VIDIOC_DQEVENT: error -2
[  128.470747] video0: VIDIOC_DQEVENT: error -2
[  128.475850] video0: VIDIOC_DQEVENT: error -2
[  128.480945] video0: VIDIOC_DQEVENT: error -2
[  128.485328] video0: VIDIOC_DQEVENT: error -2
[  128.490442] video0: VIDIOC_DQEVENT: error -2
[  128.495544] video0: VIDIOC_DQEVENT: error -2
[  128.499927] video0: VIDIOC_DQEVENT: error -2
[  128.505038] video0: VIDIOC_DQEVENT: error -2
[  128.510144] video0: VIDIOC_DQEVENT: error -2
[  128.514681] video0: VIDIOC_DQEVENT: error -2
[  128.519807] video0: VIDIOC_DQEVENT: error -2
[  128.524907] video0: VIDIOC_DQEVENT: error -2
[  128.529998] video0: VIDIOC_DQEVENT: error -2
[  128.534440] video0: VIDIOC_DQEVENT: error -2
[  128.539557] video0: VIDIOC_DQEVENT: error -2
[  128.544659] video0: VIDIOC_DQEVENT: error -2
[  128.549080] video0: VIDIOC_DQEVENT: error -2
[  128.554196] video0: VIDIOC_DQEVENT: error -2
[  128.559299] video0: VIDIOC_DQEVENT: error -2
[  128.564395] video0: VIDIOC_DQEVENT: error -2
[  128.568794] video0: VIDIOC_DQEVENT: error -2
[  128.573909] video0: VIDIOC_DQEVENT: error -2
[  128.579012] video0: VIDIOC_DQEVENT: error -2
[  128.583503] video0: VIDIOC_DQEVENT: error -2
[  128.588626] video0: VIDIOC_DQEVENT: error -2
[  128.593725] video0: VIDIOC_DQEVENT: error -2
[  128.598253] video0: VIDIOC_DQEVENT: error -2
[  128.603368] video0: VIDIOC_DQEVENT: error -2
[  128.608469] video0: VIDIOC_DQEVENT: error -2
[  128.613563] video0: VIDIOC_DQEVENT: error -2
[  128.617983] video0: VIDIOC_DQEVENT: error -2
[  128.623097] video0: VIDIOC_DQEVENT: error -2
[  128.628199] video0: VIDIOC_DQEVENT: error -2
[  128.632580] video0: VIDIOC_DQEVENT: error -2
[  128.637695] video0: VIDIOC_DQEVENT: error -2
[  128.642796] video0: VIDIOC_DQEVENT: error -2
[  128.647893] video0: VIDIOC_DQEVENT: error -2
[  128.652483] video0: VIDIOC_DQEVENT: error -2
[  128.657606] video0: VIDIOC_DQEVENT: error -2
[  128.662710] video0: VIDIOC_DQEVENT: error -2
[  128.667262] video0: VIDIOC_DQEVENT: error -2
[  128.672385] video0: VIDIOC_DQEVENT: error -2
[  128.677485] video0: VIDIOC_DQEVENT: error -2
[  128.682003] video0: VIDIOC_DQEVENT: error -2
[  128.687119] video0: VIDIOC_DQEVENT: error -2
[  128.692221] video0: VIDIOC_DQEVENT: error -2
[  128.697317] video0: VIDIOC_DQEVENT: error -2
[  128.701817] video0: VIDIOC_DQEVENT: error -2
[  128.706930] video0: VIDIOC_DQEVENT: error -2
[  128.712032] video0: VIDIOC_DQEVENT: error -2
[  128.716426] video0: VIDIOC_DQEVENT: error -2
[  128.721540] video0: VIDIOC_DQEVENT: error -2
[  128.726644] video0: VIDIOC_DQEVENT: error -2
[  128.731052] video0: VIDIOC_DQEVENT: error -2
[  128.736194] video0: VIDIOC_DQEVENT: error -2
[  128.741294] video0: VIDIOC_DQEVENT: error -2
[  128.746386] video0: VIDIOC_DQEVENT: error -2
[  128.750895] video0: VIDIOC_DQEVENT: error -2
[  128.756020] video0: VIDIOC_DQEVENT: error -2
[  128.761121] video0: VIDIOC_DQEVENT: error -2
[  128.765519] video0: VIDIOC_DQEVENT: error -2
[  128.770635] video0: VIDIOC_DQEVENT: error -2
[  128.775738] video0: VIDIOC_DQEVENT: error -2
[  128.780833] video0: VIDIOC_DQEVENT: error -2
[  128.785339] video0: VIDIOC_DQEVENT: error -2
[  128.790455] video0: VIDIOC_DQEVENT: error -2
[  128.795556] video0: VIDIOC_DQEVENT: error -2
[  128.800022] video0: VIDIOC_DQEVENT: error -2
[  128.805128] video0: VIDIOC_DQEVENT: error -2
[  128.810228] video0: VIDIOC_DQEVENT: error -2
[  128.814748] video0: VIDIOC_DQEVENT: error -2
[  128.819873] video0: VIDIOC_DQEVENT: error -2
[  128.824974] video0: VIDIOC_DQEVENT: error -2
[  128.830066] video0: VIDIOC_DQEVENT: error -2
[  128.834526] video0: VIDIOC_DQEVENT: error -2
[  128.839640] video0: VIDIOC_DQEVENT: error -2
[  128.844746] video0: VIDIOC_DQEVENT: error -2
[  128.849453] video0: VIDIOC_DQEVENT: error -2
[  128.854572] video0: VIDIOC_DQEVENT: error -2
[  128.859677] video0: VIDIOC_DQEVENT: error -2
[  128.864774] video0: VIDIOC_DQEVENT: error -2
[  128.869299] video0: VIDIOC_DQEVENT: error -2
[  128.874412] video0: VIDIOC_DQEVENT: error -2
[  128.879514] video0: VIDIOC_DQEVENT: error -2
[  128.884013] video0: VIDIOC_DQEVENT: error -2
[  128.889131] video0: VIDIOC_DQEVENT: error -2
[  128.894228] video0: VIDIOC_DQEVENT: error -2
[  128.898662] video0: VIDIOC_DQEVENT: error -2
[  128.903778] video0: VIDIOC_DQEVENT: error -2
[  128.908881] video0: VIDIOC_DQEVENT: error -2
[  128.913973] video0: VIDIOC_DQEVENT: error -2
[  128.918404] video0: VIDIOC_DQEVENT: error -2
[  128.923519] video0: VIDIOC_DQEVENT: error -2
[  128.927701] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  128.928621] video0: VIDIOC_DQEVENT: error -2
[  128.933115] video0: VIDIOC_DQEVENT: error -2
[  128.938228] video0: VIDIOC_DQEVENT: error -2
[  128.943328] video0: VIDIOC_DQEVENT: error -2
[  128.947784] video0: VIDIOC_DQEVENT: error -2
[  128.952900] video0: VIDIOC_DQEVENT: error -2
[  128.957997] video0: VIDIOC_DQEVENT: error -2
[  128.963090] video0: VIDIOC_DQEVENT: error -2
[  128.967563] video0: VIDIOC_DQEVENT: error -2
[  128.972671] video0: VIDIOC_DQEVENT: error -2
[  128.977771] video0: VIDIOC_DQEVENT: error -2
[  128.982218] video0: VIDIOC_DQEVENT: error -2
[  128.987333] video0: VIDIOC_DQEVENT: error -2
[  128.992441] video0: VIDIOC_DQEVENT: error -2
[  128.997546] video0: VIDIOC_DQEVENT: error -2
[  129.002473] video0: VIDIOC_DQEVENT: error -2
[  129.007596] video0: VIDIOC_DQEVENT: error -2
[  129.012700] video0: VIDIOC_DQEVENT: error -2
[  129.017492] video0: VIDIOC_DQEVENT: error -2
[  129.022697] video0: VIDIOC_DQEVENT: error -2
[  129.027803] video0: VIDIOC_DQEVENT: error -2
[  129.032592] video0: VIDIOC_DQEVENT: error -2
[  129.037812] video0: VIDIOC_DQEVENT: error -2
[  129.042918] video0: VIDIOC_DQEVENT: error -2
[  129.048023] video0: VIDIOC_DQEVENT: error -2
[  129.053727] video0: VIDIOC_DQEVENT: error -2
[  129.058957] video0: VIDIOC_DQEVENT: error -2
[  129.064067] video0: VIDIOC_DQEVENT: error -2
[  129.069030] video0: VIDIOC_DQEVENT: error -2
[  129.074153] video0: VIDIOC_DQEVENT: error -2
[  129.079259] video0: VIDIOC_DQEVENT: error -2
[  129.084018] video0: VIDIOC_DQEVENT: error -2
[  129.089224] video0: VIDIOC_DQEVENT: error -2
[  129.094325] video0: VIDIOC_DQEVENT: error -2
[  129.099101] video0: VIDIOC_DQEVENT: error -2
[  129.104412] video0: VIDIOC_DQEVENT: error -2
[  129.109517] video0: VIDIOC_DQEVENT: error -2
[  129.114616] video0: VIDIOC_DQEVENT: error -2
[  129.119201] video0: VIDIOC_DQEVENT: error -2
[  129.124316] video0: VIDIOC_DQEVENT: error -2
[  129.129416] video0: VIDIOC_DQEVENT: error -2
[  129.133932] video0: VIDIOC_DQEVENT: error -2
[  129.139047] video0: VIDIOC_DQEVENT: error -2
[  129.144161] video0: VIDIOC_DQEVENT: error -2
[  129.148546] video0: VIDIOC_DQEVENT: error -2
[  129.153662] video0: VIDIOC_DQEVENT: error -2
[  129.158763] video0: VIDIOC_DQEVENT: error -2
[  129.163860] video0: VIDIOC_DQEVENT: error -2
[  129.168230] video0: VIDIOC_DQEVENT: error -2
[  129.173345] video0: VIDIOC_DQEVENT: error -2
[  129.178447] video0: VIDIOC_DQEVENT: error -2
[  129.182844] video0: VIDIOC_DQEVENT: error -2
[  129.187962] video0: VIDIOC_DQEVENT: error -2
[  129.193063] video0: VIDIOC_DQEVENT: error -2
[  129.198154] video0: VIDIOC_DQEVENT: error -2
[  129.202572] video0: VIDIOC_DQEVENT: error -2
[  129.207726] video0: VIDIOC_DQEVENT: error -2
[  129.212828] video0: VIDIOC_DQEVENT: error -2
[  129.217201] video0: VIDIOC_DQEVENT: error -2
[  129.222316] video0: VIDIOC_DQEVENT: error -2
[  129.227418] video0: VIDIOC_DQEVENT: error -2
[  129.231768] video0: VIDIOC_DQEVENT: error -2
[  129.236879] video0: VIDIOC_DQEVENT: error -2
[  129.241979] video0: VIDIOC_DQEVENT: error -2
[  129.247071] video0: VIDIOC_DQEVENT: error -2
[  129.251459] video0: VIDIOC_DQEVENT: error -2
[  129.256577] video0: VIDIOC_DQEVENT: error -2
[  129.261677] video0: VIDIOC_DQEVENT: error -2
[  129.266082] video0: VIDIOC_DQEVENT: error -2
[  129.271200] video0: VIDIOC_DQEVENT: error -2
[  129.276300] video0: VIDIOC_DQEVENT: error -2
[  129.281392] video0: VIDIOC_DQEVENT: error -2
[  129.285785] video0: VIDIOC_DQEVENT: error -2
[  129.290900] video0: VIDIOC_DQEVENT: error -2
[  129.296000] video0: VIDIOC_DQEVENT: error -2
[  129.300378] video0: VIDIOC_DQEVENT: error -2
[  129.305495] video0: VIDIOC_DQEVENT: error -2
[  129.310596] video0: VIDIOC_DQEVENT: error -2
[  129.315007] video0: VIDIOC_DQEVENT: error -2
[  129.320128] video0: VIDIOC_DQEVENT: error -2
[  129.325231] video0: VIDIOC_DQEVENT: error -2
[  129.330322] video0: VIDIOC_DQEVENT: error -2
[  129.334725] video0: VIDIOC_DQEVENT: error -2
[  129.339841] video0: VIDIOC_DQEVENT: error -2
[  129.344940] video0: VIDIOC_DQEVENT: error -2
[  129.349329] video0: VIDIOC_DQEVENT: error -2
[  129.354445] video0: VIDIOC_DQEVENT: error -2
[  129.359545] video0: VIDIOC_DQEVENT: error -2
[  129.364638] video0: VIDIOC_DQEVENT: error -2
[  129.369012] video0: VIDIOC_DQEVENT: error -2
[  129.374128] video0: VIDIOC_DQEVENT: error -2
[  129.379230] video0: VIDIOC_DQEVENT: error -2
[  129.383872] video0: VIDIOC_DQEVENT: error -2
[  129.388982] video0: VIDIOC_DQEVENT: error -2
[  129.394079] video0: VIDIOC_DQEVENT: error -2
[  129.398500] video0: VIDIOC_DQEVENT: error -2
[  129.403616] video0: VIDIOC_DQEVENT: error -2
[  129.408717] video0: VIDIOC_DQEVENT: error -2
[  129.413808] video0: VIDIOC_DQEVENT: error -2
[  129.418214] video0: VIDIOC_DQEVENT: error -2
[  129.423331] video0: VIDIOC_DQEVENT: error -2
[  129.428430] video0: VIDIOC_DQEVENT: error -2
[  129.432795] video0: VIDIOC_DQEVENT: error -2
[  129.437912] video0: VIDIOC_DQEVENT: error -2
[  129.443014] video0: VIDIOC_DQEVENT: error -2
[  129.448110] video0: VIDIOC_DQEVENT: error -2
[  129.452492] video0: VIDIOC_DQEVENT: error -2
[  129.457608] video0: VIDIOC_DQEVENT: error -2
[  129.462709] video0: VIDIOC_DQEVENT: error -2
[  129.467078] video0: VIDIOC_DQEVENT: error -2
[  129.472212] video0: VIDIOC_DQEVENT: error -2
[  129.477313] video0: VIDIOC_DQEVENT: error -2
[  129.481689] video0: VIDIOC_DQEVENT: error -2
[  129.486805] video0: VIDIOC_DQEVENT: error -2
[  129.491905] video0: VIDIOC_DQEVENT: error -2
[  129.496997] video0: VIDIOC_DQEVENT: error -2
[  129.501364] video0: VIDIOC_DQEVENT: error -2
[  129.506496] video0: VIDIOC_DQEVENT: error -2
[  129.511642] video0: VIDIOC_DQEVENT: error -2
[  129.516242] video0: VIDIOC_DQEVENT: error -2
[  129.521357] video0: VIDIOC_DQEVENT: error -2
[  129.526459] video0: VIDIOC_DQEVENT: error -2
[  129.531551] video0: VIDIOC_DQEVENT: error -2
[  129.535918] video0: VIDIOC_DQEVENT: error -2
[  129.541029] video0: VIDIOC_DQEVENT: error -2
[  129.546130] video0: VIDIOC_DQEVENT: error -2
[  129.550590] video0: VIDIOC_DQEVENT: error -2
[  129.555709] video0: VIDIOC_DQEVENT: error -2
[  129.560811] video0: VIDIOC_DQEVENT: error -2
[  129.565230] video0: VIDIOC_DQEVENT: error -2
[  129.570347] video0: VIDIOC_DQEVENT: error -2
[  129.575451] video0: VIDIOC_DQEVENT: error -2
[  129.580545] video0: VIDIOC_DQEVENT: error -2
[  129.584929] video0: VIDIOC_DQEVENT: error -2
[  129.590045] video0: VIDIOC_DQEVENT: error -2
[  129.595149] video0: VIDIOC_DQEVENT: error -2
[  129.599521] video0: VIDIOC_DQEVENT: error -2
[  129.604632] video0: VIDIOC_DQEVENT: error -2
[  129.609732] video0: VIDIOC_DQEVENT: error -2
[  129.614824] video0: VIDIOC_DQEVENT: error -2
[  129.619251] video0: VIDIOC_DQEVENT: error -2
[  129.624368] video0: VIDIOC_DQEVENT: error -2
[  129.629472] video0: VIDIOC_DQEVENT: error -2
[  129.633888] video0: VIDIOC_DQEVENT: error -2
[  129.639007] video0: VIDIOC_DQEVENT: error -2
[  129.644110] video0: VIDIOC_DQEVENT: error -2
[  129.648500] video0: VIDIOC_DQEVENT: error -2
[  129.653616] video0: VIDIOC_DQEVENT: error -2
[  129.658718] video0: VIDIOC_DQEVENT: error -2
[  129.663813] video0: VIDIOC_DQEVENT: error -2
[  129.668211] video0: VIDIOC_DQEVENT: error -2
[  129.673327] video0: VIDIOC_DQEVENT: error -2
[  129.678430] video0: VIDIOC_DQEVENT: error -2
[  129.682894] video0: VIDIOC_DQEVENT: error -2
[  129.688030] video0: VIDIOC_DQEVENT: error -2
[  129.693161] video0: VIDIOC_DQEVENT: error -2
[  129.698258] video0: VIDIOC_DQEVENT: error -2
[  129.702710] video0: VIDIOC_DQEVENT: error -2
[  129.707827] video0: VIDIOC_DQEVENT: error -2
[  129.712928] video0: VIDIOC_DQEVENT: error -2
[  129.717322] video0: VIDIOC_DQEVENT: error -2
[  129.722436] video0: VIDIOC_DQEVENT: error -2
[  129.727541] video0: VIDIOC_DQEVENT: error -2
[  129.731906] video0: VIDIOC_DQEVENT: error -2
[  129.737018] video0: VIDIOC_DQEVENT: error -2
[  129.742133] video0: VIDIOC_DQEVENT: error -2
[  129.747243] video0: VIDIOC_DQEVENT: error -2
[  129.751633] video0: VIDIOC_DQEVENT: error -2
[  129.756743] video0: VIDIOC_DQEVENT: error -2
[  129.761843] video0: VIDIOC_DQEVENT: error -2
[  129.766412] video0: VIDIOC_DQEVENT: error -2
[  129.771543] video0: VIDIOC_DQEVENT: error -2
[  129.776644] video0: VIDIOC_DQEVENT: error -2
[  129.781147] video0: VIDIOC_DQEVENT: error -2
[  129.786274] video0: VIDIOC_DQEVENT: error -2
[  129.791377] video0: VIDIOC_DQEVENT: error -2
[  129.796473] video0: VIDIOC_DQEVENT: error -2
[  129.801044] video0: VIDIOC_DQEVENT: error -2
[  129.806183] video0: VIDIOC_DQEVENT: error -2
[  129.811287] video0: VIDIOC_DQEVENT: error -2
[  129.815785] video0: VIDIOC_DQEVENT: error -2
[  129.820916] video0: VIDIOC_DQEVENT: error -2
[  129.826019] video0: VIDIOC_DQEVENT: error -2
[  129.831135] video0: VIDIOC_DQEVENT: error -2
[  129.835724] video0: VIDIOC_DQEVENT: error -2
[  129.840863] video0: VIDIOC_DQEVENT: error -2
[  129.845990] video0: VIDIOC_DQEVENT: error -2
[  129.850759] video0: VIDIOC_DQEVENT: error -2
[  129.855886] video0: VIDIOC_DQEVENT: error -2
[  129.860989] video0: VIDIOC_DQEVENT: error -2
[  129.865535] video0: VIDIOC_DQEVENT: error -2
[  129.870685] video0: VIDIOC_DQEVENT: error -2
[  129.875787] video0: VIDIOC_DQEVENT: error -2
[  129.880885] video0: VIDIOC_DQEVENT: error -2
[  129.885460] video0: VIDIOC_DQEVENT: error -2
[  129.890589] video0: VIDIOC_DQEVENT: error -2
[  129.895692] video0: VIDIOC_DQEVENT: error -2
[  129.900337] video0: VIDIOC_DQEVENT: error -2
[  129.905472] video0: VIDIOC_DQEVENT: error -2
[  129.910574] video0: VIDIOC_DQEVENT: error -2
[  129.915267] video0: VIDIOC_DQEVENT: error -2
[  129.920403] video0: VIDIOC_DQEVENT: error -2
[  129.925504] video0: VIDIOC_DQEVENT: error -2
[  129.930614] video0: VIDIOC_DQEVENT: error -2
[  129.935231] video0: VIDIOC_DQEVENT: error -2
[  129.940367] video0: VIDIOC_DQEVENT: error -2
[  129.945459] video0: VIDIOC_DQEVENT: error -2
[  129.949969] video0: VIDIOC_DQEVENT: error -2
[  129.951712] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  129.955099] video0: VIDIOC_DQEVENT: error -2
[  129.960200] video0: VIDIOC_DQEVENT: error -2
[  129.964736] video0: VIDIOC_DQEVENT: error -2
[  129.969877] video0: VIDIOC_DQEVENT: error -2
[  129.974971] video0: VIDIOC_DQEVENT: error -2
[  129.980066] video0: VIDIOC_DQEVENT: error -2
[  129.984570] video0: VIDIOC_DQEVENT: error -2
[  129.989708] video0: VIDIOC_DQEVENT: error -2
[  129.994803] video0: VIDIOC_DQEVENT: error -2
[  129.999328] video0: VIDIOC_DQEVENT: error -2
[  130.004454] video0: VIDIOC_DQEVENT: error -2
[  130.009547] video0: VIDIOC_DQEVENT: error -2
[  130.014638] video0: VIDIOC_DQEVENT: error -2
[  130.019222] video0: VIDIOC_DQEVENT: error -2
[  130.024358] video0: VIDIOC_DQEVENT: error -2
[  130.029455] video0: VIDIOC_DQEVENT: error -2
[  130.033983] video0: VIDIOC_DQEVENT: error -2
[  130.039122] video0: VIDIOC_DQEVENT: error -2
[  130.044237] video0: VIDIOC_DQEVENT: error -2
[  130.048868] video0: VIDIOC_DQEVENT: error -2
[  130.053996] video0: VIDIOC_DQEVENT: error -2
[  130.059090] video0: VIDIOC_DQEVENT: error -2
[  130.064179] video0: VIDIOC_DQEVENT: error -2
[  130.068688] video0: VIDIOC_DQEVENT: error -2
[  130.073825] video0: VIDIOC_DQEVENT: error -2
[  130.078919] video0: VIDIOC_DQEVENT: error -2
[  130.083439] video0: VIDIOC_DQEVENT: error -2
[  130.088570] video0: VIDIOC_DQEVENT: error -2
[  130.093670] video0: VIDIOC_DQEVENT: error -2
[  130.098204] video0: VIDIOC_DQEVENT: error -2
[  130.103321] video0: VIDIOC_DQEVENT: error -2
[  130.108422] video0: VIDIOC_DQEVENT: error -2
[  130.113521] video0: VIDIOC_DQEVENT: error -2
[  130.117893] video0: VIDIOC_DQEVENT: error -2
[  130.123055] video0: VIDIOC_DQEVENT: error -2
[  130.128190] video0: VIDIOC_DQEVENT: error -2
[  130.132862] video0: VIDIOC_DQEVENT: error -2
[  130.137978] video0: VIDIOC_DQEVENT: error -2
[  130.143079] video0: VIDIOC_DQEVENT: error -2
[  130.148187] video0: VIDIOC_DQEVENT: error -2
[  130.152575] video0: VIDIOC_DQEVENT: error -2
[  130.157735] video0: VIDIOC_DQEVENT: error -2
[  130.162836] video0: VIDIOC_DQEVENT: error -2
[  130.167396] video0: VIDIOC_DQEVENT: error -2
[  130.172533] video0: VIDIOC_DQEVENT: error -2
[  130.177644] video0: VIDIOC_DQEVENT: error -2
[  130.182206] video0: VIDIOC_DQEVENT: error -2
[  130.187346] video0: VIDIOC_DQEVENT: error -2
[  130.192448] video0: VIDIOC_DQEVENT: error -2
[  130.197543] video0: VIDIOC_DQEVENT: error -2
[  130.202072] video0: VIDIOC_DQEVENT: error -2
[  130.207211] video0: VIDIOC_DQEVENT: error -2
[  130.212315] video0: VIDIOC_DQEVENT: error -2
[  130.216807] video0: VIDIOC_DQEVENT: error -2
[  130.221921] video0: VIDIOC_DQEVENT: error -2
[  130.227022] video0: VIDIOC_DQEVENT: error -2
[  130.231483] video0: VIDIOC_DQEVENT: error -2
[  130.236618] video0: VIDIOC_DQEVENT: error -2
[  130.241720] video0: VIDIOC_DQEVENT: error -2
[  130.246814] video0: VIDIOC_DQEVENT: error -2
[  130.251400] video0: VIDIOC_DQEVENT: error -2
[  130.256515] video0: VIDIOC_DQEVENT: error -2
[  130.261616] video0: VIDIOC_DQEVENT: error -2
[  130.266038] video0: VIDIOC_DQEVENT: error -2
[  130.271202] video0: VIDIOC_DQEVENT: error -2
[  130.276304] video0: VIDIOC_DQEVENT: error -2
[  130.281397] video0: VIDIOC_DQEVENT: error -2
[  130.285923] video0: VIDIOC_DQEVENT: error -2
[  130.291050] video0: VIDIOC_DQEVENT: error -2
[  130.296181] video0: VIDIOC_DQEVENT: error -2
[  130.300585] video0: VIDIOC_DQEVENT: error -2
[  130.305702] video0: VIDIOC_DQEVENT: error -2
[  130.310806] video0: VIDIOC_DQEVENT: error -2
[  130.315229] video0: VIDIOC_DQEVENT: error -2
[  130.320345] video0: VIDIOC_DQEVENT: error -2
[  130.325446] video0: VIDIOC_DQEVENT: error -2
[  130.330540] video0: VIDIOC_DQEVENT: error -2
[  130.334965] video0: VIDIOC_DQEVENT: error -2
[  130.340084] video0: VIDIOC_DQEVENT: error -2
[  130.345187] video0: VIDIOC_DQEVENT: error -2
[  130.349584] video0: VIDIOC_DQEVENT: error -2
[  130.354702] video0: VIDIOC_DQEVENT: error -2
[  130.359807] video0: VIDIOC_DQEVENT: error -2
[  130.364902] video0: VIDIOC_DQEVENT: error -2
[  130.369279] video0: VIDIOC_DQEVENT: error -2
[  130.374396] video0: VIDIOC_DQEVENT: error -2
[  130.379504] video0: VIDIOC_DQEVENT: error -2
[  130.383890] video0: VIDIOC_DQEVENT: error -2
[  130.389001] video0: VIDIOC_DQEVENT: error -2
[  130.394103] video0: VIDIOC_DQEVENT: error -2
[  130.398556] video0: VIDIOC_DQEVENT: error -2
[  130.403674] video0: VIDIOC_DQEVENT: error -2
[  130.408774] video0: VIDIOC_DQEVENT: error -2
[  130.413867] video0: VIDIOC_DQEVENT: error -2
[  130.418306] video0: VIDIOC_DQEVENT: error -2
[  130.423423] video0: VIDIOC_DQEVENT: error -2
[  130.428526] video0: VIDIOC_DQEVENT: error -2
[  130.432906] video0: VIDIOC_DQEVENT: error -2
[  130.438022] video0: VIDIOC_DQEVENT: error -2
[  130.443126] video0: VIDIOC_DQEVENT: error -2
[  130.448219] video0: VIDIOC_DQEVENT: error -2
[  130.452605] video0: VIDIOC_DQEVENT: error -2
[  130.457721] video0: VIDIOC_DQEVENT: error -2
[  130.462825] video0: VIDIOC_DQEVENT: error -2
[  130.467255] video0: VIDIOC_DQEVENT: error -2
[  130.472370] video0: VIDIOC_DQEVENT: error -2
[  130.477471] video0: VIDIOC_DQEVENT: error -2
[  130.481873] video0: VIDIOC_DQEVENT: error -2
[  130.486991] video0: VIDIOC_DQEVENT: error -2
[  130.492096] video0: VIDIOC_DQEVENT: error -2
[  130.497190] video0: VIDIOC_DQEVENT: error -2
[  130.501593] video0: VIDIOC_DQEVENT: error -2
[  130.506751] video0: VIDIOC_DQEVENT: error -2
[  130.511855] video0: VIDIOC_DQEVENT: error -2
[  130.516345] video0: VIDIOC_DQEVENT: error -2
[  130.521475] video0: VIDIOC_DQEVENT: error -2
[  130.526578] video0: VIDIOC_DQEVENT: error -2
[  130.531141] video0: VIDIOC_DQEVENT: error -2
[  130.536276] video0: VIDIOC_DQEVENT: error -2
[  130.541375] video0: VIDIOC_DQEVENT: error -2
[  130.546468] video0: VIDIOC_DQEVENT: error -2
[  130.551018] video0: VIDIOC_DQEVENT: error -2
[  130.556176] video0: VIDIOC_DQEVENT: error -2
[  130.561274] video0: VIDIOC_DQEVENT: error -2
[  130.565661] video0: VIDIOC_DQEVENT: error -2
[  130.570777] video0: VIDIOC_DQEVENT: error -2
[  130.575880] video0: VIDIOC_DQEVENT: error -2
[  130.580972] video0: VIDIOC_DQEVENT: error -2
[  130.585356] video0: VIDIOC_DQEVENT: error -2
[  130.590516] video0: VIDIOC_DQEVENT: error -2
[  130.595619] video0: VIDIOC_DQEVENT: error -2
[  130.600107] video0: VIDIOC_DQEVENT: error -2
[  130.605237] video0: VIDIOC_DQEVENT: error -2
[  130.610336] video0: VIDIOC_DQEVENT: error -2
[  130.614890] video0: VIDIOC_DQEVENT: error -2
[  130.620019] video0: VIDIOC_DQEVENT: error -2
[  130.625121] video0: VIDIOC_DQEVENT: error -2
[  130.630219] video0: VIDIOC_DQEVENT: error -2
[  130.634791] video0: VIDIOC_DQEVENT: error -2
[  130.639927] video0: VIDIOC_DQEVENT: error -2
[  130.645028] video0: VIDIOC_DQEVENT: error -2
[  130.649552] video0: VIDIOC_DQEVENT: error -2
[  130.654689] video0: VIDIOC_DQEVENT: error -2
[  130.659790] video0: VIDIOC_DQEVENT: error -2
[  130.664884] video0: VIDIOC_DQEVENT: error -2
[  130.669400] video0: VIDIOC_DQEVENT: error -2
[  130.674528] video0: VIDIOC_DQEVENT: error -2
[  130.679629] video0: VIDIOC_DQEVENT: error -2
[  130.684107] video0: VIDIOC_DQEVENT: error -2
[  130.689232] video0: VIDIOC_DQEVENT: error -2
[  130.694334] video0: VIDIOC_DQEVENT: error -2
[  130.698872] video0: VIDIOC_DQEVENT: error -2
[  130.703989] video0: VIDIOC_DQEVENT: error -2
[  130.709089] video0: VIDIOC_DQEVENT: error -2
[  130.714182] video0: VIDIOC_DQEVENT: error -2
[  130.718618] video0: VIDIOC_DQEVENT: error -2
[  130.723736] video0: VIDIOC_DQEVENT: error -2
[  130.728846] video0: VIDIOC_DQEVENT: error -2
[  130.733332] video0: VIDIOC_DQEVENT: error -2
[  130.738446] video0: VIDIOC_DQEVENT: error -2
[  130.743549] video0: VIDIOC_DQEVENT: error -2
[  130.747945] video0: VIDIOC_DQEVENT: error -2
[  130.753093] video0: VIDIOC_DQEVENT: error -2
[  130.758193] video0: VIDIOC_DQEVENT: error -2
[  130.763286] video0: VIDIOC_DQEVENT: error -2
[  130.767762] video0: VIDIOC_DQEVENT: error -2
[  130.772871] video0: VIDIOC_DQEVENT: error -2
[  130.777968] video0: VIDIOC_DQEVENT: error -2
[  130.782402] video0: VIDIOC_DQEVENT: error -2
[  130.787519] video0: VIDIOC_DQEVENT: error -2
[  130.792621] video0: VIDIOC_DQEVENT: error -2
[  130.797714] video0: VIDIOC_DQEVENT: error -2
[  130.802122] video0: VIDIOC_DQEVENT: error -2
[  130.807239] video0: VIDIOC_DQEVENT: error -2
[  130.812345] video0: VIDIOC_DQEVENT: error -2
[  130.816748] video0: VIDIOC_DQEVENT: error -2
[  130.821864] video0: VIDIOC_DQEVENT: error -2
[  130.826967] video0: VIDIOC_DQEVENT: error -2
[  130.831369] video0: VIDIOC_DQEVENT: error -2
[  130.836526] video0: VIDIOC_DQEVENT: error -2
[  130.841627] video0: VIDIOC_DQEVENT: error -2
[  130.846720] video0: VIDIOC_DQEVENT: error -2
[  130.851253] video0: VIDIOC_DQEVENT: error -2
[  130.856389] video0: VIDIOC_DQEVENT: error -2
[  130.861489] video0: VIDIOC_DQEVENT: error -2
[  130.866016] video0: VIDIOC_DQEVENT: error -2
[  130.871146] video0: VIDIOC_DQEVENT: error -2
[  130.876249] video0: VIDIOC_DQEVENT: error -2
[  130.881349] video0: VIDIOC_DQEVENT: error -2
[  130.885879] video0: VIDIOC_DQEVENT: error -2
[  130.891008] video0: VIDIOC_DQEVENT: error -2
[  130.896109] video0: VIDIOC_DQEVENT: error -2
[  130.900616] video0: VIDIOC_DQEVENT: error -2
[  130.905744] video0: VIDIOC_DQEVENT: error -2
[  130.910847] video0: VIDIOC_DQEVENT: error -2
[  130.915360] video0: VIDIOC_DQEVENT: error -2
[  130.920494] video0: VIDIOC_DQEVENT: error -2
[  130.925593] video0: VIDIOC_DQEVENT: error -2
[  130.930687] video0: VIDIOC_DQEVENT: error -2
[  130.935219] video0: VIDIOC_DQEVENT: error -2
[  130.940346] video0: VIDIOC_DQEVENT: error -2
[  130.945447] video0: VIDIOC_DQEVENT: error -2
[  130.949964] video0: VIDIOC_DQEVENT: error -2
[  130.955096] video0: VIDIOC_DQEVENT: error -2
[  130.960195] video0: VIDIOC_DQEVENT: error -2
[  130.964720] video0: VIDIOC_DQEVENT: error -2
[  130.969849] video0: VIDIOC_DQEVENT: error -2
[  130.974950] video0: VIDIOC_DQEVENT: error -2
[  130.975704] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  130.980045] video0: VIDIOC_DQEVENT: error -2
[  130.984565] video0: VIDIOC_DQEVENT: error -2
[  130.989701] video0: VIDIOC_DQEVENT: error -2
[  130.994802] video0: VIDIOC_DQEVENT: error -2
[  130.999246] video0: VIDIOC_DQEVENT: error -2
[  131.004361] video0: VIDIOC_DQEVENT: error -2
[  131.009463] video0: VIDIOC_DQEVENT: error -2
[  131.014555] video0: VIDIOC_DQEVENT: error -2
[  131.018980] video0: VIDIOC_DQEVENT: error -2
[  131.024098] video0: VIDIOC_DQEVENT: error -2
[  131.029200] video0: VIDIOC_DQEVENT: error -2
[  131.033607] video0: VIDIOC_DQEVENT: error -2
[  131.038768] video0: VIDIOC_DQEVENT: error -2
[  131.043872] video0: VIDIOC_DQEVENT: error -2
[  131.048410] video0: VIDIOC_DQEVENT: error -2
[  131.053538] video0: VIDIOC_DQEVENT: error -2
[  131.058637] video0: VIDIOC_DQEVENT: error -2
[  131.063731] video0: VIDIOC_DQEVENT: error -2
[  131.068231] video0: VIDIOC_DQEVENT: error -2
[  131.073359] video0: VIDIOC_DQEVENT: error -2
[  131.078461] video0: VIDIOC_DQEVENT: error -2
[  131.083007] video0: VIDIOC_DQEVENT: error -2
[  131.088165] video0: VIDIOC_DQEVENT: error -2
[  131.093264] video0: VIDIOC_DQEVENT: error -2
[  131.097769] video0: VIDIOC_DQEVENT: error -2
[  131.102907] video0: VIDIOC_DQEVENT: error -2
[  131.108008] video0: VIDIOC_DQEVENT: error -2
[  131.113101] video0: VIDIOC_DQEVENT: error -2
[  131.117626] video0: VIDIOC_DQEVENT: error -2
[  131.122761] video0: VIDIOC_DQEVENT: error -2
[  131.127861] video0: VIDIOC_DQEVENT: error -2
[  131.132372] video0: VIDIOC_DQEVENT: error -2
[  131.137500] video0: VIDIOC_DQEVENT: error -2
[  131.142602] video0: VIDIOC_DQEVENT: error -2
[  131.147697] video0: VIDIOC_DQEVENT: error -2
[  131.152184] video0: VIDIOC_DQEVENT: error -2
[  131.157308] video0: VIDIOC_DQEVENT: error -2
[  131.162411] video0: VIDIOC_DQEVENT: error -2
[  131.166995] video0: VIDIOC_DQEVENT: error -2
[  131.172138] video0: VIDIOC_DQEVENT: error -2
[  131.177266] video0: VIDIOC_DQEVENT: error -2
[  131.182017] video0: VIDIOC_DQEVENT: error -2
[  131.187155] video0: VIDIOC_DQEVENT: error -2
[  131.192267] video0: VIDIOC_DQEVENT: error -2
[  131.197370] video0: VIDIOC_DQEVENT: error -2
[  131.202128] video0: VIDIOC_DQEVENT: error -2
[  131.207245] video0: VIDIOC_DQEVENT: error -2
[  131.212356] video0: VIDIOC_DQEVENT: error -2
[  131.216838] video0: VIDIOC_DQEVENT: error -2
[  131.221965] video0: VIDIOC_DQEVENT: error -2
[  131.227067] video0: VIDIOC_DQEVENT: error -2
[  131.231438] video0: VIDIOC_DQEVENT: error -2
[  131.236554] video0: VIDIOC_DQEVENT: error -2
[  131.241658] video0: VIDIOC_DQEVENT: error -2
[  131.246752] video0: VIDIOC_DQEVENT: error -2
[  131.251185] video0: VIDIOC_DQEVENT: error -2
[  131.256300] video0: VIDIOC_DQEVENT: error -2
[  131.261398] video0: VIDIOC_DQEVENT: error -2
[  131.265792] video0: VIDIOC_DQEVENT: error -2
[  131.270907] video0: VIDIOC_DQEVENT: error -2
[  131.276010] video0: VIDIOC_DQEVENT: error -2
[  131.281109] video0: VIDIOC_DQEVENT: error -2
[  131.285489] video0: VIDIOC_DQEVENT: error -2
[  131.290605] video0: VIDIOC_DQEVENT: error -2
[  131.295708] video0: VIDIOC_DQEVENT: error -2
[  131.300073] video0: VIDIOC_DQEVENT: error -2
[  131.305183] video0: VIDIOC_DQEVENT: error -2
[  131.310286] video0: VIDIOC_DQEVENT: error -2
[  131.314711] video0: VIDIOC_DQEVENT: error -2
[  131.319829] video0: VIDIOC_DQEVENT: error -2
[  131.324935] video0: VIDIOC_DQEVENT: error -2
[  131.330027] video0: VIDIOC_DQEVENT: error -2
[  131.334449] video0: VIDIOC_DQEVENT: error -2
[  131.339563] video0: VIDIOC_DQEVENT: error -2
[  131.344664] video0: VIDIOC_DQEVENT: error -2
[  131.349056] video0: VIDIOC_DQEVENT: error -2
[  131.354171] video0: VIDIOC_DQEVENT: error -2
[  131.359273] video0: VIDIOC_DQEVENT: error -2
[  131.364369] video0: VIDIOC_DQEVENT: error -2
[  131.368748] video0: VIDIOC_DQEVENT: error -2
[  131.373862] video0: VIDIOC_DQEVENT: error -2
[  131.378966] video0: VIDIOC_DQEVENT: error -2
[  131.383400] video0: VIDIOC_DQEVENT: error -2
[  131.388515] video0: VIDIOC_DQEVENT: error -2
[  131.393618] video0: VIDIOC_DQEVENT: error -2
[  131.398018] video0: VIDIOC_DQEVENT: error -2
[  131.403133] video0: VIDIOC_DQEVENT: error -2
[  131.408235] video0: VIDIOC_DQEVENT: error -2
[  131.413329] video0: VIDIOC_DQEVENT: error -2
[  131.417729] video0: VIDIOC_DQEVENT: error -2
[  131.422844] video0: VIDIOC_DQEVENT: error -2
[  131.427945] video0: VIDIOC_DQEVENT: error -2
[  131.432316] video0: VIDIOC_DQEVENT: error -2
[  131.437429] video0: VIDIOC_DQEVENT: error -2
[  131.442529] video0: VIDIOC_DQEVENT: error -2
[  131.447626] video0: VIDIOC_DQEVENT: error -2
[  131.451984] video0: VIDIOC_DQEVENT: error -2
[  131.457092] video0: VIDIOC_DQEVENT: error -2
[  131.462197] video0: VIDIOC_DQEVENT: error -2
[  131.466617] video0: VIDIOC_DQEVENT: error -2
[  131.471733] video0: VIDIOC_DQEVENT: error -2
[  131.476836] video0: VIDIOC_DQEVENT: error -2
[  131.481215] video0: VIDIOC_DQEVENT: error -2
[  131.486332] video0: VIDIOC_DQEVENT: error -2
[  131.491433] video0: VIDIOC_DQEVENT: error -2
[  131.496526] video0: VIDIOC_DQEVENT: error -2
[  131.500913] video0: VIDIOC_DQEVENT: error -2
[  131.506027] video0: VIDIOC_DQEVENT: error -2
[  131.511129] video0: VIDIOC_DQEVENT: error -2
[  131.515505] video0: VIDIOC_DQEVENT: error -2
[  131.520610] video0: VIDIOC_DQEVENT: error -2
[  131.525710] video0: VIDIOC_DQEVENT: error -2
[  131.530802] video0: VIDIOC_DQEVENT: error -2
[  131.535225] video0: VIDIOC_DQEVENT: error -2
[  131.540339] video0: VIDIOC_DQEVENT: error -2
[  131.545440] video0: VIDIOC_DQEVENT: error -2
[  131.549818] video0: VIDIOC_DQEVENT: error -2
[  131.554933] video0: VIDIOC_DQEVENT: error -2
[  131.560036] video0: VIDIOC_DQEVENT: error -2
[  131.564408] video0: VIDIOC_DQEVENT: error -2
[  131.569522] video0: VIDIOC_DQEVENT: error -2
[  131.574624] video0: VIDIOC_DQEVENT: error -2
[  131.579720] video0: VIDIOC_DQEVENT: error -2
[  131.584090] video0: VIDIOC_DQEVENT: error -2
[  131.589201] video0: VIDIOC_DQEVENT: error -2
[  131.594301] video0: VIDIOC_DQEVENT: error -2
[  131.598724] video0: VIDIOC_DQEVENT: error -2
[  131.603839] video0: VIDIOC_DQEVENT: error -2
[  131.608941] video0: VIDIOC_DQEVENT: error -2
[  131.614032] video0: VIDIOC_DQEVENT: error -2
[  131.618461] video0: VIDIOC_DQEVENT: error -2
[  131.623576] video0: VIDIOC_DQEVENT: error -2
[  131.628680] video0: VIDIOC_DQEVENT: error -2
[  131.633170] video0: VIDIOC_DQEVENT: error -2
[  131.638290] video0: VIDIOC_DQEVENT: error -2
[  131.643411] video0: VIDIOC_DQEVENT: error -2
[  131.647810] video0: VIDIOC_DQEVENT: error -2
[  131.652918] video0: VIDIOC_DQEVENT: error -2
[  131.658020] video0: VIDIOC_DQEVENT: error -2
[  131.663115] video0: VIDIOC_DQEVENT: error -2
[  131.667518] video0: VIDIOC_DQEVENT: error -2
[  131.672627] video0: VIDIOC_DQEVENT: error -2
[  131.677726] video0: VIDIOC_DQEVENT: error -2
[  131.682156] video0: VIDIOC_DQEVENT: error -2
[  131.687279] video0: VIDIOC_DQEVENT: error -2
[  131.692407] video0: VIDIOC_DQEVENT: error -2
[  131.697506] video0: VIDIOC_DQEVENT: error -2
[  131.701929] video0: VIDIOC_DQEVENT: error -2
[  131.707044] video0: VIDIOC_DQEVENT: error -2
[  131.712169] video0: VIDIOC_DQEVENT: error -2
[  131.716561] video0: VIDIOC_DQEVENT: error -2
[  131.721677] video0: VIDIOC_DQEVENT: error -2
[  131.726779] video0: VIDIOC_DQEVENT: error -2
[  131.731202] video0: VIDIOC_DQEVENT: error -2
[  131.736314] video0: VIDIOC_DQEVENT: error -2
[  131.741417] video0: VIDIOC_DQEVENT: error -2
[  131.746513] video0: VIDIOC_DQEVENT: error -2
[  131.750925] video0: VIDIOC_DQEVENT: error -2
[  131.756039] video0: VIDIOC_DQEVENT: error -2
[  131.761146] video0: VIDIOC_DQEVENT: error -2
[  131.765605] video0: VIDIOC_DQEVENT: error -2
[  131.770724] video0: VIDIOC_DQEVENT: error -2
[  131.775846] video0: VIDIOC_DQEVENT: error -2
[  131.780972] video0: VIDIOC_DQEVENT: error -2
[  131.785395] video0: VIDIOC_DQEVENT: error -2
[  131.790510] video0: VIDIOC_DQEVENT: error -2
[  131.795613] video0: VIDIOC_DQEVENT: error -2
[  131.799980] video0: VIDIOC_DQEVENT: error -2
[  131.805088] video0: VIDIOC_DQEVENT: error -2
[  131.810188] video0: VIDIOC_DQEVENT: error -2
[  131.814614] video0: VIDIOC_DQEVENT: error -2
[  131.819731] video0: VIDIOC_DQEVENT: error -2
[  131.824853] video0: VIDIOC_DQEVENT: error -2
[  131.829969] video0: VIDIOC_DQEVENT: error -2
[  131.834461] video0: VIDIOC_DQEVENT: error -2
[  131.839577] video0: VIDIOC_DQEVENT: error -2
[  131.844681] video0: VIDIOC_DQEVENT: error -2
[  131.849058] video0: VIDIOC_DQEVENT: error -2
[  131.854174] video0: VIDIOC_DQEVENT: error -2
[  131.859275] video0: VIDIOC_DQEVENT: error -2
[  131.864368] video0: VIDIOC_DQEVENT: error -2
[  131.868758] video0: VIDIOC_DQEVENT: error -2
[  131.873871] video0: VIDIOC_DQEVENT: error -2
[  131.878971] video0: VIDIOC_DQEVENT: error -2
[  131.883378] video0: VIDIOC_DQEVENT: error -2
[  131.888495] video0: VIDIOC_DQEVENT: error -2
[  131.893598] video0: VIDIOC_DQEVENT: error -2
[  131.897989] video0: VIDIOC_DQEVENT: error -2
[  131.903103] video0: VIDIOC_DQEVENT: error -2
[  131.908209] video0: VIDIOC_DQEVENT: error -2
[  131.913331] video0: VIDIOC_DQEVENT: error -2
[  131.917816] video0: VIDIOC_DQEVENT: error -2
[  131.922932] video0: VIDIOC_DQEVENT: error -2
[  131.928038] video0: VIDIOC_DQEVENT: error -2
[  131.932444] video0: VIDIOC_DQEVENT: error -2
[  131.937559] video0: VIDIOC_DQEVENT: error -2
[  131.942660] video0: VIDIOC_DQEVENT: error -2
[  131.947757] video0: VIDIOC_DQEVENT: error -2
[  131.952125] video0: VIDIOC_DQEVENT: error -2
[  131.957238] video0: VIDIOC_DQEVENT: error -2
[  131.962341] video0: VIDIOC_DQEVENT: error -2
[  131.966767] video0: VIDIOC_DQEVENT: error -2
[  131.971883] video0: VIDIOC_DQEVENT: error -2
[  131.976984] video0: VIDIOC_DQEVENT: error -2
[  131.981356] video0: VIDIOC_DQEVENT: error -2
[  131.986471] video0: VIDIOC_DQEVENT: error -2
[  131.991573] video0: VIDIOC_DQEVENT: error -2
[  131.996665] video0: VIDIOC_DQEVENT: error -2
[  131.999773] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  132.001147] video0: VIDIOC_DQEVENT: error -2
[  132.006261] video0: VIDIOC_DQEVENT: error -2
[  132.011364] video0: VIDIOC_DQEVENT: error -2
[  132.015746] video0: VIDIOC_DQEVENT: error -2
[  132.020855] video0: VIDIOC_DQEVENT: error -2
[  132.025952] video0: VIDIOC_DQEVENT: error -2
[  132.031046] video0: VIDIOC_DQEVENT: error -2
[  132.035447] video0: VIDIOC_DQEVENT: error -2
[  132.040560] video0: VIDIOC_DQEVENT: error -2
[  132.045660] video0: VIDIOC_DQEVENT: error -2
[  132.050052] video0: VIDIOC_DQEVENT: error -2
[  132.055170] video0: VIDIOC_DQEVENT: error -2
[  132.060272] video0: VIDIOC_DQEVENT: error -2
[  132.064699] video0: VIDIOC_DQEVENT: error -2
[  132.069809] video0: VIDIOC_DQEVENT: error -2
[  132.074909] video0: VIDIOC_DQEVENT: error -2
[  132.080002] video0: VIDIOC_DQEVENT: error -2
[  132.084384] video0: VIDIOC_DQEVENT: error -2
[  132.089499] video0: VIDIOC_DQEVENT: error -2
[  132.094602] video0: VIDIOC_DQEVENT: error -2
[  132.099016] video0: VIDIOC_DQEVENT: error -2
[  132.104135] video0: VIDIOC_DQEVENT: error -2
[  132.109241] video0: VIDIOC_DQEVENT: error -2
[  132.114333] video0: VIDIOC_DQEVENT: error -2
[  132.118735] video0: VIDIOC_DQEVENT: error -2
[  132.123851] video0: VIDIOC_DQEVENT: error -2
[  132.128952] video0: VIDIOC_DQEVENT: error -2
[  132.133322] video0: VIDIOC_DQEVENT: error -2
[  132.138438] video0: VIDIOC_DQEVENT: error -2
[  132.143541] video0: VIDIOC_DQEVENT: error -2
[  132.147924] video0: VIDIOC_DQEVENT: error -2
[  132.153033] video0: VIDIOC_DQEVENT: error -2
[  132.158144] video0: VIDIOC_DQEVENT: error -2
[  132.163244] video0: VIDIOC_DQEVENT: error -2
[  132.167660] video0: VIDIOC_DQEVENT: error -2
[  132.172766] video0: VIDIOC_DQEVENT: error -2
[  132.177865] video0: VIDIOC_DQEVENT: error -2
[  132.182284] video0: VIDIOC_DQEVENT: error -2
[  132.187401] video0: VIDIOC_DQEVENT: error -2
[  132.192506] video0: VIDIOC_DQEVENT: error -2
[  132.197601] video0: VIDIOC_DQEVENT: error -2
[  132.202015] video0: VIDIOC_DQEVENT: error -2
[  132.207131] video0: VIDIOC_DQEVENT: error -2
[  132.212232] video0: VIDIOC_DQEVENT: error -2
[  132.216605] video0: VIDIOC_DQEVENT: error -2
[  132.221721] video0: VIDIOC_DQEVENT: error -2
[  132.226823] video0: VIDIOC_DQEVENT: error -2
[  132.231230] video0: VIDIOC_DQEVENT: error -2
[  132.236343] video0: VIDIOC_DQEVENT: error -2
[  132.241444] video0: VIDIOC_DQEVENT: error -2
[  132.246538] video0: VIDIOC_DQEVENT: error -2
[  132.250962] video0: VIDIOC_DQEVENT: error -2
[  132.256080] video0: VIDIOC_DQEVENT: error -2
[  132.261183] video0: VIDIOC_DQEVENT: error -2
[  132.265564] video0: VIDIOC_DQEVENT: error -2
[  132.270679] video0: VIDIOC_DQEVENT: error -2
[  132.275782] video0: VIDIOC_DQEVENT: error -2
[  132.280876] video0: VIDIOC_DQEVENT: error -2
[  132.285258] video0: VIDIOC_DQEVENT: error -2
[  132.290371] video0: VIDIOC_DQEVENT: error -2
[  132.295472] video0: VIDIOC_DQEVENT: error -2
[  132.299840] video0: VIDIOC_DQEVENT: error -2
[  132.304948] video0: VIDIOC_DQEVENT: error -2
[  132.310048] video0: VIDIOC_DQEVENT: error -2
[  132.314459] video0: VIDIOC_DQEVENT: error -2
[  132.319576] video0: VIDIOC_DQEVENT: error -2
[  132.324684] video0: VIDIOC_DQEVENT: error -2
[  132.329778] video0: VIDIOC_DQEVENT: error -2
[  132.334203] video0: VIDIOC_DQEVENT: error -2
[  132.339319] video0: VIDIOC_DQEVENT: error -2
[  132.344419] video0: VIDIOC_DQEVENT: error -2
[  132.348808] video0: VIDIOC_DQEVENT: error -2
[  132.353923] video0: VIDIOC_DQEVENT: error -2
[  132.359024] video0: VIDIOC_DQEVENT: error -2
[  132.364122] video0: VIDIOC_DQEVENT: error -2
[  132.368499] video0: VIDIOC_DQEVENT: error -2
[  132.373616] video0: VIDIOC_DQEVENT: error -2
[  132.378717] video0: VIDIOC_DQEVENT: error -2
[  132.383118] video0: VIDIOC_DQEVENT: error -2
[  132.388235] video0: VIDIOC_DQEVENT: error -2
[  132.393335] video0: VIDIOC_DQEVENT: error -2
[  132.397726] video0: VIDIOC_DQEVENT: error -2
[  132.402841] video0: VIDIOC_DQEVENT: error -2
[  132.407944] video0: VIDIOC_DQEVENT: error -2
[  132.413035] video0: VIDIOC_DQEVENT: error -2
[  132.417403] video0: VIDIOC_DQEVENT: error -2
[  132.422517] video0: VIDIOC_DQEVENT: error -2
[  132.427618] video0: VIDIOC_DQEVENT: error -2
[  132.431992] video0: VIDIOC_DQEVENT: error -2
[  132.437102] video0: VIDIOC_DQEVENT: error -2
[  132.442200] video0: VIDIOC_DQEVENT: error -2
[  132.447296] video0: VIDIOC_DQEVENT: error -2
[  132.451664] video0: VIDIOC_DQEVENT: error -2
[  132.456776] video0: VIDIOC_DQEVENT: error -2
[  132.461897] video0: VIDIOC_DQEVENT: error -2
[  132.466357] video0: VIDIOC_DQEVENT: error -2
[  132.471472] video0: VIDIOC_DQEVENT: error -2
[  132.476582] video0: VIDIOC_DQEVENT: error -2
[  132.480995] video0: VIDIOC_DQEVENT: error -2
[  132.486111] video0: VIDIOC_DQEVENT: error -2
[  132.491213] video0: VIDIOC_DQEVENT: error -2
[  132.496308] video0: VIDIOC_DQEVENT: error -2
[  132.500696] video0: VIDIOC_DQEVENT: error -2
[  132.505812] video0: VIDIOC_DQEVENT: error -2
[  132.510917] video0: VIDIOC_DQEVENT: error -2
[  132.515410] video0: VIDIOC_DQEVENT: error -2
[  132.520525] video0: VIDIOC_DQEVENT: error -2
[  132.525626] video0: VIDIOC_DQEVENT: error -2
[  132.530721] video0: VIDIOC_DQEVENT: error -2
[  132.535207] video0: VIDIOC_DQEVENT: error -2
[  132.540320] video0: VIDIOC_DQEVENT: error -2
[  132.545424] video0: VIDIOC_DQEVENT: error -2
[  132.549844] video0: VIDIOC_DQEVENT: error -2
[  132.554959] video0: VIDIOC_DQEVENT: error -2
[  132.560064] video0: VIDIOC_DQEVENT: error -2
[  132.564444] video0: VIDIOC_DQEVENT: error -2
[  132.569560] video0: VIDIOC_DQEVENT: error -2
[  132.574664] video0: VIDIOC_DQEVENT: error -2
[  132.579761] video0: VIDIOC_DQEVENT: error -2
[  132.584159] video0: VIDIOC_DQEVENT: error -2
[  132.589270] video0: VIDIOC_DQEVENT: error -2
[  132.594372] video0: VIDIOC_DQEVENT: error -2
[  132.598827] video0: VIDIOC_DQEVENT: error -2
[  132.603950] video0: VIDIOC_DQEVENT: error -2
[  132.609061] video0: VIDIOC_DQEVENT: error -2
[  132.614168] video0: VIDIOC_DQEVENT: error -2
[  132.618792] video0: VIDIOC_DQEVENT: error -2
[  132.623914] video0: VIDIOC_DQEVENT: error -2
[  132.629024] video0: VIDIOC_DQEVENT: error -2
[  132.633463] video0: VIDIOC_DQEVENT: error -2
[  132.638578] video0: VIDIOC_DQEVENT: error -2
[  132.643680] video0: VIDIOC_DQEVENT: error -2
[  132.648053] video0: VIDIOC_DQEVENT: error -2
[  132.653161] video0: VIDIOC_DQEVENT: error -2
[  132.658260] video0: VIDIOC_DQEVENT: error -2
[  132.663354] video0: VIDIOC_DQEVENT: error -2
[  132.667726] video0: VIDIOC_DQEVENT: error -2
[  132.672833] video0: VIDIOC_DQEVENT: error -2
[  132.677932] video0: VIDIOC_DQEVENT: error -2
[  132.682348] video0: VIDIOC_DQEVENT: error -2
[  132.687464] video0: VIDIOC_DQEVENT: error -2
[  132.692565] video0: VIDIOC_DQEVENT: error -2
[  132.697659] video0: VIDIOC_DQEVENT: error -2
[  132.702073] video0: VIDIOC_DQEVENT: error -2
[  132.707190] video0: VIDIOC_DQEVENT: error -2
[  132.712294] video0: VIDIOC_DQEVENT: error -2
[  132.716694] video0: VIDIOC_DQEVENT: error -2
[  132.721808] video0: VIDIOC_DQEVENT: error -2
[  132.726908] video0: VIDIOC_DQEVENT: error -2
[  132.731307] video0: VIDIOC_DQEVENT: error -2
[  132.736420] video0: VIDIOC_DQEVENT: error -2
[  132.741522] video0: VIDIOC_DQEVENT: error -2
[  132.746614] video0: VIDIOC_DQEVENT: error -2
[  132.750991] video0: VIDIOC_DQEVENT: error -2
[  132.756107] video0: VIDIOC_DQEVENT: error -2
[  132.761211] video0: VIDIOC_DQEVENT: error -2
[  132.765606] video0: VIDIOC_DQEVENT: error -2
[  132.770720] video0: VIDIOC_DQEVENT: error -2
[  132.775824] video0: VIDIOC_DQEVENT: error -2
[  132.780919] video0: VIDIOC_DQEVENT: error -2
[  132.785298] video0: VIDIOC_DQEVENT: error -2
[  132.790412] video0: VIDIOC_DQEVENT: error -2
[  132.795516] video0: VIDIOC_DQEVENT: error -2
[  132.799856] video0: VIDIOC_DQEVENT: error -2
[  132.804963] video0: VIDIOC_DQEVENT: error -2
[  132.810062] video0: VIDIOC_DQEVENT: error -2
[  132.814485] video0: VIDIOC_DQEVENT: error -2
[  132.819600] video0: VIDIOC_DQEVENT: error -2
[  132.824706] video0: VIDIOC_DQEVENT: error -2
[  132.829800] video0: VIDIOC_DQEVENT: error -2
[  132.834219] video0: VIDIOC_DQEVENT: error -2
[  132.839335] video0: VIDIOC_DQEVENT: error -2
[  132.844436] video0: VIDIOC_DQEVENT: error -2
[  132.848834] video0: VIDIOC_DQEVENT: error -2
[  132.853950] video0: VIDIOC_DQEVENT: error -2
[  132.859053] video0: VIDIOC_DQEVENT: error -2
[  132.864167] video0: VIDIOC_DQEVENT: error -2
[  132.868558] video0: VIDIOC_DQEVENT: error -2
[  132.873674] video0: VIDIOC_DQEVENT: error -2
[  132.878776] video0: VIDIOC_DQEVENT: error -2
[  132.883183] video0: VIDIOC_DQEVENT: error -2
[  132.888296] video0: VIDIOC_DQEVENT: error -2
[  132.893396] video0: VIDIOC_DQEVENT: error -2
[  132.897775] video0: VIDIOC_DQEVENT: error -2
[  132.902889] video0: VIDIOC_DQEVENT: error -2
[  132.907991] video0: VIDIOC_DQEVENT: error -2
[  132.913083] video0: VIDIOC_DQEVENT: error -2
[  132.917460] video0: VIDIOC_DQEVENT: error -2
[  132.922575] video0: VIDIOC_DQEVENT: error -2
[  132.927676] video0: VIDIOC_DQEVENT: error -2
[  132.932047] video0: VIDIOC_DQEVENT: error -2
[  132.937156] video0: VIDIOC_DQEVENT: error -2
[  132.942256] video0: VIDIOC_DQEVENT: error -2
[  132.947350] video0: VIDIOC_DQEVENT: error -2
[  132.951720] video0: VIDIOC_DQEVENT: error -2
[  132.956827] video0: VIDIOC_DQEVENT: error -2
[  132.961927] video0: VIDIOC_DQEVENT: error -2
[  132.966368] video0: VIDIOC_DQEVENT: error -2
[  132.971484] video0: VIDIOC_DQEVENT: error -2
[  132.976584] video0: VIDIOC_DQEVENT: error -2
[  132.980949] video0: VIDIOC_DQEVENT: error -2
[  132.986062] video0: VIDIOC_DQEVENT: error -2
[  132.991165] video0: VIDIOC_DQEVENT: error -2
[  132.996258] video0: VIDIOC_DQEVENT: error -2
[  133.000643] video0: VIDIOC_DQEVENT: error -2
[  133.005756] video0: VIDIOC_DQEVENT: error -2
[  133.010857] video0: VIDIOC_DQEVENT: error -2
[  133.015346] video0: VIDIOC_DQEVENT: error -2
[  133.020488] video0: VIDIOC_DQEVENT: error -2
[  133.023712] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  133.025606] video0: VIDIOC_DQEVENT: error -2
[  133.030744] video0: VIDIOC_DQEVENT: error -2
[  133.035447] video0: VIDIOC_DQEVENT: error -2
[  133.040569] video0: VIDIOC_DQEVENT: error -2
[  133.045677] video0: VIDIOC_DQEVENT: error -2
[  133.050379] video0: VIDIOC_DQEVENT: error -2
[  133.055505] video0: VIDIOC_DQEVENT: error -2
[  133.060630] video0: VIDIOC_DQEVENT: error -2
[  133.065409] video0: VIDIOC_DQEVENT: error -2
[  133.070534] video0: VIDIOC_DQEVENT: error -2
[  133.075646] video0: VIDIOC_DQEVENT: error -2
[  133.080748] video0: VIDIOC_DQEVENT: error -2
[  133.085310] video0: VIDIOC_DQEVENT: error -2
[  133.090428] video0: VIDIOC_DQEVENT: error -2
[  133.095531] video0: VIDIOC_DQEVENT: error -2
[  133.100014] video0: VIDIOC_DQEVENT: error -2
[  133.105126] video0: VIDIOC_DQEVENT: error -2
[  133.110226] video0: VIDIOC_DQEVENT: error -2
[  133.114772] video0: VIDIOC_DQEVENT: error -2
[  133.119891] video0: VIDIOC_DQEVENT: error -2
[  133.124991] video0: VIDIOC_DQEVENT: error -2
[  133.130086] video0: VIDIOC_DQEVENT: error -2
[  133.134635] video0: VIDIOC_DQEVENT: error -2
[  133.139751] video0: VIDIOC_DQEVENT: error -2
[  133.144851] video0: VIDIOC_DQEVENT: error -2
[  133.149352] video0: VIDIOC_DQEVENT: error -2
[  133.154470] video0: VIDIOC_DQEVENT: error -2
[  133.159571] video0: VIDIOC_DQEVENT: error -2
[  133.164666] video0: VIDIOC_DQEVENT: error -2
[  133.169170] video0: VIDIOC_DQEVENT: error -2
[  133.174287] video0: VIDIOC_DQEVENT: error -2
[  133.179387] video0: VIDIOC_DQEVENT: error -2
[  133.183873] video0: VIDIOC_DQEVENT: error -2
[  133.188982] video0: VIDIOC_DQEVENT: error -2
[  133.194082] video0: VIDIOC_DQEVENT: error -2
[  133.198628] video0: VIDIOC_DQEVENT: error -2
[  133.203744] video0: VIDIOC_DQEVENT: error -2
[  133.208843] video0: VIDIOC_DQEVENT: error -2
[  133.213937] video0: VIDIOC_DQEVENT: error -2
[  133.218479] video0: VIDIOC_DQEVENT: error -2
[  133.223597] video0: VIDIOC_DQEVENT: error -2
[  133.228698] video0: VIDIOC_DQEVENT: error -2
[  133.233213] video0: VIDIOC_DQEVENT: error -2
[  133.238330] video0: VIDIOC_DQEVENT: error -2
[  133.243432] video0: VIDIOC_DQEVENT: error -2
[  133.247902] video0: VIDIOC_DQEVENT: error -2
[  133.253011] video0: VIDIOC_DQEVENT: error -2
[  133.258109] video0: VIDIOC_DQEVENT: error -2
[  133.263202] video0: VIDIOC_DQEVENT: error -2
[  133.267676] video0: VIDIOC_DQEVENT: error -2
[  133.272786] video0: VIDIOC_DQEVENT: error -2
[  133.277883] video0: VIDIOC_DQEVENT: error -2
[  133.282453] video0: VIDIOC_DQEVENT: error -2
[  133.287569] video0: VIDIOC_DQEVENT: error -2
[  133.292669] video0: VIDIOC_DQEVENT: error -2
[  133.297761] video0: VIDIOC_DQEVENT: error -2
[  133.302298] video0: VIDIOC_DQEVENT: error -2
[  133.307416] video0: VIDIOC_DQEVENT: error -2
[  133.312517] video0: VIDIOC_DQEVENT: error -2
[  133.317007] video0: VIDIOC_DQEVENT: error -2
[  133.322124] video0: VIDIOC_DQEVENT: error -2
[  133.327223] video0: VIDIOC_DQEVENT: error -2
[  133.331707] video0: VIDIOC_DQEVENT: error -2
[  133.336818] video0: VIDIOC_DQEVENT: error -2
[  133.341915] video0: VIDIOC_DQEVENT: error -2
[  133.347010] video0: VIDIOC_DQEVENT: error -2
[  133.351515] video0: VIDIOC_DQEVENT: error -2
[  133.356630] video0: VIDIOC_DQEVENT: error -2
[  133.361729] video0: VIDIOC_DQEVENT: error -2
[  133.366256] video0: VIDIOC_DQEVENT: error -2
[  133.371375] video0: VIDIOC_DQEVENT: error -2
[  133.376476] video0: VIDIOC_DQEVENT: error -2
[  133.381571] video0: VIDIOC_DQEVENT: error -2
[  133.386078] video0: VIDIOC_DQEVENT: error -2
[  133.391196] video0: VIDIOC_DQEVENT: error -2
[  133.396295] video0: VIDIOC_DQEVENT: error -2
[  133.400831] video0: VIDIOC_DQEVENT: error -2
[  133.405972] video0: VIDIOC_DQEVENT: error -2
[  133.411107] video0: VIDIOC_DQEVENT: error -2
[  133.415940] video0: VIDIOC_DQEVENT: error -2
[  133.421063] video0: VIDIOC_DQEVENT: error -2
[  133.426176] video0: VIDIOC_DQEVENT: error -2
[  133.431288] video0: VIDIOC_DQEVENT: error -2
[  133.436016] video0: VIDIOC_DQEVENT: error -2
[  133.441138] video0: VIDIOC_DQEVENT: error -2
[  133.446249] video0: VIDIOC_DQEVENT: error -2
[  133.450913] video0: VIDIOC_DQEVENT: error -2
[  133.456042] video0: VIDIOC_DQEVENT: error -2
[  133.461173] video0: VIDIOC_DQEVENT: error -2
[  133.465894] video0: VIDIOC_DQEVENT: error -2
[  133.471019] video0: VIDIOC_DQEVENT: error -2
[  133.476132] video0: VIDIOC_DQEVENT: error -2
[  133.481244] video0: VIDIOC_DQEVENT: error -2
[  133.485945] video0: VIDIOC_DQEVENT: error -2
[  133.491079] video0: VIDIOC_DQEVENT: error -2
[  133.496219] video0: VIDIOC_DQEVENT: error -2
[  133.500838] video0: VIDIOC_DQEVENT: error -2
[  133.505965] video0: VIDIOC_DQEVENT: error -2
[  133.511104] video0: VIDIOC_DQEVENT: error -2
[  133.515744] video0: VIDIOC_DQEVENT: error -2
[  133.520867] video0: VIDIOC_DQEVENT: error -2
[  133.525984] video0: VIDIOC_DQEVENT: error -2
[  133.531092] video0: VIDIOC_DQEVENT: error -2
[  133.535684] video0: VIDIOC_DQEVENT: error -2
[  133.540808] video0: VIDIOC_DQEVENT: error -2
[  133.545937] video0: VIDIOC_DQEVENT: error -2
[  133.550699] video0: VIDIOC_DQEVENT: error -2
[  133.555825] video0: VIDIOC_DQEVENT: error -2
[  133.560936] video0: VIDIOC_DQEVENT: error -2
[  133.565530] video0: VIDIOC_DQEVENT: error -2
[  133.570662] video0: VIDIOC_DQEVENT: error -2
[  133.575794] video0: VIDIOC_DQEVENT: error -2
[  133.580919] video0: VIDIOC_DQEVENT: error -2
[  133.585600] video0: VIDIOC_DQEVENT: error -2
[  133.590724] video0: VIDIOC_DQEVENT: error -2
[  133.595842] video0: VIDIOC_DQEVENT: error -2
[  133.600581] video0: VIDIOC_DQEVENT: error -2
[  133.605709] video0: VIDIOC_DQEVENT: error -2
[  133.610823] video0: VIDIOC_DQEVENT: error -2
[  133.615487] video0: VIDIOC_DQEVENT: error -2
[  133.620611] video0: VIDIOC_DQEVENT: error -2
[  133.625728] video0: VIDIOC_DQEVENT: error -2
[  133.630854] video0: VIDIOC_DQEVENT: error -2
[  133.635567] video0: VIDIOC_DQEVENT: error -2
[  133.640693] video0: VIDIOC_DQEVENT: error -2
[  133.645803] video0: VIDIOC_DQEVENT: error -2
[  133.650461] video0: VIDIOC_DQEVENT: error -2
[  133.655589] video0: VIDIOC_DQEVENT: error -2
[  133.660723] video0: VIDIOC_DQEVENT: error -2
[  133.665437] video0: VIDIOC_DQEVENT: error -2
[  133.670564] video0: VIDIOC_DQEVENT: error -2
[  133.675679] video0: VIDIOC_DQEVENT: error -2
[  133.680792] video0: VIDIOC_DQEVENT: error -2
[  133.685490] video0: VIDIOC_DQEVENT: error -2
[  133.690614] video0: VIDIOC_DQEVENT: error -2
[  133.695728] video0: VIDIOC_DQEVENT: error -2
[  133.700425] video0: VIDIOC_DQEVENT: error -2
[  133.705552] video0: VIDIOC_DQEVENT: error -2
[  133.710668] video0: VIDIOC_DQEVENT: error -2
[  133.715464] video0: VIDIOC_DQEVENT: error -2
[  133.720588] video0: VIDIOC_DQEVENT: error -2
[  133.725699] video0: VIDIOC_DQEVENT: error -2
[  133.730805] video0: VIDIOC_DQEVENT: error -2
[  133.735459] video0: VIDIOC_DQEVENT: error -2
[  133.740588] video0: VIDIOC_DQEVENT: error -2
[  133.745718] video0: VIDIOC_DQEVENT: error -2
[  133.750473] video0: VIDIOC_DQEVENT: error -2
[  133.755600] video0: VIDIOC_DQEVENT: error -2
[  133.760718] video0: VIDIOC_DQEVENT: error -2
[  133.765335] video0: VIDIOC_DQEVENT: error -2
[  133.770464] video0: VIDIOC_DQEVENT: error -2
[  133.775588] video0: VIDIOC_DQEVENT: error -2
[  133.780695] video0: VIDIOC_DQEVENT: error -2
[  133.785373] video0: VIDIOC_DQEVENT: error -2
[  133.790491] video0: VIDIOC_DQEVENT: error -2
[  133.795607] video0: VIDIOC_DQEVENT: error -2
[  133.800370] video0: VIDIOC_DQEVENT: error -2
[  133.805488] video0: VIDIOC_DQEVENT: error -2
[  133.810600] video0: VIDIOC_DQEVENT: error -2
[  133.815288] video0: VIDIOC_DQEVENT: error -2
[  133.820404] video0: VIDIOC_DQEVENT: error -2
[  133.825521] video0: VIDIOC_DQEVENT: error -2
[  133.830645] video0: VIDIOC_DQEVENT: error -2
[  133.835410] video0: VIDIOC_DQEVENT: error -2
[  133.840538] video0: VIDIOC_DQEVENT: error -2
[  133.845650] video0: VIDIOC_DQEVENT: error -2
[  133.850383] video0: VIDIOC_DQEVENT: error -2
[  133.855520] video0: VIDIOC_DQEVENT: error -2
[  133.860645] video0: VIDIOC_DQEVENT: error -2
[  133.865319] video0: VIDIOC_DQEVENT: error -2
[  133.870444] video0: VIDIOC_DQEVENT: error -2
[  133.875558] video0: VIDIOC_DQEVENT: error -2
[  133.880671] video0: VIDIOC_DQEVENT: error -2
[  133.885435] video0: VIDIOC_DQEVENT: error -2
[  133.890564] video0: VIDIOC_DQEVENT: error -2
[  133.895678] video0: VIDIOC_DQEVENT: error -2
[  133.900294] video0: VIDIOC_DQEVENT: error -2
[  133.905420] video0: VIDIOC_DQEVENT: error -2
[  133.910539] video0: VIDIOC_DQEVENT: error -2
[  133.915356] video0: VIDIOC_DQEVENT: error -2
[  133.920480] video0: VIDIOC_DQEVENT: error -2
[  133.925593] video0: VIDIOC_DQEVENT: error -2
[  133.930699] video0: VIDIOC_DQEVENT: error -2
[  133.935397] video0: VIDIOC_DQEVENT: error -2
[  133.940526] video0: VIDIOC_DQEVENT: error -2
[  133.945647] video0: VIDIOC_DQEVENT: error -2
[  133.950342] video0: VIDIOC_DQEVENT: error -2
[  133.955468] video0: VIDIOC_DQEVENT: error -2
[  133.960580] video0: VIDIOC_DQEVENT: error -2
[  133.965233] video0: VIDIOC_DQEVENT: error -2
[  133.970353] video0: VIDIOC_DQEVENT: error -2
[  133.975472] video0: VIDIOC_DQEVENT: error -2
[  133.980587] video0: VIDIOC_DQEVENT: error -2
[  133.985210] video0: VIDIOC_DQEVENT: error -2
[  133.990330] video0: VIDIOC_DQEVENT: error -2
[  133.995449] video0: VIDIOC_DQEVENT: error -2
[  134.000257] video0: VIDIOC_DQEVENT: error -2
[  134.005374] video0: VIDIOC_DQEVENT: error -2
[  134.010486] video0: VIDIOC_DQEVENT: error -2
[  134.015184] video0: VIDIOC_DQEVENT: error -2
[  134.020312] video0: VIDIOC_DQEVENT: error -2
[  134.025435] video0: VIDIOC_DQEVENT: error -2
[  134.030577] video0: VIDIOC_DQEVENT: error -2
[  134.035390] video0: VIDIOC_DQEVENT: error -2
[  134.040520] video0: VIDIOC_DQEVENT: error -2
[  134.045634] video0: VIDIOC_DQEVENT: error -2
[  134.047752] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  134.050418] video0: VIDIOC_DQEVENT: error -2
[  134.055552] video0: VIDIOC_DQEVENT: error -2
[  134.060678] video0: VIDIOC_DQEVENT: error -2
[  134.065325] video0: VIDIOC_DQEVENT: error -2
[  134.070449] video0: VIDIOC_DQEVENT: error -2
[  134.075560] video0: VIDIOC_DQEVENT: error -2
[  134.080674] video0: VIDIOC_DQEVENT: error -2
[  134.085472] video0: VIDIOC_DQEVENT: error -2
[  134.090598] video0: VIDIOC_DQEVENT: error -2
[  134.095713] video0: VIDIOC_DQEVENT: error -2
[  134.100341] video0: VIDIOC_DQEVENT: error -2
[  134.105470] video0: VIDIOC_DQEVENT: error -2
[  134.110594] video0: VIDIOC_DQEVENT: error -2
[  134.115402] video0: VIDIOC_DQEVENT: error -2
[  134.120526] video0: VIDIOC_DQEVENT: error -2
[  134.125635] video0: VIDIOC_DQEVENT: error -2
[  134.130742] video0: VIDIOC_DQEVENT: error -2
[  134.135458] video0: VIDIOC_DQEVENT: error -2
[  134.140589] video0: VIDIOC_DQEVENT: error -2
[  134.145714] video0: VIDIOC_DQEVENT: error -2
[  134.150366] video0: VIDIOC_DQEVENT: error -2
[  134.155491] video0: VIDIOC_DQEVENT: error -2
[  134.160604] video0: VIDIOC_DQEVENT: error -2
[  134.165343] video0: VIDIOC_DQEVENT: error -2
[  134.170471] video0: VIDIOC_DQEVENT: error -2
[  134.175592] video0: VIDIOC_DQEVENT: error -2
[  134.180699] video0: VIDIOC_DQEVENT: error -2
[  134.185315] video0: VIDIOC_DQEVENT: error -2
[  134.190446] video0: VIDIOC_DQEVENT: error -2
[  134.195579] video0: VIDIOC_DQEVENT: error -2
[  134.200279] video0: VIDIOC_DQEVENT: error -2
[  134.205406] video0: VIDIOC_DQEVENT: error -2
[  134.210520] video0: VIDIOC_DQEVENT: error -2
[  134.215166] video0: VIDIOC_DQEVENT: error -2
[  134.220293] video0: VIDIOC_DQEVENT: error -2
[  134.225418] video0: VIDIOC_DQEVENT: error -2
[  134.230538] video0: VIDIOC_DQEVENT: error -2
[  134.235268] video0: VIDIOC_DQEVENT: error -2
[  134.240392] video0: VIDIOC_DQEVENT: error -2
[  134.245504] video0: VIDIOC_DQEVENT: error -2
[  134.250351] video0: VIDIOC_DQEVENT: error -2
[  134.255481] video0: VIDIOC_DQEVENT: error -2
[  134.260607] video0: VIDIOC_DQEVENT: error -2
[  134.265232] video0: VIDIOC_DQEVENT: error -2
[  134.270357] video0: VIDIOC_DQEVENT: error -2
[  134.275475] video0: VIDIOC_DQEVENT: error -2
[  134.280603] video0: VIDIOC_DQEVENT: error -2
[  134.285294] video0: VIDIOC_DQEVENT: error -2
[  134.290419] video0: VIDIOC_DQEVENT: error -2
[  134.295532] video0: VIDIOC_DQEVENT: error -2
[  134.300135] video0: VIDIOC_DQEVENT: error -2
[  134.305261] video0: VIDIOC_DQEVENT: error -2
[  134.310390] video0: VIDIOC_DQEVENT: error -2
[  134.315131] video0: VIDIOC_DQEVENT: error -2
[  134.320257] video0: VIDIOC_DQEVENT: error -2
[  134.325369] video0: VIDIOC_DQEVENT: error -2
[  134.330477] video0: VIDIOC_DQEVENT: error -2
[  134.335314] video0: VIDIOC_DQEVENT: error -2
[  134.340444] video0: VIDIOC_DQEVENT: error -2
[  134.345565] video0: VIDIOC_DQEVENT: error -2
[  134.350224] video0: VIDIOC_DQEVENT: error -2
[  134.355350] video0: VIDIOC_DQEVENT: error -2
[  134.360467] video0: VIDIOC_DQEVENT: error -2
[  134.365119] video0: VIDIOC_DQEVENT: error -2
[  134.370246] video0: VIDIOC_DQEVENT: error -2
[  134.375359] video0: VIDIOC_DQEVENT: error -2
[  134.380467] video0: VIDIOC_DQEVENT: error -2
[  134.385076] video0: VIDIOC_DQEVENT: error -2
[  134.390204] video0: VIDIOC_DQEVENT: error -2
[  134.395334] video0: VIDIOC_DQEVENT: error -2
[  134.400019] video0: VIDIOC_DQEVENT: error -2
[  134.405142] video0: VIDIOC_DQEVENT: error -2
[  134.410255] video0: VIDIOC_DQEVENT: error -2
[  134.414910] video0: VIDIOC_DQEVENT: error -2
[  134.420040] video0: VIDIOC_DQEVENT: error -2
[  134.425175] video0: VIDIOC_DQEVENT: error -2
[  134.430297] video0: VIDIOC_DQEVENT: error -2
[  134.434996] video0: VIDIOC_DQEVENT: error -2
[  134.440121] video0: VIDIOC_DQEVENT: error -2
[  134.445243] video0: VIDIOC_DQEVENT: error -2
[  134.449979] video0: VIDIOC_DQEVENT: error -2
[  134.455108] video0: VIDIOC_DQEVENT: error -2
[  134.460220] video0: VIDIOC_DQEVENT: error -2
[  134.464820] video0: VIDIOC_DQEVENT: error -2
[  134.469947] video0: VIDIOC_DQEVENT: error -2
[  134.475062] video0: VIDIOC_DQEVENT: error -2
[  134.480206] video0: VIDIOC_DQEVENT: error -2
[  134.484878] video0: VIDIOC_DQEVENT: error -2
[  134.490004] video0: VIDIOC_DQEVENT: error -2
[  134.495119] video0: VIDIOC_DQEVENT: error -2
[  134.499704] video0: VIDIOC_DQEVENT: error -2
[  134.504829] video0: VIDIOC_DQEVENT: error -2
[  134.509955] video0: VIDIOC_DQEVENT: error -2
[  134.514697] video0: VIDIOC_DQEVENT: error -2
[  134.519823] video0: VIDIOC_DQEVENT: error -2
[  134.524942] video0: VIDIOC_DQEVENT: error -2
[  134.530053] video0: VIDIOC_DQEVENT: error -2
[  134.534813] video0: VIDIOC_DQEVENT: error -2
[  134.539937] video0: VIDIOC_DQEVENT: error -2
[  134.545051] video0: VIDIOC_DQEVENT: error -2
[  134.549652] video0: VIDIOC_DQEVENT: error -2
[  134.554776] video0: VIDIOC_DQEVENT: error -2
[  134.559893] video0: VIDIOC_DQEVENT: error -2
[  134.564531] video0: VIDIOC_DQEVENT: error -2
[  134.569659] video0: VIDIOC_DQEVENT: error -2
[  134.574774] video0: VIDIOC_DQEVENT: error -2
[  134.579882] video0: VIDIOC_DQEVENT: error -2
[  134.584496] video0: VIDIOC_DQEVENT: error -2
[  134.589628] video0: VIDIOC_DQEVENT: error -2
[  134.594756] video0: VIDIOC_DQEVENT: error -2
[  134.599498] video0: VIDIOC_DQEVENT: error -2
[  134.604622] video0: VIDIOC_DQEVENT: error -2
[  134.609732] video0: VIDIOC_DQEVENT: error -2
[  134.614840] video0: VIDIOC_DQEVENT: error -2
[  134.619539] video0: VIDIOC_DQEVENT: error -2
[  134.624671] video0: VIDIOC_DQEVENT: error -2
[  134.629805] video0: VIDIOC_DQEVENT: error -2
[  134.634553] video0: VIDIOC_DQEVENT: error -2
[  134.639681] video0: VIDIOC_DQEVENT: error -2
[  134.644796] video0: VIDIOC_DQEVENT: error -2
[  134.649540] video0: VIDIOC_DQEVENT: error -2
[  134.654670] video0: VIDIOC_DQEVENT: error -2
[  134.659796] video0: VIDIOC_DQEVENT: error -2
[  134.664903] video0: VIDIOC_DQEVENT: error -2
[  134.669525] video0: VIDIOC_DQEVENT: error -2
[  134.674685] video0: VIDIOC_DQEVENT: error -2
[  134.679848] video0: VIDIOC_DQEVENT: error -2
[  134.684629] video0: VIDIOC_DQEVENT: error -2
[  134.689753] video0: VIDIOC_DQEVENT: error -2
[  134.694864] video0: VIDIOC_DQEVENT: error -2
[  134.699470] video0: VIDIOC_DQEVENT: error -2
[  134.704628] video0: VIDIOC_DQEVENT: error -2
[  134.709786] video0: VIDIOC_DQEVENT: error -2
[  134.714901] video0: VIDIOC_DQEVENT: error -2
[  134.719592] video0: VIDIOC_DQEVENT: error -2
[  134.724720] video0: VIDIOC_DQEVENT: error -2
[  134.729832] video0: VIDIOC_DQEVENT: error -2
[  134.734473] video0: VIDIOC_DQEVENT: error -2
[  134.739604] video0: VIDIOC_DQEVENT: error -2
[  134.744727] video0: VIDIOC_DQEVENT: error -2
[  134.749374] video0: VIDIOC_DQEVENT: error -2
[  134.754503] video0: VIDIOC_DQEVENT: error -2
[  134.759616] video0: VIDIOC_DQEVENT: error -2
[  134.764730] video0: VIDIOC_DQEVENT: error -2
[  134.769467] video0: VIDIOC_DQEVENT: error -2
[  134.774595] video0: VIDIOC_DQEVENT: error -2
[  134.779711] video0: VIDIOC_DQEVENT: error -2
[  134.784318] video0: VIDIOC_DQEVENT: error -2
[  134.789443] video0: VIDIOC_DQEVENT: error -2
[  134.794558] video0: VIDIOC_DQEVENT: error -2
[  134.799350] video0: VIDIOC_DQEVENT: error -2
[  134.804475] video0: VIDIOC_DQEVENT: error -2
[  134.809586] video0: VIDIOC_DQEVENT: error -2
[  134.814690] video0: VIDIOC_DQEVENT: error -2
[  134.819332] video0: VIDIOC_DQEVENT: error -2
[  134.824458] video0: VIDIOC_DQEVENT: error -2
[  134.829588] video0: VIDIOC_DQEVENT: error -2
[  134.834308] video0: VIDIOC_DQEVENT: error -2
[  134.839435] video0: VIDIOC_DQEVENT: error -2
[  134.844547] video0: VIDIOC_DQEVENT: error -2
[  134.849149] video0: VIDIOC_DQEVENT: error -2
[  134.854280] video0: VIDIOC_DQEVENT: error -2
[  134.859410] video0: VIDIOC_DQEVENT: error -2
[  134.864534] video0: VIDIOC_DQEVENT: error -2
[  134.869189] video0: VIDIOC_DQEVENT: error -2
[  134.874314] video0: VIDIOC_DQEVENT: error -2
[  134.879431] video0: VIDIOC_DQEVENT: error -2
[  134.884053] video0: VIDIOC_DQEVENT: error -2
[  134.889178] video0: VIDIOC_DQEVENT: error -2
[  134.894287] video0: VIDIOC_DQEVENT: error -2
[  134.898940] video0: VIDIOC_DQEVENT: error -2
[  134.904068] video0: VIDIOC_DQEVENT: error -2
[  134.909184] video0: VIDIOC_DQEVENT: error -2
[  134.914312] video0: VIDIOC_DQEVENT: error -2
[  134.919053] video0: VIDIOC_DQEVENT: error -2
[  134.924198] video0: VIDIOC_DQEVENT: error -2
[  134.929312] video0: VIDIOC_DQEVENT: error -2
[  134.933999] video0: VIDIOC_DQEVENT: error -2
[  134.939129] video0: VIDIOC_DQEVENT: error -2
[  134.944262] video0: VIDIOC_DQEVENT: error -2
[  134.948943] video0: VIDIOC_DQEVENT: error -2
[  134.954070] video0: VIDIOC_DQEVENT: error -2
[  134.959183] video0: VIDIOC_DQEVENT: error -2
[  134.964290] video0: VIDIOC_DQEVENT: error -2
[  134.969003] video0: VIDIOC_DQEVENT: error -2
[  134.974131] video0: VIDIOC_DQEVENT: error -2
[  134.979253] video0: VIDIOC_DQEVENT: error -2
[  134.983853] video0: VIDIOC_DQEVENT: error -2
[  134.988977] video0: VIDIOC_DQEVENT: error -2
[  134.994088] video0: VIDIOC_DQEVENT: error -2
[  134.998861] video0: VIDIOC_DQEVENT: error -2
[  135.003990] video0: VIDIOC_DQEVENT: error -2
[  135.009114] video0: VIDIOC_DQEVENT: error -2
[  135.014224] video0: VIDIOC_DQEVENT: error -2
[  135.018873] video0: VIDIOC_DQEVENT: error -2
[  135.024004] video0: VIDIOC_DQEVENT: error -2
[  135.029132] video0: VIDIOC_DQEVENT: error -2
[  135.033903] video0: VIDIOC_DQEVENT: error -2
[  135.039028] video0: VIDIOC_DQEVENT: error -2
[  135.044143] video0: VIDIOC_DQEVENT: error -2
[  135.048735] video0: VIDIOC_DQEVENT: error -2
[  135.053865] video0: VIDIOC_DQEVENT: error -2
[  135.058993] video0: VIDIOC_DQEVENT: error -2
[  135.064112] video0: VIDIOC_DQEVENT: error -2
[  135.068754] video0: VIDIOC_DQEVENT: error -2
[  135.071725] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  135.073880] video0: VIDIOC_DQEVENT: error -2
[  135.078989] video0: VIDIOC_DQEVENT: error -2
[  135.083706] video0: VIDIOC_DQEVENT: error -2
[  135.088834] video0: VIDIOC_DQEVENT: error -2
[  135.093959] video0: VIDIOC_DQEVENT: error -2
[  135.098616] video0: VIDIOC_DQEVENT: error -2
[  135.103741] video0: VIDIOC_DQEVENT: error -2
[  135.108854] video0: VIDIOC_DQEVENT: error -2
[  135.113963] video0: VIDIOC_DQEVENT: error -2
[  135.118783] video0: VIDIOC_DQEVENT: error -2
[  135.123908] video0: VIDIOC_DQEVENT: error -2
[  135.129020] video0: VIDIOC_DQEVENT: error -2
[  135.133603] video0: VIDIOC_DQEVENT: error -2
[  135.138729] video0: VIDIOC_DQEVENT: error -2
[  135.143850] video0: VIDIOC_DQEVENT: error -2
[  135.148598] video0: VIDIOC_DQEVENT: error -2
[  135.153724] video0: VIDIOC_DQEVENT: error -2
[  135.158835] video0: VIDIOC_DQEVENT: error -2
[  135.163940] video0: VIDIOC_DQEVENT: error -2
[  135.168549] video0: VIDIOC_DQEVENT: error -2
[  135.173678] video0: VIDIOC_DQEVENT: error -2
[  135.178808] video0: VIDIOC_DQEVENT: error -2
[  135.183514] video0: VIDIOC_DQEVENT: error -2
[  135.188641] video0: VIDIOC_DQEVENT: error -2
[  135.193754] video0: VIDIOC_DQEVENT: error -2
[  135.198386] video0: VIDIOC_DQEVENT: error -2
[  135.203536] video0: VIDIOC_DQEVENT: error -2
[  135.208658] video0: VIDIOC_DQEVENT: error -2
[  135.213778] video0: VIDIOC_DQEVENT: error -2
[  135.218462] video0: VIDIOC_DQEVENT: error -2
[  135.223588] video0: VIDIOC_DQEVENT: error -2
[  135.228703] video0: VIDIOC_DQEVENT: error -2
[  135.233429] video0: VIDIOC_DQEVENT: error -2
[  135.238553] video0: VIDIOC_DQEVENT: error -2
[  135.243666] video0: VIDIOC_DQEVENT: error -2
[  135.248200] video0: VIDIOC_DQEVENT: error -2
[  135.253317] video0: VIDIOC_DQEVENT: error -2
[  135.258431] video0: VIDIOC_DQEVENT: error -2
[  135.263554] video0: VIDIOC_DQEVENT: error -2
[  135.268258] video0: VIDIOC_DQEVENT: error -2
[  135.273383] video0: VIDIOC_DQEVENT: error -2
[  135.278495] video0: VIDIOC_DQEVENT: error -2
[  135.283045] video0: VIDIOC_DQEVENT: error -2
[  135.288194] video0: VIDIOC_DQEVENT: error -2
[  135.293324] video0: VIDIOC_DQEVENT: error -2
[  135.298023] video0: VIDIOC_DQEVENT: error -2
[  135.303150] video0: VIDIOC_DQEVENT: error -2
[  135.308265] video0: VIDIOC_DQEVENT: error -2
[  135.313375] video0: VIDIOC_DQEVENT: error -2
[  135.318027] video0: VIDIOC_DQEVENT: error -2
[  135.323150] video0: VIDIOC_DQEVENT: error -2
[  135.328274] video0: VIDIOC_DQEVENT: error -2
[  135.332766] video0: VIDIOC_DQEVENT: error -2
[  135.337885] video0: VIDIOC_DQEVENT: error -2
[  135.343002] video0: VIDIOC_DQEVENT: error -2
[  135.348134] video0: VIDIOC_DQEVENT: error -2
[  135.352869] video0: VIDIOC_DQEVENT: error -2
[  135.357995] video0: VIDIOC_DQEVENT: error -2
[  135.363110] video0: VIDIOC_DQEVENT: error -2
[  135.367693] video0: VIDIOC_DQEVENT: error -2
[  135.372820] video0: VIDIOC_DQEVENT: error -2
[  135.377950] video0: VIDIOC_DQEVENT: error -2
[  135.382710] video0: VIDIOC_DQEVENT: error -2
[  135.387836] video0: VIDIOC_DQEVENT: error -2
[  135.392950] video0: VIDIOC_DQEVENT: error -2
[  135.398055] video0: VIDIOC_DQEVENT: error -2
[  135.402766] video0: VIDIOC_DQEVENT: error -2
[  135.407897] video0: VIDIOC_DQEVENT: error -2
[  135.413020] video0: VIDIOC_DQEVENT: error -2
[  135.417627] video0: VIDIOC_DQEVENT: error -2
[  135.422752] video0: VIDIOC_DQEVENT: error -2
[  135.427864] video0: VIDIOC_DQEVENT: error -2
[  135.432466] video0: VIDIOC_DQEVENT: error -2
[  135.437592] video0: VIDIOC_DQEVENT: error -2
[  135.442709] video0: VIDIOC_DQEVENT: error -2
[  135.447817] video0: VIDIOC_DQEVENT: error -2
[  135.452414] video0: VIDIOC_DQEVENT: error -2
[  135.457539] video0: VIDIOC_DQEVENT: error -2
[  135.462658] video0: VIDIOC_DQEVENT: error -2
[  135.467317] video0: VIDIOC_DQEVENT: error -2
[  135.472442] video0: VIDIOC_DQEVENT: error -2
[  135.477546] video0: VIDIOC_DQEVENT: error -2
[  135.482050] video0: VIDIOC_DQEVENT: error -2
[  135.487173] video0: VIDIOC_DQEVENT: error -2
[  135.492278] video0: VIDIOC_DQEVENT: error -2
[  135.497379] video0: VIDIOC_DQEVENT: error -2
[  135.501887] video0: VIDIOC_DQEVENT: error -2
[  135.507011] video0: VIDIOC_DQEVENT: error -2
[  135.512116] video0: VIDIOC_DQEVENT: error -2
[  135.516603] video0: VIDIOC_DQEVENT: error -2
[  135.521726] video0: VIDIOC_DQEVENT: error -2
[  135.526829] video0: VIDIOC_DQEVENT: error -2
[  135.531341] video0: VIDIOC_DQEVENT: error -2
[  135.536464] video0: VIDIOC_DQEVENT: error -2
[  135.541563] video0: VIDIOC_DQEVENT: error -2
[  135.546659] video0: VIDIOC_DQEVENT: error -2
[  135.551239] video0: VIDIOC_DQEVENT: error -2
[  135.556355] video0: VIDIOC_DQEVENT: error -2
[  135.561453] video0: VIDIOC_DQEVENT: error -2
[  135.565977] video0: VIDIOC_DQEVENT: error -2
[  135.571096] video0: VIDIOC_DQEVENT: error -2
[  135.576195] video0: VIDIOC_DQEVENT: error -2
[  135.581288] video0: VIDIOC_DQEVENT: error -2
[  135.585803] video0: VIDIOC_DQEVENT: error -2
[  135.590921] video0: VIDIOC_DQEVENT: error -2
[  135.596021] video0: VIDIOC_DQEVENT: error -2
[  135.600499] video0: VIDIOC_DQEVENT: error -2
[  135.605617] video0: VIDIOC_DQEVENT: error -2
[  135.610719] video0: VIDIOC_DQEVENT: error -2
[  135.615241] video0: VIDIOC_DQEVENT: error -2
[  135.620358] video0: VIDIOC_DQEVENT: error -2
[  135.625456] video0: VIDIOC_DQEVENT: error -2
[  135.630549] video0: VIDIOC_DQEVENT: error -2
[  135.635100] video0: VIDIOC_DQEVENT: error -2
[  135.640219] video0: VIDIOC_DQEVENT: error -2
[  135.645317] video0: VIDIOC_DQEVENT: error -2
[  135.649825] video0: VIDIOC_DQEVENT: error -2
[  135.654941] video0: VIDIOC_DQEVENT: error -2
[  135.660041] video0: VIDIOC_DQEVENT: error -2
[  135.664545] video0: VIDIOC_DQEVENT: error -2
[  135.669661] video0: VIDIOC_DQEVENT: error -2
[  135.674762] video0: VIDIOC_DQEVENT: error -2
[  135.679859] video0: VIDIOC_DQEVENT: error -2
[  135.684337] video0: VIDIOC_DQEVENT: error -2
[  135.689453] video0: VIDIOC_DQEVENT: error -2
[  135.694554] video0: VIDIOC_DQEVENT: error -2
[  135.699077] video0: VIDIOC_DQEVENT: error -2
[  135.704209] video0: VIDIOC_DQEVENT: error -2
[  135.709310] video0: VIDIOC_DQEVENT: error -2
[  135.714405] video0: VIDIOC_DQEVENT: error -2
[  135.718934] video0: VIDIOC_DQEVENT: error -2
[  135.724051] video0: VIDIOC_DQEVENT: error -2
[  135.729152] video0: VIDIOC_DQEVENT: error -2
[  135.733641] video0: VIDIOC_DQEVENT: error -2
[  135.738757] video0: VIDIOC_DQEVENT: error -2
[  135.743859] video0: VIDIOC_DQEVENT: error -2
[  135.748339] video0: VIDIOC_DQEVENT: error -2
[  135.753457] video0: VIDIOC_DQEVENT: error -2
[  135.758556] video0: VIDIOC_DQEVENT: error -2
[  135.763649] video0: VIDIOC_DQEVENT: error -2
[  135.768138] video0: VIDIOC_DQEVENT: error -2
[  135.773250] video0: VIDIOC_DQEVENT: error -2
[  135.778349] video0: VIDIOC_DQEVENT: error -2
[  135.782885] video0: VIDIOC_DQEVENT: error -2
[  135.788005] video0: VIDIOC_DQEVENT: error -2
[  135.793105] video0: VIDIOC_DQEVENT: error -2
[  135.798198] video0: VIDIOC_DQEVENT: error -2
[  135.802732] video0: VIDIOC_DQEVENT: error -2
[  135.807850] video0: VIDIOC_DQEVENT: error -2
[  135.812952] video0: VIDIOC_DQEVENT: error -2
[  135.817457] video0: VIDIOC_DQEVENT: error -2
[  135.822575] video0: VIDIOC_DQEVENT: error -2
[  135.827673] video0: VIDIOC_DQEVENT: error -2
[  135.832160] video0: VIDIOC_DQEVENT: error -2
[  135.837273] video0: VIDIOC_DQEVENT: error -2
[  135.842373] video0: VIDIOC_DQEVENT: error -2
[  135.847467] video0: VIDIOC_DQEVENT: error -2
[  135.851943] video0: VIDIOC_DQEVENT: error -2
[  135.857054] video0: VIDIOC_DQEVENT: error -2
[  135.862151] video0: VIDIOC_DQEVENT: error -2
[  135.866671] video0: VIDIOC_DQEVENT: error -2
[  135.871790] video0: VIDIOC_DQEVENT: error -2
[  135.876888] video0: VIDIOC_DQEVENT: error -2
[  135.881365] video0: VIDIOC_DQEVENT: error -2
[  135.886482] video0: VIDIOC_DQEVENT: error -2
[  135.891584] video0: VIDIOC_DQEVENT: error -2
[  135.896677] video0: VIDIOC_DQEVENT: error -2
[  135.901181] video0: VIDIOC_DQEVENT: error -2
[  135.906299] video0: VIDIOC_DQEVENT: error -2
[  135.911400] video0: VIDIOC_DQEVENT: error -2
[  135.915870] video0: VIDIOC_DQEVENT: error -2
[  135.920995] video0: VIDIOC_DQEVENT: error -2
[  135.926094] video0: VIDIOC_DQEVENT: error -2
[  135.931188] video0: VIDIOC_DQEVENT: error -2
[  135.935675] video0: VIDIOC_DQEVENT: error -2
[  135.940784] video0: VIDIOC_DQEVENT: error -2
[  135.945881] video0: VIDIOC_DQEVENT: error -2
[  135.950437] video0: VIDIOC_DQEVENT: error -2
[  135.955555] video0: VIDIOC_DQEVENT: error -2
[  135.960653] video0: VIDIOC_DQEVENT: error -2
[  135.965143] video0: VIDIOC_DQEVENT: error -2
[  135.970260] video0: VIDIOC_DQEVENT: error -2
[  135.975363] video0: VIDIOC_DQEVENT: error -2
[  135.980456] video0: VIDIOC_DQEVENT: error -2
[  135.984962] video0: VIDIOC_DQEVENT: error -2
[  135.990078] video0: VIDIOC_DQEVENT: error -2
[  135.995177] video0: VIDIOC_DQEVENT: error -2
[  135.999658] video0: VIDIOC_DQEVENT: error -2
[  136.004767] video0: VIDIOC_DQEVENT: error -2
[  136.009866] video0: VIDIOC_DQEVENT: error -2
[  136.014960] video0: VIDIOC_DQEVENT: error -2
[  136.019462] video0: VIDIOC_DQEVENT: error -2
[  136.024577] video0: VIDIOC_DQEVENT: error -2
[  136.029676] video0: VIDIOC_DQEVENT: error -2
[  136.034203] video0: VIDIOC_DQEVENT: error -2
[  136.039319] video0: VIDIOC_DQEVENT: error -2
[  136.044421] video0: VIDIOC_DQEVENT: error -2
[  136.048925] video0: VIDIOC_DQEVENT: error -2
[  136.054043] video0: VIDIOC_DQEVENT: error -2
[  136.059144] video0: VIDIOC_DQEVENT: error -2
[  136.064237] video0: VIDIOC_DQEVENT: error -2
[  136.068723] video0: VIDIOC_DQEVENT: error -2
[  136.073840] video0: VIDIOC_DQEVENT: error -2
[  136.078938] video0: VIDIOC_DQEVENT: error -2
[  136.083441] video0: VIDIOC_DQEVENT: error -2
[  136.088559] video0: VIDIOC_DQEVENT: error -2
[  136.093659] video0: VIDIOC_DQEVENT: error -2
[  136.095770] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  136.098283] video0: VIDIOC_DQEVENT: error -2
[  136.103399] video0: VIDIOC_DQEVENT: error -2
[  136.108500] video0: VIDIOC_DQEVENT: error -2
[  136.113594] video0: VIDIOC_DQEVENT: error -2
[  136.118110] video0: VIDIOC_DQEVENT: error -2
[  136.123228] video0: VIDIOC_DQEVENT: error -2
[  136.128330] video0: VIDIOC_DQEVENT: error -2
[  136.132822] video0: VIDIOC_DQEVENT: error -2
[  136.137937] video0: VIDIOC_DQEVENT: error -2
[  136.143035] video0: VIDIOC_DQEVENT: error -2
[  136.148129] video0: VIDIOC_DQEVENT: error -2
[  136.152617] video0: VIDIOC_DQEVENT: error -2
[  136.157735] video0: VIDIOC_DQEVENT: error -2
[  136.162838] video0: VIDIOC_DQEVENT: error -2
[  136.167347] video0: VIDIOC_DQEVENT: error -2
[  136.172462] video0: VIDIOC_DQEVENT: error -2
[  136.177559] video0: VIDIOC_DQEVENT: error -2
[  136.182076] video0: VIDIOC_DQEVENT: error -2
[  136.187193] video0: VIDIOC_DQEVENT: error -2
[  136.192294] video0: VIDIOC_DQEVENT: error -2
[  136.197390] video0: VIDIOC_DQEVENT: error -2
[  136.201906] video0: VIDIOC_DQEVENT: error -2
[  136.207023] video0: VIDIOC_DQEVENT: error -2
[  136.212126] video0: VIDIOC_DQEVENT: error -2
[  136.216617] video0: VIDIOC_DQEVENT: error -2
[  136.221733] video0: VIDIOC_DQEVENT: error -2
[  136.226834] video0: VIDIOC_DQEVENT: error -2
[  136.231277] video0: VIDIOC_DQEVENT: error -2
[  136.236391] video0: VIDIOC_DQEVENT: error -2
[  136.241497] video0: VIDIOC_DQEVENT: error -2
[  136.246600] video0: VIDIOC_DQEVENT: error -2
[  136.251294] video0: VIDIOC_DQEVENT: error -2
[  136.256416] video0: VIDIOC_DQEVENT: error -2
[  136.261521] video0: VIDIOC_DQEVENT: error -2
[  136.266191] video0: VIDIOC_DQEVENT: error -2
[  136.271312] video0: VIDIOC_DQEVENT: error -2
[  136.276417] video0: VIDIOC_DQEVENT: error -2
[  136.281513] video0: VIDIOC_DQEVENT: error -2
[  136.286184] video0: VIDIOC_DQEVENT: error -2
[  136.291305] video0: VIDIOC_DQEVENT: error -2
[  136.296412] video0: VIDIOC_DQEVENT: error -2
[  136.301125] video0: VIDIOC_DQEVENT: error -2
[  136.306247] video0: VIDIOC_DQEVENT: error -2
[  136.311352] video0: VIDIOC_DQEVENT: error -2
[  136.315990] video0: VIDIOC_DQEVENT: error -2
[  136.321104] video0: VIDIOC_DQEVENT: error -2
[  136.326206] video0: VIDIOC_DQEVENT: error -2
[  136.331306] video0: VIDIOC_DQEVENT: error -2
[  136.335938] video0: VIDIOC_DQEVENT: error -2
[  136.341051] video0: VIDIOC_DQEVENT: error -2
[  136.346153] video0: VIDIOC_DQEVENT: error -2
[  136.350848] video0: VIDIOC_DQEVENT: error -2
[  136.355972] video0: VIDIOC_DQEVENT: error -2
[  136.361086] video0: VIDIOC_DQEVENT: error -2
[  136.365937] video0: VIDIOC_DQEVENT: error -2
[  136.371060] video0: VIDIOC_DQEVENT: error -2
[  136.376262] video0: VIDIOC_DQEVENT: error -2
[  136.381364] video0: VIDIOC_DQEVENT: error -2
[  136.385933] video0: VIDIOC_DQEVENT: error -2
[  136.391070] video0: VIDIOC_DQEVENT: error -2
[  136.396190] video0: VIDIOC_DQEVENT: error -2
[  136.400641] video0: VIDIOC_DQEVENT: error -2
[  136.405780] video0: VIDIOC_DQEVENT: error -2
[  136.410888] video0: VIDIOC_DQEVENT: error -2
[  136.415396] video0: VIDIOC_DQEVENT: error -2
[  136.420511] video0: VIDIOC_DQEVENT: error -2
[  136.425614] video0: VIDIOC_DQEVENT: error -2
[  136.430708] video0: VIDIOC_DQEVENT: error -2
[  136.435194] video0: VIDIOC_DQEVENT: error -2
[  136.440308] video0: VIDIOC_DQEVENT: error -2
[  136.445412] video0: VIDIOC_DQEVENT: error -2
[  136.449880] video0: VIDIOC_DQEVENT: error -2
[  136.454994] video0: VIDIOC_DQEVENT: error -2
[  136.460098] video0: VIDIOC_DQEVENT: error -2
[  136.464563] video0: VIDIOC_DQEVENT: error -2
[  136.469678] video0: VIDIOC_DQEVENT: error -2
[  136.474781] video0: VIDIOC_DQEVENT: error -2
[  136.479878] video0: VIDIOC_DQEVENT: error -2
[  136.484331] video0: VIDIOC_DQEVENT: error -2
[  136.489445] video0: VIDIOC_DQEVENT: error -2
[  136.494548] video0: VIDIOC_DQEVENT: error -2
[  136.499034] video0: VIDIOC_DQEVENT: error -2
[  136.504175] video0: VIDIOC_DQEVENT: error -2
[  136.509278] video0: VIDIOC_DQEVENT: error -2
[  136.514372] video0: VIDIOC_DQEVENT: error -2
[  136.518854] video0: VIDIOC_DQEVENT: error -2
[  136.523973] video0: VIDIOC_DQEVENT: error -2
[  136.529075] video0: VIDIOC_DQEVENT: error -2
[  136.533522] video0: VIDIOC_DQEVENT: error -2
[  136.538635] video0: VIDIOC_DQEVENT: error -2
[  136.543739] video0: VIDIOC_DQEVENT: error -2
[  136.548181] video0: VIDIOC_DQEVENT: error -2
[  136.553292] video0: VIDIOC_DQEVENT: error -2
[  136.558395] video0: VIDIOC_DQEVENT: error -2
[  136.563491] video0: VIDIOC_DQEVENT: error -2
[  136.567944] video0: VIDIOC_DQEVENT: error -2
[  136.573054] video0: VIDIOC_DQEVENT: error -2
[  136.578157] video0: VIDIOC_DQEVENT: error -2
[  136.582682] video0: VIDIOC_DQEVENT: error -2
[  136.587802] video0: VIDIOC_DQEVENT: error -2
[  136.592904] video0: VIDIOC_DQEVENT: error -2
[  136.597998] video0: VIDIOC_DQEVENT: error -2
[  136.602502] video0: VIDIOC_DQEVENT: error -2
[  136.607617] video0: VIDIOC_DQEVENT: error -2
[  136.612720] video0: VIDIOC_DQEVENT: error -2
[  136.617153] video0: VIDIOC_DQEVENT: error -2
[  136.622269] video0: VIDIOC_DQEVENT: error -2
[  136.627373] video0: VIDIOC_DQEVENT: error -2
[  136.631809] video0: VIDIOC_DQEVENT: error -2
[  136.636916] video0: VIDIOC_DQEVENT: error -2
[  136.642015] video0: VIDIOC_DQEVENT: error -2
[  136.647110] video0: VIDIOC_DQEVENT: error -2
[  136.651561] video0: VIDIOC_DQEVENT: error -2
[  136.656667] video0: VIDIOC_DQEVENT: error -2
[  136.661767] video0: VIDIOC_DQEVENT: error -2
[  136.666242] video0: VIDIOC_DQEVENT: error -2
[  136.671362] video0: VIDIOC_DQEVENT: error -2
[  136.676474] video0: VIDIOC_DQEVENT: error -2
[  136.681570] video0: VIDIOC_DQEVENT: error -2
[  136.686135] video0: VIDIOC_DQEVENT: error -2
[  136.691250] video0: VIDIOC_DQEVENT: error -2
[  136.696351] video0: VIDIOC_DQEVENT: error -2
[  136.700822] video0: VIDIOC_DQEVENT: error -2
[  136.705939] video0: VIDIOC_DQEVENT: error -2
[  136.711041] video0: VIDIOC_DQEVENT: error -2
[  136.715458] video0: VIDIOC_DQEVENT: error -2
[  136.720574] video0: VIDIOC_DQEVENT: error -2
[  136.725678] video0: VIDIOC_DQEVENT: error -2
[  136.730772] video0: VIDIOC_DQEVENT: error -2
[  136.735242] video0: VIDIOC_DQEVENT: error -2
[  136.740356] video0: VIDIOC_DQEVENT: error -2
[  136.745459] video0: VIDIOC_DQEVENT: error -2
[  136.749938] video0: VIDIOC_DQEVENT: error -2
[  136.755052] video0: VIDIOC_DQEVENT: error -2
[  136.760172] video0: VIDIOC_DQEVENT: error -2
[  136.764626] video0: VIDIOC_DQEVENT: error -2
[  136.769741] video0: VIDIOC_DQEVENT: error -2
[  136.774845] video0: VIDIOC_DQEVENT: error -2
[  136.779941] video0: VIDIOC_DQEVENT: error -2
[  136.784833] video0: VIDIOC_DQEVENT: error -2
[  136.789951] video0: VIDIOC_DQEVENT: error -2
[  136.795054] video0: VIDIOC_DQEVENT: error -2
[  136.799483] video0: VIDIOC_DQEVENT: error -2
[  136.804606] video0: VIDIOC_DQEVENT: error -2
[  136.809721] video0: VIDIOC_DQEVENT: error -2
[  136.814821] video0: VIDIOC_DQEVENT: error -2
[  136.819377] video0: VIDIOC_DQEVENT: error -2
[  136.824497] video0: VIDIOC_DQEVENT: error -2
[  136.829604] video0: VIDIOC_DQEVENT: error -2
[  136.834275] video0: VIDIOC_DQEVENT: error -2
[  136.839397] video0: VIDIOC_DQEVENT: error -2
[  136.844512] video0: VIDIOC_DQEVENT: error -2
[  136.849181] video0: VIDIOC_DQEVENT: error -2
[  136.854302] video0: VIDIOC_DQEVENT: error -2
[  136.859411] video0: VIDIOC_DQEVENT: error -2
[  136.864511] video0: VIDIOC_DQEVENT: error -2
[  136.869148] video0: VIDIOC_DQEVENT: error -2
[  136.874270] video0: VIDIOC_DQEVENT: error -2
[  136.879377] video0: VIDIOC_DQEVENT: error -2
[  136.883996] video0: VIDIOC_DQEVENT: error -2
[  136.889110] video0: VIDIOC_DQEVENT: error -2
[  136.894212] video0: VIDIOC_DQEVENT: error -2
[  136.898893] video0: VIDIOC_DQEVENT: error -2
[  136.904015] video0: VIDIOC_DQEVENT: error -2
[  136.909122] video0: VIDIOC_DQEVENT: error -2
[  136.914223] video0: VIDIOC_DQEVENT: error -2
[  136.918903] video0: VIDIOC_DQEVENT: error -2
[  136.924025] video0: VIDIOC_DQEVENT: error -2
[  136.929131] video0: VIDIOC_DQEVENT: error -2
[  136.933754] video0: VIDIOC_DQEVENT: error -2
[  136.938875] video0: VIDIOC_DQEVENT: error -2
[  136.943980] video0: VIDIOC_DQEVENT: error -2
[  136.948621] video0: VIDIOC_DQEVENT: error -2
[  136.953741] video0: VIDIOC_DQEVENT: error -2
[  136.958849] video0: VIDIOC_DQEVENT: error -2
[  136.963948] video0: VIDIOC_DQEVENT: error -2
[  136.968577] video0: VIDIOC_DQEVENT: error -2
[  136.973696] video0: VIDIOC_DQEVENT: error -2
[  136.978801] video0: VIDIOC_DQEVENT: error -2
[  136.983436] video0: VIDIOC_DQEVENT: error -2
[  136.988556] video0: VIDIOC_DQEVENT: error -2
[  136.993659] video0: VIDIOC_DQEVENT: error -2
[  136.998331] video0: VIDIOC_DQEVENT: error -2
[  137.003452] video0: VIDIOC_DQEVENT: error -2
[  137.008555] video0: VIDIOC_DQEVENT: error -2
[  137.013651] video0: VIDIOC_DQEVENT: error -2
[  137.018315] video0: VIDIOC_DQEVENT: error -2
[  137.023436] video0: VIDIOC_DQEVENT: error -2
[  137.028544] video0: VIDIOC_DQEVENT: error -2
[  137.033165] video0: VIDIOC_DQEVENT: error -2
[  137.038286] video0: VIDIOC_DQEVENT: error -2
[  137.043393] video0: VIDIOC_DQEVENT: error -2
[  137.048010] video0: VIDIOC_DQEVENT: error -2
[  137.053124] video0: VIDIOC_DQEVENT: error -2
[  137.058225] video0: VIDIOC_DQEVENT: error -2
[  137.063324] video0: VIDIOC_DQEVENT: error -2
[  137.067934] video0: VIDIOC_DQEVENT: error -2
[  137.073047] video0: VIDIOC_DQEVENT: error -2
[  137.078150] video0: VIDIOC_DQEVENT: error -2
[  137.082827] video0: VIDIOC_DQEVENT: error -2
[  137.087946] video0: VIDIOC_DQEVENT: error -2
[  137.093049] video0: VIDIOC_DQEVENT: error -2
[  137.098150] video0: VIDIOC_DQEVENT: error -2
[  137.102844] video0: VIDIOC_DQEVENT: error -2
[  137.107964] video0: VIDIOC_DQEVENT: error -2
[  137.113070] video0: VIDIOC_DQEVENT: error -2
[  137.117701] video0: VIDIOC_DQEVENT: error -2
[  137.119727] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  137.122820] video0: VIDIOC_DQEVENT: error -2
[  137.127927] video0: VIDIOC_DQEVENT: error -2
[  137.132550] video0: VIDIOC_DQEVENT: error -2
[  137.137671] video0: VIDIOC_DQEVENT: error -2
[  137.142779] video0: VIDIOC_DQEVENT: error -2
[  137.147876] video0: VIDIOC_DQEVENT: error -2
[  137.152479] video0: VIDIOC_DQEVENT: error -2
[  137.157599] video0: VIDIOC_DQEVENT: error -2
[  137.162706] video0: VIDIOC_DQEVENT: error -2
[  137.167372] video0: VIDIOC_DQEVENT: error -2
[  137.172493] video0: VIDIOC_DQEVENT: error -2
[  137.177598] video0: VIDIOC_DQEVENT: error -2
[  137.182251] video0: VIDIOC_DQEVENT: error -2
[  137.187372] video0: VIDIOC_DQEVENT: error -2
[  137.192478] video0: VIDIOC_DQEVENT: error -2
[  137.197574] video0: VIDIOC_DQEVENT: error -2
[  137.202221] video0: VIDIOC_DQEVENT: error -2
[  137.207343] video0: VIDIOC_DQEVENT: error -2
[  137.212448] video0: VIDIOC_DQEVENT: error -2
[  137.217081] video0: VIDIOC_DQEVENT: error -2
[  137.222203] video0: VIDIOC_DQEVENT: error -2
[  137.227311] video0: VIDIOC_DQEVENT: error -2
[  137.231908] video0: VIDIOC_DQEVENT: error -2
[  137.237021] video0: VIDIOC_DQEVENT: error -2
[  137.242124] video0: VIDIOC_DQEVENT: error -2
[  137.247221] video0: VIDIOC_DQEVENT: error -2
[  137.251835] video0: VIDIOC_DQEVENT: error -2
[  137.256949] video0: VIDIOC_DQEVENT: error -2
[  137.262051] video0: VIDIOC_DQEVENT: error -2
[  137.266737] video0: VIDIOC_DQEVENT: error -2
[  137.271859] video0: VIDIOC_DQEVENT: error -2
[  137.276963] video0: VIDIOC_DQEVENT: error -2
[  137.281592] video0: VIDIOC_DQEVENT: error -2
[  137.286711] video0: VIDIOC_DQEVENT: error -2
[  137.291815] video0: VIDIOC_DQEVENT: error -2
[  137.296915] video0: VIDIOC_DQEVENT: error -2
[  137.301547] video0: VIDIOC_DQEVENT: error -2
[  137.306668] video0: VIDIOC_DQEVENT: error -2
[  137.311772] video0: VIDIOC_DQEVENT: error -2
[  137.316391] video0: VIDIOC_DQEVENT: error -2
[  137.321511] video0: VIDIOC_DQEVENT: error -2
[  137.326616] video0: VIDIOC_DQEVENT: error -2
[  137.331272] video0: VIDIOC_DQEVENT: error -2
[  137.336391] video0: VIDIOC_DQEVENT: error -2
[  137.341498] video0: VIDIOC_DQEVENT: error -2
[  137.346596] video0: VIDIOC_DQEVENT: error -2
[  137.351276] video0: VIDIOC_DQEVENT: error -2
[  137.356398] video0: VIDIOC_DQEVENT: error -2
[  137.361505] video0: VIDIOC_DQEVENT: error -2
[  137.366165] video0: VIDIOC_DQEVENT: error -2
[  137.371287] video0: VIDIOC_DQEVENT: error -2
[  137.376397] video0: VIDIOC_DQEVENT: error -2
[  137.381504] video0: VIDIOC_DQEVENT: error -2
[  137.386241] video0: VIDIOC_DQEVENT: error -2
[  137.391363] video0: VIDIOC_DQEVENT: error -2
[  137.396476] video0: VIDIOC_DQEVENT: error -2
[  137.401062] video0: VIDIOC_DQEVENT: error -2
[  137.406182] video0: VIDIOC_DQEVENT: error -2
[  137.411294] video0: VIDIOC_DQEVENT: error -2
[  137.415735] video0: VIDIOC_DQEVENT: error -2
[  137.420848] video0: VIDIOC_DQEVENT: error -2
[  137.425950] video0: VIDIOC_DQEVENT: error -2
[  137.431044] video0: VIDIOC_DQEVENT: error -2
[  137.435511] video0: VIDIOC_DQEVENT: error -2
[  137.440627] video0: VIDIOC_DQEVENT: error -2
[  137.445727] video0: VIDIOC_DQEVENT: error -2
[  137.450188] video0: VIDIOC_DQEVENT: error -2
[  137.455304] video0: VIDIOC_DQEVENT: error -2
[  137.460406] video0: VIDIOC_DQEVENT: error -2
[  137.464838] video0: VIDIOC_DQEVENT: error -2
[  137.469952] video0: VIDIOC_DQEVENT: error -2
[  137.475054] video0: VIDIOC_DQEVENT: error -2
[  137.480165] video0: VIDIOC_DQEVENT: error -2
[  137.484610] video0: VIDIOC_DQEVENT: error -2
[  137.489725] video0: VIDIOC_DQEVENT: error -2
[  137.494827] video0: VIDIOC_DQEVENT: error -2
[  137.499251] video0: VIDIOC_DQEVENT: error -2
[  137.504366] video0: VIDIOC_DQEVENT: error -2
[  137.509472] video0: VIDIOC_DQEVENT: error -2
[  137.514568] video0: VIDIOC_DQEVENT: error -2
[  137.519052] video0: VIDIOC_DQEVENT: error -2
[  137.524202] video0: VIDIOC_DQEVENT: error -2
[  137.529304] video0: VIDIOC_DQEVENT: error -2
[  137.533768] video0: VIDIOC_DQEVENT: error -2
[  137.538883] video0: VIDIOC_DQEVENT: error -2
[  137.543984] video0: VIDIOC_DQEVENT: error -2
[  137.548428] video0: VIDIOC_DQEVENT: error -2
[  137.553545] video0: VIDIOC_DQEVENT: error -2
[  137.558646] video0: VIDIOC_DQEVENT: error -2
[  137.563742] video0: VIDIOC_DQEVENT: error -2
[  137.568194] video0: VIDIOC_DQEVENT: error -2
[  137.573306] video0: VIDIOC_DQEVENT: error -2
[  137.578410] video0: VIDIOC_DQEVENT: error -2
[  137.582908] video0: VIDIOC_DQEVENT: error -2
[  137.588026] video0: VIDIOC_DQEVENT: error -2
[  137.593130] video0: VIDIOC_DQEVENT: error -2
[  137.598223] video0: VIDIOC_DQEVENT: error -2
[  137.602734] video0: VIDIOC_DQEVENT: error -2
[  137.607854] video0: VIDIOC_DQEVENT: error -2
[  137.612959] video0: VIDIOC_DQEVENT: error -2
[  137.617423] video0: VIDIOC_DQEVENT: error -2
[  137.622538] video0: VIDIOC_DQEVENT: error -2
[  137.627642] video0: VIDIOC_DQEVENT: error -2
[  137.632093] video0: VIDIOC_DQEVENT: error -2
[  137.637203] video0: VIDIOC_DQEVENT: error -2
[  137.642305] video0: VIDIOC_DQEVENT: error -2
[  137.647400] video0: VIDIOC_DQEVENT: error -2
[  137.651836] video0: VIDIOC_DQEVENT: error -2
[  137.656945] video0: VIDIOC_DQEVENT: error -2
[  137.662047] video0: VIDIOC_DQEVENT: error -2
[  137.666566] video0: VIDIOC_DQEVENT: error -2
[  137.671684] video0: VIDIOC_DQEVENT: error -2
[  137.676788] video0: VIDIOC_DQEVENT: error -2
[  137.681235] video0: VIDIOC_DQEVENT: error -2
[  137.686351] video0: VIDIOC_DQEVENT: error -2
[  137.691454] video0: VIDIOC_DQEVENT: error -2
[  137.696548] video0: VIDIOC_DQEVENT: error -2
[  137.701018] video0: VIDIOC_DQEVENT: error -2
[  137.706133] video0: VIDIOC_DQEVENT: error -2
[  137.711235] video0: VIDIOC_DQEVENT: error -2
[  137.715645] video0: VIDIOC_DQEVENT: error -2
[  137.720754] video0: VIDIOC_DQEVENT: error -2
[  137.725852] video0: VIDIOC_DQEVENT: error -2
[  137.730945] video0: VIDIOC_DQEVENT: error -2
[  137.735421] video0: VIDIOC_DQEVENT: error -2
[  137.740536] video0: VIDIOC_DQEVENT: error -2
[  137.745637] video0: VIDIOC_DQEVENT: error -2
[  137.750101] video0: VIDIOC_DQEVENT: error -2
[  137.755217] video0: VIDIOC_DQEVENT: error -2
[  137.760319] video0: VIDIOC_DQEVENT: error -2
[  137.764772] video0: VIDIOC_DQEVENT: error -2
[  137.769887] video0: VIDIOC_DQEVENT: error -2
[  137.774990] video0: VIDIOC_DQEVENT: error -2
[  137.780086] video0: VIDIOC_DQEVENT: error -2
[  137.785147] video0: VIDIOC_DQEVENT: error -2
[  137.790265] video0: VIDIOC_DQEVENT: error -2
[  137.795369] video0: VIDIOC_DQEVENT: error -2
[  137.799805] video0: VIDIOC_DQEVENT: error -2
[  137.804913] video0: VIDIOC_DQEVENT: error -2
[  137.810014] video0: VIDIOC_DQEVENT: error -2
[  137.814526] video0: VIDIOC_DQEVENT: error -2
[  137.819641] video0: VIDIOC_DQEVENT: error -2
[  137.824744] video0: VIDIOC_DQEVENT: error -2
[  137.829840] video0: VIDIOC_DQEVENT: error -2
[  137.834360] video0: VIDIOC_DQEVENT: error -2
[  137.839477] video0: VIDIOC_DQEVENT: error -2
[  137.844578] video0: VIDIOC_DQEVENT: error -2
[  137.849020] video0: VIDIOC_DQEVENT: error -2
[  137.854135] video0: VIDIOC_DQEVENT: error -2
[  137.859238] video0: VIDIOC_DQEVENT: error -2
[  137.864334] video0: VIDIOC_DQEVENT: error -2
[  137.868823] video0: VIDIOC_DQEVENT: error -2
[  137.873939] video0: VIDIOC_DQEVENT: error -2
[  137.879042] video0: VIDIOC_DQEVENT: error -2
[  137.883762] video0: VIDIOC_DQEVENT: error -2
[  137.888876] video0: VIDIOC_DQEVENT: error -2
[  137.893979] video0: VIDIOC_DQEVENT: error -2
[  137.898454] video0: VIDIOC_DQEVENT: error -2
[  137.903571] video0: VIDIOC_DQEVENT: error -2
[  137.908674] video0: VIDIOC_DQEVENT: error -2
[  137.913768] video0: VIDIOC_DQEVENT: error -2
[  137.918268] video0: VIDIOC_DQEVENT: error -2
[  137.923385] video0: VIDIOC_DQEVENT: error -2
[  137.928488] video0: VIDIOC_DQEVENT: error -2
[  137.932938] video0: VIDIOC_DQEVENT: error -2
[  137.938052] video0: VIDIOC_DQEVENT: error -2
[  137.943155] video0: VIDIOC_DQEVENT: error -2
[  137.948253] video0: VIDIOC_DQEVENT: error -2
[  137.952730] video0: VIDIOC_DQEVENT: error -2
[  137.957845] video0: VIDIOC_DQEVENT: error -2
[  137.962949] video0: VIDIOC_DQEVENT: error -2
[  137.967393] video0: VIDIOC_DQEVENT: error -2
[  137.972507] video0: VIDIOC_DQEVENT: error -2
[  137.977611] video0: VIDIOC_DQEVENT: error -2
[  137.982095] video0: VIDIOC_DQEVENT: error -2
[  137.987211] video0: VIDIOC_DQEVENT: error -2
[  137.992315] video0: VIDIOC_DQEVENT: error -2
[  137.997412] video0: VIDIOC_DQEVENT: error -2
[  138.001894] video0: VIDIOC_DQEVENT: error -2
[  138.007007] video0: VIDIOC_DQEVENT: error -2
[  138.012113] video0: VIDIOC_DQEVENT: error -2
[  138.016582] video0: VIDIOC_DQEVENT: error -2
[  138.021696] video0: VIDIOC_DQEVENT: error -2
[  138.026800] video0: VIDIOC_DQEVENT: error -2
[  138.031287] video0: VIDIOC_DQEVENT: error -2
[  138.036399] video0: VIDIOC_DQEVENT: error -2
[  138.041502] video0: VIDIOC_DQEVENT: error -2
[  138.046597] video0: VIDIOC_DQEVENT: error -2
[  138.051078] video0: VIDIOC_DQEVENT: error -2
[  138.056214] video0: VIDIOC_DQEVENT: error -2
[  138.061314] video0: VIDIOC_DQEVENT: error -2
[  138.065785] video0: VIDIOC_DQEVENT: error -2
[  138.070899] video0: VIDIOC_DQEVENT: error -2
[  138.076004] video0: VIDIOC_DQEVENT: error -2
[  138.081100] video0: VIDIOC_DQEVENT: error -2
[  138.085536] video0: VIDIOC_DQEVENT: error -2
[  138.090652] video0: VIDIOC_DQEVENT: error -2
[  138.095755] video0: VIDIOC_DQEVENT: error -2
[  138.100190] video0: VIDIOC_DQEVENT: error -2
[  138.105305] video0: VIDIOC_DQEVENT: error -2
[  138.110407] video0: VIDIOC_DQEVENT: error -2
[  138.114889] video0: VIDIOC_DQEVENT: error -2
[  138.120007] video0: VIDIOC_DQEVENT: error -2
[  138.125113] video0: VIDIOC_DQEVENT: error -2
[  138.130211] video0: VIDIOC_DQEVENT: error -2
[  138.134709] video0: VIDIOC_DQEVENT: error -2
[  138.139823] video0: VIDIOC_DQEVENT: error -2
[  138.143708] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  138.144926] video0: VIDIOC_DQEVENT: error -2
[  138.149428] video0: VIDIOC_DQEVENT: error -2
[  138.154544] video0: VIDIOC_DQEVENT: error -2
[  138.159648] video0: VIDIOC_DQEVENT: error -2
[  138.164747] video0: VIDIOC_DQEVENT: error -2
[  138.169197] video0: VIDIOC_DQEVENT: error -2
[  138.174312] video0: VIDIOC_DQEVENT: error -2
[  138.179417] video0: VIDIOC_DQEVENT: error -2
[  138.183855] video0: VIDIOC_DQEVENT: error -2
[  138.188965] video0: VIDIOC_DQEVENT: error -2
[  138.194065] video0: VIDIOC_DQEVENT: error -2
[  138.198552] video0: VIDIOC_DQEVENT: error -2
[  138.203668] video0: VIDIOC_DQEVENT: error -2
[  138.208768] video0: VIDIOC_DQEVENT: error -2
[  138.213863] video0: VIDIOC_DQEVENT: error -2
[  138.218365] video0: VIDIOC_DQEVENT: error -2
[  138.223481] video0: VIDIOC_DQEVENT: error -2
[  138.228583] video0: VIDIOC_DQEVENT: error -2
[  138.233031] video0: VIDIOC_DQEVENT: error -2
[  138.238147] video0: VIDIOC_DQEVENT: error -2
[  138.243251] video0: VIDIOC_DQEVENT: error -2
[  138.247684] video0: VIDIOC_DQEVENT: error -2
[  138.252794] video0: VIDIOC_DQEVENT: error -2
[  138.257895] video0: VIDIOC_DQEVENT: error -2
[  138.262988] video0: VIDIOC_DQEVENT: error -2
[  138.267498] video0: VIDIOC_DQEVENT: error -2
[  138.272630] video0: VIDIOC_DQEVENT: error -2
[  138.277731] video0: VIDIOC_DQEVENT: error -2
[  138.282226] video0: VIDIOC_DQEVENT: error -2
[  138.287342] video0: VIDIOC_DQEVENT: error -2
[  138.292447] video0: VIDIOC_DQEVENT: error -2
[  138.297541] video0: VIDIOC_DQEVENT: error -2
[  138.302026] video0: VIDIOC_DQEVENT: error -2
[  138.307159] video0: VIDIOC_DQEVENT: error -2
[  138.312263] video0: VIDIOC_DQEVENT: error -2
[  138.316723] video0: VIDIOC_DQEVENT: error -2
[  138.321841] video0: VIDIOC_DQEVENT: error -2
[  138.326943] video0: VIDIOC_DQEVENT: error -2
[  138.331450] video0: VIDIOC_DQEVENT: error -2
[  138.336581] video0: VIDIOC_DQEVENT: error -2
[  138.341684] video0: VIDIOC_DQEVENT: error -2
[  138.346780] video0: VIDIOC_DQEVENT: error -2
[  138.351272] video0: VIDIOC_DQEVENT: error -2
[  138.356384] video0: VIDIOC_DQEVENT: error -2
[  138.361486] video0: VIDIOC_DQEVENT: error -2
[  138.365967] video0: VIDIOC_DQEVENT: error -2
[  138.371082] video0: VIDIOC_DQEVENT: error -2
[  138.376194] video0: VIDIOC_DQEVENT: error -2
[  138.381293] video0: VIDIOC_DQEVENT: error -2
[  138.385763] video0: VIDIOC_DQEVENT: error -2
[  138.390880] video0: VIDIOC_DQEVENT: error -2
[  138.395983] video0: VIDIOC_DQEVENT: error -2
[  138.400509] video0: VIDIOC_DQEVENT: error -2
[  138.405626] video0: VIDIOC_DQEVENT: error -2
[  138.410729] video0: VIDIOC_DQEVENT: error -2
[  138.415189] video0: VIDIOC_DQEVENT: error -2
[  138.420320] video0: VIDIOC_DQEVENT: error -2
[  138.425423] video0: VIDIOC_DQEVENT: error -2
[  138.430519] video0: VIDIOC_DQEVENT: error -2
[  138.434990] video0: VIDIOC_DQEVENT: error -2
[  138.440129] video0: VIDIOC_DQEVENT: error -2
[  138.445249] video0: VIDIOC_DQEVENT: error -2
[  138.449929] video0: VIDIOC_DQEVENT: error -2
[  138.455068] video0: VIDIOC_DQEVENT: error -2
[  138.460310] video0: VIDIOC_DQEVENT: error -2
[  138.464969] video0: VIDIOC_DQEVENT: error -2
[  138.470180] video0: VIDIOC_DQEVENT: error -2
[  138.475289] video0: VIDIOC_DQEVENT: error -2
[  138.480388] video0: VIDIOC_DQEVENT: error -2
[  138.485130] video0: VIDIOC_DQEVENT: error -2
[  138.490336] video0: VIDIOC_DQEVENT: error -2
[  138.495445] video0: VIDIOC_DQEVENT: error -2
[  138.500165] video0: VIDIOC_DQEVENT: error -2
[  138.505365] video0: VIDIOC_DQEVENT: error -2
[  138.510471] video0: VIDIOC_DQEVENT: error -2
[  138.515274] video0: VIDIOC_DQEVENT: error -2
[  138.520479] video0: VIDIOC_DQEVENT: error -2
[  138.525583] video0: VIDIOC_DQEVENT: error -2
[  138.530684] video0: VIDIOC_DQEVENT: error -2
[  138.535460] video0: VIDIOC_DQEVENT: error -2
[  138.540671] video0: VIDIOC_DQEVENT: error -2
[  138.545779] video0: VIDIOC_DQEVENT: error -2
[  138.550560] video0: VIDIOC_DQEVENT: error -2
[  138.555769] video0: VIDIOC_DQEVENT: error -2
[  138.560874] video0: VIDIOC_DQEVENT: error -2
[  138.565672] video0: VIDIOC_DQEVENT: error -2
[  138.570878] video0: VIDIOC_DQEVENT: error -2
[  138.575983] video0: VIDIOC_DQEVENT: error -2
[  138.581081] video0: VIDIOC_DQEVENT: error -2
[  138.585831] video0: VIDIOC_DQEVENT: error -2
[  138.591036] video0: VIDIOC_DQEVENT: error -2
[  138.596145] video0: VIDIOC_DQEVENT: error -2
[  138.600892] video0: VIDIOC_DQEVENT: error -2
[  138.606099] video0: VIDIOC_DQEVENT: error -2
[  138.611209] video0: VIDIOC_DQEVENT: error -2
[  138.615987] video0: VIDIOC_DQEVENT: error -2
[  138.621189] video0: VIDIOC_DQEVENT: error -2
[  138.626294] video0: VIDIOC_DQEVENT: error -2
[  138.631394] video0: VIDIOC_DQEVENT: error -2
[  138.635791] video0: VIDIOC_DQEVENT: error -2
[  138.640900] video0: VIDIOC_DQEVENT: error -2
[  138.646001] video0: VIDIOC_DQEVENT: error -2
[  138.650438] video0: VIDIOC_DQEVENT: error -2
[  138.655555] video0: VIDIOC_DQEVENT: error -2
[  138.660655] video0: VIDIOC_DQEVENT: error -2
[  138.665029] video0: VIDIOC_DQEVENT: error -2
[  138.670145] video0: VIDIOC_DQEVENT: error -2
[  138.675248] video0: VIDIOC_DQEVENT: error -2
[  138.680339] video0: VIDIOC_DQEVENT: error -2
[  138.684711] video0: VIDIOC_DQEVENT: error -2
[  138.689828] video0: VIDIOC_DQEVENT: error -2
[  138.694929] video0: VIDIOC_DQEVENT: error -2
[  138.699429] video0: VIDIOC_DQEVENT: error -2
[  138.704560] video0: VIDIOC_DQEVENT: error -2
[  138.709660] video0: VIDIOC_DQEVENT: error -2
[  138.714753] video0: VIDIOC_DQEVENT: error -2
[  138.719268] video0: VIDIOC_DQEVENT: error -2
[  138.724405] video0: VIDIOC_DQEVENT: error -2
[  138.729507] video0: VIDIOC_DQEVENT: error -2
[  138.733910] video0: VIDIOC_DQEVENT: error -2
[  138.739026] video0: VIDIOC_DQEVENT: error -2
[  138.744127] video0: VIDIOC_DQEVENT: error -2
[  138.748515] video0: VIDIOC_DQEVENT: error -2
[  138.753632] video0: VIDIOC_DQEVENT: error -2
[  138.758733] video0: VIDIOC_DQEVENT: error -2
[  138.763826] video0: VIDIOC_DQEVENT: error -2
[  138.768191] video0: VIDIOC_DQEVENT: error -2
[  138.773306] video0: VIDIOC_DQEVENT: error -2
[  138.778408] video0: VIDIOC_DQEVENT: error -2
[  138.782832] video0: VIDIOC_DQEVENT: error -2
[  138.787949] video0: VIDIOC_DQEVENT: error -2
[  138.793054] video0: VIDIOC_DQEVENT: error -2
[  138.798147] video0: VIDIOC_DQEVENT: error -2
[  138.802557] video0: VIDIOC_DQEVENT: error -2
[  138.807672] video0: VIDIOC_DQEVENT: error -2
[  138.812775] video0: VIDIOC_DQEVENT: error -2
[  138.817134] video0: VIDIOC_DQEVENT: error -2
[  138.822297] video0: VIDIOC_DQEVENT: error -2
[  138.827402] video0: VIDIOC_DQEVENT: error -2
[  138.831875] video0: VIDIOC_DQEVENT: error -2
[  138.837005] video0: VIDIOC_DQEVENT: error -2
[  138.842105] video0: VIDIOC_DQEVENT: error -2
[  138.847197] video0: VIDIOC_DQEVENT: error -2
[  138.851713] video0: VIDIOC_DQEVENT: error -2
[  138.856835] video0: VIDIOC_DQEVENT: error -2
[  138.861930] video0: VIDIOC_DQEVENT: error -2
[  138.866470] video0: VIDIOC_DQEVENT: error -2
[  138.871608] video0: VIDIOC_DQEVENT: error -2
[  138.876708] video0: VIDIOC_DQEVENT: error -2
[  138.881195] video0: VIDIOC_DQEVENT: error -2
[  138.886332] video0: VIDIOC_DQEVENT: error -2
[  138.891433] video0: VIDIOC_DQEVENT: error -2
[  138.896526] video0: VIDIOC_DQEVENT: error -2
[  138.901033] video0: VIDIOC_DQEVENT: error -2
[  138.906163] video0: VIDIOC_DQEVENT: error -2
[  138.911265] video0: VIDIOC_DQEVENT: error -2
[  138.915759] video0: VIDIOC_DQEVENT: error -2
[  138.920887] video0: VIDIOC_DQEVENT: error -2
[  138.925985] video0: VIDIOC_DQEVENT: error -2
[  138.931079] video0: VIDIOC_DQEVENT: error -2
[  138.935578] video0: VIDIOC_DQEVENT: error -2
[  138.940709] video0: VIDIOC_DQEVENT: error -2
[  138.945806] video0: VIDIOC_DQEVENT: error -2
[  138.950353] video0: VIDIOC_DQEVENT: error -2
[  138.955484] video0: VIDIOC_DQEVENT: error -2
[  138.960586] video0: VIDIOC_DQEVENT: error -2
[  138.965081] video0: VIDIOC_DQEVENT: error -2
[  138.970216] video0: VIDIOC_DQEVENT: error -2
[  138.975315] video0: VIDIOC_DQEVENT: error -2
[  138.980407] video0: VIDIOC_DQEVENT: error -2
[  138.984897] video0: VIDIOC_DQEVENT: error -2
[  138.990034] video0: VIDIOC_DQEVENT: error -2
[  138.995147] video0: VIDIOC_DQEVENT: error -2
[  138.999614] video0: VIDIOC_DQEVENT: error -2
[  139.004745] video0: VIDIOC_DQEVENT: error -2
[  139.009844] video0: VIDIOC_DQEVENT: error -2
[  139.014937] video0: VIDIOC_DQEVENT: error -2
[  139.019441] video0: VIDIOC_DQEVENT: error -2
[  139.024555] video0: VIDIOC_DQEVENT: error -2
[  139.029654] video0: VIDIOC_DQEVENT: error -2
[  139.034053] video0: VIDIOC_DQEVENT: error -2
[  139.039169] video0: VIDIOC_DQEVENT: error -2
[  139.044272] video0: VIDIOC_DQEVENT: error -2
[  139.048642] video0: VIDIOC_DQEVENT: error -2
[  139.053756] video0: VIDIOC_DQEVENT: error -2
[  139.058859] video0: VIDIOC_DQEVENT: error -2
[  139.063955] video0: VIDIOC_DQEVENT: error -2
[  139.068316] video0: VIDIOC_DQEVENT: error -2
[  139.073473] video0: VIDIOC_DQEVENT: error -2
[  139.078575] video0: VIDIOC_DQEVENT: error -2
[  139.083110] video0: VIDIOC_DQEVENT: error -2
[  139.088248] video0: VIDIOC_DQEVENT: error -2
[  139.093345] video0: VIDIOC_DQEVENT: error -2
[  139.097858] video0: VIDIOC_DQEVENT: error -2
[  139.102996] video0: VIDIOC_DQEVENT: error -2
[  139.108096] video0: VIDIOC_DQEVENT: error -2
[  139.113189] video0: VIDIOC_DQEVENT: error -2
[  139.117690] video0: VIDIOC_DQEVENT: error -2
[  139.122821] video0: VIDIOC_DQEVENT: error -2
[  139.127920] video0: VIDIOC_DQEVENT: error -2
[  139.132401] video0: VIDIOC_DQEVENT: error -2
[  139.137536] video0: VIDIOC_DQEVENT: error -2
[  139.142648] video0: VIDIOC_DQEVENT: error -2
[  139.147742] video0: VIDIOC_DQEVENT: error -2
[  139.152221] video0: VIDIOC_DQEVENT: error -2
[  139.157353] video0: VIDIOC_DQEVENT: error -2
[  139.162452] video0: VIDIOC_DQEVENT: error -2
[  139.167004] video0: VIDIOC_DQEVENT: error -2
[  139.167723] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  139.172143] video0: VIDIOC_DQEVENT: error -2
[  139.177242] video0: VIDIOC_DQEVENT: error -2
[  139.181756] video0: VIDIOC_DQEVENT: error -2
[  139.186892] video0: VIDIOC_DQEVENT: error -2
[  139.191996] video0: VIDIOC_DQEVENT: error -2
[  139.197090] video0: VIDIOC_DQEVENT: error -2
[  139.201571] video0: VIDIOC_DQEVENT: error -2
[  139.206708] video0: VIDIOC_DQEVENT: error -2
[  139.211808] video0: VIDIOC_DQEVENT: error -2
[  139.216276] video0: VIDIOC_DQEVENT: error -2
[  139.221411] video0: VIDIOC_DQEVENT: error -2
[  139.226517] video0: VIDIOC_DQEVENT: error -2
[  139.231610] video0: VIDIOC_DQEVENT: error -2
[  139.236114] video0: VIDIOC_DQEVENT: error -2
[  139.241236] video0: VIDIOC_DQEVENT: error -2
[  139.246333] video0: VIDIOC_DQEVENT: error -2
[  139.250902] video0: VIDIOC_DQEVENT: error -2
[  139.256030] video0: VIDIOC_DQEVENT: error -2
[  139.261130] video0: VIDIOC_DQEVENT: error -2
[  139.265637] video0: VIDIOC_DQEVENT: error -2
[  139.270764] video0: VIDIOC_DQEVENT: error -2
[  139.275861] video0: VIDIOC_DQEVENT: error -2
[  139.280955] video0: VIDIOC_DQEVENT: error -2
[  139.285465] video0: VIDIOC_DQEVENT: error -2
[  139.290600] video0: VIDIOC_DQEVENT: error -2
[  139.295701] video0: VIDIOC_DQEVENT: error -2
[  139.300181] video0: VIDIOC_DQEVENT: error -2
[  139.305314] video0: VIDIOC_DQEVENT: error -2
[  139.310425] video0: VIDIOC_DQEVENT: error -2
[  139.314968] video0: VIDIOC_DQEVENT: error -2
[  139.320099] video0: VIDIOC_DQEVENT: error -2
[  139.325198] video0: VIDIOC_DQEVENT: error -2
[  139.330291] video0: VIDIOC_DQEVENT: error -2
[  139.334835] video0: VIDIOC_DQEVENT: error -2
[  139.339951] video0: VIDIOC_DQEVENT: error -2
[  139.345049] video0: VIDIOC_DQEVENT: error -2
[  139.349425] video0: VIDIOC_DQEVENT: error -2
[  139.354539] video0: VIDIOC_DQEVENT: error -2
[  139.359643] video0: VIDIOC_DQEVENT: error -2
[  139.364735] video0: VIDIOC_DQEVENT: error -2
[  139.369108] video0: VIDIOC_DQEVENT: error -2
[  139.374225] video0: VIDIOC_DQEVENT: error -2
[  139.379329] video0: VIDIOC_DQEVENT: error -2
[  139.383694] video0: VIDIOC_DQEVENT: error -2
[  139.388840] video0: VIDIOC_DQEVENT: error -2
[  139.393938] video0: VIDIOC_DQEVENT: error -2
[  139.398481] video0: VIDIOC_DQEVENT: error -2
[  139.403615] video0: VIDIOC_DQEVENT: error -2
[  139.408715] video0: VIDIOC_DQEVENT: error -2
[  139.413812] video0: VIDIOC_DQEVENT: error -2
[  139.418365] video0: VIDIOC_DQEVENT: error -2
[  139.423502] video0: VIDIOC_DQEVENT: error -2
[  139.428605] video0: VIDIOC_DQEVENT: error -2
[  139.433113] video0: VIDIOC_DQEVENT: error -2
[  139.438249] video0: VIDIOC_DQEVENT: error -2
[  139.443347] video0: VIDIOC_DQEVENT: error -2
[  139.447828] video0: VIDIOC_DQEVENT: error -2
[  139.452951] video0: VIDIOC_DQEVENT: error -2
[  139.458049] video0: VIDIOC_DQEVENT: error -2
[  139.463140] video0: VIDIOC_DQEVENT: error -2
[  139.467604] video0: VIDIOC_DQEVENT: error -2
[  139.472733] video0: VIDIOC_DQEVENT: error -2
[  139.477830] video0: VIDIOC_DQEVENT: error -2
[  139.482384] video0: VIDIOC_DQEVENT: error -2
[  139.487513] video0: VIDIOC_DQEVENT: error -2
[  139.492612] video0: VIDIOC_DQEVENT: error -2
[  139.497703] video0: VIDIOC_DQEVENT: error -2
[  139.502232] video0: VIDIOC_DQEVENT: error -2
[  139.507361] video0: VIDIOC_DQEVENT: error -2
[  139.512461] video0: VIDIOC_DQEVENT: error -2
[  139.516965] video0: VIDIOC_DQEVENT: error -2
[  139.522081] video0: VIDIOC_DQEVENT: error -2
[  139.527185] video0: VIDIOC_DQEVENT: error -2
[  139.531556] video0: VIDIOC_DQEVENT: error -2
[  139.536664] video0: VIDIOC_DQEVENT: error -2
[  139.541764] video0: VIDIOC_DQEVENT: error -2
[  139.546856] video0: VIDIOC_DQEVENT: error -2
[  139.551276] video0: VIDIOC_DQEVENT: error -2
[  139.556423] video0: VIDIOC_DQEVENT: error -2
[  139.561525] video0: VIDIOC_DQEVENT: error -2
[  139.566069] video0: VIDIOC_DQEVENT: error -2
[  139.571199] video0: VIDIOC_DQEVENT: error -2
[  139.576297] video0: VIDIOC_DQEVENT: error -2
[  139.581390] video0: VIDIOC_DQEVENT: error -2
[  139.585914] video0: VIDIOC_DQEVENT: error -2
[  139.591048] video0: VIDIOC_DQEVENT: error -2
[  139.596175] video0: VIDIOC_DQEVENT: error -2
[  139.600563] video0: VIDIOC_DQEVENT: error -2
[  139.605679] video0: VIDIOC_DQEVENT: error -2
[  139.610782] video0: VIDIOC_DQEVENT: error -2
[  139.615194] video0: VIDIOC_DQEVENT: error -2
[  139.620310] video0: VIDIOC_DQEVENT: error -2
[  139.625411] video0: VIDIOC_DQEVENT: error -2
[  139.630516] video0: VIDIOC_DQEVENT: error -2
[  139.635082] video0: VIDIOC_DQEVENT: error -2
[  139.640227] video0: VIDIOC_DQEVENT: error -2
[  139.645332] video0: VIDIOC_DQEVENT: error -2
[  139.649728] video0: VIDIOC_DQEVENT: error -2
[  139.654846] video0: VIDIOC_DQEVENT: error -2
[  139.659955] video0: VIDIOC_DQEVENT: error -2
[  139.664422] video0: VIDIOC_DQEVENT: error -2
[  139.669584] video0: VIDIOC_DQEVENT: error -2
[  139.674686] video0: VIDIOC_DQEVENT: error -2
[  139.679779] video0: VIDIOC_DQEVENT: error -2
[  139.684263] video0: VIDIOC_DQEVENT: error -2
[  139.689389] video0: VIDIOC_DQEVENT: error -2
[  139.694489] video0: VIDIOC_DQEVENT: error -2
[  139.699021] video0: VIDIOC_DQEVENT: error -2
[  139.704181] video0: VIDIOC_DQEVENT: error -2
[  139.709281] video0: VIDIOC_DQEVENT: error -2
[  139.714377] video0: VIDIOC_DQEVENT: error -2
[  139.718797] video0: VIDIOC_DQEVENT: error -2
[  139.723958] video0: VIDIOC_DQEVENT: error -2
[  139.729058] video0: VIDIOC_DQEVENT: error -2
[  139.733544] video0: VIDIOC_DQEVENT: error -2
[  139.738672] video0: VIDIOC_DQEVENT: error -2
[  139.743772] video0: VIDIOC_DQEVENT: error -2
[  139.748264] video0: VIDIOC_DQEVENT: error -2
[  139.753390] video0: VIDIOC_DQEVENT: error -2
[  139.758488] video0: VIDIOC_DQEVENT: error -2
[  139.763581] video0: VIDIOC_DQEVENT: error -2
[  139.768064] video0: VIDIOC_DQEVENT: error -2
[  139.773189] video0: VIDIOC_DQEVENT: error -2
[  139.778299] video0: VIDIOC_DQEVENT: error -2
[  139.782836] video0: VIDIOC_DQEVENT: error -2
[  139.787972] video0: VIDIOC_DQEVENT: error -2
[  139.793072] video0: VIDIOC_DQEVENT: error -2
[  139.798164] video0: VIDIOC_DQEVENT: error -2
[  139.802718] video0: VIDIOC_DQEVENT: error -2
[  139.807855] video0: VIDIOC_DQEVENT: error -2
[  139.812953] video0: VIDIOC_DQEVENT: error -2
[  139.817444] video0: VIDIOC_DQEVENT: error -2
[  139.822579] video0: VIDIOC_DQEVENT: error -2
[  139.827689] video0: VIDIOC_DQEVENT: error -2
[  139.832171] video0: VIDIOC_DQEVENT: error -2
[  139.837303] video0: VIDIOC_DQEVENT: error -2
[  139.842402] video0: VIDIOC_DQEVENT: error -2
[  139.847499] video0: VIDIOC_DQEVENT: error -2
[  139.851989] video0: VIDIOC_DQEVENT: error -2
[  139.857120] video0: VIDIOC_DQEVENT: error -2
[  139.862219] video0: VIDIOC_DQEVENT: error -2
[  139.866776] video0: VIDIOC_DQEVENT: error -2
[  139.871906] video0: VIDIOC_DQEVENT: error -2
[  139.877019] video0: VIDIOC_DQEVENT: error -2
[  139.881513] video0: VIDIOC_DQEVENT: error -2
[  139.886649] video0: VIDIOC_DQEVENT: error -2
[  139.891749] video0: VIDIOC_DQEVENT: error -2
[  139.896841] video0: VIDIOC_DQEVENT: error -2
[  139.901345] video0: VIDIOC_DQEVENT: error -2
[  139.906472] video0: VIDIOC_DQEVENT: error -2
[  139.911574] video0: VIDIOC_DQEVENT: error -2
[  139.916070] video0: VIDIOC_DQEVENT: error -2
[  139.921194] video0: VIDIOC_DQEVENT: error -2
[  139.926296] video0: VIDIOC_DQEVENT: error -2
[  139.931390] video0: VIDIOC_DQEVENT: error -2
[  139.935884] video0: VIDIOC_DQEVENT: error -2
[  139.941004] video0: VIDIOC_DQEVENT: error -2
[  139.946100] video0: VIDIOC_DQEVENT: error -2
[  139.950650] video0: VIDIOC_DQEVENT: error -2
[  139.955786] video0: VIDIOC_DQEVENT: error -2
[  139.960884] video0: VIDIOC_DQEVENT: error -2
[  139.965374] video0: VIDIOC_DQEVENT: error -2
[  139.970488] video0: VIDIOC_DQEVENT: error -2
[  139.975584] video0: VIDIOC_DQEVENT: error -2
[  139.980676] video0: VIDIOC_DQEVENT: error -2
[  139.985043] video0: VIDIOC_DQEVENT: error -2
[  139.990158] video0: VIDIOC_DQEVENT: error -2
[  139.995261] video0: VIDIOC_DQEVENT: error -2
[  139.999669] video0: VIDIOC_DQEVENT: error -2
[  140.004776] video0: VIDIOC_DQEVENT: error -2
[  140.009875] video0: VIDIOC_DQEVENT: error -2
[  140.014968] video0: VIDIOC_DQEVENT: error -2
[  140.019386] video0: VIDIOC_DQEVENT: error -2
[  140.024500] video0: VIDIOC_DQEVENT: error -2
[  140.029604] video0: VIDIOC_DQEVENT: error -2
[  140.034057] video0: VIDIOC_DQEVENT: error -2
[  140.039174] video0: VIDIOC_DQEVENT: error -2
[  140.044277] video0: VIDIOC_DQEVENT: error -2
[  140.048670] video0: VIDIOC_DQEVENT: error -2
[  140.053786] video0: VIDIOC_DQEVENT: error -2
[  140.058887] video0: VIDIOC_DQEVENT: error -2
[  140.063980] video0: VIDIOC_DQEVENT: error -2
[  140.068338] video0: VIDIOC_DQEVENT: error -2
[  140.073454] video0: VIDIOC_DQEVENT: error -2
[  140.078557] video0: VIDIOC_DQEVENT: error -2
[  140.082961] video0: VIDIOC_DQEVENT: error -2
[  140.088077] video0: VIDIOC_DQEVENT: error -2
[  140.093178] video0: VIDIOC_DQEVENT: error -2
[  140.098270] video0: VIDIOC_DQEVENT: error -2
[  140.102683] video0: VIDIOC_DQEVENT: error -2
[  140.107801] video0: VIDIOC_DQEVENT: error -2
[  140.112905] video0: VIDIOC_DQEVENT: error -2
[  140.117296] video0: VIDIOC_DQEVENT: error -2
[  140.122411] video0: VIDIOC_DQEVENT: error -2
[  140.127516] video0: VIDIOC_DQEVENT: error -2
[  140.131912] video0: VIDIOC_DQEVENT: error -2
[  140.137059] video0: VIDIOC_DQEVENT: error -2
[  140.142159] video0: VIDIOC_DQEVENT: error -2
[  140.147251] video0: VIDIOC_DQEVENT: error -2
[  140.151734] video0: VIDIOC_DQEVENT: error -2
[  140.156862] video0: VIDIOC_DQEVENT: error -2
[  140.161958] video0: VIDIOC_DQEVENT: error -2
[  140.166499] video0: VIDIOC_DQEVENT: error -2
[  140.171627] video0: VIDIOC_DQEVENT: error -2
[  140.176727] video0: VIDIOC_DQEVENT: error -2
[  140.181249] video0: VIDIOC_DQEVENT: error -2
[  140.186380] video0: VIDIOC_DQEVENT: error -2
[  140.191479] video0: VIDIOC_DQEVENT: error -2
[  140.191704] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  140.196576] video0: VIDIOC_DQEVENT: error -2
[  140.201103] video0: VIDIOC_DQEVENT: error -2
[  140.206240] video0: VIDIOC_DQEVENT: error -2
[  140.211353] video0: VIDIOC_DQEVENT: error -2
[  140.215804] video0: VIDIOC_DQEVENT: error -2
[  140.220911] video0: VIDIOC_DQEVENT: error -2
[  140.226007] video0: VIDIOC_DQEVENT: error -2
[  140.231102] video0: VIDIOC_DQEVENT: error -2
[  140.235476] video0: VIDIOC_DQEVENT: error -2
[  140.240622] video0: VIDIOC_DQEVENT: error -2
[  140.245722] video0: VIDIOC_DQEVENT: error -2
[  140.250272] video0: VIDIOC_DQEVENT: error -2
[  140.255403] video0: VIDIOC_DQEVENT: error -2
[  140.260503] video0: VIDIOC_DQEVENT: error -2
[  140.265022] video0: VIDIOC_DQEVENT: error -2
[  140.270150] video0: VIDIOC_DQEVENT: error -2
[  140.275251] video0: VIDIOC_DQEVENT: error -2
[  140.280343] video0: VIDIOC_DQEVENT: error -2
[  140.284819] video0: VIDIOC_DQEVENT: error -2
[  140.289956] video0: VIDIOC_DQEVENT: error -2
[  140.295054] video0: VIDIOC_DQEVENT: error -2
[  140.299563] video0: VIDIOC_DQEVENT: error -2
[  140.304700] video0: VIDIOC_DQEVENT: error -2
[  140.309810] video0: VIDIOC_DQEVENT: error -2
[  140.314904] video0: VIDIOC_DQEVENT: error -2
[  140.319429] video0: VIDIOC_DQEVENT: error -2
[  140.324557] video0: VIDIOC_DQEVENT: error -2
[  140.329655] video0: VIDIOC_DQEVENT: error -2
[  140.334068] video0: VIDIOC_DQEVENT: error -2
[  140.339183] video0: VIDIOC_DQEVENT: error -2
[  140.344286] video0: VIDIOC_DQEVENT: error -2
[  140.348662] video0: VIDIOC_DQEVENT: error -2
[  140.353776] video0: VIDIOC_DQEVENT: error -2
[  140.358878] video0: VIDIOC_DQEVENT: error -2
[  140.363972] video0: VIDIOC_DQEVENT: error -2
[  140.368329] video0: VIDIOC_DQEVENT: error -2
[  140.373444] video0: VIDIOC_DQEVENT: error -2
[  140.378547] video0: VIDIOC_DQEVENT: error -2
[  140.382968] video0: VIDIOC_DQEVENT: error -2
[  140.388086] video0: VIDIOC_DQEVENT: error -2
[  140.393190] video0: VIDIOC_DQEVENT: error -2
[  140.398285] video0: VIDIOC_DQEVENT: error -2
[  140.402691] video0: VIDIOC_DQEVENT: error -2
[  140.407806] video0: VIDIOC_DQEVENT: error -2
[  140.412907] video0: VIDIOC_DQEVENT: error -2
[  140.417272] video0: VIDIOC_DQEVENT: error -2
[  140.422386] video0: VIDIOC_DQEVENT: error -2
[  140.427488] video0: VIDIOC_DQEVENT: error -2
[  140.431844] video0: VIDIOC_DQEVENT: error -2
[  140.436951] video0: VIDIOC_DQEVENT: error -2
[  140.442054] video0: VIDIOC_DQEVENT: error -2
[  140.447147] video0: VIDIOC_DQEVENT: error -2
[  140.451535] video0: VIDIOC_DQEVENT: error -2
[  140.456681] video0: VIDIOC_DQEVENT: error -2
[  140.461779] video0: VIDIOC_DQEVENT: error -2
[  140.466321] video0: VIDIOC_DQEVENT: error -2
[  140.471451] video0: VIDIOC_DQEVENT: error -2
[  140.476552] video0: VIDIOC_DQEVENT: error -2
[  140.481644] video0: VIDIOC_DQEVENT: error -2
[  140.486172] video0: VIDIOC_DQEVENT: error -2
[  140.491309] video0: VIDIOC_DQEVENT: error -2
[  140.496407] video0: VIDIOC_DQEVENT: error -2
[  140.500928] video0: VIDIOC_DQEVENT: error -2
[  140.506053] video0: VIDIOC_DQEVENT: error -2
[  140.511151] video0: VIDIOC_DQEVENT: error -2
[  140.515608] video0: VIDIOC_DQEVENT: error -2
[  140.520736] video0: VIDIOC_DQEVENT: error -2
[  140.525834] video0: VIDIOC_DQEVENT: error -2
[  140.530925] video0: VIDIOC_DQEVENT: error -2
[  140.535435] video0: VIDIOC_DQEVENT: error -2
[  140.540573] video0: VIDIOC_DQEVENT: error -2
[  140.545672] video0: VIDIOC_DQEVENT: error -2
[  140.550208] video0: VIDIOC_DQEVENT: error -2
[  140.555337] video0: VIDIOC_DQEVENT: error -2
[  140.560436] video0: VIDIOC_DQEVENT: error -2
[  140.564922] video0: VIDIOC_DQEVENT: error -2
[  140.570060] video0: VIDIOC_DQEVENT: error -2
[  140.575160] video0: VIDIOC_DQEVENT: error -2
[  140.580254] video0: VIDIOC_DQEVENT: error -2
[  140.584775] video0: VIDIOC_DQEVENT: error -2
[  140.589903] video0: VIDIOC_DQEVENT: error -2
[  140.595012] video0: VIDIOC_DQEVENT: error -2
[  140.599501] video0: VIDIOC_DQEVENT: error -2
[  140.604630] video0: VIDIOC_DQEVENT: error -2
[  140.609726] video0: VIDIOC_DQEVENT: error -2
[  140.614819] video0: VIDIOC_DQEVENT: error -2
[  140.619319] video0: VIDIOC_DQEVENT: error -2
[  140.624442] video0: VIDIOC_DQEVENT: error -2
[  140.629539] video0: VIDIOC_DQEVENT: error -2
[  140.634087] video0: VIDIOC_DQEVENT: error -2
[  140.639222] video0: VIDIOC_DQEVENT: error -2
[  140.644321] video0: VIDIOC_DQEVENT: error -2
[  140.648815] video0: VIDIOC_DQEVENT: error -2
[  140.653950] video0: VIDIOC_DQEVENT: error -2
[  140.659047] video0: VIDIOC_DQEVENT: error -2
[  140.664143] video0: VIDIOC_DQEVENT: error -2
[  140.668511] video0: VIDIOC_DQEVENT: error -2
[  140.673628] video0: VIDIOC_DQEVENT: error -2
[  140.678731] video0: VIDIOC_DQEVENT: error -2
[  140.683126] video0: VIDIOC_DQEVENT: error -2
[  140.688245] video0: VIDIOC_DQEVENT: error -2
[  140.693348] video0: VIDIOC_DQEVENT: error -2
[  140.697721] video0: VIDIOC_DQEVENT: error -2
[  140.702836] video0: VIDIOC_DQEVENT: error -2
[  140.707939] video0: VIDIOC_DQEVENT: error -2
[  140.713031] video0: VIDIOC_DQEVENT: error -2
[  140.717413] video0: VIDIOC_DQEVENT: error -2
[  140.722527] video0: VIDIOC_DQEVENT: error -2
[  140.727631] video0: VIDIOC_DQEVENT: error -2
[  140.732003] video0: VIDIOC_DQEVENT: error -2
[  140.737112] video0: VIDIOC_DQEVENT: error -2
[  140.742213] video0: VIDIOC_DQEVENT: error -2
[  140.747306] video0: VIDIOC_DQEVENT: error -2
[  140.751696] video0: VIDIOC_DQEVENT: error -2
[  140.756802] video0: VIDIOC_DQEVENT: error -2
[  140.761901] video0: VIDIOC_DQEVENT: error -2
[  140.766308] video0: VIDIOC_DQEVENT: error -2
[  140.771424] video0: VIDIOC_DQEVENT: error -2
[  140.776524] video0: VIDIOC_DQEVENT: error -2
[  140.781616] video0: VIDIOC_DQEVENT: error -2
[  140.786000] video0: VIDIOC_DQEVENT: error -2
[  140.791118] video0: VIDIOC_DQEVENT: error -2
[  140.796219] video0: VIDIOC_DQEVENT: error -2
[  140.800575] video0: VIDIOC_DQEVENT: error -2
[  140.805690] video0: VIDIOC_DQEVENT: error -2
[  140.810793] video0: VIDIOC_DQEVENT: error -2
[  140.815193] video0: VIDIOC_DQEVENT: error -2
[  140.820343] video0: VIDIOC_DQEVENT: error -2
[  140.825442] video0: VIDIOC_DQEVENT: error -2
[  140.830534] video0: VIDIOC_DQEVENT: error -2
[  140.835061] video0: VIDIOC_DQEVENT: error -2
[  140.840220] video0: VIDIOC_DQEVENT: error -2
[  140.845319] video0: VIDIOC_DQEVENT: error -2
[  140.849827] video0: VIDIOC_DQEVENT: error -2
[  140.854942] video0: VIDIOC_DQEVENT: error -2
[  140.860041] video0: VIDIOC_DQEVENT: error -2
[  140.864405] video0: VIDIOC_DQEVENT: error -2
[  140.869522] video0: VIDIOC_DQEVENT: error -2
[  140.874625] video0: VIDIOC_DQEVENT: error -2
[  140.879719] video0: VIDIOC_DQEVENT: error -2
[  140.884088] video0: VIDIOC_DQEVENT: error -2
[  140.889199] video0: VIDIOC_DQEVENT: error -2
[  140.894299] video0: VIDIOC_DQEVENT: error -2
[  140.898757] video0: VIDIOC_DQEVENT: error -2
[  140.903873] video0: VIDIOC_DQEVENT: error -2
[  140.908976] video0: VIDIOC_DQEVENT: error -2
[  140.914068] video0: VIDIOC_DQEVENT: error -2
[  140.918499] video0: VIDIOC_DQEVENT: error -2
[  140.923616] video0: VIDIOC_DQEVENT: error -2
[  140.928720] video0: VIDIOC_DQEVENT: error -2
[  140.933094] video0: VIDIOC_DQEVENT: error -2
[  140.938208] video0: VIDIOC_DQEVENT: error -2
[  140.943310] video0: VIDIOC_DQEVENT: error -2
[  140.947649] video0: VIDIOC_DQEVENT: error -2
[  140.952756] video0: VIDIOC_DQEVENT: error -2
[  140.957858] video0: VIDIOC_DQEVENT: error -2
[  140.962951] video0: VIDIOC_DQEVENT: error -2
[  140.967362] video0: VIDIOC_DQEVENT: error -2
[  140.972477] video0: VIDIOC_DQEVENT: error -2
[  140.977578] video0: VIDIOC_DQEVENT: error -2
[  140.981965] video0: VIDIOC_DQEVENT: error -2
[  140.987081] video0: VIDIOC_DQEVENT: error -2
[  140.992192] video0: VIDIOC_DQEVENT: error -2
[  140.997284] video0: VIDIOC_DQEVENT: error -2
[  141.001668] video0: VIDIOC_DQEVENT: error -2
[  141.006784] video0: VIDIOC_DQEVENT: error -2
[  141.011887] video0: VIDIOC_DQEVENT: error -2
[  141.016252] video0: VIDIOC_DQEVENT: error -2
[  141.021363] video0: VIDIOC_DQEVENT: error -2
[  141.026467] video0: VIDIOC_DQEVENT: error -2
[  141.031561] video0: VIDIOC_DQEVENT: error -2
[  141.035929] video0: VIDIOC_DQEVENT: error -2
[  141.041075] video0: VIDIOC_DQEVENT: error -2
[  141.046174] video0: VIDIOC_DQEVENT: error -2
[  141.050713] video0: VIDIOC_DQEVENT: error -2
[  141.055840] video0: VIDIOC_DQEVENT: error -2
[  141.060938] video0: VIDIOC_DQEVENT: error -2
[  141.065435] video0: VIDIOC_DQEVENT: error -2
[  141.070562] video0: VIDIOC_DQEVENT: error -2
[  141.075660] video0: VIDIOC_DQEVENT: error -2
[  141.080752] video0: VIDIOC_DQEVENT: error -2
[  141.085252] video0: VIDIOC_DQEVENT: error -2
[  141.090380] video0: VIDIOC_DQEVENT: error -2
[  141.095478] video0: VIDIOC_DQEVENT: error -2
[  141.099953] video0: VIDIOC_DQEVENT: error -2
[  141.105081] video0: VIDIOC_DQEVENT: error -2
[  141.110193] video0: VIDIOC_DQEVENT: error -2
[  141.114745] video0: VIDIOC_DQEVENT: error -2
[  141.119876] video0: VIDIOC_DQEVENT: error -2
[  141.124973] video0: VIDIOC_DQEVENT: error -2
[  141.130064] video0: VIDIOC_DQEVENT: error -2
[  141.134601] video0: VIDIOC_DQEVENT: error -2
[  141.139738] video0: VIDIOC_DQEVENT: error -2
[  141.144840] video0: VIDIOC_DQEVENT: error -2
[  141.149336] video0: VIDIOC_DQEVENT: error -2
[  141.154471] video0: VIDIOC_DQEVENT: error -2
[  141.159572] video0: VIDIOC_DQEVENT: error -2
[  141.164666] video0: VIDIOC_DQEVENT: error -2
[  141.169171] video0: VIDIOC_DQEVENT: error -2
[  141.174307] video0: VIDIOC_DQEVENT: error -2
[  141.179408] video0: VIDIOC_DQEVENT: error -2
[  141.183886] video0: VIDIOC_DQEVENT: error -2
[  141.188994] video0: VIDIOC_DQEVENT: error -2
[  141.194090] video0: VIDIOC_DQEVENT: error -2
[  141.198506] video0: VIDIOC_DQEVENT: error -2
[  141.203622] video0: VIDIOC_DQEVENT: error -2
[  141.208724] video0: VIDIOC_DQEVENT: error -2
[  141.213819] video0: VIDIOC_DQEVENT: error -2
[  141.215779] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  141.218329] video0: VIDIOC_DQEVENT: error -2
[  141.223444] video0: VIDIOC_DQEVENT: error -2
[  141.228549] video0: VIDIOC_DQEVENT: error -2
[  141.232935] video0: VIDIOC_DQEVENT: error -2
[  141.238050] video0: VIDIOC_DQEVENT: error -2
[  141.243153] video0: VIDIOC_DQEVENT: error -2
[  141.248246] video0: VIDIOC_DQEVENT: error -2
[  141.252626] video0: VIDIOC_DQEVENT: error -2
[  141.257741] video0: VIDIOC_DQEVENT: error -2
[  141.262844] video0: VIDIOC_DQEVENT: error -2
[  141.267255] video0: VIDIOC_DQEVENT: error -2
[  141.272370] video0: VIDIOC_DQEVENT: error -2
[  141.277470] video0: VIDIOC_DQEVENT: error -2
[  141.281862] video0: VIDIOC_DQEVENT: error -2
[  141.286977] video0: VIDIOC_DQEVENT: error -2
[  141.292081] video0: VIDIOC_DQEVENT: error -2
[  141.297172] video0: VIDIOC_DQEVENT: error -2
[  141.301546] video0: VIDIOC_DQEVENT: error -2
[  141.306660] video0: VIDIOC_DQEVENT: error -2
[  141.311764] video0: VIDIOC_DQEVENT: error -2
[  141.316116] video0: VIDIOC_DQEVENT: error -2
[  141.321227] video0: VIDIOC_DQEVENT: error -2
[  141.326329] video0: VIDIOC_DQEVENT: error -2
[  141.331422] video0: VIDIOC_DQEVENT: error -2
[  141.335798] video0: VIDIOC_DQEVENT: error -2
[  141.340943] video0: VIDIOC_DQEVENT: error -2
[  141.346042] video0: VIDIOC_DQEVENT: error -2
[  141.350603] video0: VIDIOC_DQEVENT: error -2
[  141.355731] video0: VIDIOC_DQEVENT: error -2
[  141.360831] video0: VIDIOC_DQEVENT: error -2
[  141.365331] video0: VIDIOC_DQEVENT: error -2
[  141.370458] video0: VIDIOC_DQEVENT: error -2
[  141.375556] video0: VIDIOC_DQEVENT: error -2
[  141.380647] video0: VIDIOC_DQEVENT: error -2
[  141.385143] video0: VIDIOC_DQEVENT: error -2
[  141.390272] video0: VIDIOC_DQEVENT: error -2
[  141.395371] video0: VIDIOC_DQEVENT: error -2
[  141.399840] video0: VIDIOC_DQEVENT: error -2
[  141.404967] video0: VIDIOC_DQEVENT: error -2
[  141.410065] video0: VIDIOC_DQEVENT: error -2
[  141.414641] video0: VIDIOC_DQEVENT: error -2
[  141.419777] video0: VIDIOC_DQEVENT: error -2
[  141.424889] video0: VIDIOC_DQEVENT: error -2
[  141.429981] video0: VIDIOC_DQEVENT: error -2
[  141.434540] video0: VIDIOC_DQEVENT: error -2
[  141.439668] video0: VIDIOC_DQEVENT: error -2
[  141.444767] video0: VIDIOC_DQEVENT: error -2
[  141.449265] video0: VIDIOC_DQEVENT: error -2
[  141.454394] video0: VIDIOC_DQEVENT: error -2
[  141.459494] video0: VIDIOC_DQEVENT: error -2
[  141.464587] video0: VIDIOC_DQEVENT: error -2
[  141.469080] video0: VIDIOC_DQEVENT: error -2
[  141.474221] video0: VIDIOC_DQEVENT: error -2
[  141.479350] video0: VIDIOC_DQEVENT: error -2
[  141.484058] video0: VIDIOC_DQEVENT: error -2
[  141.489187] video0: VIDIOC_DQEVENT: error -2
[  141.494305] video0: VIDIOC_DQEVENT: error -2
[  141.499019] video0: VIDIOC_DQEVENT: error -2
[  141.504397] video0: VIDIOC_DQEVENT: error -2
[  141.509514] video0: VIDIOC_DQEVENT: error -2
[  141.514616] video0: VIDIOC_DQEVENT: error -2
[  141.519254] video0: VIDIOC_DQEVENT: error -2
[  141.524370] video0: VIDIOC_DQEVENT: error -2
[  141.529478] video0: VIDIOC_DQEVENT: error -2
[  141.533989] video0: VIDIOC_DQEVENT: error -2
[  141.539115] video0: VIDIOC_DQEVENT: error -2
[  141.544226] video0: VIDIOC_DQEVENT: error -2
[  141.548949] video0: VIDIOC_DQEVENT: error -2
[  141.554084] video0: VIDIOC_DQEVENT: error -2
[  141.559194] video0: VIDIOC_DQEVENT: error -2
[  141.564295] video0: VIDIOC_DQEVENT: error -2
[  141.569051] video0: VIDIOC_DQEVENT: error -2
[  141.574175] video0: VIDIOC_DQEVENT: error -2
[  141.579285] video0: VIDIOC_DQEVENT: error -2
[  141.583746] video0: VIDIOC_DQEVENT: error -2
[  141.588857] video0: VIDIOC_DQEVENT: error -2
[  141.593959] video0: VIDIOC_DQEVENT: error -2
[  141.598477] video0: VIDIOC_DQEVENT: error -2
[  141.603596] video0: VIDIOC_DQEVENT: error -2
[  141.608701] video0: VIDIOC_DQEVENT: error -2
[  141.613796] video0: VIDIOC_DQEVENT: error -2
[  141.618288] video0: VIDIOC_DQEVENT: error -2
[  141.623406] video0: VIDIOC_DQEVENT: error -2
[  141.628516] video0: VIDIOC_DQEVENT: error -2
[  141.633003] video0: VIDIOC_DQEVENT: error -2
[  141.638119] video0: VIDIOC_DQEVENT: error -2
[  141.643221] video0: VIDIOC_DQEVENT: error -2
[  141.648314] video0: VIDIOC_DQEVENT: error -2
[  141.652765] video0: VIDIOC_DQEVENT: error -2
[  141.657879] video0: VIDIOC_DQEVENT: error -2
[  141.662979] video0: VIDIOC_DQEVENT: error -2
[  141.667483] video0: VIDIOC_DQEVENT: error -2
[  141.672615] video0: VIDIOC_DQEVENT: error -2
[  141.677716] video0: VIDIOC_DQEVENT: error -2
[  141.682210] video0: VIDIOC_DQEVENT: error -2
[  141.687327] video0: VIDIOC_DQEVENT: error -2
[  141.692430] video0: VIDIOC_DQEVENT: error -2
[  141.697527] video0: VIDIOC_DQEVENT: error -2
[  141.702012] video0: VIDIOC_DQEVENT: error -2
[  141.707128] video0: VIDIOC_DQEVENT: error -2
[  141.712231] video0: VIDIOC_DQEVENT: error -2
[  141.716668] video0: VIDIOC_DQEVENT: error -2
[  141.721788] video0: VIDIOC_DQEVENT: error -2
[  141.726896] video0: VIDIOC_DQEVENT: error -2
[  141.731373] video0: VIDIOC_DQEVENT: error -2
[  141.736489] video0: VIDIOC_DQEVENT: error -2
[  141.741591] video0: VIDIOC_DQEVENT: error -2
[  141.746684] video0: VIDIOC_DQEVENT: error -2
[  141.751176] video0: VIDIOC_DQEVENT: error -2
[  141.756291] video0: VIDIOC_DQEVENT: error -2
[  141.761392] video0: VIDIOC_DQEVENT: error -2
[  141.765873] video0: VIDIOC_DQEVENT: error -2
[  141.770987] video0: VIDIOC_DQEVENT: error -2
[  141.776092] video0: VIDIOC_DQEVENT: error -2
[  141.781187] video0: VIDIOC_DQEVENT: error -2
[  141.785655] video0: VIDIOC_DQEVENT: error -2
[  141.790770] video0: VIDIOC_DQEVENT: error -2
[  141.795877] video0: VIDIOC_DQEVENT: error -2
[  141.800307] video0: VIDIOC_DQEVENT: error -2
[  141.805423] video0: VIDIOC_DQEVENT: error -2
[  141.810526] video0: VIDIOC_DQEVENT: error -2
[  141.814978] video0: VIDIOC_DQEVENT: error -2
[  141.820102] video0: VIDIOC_DQEVENT: error -2
[  141.825215] video0: VIDIOC_DQEVENT: error -2
[  141.830315] video0: VIDIOC_DQEVENT: error -2
[  141.835011] video0: VIDIOC_DQEVENT: error -2
[  141.840411] video0: VIDIOC_DQEVENT: error -2
[  141.845523] video0: VIDIOC_DQEVENT: error -2
[  141.850228] video0: VIDIOC_DQEVENT: error -2
[  141.855372] video0: VIDIOC_DQEVENT: error -2
[  141.860481] video0: VIDIOC_DQEVENT: error -2
[  141.865133] video0: VIDIOC_DQEVENT: error -2
[  141.870253] video0: VIDIOC_DQEVENT: error -2
[  141.875363] video0: VIDIOC_DQEVENT: error -2
[  141.880463] video0: VIDIOC_DQEVENT: error -2
[  141.885192] video0: VIDIOC_DQEVENT: error -2
[  141.890329] video0: VIDIOC_DQEVENT: error -2
[  141.895441] video0: VIDIOC_DQEVENT: error -2
[  141.900129] video0: VIDIOC_DQEVENT: error -2
[  141.905261] video0: VIDIOC_DQEVENT: error -2
[  141.910370] video0: VIDIOC_DQEVENT: error -2
[  141.915013] video0: VIDIOC_DQEVENT: error -2
[  141.920150] video0: VIDIOC_DQEVENT: error -2
[  141.925268] video0: VIDIOC_DQEVENT: error -2
[  141.930372] video0: VIDIOC_DQEVENT: error -2
[  141.935054] video0: VIDIOC_DQEVENT: error -2
[  141.940409] video0: VIDIOC_DQEVENT: error -2
[  141.945510] video0: VIDIOC_DQEVENT: error -2
[  141.950175] video0: VIDIOC_DQEVENT: error -2
[  141.955296] video0: VIDIOC_DQEVENT: error -2
[  141.960406] video0: VIDIOC_DQEVENT: error -2
[  141.964993] video0: VIDIOC_DQEVENT: error -2
[  141.970126] video0: VIDIOC_DQEVENT: error -2
[  141.975229] video0: VIDIOC_DQEVENT: error -2
[  141.980324] video0: VIDIOC_DQEVENT: error -2
[  141.984850] video0: VIDIOC_DQEVENT: error -2
[  141.989989] video0: VIDIOC_DQEVENT: error -2
[  141.995102] video0: VIDIOC_DQEVENT: error -2
[  141.999566] video0: VIDIOC_DQEVENT: error -2
[  142.004702] video0: VIDIOC_DQEVENT: error -2
[  142.009799] video0: VIDIOC_DQEVENT: error -2
[  142.014891] video0: VIDIOC_DQEVENT: error -2
[  142.019398] video0: VIDIOC_DQEVENT: error -2
[  142.024537] video0: VIDIOC_DQEVENT: error -2
[  142.029637] video0: VIDIOC_DQEVENT: error -2
[  142.034170] video0: VIDIOC_DQEVENT: error -2
[  142.039308] video0: VIDIOC_DQEVENT: error -2
[  142.044408] video0: VIDIOC_DQEVENT: error -2
[  142.048785] video0: VIDIOC_DQEVENT: error -2
[  142.053902] video0: VIDIOC_DQEVENT: error -2
[  142.059003] video0: VIDIOC_DQEVENT: error -2
[  142.064099] video0: VIDIOC_DQEVENT: error -2
[  142.068477] video0: VIDIOC_DQEVENT: error -2
[  142.073598] video0: VIDIOC_DQEVENT: error -2
[  142.078702] video0: VIDIOC_DQEVENT: error -2
[  142.083139] video0: VIDIOC_DQEVENT: error -2
[  142.088255] video0: VIDIOC_DQEVENT: error -2
[  142.093355] video0: VIDIOC_DQEVENT: error -2
[  142.097743] video0: VIDIOC_DQEVENT: error -2
[  142.102857] video0: VIDIOC_DQEVENT: error -2
[  142.107960] video0: VIDIOC_DQEVENT: error -2
[  142.113055] video0: VIDIOC_DQEVENT: error -2
[  142.117415] video0: VIDIOC_DQEVENT: error -2
[  142.122533] video0: VIDIOC_DQEVENT: error -2
[  142.127637] video0: VIDIOC_DQEVENT: error -2
[  142.132007] video0: VIDIOC_DQEVENT: error -2
[  142.137116] video0: VIDIOC_DQEVENT: error -2
[  142.142217] video0: VIDIOC_DQEVENT: error -2
[  142.147309] video0: VIDIOC_DQEVENT: error -2
[  142.151659] video0: VIDIOC_DQEVENT: error -2
[  142.156766] video0: VIDIOC_DQEVENT: error -2
[  142.161867] video0: VIDIOC_DQEVENT: error -2
[  142.166294] video0: VIDIOC_DQEVENT: error -2
[  142.171456] video0: VIDIOC_DQEVENT: error -2
[  142.176569] video0: VIDIOC_DQEVENT: error -2
[  142.181661] video0: VIDIOC_DQEVENT: error -2
[  142.186203] video0: VIDIOC_DQEVENT: error -2
[  142.191342] video0: VIDIOC_DQEVENT: error -2
[  142.196443] video0: VIDIOC_DQEVENT: error -2
[  142.200965] video0: VIDIOC_DQEVENT: error -2
[  142.206092] video0: VIDIOC_DQEVENT: error -2
[  142.211194] video0: VIDIOC_DQEVENT: error -2
[  142.215681] video0: VIDIOC_DQEVENT: error -2
[  142.220809] video0: VIDIOC_DQEVENT: error -2
[  142.225907] video0: VIDIOC_DQEVENT: error -2
[  142.230999] video0: VIDIOC_DQEVENT: error -2
[  142.235503] video0: VIDIOC_DQEVENT: error -2
[  142.239714] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  142.240641] video0: VIDIOC_DQEVENT: error -2
[  142.245740] video0: VIDIOC_DQEVENT: error -2
[  142.250290] video0: VIDIOC_DQEVENT: error -2
[  142.255420] video0: VIDIOC_DQEVENT: error -2
[  142.260521] video0: VIDIOC_DQEVENT: error -2
[  142.265038] video0: VIDIOC_DQEVENT: error -2
[  142.270166] video0: VIDIOC_DQEVENT: error -2
[  142.275278] video0: VIDIOC_DQEVENT: error -2
[  142.280371] video0: VIDIOC_DQEVENT: error -2
[  142.284861] video0: VIDIOC_DQEVENT: error -2
[  142.289996] video0: VIDIOC_DQEVENT: error -2
[  142.295097] video0: VIDIOC_DQEVENT: error -2
[  142.299573] video0: VIDIOC_DQEVENT: error -2
[  142.304694] video0: VIDIOC_DQEVENT: error -2
[  142.309789] video0: VIDIOC_DQEVENT: error -2
[  142.314881] video0: VIDIOC_DQEVENT: error -2
[  142.319354] video0: VIDIOC_DQEVENT: error -2
[  142.324488] video0: VIDIOC_DQEVENT: error -2
[  142.329588] video0: VIDIOC_DQEVENT: error -2
[  142.334125] video0: VIDIOC_DQEVENT: error -2
[  142.339253] video0: VIDIOC_DQEVENT: error -2
[  142.344362] video0: VIDIOC_DQEVENT: error -2
[  142.348876] video0: VIDIOC_DQEVENT: error -2
[  142.354011] video0: VIDIOC_DQEVENT: error -2
[  142.359111] video0: VIDIOC_DQEVENT: error -2
[  142.364206] video0: VIDIOC_DQEVENT: error -2
[  142.368689] video0: VIDIOC_DQEVENT: error -2
[  142.373826] video0: VIDIOC_DQEVENT: error -2
[  142.378924] video0: VIDIOC_DQEVENT: error -2
[  142.383408] video0: VIDIOC_DQEVENT: error -2
[  142.388523] video0: VIDIOC_DQEVENT: error -2
[  142.393622] video0: VIDIOC_DQEVENT: error -2
[  142.398011] video0: VIDIOC_DQEVENT: error -2
[  142.403127] video0: VIDIOC_DQEVENT: error -2
[  142.408229] video0: VIDIOC_DQEVENT: error -2
[  142.413321] video0: VIDIOC_DQEVENT: error -2
[  142.417709] video0: VIDIOC_DQEVENT: error -2
[  142.422825] video0: VIDIOC_DQEVENT: error -2
[  142.427928] video0: VIDIOC_DQEVENT: error -2
[  142.432291] video0: VIDIOC_DQEVENT: error -2
[  142.437448] video0: VIDIOC_DQEVENT: error -2
[  142.442550] video0: VIDIOC_DQEVENT: error -2
[  142.447646] video0: VIDIOC_DQEVENT: error -2
[  142.452133] video0: VIDIOC_DQEVENT: error -2
[  142.457264] video0: VIDIOC_DQEVENT: error -2
[  142.462362] video0: VIDIOC_DQEVENT: error -2
[  142.466890] video0: VIDIOC_DQEVENT: error -2
[  142.472019] video0: VIDIOC_DQEVENT: error -2
[  142.477130] video0: VIDIOC_DQEVENT: error -2
[  142.481628] video0: VIDIOC_DQEVENT: error -2
[  142.486758] video0: VIDIOC_DQEVENT: error -2
[  142.491857] video0: VIDIOC_DQEVENT: error -2
[  142.496950] video0: VIDIOC_DQEVENT: error -2
[  142.501482] video0: VIDIOC_DQEVENT: error -2
[  142.506610] video0: VIDIOC_DQEVENT: error -2
[  142.511711] video0: VIDIOC_DQEVENT: error -2
[  142.516190] video0: VIDIOC_DQEVENT: error -2
[  142.521319] video0: VIDIOC_DQEVENT: error -2
[  142.526430] video0: VIDIOC_DQEVENT: error -2
[  142.531523] video0: VIDIOC_DQEVENT: error -2
[  142.535999] video0: VIDIOC_DQEVENT: error -2
[  142.541128] video0: VIDIOC_DQEVENT: error -2
[  142.546225] video0: VIDIOC_DQEVENT: error -2
[  142.550761] video0: VIDIOC_DQEVENT: error -2
[  142.555899] video0: VIDIOC_DQEVENT: error -2
[  142.560999] video0: VIDIOC_DQEVENT: error -2
[  142.565483] video0: VIDIOC_DQEVENT: error -2
[  142.570598] video0: VIDIOC_DQEVENT: error -2
[  142.575697] video0: VIDIOC_DQEVENT: error -2
[  142.580790] video0: VIDIOC_DQEVENT: error -2
[  142.585158] video0: VIDIOC_DQEVENT: error -2
[  142.590274] video0: VIDIOC_DQEVENT: error -2
[  142.595377] video0: VIDIOC_DQEVENT: error -2
[  142.599733] video0: VIDIOC_DQEVENT: error -2
[  142.604880] video0: VIDIOC_DQEVENT: error -2
[  142.609978] video0: VIDIOC_DQEVENT: error -2
[  142.614513] video0: VIDIOC_DQEVENT: error -2
[  142.619649] video0: VIDIOC_DQEVENT: error -2
[  142.624760] video0: VIDIOC_DQEVENT: error -2
[  142.629857] video0: VIDIOC_DQEVENT: error -2
[  142.634518] video0: VIDIOC_DQEVENT: error -2
[  142.639654] video0: VIDIOC_DQEVENT: error -2
[  142.644753] video0: VIDIOC_DQEVENT: error -2
[  142.649251] video0: VIDIOC_DQEVENT: error -2
[  142.654366] video0: VIDIOC_DQEVENT: error -2
[  142.659465] video0: VIDIOC_DQEVENT: error -2
[  142.664557] video0: VIDIOC_DQEVENT: error -2
[  142.668933] video0: VIDIOC_DQEVENT: error -2
[  142.674048] video0: VIDIOC_DQEVENT: error -2
[  142.679151] video0: VIDIOC_DQEVENT: error -2
[  142.683514] video0: VIDIOC_DQEVENT: error -2
[  142.688621] video0: VIDIOC_DQEVENT: error -2
[  142.693722] video0: VIDIOC_DQEVENT: error -2
[  142.698128] video0: VIDIOC_DQEVENT: error -2
[  142.703245] video0: VIDIOC_DQEVENT: error -2
[  142.708346] video0: VIDIOC_DQEVENT: error -2
[  142.713436] video0: VIDIOC_DQEVENT: error -2
[  142.717811] video0: VIDIOC_DQEVENT: error -2
[  142.722925] video0: VIDIOC_DQEVENT: error -2
[  142.728029] video0: VIDIOC_DQEVENT: error -2
[  142.732393] video0: VIDIOC_DQEVENT: error -2
[  142.737509] video0: VIDIOC_DQEVENT: error -2
[  142.742613] video0: VIDIOC_DQEVENT: error -2
[  142.747705] video0: VIDIOC_DQEVENT: error -2
[  142.752057] video0: VIDIOC_DQEVENT: error -2
[  142.757209] video0: VIDIOC_DQEVENT: error -2
[  142.762309] video0: VIDIOC_DQEVENT: error -2
[  142.766859] video0: VIDIOC_DQEVENT: error -2
[  142.771988] video0: VIDIOC_DQEVENT: error -2
[  142.777088] video0: VIDIOC_DQEVENT: error -2
[  142.781611] video0: VIDIOC_DQEVENT: error -2
[  142.786743] video0: VIDIOC_DQEVENT: error -2
[  142.791842] video0: VIDIOC_DQEVENT: error -2
[  142.796935] video0: VIDIOC_DQEVENT: error -2
[  142.801312] video0: VIDIOC_DQEVENT: error -2
[  142.806426] video0: VIDIOC_DQEVENT: error -2
[  142.811531] video0: VIDIOC_DQEVENT: error -2
[  142.815933] video0: VIDIOC_DQEVENT: error -2
[  142.821075] video0: VIDIOC_DQEVENT: error -2
[  142.826173] video0: VIDIOC_DQEVENT: error -2
[  142.831265] video0: VIDIOC_DQEVENT: error -2
[  142.835734] video0: VIDIOC_DQEVENT: error -2
[  142.840863] video0: VIDIOC_DQEVENT: error -2
[  142.845959] video0: VIDIOC_DQEVENT: error -2
[  142.850506] video0: VIDIOC_DQEVENT: error -2
[  142.855644] video0: VIDIOC_DQEVENT: error -2
[  142.860745] video0: VIDIOC_DQEVENT: error -2
[  142.865233] video0: VIDIOC_DQEVENT: error -2
[  142.870360] video0: VIDIOC_DQEVENT: error -2
[  142.875459] video0: VIDIOC_DQEVENT: error -2
[  142.880552] video0: VIDIOC_DQEVENT: error -2
[  142.885034] video0: VIDIOC_DQEVENT: error -2
[  142.890171] video0: VIDIOC_DQEVENT: error -2
[  142.895270] video0: VIDIOC_DQEVENT: error -2
[  142.899758] video0: VIDIOC_DQEVENT: error -2
[  142.904887] video0: VIDIOC_DQEVENT: error -2
[  142.909984] video0: VIDIOC_DQEVENT: error -2
[  142.914523] video0: VIDIOC_DQEVENT: error -2
[  142.919652] video0: VIDIOC_DQEVENT: error -2
[  142.924751] video0: VIDIOC_DQEVENT: error -2
[  142.929841] video0: VIDIOC_DQEVENT: error -2
[  142.934364] video0: VIDIOC_DQEVENT: error -2
[  142.939480] video0: VIDIOC_DQEVENT: error -2
[  142.944577] video0: VIDIOC_DQEVENT: error -2
[  142.948961] video0: VIDIOC_DQEVENT: error -2
[  142.954075] video0: VIDIOC_DQEVENT: error -2
[  142.959178] video0: VIDIOC_DQEVENT: error -2
[  142.964269] video0: VIDIOC_DQEVENT: error -2
[  142.968636] video0: VIDIOC_DQEVENT: error -2
[  142.973751] video0: VIDIOC_DQEVENT: error -2
[  142.978854] video0: VIDIOC_DQEVENT: error -2
[  142.983235] video0: VIDIOC_DQEVENT: error -2
[  142.988386] video0: VIDIOC_DQEVENT: error -2
[  142.993486] video0: VIDIOC_DQEVENT: error -2
[  142.997999] video0: VIDIOC_DQEVENT: error -2
[  143.003127] video0: VIDIOC_DQEVENT: error -2
[  143.008229] video0: VIDIOC_DQEVENT: error -2
[  143.013326] video0: VIDIOC_DQEVENT: error -2
[  143.017848] video0: VIDIOC_DQEVENT: error -2
[  143.022978] video0: VIDIOC_DQEVENT: error -2
[  143.028080] video0: VIDIOC_DQEVENT: error -2
[  143.032554] video0: VIDIOC_DQEVENT: error -2
[  143.037690] video0: VIDIOC_DQEVENT: error -2
[  143.042803] video0: VIDIOC_DQEVENT: error -2
[  143.047896] video0: VIDIOC_DQEVENT: error -2
[  143.052382] video0: VIDIOC_DQEVENT: error -2
[  143.057508] video0: VIDIOC_DQEVENT: error -2
[  143.062621] video0: VIDIOC_DQEVENT: error -2
[  143.067140] video0: VIDIOC_DQEVENT: error -2
[  143.072275] video0: VIDIOC_DQEVENT: error -2
[  143.077371] video0: VIDIOC_DQEVENT: error -2
[  143.081882] video0: VIDIOC_DQEVENT: error -2
[  143.087018] video0: VIDIOC_DQEVENT: error -2
[  143.092117] video0: VIDIOC_DQEVENT: error -2
[  143.097210] video0: VIDIOC_DQEVENT: error -2
[  143.101739] video0: VIDIOC_DQEVENT: error -2
[  143.106867] video0: VIDIOC_DQEVENT: error -2
[  143.111966] video0: VIDIOC_DQEVENT: error -2
[  143.116479] video0: VIDIOC_DQEVENT: error -2
[  143.121609] video0: VIDIOC_DQEVENT: error -2
[  143.126721] video0: VIDIOC_DQEVENT: error -2
[  143.131219] video0: VIDIOC_DQEVENT: error -2
[  143.136330] video0: VIDIOC_DQEVENT: error -2
[  143.141429] video0: VIDIOC_DQEVENT: error -2
[  143.146521] video0: VIDIOC_DQEVENT: error -2
[  143.151020] video0: VIDIOC_DQEVENT: error -2
[  143.156172] video0: VIDIOC_DQEVENT: error -2
[  143.161273] video0: VIDIOC_DQEVENT: error -2
[  143.165674] video0: VIDIOC_DQEVENT: error -2
[  143.170788] video0: VIDIOC_DQEVENT: error -2
[  143.175892] video0: VIDIOC_DQEVENT: error -2
[  143.180987] video0: VIDIOC_DQEVENT: error -2
[  143.185376] video0: VIDIOC_DQEVENT: error -2
[  143.190491] video0: VIDIOC_DQEVENT: error -2
[  143.195596] video0: VIDIOC_DQEVENT: error -2
[  143.199996] video0: VIDIOC_DQEVENT: error -2
[  143.205104] video0: VIDIOC_DQEVENT: error -2
[  143.210206] video0: VIDIOC_DQEVENT: error -2
[  143.214619] video0: VIDIOC_DQEVENT: error -2
[  143.219733] video0: VIDIOC_DQEVENT: error -2
[  143.224836] video0: VIDIOC_DQEVENT: error -2
[  143.229928] video0: VIDIOC_DQEVENT: error -2
[  143.234372] video0: VIDIOC_DQEVENT: error -2
[  143.239485] video0: VIDIOC_DQEVENT: error -2
[  143.244589] video0: VIDIOC_DQEVENT: error -2
[  143.248967] video0: VIDIOC_DQEVENT: error -2
[  143.254082] video0: VIDIOC_DQEVENT: error -2
[  143.259186] video0: VIDIOC_DQEVENT: error -2
[  143.263711] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  143.264281] video0: VIDIOC_DQEVENT: error -2
[  143.268660] video0: VIDIOC_DQEVENT: error -2
[  143.273775] video0: VIDIOC_DQEVENT: error -2
[  143.278881] video0: VIDIOC_DQEVENT: error -2
[  143.283266] video0: VIDIOC_DQEVENT: error -2
[  143.288379] video0: VIDIOC_DQEVENT: error -2
[  143.293480] video0: VIDIOC_DQEVENT: error -2
[  143.297893] video0: VIDIOC_DQEVENT: error -2
[  143.303006] video0: VIDIOC_DQEVENT: error -2
[  143.308110] video0: VIDIOC_DQEVENT: error -2
[  143.313204] video0: VIDIOC_DQEVENT: error -2
[  143.317581] video0: VIDIOC_DQEVENT: error -2
[  143.322695] video0: VIDIOC_DQEVENT: error -2
[  143.327798] video0: VIDIOC_DQEVENT: error -2
[  143.332167] video0: VIDIOC_DQEVENT: error -2
[  143.337277] video0: VIDIOC_DQEVENT: error -2
[  143.342381] video0: VIDIOC_DQEVENT: error -2
[  143.347474] video0: VIDIOC_DQEVENT: error -2
[  143.351838] video0: VIDIOC_DQEVENT: error -2
[  143.356946] video0: VIDIOC_DQEVENT: error -2
[  143.362050] video0: VIDIOC_DQEVENT: error -2
[  143.366498] video0: VIDIOC_DQEVENT: error -2
[  143.371613] video0: VIDIOC_DQEVENT: error -2
[  143.376715] video0: VIDIOC_DQEVENT: error -2
[  143.381090] video0: VIDIOC_DQEVENT: error -2
[  143.386204] video0: VIDIOC_DQEVENT: error -2
[  143.391308] video0: VIDIOC_DQEVENT: error -2
[  143.396402] video0: VIDIOC_DQEVENT: error -2
[  143.400771] video0: VIDIOC_DQEVENT: error -2
[  143.405885] video0: VIDIOC_DQEVENT: error -2
[  143.410988] video0: VIDIOC_DQEVENT: error -2
[  143.415409] video0: VIDIOC_DQEVENT: error -2
[  143.420523] video0: VIDIOC_DQEVENT: error -2
[  143.425625] video0: VIDIOC_DQEVENT: error -2
[  143.430718] video0: VIDIOC_DQEVENT: error -2
[  143.435189] video0: VIDIOC_DQEVENT: error -2
[  143.440301] video0: VIDIOC_DQEVENT: error -2
[  143.445398] video0: VIDIOC_DQEVENT: error -2
[  143.449789] video0: VIDIOC_DQEVENT: error -2
[  143.454901] video0: VIDIOC_DQEVENT: error -2
[  143.460002] video0: VIDIOC_DQEVENT: error -2
[  143.464365] video0: VIDIOC_DQEVENT: error -2
[  143.469477] video0: VIDIOC_DQEVENT: error -2
[  143.474581] video0: VIDIOC_DQEVENT: error -2
[  143.479677] video0: VIDIOC_DQEVENT: error -2
[  143.484039] video0: VIDIOC_DQEVENT: error -2
[  143.489148] video0: VIDIOC_DQEVENT: error -2
[  143.494251] video0: VIDIOC_DQEVENT: error -2
[  143.498672] video0: VIDIOC_DQEVENT: error -2
[  143.503786] video0: VIDIOC_DQEVENT: error -2
[  143.508887] video0: VIDIOC_DQEVENT: error -2
[  143.513980] video0: VIDIOC_DQEVENT: error -2
[  143.518397] video0: VIDIOC_DQEVENT: error -2
[  143.523511] video0: VIDIOC_DQEVENT: error -2
[  143.528616] video0: VIDIOC_DQEVENT: error -2
[  143.533010] video0: VIDIOC_DQEVENT: error -2
[  143.538123] video0: VIDIOC_DQEVENT: error -2
[  143.543225] video0: VIDIOC_DQEVENT: error -2
[  143.548317] video0: VIDIOC_DQEVENT: error -2
[  143.552695] video0: VIDIOC_DQEVENT: error -2
[  143.557808] video0: VIDIOC_DQEVENT: error -2
[  143.562910] video0: VIDIOC_DQEVENT: error -2
[  143.567293] video0: VIDIOC_DQEVENT: error -2
[  143.572406] video0: VIDIOC_DQEVENT: error -2
[  143.577508] video0: VIDIOC_DQEVENT: error -2
[  143.581998] video0: VIDIOC_DQEVENT: error -2
[  143.587128] video0: VIDIOC_DQEVENT: error -2
[  143.592227] video0: VIDIOC_DQEVENT: error -2
[  143.597322] video0: VIDIOC_DQEVENT: error -2
[  143.601705] video0: VIDIOC_DQEVENT: error -2
[  143.606817] video0: VIDIOC_DQEVENT: error -2
[  143.611921] video0: VIDIOC_DQEVENT: error -2
[  143.616314] video0: VIDIOC_DQEVENT: error -2
[  143.621427] video0: VIDIOC_DQEVENT: error -2
[  143.626529] video0: VIDIOC_DQEVENT: error -2
[  143.631620] video0: VIDIOC_DQEVENT: error -2
[  143.635992] video0: VIDIOC_DQEVENT: error -2
[  143.641098] video0: VIDIOC_DQEVENT: error -2
[  143.646200] video0: VIDIOC_DQEVENT: error -2
[  143.650627] video0: VIDIOC_DQEVENT: error -2
[  143.655741] video0: VIDIOC_DQEVENT: error -2
[  143.660843] video0: VIDIOC_DQEVENT: error -2
[  143.665223] video0: VIDIOC_DQEVENT: error -2
[  143.670338] video0: VIDIOC_DQEVENT: error -2
[  143.675442] video0: VIDIOC_DQEVENT: error -2
[  143.680535] video0: VIDIOC_DQEVENT: error -2
[  143.684929] video0: VIDIOC_DQEVENT: error -2
[  143.690086] video0: VIDIOC_DQEVENT: error -2
[  143.695187] video0: VIDIOC_DQEVENT: error -2
[  143.699572] video0: VIDIOC_DQEVENT: error -2
[  143.704715] video0: VIDIOC_DQEVENT: error -2
[  143.709814] video0: VIDIOC_DQEVENT: error -2
[  143.714906] video0: VIDIOC_DQEVENT: error -2
[  143.719293] video0: VIDIOC_DQEVENT: error -2
[  143.724443] video0: VIDIOC_DQEVENT: error -2
[  143.729545] video0: VIDIOC_DQEVENT: error -2
[  143.733938] video0: VIDIOC_DQEVENT: error -2
[  143.739101] video0: VIDIOC_DQEVENT: error -2
[  143.744204] video0: VIDIOC_DQEVENT: error -2
[  143.748700] video0: VIDIOC_DQEVENT: error -2
[  143.753815] video0: VIDIOC_DQEVENT: error -2
[  143.758913] video0: VIDIOC_DQEVENT: error -2
[  143.764006] video0: VIDIOC_DQEVENT: error -2
[  143.768419] video0: VIDIOC_DQEVENT: error -2
[  143.773533] video0: VIDIOC_DQEVENT: error -2
[  143.778635] video0: VIDIOC_DQEVENT: error -2
[  143.783063] video0: VIDIOC_DQEVENT: error -2
[  143.788206] video0: VIDIOC_DQEVENT: error -2
[  143.793306] video0: VIDIOC_DQEVENT: error -2
[  143.797679] video0: VIDIOC_DQEVENT: error -2
[  143.802794] video0: VIDIOC_DQEVENT: error -2
[  143.807894] video0: VIDIOC_DQEVENT: error -2
[  143.812987] video0: VIDIOC_DQEVENT: error -2
[  143.817354] video0: VIDIOC_DQEVENT: error -2
[  143.822468] video0: VIDIOC_DQEVENT: error -2
[  143.827571] video0: VIDIOC_DQEVENT: error -2
[  143.831926] video0: VIDIOC_DQEVENT: error -2
[  143.837034] video0: VIDIOC_DQEVENT: error -2
[  143.842135] video0: VIDIOC_DQEVENT: error -2
[  143.847230] video0: VIDIOC_DQEVENT: error -2
[  143.851589] video0: VIDIOC_DQEVENT: error -2
[  143.856696] video0: VIDIOC_DQEVENT: error -2
[  143.861794] video0: VIDIOC_DQEVENT: error -2
[  143.866199] video0: VIDIOC_DQEVENT: error -2
[  143.871314] video0: VIDIOC_DQEVENT: error -2
[  143.876414] video0: VIDIOC_DQEVENT: error -2
[  143.881505] video0: VIDIOC_DQEVENT: error -2
[  143.885876] video0: VIDIOC_DQEVENT: error -2
[  143.890991] video0: VIDIOC_DQEVENT: error -2
[  143.896094] video0: VIDIOC_DQEVENT: error -2
[  143.900456] video0: VIDIOC_DQEVENT: error -2
[  143.905572] video0: VIDIOC_DQEVENT: error -2
[  143.910673] video0: VIDIOC_DQEVENT: error -2
[  143.915056] video0: VIDIOC_DQEVENT: error -2
[  143.920202] video0: VIDIOC_DQEVENT: error -2
[  143.925302] video0: VIDIOC_DQEVENT: error -2
[  143.930396] video0: VIDIOC_DQEVENT: error -2
[  143.934819] video0: VIDIOC_DQEVENT: error -2
[  143.939933] video0: VIDIOC_DQEVENT: error -2
[  143.945034] video0: VIDIOC_DQEVENT: error -2
[  143.949416] video0: VIDIOC_DQEVENT: error -2
[  143.954531] video0: VIDIOC_DQEVENT: error -2
[  143.959634] video0: VIDIOC_DQEVENT: error -2
[  143.964727] video0: VIDIOC_DQEVENT: error -2
[  143.969094] video0: VIDIOC_DQEVENT: error -2
[  143.974208] video0: VIDIOC_DQEVENT: error -2
[  143.979310] video0: VIDIOC_DQEVENT: error -2
[  143.983665] video0: VIDIOC_DQEVENT: error -2
[  143.988771] video0: VIDIOC_DQEVENT: error -2
[  143.993870] video0: VIDIOC_DQEVENT: error -2
[  143.998286] video0: VIDIOC_DQEVENT: error -2
[  144.003401] video0: VIDIOC_DQEVENT: error -2
[  144.008502] video0: VIDIOC_DQEVENT: error -2
[  144.013593] video0: VIDIOC_DQEVENT: error -2
[  144.018009] video0: VIDIOC_DQEVENT: error -2
[  144.023125] video0: VIDIOC_DQEVENT: error -2
[  144.028225] video0: VIDIOC_DQEVENT: error -2
[  144.032596] video0: VIDIOC_DQEVENT: error -2
[  144.037711] video0: VIDIOC_DQEVENT: error -2
[  144.042815] video0: VIDIOC_DQEVENT: error -2
[  144.047920] video0: VIDIOC_DQEVENT: error -2
[  144.052488] video0: VIDIOC_DQEVENT: error -2
[  144.057608] video0: VIDIOC_DQEVENT: error -2
[  144.062719] video0: VIDIOC_DQEVENT: error -2
[  144.067147] video0: VIDIOC_DQEVENT: error -2
[  144.072260] video0: VIDIOC_DQEVENT: error -2
[  144.077360] video0: VIDIOC_DQEVENT: error -2
[  144.081751] video0: VIDIOC_DQEVENT: error -2
[  144.086866] video0: VIDIOC_DQEVENT: error -2
[  144.091968] video0: VIDIOC_DQEVENT: error -2
[  144.097059] video0: VIDIOC_DQEVENT: error -2
[  144.101460] video0: VIDIOC_DQEVENT: error -2
[  144.106575] video0: VIDIOC_DQEVENT: error -2
[  144.111678] video0: VIDIOC_DQEVENT: error -2
[  144.116056] video0: VIDIOC_DQEVENT: error -2
[  144.121165] video0: VIDIOC_DQEVENT: error -2
[  144.126267] video0: VIDIOC_DQEVENT: error -2
[  144.131360] video0: VIDIOC_DQEVENT: error -2
[  144.135719] video0: VIDIOC_DQEVENT: error -2
[  144.140828] video0: VIDIOC_DQEVENT: error -2
[  144.145926] video0: VIDIOC_DQEVENT: error -2
[  144.150342] video0: VIDIOC_DQEVENT: error -2
[  144.155457] video0: VIDIOC_DQEVENT: error -2
[  144.160559] video0: VIDIOC_DQEVENT: error -2
[  144.164940] video0: VIDIOC_DQEVENT: error -2
[  144.170054] video0: VIDIOC_DQEVENT: error -2
[  144.175155] video0: VIDIOC_DQEVENT: error -2
[  144.180248] video0: VIDIOC_DQEVENT: error -2
[  144.184625] video0: VIDIOC_DQEVENT: error -2
[  144.189739] video0: VIDIOC_DQEVENT: error -2
[  144.194840] video0: VIDIOC_DQEVENT: error -2
[  144.199231] video0: VIDIOC_DQEVENT: error -2
[  144.204348] video0: VIDIOC_DQEVENT: error -2
[  144.209451] video0: VIDIOC_DQEVENT: error -2
[  144.214543] video0: VIDIOC_DQEVENT: error -2
[  144.218937] video0: VIDIOC_DQEVENT: error -2
[  144.224053] video0: VIDIOC_DQEVENT: error -2
[  144.229154] video0: VIDIOC_DQEVENT: error -2
[  144.233544] video0: VIDIOC_DQEVENT: error -2
[  144.238657] video0: VIDIOC_DQEVENT: error -2
[  144.243758] video0: VIDIOC_DQEVENT: error -2
[  144.248139] video0: VIDIOC_DQEVENT: error -2
[  144.253249] video0: VIDIOC_DQEVENT: error -2
[  144.258348] video0: VIDIOC_DQEVENT: error -2
[  144.263441] video0: VIDIOC_DQEVENT: error -2
[  144.267817] video0: VIDIOC_DQEVENT: error -2
[  144.272924] video0: VIDIOC_DQEVENT: error -2
[  144.278028] video0: VIDIOC_DQEVENT: error -2
[  144.282458] video0: VIDIOC_DQEVENT: error -2
[  144.287574] video0: VIDIOC_DQEVENT: error -2
[  144.287710] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  144.292682] video0: VIDIOC_DQEVENT: error -2
[  144.297796] video0: VIDIOC_DQEVENT: error -2
[  144.302239] video0: VIDIOC_DQEVENT: error -2
[  144.307357] video0: VIDIOC_DQEVENT: error -2
[  144.312461] video0: VIDIOC_DQEVENT: error -2
[  144.316837] video0: VIDIOC_DQEVENT: error -2
[  144.321952] video0: VIDIOC_DQEVENT: error -2
[  144.327054] video0: VIDIOC_DQEVENT: error -2
[  144.331434] video0: VIDIOC_DQEVENT: error -2
[  144.336548] video0: VIDIOC_DQEVENT: error -2
[  144.341649] video0: VIDIOC_DQEVENT: error -2
[  144.346739] video0: VIDIOC_DQEVENT: error -2
[  144.351156] video0: VIDIOC_DQEVENT: error -2
[  144.356271] video0: VIDIOC_DQEVENT: error -2
[  144.361371] video0: VIDIOC_DQEVENT: error -2
[  144.365757] video0: VIDIOC_DQEVENT: error -2
[  144.370871] video0: VIDIOC_DQEVENT: error -2
[  144.375972] video0: VIDIOC_DQEVENT: error -2
[  144.381066] video0: VIDIOC_DQEVENT: error -2
[  144.385499] video0: VIDIOC_DQEVENT: error -2
[  144.390615] video0: VIDIOC_DQEVENT: error -2
[  144.395720] video0: VIDIOC_DQEVENT: error -2
[  144.400092] video0: VIDIOC_DQEVENT: error -2
[  144.405202] video0: VIDIOC_DQEVENT: error -2
[  144.410302] video0: VIDIOC_DQEVENT: error -2
[  144.414748] video0: VIDIOC_DQEVENT: error -2
[  144.419863] video0: VIDIOC_DQEVENT: error -2
[  144.424967] video0: VIDIOC_DQEVENT: error -2
[  144.430060] video0: VIDIOC_DQEVENT: error -2
[  144.434511] video0: VIDIOC_DQEVENT: error -2
[  144.439625] video0: VIDIOC_DQEVENT: error -2
[  144.444728] video0: VIDIOC_DQEVENT: error -2
[  144.449121] video0: VIDIOC_DQEVENT: error -2
[  144.454237] video0: VIDIOC_DQEVENT: error -2
[  144.459343] video0: VIDIOC_DQEVENT: error -2
[  144.464438] video0: VIDIOC_DQEVENT: error -2
[  144.468818] video0: VIDIOC_DQEVENT: error -2
[  144.473934] video0: VIDIOC_DQEVENT: error -2
[  144.479036] video0: VIDIOC_DQEVENT: error -2
[  144.483467] video0: VIDIOC_DQEVENT: error -2
[  144.488582] video0: VIDIOC_DQEVENT: error -2
[  144.493685] video0: VIDIOC_DQEVENT: error -2
[  144.498096] video0: VIDIOC_DQEVENT: error -2
[  144.503211] video0: VIDIOC_DQEVENT: error -2
[  144.508313] video0: VIDIOC_DQEVENT: error -2
[  144.513405] video0: VIDIOC_DQEVENT: error -2
[  144.517791] video0: VIDIOC_DQEVENT: error -2
[  144.522906] video0: VIDIOC_DQEVENT: error -2
[  144.528007] video0: VIDIOC_DQEVENT: error -2
[  144.532389] video0: VIDIOC_DQEVENT: error -2
[  144.537507] video0: VIDIOC_DQEVENT: error -2
[  144.542608] video0: VIDIOC_DQEVENT: error -2
[  144.547703] video0: VIDIOC_DQEVENT: error -2
[  144.552100] video0: VIDIOC_DQEVENT: error -2
[  144.557210] video0: VIDIOC_DQEVENT: error -2
[  144.562310] video0: VIDIOC_DQEVENT: error -2
[  144.566736] video0: VIDIOC_DQEVENT: error -2
[  144.571851] video0: VIDIOC_DQEVENT: error -2
[  144.576953] video0: VIDIOC_DQEVENT: error -2
[  144.581344] video0: VIDIOC_DQEVENT: error -2
[  144.586459] video0: VIDIOC_DQEVENT: error -2
[  144.591558] video0: VIDIOC_DQEVENT: error -2
[  144.596650] video0: VIDIOC_DQEVENT: error -2
[  144.601034] video0: VIDIOC_DQEVENT: error -2
[  144.606148] video0: VIDIOC_DQEVENT: error -2
[  144.611250] video0: VIDIOC_DQEVENT: error -2
[  144.615625] video0: VIDIOC_DQEVENT: error -2
[  144.620732] video0: VIDIOC_DQEVENT: error -2
[  144.625832] video0: VIDIOC_DQEVENT: error -2
[  144.630938] video0: VIDIOC_DQEVENT: error -2
[  144.635492] video0: VIDIOC_DQEVENT: error -2
[  144.640607] video0: VIDIOC_DQEVENT: error -2
[  144.645714] video0: VIDIOC_DQEVENT: error -2
[  144.650155] video0: VIDIOC_DQEVENT: error -2
[  144.655273] video0: VIDIOC_DQEVENT: error -2
[  144.660376] video0: VIDIOC_DQEVENT: error -2
[  144.664769] video0: VIDIOC_DQEVENT: error -2
[  144.669883] video0: VIDIOC_DQEVENT: error -2
[  144.674986] video0: VIDIOC_DQEVENT: error -2
[  144.680081] video0: VIDIOC_DQEVENT: error -2
[  144.684457] video0: VIDIOC_DQEVENT: error -2
[  144.689574] video0: VIDIOC_DQEVENT: error -2
[  144.694676] video0: VIDIOC_DQEVENT: error -2
[  144.699112] video0: VIDIOC_DQEVENT: error -2
[  144.704231] video0: VIDIOC_DQEVENT: error -2
[  144.709334] video0: VIDIOC_DQEVENT: error -2
[  144.714427] video0: VIDIOC_DQEVENT: error -2
[  144.718859] video0: VIDIOC_DQEVENT: error -2
[  144.723978] video0: VIDIOC_DQEVENT: error -2
[  144.729081] video0: VIDIOC_DQEVENT: error -2
[  144.733460] video0: VIDIOC_DQEVENT: error -2
[  144.738575] video0: VIDIOC_DQEVENT: error -2
[  144.743678] video0: VIDIOC_DQEVENT: error -2
[  144.748058] video0: VIDIOC_DQEVENT: error -2
[  144.753166] video0: VIDIOC_DQEVENT: error -2
[  144.758270] video0: VIDIOC_DQEVENT: error -2
[  144.763365] video0: VIDIOC_DQEVENT: error -2
[  144.767734] video0: VIDIOC_DQEVENT: error -2
[  144.772842] video0: VIDIOC_DQEVENT: error -2
[  144.777942] video0: VIDIOC_DQEVENT: error -2
[  144.782370] video0: VIDIOC_DQEVENT: error -2
[  144.787485] video0: VIDIOC_DQEVENT: error -2
[  144.792586] video0: VIDIOC_DQEVENT: error -2
[  144.797677] video0: VIDIOC_DQEVENT: error -2
[  144.802070] video0: VIDIOC_DQEVENT: error -2
[  144.807186] video0: VIDIOC_DQEVENT: error -2
[  144.812290] video0: VIDIOC_DQEVENT: error -2
[  144.816672] video0: VIDIOC_DQEVENT: error -2
[  144.821788] video0: VIDIOC_DQEVENT: error -2
[  144.826890] video0: VIDIOC_DQEVENT: error -2
[  144.831324] video0: VIDIOC_DQEVENT: error -2
[  144.836439] video0: VIDIOC_DQEVENT: error -2
[  144.841542] video0: VIDIOC_DQEVENT: error -2
[  144.846636] video0: VIDIOC_DQEVENT: error -2
[  144.851073] video0: VIDIOC_DQEVENT: error -2
[  144.856219] video0: VIDIOC_DQEVENT: error -2
[  144.861320] video0: VIDIOC_DQEVENT: error -2
[  144.865705] video0: VIDIOC_DQEVENT: error -2
[  144.870822] video0: VIDIOC_DQEVENT: error -2
[  144.875923] video0: VIDIOC_DQEVENT: error -2
[  144.881015] video0: VIDIOC_DQEVENT: error -2
[  144.885396] video0: VIDIOC_DQEVENT: error -2
[  144.890511] video0: VIDIOC_DQEVENT: error -2
[  144.895611] video0: VIDIOC_DQEVENT: error -2
[  144.899963] video0: VIDIOC_DQEVENT: error -2
[  144.905072] video0: VIDIOC_DQEVENT: error -2
[  144.910173] video0: VIDIOC_DQEVENT: error -2
[  144.914598] video0: VIDIOC_DQEVENT: error -2
[  144.919716] video0: VIDIOC_DQEVENT: error -2
[  144.924817] video0: VIDIOC_DQEVENT: error -2
[  144.929910] video0: VIDIOC_DQEVENT: error -2
[  144.934336] video0: VIDIOC_DQEVENT: error -2
[  144.939450] video0: VIDIOC_DQEVENT: error -2
[  144.944550] video0: VIDIOC_DQEVENT: error -2
[  144.948942] video0: VIDIOC_DQEVENT: error -2
[  144.954057] video0: VIDIOC_DQEVENT: error -2
[  144.959160] video0: VIDIOC_DQEVENT: error -2
[  144.964254] video0: VIDIOC_DQEVENT: error -2
[  144.968635] video0: VIDIOC_DQEVENT: error -2
[  144.973749] video0: VIDIOC_DQEVENT: error -2
[  144.978850] video0: VIDIOC_DQEVENT: error -2
[  144.983251] video0: VIDIOC_DQEVENT: error -2
[  144.988365] video0: VIDIOC_DQEVENT: error -2
[  144.993465] video0: VIDIOC_DQEVENT: error -2
[  144.997852] video0: VIDIOC_DQEVENT: error -2
[  145.002966] video0: VIDIOC_DQEVENT: error -2
[  145.008067] video0: VIDIOC_DQEVENT: error -2
[  145.013160] video0: VIDIOC_DQEVENT: error -2
[  145.017535] video0: VIDIOC_DQEVENT: error -2
[  145.022652] video0: VIDIOC_DQEVENT: error -2
[  145.027754] video0: VIDIOC_DQEVENT: error -2
[  145.032133] video0: VIDIOC_DQEVENT: error -2
[  145.037243] video0: VIDIOC_DQEVENT: error -2
[  145.042346] video0: VIDIOC_DQEVENT: error -2
[  145.047442] video0: VIDIOC_DQEVENT: error -2
[  145.051813] video0: VIDIOC_DQEVENT: error -2
[  145.056922] video0: VIDIOC_DQEVENT: error -2
[  145.062024] video0: VIDIOC_DQEVENT: error -2
[  145.066450] video0: VIDIOC_DQEVENT: error -2
[  145.071567] video0: VIDIOC_DQEVENT: error -2
[  145.076670] video0: VIDIOC_DQEVENT: error -2
[  145.081054] video0: VIDIOC_DQEVENT: error -2
[  145.086168] video0: VIDIOC_DQEVENT: error -2
[  145.091269] video0: VIDIOC_DQEVENT: error -2
[  145.096363] video0: VIDIOC_DQEVENT: error -2
[  145.100744] video0: VIDIOC_DQEVENT: error -2
[  145.105860] video0: VIDIOC_DQEVENT: error -2
[  145.110961] video0: VIDIOC_DQEVENT: error -2
[  145.115339] video0: VIDIOC_DQEVENT: error -2
[  145.120454] video0: VIDIOC_DQEVENT: error -2
[  145.125556] video0: VIDIOC_DQEVENT: error -2
[  145.130652] video0: VIDIOC_DQEVENT: error -2
[  145.135177] video0: VIDIOC_DQEVENT: error -2
[  145.140292] video0: VIDIOC_DQEVENT: error -2
[  145.145397] video0: VIDIOC_DQEVENT: error -2
[  145.149820] video0: VIDIOC_DQEVENT: error -2
[  145.154935] video0: VIDIOC_DQEVENT: error -2
[  145.160035] video0: VIDIOC_DQEVENT: error -2
[  145.164408] video0: VIDIOC_DQEVENT: error -2
[  145.169525] video0: VIDIOC_DQEVENT: error -2
[  145.174628] video0: VIDIOC_DQEVENT: error -2
[  145.179722] video0: VIDIOC_DQEVENT: error -2
[  145.184101] video0: VIDIOC_DQEVENT: error -2
[  145.189211] video0: VIDIOC_DQEVENT: error -2
[  145.194311] video0: VIDIOC_DQEVENT: error -2
[  145.198738] video0: VIDIOC_DQEVENT: error -2
[  145.203854] video0: VIDIOC_DQEVENT: error -2
[  145.208956] video0: VIDIOC_DQEVENT: error -2
[  145.214049] video0: VIDIOC_DQEVENT: error -2
[  145.218467] video0: VIDIOC_DQEVENT: error -2
[  145.223583] video0: VIDIOC_DQEVENT: error -2
[  145.228685] video0: VIDIOC_DQEVENT: error -2
[  145.233055] video0: VIDIOC_DQEVENT: error -2
[  145.238172] video0: VIDIOC_DQEVENT: error -2
[  145.243273] video0: VIDIOC_DQEVENT: error -2
[  145.247635] video0: VIDIOC_DQEVENT: error -2
[  145.252742] video0: VIDIOC_DQEVENT: error -2
[  145.257840] video0: VIDIOC_DQEVENT: error -2
[  145.262931] video0: VIDIOC_DQEVENT: error -2
[  145.267366] video0: VIDIOC_DQEVENT: error -2
[  145.272481] video0: VIDIOC_DQEVENT: error -2
[  145.277582] video0: VIDIOC_DQEVENT: error -2
[  145.281986] video0: VIDIOC_DQEVENT: error -2
[  145.287100] video0: VIDIOC_DQEVENT: error -2
[  145.292219] video0: VIDIOC_DQEVENT: error -2
[  145.297313] video0: VIDIOC_DQEVENT: error -2
[  145.301687] video0: VIDIOC_DQEVENT: error -2
[  145.306801] video0: VIDIOC_DQEVENT: error -2
[  145.311748] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  145.311903] video0: VIDIOC_DQEVENT: error -2
[  145.316273] video0: VIDIOC_DQEVENT: error -2
[  145.321383] video0: VIDIOC_DQEVENT: error -2
[  145.326482] video0: VIDIOC_DQEVENT: error -2
[  145.331575] video0: VIDIOC_DQEVENT: error -2
[  145.335961] video0: VIDIOC_DQEVENT: error -2
[  145.341069] video0: VIDIOC_DQEVENT: error -2
[  145.346167] video0: VIDIOC_DQEVENT: error -2
[  145.350582] video0: VIDIOC_DQEVENT: error -2
[  145.355698] video0: VIDIOC_DQEVENT: error -2
[  145.360800] video0: VIDIOC_DQEVENT: error -2
[  145.365190] video0: VIDIOC_DQEVENT: error -2
[  145.370305] video0: VIDIOC_DQEVENT: error -2
[  145.375407] video0: VIDIOC_DQEVENT: error -2
[  145.380500] video0: VIDIOC_DQEVENT: error -2
[  145.384850] video0: VIDIOC_DQEVENT: error -2
[  145.389967] video0: VIDIOC_DQEVENT: error -2
[  145.395067] video0: VIDIOC_DQEVENT: error -2
[  145.399459] video0: VIDIOC_DQEVENT: error -2
[  145.404572] video0: VIDIOC_DQEVENT: error -2
[  145.409673] video0: VIDIOC_DQEVENT: error -2
[  145.414767] video0: VIDIOC_DQEVENT: error -2
[  145.419162] video0: VIDIOC_DQEVENT: error -2
[  145.424281] video0: VIDIOC_DQEVENT: error -2
[  145.429382] video0: VIDIOC_DQEVENT: error -2
[  145.433776] video0: VIDIOC_DQEVENT: error -2
[  145.438891] video0: VIDIOC_DQEVENT: error -2
[  145.443993] video0: VIDIOC_DQEVENT: error -2
[  145.448369] video0: VIDIOC_DQEVENT: error -2
[  145.453481] video0: VIDIOC_DQEVENT: error -2
[  145.458583] video0: VIDIOC_DQEVENT: error -2
[  145.463677] video0: VIDIOC_DQEVENT: error -2
[  145.468041] video0: VIDIOC_DQEVENT: error -2
[  145.473150] video0: VIDIOC_DQEVENT: error -2
[  145.478249] video0: VIDIOC_DQEVENT: error -2
[  145.482651] video0: VIDIOC_DQEVENT: error -2
[  145.487765] video0: VIDIOC_DQEVENT: error -2
[  145.492867] video0: VIDIOC_DQEVENT: error -2
[  145.497962] video0: VIDIOC_DQEVENT: error -2
[  145.502388] video0: VIDIOC_DQEVENT: error -2
[  145.507503] video0: VIDIOC_DQEVENT: error -2
[  145.512604] video0: VIDIOC_DQEVENT: error -2
[  145.516979] video0: VIDIOC_DQEVENT: error -2
[  145.522093] video0: VIDIOC_DQEVENT: error -2
[  145.527195] video0: VIDIOC_DQEVENT: error -2
[  145.531560] video0: VIDIOC_DQEVENT: error -2
[  145.536668] video0: VIDIOC_DQEVENT: error -2
[  145.541765] video0: VIDIOC_DQEVENT: error -2
[  145.546856] video0: VIDIOC_DQEVENT: error -2
[  145.551259] video0: VIDIOC_DQEVENT: error -2
[  145.556370] video0: VIDIOC_DQEVENT: error -2
[  145.561469] video0: VIDIOC_DQEVENT: error -2
[  145.565854] video0: VIDIOC_DQEVENT: error -2
[  145.570967] video0: VIDIOC_DQEVENT: error -2
[  145.576074] video0: VIDIOC_DQEVENT: error -2
[  145.581171] video0: VIDIOC_DQEVENT: error -2
[  145.585585] video0: VIDIOC_DQEVENT: error -2
[  145.590701] video0: VIDIOC_DQEVENT: error -2
[  145.595807] video0: VIDIOC_DQEVENT: error -2
[  145.600182] video0: VIDIOC_DQEVENT: error -2
[  145.605293] video0: VIDIOC_DQEVENT: error -2
[  145.610395] video0: VIDIOC_DQEVENT: error -2
[  145.614806] video0: VIDIOC_DQEVENT: error -2
[  145.619921] video0: VIDIOC_DQEVENT: error -2
[  145.625023] video0: VIDIOC_DQEVENT: error -2
[  145.630115] video0: VIDIOC_DQEVENT: error -2
[  145.634528] video0: VIDIOC_DQEVENT: error -2
[  145.639642] video0: VIDIOC_DQEVENT: error -2
[  145.644743] video0: VIDIOC_DQEVENT: error -2
[  145.649103] video0: VIDIOC_DQEVENT: error -2
[  145.654218] video0: VIDIOC_DQEVENT: error -2
[  145.659319] video0: VIDIOC_DQEVENT: error -2
[  145.664412] video0: VIDIOC_DQEVENT: error -2
[  145.668802] video0: VIDIOC_DQEVENT: error -2
[  145.673917] video0: VIDIOC_DQEVENT: error -2
[  145.679018] video0: VIDIOC_DQEVENT: error -2
[  145.683412] video0: VIDIOC_DQEVENT: error -2
[  145.688527] video0: VIDIOC_DQEVENT: error -2
[  145.693627] video0: VIDIOC_DQEVENT: error -2
[  145.698017] video0: VIDIOC_DQEVENT: error -2
[  145.703132] video0: VIDIOC_DQEVENT: error -2
[  145.708245] video0: VIDIOC_DQEVENT: error -2
[  145.713338] video0: VIDIOC_DQEVENT: error -2
[  145.717725] video0: VIDIOC_DQEVENT: error -2
[  145.722839] video0: VIDIOC_DQEVENT: error -2
[  145.727939] video0: VIDIOC_DQEVENT: error -2
[  145.732302] video0: VIDIOC_DQEVENT: error -2
[  145.737415] video0: VIDIOC_DQEVENT: error -2
[  145.742516] video0: VIDIOC_DQEVENT: error -2
[  145.747610] video0: VIDIOC_DQEVENT: error -2
[  145.751982] video0: VIDIOC_DQEVENT: error -2
[  145.757090] video0: VIDIOC_DQEVENT: error -2
[  145.762191] video0: VIDIOC_DQEVENT: error -2
[  145.766612] video0: VIDIOC_DQEVENT: error -2
[  145.771728] video0: VIDIOC_DQEVENT: error -2
[  145.776830] video0: VIDIOC_DQEVENT: error -2
[  145.781211] video0: VIDIOC_DQEVENT: error -2
[  145.786325] video0: VIDIOC_DQEVENT: error -2
[  145.791427] video0: VIDIOC_DQEVENT: error -2
[  145.796521] video0: VIDIOC_DQEVENT: error -2
[  145.800890] video0: VIDIOC_DQEVENT: error -2
[  145.806006] video0: VIDIOC_DQEVENT: error -2
[  145.811107] video0: VIDIOC_DQEVENT: error -2
[  145.815473] video0: VIDIOC_DQEVENT: error -2
[  145.820587] video0: VIDIOC_DQEVENT: error -2
[  145.825687] video0: VIDIOC_DQEVENT: error -2
[  145.830782] video0: VIDIOC_DQEVENT: error -2
[  145.835173] video0: VIDIOC_DQEVENT: error -2
[  145.840294] video0: VIDIOC_DQEVENT: error -2
[  145.845396] video0: VIDIOC_DQEVENT: error -2
[  145.849797] video0: VIDIOC_DQEVENT: error -2
[  145.854915] video0: VIDIOC_DQEVENT: error -2
[  145.860015] video0: VIDIOC_DQEVENT: error -2
[  145.864397] video0: VIDIOC_DQEVENT: error -2
[  145.869515] video0: VIDIOC_DQEVENT: error -2
[  145.874618] video0: VIDIOC_DQEVENT: error -2
[  145.879711] video0: VIDIOC_DQEVENT: error -2
[  145.884073] video0: VIDIOC_DQEVENT: error -2
[  145.889182] video0: VIDIOC_DQEVENT: error -2
[  145.894283] video0: VIDIOC_DQEVENT: error -2
[  145.898709] video0: VIDIOC_DQEVENT: error -2
[  145.903826] video0: VIDIOC_DQEVENT: error -2
[  145.908926] video0: VIDIOC_DQEVENT: error -2
[  145.914021] video0: VIDIOC_DQEVENT: error -2
[  145.918451] video0: VIDIOC_DQEVENT: error -2
[  145.923570] video0: VIDIOC_DQEVENT: error -2
[  145.928670] video0: VIDIOC_DQEVENT: error -2
[  145.933036] video0: VIDIOC_DQEVENT: error -2
[  145.938154] video0: VIDIOC_DQEVENT: error -2
[  145.943255] video0: VIDIOC_DQEVENT: error -2
[  145.948346] video0: VIDIOC_DQEVENT: error -2
[  145.952728] video0: VIDIOC_DQEVENT: error -2
[  145.957845] video0: VIDIOC_DQEVENT: error -2
[  145.962949] video0: VIDIOC_DQEVENT: error -2
[  145.967365] video0: VIDIOC_DQEVENT: error -2
[  145.972482] video0: VIDIOC_DQEVENT: error -2
[  145.977580] video0: VIDIOC_DQEVENT: error -2
[  145.981974] video0: VIDIOC_DQEVENT: error -2
[  145.987089] video0: VIDIOC_DQEVENT: error -2
[  145.992190] video0: VIDIOC_DQEVENT: error -2
[  145.997282] video0: VIDIOC_DQEVENT: error -2
[  146.001672] video0: VIDIOC_DQEVENT: error -2
[  146.006789] video0: VIDIOC_DQEVENT: error -2
[  146.011890] video0: VIDIOC_DQEVENT: error -2
[  146.016249] video0: VIDIOC_DQEVENT: error -2
[  146.021363] video0: VIDIOC_DQEVENT: error -2
[  146.026464] video0: VIDIOC_DQEVENT: error -2
[  146.031555] video0: VIDIOC_DQEVENT: error -2
[  146.035928] video0: VIDIOC_DQEVENT: error -2
[  146.041036] video0: VIDIOC_DQEVENT: error -2
[  146.046135] video0: VIDIOC_DQEVENT: error -2
[  146.050588] video0: VIDIOC_DQEVENT: error -2
[  146.055704] video0: VIDIOC_DQEVENT: error -2
[  146.060806] video0: VIDIOC_DQEVENT: error -2
[  146.065177] video0: VIDIOC_DQEVENT: error -2
[  146.070294] video0: VIDIOC_DQEVENT: error -2
[  146.075395] video0: VIDIOC_DQEVENT: error -2
[  146.080486] video0: VIDIOC_DQEVENT: error -2
[  146.084863] video0: VIDIOC_DQEVENT: error -2
[  146.089980] video0: VIDIOC_DQEVENT: error -2
[  146.095081] video0: VIDIOC_DQEVENT: error -2
[  146.099457] video0: VIDIOC_DQEVENT: error -2
[  146.104573] video0: VIDIOC_DQEVENT: error -2
[  146.109676] video0: VIDIOC_DQEVENT: error -2
[  146.114769] video0: VIDIOC_DQEVENT: error -2
[  146.119181] video0: VIDIOC_DQEVENT: error -2
[  146.124302] video0: VIDIOC_DQEVENT: error -2
[  146.129402] video0: VIDIOC_DQEVENT: error -2
[  146.133781] video0: VIDIOC_DQEVENT: error -2
[  146.138898] video0: VIDIOC_DQEVENT: error -2
[  146.143999] video0: VIDIOC_DQEVENT: error -2
[  146.148394] video0: VIDIOC_DQEVENT: error -2
[  146.153508] video0: VIDIOC_DQEVENT: error -2
[  146.158609] video0: VIDIOC_DQEVENT: error -2
[  146.163703] video0: VIDIOC_DQEVENT: error -2
[  146.168070] video0: VIDIOC_DQEVENT: error -2
[  146.173181] video0: VIDIOC_DQEVENT: error -2
[  146.178282] video0: VIDIOC_DQEVENT: error -2
[  146.182702] video0: VIDIOC_DQEVENT: error -2
[  146.187820] video0: VIDIOC_DQEVENT: error -2
[  146.192920] video0: VIDIOC_DQEVENT: error -2
[  146.198012] video0: VIDIOC_DQEVENT: error -2
[  146.202441] video0: VIDIOC_DQEVENT: error -2
[  146.207558] video0: VIDIOC_DQEVENT: error -2
[  146.212659] video0: VIDIOC_DQEVENT: error -2
[  146.217029] video0: VIDIOC_DQEVENT: error -2
[  146.222144] video0: VIDIOC_DQEVENT: error -2
[  146.227247] video0: VIDIOC_DQEVENT: error -2
[  146.231604] video0: VIDIOC_DQEVENT: error -2
[  146.236712] video0: VIDIOC_DQEVENT: error -2
[  146.241813] video0: VIDIOC_DQEVENT: error -2
[  146.246907] video0: VIDIOC_DQEVENT: error -2
[  146.251329] video0: VIDIOC_DQEVENT: error -2
[  146.256445] video0: VIDIOC_DQEVENT: error -2
[  146.261545] video0: VIDIOC_DQEVENT: error -2
[  146.265934] video0: VIDIOC_DQEVENT: error -2
[  146.271049] video0: VIDIOC_DQEVENT: error -2
[  146.276151] video0: VIDIOC_DQEVENT: error -2
[  146.281248] video0: VIDIOC_DQEVENT: error -2
[  146.285658] video0: VIDIOC_DQEVENT: error -2
[  146.290823] video0: VIDIOC_DQEVENT: error -2
[  146.295925] video0: VIDIOC_DQEVENT: error -2
[  146.300439] video0: VIDIOC_DQEVENT: error -2
[  146.305555] video0: VIDIOC_DQEVENT: error -2
[  146.310654] video0: VIDIOC_DQEVENT: error -2
[  146.315060] video0: VIDIOC_DQEVENT: error -2
[  146.320187] video0: VIDIOC_DQEVENT: error -2
[  146.325302] video0: VIDIOC_DQEVENT: error -2
[  146.330401] video0: VIDIOC_DQEVENT: error -2
[  146.335031] video0: VIDIOC_DQEVENT: error -2
[  146.335790] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  146.340199] video0: VIDIOC_DQEVENT: error -2
[  146.345310] video0: VIDIOC_DQEVENT: error -2
[  146.349945] video0: VIDIOC_DQEVENT: error -2
[  146.355083] video0: VIDIOC_DQEVENT: error -2
[  146.360193] video0: VIDIOC_DQEVENT: error -2
[  146.364886] video0: VIDIOC_DQEVENT: error -2
[  146.370006] video0: VIDIOC_DQEVENT: error -2
[  146.375114] video0: VIDIOC_DQEVENT: error -2
[  146.380216] video0: VIDIOC_DQEVENT: error -2
[  146.384825] video0: VIDIOC_DQEVENT: error -2
[  146.389947] video0: VIDIOC_DQEVENT: error -2
[  146.395057] video0: VIDIOC_DQEVENT: error -2
[  146.399598] video0: VIDIOC_DQEVENT: error -2
[  146.404714] video0: VIDIOC_DQEVENT: error -2
[  146.409820] video0: VIDIOC_DQEVENT: error -2
[  146.414914] video0: VIDIOC_DQEVENT: error -2
[  146.419401] video0: VIDIOC_DQEVENT: error -2
[  146.424533] video0: VIDIOC_DQEVENT: error -2
[  146.429634] video0: VIDIOC_DQEVENT: error -2
[  146.434098] video0: VIDIOC_DQEVENT: error -2
[  146.439211] video0: VIDIOC_DQEVENT: error -2
[  146.444315] video0: VIDIOC_DQEVENT: error -2
[  146.448765] video0: VIDIOC_DQEVENT: error -2
[  146.453899] video0: VIDIOC_DQEVENT: error -2
[  146.459003] video0: VIDIOC_DQEVENT: error -2
[  146.464099] video0: VIDIOC_DQEVENT: error -2
[  146.468586] video0: VIDIOC_DQEVENT: error -2
[  146.473717] video0: VIDIOC_DQEVENT: error -2
[  146.478823] video0: VIDIOC_DQEVENT: error -2
[  146.483287] video0: VIDIOC_DQEVENT: error -2
[  146.488418] video0: VIDIOC_DQEVENT: error -2
[  146.493520] video0: VIDIOC_DQEVENT: error -2
[  146.497982] video0: VIDIOC_DQEVENT: error -2
[  146.503110] video0: VIDIOC_DQEVENT: error -2
[  146.508213] video0: VIDIOC_DQEVENT: error -2
[  146.513309] video0: VIDIOC_DQEVENT: error -2
[  146.517789] video0: VIDIOC_DQEVENT: error -2
[  146.522903] video0: VIDIOC_DQEVENT: error -2
[  146.528003] video0: VIDIOC_DQEVENT: error -2
[  146.532440] video0: VIDIOC_DQEVENT: error -2
[  146.537554] video0: VIDIOC_DQEVENT: error -2
[  146.542656] video0: VIDIOC_DQEVENT: error -2
[  146.547751] video0: VIDIOC_DQEVENT: error -2
[  146.552210] video0: VIDIOC_DQEVENT: error -2
[  146.557319] video0: VIDIOC_DQEVENT: error -2
[  146.562422] video0: VIDIOC_DQEVENT: error -2
[  146.566873] video0: VIDIOC_DQEVENT: error -2
[  146.571990] video0: VIDIOC_DQEVENT: error -2
[  146.577092] video0: VIDIOC_DQEVENT: error -2
[  146.581528] video0: VIDIOC_DQEVENT: error -2
[  146.586642] video0: VIDIOC_DQEVENT: error -2
[  146.591745] video0: VIDIOC_DQEVENT: error -2
[  146.596842] video0: VIDIOC_DQEVENT: error -2
[  146.601312] video0: VIDIOC_DQEVENT: error -2
[  146.606427] video0: VIDIOC_DQEVENT: error -2
[  146.611532] video0: VIDIOC_DQEVENT: error -2
[  146.615961] video0: VIDIOC_DQEVENT: error -2
[  146.621069] video0: VIDIOC_DQEVENT: error -2
[  146.626173] video0: VIDIOC_DQEVENT: error -2
[  146.631267] video0: VIDIOC_DQEVENT: error -2
[  146.635709] video0: VIDIOC_DQEVENT: error -2
[  146.640816] video0: VIDIOC_DQEVENT: error -2
[  146.645912] video0: VIDIOC_DQEVENT: error -2
[  146.650374] video0: VIDIOC_DQEVENT: error -2
[  146.655488] video0: VIDIOC_DQEVENT: error -2
[  146.660590] video0: VIDIOC_DQEVENT: error -2
[  146.665039] video0: VIDIOC_DQEVENT: error -2
[  146.670154] video0: VIDIOC_DQEVENT: error -2
[  146.675255] video0: VIDIOC_DQEVENT: error -2
[  146.680348] video0: VIDIOC_DQEVENT: error -2
[  146.684806] video0: VIDIOC_DQEVENT: error -2
[  146.689920] video0: VIDIOC_DQEVENT: error -2
[  146.695021] video0: VIDIOC_DQEVENT: error -2
[  146.699494] video0: VIDIOC_DQEVENT: error -2
[  146.704608] video0: VIDIOC_DQEVENT: error -2
[  146.709711] video0: VIDIOC_DQEVENT: error -2
[  146.714804] video0: VIDIOC_DQEVENT: error -2
[  146.719263] video0: VIDIOC_DQEVENT: error -2
[  146.724377] video0: VIDIOC_DQEVENT: error -2
[  146.729477] video0: VIDIOC_DQEVENT: error -2
[  146.733926] video0: VIDIOC_DQEVENT: error -2
[  146.739040] video0: VIDIOC_DQEVENT: error -2
[  146.744144] video0: VIDIOC_DQEVENT: error -2
[  146.748578] video0: VIDIOC_DQEVENT: error -2
[  146.753691] video0: VIDIOC_DQEVENT: error -2
[  146.758793] video0: VIDIOC_DQEVENT: error -2
[  146.763887] video0: VIDIOC_DQEVENT: error -2
[  146.768328] video0: VIDIOC_DQEVENT: error -2
[  146.773440] video0: VIDIOC_DQEVENT: error -2
[  146.778542] video0: VIDIOC_DQEVENT: error -2
[  146.782992] video0: VIDIOC_DQEVENT: error -2
[  146.788108] video0: VIDIOC_DQEVENT: error -2
[  146.793213] video0: VIDIOC_DQEVENT: error -2
[  146.798310] video0: VIDIOC_DQEVENT: error -2
[  146.802763] video0: VIDIOC_DQEVENT: error -2
[  146.807878] video0: VIDIOC_DQEVENT: error -2
[  146.812980] video0: VIDIOC_DQEVENT: error -2
[  146.817797] video0: VIDIOC_DQEVENT: error -2
[  146.822915] video0: VIDIOC_DQEVENT: error -2
[  146.828026] video0: VIDIOC_DQEVENT: error -2
[  146.832562] video0: VIDIOC_DQEVENT: error -2
[  146.837677] video0: VIDIOC_DQEVENT: error -2
[  146.842781] video0: VIDIOC_DQEVENT: error -2
[  146.847875] video0: VIDIOC_DQEVENT: error -2
[  146.852364] video0: VIDIOC_DQEVENT: error -2
[  146.857479] video0: VIDIOC_DQEVENT: error -2
[  146.862583] video0: VIDIOC_DQEVENT: error -2
[  146.867044] video0: VIDIOC_DQEVENT: error -2
[  146.872160] video0: VIDIOC_DQEVENT: error -2
[  146.877262] video0: VIDIOC_DQEVENT: error -2
[  146.881707] video0: VIDIOC_DQEVENT: error -2
[  146.886823] video0: VIDIOC_DQEVENT: error -2
[  146.891928] video0: VIDIOC_DQEVENT: error -2
[  146.897022] video0: VIDIOC_DQEVENT: error -2
[  146.901464] video0: VIDIOC_DQEVENT: error -2
[  146.906579] video0: VIDIOC_DQEVENT: error -2
[  146.911681] video0: VIDIOC_DQEVENT: error -2
[  146.916123] video0: VIDIOC_DQEVENT: error -2
[  146.921233] video0: VIDIOC_DQEVENT: error -2
[  146.926334] video0: VIDIOC_DQEVENT: error -2
[  146.931427] video0: VIDIOC_DQEVENT: error -2
[  146.935868] video0: VIDIOC_DQEVENT: error -2
[  146.940975] video0: VIDIOC_DQEVENT: error -2
[  146.946075] video0: VIDIOC_DQEVENT: error -2
[  146.950566] video0: VIDIOC_DQEVENT: error -2
[  146.955683] video0: VIDIOC_DQEVENT: error -2
[  146.960784] video0: VIDIOC_DQEVENT: error -2
[  146.965207] video0: VIDIOC_DQEVENT: error -2
[  146.970322] video0: VIDIOC_DQEVENT: error -2
[  146.975423] video0: VIDIOC_DQEVENT: error -2
[  146.980517] video0: VIDIOC_DQEVENT: error -2
[  146.984969] video0: VIDIOC_DQEVENT: error -2
[  146.990083] video0: VIDIOC_DQEVENT: error -2
[  146.995184] video0: VIDIOC_DQEVENT: error -2
[  146.999608] video0: VIDIOC_DQEVENT: error -2
[  147.004716] video0: VIDIOC_DQEVENT: error -2
[  147.009815] video0: VIDIOC_DQEVENT: error -2
[  147.014909] video0: VIDIOC_DQEVENT: error -2
[  147.019382] video0: VIDIOC_DQEVENT: error -2
[  147.024494] video0: VIDIOC_DQEVENT: error -2
[  147.029594] video0: VIDIOC_DQEVENT: error -2
[  147.034045] video0: VIDIOC_DQEVENT: error -2
[  147.039159] video0: VIDIOC_DQEVENT: error -2
[  147.044278] video0: VIDIOC_DQEVENT: error -2
[  147.048730] video0: VIDIOC_DQEVENT: error -2
[  147.053843] video0: VIDIOC_DQEVENT: error -2
[  147.058943] video0: VIDIOC_DQEVENT: error -2
[  147.064039] video0: VIDIOC_DQEVENT: error -2
[  147.068482] video0: VIDIOC_DQEVENT: error -2
[  147.073604] video0: VIDIOC_DQEVENT: error -2
[  147.078707] video0: VIDIOC_DQEVENT: error -2
[  147.083146] video0: VIDIOC_DQEVENT: error -2
[  147.088288] video0: VIDIOC_DQEVENT: error -2
[  147.093392] video0: VIDIOC_DQEVENT: error -2
[  147.097816] video0: VIDIOC_DQEVENT: error -2
[  147.102938] video0: VIDIOC_DQEVENT: error -2
[  147.108037] video0: VIDIOC_DQEVENT: error -2
[  147.113131] video0: VIDIOC_DQEVENT: error -2
[  147.117589] video0: VIDIOC_DQEVENT: error -2
[  147.122703] video0: VIDIOC_DQEVENT: error -2
[  147.127805] video0: VIDIOC_DQEVENT: error -2
[  147.132249] video0: VIDIOC_DQEVENT: error -2
[  147.137358] video0: VIDIOC_DQEVENT: error -2
[  147.142462] video0: VIDIOC_DQEVENT: error -2
[  147.147557] video0: VIDIOC_DQEVENT: error -2
[  147.152387] video0: VIDIOC_DQEVENT: error -2
[  147.157501] video0: VIDIOC_DQEVENT: error -2
[  147.162606] video0: VIDIOC_DQEVENT: error -2
[  147.167085] video0: VIDIOC_DQEVENT: error -2
[  147.172202] video0: VIDIOC_DQEVENT: error -2
[  147.177306] video0: VIDIOC_DQEVENT: error -2
[  147.181738] video0: VIDIOC_DQEVENT: error -2
[  147.186851] video0: VIDIOC_DQEVENT: error -2
[  147.191951] video0: VIDIOC_DQEVENT: error -2
[  147.197044] video0: VIDIOC_DQEVENT: error -2
[  147.201478] video0: VIDIOC_DQEVENT: error -2
[  147.206593] video0: VIDIOC_DQEVENT: error -2
[  147.211695] video0: VIDIOC_DQEVENT: error -2
[  147.216107] video0: VIDIOC_DQEVENT: error -2
[  147.221216] video0: VIDIOC_DQEVENT: error -2
[  147.226317] video0: VIDIOC_DQEVENT: error -2
[  147.231410] video0: VIDIOC_DQEVENT: error -2
[  147.235843] video0: VIDIOC_DQEVENT: error -2
[  147.240949] video0: VIDIOC_DQEVENT: error -2
[  147.246049] video0: VIDIOC_DQEVENT: error -2
[  147.250534] video0: VIDIOC_DQEVENT: error -2
[  147.255649] video0: VIDIOC_DQEVENT: error -2
[  147.260753] video0: VIDIOC_DQEVENT: error -2
[  147.265195] video0: VIDIOC_DQEVENT: error -2
[  147.270308] video0: VIDIOC_DQEVENT: error -2
[  147.275410] video0: VIDIOC_DQEVENT: error -2
[  147.280504] video0: VIDIOC_DQEVENT: error -2
[  147.284957] video0: VIDIOC_DQEVENT: error -2
[  147.290072] video0: VIDIOC_DQEVENT: error -2
[  147.295175] video0: VIDIOC_DQEVENT: error -2
[  147.299614] video0: VIDIOC_DQEVENT: error -2
[  147.304728] video0: VIDIOC_DQEVENT: error -2
[  147.309830] video0: VIDIOC_DQEVENT: error -2
[  147.314923] video0: VIDIOC_DQEVENT: error -2
[  147.319537] video0: VIDIOC_DQEVENT: error -2
[  147.324653] video0: VIDIOC_DQEVENT: error -2
[  147.329755] video0: VIDIOC_DQEVENT: error -2
[  147.334203] video0: VIDIOC_DQEVENT: error -2
[  147.339317] video0: VIDIOC_DQEVENT: error -2
[  147.344420] video0: VIDIOC_DQEVENT: error -2
[  147.348858] video0: VIDIOC_DQEVENT: error -2
[  147.353971] video0: VIDIOC_DQEVENT: error -2
[  147.359074] video0: VIDIOC_DQEVENT: error -2
[  147.359836] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  147.364171] video0: VIDIOC_DQEVENT: error -2
[  147.368644] video0: VIDIOC_DQEVENT: error -2
[  147.373758] video0: VIDIOC_DQEVENT: error -2
[  147.378862] video0: VIDIOC_DQEVENT: error -2
[  147.383279] video0: VIDIOC_DQEVENT: error -2
[  147.388393] video0: VIDIOC_DQEVENT: error -2
[  147.393500] video0: VIDIOC_DQEVENT: error -2
[  147.397943] video0: VIDIOC_DQEVENT: error -2
[  147.403058] video0: VIDIOC_DQEVENT: error -2
[  147.408161] video0: VIDIOC_DQEVENT: error -2
[  147.413255] video0: VIDIOC_DQEVENT: error -2
[  147.417700] video0: VIDIOC_DQEVENT: error -2
[  147.422814] video0: VIDIOC_DQEVENT: error -2
[  147.427916] video0: VIDIOC_DQEVENT: error -2
[  147.432325] video0: VIDIOC_DQEVENT: error -2
[  147.437437] video0: VIDIOC_DQEVENT: error -2
[  147.442538] video0: VIDIOC_DQEVENT: error -2
[  147.447635] video0: VIDIOC_DQEVENT: error -2
[  147.452088] video0: VIDIOC_DQEVENT: error -2
[  147.457197] video0: VIDIOC_DQEVENT: error -2
[  147.462300] video0: VIDIOC_DQEVENT: error -2
[  147.466770] video0: VIDIOC_DQEVENT: error -2
[  147.471887] video0: VIDIOC_DQEVENT: error -2
[  147.476990] video0: VIDIOC_DQEVENT: error -2
[  147.481422] video0: VIDIOC_DQEVENT: error -2
[  147.486536] video0: VIDIOC_DQEVENT: error -2
[  147.491637] video0: VIDIOC_DQEVENT: error -2
[  147.496731] video0: VIDIOC_DQEVENT: error -2
[  147.501181] video0: VIDIOC_DQEVENT: error -2
[  147.506295] video0: VIDIOC_DQEVENT: error -2
[  147.511400] video0: VIDIOC_DQEVENT: error -2
[  147.515822] video0: VIDIOC_DQEVENT: error -2
[  147.520928] video0: VIDIOC_DQEVENT: error -2
[  147.526028] video0: VIDIOC_DQEVENT: error -2
[  147.531120] video0: VIDIOC_DQEVENT: error -2
[  147.535607] video0: VIDIOC_DQEVENT: error -2
[  147.540723] video0: VIDIOC_DQEVENT: error -2
[  147.545826] video0: VIDIOC_DQEVENT: error -2
[  147.550279] video0: VIDIOC_DQEVENT: error -2
[  147.555397] video0: VIDIOC_DQEVENT: error -2
[  147.560498] video0: VIDIOC_DQEVENT: error -2
[  147.564929] video0: VIDIOC_DQEVENT: error -2
[  147.570044] video0: VIDIOC_DQEVENT: error -2
[  147.575147] video0: VIDIOC_DQEVENT: error -2
[  147.580242] video0: VIDIOC_DQEVENT: error -2
[  147.584678] video0: VIDIOC_DQEVENT: error -2
[  147.589794] video0: VIDIOC_DQEVENT: error -2
[  147.594898] video0: VIDIOC_DQEVENT: error -2
[  147.599350] video0: VIDIOC_DQEVENT: error -2
[  147.604464] video0: VIDIOC_DQEVENT: error -2
[  147.609564] video0: VIDIOC_DQEVENT: error -2
[  147.614655] video0: VIDIOC_DQEVENT: error -2
[  147.619150] video0: VIDIOC_DQEVENT: error -2
[  147.624268] video0: VIDIOC_DQEVENT: error -2
[  147.629371] video0: VIDIOC_DQEVENT: error -2
[  147.633822] video0: VIDIOC_DQEVENT: error -2
[  147.638936] video0: VIDIOC_DQEVENT: error -2
[  147.644039] video0: VIDIOC_DQEVENT: error -2
[  147.648446] video0: VIDIOC_DQEVENT: error -2
[  147.653559] video0: VIDIOC_DQEVENT: error -2
[  147.658660] video0: VIDIOC_DQEVENT: error -2
[  147.663755] video0: VIDIOC_DQEVENT: error -2
[  147.668200] video0: VIDIOC_DQEVENT: error -2
[  147.673310] video0: VIDIOC_DQEVENT: error -2
[  147.678412] video0: VIDIOC_DQEVENT: error -2
[  147.682876] video0: VIDIOC_DQEVENT: error -2
[  147.687991] video0: VIDIOC_DQEVENT: error -2
[  147.693093] video0: VIDIOC_DQEVENT: error -2
[  147.698185] video0: VIDIOC_DQEVENT: error -2
[  147.702673] video0: VIDIOC_DQEVENT: error -2
[  147.707788] video0: VIDIOC_DQEVENT: error -2
[  147.712889] video0: VIDIOC_DQEVENT: error -2
[  147.717321] video0: VIDIOC_DQEVENT: error -2
[  147.722436] video0: VIDIOC_DQEVENT: error -2
[  147.727540] video0: VIDIOC_DQEVENT: error -2
[  147.731955] video0: VIDIOC_DQEVENT: error -2
[  147.737061] video0: VIDIOC_DQEVENT: error -2
[  147.742161] video0: VIDIOC_DQEVENT: error -2
[  147.747255] video0: VIDIOC_DQEVENT: error -2
[  147.751689] video0: VIDIOC_DQEVENT: error -2
[  147.756796] video0: VIDIOC_DQEVENT: error -2
[  147.761894] video0: VIDIOC_DQEVENT: error -2
[  147.766356] video0: VIDIOC_DQEVENT: error -2
[  147.771470] video0: VIDIOC_DQEVENT: error -2
[  147.776570] video0: VIDIOC_DQEVENT: error -2
[  147.781662] video0: VIDIOC_DQEVENT: error -2
[  147.786134] video0: VIDIOC_DQEVENT: error -2
[  147.791249] video0: VIDIOC_DQEVENT: error -2
[  147.796351] video0: VIDIOC_DQEVENT: error -2
[  147.800789] video0: VIDIOC_DQEVENT: error -2
[  147.805903] video0: VIDIOC_DQEVENT: error -2
[  147.811003] video0: VIDIOC_DQEVENT: error -2
[  147.815433] video0: VIDIOC_DQEVENT: error -2
[  147.820553] video0: VIDIOC_DQEVENT: error -2
[  147.825665] video0: VIDIOC_DQEVENT: error -2
[  147.830760] video0: VIDIOC_DQEVENT: error -2
[  147.835218] video0: VIDIOC_DQEVENT: error -2
[  147.840356] video0: VIDIOC_DQEVENT: error -2
[  147.845459] video0: VIDIOC_DQEVENT: error -2
[  147.849876] video0: VIDIOC_DQEVENT: error -2
[  147.854991] video0: VIDIOC_DQEVENT: error -2
[  147.860094] video0: VIDIOC_DQEVENT: error -2
[  147.864536] video0: VIDIOC_DQEVENT: error -2
[  147.869652] video0: VIDIOC_DQEVENT: error -2
[  147.874754] video0: VIDIOC_DQEVENT: error -2
[  147.879849] video0: VIDIOC_DQEVENT: error -2
[  147.884289] video0: VIDIOC_DQEVENT: error -2
[  147.889399] video0: VIDIOC_DQEVENT: error -2
[  147.894501] video0: VIDIOC_DQEVENT: error -2
[  147.898962] video0: VIDIOC_DQEVENT: error -2
[  147.904076] video0: VIDIOC_DQEVENT: error -2
[  147.909182] video0: VIDIOC_DQEVENT: error -2
[  147.914277] video0: VIDIOC_DQEVENT: error -2
[  147.918780] video0: VIDIOC_DQEVENT: error -2
[  147.923895] video0: VIDIOC_DQEVENT: error -2
[  147.928996] video0: VIDIOC_DQEVENT: error -2
[  147.933429] video0: VIDIOC_DQEVENT: error -2
[  147.938542] video0: VIDIOC_DQEVENT: error -2
[  147.943644] video0: VIDIOC_DQEVENT: error -2
[  147.948075] video0: VIDIOC_DQEVENT: error -2
[  147.953184] video0: VIDIOC_DQEVENT: error -2
[  147.958284] video0: VIDIOC_DQEVENT: error -2
[  147.963378] video0: VIDIOC_DQEVENT: error -2
[  147.967821] video0: VIDIOC_DQEVENT: error -2
[  147.972928] video0: VIDIOC_DQEVENT: error -2
[  147.978028] video0: VIDIOC_DQEVENT: error -2
[  147.982486] video0: VIDIOC_DQEVENT: error -2
[  147.987602] video0: VIDIOC_DQEVENT: error -2
[  147.992705] video0: VIDIOC_DQEVENT: error -2
[  147.997798] video0: VIDIOC_DQEVENT: error -2
[  148.002286] video0: VIDIOC_DQEVENT: error -2
[  148.007403] video0: VIDIOC_DQEVENT: error -2
[  148.012505] video0: VIDIOC_DQEVENT: error -2
[  148.016926] video0: VIDIOC_DQEVENT: error -2
[  148.022041] video0: VIDIOC_DQEVENT: error -2
[  148.027142] video0: VIDIOC_DQEVENT: error -2
[  148.031568] video0: VIDIOC_DQEVENT: error -2
[  148.036681] video0: VIDIOC_DQEVENT: error -2
[  148.041781] video0: VIDIOC_DQEVENT: error -2
[  148.046876] video0: VIDIOC_DQEVENT: error -2
[  148.051316] video0: VIDIOC_DQEVENT: error -2
[  148.056430] video0: VIDIOC_DQEVENT: error -2
[  148.061532] video0: VIDIOC_DQEVENT: error -2
[  148.065963] video0: VIDIOC_DQEVENT: error -2
[  148.071078] video0: VIDIOC_DQEVENT: error -2
[  148.076181] video0: VIDIOC_DQEVENT: error -2
[  148.081275] video0: VIDIOC_DQEVENT: error -2
[  148.085721] video0: VIDIOC_DQEVENT: error -2
[  148.090837] video0: VIDIOC_DQEVENT: error -2
[  148.095940] video0: VIDIOC_DQEVENT: error -2
[  148.100355] video0: VIDIOC_DQEVENT: error -2
[  148.105467] video0: VIDIOC_DQEVENT: error -2
[  148.110568] video0: VIDIOC_DQEVENT: error -2
[  148.115012] video0: VIDIOC_DQEVENT: error -2
[  148.120131] video0: VIDIOC_DQEVENT: error -2
[  148.125234] video0: VIDIOC_DQEVENT: error -2
[  148.130327] video0: VIDIOC_DQEVENT: error -2
[  148.134793] video0: VIDIOC_DQEVENT: error -2
[  148.139907] video0: VIDIOC_DQEVENT: error -2
[  148.145010] video0: VIDIOC_DQEVENT: error -2
[  148.149423] video0: VIDIOC_DQEVENT: error -2
[  148.154538] video0: VIDIOC_DQEVENT: error -2
[  148.159640] video0: VIDIOC_DQEVENT: error -2
[  148.164734] video0: VIDIOC_DQEVENT: error -2
[  148.169198] video0: VIDIOC_DQEVENT: error -2
[  148.174313] video0: VIDIOC_DQEVENT: error -2
[  148.179418] video0: VIDIOC_DQEVENT: error -2
[  148.183817] video0: VIDIOC_DQEVENT: error -2
[  148.188924] video0: VIDIOC_DQEVENT: error -2
[  148.194024] video0: VIDIOC_DQEVENT: error -2
[  148.198495] video0: VIDIOC_DQEVENT: error -2
[  148.203612] video0: VIDIOC_DQEVENT: error -2
[  148.208717] video0: VIDIOC_DQEVENT: error -2
[  148.213809] video0: VIDIOC_DQEVENT: error -2
[  148.218285] video0: VIDIOC_DQEVENT: error -2
[  148.223402] video0: VIDIOC_DQEVENT: error -2
[  148.228504] video0: VIDIOC_DQEVENT: error -2
[  148.232900] video0: VIDIOC_DQEVENT: error -2
[  148.238014] video0: VIDIOC_DQEVENT: error -2
[  148.243117] video0: VIDIOC_DQEVENT: error -2
[  148.248213] video0: VIDIOC_DQEVENT: error -2
[  148.252667] video0: VIDIOC_DQEVENT: error -2
[  148.257783] video0: VIDIOC_DQEVENT: error -2
[  148.262886] video0: VIDIOC_DQEVENT: error -2
[  148.267327] video0: VIDIOC_DQEVENT: error -2
[  148.272441] video0: VIDIOC_DQEVENT: error -2
[  148.277540] video0: VIDIOC_DQEVENT: error -2
[  148.282000] video0: VIDIOC_DQEVENT: error -2
[  148.287115] video0: VIDIOC_DQEVENT: error -2
[  148.292218] video0: VIDIOC_DQEVENT: error -2
[  148.297312] video0: VIDIOC_DQEVENT: error -2
[  148.302404] video0: VIDIOC_DQEVENT: error -2
[  148.307498] video0: VIDIOC_DQEVENT: error -2
[  148.312590] video0: VIDIOC_DQEVENT: error -2
[  148.317681] video0: VIDIOC_DQEVENT: error -2
[  148.322772] video0: VIDIOC_DQEVENT: error -2
[  148.327864] video0: VIDIOC_DQEVENT: error -2
[  148.332957] video0: VIDIOC_DQEVENT: error -2
[  148.338050] video0: VIDIOC_DQEVENT: error -2
[  148.343141] video0: VIDIOC_DQEVENT: error -2
[  148.348234] video0: VIDIOC_DQEVENT: error -2
[  148.353326] video0: VIDIOC_DQEVENT: error -2
[  148.358417] video0: VIDIOC_DQEVENT: error -2
[  148.363508] video0: VIDIOC_DQEVENT: error -2
[  148.368598] video0: VIDIOC_DQEVENT: error -2
[  148.373689] video0: VIDIOC_DQEVENT: error -2
[  148.378783] video0: VIDIOC_DQEVENT: error -2
[  148.383871] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[  148.383875] video0: VIDIOC_DQEVENT: error -2
[  148.386801] tc358743 10-000f: tc358743_reset_phy:
[  148.388970] video0: VIDIOC_DQEVENT: error -2
[  148.391153] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  148.392638] tc358743 10-000f: tc358743_format_change: No signal
[  148.394050] tc358743 10-000f: tc358743_hdmi_cbit_int_handler: Audio pres=
ent changed
[  148.394066] video0: VIDIOC_DQEVENT
[  148.412999] video0: VIDIOC_STREAMOFF
[  148.413618] video0: VIDIOC_REQBUFS
[  148.415337] Starting new Test
[  148.418416] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  148.418426] tc358743 10-000f: tc358743_disable_edid:
[  148.444288] tc358743 10-000f: tc358743_enable_edid:
[  148.444295] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  148.446781] video0: VIDIOC_S_EDID
[  148.447489] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  148.447495] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  148.547268] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
[  148.549202] tc358743 10-000f: tc358743_get_detected_timings: no sync on =
signal
[  148.549207] video0: VIDIOC_QUERY_DV_TIMINGS: error -37
[  148.649817] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  148.649823] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  148.750938] tc358743 10-000f: tc358743_get_detected_timings: no sync on =
signal
[  148.750944] video0: VIDIOC_QUERY_DV_TIMINGS: error -37
[  148.857618] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  148.865219] video0: VIDIOC_QUERY_DV_TIMINGS
[  148.865247] video0: VIDIOC_S_DV_TIMINGS
[  148.865259] video0: VIDIOC_ENUM_FMT
[  148.865270] video0: VIDIOC_G_FMT
[  148.868124] tc358743 10-000f: tc358743_set_pll:
[  148.882347] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  148.885243] video0: VIDIOC_S_FMT
[  148.885265] video0: VIDIOC_REQBUFS
[  148.885276] video0: VIDIOC_QUERYBUF
[  148.886850] video0: VIDIOC_QUERYBUF
[  148.888514] video0: VIDIOC_QUERYBUF
[  148.889786] video0: VIDIOC_QUERYBUF
[  148.891064] video0: VIDIOC_QUERYBUF
[  148.898116] video0: VIDIOC_STREAMON
[  148.898140] video0: VIDIOC_DQEVENT: error -2
[  148.903244] video0: VIDIOC_DQEVENT: error -2
[  148.908371] video0: VIDIOC_DQEVENT: error -2
[  148.913471] video0: VIDIOC_DQEVENT: error -2
[  148.919323] video0: VIDIOC_DQEVENT: error -2
[  148.924438] video0: VIDIOC_DQEVENT: error -2
[  148.929537] video0: VIDIOC_DQEVENT: error -2
[  148.935217] video0: VIDIOC_DQEVENT: error -2
[  148.940359] video0: VIDIOC_DQEVENT: error -2
[  148.945462] video0: VIDIOC_DQEVENT: error -2
[  148.951124] video0: VIDIOC_DQEVENT: error -2
[  148.956242] video0: VIDIOC_DQEVENT: error -2
[  148.961343] video0: VIDIOC_DQEVENT: error -2
[  148.967005] video0: VIDIOC_DQEVENT: error -2
[  148.972123] video0: VIDIOC_DQEVENT: error -2
[  148.977225] video0: VIDIOC_DQEVENT: error -2
[  148.982873] video0: VIDIOC_DQEVENT: error -2
[  148.987988] video0: VIDIOC_DQEVENT: error -2
[  148.993089] video0: VIDIOC_DQEVENT: error -2
[  148.997533] video0: VIDIOC_DQEVENT: error -2
[  149.002649] video0: VIDIOC_DQEVENT: error -2
[  149.007750] video0: VIDIOC_DQEVENT: error -2
[  149.012843] video0: VIDIOC_DQEVENT: error -2
[  149.017304] video0: VIDIOC_DQEVENT: error -2
[  149.022418] video0: VIDIOC_DQEVENT: error -2
[  149.027518] video0: VIDIOC_DQEVENT: error -2
[  149.031942] video0: VIDIOC_DQEVENT: error -2
[  149.037067] video0: VIDIOC_DQEVENT: error -2
[  149.042166] video0: VIDIOC_DQEVENT: error -2
[  149.047258] video0: VIDIOC_DQEVENT: error -2
[  149.051700] video0: VIDIOC_DQEVENT: error -2
[  149.056814] video0: VIDIOC_DQEVENT: error -2
[  149.061914] video0: VIDIOC_DQEVENT: error -2
[  149.066374] video0: VIDIOC_DQEVENT: error -2
[  149.071488] video0: VIDIOC_DQEVENT: error -2
[  149.076588] video0: VIDIOC_DQEVENT: error -2
[  149.081018] video0: VIDIOC_DQEVENT: error -2
[  149.086132] video0: VIDIOC_DQEVENT: error -2
[  149.091231] video0: VIDIOC_DQEVENT: error -2
[  149.096329] video0: VIDIOC_DQEVENT: error -2
[  149.100889] video0: VIDIOC_DQEVENT: error -2
[  149.106005] video0: VIDIOC_DQEVENT: error -2
[  149.111107] video0: VIDIOC_DQEVENT: error -2
[  149.115575] video0: VIDIOC_DQEVENT: error -2
[  149.120709] video0: VIDIOC_DQEVENT: error -2
[  149.125814] video0: VIDIOC_DQEVENT: error -2
[  149.130423] video0: VIDIOC_DQEVENT: error -2
[  149.135562] video0: VIDIOC_DQEVENT: error -2
[  149.140663] video0: VIDIOC_DQEVENT: error -2
[  149.145758] video0: VIDIOC_DQEVENT: error -2
[  149.150226] video0: VIDIOC_DQEVENT: error -2
[  149.155364] video0: VIDIOC_DQEVENT: error -2
[  149.160466] video0: VIDIOC_DQEVENT: error -2
[  149.164930] video0: VIDIOC_DQEVENT: error -2
[  149.170067] video0: VIDIOC_DQEVENT: error -2
[  149.175168] video0: VIDIOC_DQEVENT: error -2
[  149.180264] video0: VIDIOC_DQEVENT: error -2
[  149.184706] video0: VIDIOC_DQEVENT: error -2
[  149.189841] video0: VIDIOC_DQEVENT: error -2
[  149.194943] video0: VIDIOC_DQEVENT: error -2
[  149.199398] video0: VIDIOC_DQEVENT: error -2
[  149.204513] video0: VIDIOC_DQEVENT: error -2
[  149.209614] video0: VIDIOC_DQEVENT: error -2
[  149.214081] video0: VIDIOC_DQEVENT: error -2
[  149.219214] video0: VIDIOC_DQEVENT: error -2
[  149.224318] video0: VIDIOC_DQEVENT: error -2
[  149.229412] video0: VIDIOC_DQEVENT: error -2
[  149.233937] video0: VIDIOC_DQEVENT: error -2
[  149.239070] video0: VIDIOC_DQEVENT: error -2
[  149.244171] video0: VIDIOC_DQEVENT: error -2
[  149.248615] video0: VIDIOC_DQEVENT: error -2
[  149.253752] video0: VIDIOC_DQEVENT: error -2
[  149.258855] video0: VIDIOC_DQEVENT: error -2
[  149.263951] video0: VIDIOC_DQEVENT: error -2
[  149.268385] video0: VIDIOC_DQEVENT: error -2
[  149.273515] video0: VIDIOC_DQEVENT: error -2
[  149.278621] video0: VIDIOC_DQEVENT: error -2
[  149.283604] video0: VIDIOC_DQEVENT: error -2
[  149.288782] video0: VIDIOC_DQEVENT: error -2
[  149.293887] video0: VIDIOC_DQEVENT: error -2
[  149.298875] video0: VIDIOC_DQEVENT: error -2
[  149.304053] video0: VIDIOC_DQEVENT: error -2
[  149.309156] video0: VIDIOC_DQEVENT: error -2
[  149.313715] video0: VIDIOC_DQEVENT: error -2
[  149.318838] video0: VIDIOC_DQEVENT: error -2
[  149.323938] video0: VIDIOC_DQEVENT: error -2
[  149.329032] video0: VIDIOC_DQEVENT: error -2
[  149.333462] video0: VIDIOC_DQEVENT: error -2
[  149.338596] video0: VIDIOC_DQEVENT: error -2
[  149.343700] video0: VIDIOC_DQEVENT: error -2
[  149.348129] video0: VIDIOC_DQEVENT: error -2
[  149.353254] video0: VIDIOC_DQEVENT: error -2
[  149.358354] video0: VIDIOC_DQEVENT: error -2
[  149.363450] video0: VIDIOC_DQEVENT: error -2
[  149.367978] video0: VIDIOC_DQEVENT: error -2
[  149.373088] video0: VIDIOC_DQEVENT: error -2
[  149.378189] video0: VIDIOC_DQEVENT: error -2
[  149.382703] video0: VIDIOC_DQEVENT: error -2
[  149.387841] video0: VIDIOC_DQEVENT: error -2
[  149.392944] video0: VIDIOC_DQEVENT: error -2
[  149.397391] video0: VIDIOC_DQEVENT: error -2
[  149.402524] video0: VIDIOC_DQEVENT: error -2
[  149.407627] video0: VIDIOC_DQEVENT: error -2
[  149.407912] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[  149.412722] video0: VIDIOC_DQEVENT: error -2
[  149.417260] video0: VIDIOC_DQEVENT: error -2
[  149.418086] tc358743 10-000f: tc358743_format_change: New format: 1280x7=
20p60.00 (1650x750)
[  149.422388] video0: VIDIOC_DQEVENT: error -2
[  149.427944] tc358743 10-000f: tc358743_hdmi_cbit_int_handler: Audio pres=
ent changed
[  149.429932] tc358743 10-000f: tc358743_hdmi_clk_int_handler: DE size or =
position has changed
[  149.431187] video0: VIDIOC_DQEVENT
[  149.444747] tc358743 10-000f: tc358743_format_change: New format: 1280x7=
20p60.00 (1650x750)
[  149.455029] video0: VIDIOC_STREAMOFF
[  149.455664] video0: VIDIOC_REQBUFS
[  149.457319] Starting new Test
[  149.460387] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  149.460396] tc358743 10-000f: tc358743_disable_edid:
[  149.486259] tc358743 10-000f: tc358743_enable_edid:
[  149.486268] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  149.488760] video0: VIDIOC_S_EDID
[  149.495353] tc358743 10-000f: tc358743_query_dv_timings: 1280x720p60.00 =
(1650x750)
[  149.502929] video0: VIDIOC_QUERY_DV_TIMINGS
[  149.502958] video0: VIDIOC_S_DV_TIMINGS
[  149.502971] video0: VIDIOC_ENUM_FMT
[  149.502981] video0: VIDIOC_G_FMT
[  149.505669] tc358743 10-000f: tc358743_set_pll:
[  149.519895] tc358743 10-000f: tc358743_set_csi_color_space: RGB 888 24-b=
it
[  149.522778] video0: VIDIOC_S_FMT
[  149.522797] video0: VIDIOC_REQBUFS
[  149.522808] video0: VIDIOC_QUERYBUF
[  149.524375] video0: VIDIOC_QUERYBUF
[  149.525826] video0: VIDIOC_QUERYBUF
[  149.527007] video0: VIDIOC_QUERYBUF
[  149.528368] video0: VIDIOC_QUERYBUF
[  149.536167] video0: VIDIOC_STREAMON
[  149.536189] video0: VIDIOC_DQEVENT
[  149.553513] video0: VIDIOC_STREAMOFF
[  149.554127] video0: VIDIOC_REQBUFS
[  149.555039] Starting new Test
[  149.558153] tc358743 10-000f: tc358743_s_edid, pad 0, start block 0, blo=
cks 2
[  149.558163] tc358743 10-000f: tc358743_disable_edid:
[  149.584032] tc358743 10-000f: tc358743_enable_edid:
[  149.584041] tc358743 10-000f: tc358743_enable_interrupts: cable connecte=
d =3D 1
[  149.586526] video0: VIDIOC_S_EDID
[  149.587052] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  149.587057] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  149.687340] tc358743 10-000f: tc358743_delayed_work_enable_hotplug:
[  149.687743] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  149.687748] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  149.788442] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  149.788460] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  149.889146] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  149.889164] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  149.989837] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  149.989854] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.090536] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.090554] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.191223] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.191241] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.291935] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.291953] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.392638] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.392657] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.431971] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0200
[  150.434911] tc358743 10-000f: tc358743_reset_phy:
[  150.439192] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.440678] tc358743 10-000f: tc358743_format_change: No signal
[  150.442094] tc358743 10-000f: tc358743_hdmi_cbit_int_handler: Audio pres=
ent changed
[  150.493328] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.493334] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.593984] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.593997] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.694649] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.694666] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.795314] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.795323] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.895969] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.895987] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  150.996648] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  150.996663] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.097318] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.097333] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.197982] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.197997] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.298651] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.298668] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.399328] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.399344] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.455979] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  151.500021] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.500033] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.600684] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.600700] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.701348] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.701363] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.802008] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.802021] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  151.902669] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  151.902686] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.003358] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.003376] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.104066] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.104080] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.204722] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.204734] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.305359] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.305368] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.406003] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.406021] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.480031] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  152.506678] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.506685] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.607344] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.607362] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.708039] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.708050] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.808688] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.808706] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  152.909354] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  152.909364] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.010016] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.010034] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.110692] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.110705] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.211358] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.211375] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.312045] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.312055] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.412668] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.412675] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.504052] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  153.513280] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.513285] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.613891] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.613897] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.714518] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.714531] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.815167] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.815177] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  153.915801] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  153.915807] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.016425] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.016437] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.117061] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.117069] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.217680] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.217686] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.318298] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.318306] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.418917] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.418923] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.519531] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.519537] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.528082] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  154.620145] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.620152] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.720761] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.720768] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.821372] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.821378] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  154.921985] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  154.921993] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.022608] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.022615] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.123222] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.123228] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.223832] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.223837] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.324445] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.324453] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.425069] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.425075] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.525679] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.525684] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.552116] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  155.626284] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.626290] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.726900] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.726907] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.827517] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.827524] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  155.928129] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  155.928135] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.028739] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.028745] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.129352] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.129358] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.229963] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.229970] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.330578] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.330583] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.431187] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.431193] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.531799] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.531805] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.576145] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  156.632409] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.632414] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.733019] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.733024] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.833628] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.833635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  156.934238] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  156.934244] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.034849] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.034856] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.135466] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.135476] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.236098] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.236105] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.336716] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.336722] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.437326] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.437332] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.537944] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.537950] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.600177] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  157.638557] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.638563] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.739168] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.739174] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.839782] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.839788] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  157.940393] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  157.940399] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.041005] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.041011] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.141616] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.141622] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.242225] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.242232] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.342839] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.342846] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.443455] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.443462] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.544069] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.544075] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.624205] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  158.644681] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.644686] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.745293] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.745299] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.845905] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.845911] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  158.946514] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  158.946519] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.047150] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.047166] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.147844] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.147862] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.248536] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.248552] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.349201] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.349209] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.449827] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.449837] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.550460] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.550467] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.648242] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  159.651079] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.651084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.751695] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.751701] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.852310] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.852316] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  159.952922] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  159.952928] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.053547] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.053557] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.154179] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.154186] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.254818] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.254831] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.355487] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.355501] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.456191] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.456206] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.556856] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.556869] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.657521] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.657532] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.672272] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  160.758166] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.758172] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.858784] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.858791] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  160.959394] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  160.959401] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.060011] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.060019] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.160629] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.160635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.261246] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.261254] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.361861] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.361867] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.462474] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.462480] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.563087] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.563093] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.663702] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.663708] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.696292] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  161.764313] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.764319] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.864935] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.864946] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  161.965617] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  161.965623] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.066273] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.066279] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.166929] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.166938] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.267598] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.267606] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.368257] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.368263] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.468911] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.468918] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.569561] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.569568] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.670209] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.670215] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.720324] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  162.770857] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.770863] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.871529] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.871543] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  162.972240] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  162.972248] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.072906] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.072913] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.173559] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.173566] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.274211] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.274218] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.374862] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.374869] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.475509] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.475515] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.576157] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.576163] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.676803] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.676808] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.744345] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  163.777449] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.777454] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.878097] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.878103] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  163.978744] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  163.978749] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.079390] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.079395] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.180038] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.180044] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.280687] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.280692] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.381331] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.381337] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.481978] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.481984] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.582623] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.582629] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.683279] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.683289] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.768383] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  164.783966] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.783972] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.884630] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.884638] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  164.985291] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  164.985300] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.085955] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.085962] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.186613] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.186621] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.287275] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.287282] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.387925] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.387931] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.488580] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.488588] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.589249] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.589255] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.689906] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.689913] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.790566] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.790573] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.792397] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  165.891218] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.891223] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  165.991866] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  165.991872] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.092512] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.092518] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.193161] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.193166] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.293808] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.293814] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.394457] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.394463] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.495105] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.495110] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.595751] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.595757] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.696424] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.696432] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.797078] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.797084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.816424] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  166.897730] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.897737] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  166.998401] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  166.998409] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.099055] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.099061] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.199703] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.199709] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.300353] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.300360] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.401001] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.401007] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.501648] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.501654] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.602296] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.602302] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.702940] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.702945] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.803587] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.803594] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  167.840448] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  167.904238] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  167.904243] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.004893] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.004902] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.105561] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.105569] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.206213] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.206219] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.306863] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.306870] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.407512] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.407518] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.508164] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.508171] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.608820] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.608827] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.709471] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.709477] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.810116] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.810122] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  168.864472] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  168.910764] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  168.910770] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.011422] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.011430] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.112077] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.112084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.212725] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.212730] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.313371] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.313379] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.414022] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.414028] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.514666] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.514671] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.615310] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.615315] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.715955] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.715961] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.816601] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.816607] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  169.888493] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  169.917250] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  169.917255] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.017896] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.017902] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.118543] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.118548] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.219193] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.219201] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.319851] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.319857] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.420522] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.420528] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.521171] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.521177] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.621816] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.621821] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.722467] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.722475] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.823132] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.823139] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  170.912517] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  170.923787] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  170.923792] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.024436] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.024442] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.125089] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.125096] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.225754] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.225761] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.326407] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.326413] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.427062] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.427069] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.527723] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.527729] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.628384] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.628392] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.729049] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.729056] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.829705] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.829712] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.930363] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  171.930371] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  171.936541] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  172.031024] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.031029] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.131682] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.131690] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.232342] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.232350] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.332994] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.333001] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.433647] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.433653] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.534293] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.534299] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.634942] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.634948] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.735594] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.735601] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.836246] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.836253] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.936890] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  172.936896] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  172.960560] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  173.037535] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.037541] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.138185] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.138191] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.238833] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.238839] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.339486] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.339493] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.440146] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.440154] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.540801] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.540807] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.641449] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.641455] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.742095] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.742101] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.842748] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.842756] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.943404] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  173.943411] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  173.984581] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  174.044054] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.044060] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.144723] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.144736] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.245441] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.245448] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.346106] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.346113] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.446758] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.446764] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.547416] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.547426] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.648082] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.648089] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.748733] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.748739] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.849381] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.849387] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  174.950028] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  174.950035] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.008604] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  175.050684] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.050691] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.151341] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.151348] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.252002] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.252008] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.352650] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.352656] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.453306] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.453314] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.553969] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.553977] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.654632] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.654639] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.755284] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.755290] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.855945] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.855955] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  175.956628] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  175.956635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.032622] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  176.057274] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.057281] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.157924] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.157930] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.258560] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.258566] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.359193] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.359199] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.459828] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.459836] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.560471] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.560477] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.661104] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.661110] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.761737] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.761743] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.862380] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.862390] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  176.963047] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  176.963054] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.056645] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  177.063694] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.063699] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.164337] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.164346] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.264990] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.264997] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.365634] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.365641] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.466278] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.466285] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.566918] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.566924] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.667551] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.667557] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.768194] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.768203] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.868857] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.868866] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  177.969509] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  177.969516] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.070151] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.070161] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.080662] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  178.170810] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.170816] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.271452] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.271458] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.372086] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.372091] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.472719] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.472725] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.573358] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.573364] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.673993] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.673998] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.774623] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.774629] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.875257] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.875263] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  178.975888] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  178.975894] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.076538] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.076553] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.104683] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  179.177230] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.177235] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.277882] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.277888] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.378518] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.378524] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.479153] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.479158] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.579785] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.579791] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.680432] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.680443] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.781097] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.781104] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.881745] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.881752] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  179.982389] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  179.982396] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.083035] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.083044] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.128701] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  180.183689] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.183695] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.284336] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.284342] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.384971] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.384976] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.485605] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.485611] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.586240] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.586245] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.686878] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.686884] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.787517] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.787524] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.888154] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.888161] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  180.988805] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  180.988816] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.089481] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.089489] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.152718] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  181.190128] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.190134] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.290768] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.290774] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.391409] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.391418] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.492064] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.492071] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.592721] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.592728] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.693362] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.693367] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.793995] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.794001] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.894629] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.894635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  181.995265] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  181.995272] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.095901] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.095907] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.176730] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  182.196534] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.196539] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.297168] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.297176] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.397813] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.397821] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.498462] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.498469] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.599102] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.599109] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.699740] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.699746] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.800377] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.800383] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  182.901010] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  182.901016] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.001642] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.001648] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.102276] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.102281] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.202958] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.202978] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.204781] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  183.303746] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.303766] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.404508] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.404527] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.505248] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.505267] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.605997] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.606016] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.706734] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.706751] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.807462] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.807479] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  183.908188] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  183.908204] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.008905] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.008922] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.109626] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.109643] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.210346] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.210363] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.224795] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  184.311060] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.311073] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.411781] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.411798] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.512494] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.512507] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.613196] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.613212] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.713922] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.713939] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.814654] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.814672] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  184.915369] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  184.915379] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.016040] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.016054] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.116745] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.116763] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.217459] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.217468] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.248793] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  185.318133] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.318142] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.418833] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.418841] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.519494] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.519502] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.620165] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.620199] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.720909] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.720927] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.821624] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.821632] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  185.922302] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  185.922320] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.023017] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.023029] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.123703] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.123716] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.224393] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.224402] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.272798] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  186.325052] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.325059] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.425705] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.425712] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.526349] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.526355] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.626991] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.626999] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.727640] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.727647] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.828290] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.828296] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  186.928930] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  186.928937] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.029569] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.029576] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.130214] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.130221] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.230859] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.230866] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.296810] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  187.331499] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.331505] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.432143] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.432149] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.532807] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.532814] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.633447] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.633453] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.734085] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.734091] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.834721] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.834728] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  187.935355] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  187.935361] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.035993] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.035999] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.136632] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.136638] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.237266] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.237272] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.320829] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  188.337899] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.337904] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.438533] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.438540] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.539167] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.539173] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.639798] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.639804] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.740433] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.740439] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.841068] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.841074] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  188.941699] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  188.941704] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.042330] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.042336] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.142964] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.142970] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.243593] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.243599] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.344219] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.344243] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.344840] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  189.444873] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.444878] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.545507] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.545512] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.646138] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.646144] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.746778] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.746789] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.847442] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.847449] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  189.948082] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  189.948090] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.048727] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.048732] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.149361] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.149367] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.249995] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.250001] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.350627] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.350632] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.368855] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  190.451258] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.451264] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.551896] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.551903] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.652533] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.652539] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.753164] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.753170] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.853797] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.853803] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  190.954430] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  190.954435] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.055061] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.055066] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.155691] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.155696] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.256343] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.256356] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.357046] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.357060] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.392875] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  191.457749] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.457758] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.558442] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.558457] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.659138] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.659153] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.759835] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.759848] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.860542] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.860559] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  191.961259] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  191.961270] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.061923] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.061930] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.162570] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.162580] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.263234] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.263241] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.363881] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.363889] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.416888] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  192.464527] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.464533] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.565170] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.565175] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.665806] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.665811] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.766440] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.766447] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.867082] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.867091] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  192.967733] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  192.967739] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.068370] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.068375] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.169001] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.169007] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.269636] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.269642] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.370269] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.370275] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.440896] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  193.470905] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.470911] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.571540] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.571547] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.672177] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.672183] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.772812] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.772818] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.873450] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.873457] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  193.974091] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  193.974098] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.074728] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.074734] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.175361] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.175367] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.275995] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.276001] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.376630] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.376635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.464908] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  194.477264] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.477269] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.577900] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.577907] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.678548] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.678559] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.779215] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.779223] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.879858] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.879864] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  194.980494] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  194.980500] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.081134] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.081142] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.181789] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.181798] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.282441] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.282447] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.383077] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.383084] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.483707] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.483712] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.488924] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  195.584338] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.584344] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.684979] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.684986] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.785622] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.785629] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.886264] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.886273] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  195.986922] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  195.986929] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.087566] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.087573] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.188204] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.188210] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.288841] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.288848] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.389485] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.389492] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.490137] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.490143] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.512938] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  196.590775] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.590781] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.691414] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.691421] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.792048] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.792054] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.892686] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.892692] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  196.993320] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  196.993326] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.093955] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.093961] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.194587] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.194593] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.295221] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.295227] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.395854] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.395859] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.496488] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.496493] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.536948] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  197.597120] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.597125] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.697755] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.697761] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.798388] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.798393] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.899019] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.899024] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  197.999652] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  197.999659] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.100290] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.100297] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.200954] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.200966] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.301628] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.301635] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.402273] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.402279] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.502913] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.502922] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.560966] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  198.603565] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.603571] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.704211] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.704219] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.804871] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.804878] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  198.905507] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  198.905514] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.006146] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.006155] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.106796] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.106802] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.207437] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.207444] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.308081] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.308088] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.408722] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.408729] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.509355] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.509361] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.584973] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  199.609986] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.609991] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.710620] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.710625] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.811253] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.811258] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  199.911884] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  199.911890] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.012518] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.012525] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.113162] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.113170] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.213818] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.213825] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.314464] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.314471] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.415105] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.415111] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.515739] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.515745] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.608991] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  200.616378] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.616384] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.717030] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.717037] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.817671] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.817677] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  200.918305] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  200.918312] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.018939] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.018945] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.119574] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.119581] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.220220] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.220226] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.320857] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.320863] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.421488] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.421494] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.522128] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.522137] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.622786] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.622792] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.632997] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  201.723426] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.723431] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.824064] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.824070] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  201.924703] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  201.924709] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.025339] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.025345] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.125976] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.125982] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.226616] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.226623] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.327252] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.327257] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.427882] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.427887] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.528513] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.528519] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.629145] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.629150] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.657007] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  202.729776] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.729781] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.830409] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.830415] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  202.931041] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  202.931046] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.031673] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.031679] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.132307] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.132313] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.232942] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.232947] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.333576] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.333582] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.434212] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.434218] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.534845] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.534850] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.635475] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.635480] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.681018] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  203.736108] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.736113] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.836743] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.836749] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  203.937374] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  203.937380] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.038005] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.038012] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.138639] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.138645] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.239275] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.239282] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.339915] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.339921] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.440551] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.440557] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.541184] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.541189] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.641812] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.641817] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.705028] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  204.742445] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.742451] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.843080] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.843086] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  204.943711] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  204.943717] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.044344] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.044350] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.144978] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.144984] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.245613] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.245619] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.346244] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.346249] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.446874] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.446880] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.547511] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.547518] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.648149] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.648155] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.729039] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  205.748784] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.748789] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.849418] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.849424] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  205.950051] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  205.950057] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.050684] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.050691] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.151318] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.151324] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.251947] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.251953] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.352582] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.352588] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.453220] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.453226] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.553857] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.553864] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.654496] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.654505] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.753051] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  206.755142] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.755147] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.855791] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.855803] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  206.956462] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  206.956469] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.057107] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.057112] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.157746] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.157754] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.258399] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.258406] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.359048] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.359056] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.459694] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.459700] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.560333] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.560339] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.660969] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.660975] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.761600] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.761606] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.777058] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  207.862240] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.862248] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  207.962913] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  207.962922] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.063557] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.063563] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.164197] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.164204] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.264839] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.264846] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.365480] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.365488] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.466124] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.466130] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.566763] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.566769] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.667400] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.667406] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.768038] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.768044] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.801069] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  208.868680] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.868685] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  208.969328] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  208.969336] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.069975] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.069982] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.170617] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.170623] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.271254] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.271261] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.371893] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.371899] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.472532] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.472539] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.573173] tc358743 10-000f: tc358743_get_detected_timings: no valid si=
gnal
[  209.573179] video0: VIDIOC_QUERY_DV_TIMINGS: error -67
[  209.825087] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  210.849087] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  211.873104] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  212.897105] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  213.921120] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  214.945122] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  215.969195] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  216.993151] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  218.017169] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  219.041174] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  220.065167] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  221.089172] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  222.113184] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  223.137204] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  224.161198] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  225.185221] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  226.209215] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  227.233221] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  228.257235] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  229.281243] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  230.305246] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  231.329262] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  232.353260] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  233.377265] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  234.401275] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  235.425282] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  236.449286] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  237.473293] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  238.497305] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  239.521308] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  240.545319] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  241.569321] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  242.593328] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  243.617339] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  244.641347] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  245.665353] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  246.689358] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  247.713359] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  248.737385] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  249.761395] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  250.785400] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  251.809406] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  252.833392] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  253.857404] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  254.881404] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  255.905415] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  256.929417] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  257.953422] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  258.977437] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  260.001435] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  261.025442] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  262.049450] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  263.073454] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  264.097461] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  265.121465] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  266.145469] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  267.169477] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  268.193479] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  269.217485] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  270.241494] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  271.265496] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  272.289509] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  273.313518] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  274.337541] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  275.361572] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  276.385611] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  277.409642] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  278.433675] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  279.457711] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  280.481739] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  281.505830] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  282.529820] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  283.553874] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  284.577880] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  285.601899] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  286.625928] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  287.649958] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  288.673988] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  289.698020] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  290.722045] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  291.746086] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  292.770102] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  293.794139] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  294.818160] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  295.842188] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  296.866216] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  297.890249] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  298.914266] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  299.938291] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  300.962318] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  301.986344] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  303.010369] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  304.034403] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  305.058420] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  306.082456] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  307.106478] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  308.130494] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  309.154520] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  310.178539] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  311.202568] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  312.226596] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  313.250611] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  314.274663] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  315.298667] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  316.322692] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  317.346713] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  318.370727] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  319.394742] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  320.418762] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  321.442787] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  322.466816] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  323.490831] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  324.514855] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  325.538873] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  326.562901] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000
[  327.586912] tc358743 10-000f: tc358743_isr: IntStatus =3D 0x0000

--pjdtt227atrbpttr--

--it2ta7rqzbpk6nb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQNOwAKCRDj7w1vZxhR
xWLJAQCQH3QO7eGsk+PzGLD8Ev28kiSXRSUceKelUHkLy/buRgD/fMB7QWLk0mT2
6RZQJY+LiTG88g3zkY5q0JXd6UhcjQY=
=RkSH
-----END PGP SIGNATURE-----

--it2ta7rqzbpk6nb3--

