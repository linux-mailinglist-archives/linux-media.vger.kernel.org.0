Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69061251703
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 13:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgHYLEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 07:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbgHYLEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 07:04:40 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F61C061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 04:04:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c10so10833068edk.6
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=N8r3r1HRlcG9+gk79UeSm6kRL4f0hHjzs+Mx9cFmZlw=;
        b=AHnxlDfb3GMN8Sb/JAW2m0jn9hgAbGKZchiwC0iZSXRPKfkaWNkuWp5oVkRIkx8zxx
         lcyvNhkc+7uOyJBzXSEMJh2N+mT8T+iINcqBtGuu5P7ns9yEPiHWYbwAVQtXxdNIHOZA
         OVoKaONkBdFGHA6m6BHsXoGjXrf2e+sVYSWkDD1sEYdvDBXcba/Vxiol/39JmDFCR1WB
         r7q+BBlSFf55mpMVtwz9MaMvIwwBNKVrLojCpOBym4atbgGzr9mRF/ykVqHD0yMLTsXQ
         mDI4Rbe257l4BeN9pxbgbh379C52VhAYdMrVsshOVcd4vUNEXR4E60+z+vHnxnXNeXa0
         GD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=N8r3r1HRlcG9+gk79UeSm6kRL4f0hHjzs+Mx9cFmZlw=;
        b=TW0ziQFP1MbM9wqkNyzrsZ7Gfu24DrXmQ5U+O9sNEzoj6xhz5bblHjh3tGDvUvpm/Y
         VBMrxgjzv707jm27YTLGMGJv4QFcmlK/Jodkb7jwliX+v75iE446TQuQjqjQXNPSsXgl
         KfOLhyKvGiFdAy+uFA/jvvQ+TpnJrKohJeMcXGq0SdLeciu+C7cyPsDmRNSyyiCZhQ5r
         xS7kuLIZiYCcceHwz+zd6LywyJm5fk6sc9wvwett0tq1uBbCxIEu8/ydZkXlwK+6Qkjq
         Qqa6SFlinMt9EM97N3BWAXG3i0frO8TI5r2SXxYpa9NFlxCU4zqUKB4hdxY9x5PNrFp8
         rX3Q==
X-Gm-Message-State: AOAM533XJlqJO5ofJIJZqAe+3JEuFEbwAPc03XERaSqjh4VpBiQCMzU5
        wa4gZxPSiWe9usM3CwwHNq2vHqQRWjW5/4GVsjAGLlbINGbedg==
X-Google-Smtp-Source: ABdhPJw3ow2hKrpUcCK3jWpXd8RZWBIj6I3HFXUKANc0qb/D22GB0VpCQ7sG2Qd0Aw+5tmvBLoNGDBAEGM0ZbkVmfik=
X-Received: by 2002:a05:6402:1ace:: with SMTP id ba14mr3114565edb.262.1598353474494;
 Tue, 25 Aug 2020 04:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALAySuKgaCxnHR_ef2Msii4YwT99GkoyOf_2BTa+ir6+LCts6Q@mail.gmail.com>
In-Reply-To: <CALAySuKgaCxnHR_ef2Msii4YwT99GkoyOf_2BTa+ir6+LCts6Q@mail.gmail.com>
From:   Vincent Fortier <th0ma7@gmail.com>
Date:   Tue, 25 Aug 2020 07:04:23 -0400
Message-ID: <CALAySuJKQwQz2PaFkyFznXO5diVSEoQjqcPw9HBxHWqhtLBu4w@mail.gmail.com>
Subject: Re: backport 4.4.59 - kernel panic upon loading em28xx-dvb.ko
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Tried again this time with tvheadend disabled.  Module loaded
perfectly up until I restarted tvheadend where I was able to catch the
first bits of the kernel panic:
[42655.375808] kernel tried to execute NX-protected page - exploit
attempt? (uid: 276776)
[42655.384655] BUG: unable to handle kernel paging request at ffff8803f8e18=
000

Here is more info:
[42597.968634] em28xx 1-3:1.0: Input extension successfully initialized
[42597.975759] em28xx 1-3:1.0: Remote control support is not available
for this card.
[42597.984226] em28xx: Registered (Em28xx Input Extension) extension
[42635.001297] em28xx 1-3:1.0: Binding DVB extension
[42635.010473] i2c i2c-6: Added multiplexed i2c bus 9
[42635.015840] lgdt3306a 6-0059: LG Electronics LGDT3306A successfully
identified
[42635.025843] si2157 9-0060: Silicon Labs Si2147/2148/2157/2158
successfully attached
[42635.034420] dvbdev: DVB: registering new adapter (1-3:1.0)
[42635.040564] em28xx 1-3:1.0: DVB: registering adapter 0 frontend 0
(LG Electronics LGDT3306A VSB/QAM Frontend)...
[42635.051946] dvbdev: dvb_create_media_entity: media entity 'LG
Electronics LGDT3306A VSB/QAM Frontend' registered.
[42635.064054] dvbdev: dvb_create_media_entity: media entity
'dvb-demux' registered.
[42635.073415] em28xx 1-3:1.0: DVB extension successfully initialized
[42635.080336] em28xx 1-3:1.0: Binding DVB extension
[42635.089296] i2c i2c-8: Added multiplexed i2c bus 10
[42635.094755] lgdt3306a 8-000e: LG Electronics LGDT3306A successfully
identified
[42635.104789] si2157 10-0062: Silicon Labs Si2147/2148/2157/2158
successfully attached
[42635.113459] dvbdev: DVB: registering new adapter (1-3:1.0)
[42635.119598] em28xx 1-3:1.0: DVB: registering adapter 1 frontend 0
(LG Electronics LGDT3306A VSB/QAM Frontend)...
[42635.130998] dvbdev: dvb_create_media_entity: media entity 'LG
Electronics LGDT3306A VSB/QAM Frontend' registered.
[42635.142981] dvbdev: dvb_create_media_entity: media entity
'dvb-demux' registered.
[42635.152264] em28xx 1-3:1.0: DVB extension successfully initialized
[42635.159184] em28xx: Registered (Em28xx dvb Extension) extension
[42655.297942] si2157 10-0062: found a 'Silicon Labs Si2157-A30'
[42655.354257] si2157 10-0062: firmware version: 3.0.5
[42655.365512] em28xx 1-3:1.0: DVB: adapter 1 frontend 0 frequency 0
out of range (54000000..858000000)
[42655.375808] kernel tried to execute NX-protected page - exploit
attempt? (uid: 276776)
[42655.384655] BUG: unable to handle kernel paging request at ffff8803f8e18=
000
[42655.392442] IP: [<ffff8803f8e18000>] 0xffff8803f8e18000
[42655.398283] PGD 1a06067 PUD 80000003c00001e3
[42655.403152] Oops: 0011 [#1] PREEMPT SMP
[42655.407542] Modules linked in: em28xx_dvb(OE) si2157(OE)
lgdt3306a(OE) rc_hauppauge(OE) em28xx_rc(OE) em28xx(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) vhost(O) ipt_MASQUERADE xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[42655.486394]  target_core_ep(O) target_core_multi_file(O)
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
[42655.564488]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[42655.592293] CPU: 3 PID: 21050 Comm: tvheadend Tainted: P
OE   4.4.59+ #25426
[42655.601138] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[42655.608624] task: ffff88046d9860c0 ti: ffff8803f8c4c000 task.ti:
ffff8803f8c4c000
[42655.616974] RIP: 0010:[<ffff8803f8e18000>]  [<ffff8803f8e18000>]
0xffff8803f8e18000
[42655.625532] RSP: 0018:ffff8803f8c4fdb8  EFLAGS: 00010087
[42655.631462] RAX: ffff8803f8e17e78 RBX: 0000000000000000 RCX: 00000000000=
00000
[42655.639431] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff8803f8e=
17e78
[42655.647401] RBP: ffff8803f8c4fdf8 R08: 0000000000000000 R09: 00000000000=
00000
[42655.655372] R10: ffff880405bca310 R11: 0000000000000293 R12: ffff8800767=
e95f0
[42655.663342] R13: ffff8800767e95d8 R14: 0000000000000000 R15: 00000000000=
00003
[42655.671311] FS:  00007fda885d2bc0(0000) GS:ffff88047fd80000(0000)
knlGS:0000000000000000
[42655.680351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[42655.686767] CR2: ffff8803f8e18000 CR3: 000000040305a000 CR4: 00000000003=
406f0
[42655.694738] Stack:
[42655.696978]  ffffffff8107fae4 00000001a1073400 0000000000000000
ffff8800767e95e8
[42655.705250]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[42655.713530]  ffff8803f8c4fe30 ffffffff8107fd35 ffff8800762bc810
ffff880071131340
[42655.721811] Call Trace:
[42655.724543]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[42655.731057]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[42655.736691]  [<ffffffffa1072074>] dvb_frontend_release+0x74/0x140 [dvb_c=
ore]
[42655.744566]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[42655.750011]  [<ffffffff81138039>] ____fput+0x9/0x10
[42655.755448]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[42655.761469]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[42655.768274]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[42655.775276]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[42655.782082] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 7f e1 f8 03 88 ff ff 18 00 00 00
00 00 00 00 <40> b1 d3 03 04 88 ff ff 02 00 00 00 00 00 00 00 01 00 00
00 00
[42655.803398] RIP  [<ffff8803f8e18000>] 0xffff8803f8e18000
[42655.809327]  RSP <ffff8803f8c4fdb8>
[42655.813219] CR2: ffff8803f8e18000
[42655.816921] ---[ end trace a284c55aa9934262 ]---
[42657.226744] lgdt3306a: error (addr 0e reg 0x002 error (ret =3D=3D -110)
[42658.950335] note: tvheadend[21050] exited with preempt_count 1
[42658.992421] hrtimer: interrupt took 2623434 ns
[42635.130998] dvbdev: dvb_create_media_entity: media entity 'LG
Electronics LGDT3306A VSB/QAM Frontend' registered.
[42635.142981] dvbdev: dvb_create_media_entity: media entity
'dvb-demux' registered.
[42635.152264] em28xx 1-3:1.0: DVB extension successfully initialized
[42635.159184] em28xx: Registered (Em28xx dvb Extension) extension
[42655.297942] si2157 10-0062: found a 'Silicon Labs Si2157-A30'
[42655.354257] si2157 10-0062: firmware version: 3.0.5
[42655.365512] em28xx 1-3:1.0: DVB: adapter 1 frontend 0 frequency 0
out of range (54000000..858000000)
[42655.375808] kernel tried to execute NX-protected page - exploit
attempt? (uid: 276776)
[42655.384655] BUG: unable to handle kernel paging request at ffff8803f8e18=
000
[42655.392442] IP: [<ffff8803f8e18000>] 0xffff8803f8e18000
[42655.398283] PGD 1a06067 PUD 80000003c00001e3
[42655.403152] Oops: 0011 [#1] PREEMPT SMP
[42655.407542] Modules linked in: em28xx_dvb(OE) si2157(OE)
lgdt3306a(OE) rc_hauppauge(OE) em28xx_rc(OE) em28xx(OE) dvb_core(OE)
videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
videobuf2_common(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
vhost_scsi(O) vhost(O) ipt_MASQUERADE xt_REDIRECT
nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
iscsi_target_mod(O)
[42655.486394]  target_core_ep(O) target_core_multi_file(O)
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
[42655.564488]  ansi_cprng cts md5 cbc cpufreq_powersave
cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
usb_common [last unloaded: rc_core]
[42655.592293] CPU: 3 PID: 21050 Comm: tvheadend Tainted: P
OE   4.4.59+ #25426
[42655.601138] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/2019
[42655.608624] task: ffff88046d9860c0 ti: ffff8803f8c4c000 task.ti:
ffff8803f8c4c000
[42655.616974] RIP: 0010:[<ffff8803f8e18000>]  [<ffff8803f8e18000>]
0xffff8803f8e18000
[42655.625532] RSP: 0018:ffff8803f8c4fdb8  EFLAGS: 00010087
[42655.631462] RAX: ffff8803f8e17e78 RBX: 0000000000000000 RCX: 00000000000=
00000
[42655.639431] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff8803f8e=
17e78
[42655.647401] RBP: ffff8803f8c4fdf8 R08: 0000000000000000 R09: 00000000000=
00000
[42655.655372] R10: ffff880405bca310 R11: 0000000000000293 R12: ffff8800767=
e95f0
[42655.663342] R13: ffff8800767e95d8 R14: 0000000000000000 R15: 00000000000=
00003
[42655.671311] FS:  00007fda885d2bc0(0000) GS:ffff88047fd80000(0000)
knlGS:0000000000000000
[42655.680351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[42655.686767] CR2: ffff8803f8e18000 CR3: 000000040305a000 CR4: 00000000003=
406f0
[42655.694738] Stack:
[42655.696978]  ffffffff8107fae4 00000001a1073400 0000000000000000
ffff8800767e95e8
[42655.705250]  0000000000000246 0000000000000003 0000000000000001
0000000000000000
[42655.713530]  ffff8803f8c4fe30 ffffffff8107fd35 ffff8800762bc810
ffff880071131340
[42655.721811] Call Trace:
[42655.724543]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
[42655.731057]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
[42655.736691]  [<ffffffffa1072074>] dvb_frontend_release+0x74/0x140 [dvb_c=
ore]
[42655.744566]  [<ffffffff81137eca>] __fput+0xca/0x1d0
[42655.750011]  [<ffffffff81138039>] ____fput+0x9/0x10
[42655.755448]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
[42655.761469]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
[42655.768274]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
[42655.775276]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
[42655.782082] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
00 00 00 02 02 00 00 00 00 00 00 58 7f e1 f8 03 88 ff ff 18 00 00 00
00 00 00 00 <40> b1 d3 03 04 88 ff ff 02 00 00 00 00 00 00 00 01 00 00
00 00
[42655.803398] RIP  [<ffff8803f8e18000>] 0xffff8803f8e18000
[42655.809327]  RSP <ffff8803f8c4fdb8>
[42655.813219] CR2: ffff8803f8e18000
[42655.816921] ---[ end trace a284c55aa9934262 ]---
[42657.226744] lgdt3306a: error (addr 0e reg 0x002 error (ret =3D=3D -110)
[42658.950335] note: tvheadend[21050] exited with preempt_count 1
[42658.992421] hrtimer: interrupt took 2623434 ns

Le lun. 24 ao=C3=BBt 2020 =C3=A0 20:18, Vincent Fortier <th0ma7@gmail.com> =
a =C3=A9crit :
>
> Hi all,
>
> Following Hans reply yesterday I was able to get to compile the media
> tree against Synology 4.4.59 source once again, thnx again!
>
> Since my previous build (dating from may 2019) I noticed a few kernel
> module changes and was able to manually insmod all required modules to
> get my Hauppauge WinTV Dual-Tuner up and running:
> rc/rc-core.ko
> mc/mc.ko
> v4l2-core/videodev.ko
> common/tveeprom.ko
> common/videobuf2/videobuf2-common.ko
> common/videobuf2/videobuf2-v4l2.ko
> common/videobuf2/videobuf2-memops.ko
> common/videobuf2/videobuf2-vmalloc.ko
> dvb-core/dvb-core.ko
> usb/em28xx/em28xx.ko
> usb/em28xx/em28xx-rc.ko
> rc/keymaps/rc-hauppauge.ko
> dvb-frontends/lgdt3306a.ko
> tuners/si2157.ko
> usb/em28xx/em28xx-dvb.ko
>
> It ended-up crashing big-time (and auto-rebooting) when loading the
> last bit "em28xx-dvb.ko".  I don't recall seeing this behaviour
> previously.
>
> Notice that tvheadend was running (normally I stop it before playing
> with modules) which make me believe the following line is related to
> the problem (although I find it weird that a userspace program lead to
> a kernel crash):
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
>
> Thnx in advance (see below for the logs).
>
> - vin
>
>
> Here is the log prior to loading em28xx-dvb.ko:
> [ 4135.666426] rc_core: module verification failed: signature and/or
> required key missing - tainting kernel
> [ 4135.678607] WARNING: You are using an experimental version of the
> media stack.
>                    As the driver is backported to an older kernel, it
> doesn't offer
>                    enough quality for its usage in production.
>                    Use it with care.
>                Latest git patches (needed if you report a bug to
> linux-media@vger.kernel.org):
>                    9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
> venus: core: Add support for opp tables/perf voting
>                    98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
> venus: core: Fix error handling in probe
>                    bbe516e976fce538db96bd2b7287df942faa14a3 media:
> venus: core: Fix runtime PM imbalance in venus_probe
> [ 4143.360590] mc: Linux media interface: v0.10
> [ 4147.850476] videodev: Linux video capture interface: v2.00
> [ 4147.856620] WARNING: You are using an experimental version of the
> media stack.
>                    As the driver is backported to an older kernel, it
> doesn't offer
>                    enough quality for its usage in production.
>                    Use it with care.
>                Latest git patches (needed if you report a bug to
> linux-media@vger.kernel.org):
>                    9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
> venus: core: Add support for opp tables/perf voting
>                    98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
> venus: core: Fix error handling in probe
>                    bbe516e976fce538db96bd2b7287df942faa14a3 media:
> venus: core: Fix runtime PM imbalance in venus_probe
> [ 4183.287387] WARNING: You are using an experimental version of the
> media stack.
>                    As the driver is backported to an older kernel, it
> doesn't offer
>                    enough quality for its usage in production.
>                    Use it with care.
>                Latest git patches (needed if you report a bug to
> linux-media@vger.kernel.org):
>                    9a538b83612c8b5848bf840c2ddcd86dda1c8c76 media:
> venus: core: Add support for opp tables/perf voting
>                    98cd831088c64aa8fe7e1d2a8bb94b6faba0462b media:
> venus: core: Fix error handling in probe
>                    bbe516e976fce538db96bd2b7287df942faa14a3 media:
> venus: core: Fix runtime PM imbalance in venus_probe
> [ 4205.669367] em28xx 1-3:1.0: New device HCW 955D @ 480 Mbps
> (2040:026d, interface 0, class 0)
> [ 4205.678927] em28xx 1-3:1.0: DVB interface 0 found: isoc
> [ 4205.735151] em28xx 1-3:1.0: chip ID is em28174
> [ 4206.857376] em28xx 1-3:1.0: EEPROM ID =3D 26 00 01 00, EEPROM hash =3D=
 0x3d790eca
> [ 4206.865378] em28xx 1-3:1.0: EEPROM info:
> [ 4206.869780] em28xx 1-3:1.0:     microcode start address =3D 0x0004,
> boot configuration =3D 0x01
> [ 4206.884961] em28xx 1-3:1.0:     AC97 audio (5 sample rates)
> [ 4206.890944] em28xx 1-3:1.0:     500mA max power
> [ 4206.895731] em28xx 1-3:1.0:     Table at offset 0x27,
> strings=3D0x0a72, 0x187c, 0x086a
> [ 4206.956155] em28xx 1-3:1.0: Identified as Hauppauge WinTV-dualHD
> 01595 ATSC/QAM (card=3D100)
> [ 4206.967072] tveeprom: Hauppauge model 204101, rev B2I6, serial# 115841=
95
> [ 4206.974622] tveeprom: tuner model is SiLabs Si2157 (idx 186, type 4)
> [ 4206.981799] tveeprom: TV standards PAL(B/G) NTSC(M) PAL(I)
> SECAM(L/L') PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xfc)
> [ 4206.993360] tveeprom: audio processor is None (idx 0)
> [ 4206.999097] tveeprom: has no radio, has IR receiver, has no IR transmi=
tter
> [ 4207.006887] em28xx 1-3:1.0: dvb set to isoc mode.
> [ 4207.065208] em28xx 1-3:1.0: chip ID is em28174
> [ 4208.186420] em28xx 1-3:1.0: EEPROM ID =3D 26 00 01 00, EEPROM hash =3D=
 0x3d790eca
> [ 4208.194467] em28xx 1-3:1.0: EEPROM info:
> [ 4208.198901] em28xx 1-3:1.0:     microcode start address =3D 0x0004,
> boot configuration =3D 0x01
> [ 4208.214294] em28xx 1-3:1.0:     AC97 audio (5 sample rates)
> [ 4208.220256] em28xx 1-3:1.0:     500mA max power
> [ 4208.225053] em28xx 1-3:1.0:     Table at offset 0x27,
> strings=3D0x0a72, 0x187c, 0x086a
> [ 4208.284235] em28xx 1-3:1.0: Identified as Hauppauge WinTV-dualHD
> 01595 ATSC/QAM (card=3D100)
> [ 4208.294617] tveeprom: Hauppauge model 204101, rev B2I6, serial# 115841=
95
> [ 4208.302205] tveeprom: tuner model is SiLabs Si2157 (idx 186, type 4)
> [ 4208.309356] tveeprom: TV standards PAL(B/G) NTSC(M) PAL(I)
> SECAM(L/L') PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xfc)
> [ 4208.320856] tveeprom: audio processor is None (idx 0)
> [ 4208.326518] tveeprom: has no radio, has IR receiver, has no IR transmi=
tter
> [ 4208.334233] em28xx 1-3:1.0: dvb ts2 set to isoc mode.
> [ 4208.540857] usbcore: registered new interface driver em28xx
> [ 4212.702827] em28xx 1-3:1.0: Registering input extension
> [ 4212.730486] rc_core: IR keymap rc-hauppauge not found
> [ 4212.736137] Registered IR keymap rc-empty
> [ 4212.740851] rc rc0: Hauppauge WinTV-dualHD 01595 ATSC/QAM as
> /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/rc/rc0
> [ 4212.752893] rc rc0: lirc_dev: driver em28xx registered at minor =3D
> 0, scancode receiver, no transmitter
> [ 4212.763397] input: Hauppauge WinTV-dualHD 01595 ATSC/QAM as
> /devices/pci0000:00/0000:00:15.0/usb1/1-3/1-3:1.0/rc/rc0/input2
> [ 4212.775968] em28xx 1-3:1.0: Input extension successfully initialized
> [ 4212.783152] em28xx 1-3:1.0: Remote control support is not available
> for this card.
> [ 4212.791680] em28xx: Registered (Em28xx Input Extension) extension
>
>
> Here is the crash output:
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
> [ 2722.681196] BUG: unable to handle kernel paging request at ffff880338b=
d4000
> [ 2722.688978] IP: [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2722.694816] PGD 1a06067 PUD 80000003000001e3
> [ 2722.699685] Oops: 0011 [#1] PREEMPT SMP
> [ 2722.704071] Modules linked in: em28xx_dvb(OE) dvb_core(OE)
> videobuf2_vmalloc(OE) videobuf2_memops(OE) videobuf2_v4l2(OE)
> videobuf2_common(OE) si2157(OE) lgdt3306a(OE) rc_hauppauge(OE)
> em28xx_rc(OE) em28xx(OE) tveeprom(OE) videodev(OE) mc(OE) rc_core(OE)
> pci_stub vhost_net(O) tun kvm_intel kvm irqbypass xt_ipvs ip_vs_rr
> ip_vs xt_mark iptable_mangle br_netfilter bridge stp aufs macvlan veth
> xt_conntrack xt_addrtype nf_conntrack_ipv6 ip6table_filter ip6_tables
> vhost_scsi(O) ipt_MASQUERADE vhost(O) xt_REDIRECT
> nf_nat_masquerade_ipv4 xt_nat iptable_nat nf_nat_ipv4 nf_nat_redirect
> nf_nat xt_recent xt_iprange xt_limit xt_state xt_tcpudp xt_multiport
> xt_LOG nf_conntrack_ipv4 nf_defrag_ipv4 iptable_filter ip_tables
> x_tables cifs udf isofs loop nfsd exportfs rpcsec_gss_krb5 tcm_loop(O)
> iscsi_target_mod(O)
> [ 2722.782921]  target_core_ep(O) target_core_multi_file(O)
> target_core_file(O) target_core_iblock(O) target_core_mod(O)
> syno_extent_pool(PO) rodsp_ep(O) syno_hddmon(P) hid_generic usbhid hid
> usblp usb_storage uhci_hcd ehci_pci ehci_hcd flashcache_syno(O)
> flashcache(O) syno_flashcache_control(O) openvswitch gre
> nf_defrag_ipv6 nf_conntrack apollolake_synobios(PO) leds_lp3943
> exfat(O) btrfs i915 drm_kms_helper syscopyarea sysfillrect sysimgblt
> fb_sys_fops cfbfillrect cfbcopyarea cfbimgblt drm
> drm_panel_orientation_quirks iosf_mbi fb fbdev video backlight button
> synoacl_vfs(PO) hfsplus md4 hmac r8168(O) igb(O) i2c_algo_bit
> e1000e(O) vxlan ip6_udp_tunnel udp_tunnel fuse vfat fat crc32c_intel
> aesni_intel glue_helper lrw gf128mul ablk_helper arc4 cryptd ecryptfs
> sha256_generic ecb aes_x86_64 authenc des_generic
> [ 2722.860981]  ansi_cprng cts md5 cbc cpufreq_powersave
> cpufreq_performance acpi_cpufreq processor cpufreq_stats dm_snapshot
> dm_bufio crc_itu_t crc_ccitt quota_v2 quota_tree psnap p8022 llc sit
> tunnel4 ip_tunnel ipv6 zram sg etxhci_hcd xhci_pci xhci_hcd usbcore
> usb_common [last unloaded: rc_core]
> [ 2722.888785] CPU: 0 PID: 22938 Comm: tvh:fsmonitor Tainted: P
>    OE   4.4.59+ #25426
> [ 2722.898015] Hardware name: Synology DS918+/DS918+, BIOS M.034 11/11/20=
19
> [ 2722.905499] task: ffff8804242ecf00 ti: ffff880408a28000 task.ti:
> ffff880408a28000
> [ 2722.913854] RIP: 0010:[<ffff880338bd4000>]  [<ffff880338bd4000>]
> 0xffff880338bd4000
> [ 2722.922409] RSP: 0018:ffff880408a2bdb8  EFLAGS: 00010006
> [ 2722.928340] RAX: ffff880338bd3e78 RBX: 0000000000000000 RCX: 000000000=
0000000
> [ 2722.936308] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88033=
8bd3e78
> [ 2722.944276] RBP: ffff880408a2bdf8 R08: 0000000000000000 R09: 000000000=
0000000
> [ 2722.952244] R10: ffff88046d9f0010 R11: 0000000000000293 R12: ffff88042=
eae89f0
> [ 2722.960212] R13: ffff88042eae89d8 R14: 0000000000000000 R15: 000000000=
0000003
> [ 2722.968181] FS:  00007f72adce8700(0000) GS:ffff88047fc00000(0000)
> knlGS:0000000000000000
> [ 2722.977216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2722.983629] CR2: ffff880338bd4000 CR3: 0000000417893000 CR4: 000000000=
03406f0
> [ 2722.991594] Stack:
> [ 2722.993834]  ffffffff8107fae4 00000001a0df6400 0000000000000000
> ffff88042eae89e8
> [ 2723.002097]  0000000000000246 0000000000000003 0000000000000001
> 0000000000000000
> [ 2723.010370]  ffff880408a2be30 ffffffff8107fd35 ffff8804625af810
> ffff88044f3e6640
> [ 2723.018640] Call Trace:
> [ 2723.021369]  [<ffffffff8107fae4>] ? __wake_up_common+0x54/0x90
> [ 2723.027880]  [<ffffffff8107fd35>] __wake_up+0x35/0x50
> [ 2723.033517]  [<ffffffffa0df5074>] dvb_frontend_release+0x74/0x140 [dvb=
_core]
> [ 2723.041391]  [<ffffffff81137eca>] __fput+0xca/0x1d0
> [ 2723.046834]  [<ffffffff81138039>] ____fput+0x9/0x10
> [ 2723.052279]  [<ffffffff810638f0>] task_work_run+0x80/0xa0
> [ 2723.058304]  [<ffffffff810020e7>] exit_to_usermode_loop+0xa7/0xb0
> [ 2723.065107]  [<ffffffff810023f4>] syscall_return_slowpath+0x74/0x80
> [ 2723.072096]  [<ffffffff81577582>] int_ret_from_sys_call+0x25/0x93
> [ 2723.078899] Code: ff ff ff 00 00 00 00 00 00 00 00 10 00 00 00 00
> 00 00 00 02 02 00 00 00 00 00 00 58 3f bd 38 03 88 ff ff 18 00 00 00
> 00 00 00 00 <9f> 4d 45 db 93 f1 df e8 06 a8 05 3a 03 13 f2 15 bd 46 f0
> 0a 48
> [ 2723.100213] RIP  [<ffff880338bd4000>] 0xffff880338bd4000
> [ 2723.106141]  RSP <ffff880408a2bdb8>
> [ 2723.110030] CR2: ffff880338bd4000
> [ 2723.113730] ---[ end trace b1179ea04484e38f ]---
> [ 2725.961510] note: tvh:fsmonitor[22938] exited with preempt_count 1
