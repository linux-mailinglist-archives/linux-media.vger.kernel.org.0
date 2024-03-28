Return-Path: <linux-media+bounces-8103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B90890256
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 15:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40CE8B22D01
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959312F585;
	Thu, 28 Mar 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="l9LeqVpT"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05A7F49E;
	Thu, 28 Mar 2024 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637639; cv=none; b=IPugyFvwxGOL41c52xRGVmKpogYTBjjTjPTmpYrImgNgdfIj1vUf9zbdKFkncxKp6oqmOJq7wBjk1fkVgm9eoMEvPTL6nF2UHbyCoPSk4QkTJeq8CXy8qa50VGaUOGZtGZ8b6iiJJduUi2ZFwF/hwkuHQGw7WxRHgEMHfXg4AmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637639; c=relaxed/simple;
	bh=q+l+CxYfGh8NmwrdiTXY1xVL3a2sjXtQLxyA/dT0Zoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s8+eLL1jM/v4+9A6HWfyvsVLaC4d0pg2DKwAVqSoMXlwKUsqEoNYsijT3C20VF8eoW9EN05UxCdD4I7VD7ZGSRAt/CV0WRWxxQmeaiQNzqeskRmchq+u4aHdJtCYIoENLJa2/nXIV5HObGUNcJjLl/z+17FLmr3u7gsz0IEBHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=l9LeqVpT; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nkqbgG1HrRF3ejvn+5iZhShKyFwlWg+3aA2aTIsKg7Y=; b=l9LeqVpTWjHKfGQt+kKRgbPf8s
	WDAvhfYh7NGSMUBT3eh5GC3BQi5huG4D9JB5ZBx4Mqb3+esFsPfopskhXCorPVKofm1eftxDa2j5S
	1zLJdlHiqsf2EF/zNn7eSnMC3u1sYU1+U5Xyn5SIXUH5DXkPEZTfI1FmrDxa9xorxPgxxp5A+uewc
	eKLRmXUhXLcxbYcNi0X/ZBMFCRR8GOVw4Ko6rZBT36YuzPkYiG+fY8x2ecMVd8MRFyFjb3WJRreUz
	59LzJf1f8s6AhFmM8GC3eOjxHZzmVJHy3KEkD4qF9EWg6ps8XNaHIVofUMCn1JCp5qUdKpK02FS73
	S2eNoFAg==;
Received: from [84.65.0.132] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rpr8Q-00GHNP-GR; Thu, 28 Mar 2024 15:53:42 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: [PATCH] dma-buf: Do not build debugfs related code when !CONFIG_DEBUG_FS
Date: Thu, 28 Mar 2024 14:53:23 +0000
Message-ID: <20240328145323.68872-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tursulin@ursulin.net>

There is no point in compiling in the list and mutex operations which are
only used from the dma-buf debugfs code, if debugfs is not compiled in.

Put the code in questions behind some kconfig guards and so save some text
and maybe even a pointer per object at runtime when not enabled.

Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com
---
 drivers/dma-buf/dma-buf.c | 56 ++++++++++++++++++++++++---------------
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..8892bc701a66 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -35,12 +35,35 @@
 
 static inline int is_dma_buf_file(struct file *);
 
-struct dma_buf_list {
-	struct list_head head;
-	struct mutex lock;
-};
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static DEFINE_MUTEX(debugfs_list_mutex);
+static LIST_HEAD(debugfs_list);
 
-static struct dma_buf_list db_list;
+static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+{
+	mutex_lock(&debugfs_list_mutex);
+	list_add(&dmabuf->list_node, &debugfs_list);
+	mutex_unlock(&debugfs_list_mutex);
+}
+
+static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
+{
+	if (!dmabuf)
+		return;
+
+	mutex_lock(&debugfs_list_mutex);
+	list_del(&dmabuf->list_node);
+	mutex_unlock(&debugfs_list_mutex);
+}
+#else
+static void __dma_buf_debugfs_list_add(struct dma_buf *dmabuf)
+{
+}
+
+static void __dma_buf_debugfs_list_del(struct file *file)
+{
+}
+#endif
 
 static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
@@ -89,17 +112,10 @@ static void dma_buf_release(struct dentry *dentry)
 
 static int dma_buf_file_release(struct inode *inode, struct file *file)
 {
-	struct dma_buf *dmabuf;
-
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
 
-	dmabuf = file->private_data;
-	if (dmabuf) {
-		mutex_lock(&db_list.lock);
-		list_del(&dmabuf->list_node);
-		mutex_unlock(&db_list.lock);
-	}
+	__dma_buf_debugfs_list_del(file->private_data);
 
 	return 0;
 }
@@ -672,9 +688,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
 
-	mutex_lock(&db_list.lock);
-	list_add(&dmabuf->list_node, &db_list.head);
-	mutex_unlock(&db_list.lock);
+	__dma_buf_debugfs_list_add(dmabuf);
 
 	return dmabuf;
 
@@ -1611,7 +1625,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	size_t size = 0;
 	int ret;
 
-	ret = mutex_lock_interruptible(&db_list.lock);
+	ret = mutex_lock_interruptible(&debugfs_list_mutex);
 
 	if (ret)
 		return ret;
@@ -1620,7 +1634,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	seq_printf(s, "%-8s\t%-8s\t%-8s\t%-8s\texp_name\t%-8s\tname\n",
 		   "size", "flags", "mode", "count", "ino");
 
-	list_for_each_entry(buf_obj, &db_list.head, list_node) {
+	list_for_each_entry(buf_obj, &debugfs_list, list_node) {
 
 		ret = dma_resv_lock_interruptible(buf_obj->resv, NULL);
 		if (ret)
@@ -1657,11 +1671,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 	seq_printf(s, "\nTotal %d objects, %zu bytes\n", count, size);
 
-	mutex_unlock(&db_list.lock);
+	mutex_unlock(&debugfs_list_mutex);
 	return 0;
 
 error_unlock:
-	mutex_unlock(&db_list.lock);
+	mutex_unlock(&debugfs_list_mutex);
 	return ret;
 }
 
@@ -1718,8 +1732,6 @@ static int __init dma_buf_init(void)
 	if (IS_ERR(dma_buf_mnt))
 		return PTR_ERR(dma_buf_mnt);
 
-	mutex_init(&db_list.lock);
-	INIT_LIST_HEAD(&db_list.head);
 	dma_buf_init_debugfs();
 	return 0;
 }
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8ff4add71f88..36216d28d8bd 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -370,8 +370,10 @@ struct dma_buf {
 	 */
 	struct module *owner;
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
 	/** @list_node: node for dma_buf accounting and debugging. */
 	struct list_head list_node;
+#endif
 
 	/** @priv: exporter specific private data for this buffer object. */
 	void *priv;
-- 
2.44.0


