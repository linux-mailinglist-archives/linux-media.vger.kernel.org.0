Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD6945903DF
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbiHKQYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 12:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237850AbiHKQXq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 12:23:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1133BF61;
        Thu, 11 Aug 2022 09:05:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5C7AA6133D;
        Thu, 11 Aug 2022 16:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B1EC433D6;
        Thu, 11 Aug 2022 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660233914;
        bh=5ZvjbRte3VvvlAB6e6K1G9H+gGULctHSXiMEJolGyMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1kiAUfwyt61q3LtSHJH22Le2GQULMRvcUyKxmRHbHyy5kU+TO0eH3iRtv1aTAFqA
         QyzCxNmy7hL7mJk747nJw1kAc6M2qLbDzJwXvlinyTxILgvJWPQ2aHzA0trkEXNOgq
         MqE0VnTnmV/dJN6q8vrA/Sx+q5PBZZq2aygJ/b3sxSQGI0s2Fd+HIEEPF2gjmggkXh
         iBNOO54/O4yxi++vGXqjju3cs2WCh9TA0BBAeV+qC1Oxj4gMUXhmfUytiaUhRi1YGb
         IxW0CXq9hkNYzX+abwIWcqZvVzIV+pHPWgaTK7q1feacnvHw9Z82sB49mafaaCmexo
         Nhtpz0Edv7dSg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vivek Kasireddy <vivek.kasireddy@intel.com>,
        syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sasha Levin <sashal@kernel.org>, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 5.10 12/46] udmabuf: Set the DMA mask for the udmabuf device (v2)
Date:   Thu, 11 Aug 2022 12:03:36 -0400
Message-Id: <20220811160421.1539956-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

[ Upstream commit 9e9fa6a9198b767b00f48160800128e83a038f9f ]

If the DMA mask is not set explicitly, the following warning occurs
when the userspace tries to access the dma-buf via the CPU as
reported by syzbot here:

WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188
__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Modules linked in:
CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted
5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0
83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45
   31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
 get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
 dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f62fcf530f9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

v2: Dont't forget to deregister if DMA mask setup fails.

Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20220520205235.3687336-1-vivek.kasireddy@intel.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/udmabuf.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 2e3b76519b49..b624f3d8f0e6 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -327,7 +327,23 @@ static struct miscdevice udmabuf_misc = {
 
 static int __init udmabuf_dev_init(void)
 {
-	return misc_register(&udmabuf_misc);
+	int ret;
+
+	ret = misc_register(&udmabuf_misc);
+	if (ret < 0) {
+		pr_err("Could not initialize udmabuf device\n");
+		return ret;
+	}
+
+	ret = dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
+					   DMA_BIT_MASK(64));
+	if (ret < 0) {
+		pr_err("Could not setup DMA mask for udmabuf device\n");
+		misc_deregister(&udmabuf_misc);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void __exit udmabuf_dev_exit(void)
-- 
2.35.1

