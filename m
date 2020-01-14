Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A752C13AD1E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 16:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgANPHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 10:07:12 -0500
Received: from mail-qk1-f202.google.com ([209.85.222.202]:42846 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgANPHJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 10:07:09 -0500
Received: by mail-qk1-f202.google.com with SMTP id m13so8482198qka.9
        for <linux-media@vger.kernel.org>; Tue, 14 Jan 2020 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HCfFN9AUSNuAj3TKhImiUA6PqoYiqyNpjs0bZyhzWxE=;
        b=R+U82nQw6yFvdQOcBLXdfgS01MqRqJCQQ2RUYp7Bcdzh9S2c3Dha1axAvjGf2YXGIA
         HfzX13dM0kRcEQcC8MR9/IshU399nY4fjevft2Z2GlOW50ABrYhnx/p9gdtGj3wvJizv
         1p74pvXaKcwUyvuOLtgGiu4Zw0i+fRQSNEIm1hDtuDsZq/1PT8if55K8E5fdHJf0JFXU
         gkNXvDyV/2b9NrYT0wUq2NaEyDURuNu3eMpdex1Ujv2cNvAiBwW281pqlVhg46tD28j+
         rC4fxyJ/1/gyTFyN1ilm9RpAgkMsZqc3PiFGSSDQ+RoTFReoYJ6PXq/2kevO20U5lvda
         nGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HCfFN9AUSNuAj3TKhImiUA6PqoYiqyNpjs0bZyhzWxE=;
        b=EtB9bzHCB/qKYnWPVLzeLzv71/Hnq9pxCdn+vyxxcgIbYpckzaKpRPNJc45arzmCF3
         VHyIfFZ0xHlb6TC0ukQlhbeY3UrCST6k56jzdET4d5sK+ffzCsRm3Js83vvpir+XQ23v
         aXWUKRdmzdVBv8ZITruyHQZVaOpHyjf5322VCxXqO2OxR/lYtSPnQawMzraxu/Fb0LFK
         lSRDs91KDJKRz+nsAQoAtB5xSvgfslDW0m/deNPWxQFSfm3Kph5YretdZMXi3pr+Yi0H
         Z58D4kY0ZlO3wTN5XpUqwPJR9eiLAuPaB6DvC7VV5G7+Juib8JIuhdZ303O8YW7Znurp
         5Cyg==
X-Gm-Message-State: APjAAAVvvdXv4VGV3o+ByHU+4pqNx4yV0AmHM80wnnsS69W5M9UZQ7tn
        2CCcD/XGwleP8btRgmrCTmPNRZdN7/z9X88=
X-Google-Smtp-Source: APXvYqze/Qff909HfT3nlf+Gut70+sQevIasyxi5FKY0wfBcvYLEbbIpkoGOX/J1rJx6YdlmcM6feYWdJplCwQ8=
X-Received: by 2002:ac8:2f03:: with SMTP id j3mr4056615qta.180.1579014428121;
 Tue, 14 Jan 2020 07:07:08 -0800 (PST)
Date:   Tue, 14 Jan 2020 23:06:58 +0800
Message-Id: <20200114150658.205302-1-liumartin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH] dma-buf: use spinlock to protect set/get name operation
From:   Martin Liu <liumartin@google.com>
To:     sumit.semwal@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        liumartin@google.com, jenhaochen@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We introduced setname ioctl in commit bb2bb9030425 ("dma-buf:
add DMA_BUF_SET_NAME ioctls") that provides userpsace
to attach a free-form name for tracking and counting shared
buffers. However the d_dname callback could be called in atomic
context. This call path comes from selinux that verifies all
inherited open files from exec call. To verify all inherited
open files, kernel would iterate all fds which need to hold
spin_lock to get denty name by calling d_dname operation.
In dma-buf d_dname callback, we use mutex lock to prevent the
race from setname causing this issue.

This commit adds a spinlock to protect set/get name operation
to fix this issue.

[  165.617090] Call trace:
[  165.620504]  ___might_sleep+0x114/0x118
[  165.625344]  __might_sleep+0x50/0x84
[  165.629928]  __mutex_lock_common+0x5c/0x10b0
[  165.635215]  mutex_lock_nested+0x40/0x50
[  165.640157]  dmabuffs_dname+0x48/0xdc
[  165.644821]  d_path+0x78/0x1e4
[  165.648870]  audit_log_d_path+0x68/0x134
[  165.653807]  common_lsm_audit+0x33c/0x6f4
[  165.658832]  slow_avc_audit+0xb4/0xf0
[  165.663503]  avc_has_perm+0xdc/0x1a4
[  165.668081]  file_has_perm+0x70/0x154
[  165.672750]  match_file+0x54/0x6c
[  165.677064]  iterate_fd+0x74/0xac
[  165.681369]  selinux_bprm_committing_creds+0xfc/0x210
[  165.687459]  security_bprm_committing_creds+0x2c/0x40
[  165.693546]  install_exec_creds+0x1c/0x68
[  165.698569]  load_elf_binary+0x3a0/0x13c8
[  165.703590]  search_binary_handler+0xb8/0x1e4
[  165.708964]  __do_execve_file+0x6e4/0x9c8
[  165.713984]  __arm64_sys_execve+0x44/0x54
[  165.719008]  el0_svc_common+0xa8/0x168
[  165.723765]  el0_svc_handler+0x78/0x94
[  165.728522]  el0_svc+0x8/0xc

Signed-off-by: Martin Liu <liumartin@google.com>
---
 drivers/dma-buf/dma-buf.c | 11 +++++++----
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ce41cd9b758a..7cbcb22ad0e4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -45,10 +45,10 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 	size_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
-	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
 		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
-	dma_resv_unlock(dmabuf->resv);
+	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",
 			     dentry->d_name.name, ret > 0 ? name : "");
@@ -335,6 +335,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 		return PTR_ERR(name);
 
 	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (!list_empty(&dmabuf->attachments)) {
 		ret = -EBUSY;
 		kfree(name);
@@ -344,6 +345,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	dmabuf->name = name;
 
 out_unlock:
+	spin_unlock(&dmabuf->name_lock);
 	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
@@ -403,10 +405,10 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	/* Don't count the temporary reference taken inside procfs seq_show */
 	seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
 	seq_printf(m, "exp_name:\t%s\n", dmabuf->exp_name);
-	dma_resv_lock(dmabuf->resv, NULL);
+	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
 		seq_printf(m, "name:\t%s\n", dmabuf->name);
-	dma_resv_unlock(dmabuf->resv);
+	spin_unlock(&dmabuf->name_lock);
 }
 
 static const struct file_operations dma_buf_fops = {
@@ -561,6 +563,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	dmabuf->file = file;
 
 	mutex_init(&dmabuf->lock);
+	spin_lock_init(&dmabuf->name_lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	mutex_lock(&db_list.lock);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index af73f835c51c..1b138580f746 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -292,6 +292,7 @@ struct dma_buf_ops {
  * @exp_name: name of the exporter; useful for debugging.
  * @name: userspace-provided name; useful for accounting and debugging,
  *        protected by @resv.
+ * @name_lock: lock to protect name.
  * @owner: pointer to exporter module; used for refcounting when exporter is a
  *         kernel module.
  * @list_node: node for dma_buf accounting and debugging.
@@ -320,6 +321,7 @@ struct dma_buf {
 	void *vmap_ptr;
 	const char *exp_name;
 	const char *name;
+	spinlock_t name_lock;
 	struct module *owner;
 	struct list_head list_node;
 	void *priv;
-- 
2.25.0.rc1.283.g88dfdc4193-goog

