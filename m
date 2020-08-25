Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428C1250CD7
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 02:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgHYASw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 20:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgHYASv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 20:18:51 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5897C061574
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 17:18:50 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id l23so9664848edv.11
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 17:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=42h/fny39Fqy4riGfZjD1mQ5wsUCML0jAnDX4KHbI8M=;
        b=HV3MME3oz+sbWNkuCTaxDWaRDP6dglcrj38XrRhO4/7K92lDtZmRovDJM/ow14jWIC
         agb4y+k3K83ko45zlQHxzi2d3Px2Mdu0RYb8tIrlg7ZPbe6qkAtfozwx720K4sDRGNOF
         hq4czG8B0m44GfFtdrNOUS6WZKqiZ++bJjyJeqkuRVSt3kAEA3sTbemOXjxsdV734LCM
         orgcRAitfA88sdvEpQOekUrCVEtx2i9LL1XoQ//sSwcZHB90mHfZmFm+Q32JjH2KSwWn
         w6xCLKqmh5RqdEMUzfuIUwZ2kYsrDhnCohC7+5RzC2qLxsN4VR5kxuKE36NiZlyBqsN6
         O10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=42h/fny39Fqy4riGfZjD1mQ5wsUCML0jAnDX4KHbI8M=;
        b=OebCFT6LnYSchBXjxvGWfJZegydr7tfFw5/Gagn2Qb7+LtQ/+0UHKg+fxWbLx85iuV
         il0pKvR07ZfVZP6aCWoPUsApka/9EoQ/p+j6VtNq500S2JH2Tif3RrlreGsbpZl4/Lj2
         ssINJchEjYeTmt1iujx3Qj1jOpdP4off6moUrRApe+N2NQGcB/VIqQki7sgnXMf7grhq
         kXYl8ygEmreCFR5mgdzmreAfkqpvekzyoikYMCJkCwnaTMNeyG919vFVYo0PSmx6TtF1
         AMhW1p2iPcbOewxtArW/55tYcZkvv2wXBH2Q2MfQzYXmjVFhb1+MqYrrH6iyl+e25Yax
         Jt3Q==
X-Gm-Message-State: AOAM530cANGaFL4K/S+PvQFQSriQ1Int+K2PKlvKUFXIMf9jW0VujWsT
        jrJ8Aw3dzrdHFmZkELqXpTlB9RErrk6k2vkUZe+nAd2r6yDkPA==
X-Google-Smtp-Source: ABdhPJyBwwGfUGovCAxyd5cfayxPt4IbrMMXfSveEI+eY9a11JRIIVTVgTJNu7HFa96ocsCFqBwVbgB7GtYHa6qwXCg=
X-Received: by 2002:a05:6402:229b:: with SMTP id cw27mr4909592edb.272.1598314728455;
 Mon, 24 Aug 2020 17:18:48 -0700 (PDT)
MIME-Version: 1.0
From:   Vincent Fortier <th0ma7@gmail.com>
Date:   Mon, 24 Aug 2020 20:18:37 -0400
Message-ID: <CALAySuKgaCxnHR_ef2Msii4YwT99GkoyOf_2BTa+ir6+LCts6Q@mail.gmail.com>
Subject: backport 4.4.59 - kernel panic upon loading em28xx-dvb.ko
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Following Hans reply yesterday I was able to get to compile the media
tree against Synology 4.4.59 source once again, thnx again!

Since my previous build (dating from may 2019) I noticed a few kernel
module changes and was able to manually insmod all required modules to
get my Hauppauge WinTV Dual-Tuner up and running:
rc/rc-core.ko
mc/mc.ko
v4l2-core/videodev.ko
common/tveeprom.ko
common/videobuf2/videobuf2-common.ko
common/videobuf2/videobuf2-v4l2.ko
common/videobuf2/videobuf2-memops.ko
common/videobuf2/videobuf2-vmalloc.ko
dvb-core/dvb-core.ko
usb/em28xx/em28xx.ko
usb/em28xx/em28xx-rc.ko
rc/keymaps/rc-hauppauge.ko
dvb-frontends/lgdt3306a.ko
tuners/si2157.ko
usb/em28xx/em28xx-dvb.ko

It ended-up crashing big-time (and auto-rebooting) when loading the
last bit "em28xx-dvb.ko".  I don't recall seeing this behaviour
previously.

Notice that tvheadend was running (normally I stop it before playing
with modules) which make me believe the following line is related to
the problem (although I find it weird that a userspace program lead to
a kernel crash):
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1

Thnx in advance (see below for the logs).

- vin


Here is the log prior to loading em28xx-dvb.ko:
[ 4135.666426] rc_core: module verification failed: signature and/or
required key missing - tainting kernel
[ 4135.678607] WARNING: You are using an experimental version of the
media stack.
                   As the driver is backported to an older kernel, it
doesn't offer
                   enough quality for its usage in production.
                   Use it with care.
               Latest git patches (needed if you report a bug to
linux-media@vger.kernel.org):
                   9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
venus: core: Add support for opp tables/perf voting
                   98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
venus: core: Fix error handling in probe
                   bbe516e976fce538db96bd2b7287df942faa14a3 media:
venus: core: Fix runtime PM imbalance in venus_probe
[ 4143.360590] mc: Linux media interface: v0.10
[ 4147.850476] videodev: Linux video capture interface: v2.00
[ 4147.856620] WARNING: You are using an experimental version of the
media stack.
                   As the driver is backported to an older kernel, it
doesn't offer
                   enough quality for its usage in production.
                   Use it with care.
               Latest git patches (needed if you report a bug to
linux-media@vger.kernel.org):
                   9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
venus: core: Add support for opp tables/perf voting
                   98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
venus: core: Fix error handling in probe
                   bbe516e976fce538db96bd2b7287df942faa14a3 media:
venus: core: Fix runtime PM imbalance in venus_probe
[ 4183.287387] WARNING: You are using an experimental version of the
media stack.
                   As the driver is backported to an older kernel, it
doesn't offer
                   enough quality for its usage in production.
                   Use it with care.
               Latest git patches (needed if you report a bug to
linux-media@vger.kernel.org):
                   9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
venus: core: Add support for opp tables/perf voting
                   98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
venus: core: Fix error handling in probe
                   bbe516e976fce538db96bd2b7287df942faa14a3 media:
venus: core: Fix runtime PM imbalance in venus_probe
[ 4205.669367] em28xx 1-3:1.0: New device HCW 955D @ 480 Mbps
(2040:026d, interface 0, class 0)
[ 4205.678927] em28xx 1-3:1.0: DVB interface 0 found: isoc
[ 4205.735151] em28xx 1-3:1.0: chip ID is em28174
[ 4206.857376] em28xx 1-3:1.0: EEPROM ID = 26 00 01 00, EEPROM hash = 0x3d790eca
[ 4206.865378] em28xx 1-3:1.0: EEPROM info:
[ 4206.869780] em28xx 1-3:1.0:     microcode start address = 0x0004,
boot configuration = 0x01
[ 4206.884961] em28xx 1-3:1.0:     AC97 audio (5 sample rates)
[ 4206.890944] em28xx 1-3:1.0:     500mA max power
[ 4206.895731] em28xx 1-3:1.0:     Table at offset 0x27,
strings=0x0a72, 0x187c, 0x086a
[ 4206.956155] em28xx 1-3:1.0: Identified as Hauppauge WinTV-dualHD
01595 ATSC/QAM (card=100)
[ 4206.967072] tveeprom: Hauppauge model 204101, rev B2I6, serial# 11584195
[ 4206.974622] tveeprom: tuner model is SiLabs Si2157 (idx 186, type 4)
[ 4206.981799] tveeprom: TV standards PAL(B/G) NTSC(M) PAL(I)
SECAM(L/L') PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xfc)
[ 4206.993360] tveeprom: audio processor is None (idx 0)
[ 4206.999097] tveeprom: has no radio, has IR receiver, has no IR transmitter
[ 4207.006887] em28xx 1-3:1.0: dvb set to isoc mode.
[ 4207.065208] em28xx 1-3:1.0: chip ID is em28174
[ 4208.186420] em28xx 1-3:1.0: EEPROM ID = 26 00 01 00, EEPROM hash = 0x3d790eca
[ 4208.194467] em28xx 1-3:1.0: EEPROM info:
[ 4208.198901] em28xx 1-3:1.0:     microcode start address = 0x0004,
boot configuration = 0x01
[ 4208.214294] em28xx 1-3:1.0:     AC97 audio (5 sample rates)
[ 4208.220256] em28xx 1-3:1.0:     500mA max power
[ 4208.225053] em28xx 1-3:1.0:     Table at offset 0x27,
strings=0x0a72, 0x187c, 0x086a
[ 4208.284235] em28xx 1-3:1.0: Identified as Hauppauge WinTV-dualHD
01595 ATSC/QAM (card=100)
[ 4208.294617] tveeprom: Hauppauge model 204101, rev B2I6, serial# 11584195
[ 4208.302205] tveeprom: tuner model is SiLabs Si2157 (idx 186, type 4)
[ 4208.309356] tveeprom: TV standards PAL(B/G) NTSC(M) PAL(I)
SECAM(L/L') PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xfc)
[ 4208.320856] tveeprom: audio processor is None (idx 0)
[ 4208.326518] tveeprom: has no radio, has IR receiver, has no IR transmitter
[ 4208.334233] em28xx 1-3:1.0: dvb ts2 set to isoc mode.
[ 4208.540857] usbcore: registered new interface driver em28xx
[ 4212.702827] em28xx 1-3:1.0: Registering input extension
[ 4212.730486] rc_core: IR keymap rc-hauppauge not found
[ 4212.736137] Registered IR keymap rc-empty
[ 4212.740851] rc rc0: Hauppauge WinTV-dualHD 01595 ATSC/QAM as
/devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/rc/rc0
[ 4212.752893] rc rc0: lirc_dev: driver em28xx registered at minor =
0, scancode receiver, no transmitter
[ 4212.763397] input: Hauppauge WinTV-dualHD 01595 ATSC/QAM as
/devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/rc/rc0/input2
[ 4212.775968] em28xx 1-3:1.0: Input extension successfully initialized
[ 4212.783152] em28xx 1-3:1.0: Remote control support is not available
for this card.
[ 4212.791680] em28xx: Registered (Em28xx Input Extension) extension


Here is the crash output:
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
[ 2722.681196] BUG: unable to handle kernel paging request at ffff880338bd4000
[ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
[ 2722.694816] PGD 1a06067 PUD 80000003000001e3
[ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
[ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
target_core_file(O) target_core_iblock(O) target_core_mod(O)
syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
flashcache(O) syno_flashcache_control(O) openvswitch gre
nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
sha256_generic ecb aes_x86_64 authenc des_generic
[ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
   OE   4.4.59+ #25426
[ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
ffff880408a28000
[ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
0xffff880338bd4000
[ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
[ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 0000000000000000
[ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff880338bd3e78
[ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 0000000000000000
[ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042eae89f0
[ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 0000000000000003
[ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
knlGS:0000000000000000
[ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 00000000003406f0
[ 2722.991594] Stack:
[ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
ffff88042eae89e8
[ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
ffff88044f3e6640
[ 2723.018640] Call Trace:
[ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb_core]
[ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
[ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
0a 48
[ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
[ 2723.106141]  RSP <ffff880408a2bdb8>
[ 2723.110030] CR2: ffff880338bd4000
[ 2723.113730] ---[ end trace b1179ea04484e38f ]---
[ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
