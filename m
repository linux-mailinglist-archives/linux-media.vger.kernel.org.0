Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502BF6A832A
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjCBNDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjCBNDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788B619F00
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 31310B81219
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B307C4339C;
        Thu,  2 Mar 2023 13:03:48 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 16/17] media: common: saa7146: drop USERPTR support
Date:   Thu,  2 Mar 2023 14:03:29 +0100
Message-Id: <20230302130330.1125172-17-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With USERPTR enabled the following kernel warning appears:

[  113.123640] ------------[ cut here ]------------
[  113.123689] get_vaddr_frames() cannot follow VM_IO mapping
[  113.123731] WARNING: CPU: 2 PID: 1389 at drivers/media/common/videobuf2/frame_vector.c:63 get_vaddr_frames+0x83/0x90 [videobuf2_common]
[  113.123750] Modules linked in: rc_hauppauge ir_kbd_i2c rc_core ivtv_alsa pulse8_cec serport tda9887 tda8290 msp3400 saa7127 hexium_orion tuner_simple tuner_types tea5767 tuner tda9840 tea6415c tea6420 saa7115 ivtv mxb saa7146_vv saa7146 videobuf2_dma_sg cx2341x wmi_bmof videobuf2_memops videobuf2_v4l2 tveeprom videobuf2_common mxm_wmi videodev mc x86_pkg_temp_thermal nouveau drm_ttm_helper thermal
[  113.123838] CPU: 2 PID: 1389 Comm: v4l2-compliance Tainted: G     U             6.2.0-rc7-iszm #39
[  113.123847] Hardware name: System manufacturer System Product Name/H170-PRO, BIOS 3805 05/16/2018
[  113.123854] RIP: 0010:get_vaddr_frames+0x83/0x90 [videobuf2_common]
[  113.123868] Code: 00 00 85 c0 75 dd b8 f2 ff ff ff eb d6 0f 0b 89 c6 eb ac 48 c7 c7 00 e9 32 a0 89 44 24 04 c6 05 06 8b 00 00 01 e8 98 24 d8 e1 <0f> 0b 8b 44 24 04 eb c9 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90
[  113.123876] RSP: 0018:ffffc90001f73a80 EFLAGS: 00010282
[  113.123886] RAX: 0000000000000000 RBX: ffff88813deff800 RCX: 0000000000000000
[  113.123893] RDX: 0000000000000001 RSI: ffffffff829fc76d RDI: 00000000ffffffff
[  113.123900] RBP: 0000000000000000 R08: 00000000ffff7fff R09: 00000000ffff7fff
[  113.123907] R10: ffffffff82e656a0 R11: ffffffff82e656a0 R12: ffff88813deff800
[  113.123914] R13: 0000000000000001 R14: ffff88810545b800 R15: 0000000000000000
[  113.123921] FS:  00007f3ec4809b80(0000) GS:ffff888425c80000(0000) knlGS:0000000000000000
[  113.123929] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  113.123936] CR2: 00007f3ec37ae000 CR3: 00000001516a0004 CR4: 00000000003706e0
[  113.123943] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  113.123949] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  113.123956] Call Trace:
[  113.123962]  <TASK>
[  113.123971]  vb2_create_framevec+0x57/0xb0 [videobuf2_memops]
[  113.123984]  vb2_dma_sg_get_userptr+0x8b/0x150 [videobuf2_dma_sg]
[  113.123999]  __prepare_userptr.constprop.0+0xe4/0x3e0 [videobuf2_common]
[  113.124017]  ? unmap_page_range+0x2ca/0x430
[  113.124027]  ? unmap_vmas+0xf4/0x1d0
[  113.124044]  ? __lock_acquire+0x4b7/0xa00
[  113.124060]  ? lock_acquire+0xd2/0x2d0
[  113.124072]  ? lock_is_held_type+0xdc/0x130
[  113.124089]  __buf_prepare+0x1b6/0x1f0 [videobuf2_common]
[  113.124105]  vb2_core_qbuf+0x242/0x530 [videobuf2_common]
[  113.124124]  vb2_qbuf+0x78/0xb0 [videobuf2_v4l2]
[  113.124140]  __video_do_ioctl+0x19a/0x3e0 [videodev]
[  113.124169]  ? __might_fault+0x31/0x80
[  113.124178]  ? lock_release+0x85/0x170
[  113.124191]  video_usercopy+0x336/0x6b0 [videodev]
[  113.124213]  ? __pfx___video_do_ioctl+0x10/0x10 [videodev]
[  113.124254]  v4l2_ioctl+0x45/0x50 [videodev]
[  113.124275]  __x64_sys_ioctl+0x8c/0xc0
[  113.124286]  do_syscall_64+0x43/0x90
[  113.124296]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  113.124305] RIP: 0033:0x7f3ec4af6bab
[  113.124313] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[  113.124320] RSP: 002b:00007ffc41f63a80 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  113.124330] RAX: ffffffffffffffda RBX: 00007ffc41f63cf0 RCX: 00007f3ec4af6bab
[  113.124337] RDX: 00007ffc41f63ef8 RSI: 00000000c058560f RDI: 0000000000000003
[  113.124343] RBP: 00007ffc41f67ef0 R08: 00000000fffffff8 R09: 0000000000000019
[  113.124350] R10: 0000000000051000 R11: 0000000000000246 R12: 00007ffc41f67ef0
[  113.124357] R13: 00007ffc41f63cf0 R14: 0000000000000000 R15: 00007ffc41f63f50
[  113.124378]  </TASK>
[  113.124385] irq event stamp: 69479
[  113.124391] hardirqs last  enabled at (69489): [<ffffffff8116877d>] __up_console_sem+0x4d/0x60
[  113.124401] hardirqs last disabled at (69498): [<ffffffff81168762>] __up_console_sem+0x32/0x60
[  113.124409] softirqs last  enabled at (68754): [<ffffffff8212f39f>] __do_softirq+0x2bf/0x4dd
[  113.124417] softirqs last disabled at (68749): [<ffffffff810ec449>] __irq_exit_rcu+0xb9/0x120
[  113.124425] ---[ end trace 0000000000000000 ]---

Since USERPTR support is problematic anyway, just drop support for
this. DMABUF is the right way to go.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/saa7146/saa7146_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index 8771b31e1166..3cb8a944d3a0 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -358,7 +358,7 @@ int saa7146_register_device(struct video_device *vfd, struct saa7146_dev *dev,
 		vfd->device_caps &= ~V4L2_CAP_VIDEO_CAPTURE;
 	q->type = type == VFL_TYPE_VIDEO ? V4L2_BUF_TYPE_VIDEO_CAPTURE : V4L2_BUF_TYPE_VBI_CAPTURE;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ | VB2_DMABUF;
+	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
 	q->ops = type == VFL_TYPE_VIDEO ? &video_qops : &vbi_qops;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->drv_priv = dev;
-- 
2.39.1

