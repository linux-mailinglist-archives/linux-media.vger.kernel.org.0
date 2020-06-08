Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64171F2B43
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 02:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731475AbgFIANy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 20:13:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:42102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730768AbgFHXTV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 19:19:21 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E66172089D;
        Mon,  8 Jun 2020 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658359;
        bh=y5Y0wWeH8BGIJjmf28U0mdwIVqHJMGZ1uVis5+Oh1g0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qJQp5vf88XveBh43Yhe81B+mgBjG9ZgPPwlcYPYEmZ7WkcK54Ld/5xHFUdpANgwco
         R2MYCa0meR0TpX4qtaTfmOL4o2EuFGaLqhjWte8CCM13ZNd/HO+2BWhCC9Ov1U9gp/
         U7GoxJtxhKEXr7CmCrx2Dh/CSqJlHiWsrK6L6lYg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH AUTOSEL 5.4 025/175] media: staging: ipu3: Fix stale list entries on parameter queue failure
Date:   Mon,  8 Jun 2020 19:16:18 -0400
Message-Id: <20200608231848.3366970-25-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231848.3366970-1-sashal@kernel.org>
References: <20200608231848.3366970-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomasz Figa <tfiga@chromium.org>

[ Upstream commit 735a02f1bbc2c5e6e9cdbf0222948ff03ff7ab2d ]

When queuing parameters fails, current code bails out without deleting
the corresponding vb2 buffer from the driver buffer list, but the buffer
is returned to vb2. This leads to stale list entries and a crash when
the driver stops streaming:

[  224.935561] ipu3-imgu 0000:00:05.0: set parameters failed.
[  224.998932] ipu3-imgu 0000:00:05.0: set parameters failed.
[  225.064430] ipu3-imgu 0000:00:05.0: set parameters failed.
[  225.128534] ipu3-imgu 0000:00:05.0: set parameters failed.
[  225.194945] ipu3-imgu 0000:00:05.0: set parameters failed.
[  225.360363] ------------[ cut here ]------------
[  225.360372] WARNING: CPU: 0 PID: 6704 at
drivers/media/common/videobuf2/videobuf2-core.c:927
vb2_buffer_done+0x20f/0x21a [videobuf2_common]
[  225.360374] Modules linked in: snd_seq_dummy snd_seq snd_seq_device
veth bridge stp llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp
nf_conntrack_ftp esp6 ah6 ip6t_REJECT ip6t_ipv6header cmac rfcomm uinput
ipu3_imgu(C) ipu3_cio2 iova videobuf2_v4l2 videobuf2_common
videobuf2_dma_sg videobuf2_memops ov13858 ov5670 v4l2_fwnode dw9714
acpi_als xt_MASQUERADE fuse iio_trig_sysfs cros_ec_sensors_ring
cros_ec_light_prox cros_ec_sensors cros_ec_sensors_core
industrialio_triggered_buffer kfifo_buf industrialio
cros_ec_sensorsupport cdc_ether btusb btrtl btintel btbcm usbnet
bluetooth ecdh_generic ecc hid_google_hammer iwlmvm iwl7000_mac80211
r8152 mii lzo_rle lzo_compress iwlwifi zram cfg80211 joydev
[  225.360400] CPU: 0 PID: 6704 Comm: CameraDeviceOps Tainted: G
C        5.4.30 #5
[  225.360402] Hardware name: HP Soraka/Soraka, BIOS
Google_Soraka.10431.106.0 12/03/2019
[  225.360405] RIP: 0010:vb2_buffer_done+0x20f/0x21a [videobuf2_common]
[  225.360408] Code: 5e 41 5f 5d e9 e0 16 5a d4 41 8b 55 08 48 c7 c7 8f
8b 5c c0 48 c7 c6 36 9a 5c c0 44 89 f9 31 c0 e8 a5 1c 5b d4 e9 53 fe ff
ff <0f> 0b eb a3 e8 12 d7 43 d4 eb 97 0f 1f 44 00 00 55 48 89 e5 41 56
[  225.360410] RSP: 0018:ffff9468ab32fba8 EFLAGS: 00010297
[  225.360412] RAX: ffff8aa7a51577a8 RBX: dead000000000122 RCX:
ffff8aa7a51577a8
[  225.360414] RDX: 0000000000000000 RSI: 0000000000000006 RDI:
ffff8aa7a5157400
[  225.360416] RBP: ffff9468ab32fbd8 R08: ffff8aa64e47e600 R09:
0000000000000000
[  225.360418] R10: 0000000000000000 R11: ffffffffc06036e6 R12:
dead000000000100
[  225.360420] R13: ffff8aa7820f1940 R14: ffff8aa7a51577a8 R15:
0000000000000006
[  225.360422] FS:  00007c1146ffd700(0000) GS:ffff8aa7baa00000(0000)
knlGS:0000000000000000
[  225.360424] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  225.360426] CR2: 00007aea3473a000 CR3: 00000000537d6004 CR4:
00000000003606f0
[  225.360427] Call Trace:
[  225.360434]  imgu_return_all_buffers+0x6f/0x8e [ipu3_imgu]
[  225.360438]  imgu_vb2_stop_streaming+0xd6/0xf0 [ipu3_imgu]
[  225.360441]  __vb2_queue_cancel+0x33/0x22d [videobuf2_common]
[  225.360443]  vb2_core_streamoff+0x16/0x78 [videobuf2_common]
[  225.360448]  __video_do_ioctl+0x33d/0x42a
[  225.360452]  video_usercopy+0x34a/0x615
[  225.360455]  ? video_ioctl2+0x16/0x16
[  225.360458]  v4l2_ioctl+0x46/0x53
[  225.360462]  do_vfs_ioctl+0x50a/0x787
[  225.360465]  ksys_ioctl+0x58/0x83
[  225.360468]  __x64_sys_ioctl+0x1a/0x1e
[  225.360470]  do_syscall_64+0x54/0x68
[  225.360474]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  225.360476] RIP: 0033:0x7c118030f497
[  225.360479] Code: 8a 66 90 48 8b 05 d1 d9 2b 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 d9 2b 00 f7 d8 64 89 01 48
[  225.360480] RSP: 002b:00007c1146ffa5a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  225.360483] RAX: ffffffffffffffda RBX: 00007c1140010018 RCX:
00007c118030f497
[  225.360484] RDX: 00007c114001019c RSI: 0000000040045613 RDI:
000000000000004c
[  225.360486] RBP: 00007c1146ffa700 R08: 00007c1140010048 R09:
0000000000000000
[  225.360488] R10: 0000000000000000 R11: 0000000000000246 R12:
00007c11400101b0
[  225.360489] R13: 00007c1140010200 R14: 00007c1140010048 R15:
0000000000000001
[  225.360492] ---[ end trace 73625ecfbd1c930e ]---
[  225.360498] general protection fault: 0000 [#1] PREEMPT SMP PTI
[  225.360501] CPU: 0 PID: 6704 Comm: CameraDeviceOps Tainted: G
WC        5.4.30 #5
[  225.360502] Hardware name: HP Soraka/Soraka, BIOS
Google_Soraka.10431.106.0 12/03/2019
[  225.360505] RIP: 0010:imgu_return_all_buffers+0x52/0x8e [ipu3_imgu]
[  225.360507] Code: d4 49 8b 85 70 0a 00 00 49 81 c5 70 0a 00 00 49 39
c5 74 3b 49 bc 00 01 00 00 00 00 ad de 49 8d 5c 24 22 4c 8b 30 48 8b 48
08 <49> 89 4e 08 4c 89 31 4c 89 20 48 89 58 08 48 8d b8 58 fc ff ff 44
[  225.360509] RSP: 0018:ffff9468ab32fbe8 EFLAGS: 00010293
[  225.360511] RAX: ffff8aa7a51577a8 RBX: dead000000000122 RCX:
dead000000000122
[  225.360512] RDX: 0000000000000000 RSI: 0000000000000006 RDI:
ffff8aa7a5157400
[  225.360514] RBP: ffff9468ab32fc18 R08: ffff8aa64e47e600 R09:
0000000000000000
[  225.360515] R10: 0000000000000000 R11: ffffffffc06036e6 R12:
dead000000000100
[  225.360517] R13: ffff8aa7820f1940 R14: dead000000000100 R15:
0000000000000006
[  225.360519] FS:  00007c1146ffd700(0000) GS:ffff8aa7baa00000(0000)
knlGS:0000000000000000
[  225.360521] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  225.360523] CR2: 00007aea3473a000 CR3: 00000000537d6004 CR4:
00000000003606f0
[  225.360525] Call Trace:
[  225.360528]  imgu_vb2_stop_streaming+0xd6/0xf0 [ipu3_imgu]
[  225.360531]  __vb2_queue_cancel+0x33/0x22d [videobuf2_common]
[  225.360534]  vb2_core_streamoff+0x16/0x78 [videobuf2_common]
[  225.360537]  __video_do_ioctl+0x33d/0x42a
[  225.360540]  video_usercopy+0x34a/0x615
[  225.360542]  ? video_ioctl2+0x16/0x16
[  225.360546]  v4l2_ioctl+0x46/0x53
[  225.360548]  do_vfs_ioctl+0x50a/0x787
[  225.360551]  ksys_ioctl+0x58/0x83
[  225.360554]  __x64_sys_ioctl+0x1a/0x1e
[  225.360556]  do_syscall_64+0x54/0x68
[  225.360559]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  225.360561] RIP: 0033:0x7c118030f497
[  225.360563] Code: 8a 66 90 48 8b 05 d1 d9 2b 00 64 c7 00 26 00 00 00
48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 d9 2b 00 f7 d8 64 89 01 48
[  225.360565] RSP: 002b:00007c1146ffa5a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  225.360567] RAX: ffffffffffffffda RBX: 00007c1140010018 RCX:
00007c118030f497
[  225.360569] RDX: 00007c114001019c RSI: 0000000040045613 RDI:
000000000000004c
[  225.360570] RBP: 00007c1146ffa700 R08: 00007c1140010048 R09:
0000000000000000
[  225.360572] R10: 0000000000000000 R11: 0000000000000246 R12:
00007c11400101b0
[  225.360574] R13: 00007c1140010200 R14: 00007c1140010048 R15:
0000000000000001
[  225.360576] Modules linked in: snd_seq_dummy snd_seq snd_seq_device
veth bridge stp llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp
nf_conntrack_ftp esp6 ah6 ip6t_REJECT ip6t_ipv6header cmac rfcomm uinput
ipu3_imgu(C) ipu3_cio2 iova videobuf2_v4l2 videobuf2_common
videobuf2_dma_sg videobuf2_memops ov13858 ov567

Fix this by moving the list_del() call just below the list_first_entry()
call when the buffer no longer needs to be in the list.

Fixes: 8ecc7c9da013 ("media: staging/intel-ipu3: parameter buffer refactoring")
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/ipu3/ipu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 06a61f31ca50..eb16394acf96 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -261,6 +261,7 @@ int imgu_queue_buffers(struct imgu_device *imgu, bool initial, unsigned int pipe
 
 			ivb = list_first_entry(&imgu_pipe->nodes[node].buffers,
 					       struct imgu_vb2_buffer, list);
+			list_del(&ivb->list);
 			vb = &ivb->vbb.vb2_buf;
 			r = imgu_css_set_parameters(&imgu->css, pipe,
 						    vb2_plane_vaddr(vb, 0));
@@ -274,7 +275,6 @@ int imgu_queue_buffers(struct imgu_device *imgu, bool initial, unsigned int pipe
 			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
 			dev_dbg(&imgu->pci_dev->dev,
 				"queue user parameters %d to css.", vb->index);
-			list_del(&ivb->list);
 		} else if (imgu_pipe->queue_enabled[node]) {
 			struct imgu_css_buffer *buf =
 				imgu_queue_getbuf(imgu, node, pipe);
-- 
2.25.1

