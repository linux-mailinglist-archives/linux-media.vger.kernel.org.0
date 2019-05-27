Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BC72B45F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 14:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfE0MGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 08:06:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17580 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726071AbfE0MGy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 08:06:54 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 84DCA3273ECA518A4663;
        Mon, 27 May 2019 20:06:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Mon, 27 May 2019 20:06:43 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>
Subject: [PATCH v2] media: saa7164: fix remove_proc_entry warning
Date:   Mon, 27 May 2019 20:14:55 +0800
Message-ID: <20190527121455.177296-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <a921e7c8-53a2-bc48-286e-76efa6c4ba07@xs4all.nl>
References: <a921e7c8-53a2-bc48-286e-76efa6c4ba07@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

if saa7164_proc_create() fails, saa7164_fini() will trigger a warning,

name 'saa7164'
WARNING: CPU: 1 PID: 6311 at fs/proc/generic.c:672 remove_proc_entry+0x1e8/0x3a0
  ? remove_proc_entry+0x1e8/0x3a0
  ? try_stop_module+0x7b/0x240
  ? proc_readdir+0x70/0x70
  ? rcu_read_lock_sched_held+0xd7/0x100
  saa7164_fini+0x13/0x1f [saa7164]
  __x64_sys_delete_module+0x30c/0x480
  ? __ia32_sys_delete_module+0x480/0x480
  ? __x64_sys_clock_gettime+0x11e/0x1c0
  ? __x64_sys_timer_create+0x1a0/0x1a0
  ? trace_hardirqs_off_caller+0x40/0x180
  ? do_syscall_64+0x18/0x450
  do_syscall_64+0x9f/0x450
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Fix it by checking the return of proc_create_single() before
calling remove_proc_entry().

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 33 ++++++++++++++++--------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 05f25c9bb308..04d566b1b41e 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1122,16 +1122,25 @@ static int saa7164_proc_show(struct seq_file *m, void *v)
 	return 0;
 }
 
+static struct proc_dir_entry *saa7164_pe;
+
 static int saa7164_proc_create(void)
 {
-	struct proc_dir_entry *pe;
-
-	pe = proc_create_single("saa7164", S_IRUGO, NULL, saa7164_proc_show);
-	if (!pe)
+	saa7164_pe = proc_create_single("saa7164", S_IRUGO, NULL, saa7164_proc_show);
+	if (!saa7164_pe)
 		return -ENOMEM;
 
 	return 0;
 }
+
+static void saa7164_proc_destroy(void)
+{
+	if (saa7164_pe)
+		remove_proc_entry("saa7164", NULL);
+}
+#else
+static int saa7164_proc_create(void) { return 0; }
+static void saa7164_proc_destroy(void) {}
 #endif
 
 static int saa7164_thread_function(void *data)
@@ -1503,19 +1512,21 @@ static struct pci_driver saa7164_pci_driver = {
 
 static int __init saa7164_init(void)
 {
-	printk(KERN_INFO "saa7164 driver loaded\n");
+	int ret = pci_register_driver(&saa7164_pci_driver);
+
+	if (ret)
+		return ret;
 
-#ifdef CONFIG_PROC_FS
 	saa7164_proc_create();
-#endif
-	return pci_register_driver(&saa7164_pci_driver);
+
+	printk(KERN_INFO "saa7164 driver loaded\n");
+
+	return 0;
 }
 
 static void __exit saa7164_fini(void)
 {
-#ifdef CONFIG_PROC_FS
-	remove_proc_entry("saa7164", NULL);
-#endif
+	saa7164_proc_destroy();
 	pci_unregister_driver(&saa7164_pci_driver);
 }
 
-- 
2.20.1

