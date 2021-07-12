Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15CB3C4329
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 06:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhGLEiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 00:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhGLEiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 00:38:50 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7DFC0613DD;
        Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id p9so9388102pjl.3;
        Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
        b=gpVU+Nizwy5fV7c592OCz5zlkJDtckkKHt+t8+m6hBQ3v6VktI37EJhTyrTUCRWDDJ
         b3plmZo9+FSFIt+Z+UUXPTDQ3ClQGN0xYSecEYW4uCTOTzZ38Vrj2Y1XpcH1mtoX09zX
         o5jDp4tZqaIxD77sQOOi01uTTGC+DWpf6OaNU3aCMwS+g6tjB3LsJ4ICiA0aLdqR5P6e
         WU91eDHeLOeBsm6wS+pqNydu/XtYdXjglcTrjvyxC6VZQasDQ2Ho0qe+FQJ1P8agROsb
         CPMYKT4cEoedcN2dKSZSDbZsGYojW/RAwBbsH00eF81UuyITQRI5v7uOGBTVDawQj+8c
         Y70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
        b=NEIWyn1n69ipJipCXe8aTSfwTTWxnp/TH/k8W2eIMupD97TfkARlucizzv2rj7x/A/
         wDvrxgeZqOTh6ylJESmfHRLwNUVNh9gZbH0rBuxQ2N24wmBwwzKdUkewoGmj1sp26COr
         /C3rMBUXC1Y8bU1GCQ/1RhKJ+ulpoH3gD8yoIWutNNYbYt5HDittk9FyWJkdiaAYI+vB
         Ww6zyVb0DhEnBAuDf/uCnE2cRQ6oTSYcA8iYKnhmDX+1lJgjwOG08cAU1IbhgnrSHcIk
         KQQhKc1+if5OJSSilYULkF/hc6+aZymviyr+gz1UHgEfltv8rPTHzNuL5xYAX0WdQX5T
         Kz/g==
X-Gm-Message-State: AOAM5330m8/PchlsaKHA2/x40uhsDxZ6jxAXt2+O7Ka8+dr6Re51mX7v
        GBGYXs3ja+dL8hhFoRD2fBk=
X-Google-Smtp-Source: ABdhPJycCswKA9Nno/Iq/J/lSwP8BAVU6u7omTvZ3+UDJe82eUYASx3d6Wullh/KvRQpYfU0QCH8xg==
X-Received: by 2002:a17:90a:2dce:: with SMTP id q14mr28029561pjm.42.1626064561464;
        Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com
Subject: [PATCH v8 2/5] drm: avoid blocking in drm_clients_info's rcu section
Date:   Mon, 12 Jul 2021 12:35:05 +0800
Message-Id: <20210712043508.11584-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside drm_clients_info, the rcu_read_lock is held to lock
pid_task()->comm. However, within this protected section, a call to
drm_is_current_master is made, which involves a mutex lock in a future
patch. However, this is illegal because the mutex lock might block
while in the RCU read-side critical section.

Since drm_is_current_master isn't protected by rcu_read_lock, we avoid
this by moving it out of the RCU critical section.

The following report came from intel-gfx ci's
igt@debugfs_test@read_all_entries testcase:

=============================
[ BUG: Invalid wait context ]
5.13.0-CI-Patchwork_20515+ #1 Tainted: G        W
-----------------------------
debugfs_test/1101 is trying to lock:
ffff888132d901a8 (&dev->master_mutex){+.+.}-{3:3}, at:
drm_is_current_master+0x1e/0x50
other info that might help us debug this:
context-{4:4}
3 locks held by debugfs_test/1101:
 #0: ffff88810fdffc90 (&p->lock){+.+.}-{3:3}, at:
 seq_read_iter+0x53/0x3b0
 #1: ffff888132d90240 (&dev->filelist_mutex){+.+.}-{3:3}, at:
 drm_clients_info+0x63/0x2a0
 #2: ffffffff82734220 (rcu_read_lock){....}-{1:2}, at:
 drm_clients_info+0x1b1/0x2a0
stack backtrace:
CPU: 8 PID: 1101 Comm: debugfs_test Tainted: G        W
5.13.0-CI-Patchwork_20515+ #1
Hardware name: Intel Corporation CometLake Client Platform/CometLake S
UDIMM (ERB/CRB), BIOS CMLSFWR1.R00.1263.D00.1906260926 06/26/2019
Call Trace:
 dump_stack+0x7f/0xad
 __lock_acquire.cold.78+0x2af/0x2ca
 lock_acquire+0xd3/0x300
 ? drm_is_current_master+0x1e/0x50
 ? __mutex_lock+0x76/0x970
 ? lockdep_hardirqs_on+0xbf/0x130
 __mutex_lock+0xab/0x970
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 drm_is_current_master+0x1e/0x50
 drm_clients_info+0x107/0x2a0
 seq_read_iter+0x178/0x3b0
 seq_read+0x104/0x150
 full_proxy_read+0x4e/0x80
 vfs_read+0xa5/0x1b0
 ksys_read+0x5a/0xd0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3d7182001004..b0a826489488 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -91,6 +91,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	mutex_lock(&dev->filelist_mutex);
 	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
 		struct task_struct *task;
+		bool is_current_master = drm_is_current_master(priv);
 
 		rcu_read_lock(); /* locks pid_task()->comm */
 		task = pid_task(priv->pid, PIDTYPE_PID);
@@ -99,7 +100,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(priv->pid),
 			   priv->minor->index,
-			   drm_is_current_master(priv) ? 'y' : 'n',
+			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic);
-- 
2.25.1

