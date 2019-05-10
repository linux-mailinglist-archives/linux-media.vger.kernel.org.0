Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F31D195EA
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 02:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfEJAAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 20:00:42 -0400
Received: from mail-oi1-f201.google.com ([209.85.167.201]:33291 "EHLO
        mail-oi1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbfEJAAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 20:00:41 -0400
Received: by mail-oi1-f201.google.com with SMTP id m8so1683374oih.0
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZeoJmeVmdaLlUYqpdR4tYo7PLVche4+REuZ+a12ZbZ4=;
        b=oA0+g3tEHKO5sSwmn2RXOjiy2/CqtildrTg4wIqr6a+JAKjsFi/eYYnp8icgip6s6z
         g3omjogp4NWiMcXAluZo1YukLO4m8YphkZtr49cD/LZvSJpQOs89XdmFSQKn2pL7rYtX
         8qcpUC0+gtRJw1C+z3Vnp7Uic/I4NCyOLMDfTQwDWc36+//7shA551ysxFoKWSGUMigd
         HzrHBwUXjuQIi2n3SK5ZAlnjYkaxdG2Zc9l5FbuMRyKTts7/M4wRE7hAG+W5SfDtjE9M
         lbLKeLKruke6SzEc3KBnKq59/RYHAQDcvSOi6+n2FMKQddqK6sdYN/CLCmxFa5frvUyb
         njcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZeoJmeVmdaLlUYqpdR4tYo7PLVche4+REuZ+a12ZbZ4=;
        b=nKPBdLrKbhX805kid35tzkVo+jp9kEfyyVhjmHmdx3GI464pwleNepbiGBAjYG7i0X
         hjWnsfrveP4XWn6KcDVPBE+n70EvEoJyW5m3eVxnlCUfMYICWtdx8LBj5ikmVLNT8hHd
         F+oXXQIllXzm+W6SJ7JoPA0mqOHSO7rCyIXABk8HP7Dq4Wowt5Y+iuYWtYT3TIyxrR+t
         kyO2wdVU3syOWDdaNScKHfl0mQ3S4aphZSTXvH4kYQYdYmQBcuHPBqvcGJcfm8aB5G68
         r2vM36cFkMGbrRYll0sg001NshvoCLDKUWEn8tbR0XQjtsdk/sceer3lVGVyK+wubehi
         hLXQ==
X-Gm-Message-State: APjAAAVFjh02//KRUV5QKHn+kEnz0MTPiDiKW+l6dMAi0fy6XuC0sJ71
        0yUH5MeDgvvkolkAxguBMRw1bJNOJw==
X-Google-Smtp-Source: APXvYqzG6xLzpbiFMvx9NI0qwQGX5W5Vqzds/q7jeKS4RVpx2YMuk0v6g5xOIEd2iz26P4xRk0I2Lhh1Pw==
X-Received: by 2002:aca:4f11:: with SMTP id d17mr2055944oib.9.1557446440191;
 Thu, 09 May 2019 17:00:40 -0700 (PDT)
Date:   Thu,  9 May 2019 17:00:31 -0700
In-Reply-To: <20190510000032.40749-1-fengc@google.com>
Message-Id: <20190510000032.40749-3-fengc@google.com>
Mime-Version: 1.0
References: <20190510000032.40749-1-fengc@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [dma-buf v3 2/3] dma-buf: add DMA_BUF_{GET,SET}_NAME ioctls
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

This patch adds complimentary DMA_BUF_SET_NAME and DMA_BUF_GET_NAME
ioctls, which lets userspace processes attach a free-form name to each
buffer.

This information can be extremely helpful for tracking and accounting
shared buffers.  For example, on Android, we know what each buffer will
be used for at allocation time: GL, multimedia, camera, etc.  The
userspace allocator can use DMA_BUF_SET_NAME to associate that
information with the buffer, so we can later give developers a
breakdown of how much memory they're allocating for graphics, camera,
etc.

Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Chenbo Feng <fengc@google.com>
---
 drivers/dma-buf/dma-buf.c    | 49 +++++++++++++++++++++++++++++++++---
 include/linux/dma-buf.h      |  5 +++-
 include/uapi/linux/dma-buf.h |  3 +++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ffd5a2ad7d6f..c1da5f9ce44d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -48,8 +48,24 @@ struct dma_buf_list {
 
 static struct dma_buf_list db_list;
 
+static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
+{
+	struct dma_buf *dmabuf;
+	char name[DMA_BUF_NAME_LEN];
+	size_t ret = 0;
+
+	dmabuf = dentry->d_fsdata;
+	mutex_lock(&dmabuf->lock);
+	if (dmabuf->name)
+		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+	mutex_unlock(&dmabuf->lock);
+
+	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
+			     dentry->d_name.name, ret > 0 ? name : "");
+}
+
 static const struct dentry_operations dma_buf_dentry_ops = {
-	.d_dname = simple_dname,
+	.d_dname = dmabuffs_dname,
 };
 
 static struct vfsmount *dma_buf_mnt;
@@ -297,6 +313,27 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	return events;
 }
 
+static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
+{
+	char *name = strndup_user(buf, DMA_BUF_NAME_LEN);
+	long ret = 0;
+
+	if (IS_ERR(name))
+		return PTR_ERR(name);
+
+	mutex_lock(&dmabuf->lock);
+	if (!list_empty(&dmabuf->attachments)) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	kfree(dmabuf->name);
+	dmabuf->name = name;
+
+out_unlock:
+	mutex_unlock(&dmabuf->lock);
+	return ret;
+}
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -335,6 +372,10 @@ static long dma_buf_ioctl(struct file *file,
 			ret = dma_buf_begin_cpu_access(dmabuf, direction);
 
 		return ret;
+
+	case DMA_BUF_SET_NAME:
+		return dma_buf_set_name(dmabuf, (const char __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
@@ -376,6 +417,7 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
 		goto err_alloc_file;
 	file->f_flags = flags & (O_ACCMODE | O_NONBLOCK);
 	file->private_data = dmabuf;
+	file->f_path.dentry->d_fsdata = dmabuf;
 
 	return file;
 
@@ -1082,12 +1124,13 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 			continue;
 		}
 
-		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\n",
+		seq_printf(s, "%08zu\t%08x\t%08x\t%08ld\t%s\t%08lu\t%s\n",
 				buf_obj->size,
 				buf_obj->file->f_flags, buf_obj->file->f_mode,
 				file_count(buf_obj->file),
 				buf_obj->exp_name,
-				file_inode(buf_obj->file)->i_ino);
+				file_inode(buf_obj->file)->i_ino,
+				buf_obj->name ?: "");
 
 		robj = buf_obj->resv;
 		while (true) {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 58725f890b5b..582998e19df6 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -255,10 +255,12 @@ struct dma_buf_ops {
  * @file: file pointer used for sharing buffers across, and for refcounting.
  * @attachments: list of dma_buf_attachment that denotes all devices attached.
  * @ops: dma_buf_ops associated with this buffer object.
- * @lock: used internally to serialize list manipulation, attach/detach and vmap/unmap
+ * @lock: used internally to serialize list manipulation, attach/detach and
+ *        vmap/unmap, and accesses to name
  * @vmapping_counter: used internally to refcnt the vmaps
  * @vmap_ptr: the current vmap ptr if vmapping_counter > 0
  * @exp_name: name of the exporter; useful for debugging.
+ * @name: userspace-provided name; useful for accounting and debugging.
  * @owner: pointer to exporter module; used for refcounting when exporter is a
  *         kernel module.
  * @list_node: node for dma_buf accounting and debugging.
@@ -286,6 +288,7 @@ struct dma_buf {
 	unsigned vmapping_counter;
 	void *vmap_ptr;
 	const char *exp_name;
+	const char *name;
 	struct module *owner;
 	struct list_head list_node;
 	void *priv;
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index d75df5210a4a..dbc7092e04b5 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -35,7 +35,10 @@ struct dma_buf_sync {
 #define DMA_BUF_SYNC_VALID_FLAGS_MASK \
 	(DMA_BUF_SYNC_RW | DMA_BUF_SYNC_END)
 
+#define DMA_BUF_NAME_LEN	32
+
 #define DMA_BUF_BASE		'b'
 #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
+#define DMA_BUF_SET_NAME	_IOW(DMA_BUF_BASE, 1, const char *)
 
 #endif
-- 
2.21.0.1020.gf2820cf01a-goog

