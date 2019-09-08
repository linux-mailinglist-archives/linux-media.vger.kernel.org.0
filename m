Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73449ACA7C
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2019 05:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfIHD5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 23:57:46 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2235 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726706AbfIHD5q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Sep 2019 23:57:46 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 974D8DA47A9BF00C3F41;
        Sun,  8 Sep 2019 11:57:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Sun, 8 Sep 2019 11:57:32 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hulk Robot <hulkci@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH] media: vim2m: Fix BUG_ON in vim2m_device_release()
Date:   Sun, 8 Sep 2019 12:12:54 +0800
Message-ID: <20190908041254.12286-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If v4l2_m2m_init() fails, m2m_dev pointer will be set ERR_PTR(-ENOMEM),
then kfree m2m_dev will triger BUG_ON, see below, fix it by setting m2m_dev
to NULL.

  vim2m vim2m.0: Failed to init mem2mem device
  ------------[ cut here ]------------
  kernel BUG at mm/slub.c:3944!
  invalid opcode: 0000 [#1] SMP PTI
  CPU: 11 PID: 9061 Comm: insmod Tainted: G            E     5.2.0-rc2 #81
  Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
  RIP: 0010:kfree+0x11a/0x160

  Call Trace:
   vim2m_device_release+0x3f/0x50 [vim2m]
   device_release+0x27/0x80
   kobject_release+0x68/0x190
   vim2m_probe+0x20f/0x280 [vim2m]
   platform_drv_probe+0x37/0x90
   really_probe+0xef/0x3d0
   driver_probe_device+0x110/0x120
   device_driver_attach+0x4f/0x60
   __driver_attach+0x9a/0x140
   ? device_driver_attach+0x60/0x60
   bus_for_each_dev+0x76/0xc0
   ? klist_add_tail+0x57/0x70
   bus_add_driver+0x141/0x210
   driver_register+0x5b/0xe0
   vim2m_init+0x29/0x1000 [vim2m]
   do_one_initcall+0x46/0x1f4
   ? __slab_alloc+0x1c/0x30
   ? kmem_cache_alloc_trace+0x167/0x1b0
   do_init_module+0x5b/0x21f
   load_module+0x1add/0x1fb0
   ? __do_sys_finit_module+0xe9/0x110
   __do_sys_finit_module+0xe9/0x110
   do_syscall_64+0x5b/0x1c0
   entry_SYSCALL_64_after_hwframe+0x44/0xa9

Fixes: ea6c7e34f3b2 ("media: vim2m: replace devm_kzalloc by kzalloc")
Reported-by: Hulk Robot <hulkci@huawei.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/media/platform/vim2m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/vim2m.c b/drivers/media/platform/vim2m.c
index acd3bd48c7e2..eb8f398d41f4 100644
--- a/drivers/media/platform/vim2m.c
+++ b/drivers/media/platform/vim2m.c
@@ -1343,6 +1343,7 @@ static int vim2m_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->m2m_dev)) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(dev->m2m_dev);
+		dev->m2m_dev = NULL;
 		goto error_dev;
 	}
 
-- 
2.20.1

