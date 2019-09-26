Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BE1BECE4
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 09:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfIZHz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 03:55:28 -0400
Received: from gofer.mess.org ([88.97.38.141]:38523 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbfIZHz2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 03:55:28 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A152FC6352; Thu, 26 Sep 2019 08:55:26 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Richard Fontana <rfontana@redhat.com>
Subject: [PATCH 1/2] media: saa7164: use debugfs rather than procfs for debugging file
Date:   Thu, 26 Sep 2019 08:55:25 +0100
Message-Id: <20190926075526.18388-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This moves /proc/saa7164 to /sys/kernel/debug/saa7164.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/saa7164/saa7164-core.c | 159 ++++++++++++++---------
 1 file changed, 97 insertions(+), 62 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 9ae04e18e6c6..51962d109ae9 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -13,12 +13,10 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <asm/div64.h>
 
-#ifdef CONFIG_PROC_FS
-#include <linux/proc_fs.h>
-#endif
 #include "saa7164.h"
 
 MODULE_DESCRIPTION("Driver for NXP SAA7164 based TV cards");
@@ -1045,92 +1043,130 @@ static void saa7164_dev_unregister(struct saa7164_dev *dev)
 	return;
 }
 
-#ifdef CONFIG_PROC_FS
-static int saa7164_proc_show(struct seq_file *m, void *v)
+#ifdef CONFIG_DEBUG_FS
+static void *saa7164_seq_start(struct seq_file *s, loff_t *pos)
 {
 	struct saa7164_dev *dev;
-	struct tmComResBusInfo *b;
-	struct list_head *list;
-	int i, c;
+	loff_t index = *pos;
+
+	mutex_lock(&devlist);
+	list_for_each_entry(dev, &saa7164_devlist, devlist) {
+		if (index-- == 0) {
+			mutex_unlock(&devlist);
+			return dev;
+		}
+	}
+	mutex_unlock(&devlist);
+
+	return NULL;
+}
 
-	if (saa7164_devcount == 0)
-		return 0;
+static void *saa7164_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct saa7164_dev *dev = v;
+	void *ret;
 
-	list_for_each(list, &saa7164_devlist) {
-		dev = list_entry(list, struct saa7164_dev, devlist);
-		seq_printf(m, "%s = %p\n", dev->name, dev);
+	mutex_lock(&devlist);
+	if (list_is_last(&dev->devlist, &saa7164_devlist))
+		ret = NULL;
+	else
+		ret = list_next_entry(dev, devlist);
+	mutex_unlock(&devlist);
 
-		/* Lock the bus from any other access */
-		b = &dev->bus;
-		mutex_lock(&b->lock);
+	++*pos;
+
+	return ret;
+}
+
+static void saa7164_seq_stop(struct seq_file *s, void *v)
+{
+}
 
-		seq_printf(m, " .m_pdwSetWritePos = 0x%x (0x%08x)\n",
-			b->m_dwSetReadPos, saa7164_readl(b->m_dwSetReadPos));
+static int saa7164_seq_show(struct seq_file *m, void *v)
+{
+	struct saa7164_dev *dev = v;
+	struct tmComResBusInfo *b;
+	int i, c;
 
-		seq_printf(m, " .m_pdwSetReadPos  = 0x%x (0x%08x)\n",
-			b->m_dwSetWritePos, saa7164_readl(b->m_dwSetWritePos));
+	seq_printf(m, "%s = %p\n", dev->name, dev);
 
-		seq_printf(m, " .m_pdwGetWritePos = 0x%x (0x%08x)\n",
-			b->m_dwGetReadPos, saa7164_readl(b->m_dwGetReadPos));
+	/* Lock the bus from any other access */
+	b = &dev->bus;
+	mutex_lock(&b->lock);
 
-		seq_printf(m, " .m_pdwGetReadPos  = 0x%x (0x%08x)\n",
-			b->m_dwGetWritePos, saa7164_readl(b->m_dwGetWritePos));
-		c = 0;
-		seq_printf(m, "\n  Set Ring:\n");
-		seq_printf(m, "\n addr  00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f\n");
-		for (i = 0; i < b->m_dwSizeSetRing; i++) {
-			if (c == 0)
-				seq_printf(m, " %04x:", i);
+	seq_printf(m, " .m_pdwSetWritePos = 0x%x (0x%08x)\n",
+		   b->m_dwSetReadPos, saa7164_readl(b->m_dwSetReadPos));
 
-			seq_printf(m, " %02x", readb(b->m_pdwSetRing + i));
+	seq_printf(m, " .m_pdwSetReadPos  = 0x%x (0x%08x)\n",
+		   b->m_dwSetWritePos, saa7164_readl(b->m_dwSetWritePos));
 
-			if (++c == 16) {
-				seq_printf(m, "\n");
-				c = 0;
-			}
-		}
+	seq_printf(m, " .m_pdwGetWritePos = 0x%x (0x%08x)\n",
+		   b->m_dwGetReadPos, saa7164_readl(b->m_dwGetReadPos));
 
-		c = 0;
-		seq_printf(m, "\n  Get Ring:\n");
-		seq_printf(m, "\n addr  00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f\n");
-		for (i = 0; i < b->m_dwSizeGetRing; i++) {
-			if (c == 0)
-				seq_printf(m, " %04x:", i);
+	seq_printf(m, " .m_pdwGetReadPos  = 0x%x (0x%08x)\n",
+		   b->m_dwGetWritePos, saa7164_readl(b->m_dwGetWritePos));
+	c = 0;
+	seq_puts(m, "\n  Set Ring:\n");
+	seq_puts(m, "\n addr  00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f\n");
+	for (i = 0; i < b->m_dwSizeSetRing; i++) {
+		if (c == 0)
+			seq_printf(m, " %04x:", i);
 
-			seq_printf(m, " %02x", readb(b->m_pdwGetRing + i));
+		seq_printf(m, " %02x", readb(b->m_pdwSetRing + i));
 
-			if (++c == 16) {
-				seq_printf(m, "\n");
-				c = 0;
-			}
+		if (++c == 16) {
+			seq_puts(m, "\n");
+			c = 0;
 		}
+	}
+
+	c = 0;
+	seq_puts(m, "\n  Get Ring:\n");
+	seq_puts(m, "\n addr  00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f\n");
+	for (i = 0; i < b->m_dwSizeGetRing; i++) {
+		if (c == 0)
+			seq_printf(m, " %04x:", i);
 
-		mutex_unlock(&b->lock);
+		seq_printf(m, " %02x", readb(b->m_pdwGetRing + i));
 
+		if (++c == 16) {
+			seq_puts(m, "\n");
+			c = 0;
+		}
 	}
 
+	mutex_unlock(&b->lock);
+
 	return 0;
 }
 
-static struct proc_dir_entry *saa7164_pe;
+static const struct seq_operations saa7164_seq_ops = {
+	.start = saa7164_seq_start,
+	.next = saa7164_seq_next,
+	.stop = saa7164_seq_stop,
+	.show = saa7164_seq_show,
+};
 
-static int saa7164_proc_create(void)
+static int saa7164_open(struct inode *inode, struct file *file)
 {
-	saa7164_pe = proc_create_single("saa7164", 0444, NULL, saa7164_proc_show);
-	if (!saa7164_pe)
-		return -ENOMEM;
-
-	return 0;
+	return seq_open(file, &saa7164_seq_ops);
 }
 
-static void saa7164_proc_destroy(void)
+static const struct file_operations saa7164_operations = {
+	.owner          = THIS_MODULE,
+	.open           = saa7164_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = seq_release,
+};
+
+static int __init saa7164_debugfs_create(void)
 {
-	if (saa7164_pe)
-		remove_proc_entry("saa7164", NULL);
+	debugfs_create_file("saa7164", 0444, NULL, NULL, &saa7164_operations);
+	return 0;
 }
 #else
-static int saa7164_proc_create(void) { return 0; }
-static void saa7164_proc_destroy(void) {}
+static int saa7164_debugfs_create(void) { return 0; }
 #endif
 
 static int saa7164_thread_function(void *data)
@@ -1507,7 +1543,7 @@ static int __init saa7164_init(void)
 	if (ret)
 		return ret;
 
-	saa7164_proc_create();
+	saa7164_debugfs_create();
 
 	pr_info("saa7164 driver loaded\n");
 
@@ -1516,7 +1552,6 @@ static int __init saa7164_init(void)
 
 static void __exit saa7164_fini(void)
 {
-	saa7164_proc_destroy();
 	pci_unregister_driver(&saa7164_pci_driver);
 }
 
-- 
2.21.0

