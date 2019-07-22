Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F776FEA2
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 13:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfGVLVF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 07:21:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35210 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbfGVLVF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 07:21:05 -0400
Received: from [IPv6:2a02:810a:113f:a6c2::355a] (unknown [IPv6:2a02:810a:113f:a6c2::355a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 66FA728A8A3;
        Mon, 22 Jul 2019 12:21:03 +0100 (BST)
Message-ID: <1563794460.2546.3.camel@collabora.com>
Subject: kernel Warning when using vivid with contiguous dma
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     p.zabel@pengutronix.de, hans.verkuil@cisco.com,
        vincent.abriou@st.com
Cc:     linux-media@vger.kernel.org
Date:   Mon, 22 Jul 2019 13:21:00 +0200
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I loaded the vivid module with contiguous DMA and ran streaming with
it with large image dimensions
here are the commans:

$ uname -a
Linux ubuntu 5.2.0-rc5+ #1 SMP Mon Jul 1 10:17:46 PDT 2019 x86_64
x86_64 x86_64 GNU/Linux
$ sudo modprobe -v vivid
allocators=1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
$ v4l2-ctl -d0 --verbose -v
width=2592,height=1944,pixelformat=UYVY,bytesperline=5184
--stream-mmap --stream-to video.UYVY --list-buffers

Here is the warning that I got:

[  306.437224] WARNING: CPU: 1 PID: 2240 at mm/page_alloc.c:4639
__alloc_pages_nodemask+0x1f3/0x3b0
[  306.437235] Modules linked in: rc_cec vivid v4l2_tpg
videobuf2_dma_contig v4l2_dv_timings v4l2_common videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc cec
rc_core crct10dif_pclmul crc32_pclmul ghash_clmulni_intel vmw_balloon
aesni_intel aes_x86_64 crypto_simd cryptd glue_helper intel_rapl_perf
snd_ens1371 snd_ac97_codec gameport ac97_bus snd_pcm joydev input_leds
serio_raw snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq
snd_seq_device snd_timer snd soundcore vmw_vsock_vmci_transport vsock
vmw_vmci mac_hid sch_fq_codel vmwgfx ttm drm_kms_helper drm
fb_sys_fops syscopyarea sysfillrect sysimgblt parport_pc ppdev lp
parport ip_tables x_tables autofs4 psmouse ahci libahci e1000 mptspi
mptscsih mptbase scsi_transport_spi i2c_piix4 pata_acpi
[  306.437273] CPU: 1 PID: 2240 Comm: v4l2-ctl Not tainted 5.2.0-rc5+
#1
[  306.437275] Hardware name: VMware, Inc. VMware Virtual
Platform/440BX Desktop Reference Platform, BIOS 6.00 04/13/2018
[  306.437277] RIP: 0010:__alloc_pages_nodemask+0x1f3/0x3b0
[  306.437280] Code: fc fe ff ff 65 48 8b 04 25 c0 6d 01 00 48 05 a0
17 00 00 41 bf 01 00 00 00 48 89 45 b0 e9 de fe ff ff 81 e7 00 20 00
00 75 02 <0f> 0b 45 31 ff eb 95 44 8b 6d c0 65 8b 05 fb fd 76 46 89 c0
48 0f
[  306.437282] RSP: 0018:ffffa42584bd39c8 EFLAGS: 00010246
[  306.437284] RAX: 0000000000000000 RBX: 00000000ffffffff RCX:
0000000000000000
[  306.437285] RDX: 0000000000000000 RSI: 000000000000000c RDI:
0000000000000000
[  306.437287] RBP: ffffa42584bd3a20 R08: 0000000000000000 R09:
ffff9054df8072c0
[  306.437289] R10: ffff9054cf074600 R11: 0000000000000000 R12:
0000000000000cc4
[  306.437290] R13: ffffffffc08840d0 R14: 000000000000000c R15:
00000000ffffffff
[  306.437292] FS:  00007f842025f740(0000) GS:ffff9054dfe00000(0000)
knlGS:0000000000000000
[  306.437294] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  306.437296] CR2: 00007ffd81229000 CR3: 000000040ca28005 CR4:
00000000003606e0
[  306.437327] Call Trace:
[  306.437338]  __dma_direct_alloc_pages+0xc9/0x1c0
[  306.437343]  dma_direct_alloc_pages+0x24/0xf0
[  306.437348]  dma_direct_alloc+0xe/0x10
[  306.437351]  dma_alloc_attrs+0x84/0xd0
[  306.437358]  vb2_dc_alloc+0x79/0x110 [videobuf2_dma_contig]
[  306.437365]  __vb2_queue_alloc+0x331/0x490 [videobuf2_common]
[  306.437373]  vb2_core_reqbufs+0x2db/0x470 [videobuf2_common]
[  306.437376]  ? __mutex_lock+0x2f5/0x930
[  306.437385]  vb2_ioctl_reqbufs+0x7e/0xb0 [videobuf2_v4l2]
[  306.437393]  v4l_reqbufs+0x47/0x50 [videodev]
[  306.437400]  __video_do_ioctl+0x194/0x4d0 [videodev]
[  306.437408]  ? tomoyo_init_request_info+0x80/0x90
[  306.437416]  video_usercopy+0x1af/0x760 [videodev]
[  306.437422]  ? v4l_s_fmt+0x6a0/0x6a0 [videodev]
[  306.437437]  video_ioctl2+0x15/0x20 [videodev]
[  306.437442]  v4l2_ioctl+0x49/0x50 [videodev]
[  306.437445]  do_vfs_ioctl+0xa9/0x6d0
[  306.437448]  ? rcu_read_lock_sched_held+0x64/0x70
[  306.437453]  ? tomoyo_file_ioctl+0x19/0x20
[  306.437458]  ksys_ioctl+0x75/0x80
[  306.437462]  ? do_syscall_64+0x17/0x1e0
[  306.437466]  __x64_sys_ioctl+0x1a/0x20
[  306.437469]  do_syscall_64+0x65/0x1e0
[  306.437473]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  306.437475] RIP: 0033:0x7f841f1aa5d7
[  306.437478] Code: b3 66 90 48 8b 05 b1 48 2d 00 64 c7 00 26 00 00
00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 48 2d 00 f7 d8 64 89
01 48
[  306.437479] RSP: 002b:00007ffd812277c8 EFLAGS: 00000202 ORIG_RAX:
0000000000000010
[  306.437482] RAX: ffffffffffffffda RBX: 00007ffd812288e0 RCX:
00007f841f1aa5d7
[  306.437483] RDX: 00007ffd81227830 RSI: 00000000c0145608 RDI:
0000000000000003
[  306.437485] RBP: 00007ffd8122bd00 R08: 0000000000000000 R09:
0000562416280a46
[  306.437486] R10: 00000000000001b6 R11: 0000000000000202 R12:
00007ffd812288e0
[  306.437488] R13: 0000000000000002 R14: 0000000000000002 R15:
0000000000000000
[  306.437498] irq event stamp: 15058
[  306.437501] hardirqs last  enabled at (15057): [<ffffffffb96045a7>]
do_syscall_64+0x17/0x1e0
[  306.437504] hardirqs last disabled at (15058): [<ffffffffb960384c>]
trace_hardirqs_off_thunk+0x1a/0x1c
[  306.437506] softirqs last  enabled at (13490): [<ffffffffba40035a>]
__do_softirq+0x35a/0x409
[  306.437509] softirqs last disabled at (13477): [<ffffffffb969eed6>]
irq_exit+0xc6/0xd0
[  306.437511] ---[ end trace 89b603670b5a81e6 ]---
[  306.437516] vivid vivid.0: dma_alloc_coherent of size 16588800
failed
