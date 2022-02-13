Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25684B3C8C
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 18:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbiBMR3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 12:29:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiBMR3k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 12:29:40 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92971593BE
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644773372;
        bh=eFcjYBAYaxrGRM0Ewx602ik8ffTAdTmF8aNqfQLYMxQ=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=XzUGEO2HsFopAlD3mF7g8Ko3KcDXYb5n6VwDZ/b9HdhPmrP4Idu1Nv9/LMKctwLGw
         90iK9gB3rUi9OFafpaihZXRxFHgGkV1bLWK6bm3QDg8OpO0E0AaRInge/jpPJ7mrCU
         U8sCiDWGYgG3hch6IKiABN5e+aJ7fQYre0W2Zeqg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from couracado.motaleite.net ([5.249.86.255]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mdvqg-1nuHFq0JkM-00b0UA for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022
 18:24:28 +0100
Date:   Sun, 13 Feb 2022 17:24:26 +0000
From:   higuita <higuita@GMX.net>
To:     linux-media@vger.kernel.org
Subject: BUG: KASAN: use-after-free in dvb_frontend_release+0x58/0x260
 [dvb_core]
Message-ID: <20220213172426.375df803@couracado.motaleite.net>
X-Mailer: Claws Mail 3.18.0git331 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
X-Face: &qEAZz'M-P2%W(<TRj?K@>IXcT1`0p3ZOrB?n\$y~}m%W6O%rgb<c+pG(hjeR{<ck{t!0So
 Y"SGN
X-PGP-KeyServer: x-hkp://wwwkeys.eu.pgp.net
X-Operating-System: Slackware Linux 15.0 - amd64
X-Request-PGP: https://motaleite.net/~higuita/public_key.asc
X-Spam-bait-dont-use: sbait@motaleite.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bi0R3JVNIpjn35QJeUHWlWbt/cERHqFw3YTANKpfd8n8X5vBMdS
 mOfu8mO4dqOXH2M+KnU7VxBJ98GYfSYG9E8J7x62h5TVmjh92ChhsUJOlnqc6lUfQ3Qwpn8
 GrHzmcEf/ciVlx3yvoNk+PQQQOw45qgeICXI5gdDyFBunOnw4kk/u2qb4V9QkbuPA/KbNu0
 twU6xP4X5iMOz555bPaGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L5wwaAcHz04=:lmYK4ngR6EvlmteJkR6SJs
 wCTi2o8cb43RofWd8Rwm6QnaB7eU6/l6p2/VnnEMIrketS6qVKXDJvbPHnQrI39J3XmhBIn5j
 0LTXJGWLzeY+xEwkhARyWKjHs9oLAjzRklPoBCLFBhQdBVrFCQAWDp4rTWEsEmXDIchXs4Sw7
 rT63eKHPPZ1BH/24kX+aVZxFw8H2jd5zOd7xU9tI/NeVtsYMW0sIS42sIPgxNAMQTviQIly10
 ttR3MNpwhYM8wJE67deuHBLMsxT5w2cf3S9MbGE2HnrtEUqOKH467KIYwsSjW3pZ0ul5YFwUO
 r39y0bwmvLzrDna3sCJibDfk0IKVl7AcS99ZoEbmg8GzPDFrVtKtCq0AJuA+TeaysLYo3RboP
 8RGmRygUuSWOwUHyq8f4rNFBXrOyH0XPg0iq2Qg0fmudkrEKjH1NQdyTuqOYp0ZbqL92XbnEs
 OOFTnjs7WbJxtIkOKV8wCrbBLlSbTAB+nL3JiFV3oXQMH2tAFi/12u1L9IapuyVwmd4I0syb5
 oEKdhtTS49k4TWWTjtG/hWsxErRu9id58Iu6JqoOofRK+ExULYSphDJUJByy5QXBzZNRsQKJ6
 8h0t9R4jnjB/uVzzhL82eF5qU9QM9AcB+fHAN5aT+gDorVp89446oSO57tjjrbhetYRMjb+UZ
 nqEkQlVXM96lrxhnjJ0okZCz95mdzTFzwlzCKyjUQ10wHFCDJzQZOl3VCQg6Qq9BuZryQ89HL
 5OMyqQsnj66ymR4cYM+tZvMBm7SBCKw/MLjsw8vEnvKEGm4+h6dG/oSuFp4Qg5eFWuwmFKwBq
 7DPcgJaIMOD0m4v4wb40K6SveBjkB8PhJbt1ZtbRWAqiiRT8aRMeqGqpADPuyMH1F050O/k4B
 bzyUDUogcVCagEdwikEeIUeomuB96SugjR2D8Wb8DCXh7O+WOZGVFBwSR8I0WayHv2fQYkzqu
 rTWygJWQDLejKwj2h1GNWSTVnENV39Uz5K4XPim6aK8JFTyROcNnhQb1Z8+2gTtFpAa1NI7BS
 sT8b4F+yPrqsC3nQtAnBhR2plhwLg+ysaW4BVSrAM35vTlfFdrjrEkDi7vGefujpfzq58sgmE
 6Qel9H8ULdo/qE=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

	Using a RTL2832U usb dvb pen and while viewing TV with kaffeine,
i got this KASAN. The usb disconnect was probably due to usb power issues
on this usb hub. Kernel version 5.16.8

[298119.393727] usb 6-2.3: USB disconnect, device number 32
[298119.642513] r820t 14-001a: r820t_write: i2c wr failed=3D-19 reg=3D0c l=
en=3D1: f9
[298135.643925] r820t 14-001a: r820t_write: i2c wr failed=3D-19 reg=3D06 l=
en=3D1: b1
[298135.645183] r820t 14-001a: destroying instance
[298135.648379] dvb_usb_v2: 'Realtek RTL2832U reference design:6-2.3' succ=
essfully deinitialized and disconnected
[298135.827508] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[298135.827518] BUG: KASAN: use-after-free in dvb_frontend_release+0x58/0x=
260 [dvb_core]
[298135.827540] Read of size 8 at addr ffff88836c887440 by task kioslave5/=
3107

[298135.827549] CPU: 1 PID: 3107 Comm: kioslave5 Tainted: G               =
 T 5.16.8-slack #31
[298135.827555] Hardware name: System manufacturer System Product Name/A88=
X-PLUS, BIOS 3003 03/10/2016
[298135.827560] Call Trace:
[298135.827563]  <TASK>
[298135.827566]  dump_stack_lvl+0x34/0x4c
[298135.827576]  print_address_description.constprop.0+0x33/0x160
[298135.827587]  ? dvb_frontend_release+0x58/0x260 [dvb_core]
[298135.827601]  kasan_report.cold+0x83/0xdf
[298135.827609]  ? dvb_frontend_release+0x58/0x260 [dvb_core]
[298135.827624]  dvb_frontend_release+0x58/0x260 [dvb_core]
[298135.827641]  __fput+0x116/0x450
[298135.827649]  ? call_rcu+0x242/0x3a0
[298135.827657]  task_work_run+0x8b/0xd0
[298135.827666]  do_exit+0x631/0x11c0
[298135.827672]  ? vm_iomap_memory+0x71/0x140
[298135.827680]  ? mm_update_next_owner+0x3f0/0x3f0
[298135.827687]  do_group_exit+0x69/0x120
[298135.827693]  __x64_sys_exit_group+0x28/0x30
[298135.827699]  do_syscall_64+0x5c/0xc0
[298135.827707]  ? up_read+0x1f/0xa0
[298135.827713]  ? do_user_addr_fault+0x2a8/0x950
[298135.827721]  ? syscall_exit_to_user_mode+0x1d/0x40
[298135.827728]  ? fpregs_assert_state_consistent+0x7c/0x90
[298135.827735]  ? exit_to_user_mode_prepare+0x52/0x190
[298135.827742]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[298135.827750] RIP: 0033:0x7fb9eefbb879
[298135.827756] Code: Unable to access opcode bytes at RIP 0x7fb9eefbb84f.
[298135.827759] RSP: 002b:00007fff54e39808 EFLAGS: 00000246 ORIG_RAX: 0000=
0000000000e7
[298135.827769] RAX: ffffffffffffffda RBX: 00007fb9ef0b8920 RCX: 00007fb9e=
efbb879
[298135.827773] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 000000000=
0000000
[298135.827777] RBP: 0000000000000000 R08: ffffffffffffff08 R09: 000000000=
0000000
[298135.827781] R10: 00007fb9eeef7e80 R11: 0000000000000246 R12: 00007fb9e=
f0b8920
[298135.827785] R13: 0000000000000071 R14: 00007fb9ef0bde48 R15: 000000000=
0000000
[298135.827791]  </TASK>

[298135.827798] Allocated by task 3042:
[298135.827803]  kasan_save_stack+0x1e/0x50
[298135.827809]  __kasan_kmalloc+0x95/0xd0
[298135.827815]  rtl2832_probe+0xac/0x410 [rtl2832]
[298135.827823]  i2c_device_probe+0x380/0x3e0 [i2c_core]
[298135.827840]  really_probe.part.0+0x12d/0x400
[298135.827849]  __driver_probe_device+0xe0/0x180
[298135.827855]  driver_probe_device+0x61/0x1a0
[298135.827861]  __device_attach_driver+0x141/0x1a0
[298135.827867]  bus_for_each_drv+0x109/0x190
[298135.827873]  __device_attach+0x1bc/0x2b0
[298135.827878]  bus_probe_device+0xed/0x120
[298135.827884]  device_add+0x64d/0xde0
[298135.827889]  i2c_new_client_device+0x2c7/0x410 [i2c_core]
[298135.827901]  rtl2832u_frontend_attach+0x1b0/0x710 [dvb_usb_rtl28xxu]
[298135.827909]  rtl28xxu_frontend_attach+0xec/0x3f0 [dvb_usb_rtl28xxu]
[298135.827915]  dvb_usbv2_probe.cold+0xd4a/0x133e [dvb_usb_v2]
[298135.827922]  usb_probe_interface+0x174/0x350
[298135.827929]  really_probe.part.0+0x12d/0x400
[298135.827935]  __driver_probe_device+0xe0/0x180
[298135.827941]  driver_probe_device+0x61/0x1a0
[298135.827947]  __driver_attach+0x127/0x260
[298135.827953]  bus_for_each_dev+0xe6/0x150
[298135.827959]  bus_add_driver+0x28c/0x2e0
[298135.827964]  driver_register+0x123/0x1b0
[298135.827969]  usb_register_driver+0x122/0x210
[298135.827975]  do_one_initcall+0x89/0x2b0
[298135.827980]  do_init_module+0x102/0x3e0
[298135.827987]  load_module+0x3d5f/0x3e90
[298135.827992]  __do_sys_init_module+0x234/0x270
[298135.827999]  do_syscall_64+0x5c/0xc0
[298135.828005]  entry_SYSCALL_64_after_hwframe+0x44/0xae

[298135.828013] Freed by task 3315:
[298135.828016]  kasan_save_stack+0x1e/0x50
[298135.828021]  kasan_set_track+0x21/0x30
[298135.828026]  kasan_set_free_info+0x20/0x40
[298135.828031]  __kasan_slab_free+0xea/0x130
[298135.828036]  slab_free_freelist_hook+0x66/0x140
[298135.828042]  kfree+0xd6/0x2f0
[298135.828047]  rtl2832_remove+0x60/0x70 [rtl2832]
[298135.828053]  i2c_device_remove+0x35/0xd0 [i2c_core]
[298135.828064]  __device_release_driver+0x226/0x360
[298135.828070]  device_release_driver+0x2e/0x50
[298135.828076]  bus_remove_device+0x177/0x200
[298135.828082]  device_del+0x2d0/0x7a0
[298135.828087]  device_unregister+0xe/0x20
[298135.828092]  rtl28xxu_frontend_detach+0xdb/0x100 [dvb_usb_rtl28xxu]
[298135.828099]  dvb_usbv2_exit.isra.0+0x1ba/0x260 [dvb_usb_v2]
[298135.828106]  dvb_usbv2_disconnect+0xae/0x120 [dvb_usb_v2]
[298135.828112]  usb_unbind_interface+0xee/0x3d0
[298135.828118]  __device_release_driver+0x357/0x360
[298135.828125]  device_release_driver+0x2e/0x50
[298135.828131]  bus_remove_device+0x177/0x200
[298135.828137]  device_del+0x2d0/0x7a0
[298135.828142]  usb_disable_device+0x13e/0x250
[298135.828148]  usb_disconnect.cold+0xe7/0x3ad
[298135.828154]  hub_event+0x1041/0x20c0
[298135.828160]  process_one_work+0x470/0x7a0
[298135.828167]  worker_thread+0x2be/0x7a0
[298135.828172]  kthread+0x223/0x260
[298135.828177]  ret_from_fork+0x22/0x30

[298135.828184] Last potentially related work creation:
[298135.828187]  kasan_save_stack+0x1e/0x50
[298135.828193]  __kasan_record_aux_stack+0xda/0xf0
[298135.828199]  insert_work+0x47/0x1a0
[298135.828205]  __queue_work+0x2d2/0x650
[298135.828211]  call_timer_fn+0x2a/0x190
[298135.828217]  __run_timers.part.0+0x2fb/0x480
[298135.828223]  run_timer_softirq+0x7e/0x150
[298135.828230]  __do_softirq+0x11a/0x3fe

[298135.828238] Second to last potentially related work creation:
[298135.828241]  kasan_save_stack+0x1e/0x50
[298135.828247]  __kasan_record_aux_stack+0xda/0xf0
[298135.828253]  insert_work+0x47/0x1a0
[298135.828259]  __queue_work+0x2d2/0x650
[298135.828264]  call_timer_fn+0x2a/0x190
[298135.828271]  __run_timers.part.0+0x2fb/0x480
[298135.828277]  run_timer_softirq+0x7e/0x150
[298135.828283]  __do_softirq+0x11a/0x3fe

[298135.828291] The buggy address belongs to the object at ffff88836c88700=
0
                 which belongs to the cache kmalloc-2k of size 2048
[298135.828296] The buggy address is located 1088 bytes inside of
                 2048-byte region [ffff88836c887000, ffff88836c887800)
[298135.828301] The buggy address belongs to the page:
[298135.828304] page:0000000000cff7f0 refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0 pfn:0x36c880
[298135.828311] head:0000000000cff7f0 order:3 compound_mapcount:0 compound=
_pincount:0
[298135.828316] flags: 0x4000000000010200(slab|head|zone=3D2)
[298135.828325] raw: 4000000000010200 0000000000000000 dead000000000001 ff=
ff888100042f00
[298135.828330] raw: 0000000000000000 0000000000080008 00000001ffffffff 00=
00000000000000
[298135.828333] page dumped because: kasan: bad access detected

[298135.828338] Memory state around the buggy address:
[298135.828341]  ffff88836c887300: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
[298135.828345]  ffff88836c887380: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
[298135.828349] >ffff88836c887400: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
[298135.828352]                                            ^
[298135.828355]  ffff88836c887480: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
[298135.828359]  ffff88836c887500: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
[298135.828362] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[298135.828365] Disabling lock debugging due to kernel taint


Thanks for the help
higuita
=2D-
Naturally the common people don't want war... but after all it is the
leaders of a country who determine the policy, and it is always a
simple matter to drag the people along, whether it is a democracy, or
a fascist dictatorship, or a parliament, or a communist dictatorship.
Voice or no voice, the people can always be brought to the bidding of
the leaders. That is easy. All you have to do is tell them they are
being attacked, and denounce the pacifists for lack of patriotism and
exposing the country to danger.  It works the same in every country.
           -- Hermann Goering, Nazi and war criminal, 1883-1946
