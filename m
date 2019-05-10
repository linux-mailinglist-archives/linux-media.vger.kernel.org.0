Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0216F195EC
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 02:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfEJAAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 20:00:38 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:53006 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfEJAAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 20:00:38 -0400
Received: by mail-qt1-f202.google.com with SMTP id c48so3261253qta.19
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 17:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=gajNK+eaXAkA4VRl6/dTyngKGgS840DD0yMbWQwHpJk=;
        b=StQx3pXTz9nlOqpe4jzFUgYd8pSqETXTQnTWa9CFOUrMtJPFB16HL/knloQh0RvsDL
         YEG1/aMcAQdEJ7eeT6+Ec/x4kt0MgcKkTAzForocIa0xsDIqFTNOoVPzcpfDHsf5e7CW
         AORrgXG9ozxsU8TDoeFyf1PjTy+3Jx6JhJnOYJ3kKQv13cMuZl/NXFztkd/JzpEMYtQK
         UHHxe38yoAmLaTa7Ep7j92pCbpXvYH2McHunc0CA83y7iFE81kDp1aHFg1Msi/WGhyZP
         OMNagW/InIDVAHIc5PHIhPfNJw02NNDYMg3eqBvFy/ic3uHIdkW/XDwE4MKYAXF44AaE
         E3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=gajNK+eaXAkA4VRl6/dTyngKGgS840DD0yMbWQwHpJk=;
        b=CZOLtp0dhQ7l9zP0MRxaReHwJTT3xeKNXLhhnSsF+seF2zshWRtqgRK3r11ocp5NoY
         9oucBUyByVtMi410XoIZbq0MHeiQAPkWMris8HFFIWV0+OWEYTn2rRcGPk9uay/sozaE
         zhvH/8OPTY4zN+vZbRHraQCazJbHuRXTntbawCpxrX2VKBKQ2n9PrsR8ACrypEnvP8or
         pF8vKDaUQhv2/L7y51gPoK69IbMCr51HaaVJ1FgZh+nh8PbtCdpkShIGzR6cHW2oCReu
         kPehB82fEHXaXGtFsRMnvNAQ54mTFGWn3mXeSGN7bjqMKyQlbGQq+WJluWhmVER2JX6E
         bzNg==
X-Gm-Message-State: APjAAAXfuyyLPfixyzsnJaFkFzH3izFOUIXSe/Fl9hZiey+8Xb7VIxvP
        TQDFniw+yXXDFbWdHZdmxxPpVPTcPA==
X-Google-Smtp-Source: APXvYqyrykg6LhonB5E0Xc2fQnfppFoKDq3KTv5cA/JDKFevQ+EjrXDwR8LM84x3PrH7bXcbkJ2Fbz+60g==
X-Received: by 2002:ac8:375d:: with SMTP id p29mr6286750qtb.88.1557446437681;
 Thu, 09 May 2019 17:00:37 -0700 (PDT)
Date:   Thu,  9 May 2019 17:00:30 -0700
In-Reply-To: <20190510000032.40749-1-fengc@google.com>
Message-Id: <20190510000032.40749-2-fengc@google.com>
Mime-Version: 1.0
References: <20190510000032.40749-1-fengc@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [dma-buf v3 1/3] dma-buf: give each buffer a full-fledged inode
From:   Chenbo Feng <fengc@google.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, erickreyes@google.com,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Greg Hackmann <ghackmann@google.com>

By traversing /proc/*/fd and /proc/*/map_files, processes with CAP_ADMIN
can get a lot of fine-grained data about how shmem buffers are shared
among processes.  stat(2) on each entry gives the caller a unique
ID (st_ino), the buffer's size (st_size), and even the number of pages
currently charged to the buffer (st_blocks / 512).

In contrast, all dma-bufs share the same anonymous inode.  So while we
can count how many dma-buf fds or mappings a process has, we can't get
the size of the backing buffers or tell if two entries point to the same
dma-buf.  On systems with debugfs, we can get a per-buffer breakdown of
size and reference count, but can't tell which processes are actually
holding the references to each buffer.

Replace the singleton inode with full-fledged inodes allocated by
alloc_anon_inode().  This involves creating and mounting a
mini-pseudo-filesystem for dma-buf, following the example in fs/aio.c.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Chenbo Feng <fengc@google.com>
---
 drivers/dma-buf/dma-buf.c  | 63 ++++++++++++++++++++++++++++++++++----
 include/uapi/linux/magic.h |  1 +
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 7c858020d14b..ffd5a2ad7d6f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -34,8 +34,10 @@
 #include <linux/poll.h>
 #include <linux/reservation.h>
 #include <linux/mm.h>
+#include <linux/mount.h>
 
 #include <uapi/linux/dma-buf.h>
+#include <uapi/linux/magic.h>
 
 static inline int is_dma_buf_file(struct file *);
 
@@ -46,6 +48,25 @@ struct dma_buf_list {
 
 static struct dma_buf_list db_list;
 
+static const struct dentry_operations dma_buf_dentry_ops = {
+	.d_dname = simple_dname,
+};
+
+static struct vfsmount *dma_buf_mnt;
+
+static struct dentry *dma_buf_fs_mount(struct file_system_type *fs_type,
+		int flags, const char *name, void *data)
+{
+	return mount_pseudo(fs_type, "dmabuf:", NULL, &dma_buf_dentry_ops,
+			DMA_BUF_MAGIC);
+}
+
+static struct file_system_type dma_buf_fs_type = {
+	.name = "dmabuf",
+	.mount = dma_buf_fs_mount,
+	.kill_sb = kill_anon_super,
+};
+
 static int dma_buf_release(struct inode *inode, struct file *file)
 {
 	struct dma_buf *dmabuf;
@@ -338,6 +359,31 @@ static inline int is_dma_buf_file(struct file *file)
 	return file->f_op == &dma_buf_fops;
 }
 
+static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
+{
+	struct file *file;
+	struct inode *inode = alloc_anon_inode(dma_buf_mnt->mnt_sb);
+
+	if (IS_ERR(inode))
+		return ERR_CAST(inode);
+
+	inode->i_size = dmabuf->size;
+	inode_set_bytes(inode, dmabuf->size);
+
+	file = alloc_file_pseudo(inode, dma_buf_mnt, "dmabuf",
+				 flags, &dma_buf_fops);
+	if (IS_ERR(file))
+		goto err_alloc_file;
+	file->f_flags = flags & (O_ACCMODE | O_NONBLOCK);
+	file->private_data = dmabuf;
+
+	return file;
+
+err_alloc_file:
+	iput(inode);
+	return file;
+}
+
 /**
  * DOC: dma buf device access
  *
@@ -433,8 +479,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	}
 	dmabuf->resv = resv;
 
-	file = anon_inode_getfile("dmabuf", &dma_buf_fops, dmabuf,
-					exp_info->flags);
+	file = dma_buf_getfile(dmabuf, exp_info->flags);
 	if (IS_ERR(file)) {
 		ret = PTR_ERR(file);
 		goto err_dmabuf;
@@ -1025,8 +1070,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 		return ret;
 
 	seq_puts(s, "\nDma-buf Objects:\n");
-	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\n",
-		   "size", "flags", "mode", "count");
+	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\n",
+		   "size", "flags", "mode", "count", "ino");
 
 	list_for_each_entry(buf_obj, &db_list.head, list_node) {
 		ret = mutex_lock_interruptible(&buf_obj->lock);
@@ -1037,11 +1082,12 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 			continue;
 		}
 
-		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\n",
+		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
 				file_count(buf_obj->file),
-				buf_obj->exp_name);
+				buf_obj->exp_name,
+				file_inode(buf_obj->file)->i_ino);
 
 		robj = buf_obj->resv;
 		while (true) {
@@ -1136,6 +1182,10 @@ static inline void dma_buf_uninit_debugfs(void)
 
 static int __init dma_buf_init(void)
 {
+	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
+	if (IS_ERR(dma_buf_mnt))
+		return PTR_ERR(dma_buf_mnt);
+
 	mutex_init(&db_list.lock);
 	INIT_LIST_HEAD(&db_list.head);
 	dma_buf_init_debugfs();
@@ -1146,5 +1196,6 @@ subsys_initcall(dma_buf_init);
 static void __exit dma_buf_deinit(void)
 {
 	dma_buf_uninit_debugfs();
+	kern_unmount(dma_buf_mnt);
 }
 __exitcall(dma_buf_deinit);
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index f8c00045d537..665e18627f78 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -91,5 +91,6 @@
 #define UDF_SUPER_MAGIC		0x15013346
 #define BALLOON_KVM_MAGIC	0x13661366
 #define ZSMALLOC_MAGIC		0x58295829
+#define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
 
 #endif /* __LINUX_MAGIC_H__ */
-- 
2.21.0.1020.gf2820cf01a-goog

