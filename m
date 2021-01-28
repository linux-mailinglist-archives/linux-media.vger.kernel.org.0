Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367CA307DF4
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 19:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhA1S2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 13:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhA1SZb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 13:25:31 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8014C0617AB
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 10:24:50 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id r190so4904379qkf.19
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 10:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:cc;
        bh=yOsjKHLvnoq+T0cRgk6WnsccWWwkkwI2XrElOZ44a4s=;
        b=porQePtnzfaEEOFsSWi2N2ISTIxiVLsHWVuQ63fqGEGA+01eiKaMdEzeylpiGe4p6i
         AK3w2P3xD/FyRZGEot7fbNIrSpjVoIYH8b6DGUS0q2sXMYtiHpfiX7Pp/08PJKrjqCmG
         ZuTbXEOQKpvH1AYzZ10NrY35qtXfgoznu0TWUuYxV2+qZOHNX/rwuqxCHtS8BhEPZov0
         fDuNT3zQ6V+wou8nA6YpLc8w21UAFv+uS8yxv0eggIuX6oldWtEdX4Sj+cneVY9vTNBt
         GKzWjhJlsC9KiqYvBQZ0/YVEbF1zU8W3miC+jzZh6vvqB8pb8BNAjCtcnf4fODvNNvvp
         oMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=yOsjKHLvnoq+T0cRgk6WnsccWWwkkwI2XrElOZ44a4s=;
        b=m2BLi98eTP9MJ5nndel008OgPGxKmQcyq4vCNIq0OZ5MNGJ8YTUrZzkXNseduGZNiz
         Hw+KwvhZz4ZGhJm5EAZSMi0GolxMDBbatdnZIkUD6R6BJTVImL88A8Sv2MzMdLCFZFcM
         C67cYdyLUKs88lBJr9l+wl3BxeIlqa/OPAwKVD21I/lYRgfenTOkcXd5ioAHrYYBGmG0
         XDplM3o2YC3t81F0XF0sNCBu1iu/TsVm6BUgjHZBec5ClJjHIgYJI6lp0HPa6OhdqJtf
         dx0s9vU64f6UNeQBEUhtBjhMvSO/yAQfpAhVl6TwM95iXRx69ilvxdGAuGDAo/VDuLc7
         gJEw==
X-Gm-Message-State: AOAM531Xcp8zr+S7XhUcxNl0j/HRwyiYXM/avN9KjxeNV8C1ZKqGNOf2
        mhz1DXTDjz1j5n1ovjHP24h75BLw6X1fJh2big==
X-Google-Smtp-Source: ABdhPJyWZJlwQXbPHDLiZiexFTqBEceum9TQ0H1iunv+gpZ9nIAVm92XvQEfS5zvz227RluicIR7BvhjdAmt74+0uw==
Sender: "kaleshsingh via sendgmr" <kaleshsingh@kaleshsingh.c.googlers.com>
X-Received: from kaleshsingh.c.googlers.com ([fda3:e722:ac3:10:14:4d90:c0a8:2145])
 (user=kaleshsingh job=sendgmr) by 2002:a05:6214:148a:: with SMTP id
 bn10mr826173qvb.52.1611858289928; Thu, 28 Jan 2021 10:24:49 -0800 (PST)
Date:   Thu, 28 Jan 2021 18:24:30 +0000
In-Reply-To: <20210128182432.2216573-1-kaleshsingh@google.com>
Message-Id: <20210128182432.2216573-2-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20210128182432.2216573-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH 1/2] procfs: Allow reading fdinfo with PTRACE_MODE_READ
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     jannh@google.com, jeffv@google.com, keescook@chromium.org,
        surenb@google.com, minchan@kernel.org, hridya@google.com,
        kernel-team@android.com, Kalesh Singh <kaleshsingh@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since fdinfo doesn't permit reading process memory and manipulating
process state, allow accessing fdinfo under PTRACE_MODE_READ_FSCRED.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 fs/proc/base.c |  4 ++--
 fs/proc/fd.c   | 15 ++++++++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index b3422cda2a91..a37f9de7103f 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -3160,7 +3160,7 @@ static const struct pid_entry tgid_base_stuff[] = {
 	DIR("task",       S_IRUGO|S_IXUGO, proc_task_inode_operations, proc_task_operations),
 	DIR("fd",         S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
 	DIR("map_files",  S_IRUSR|S_IXUSR, proc_map_files_inode_operations, proc_map_files_operations),
-	DIR("fdinfo",     S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
+	DIR("fdinfo",     S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
 	DIR("ns",	  S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
 #ifdef CONFIG_NET
 	DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
@@ -3504,7 +3504,7 @@ static const struct inode_operations proc_tid_comm_inode_operations = {
  */
 static const struct pid_entry tid_base_stuff[] = {
 	DIR("fd",        S_IRUSR|S_IXUSR, proc_fd_inode_operations, proc_fd_operations),
-	DIR("fdinfo",    S_IRUSR|S_IXUSR, proc_fdinfo_inode_operations, proc_fdinfo_operations),
+	DIR("fdinfo",    S_IRUGO|S_IXUGO, proc_fdinfo_inode_operations, proc_fdinfo_operations),
 	DIR("ns",	 S_IRUSR|S_IXUGO, proc_ns_dir_inode_operations, proc_ns_dir_operations),
 #ifdef CONFIG_NET
 	DIR("net",        S_IRUGO|S_IXUGO, proc_net_inode_operations, proc_net_operations),
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index cb51763ed554..585e213301f9 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -6,6 +6,7 @@
 #include <linux/fdtable.h>
 #include <linux/namei.h>
 #include <linux/pid.h>
+#include <linux/ptrace.h>
 #include <linux/security.h>
 #include <linux/file.h>
 #include <linux/seq_file.h>
@@ -72,6 +73,18 @@ static int seq_show(struct seq_file *m, void *v)
 
 static int seq_fdinfo_open(struct inode *inode, struct file *file)
 {
+	bool allowed = false;
+	struct task_struct *task = get_proc_task(inode);
+
+	if (!task)
+		return -ESRCH;
+
+	allowed = ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS);
+	put_task_struct(task);
+
+	if (!allowed)
+		return -EACCES;
+
 	return single_open(file, seq_show, inode);
 }
 
@@ -307,7 +320,7 @@ static struct dentry *proc_fdinfo_instantiate(struct dentry *dentry,
 	struct proc_inode *ei;
 	struct inode *inode;
 
-	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUSR);
+	inode = proc_pid_make_inode(dentry->d_sb, task, S_IFREG | S_IRUGO);
 	if (!inode)
 		return ERR_PTR(-ENOENT);
 
-- 
2.30.0.365.g02bc693789-goog

