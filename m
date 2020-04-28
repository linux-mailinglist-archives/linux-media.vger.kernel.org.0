Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826BB1BB82B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 09:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgD1Hyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 03:54:40 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52143 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726253AbgD1Hyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 03:54:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588060479; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=f/T5W9edoqmG5/Gb8TlNNFSJZNa7ziJ0WeSwP+Ejvek=; b=QFUt0qddNVk6A9MjG4PVO9gg2TecD8Tyw/i2K+QABzVIUQ+HbyIedVHYWbf9BBcxGVflzex+
 iMgUYtek1x/HSq73Us3cyXeWau2R1drCHmXFG4FTz1zbsHpHw52xwPTDo2bpZwrDQuryOFF8
 okZPhPU1RUEucDsM4Dxhjhf4QVE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7e137.7f0129019f48-smtp-out-n01;
 Tue, 28 Apr 2020 07:54:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4356C433BA; Tue, 28 Apr 2020 07:54:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from charante-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ECBA0C433CB;
        Tue, 28 Apr 2020 07:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ECBA0C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=charante@codeaurora.org
From:   Charan Teja Reddy <charante@codeaurora.org>
To:     sumit.semwal@linaro.org, ghackmann@google.com, fengc@google.com
Cc:     linux-media@vger.kernel.org, vinmenon@codeaurora.org,
        Charan Teja Reddy <charante@codeaurora.org>
Subject: [PATCH] dma-buf: fix use-after-free in dmabuffs_dname
Date:   Tue, 28 Apr 2020 13:24:02 +0530
Message-Id: <1588060442-28638-1-git-send-email-charante@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following race occurs while accessing the dmabuf object exported as
file:
P1				P2
dma_buf_release()          dmabuffs_dname()
			   [say lsof reading /proc/<P1 pid>/fd/<num>]

			   read dmabuf stored in dentry->fsdata
Free the dmabuf object
			   Start accessing the dmabuf structure

In the above description, the dmabuf object freed in P1 is being
accessed from P2 which is resulting into the use-after-free. Below is
the dump stack reported.

Call Trace:
 kasan_report+0x12/0x20
 __asan_report_load8_noabort+0x14/0x20
 dmabuffs_dname+0x4f4/0x560
 tomoyo_realpath_from_path+0x165/0x660
 tomoyo_get_realpath
 tomoyo_check_open_permission+0x2a3/0x3e0
 tomoyo_file_open
 tomoyo_file_open+0xa9/0xd0
 security_file_open+0x71/0x300
 do_dentry_open+0x37a/0x1380
 vfs_open+0xa0/0xd0
 path_openat+0x12ee/0x3490
 do_filp_open+0x192/0x260
 do_sys_openat2+0x5eb/0x7e0
 do_sys_open+0xf2/0x180

Fixes: bb2bb90 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
Reported-by: syzbot+3643a18836bce555bff6@syzkaller.appspotmail.com
Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
---
 drivers/dma-buf/dma-buf.c | 25 +++++++++++++++++++++++--
 include/linux/dma-buf.h   |  1 +
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 570c923..069d8f78 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -25,6 +25,7 @@
 #include <linux/mm.h>
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
+#include <linux/dcache.h>
 
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
@@ -38,18 +39,34 @@ struct dma_buf_list {
 
 static struct dma_buf_list db_list;
 
+static void dmabuf_dent_put(struct dma_buf *dmabuf)
+{
+	if (atomic_dec_and_test(&dmabuf->dent_count)) {
+		kfree(dmabuf->name);
+		kfree(dmabuf);
+	}
+}
+
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
 	struct dma_buf *dmabuf;
 	char name[DMA_BUF_NAME_LEN];
 	size_t ret = 0;
 
+	spin_lock(&dentry->d_lock);
 	dmabuf = dentry->d_fsdata;
+	if (!dmabuf || !atomic_add_unless(&dmabuf->dent_count, 1, 0)) {
+		spin_unlock(&dentry->d_lock);
+		goto out;
+	}
+	spin_unlock(&dentry->d_lock);
 	dma_resv_lock(dmabuf->resv, NULL);
 	if (dmabuf->name)
 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	dma_resv_unlock(dmabuf->resv);
+	dmabuf_dent_put(dmabuf);
 
+out:
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
 			     dentry->d_name.name, ret > 0 ? name : "");
 }
@@ -80,12 +97,16 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 static int dma_buf_release(struct inode *inode, struct file *file)
 {
 	struct dma_buf *dmabuf;
+	struct dentry *dentry = file->f_path.dentry;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
 
 	dmabuf = file->private_data;
 
+	spin_lock(&dentry->d_lock);
+	dentry->d_fsdata = NULL;
+	spin_unlock(&dentry->d_lock);
 	BUG_ON(dmabuf->vmapping_counter);
 
 	/*
@@ -108,8 +129,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
 		dma_resv_fini(dmabuf->resv);
 
 	module_put(dmabuf->owner);
-	kfree(dmabuf->name);
-	kfree(dmabuf);
+	dmabuf_dent_put(dmabuf);
 	return 0;
 }
 
@@ -548,6 +568,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
 	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
+	atomic_set(&dmabuf->dent_count, 1);
 
 	if (!resv) {
 		resv = (struct dma_resv *)&dmabuf[1];
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 82e0a4a..a259042 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -315,6 +315,7 @@ struct dma_buf {
 	struct list_head list_node;
 	void *priv;
 	struct dma_resv *resv;
+	atomic_t dent_count;
 
 	/* poll support */
 	wait_queue_head_t poll;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation
