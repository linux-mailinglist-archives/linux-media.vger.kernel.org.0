Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E48CA26BA27
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 04:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgIPC27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 22:28:59 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58318 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726399AbgIPC2A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 22:28:00 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 92663282DCA4FDA37810;
        Wed, 16 Sep 2020 10:27:57 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 10:27:48 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] media: saa7164: convert to use DEFINE_SEQ_ATTRIBUTE macro
Date:   Wed, 16 Sep 2020 10:50:24 +0800
Message-ID: <20200916025024.3992731-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 6c08b77bfd47..f3a4e575a782 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1139,32 +1139,21 @@ static int saa7164_seq_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static const struct seq_operations saa7164_seq_ops = {
+static const struct seq_operations saa7164_sops = {
 	.start = saa7164_seq_start,
 	.next = saa7164_seq_next,
 	.stop = saa7164_seq_stop,
 	.show = saa7164_seq_show,
 };
 
-static int saa7164_open(struct inode *inode, struct file *file)
-{
-	return seq_open(file, &saa7164_seq_ops);
-}
-
-static const struct file_operations saa7164_operations = {
-	.owner          = THIS_MODULE,
-	.open           = saa7164_open,
-	.read           = seq_read,
-	.llseek         = seq_lseek,
-	.release        = seq_release,
-};
+DEFINE_SEQ_ATTRIBUTE(saa7164);
 
 static struct dentry *saa7614_dentry;
 
 static void __init saa7164_debugfs_create(void)
 {
 	saa7614_dentry = debugfs_create_file("saa7164", 0444, NULL, NULL,
-					     &saa7164_operations);
+					     &saa7164_fops);
 }
 
 static void __exit saa7164_debugfs_remove(void)
-- 
2.25.1

