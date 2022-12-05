Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2492664211C
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 02:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiLEBgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Dec 2022 20:36:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbiLEBgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Dec 2022 20:36:54 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBCC10554
        for <linux-media@vger.kernel.org>; Sun,  4 Dec 2022 17:36:52 -0800 (PST)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NQR2s1GTVz15N5M;
        Mon,  5 Dec 2022 09:36:05 +0800 (CST)
Received: from huawei.com (10.175.101.6) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 5 Dec
 2022 09:36:50 +0800
From:   Lihong Kou <koulihong@huawei.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH -next] media: usb: fix a UAF bug in em28xx_v4l2_init
Date:   Mon, 5 Dec 2022 09:36:46 +0800
Message-ID: <20221205013646.694271-1-koulihong@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the em23xx module init function, we need to unregister video
device in some error case. There is a concurrent scenario as shown
below:
 CPU0                         CPU1
 em28xx_v4l2_init
  mutex_lock(&dev->lock))
 video_register_device
 --register vdev
                                 v4l2_open
                                 em28xx_v4l2_open

 v4l2_mc_create_media_graph
 --failed to create media graph
 kref_put
   free v4l2 ptr
 mutex_unlock(&dev->lock))
                                  mutex_lock(&dev->lock))
                                  em28xx_resolution_set
                                  access v4l2 ptr trigger a UAF problem

Fix the bug by add register status check after grab the mutex in
v4l2_fh_open.
general protection fault, probably for non-canonical address 0xdffffc0000000383: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000000001c18-0x0000000000001c1f]
CPU: 3 PID: 11033 Comm: v4l_id Tainted: G    B   W          6.1.0-rc2-00062-ga970174d7a10-dirty #10
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
RIP: 0010:em28xx_resolution_set.isra.0+0xe8/0x730
Code: 0f 85 cf 05 00 00 44 0f b6 a5 3c 01 00 00 48 8d bb 18 1c 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 41 83 e4 10 <80> 3c 02 00 0f 85 1b 06 00 00 48 8b 83 18 1c 00 00 31 ff 44 89 e6
RSP: 0018:ffffc9001c817818 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000383 RSI: ffffffff863b628d RDI: 0000000000001c18
RBP: ffff8880536d8000 R08: 0000000000000005 R09: 0000000000000002
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: ffff8880536d8000 R14: ffff8880536d813c R15: 0000000000000000
FS:  00007f0809077700(0000) GS:ffff888135d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f79d74a3d78 CR3: 00000000413c3000 CR4: 00000000001526e0
Call Trace:
 <TASK>
 em28xx_v4l2_open+0x455/0x570
 v4l2_open+0x21c/0x3f0
 chrdev_open+0x266/0x770
 do_dentry_open+0x67f/0x13c0
 path_openat+0x1bad/0x27c0
 do_filp_open+0x1c5/0x410
 do_sys_openat2+0x16d/0x4c0
 __x64_sys_open+0x119/0x1c0
 do_syscall_64+0x35/0x80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f0808baf650
Code: 64 48 8b 14 25 00 00 00 00 c7 04 02 02 00 00 00 83 c8 ff e9 fa fe ff ff 66 90 83 3d ad e2 2a 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e a8 01 00 48 89 04 24
RSP: 002b:00007ffc9ad7ba88 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffc9ad7bc48 RCX: 00007f0808baf650
RDX: 0000000000000002 RSI: 0000000000000000 RDI: 00007ffc9ad7cf17
RBP: 0000000000000000 R08: 00007f0808c1c889 R09: 0000000000000000
R10: 00007ffc9ad7b860 R11: 0000000000000246 R12: 0000000000400700
R13: 00007ffc9ad7bc40 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:em28xx_resolution_set.isra.0+0xe8/0x730
Code: 0f 85 cf 05 00 00 44 0f b6 a5 3c 01 00 00 48 8d bb 18 1c 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 41 83 e4 10 <80> 3c 02 00 0f 85 1b 06 00 00 48 8b 83 18 1c 00 00 31 ff 44 89 e6
RSP: 0018:ffffc9001c817818 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000383 RSI: ffffffff863b628d RDI: 0000000000001c18
RBP: ffff8880536d8000 R08: 0000000000000005 R09: 0000000000000002
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: ffff8880536d8000 R14: ffff8880536d813c R15: 0000000000000000
FS:  00007f0809077700(0000) GS:ffff888135d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f79d7482d78 CR3: 00000000413c3000 CR4: 00000000001526e0
----------------
Code disassembly (best guess):
   0:	0f 85 cf 05 00 00    	jne    0x5d5
   6:	44 0f b6 a5 3c 01 00 	movzbl 0x13c(%rbp),%r12d
   d:	00
   e:	48 8d bb 18 1c 00 00 	lea    0x1c18(%rbx),%rdi
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	48 89 fa             	mov    %rdi,%rdx
  22:	48 c1 ea 03          	shr    $0x3,%rdx
  26:	41 83 e4 10          	and    $0x10,%r12d
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 1b 06 00 00    	jne    0x64f
  34:	48 8b 83 18 1c 00 00 	mov    0x1c18(%rbx),%rax
  3b:	31 ff                	xor    %edi,%edi
  3d:	44 89 e6             	mov    %r12d,%esi
Signed-off-by: Lihong Kou <koulihong@huawei.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 25e0620deff1..b8ab42e46c9b 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2150,6 +2150,15 @@ static int em28xx_v4l2_open(struct file *filp)
 	if (mutex_lock_interruptible(&dev->lock))
 		return -ERESTARTSYS;
 
+	if (!video_is_registered(vdev)) {
+		ret = -ENODEV;
+		dev_err(&dev->intf->dev,
+			"%s: v4l2_fh_open() returned error %d\n",
+		       __func__, ret);
+		mutex_unlock(&dev->lock);
+		return ret;
+	}
+
 	ret = v4l2_fh_open(filp);
 	if (ret) {
 		dev_err(&dev->intf->dev,
-- 
2.31.1

