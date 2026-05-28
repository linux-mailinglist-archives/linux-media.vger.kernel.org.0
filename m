Return-Path: <linux-media+bounces-62946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J7QKfT9F2oTYQgAu9opvQ
	(envelope-from <linux-media+bounces-62946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:33:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 505CA5EEA42
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 10:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1376B30769E9
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 08:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DB4318B9D;
	Thu, 28 May 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bHgBkqpW"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93837FF5A;
	Thu, 28 May 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957033; cv=none; b=CqOrS/J55Uw9m8SyXBKquOGyX7FNAVaXCtYZxQX7XGZMKNQdhDbFOrCJvFV1jsiGbOT0kaRg3w4NuW4hmrgUXyUaBhC03pm7x3EKi4S3SMzs6yR3laJ8Llpo6kXvV+cXFxyHsoQD0WwH0leqhscUgEWhv8ZmrXMsg41TvFWXVMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957033; c=relaxed/simple;
	bh=iOVvP7tzc8ITp05VV3fN7R6yOndkX0tN9xPDQsTKN7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dCWLI70Lpy4YZt9j/IezA6bvr6SwSlohII7OUT5Dn+MyRMhz39jyktEyB5Pi78VJoJJVYO86cCtcLQI33V9EkxZHwUxPD6bp/3ETtqGXWQegof6OK0j0gBCC9FDQXwMIQz9tTzUxkGbTPVOqWLuegx02/WbfRicmEaUfsHRjB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bHgBkqpW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n0
	3eoOtM3eHsClG29ijMHpetVoDW9xstf0etlqEH/3I=; b=bHgBkqpWxzkBp7BEs9
	fVdDHTiMq4OCJFhh4wQoWgS5Z+Xs2qAbwmfADZYtwwu/7l3T4JBVxH3PcE4SXJQK
	AbU3mTpIHauqMtbOs3pMwdubdKpP0WfJJMTeo91MCJpK6lbbLyUtGj/OnBojhtdG
	deIOR5YM5130/xGIEFJOYPQtk=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnv_3a_BdqOMI7AA--.8856S2;
	Thu, 28 May 2026 16:29:18 +0800 (CST)
From: w15303746062@163.com
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: jeffy.chen@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/prime: Fix unsupervised rb_tree corruption in drm_prime_remove_buf_handle
Date: Thu, 28 May 2026 16:29:12 +0800
Message-Id: <20260528082912.1051262-1-w15303746062@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnv_3a_BdqOMI7AA--.8856S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1xWF48Kw1xXw1xXw18Xwb_yoW5KFyfpF
	W3tryYkr48JF42gayIy3W7Zas3Aa1fWF4xWa92qr93Z3s0yr1xurWayFyj9rW5Gr97GryY
	qFyUJw15KFyjkrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5EfOUUUUU=
X-CM-SenderInfo: jzrvjiatxuliiws6il2tof0z/xtbDAB7WumoX-N6FmwAA3z
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62946-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w15303746062@163.com,linux-media@vger.kernel.org]
X-Rspamd-Queue-Id: 505CA5EEA42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mingyu Wang <25181214217@stu.xidian.edu.cn>

Syzkaller fuzzer triggered a kernel panic via a WARNING in
drm_prime_destroy_file_private() due to a non-empty prime rb_tree.

The root cause is a complete lack of synchronization in the teardown
path. While the import path (drm_gem_prime_fd_to_handle) holds the
&file_priv->prime.lock during lookup and insertion, the deletion path
(drm_prime_remove_buf_handle) traverses and mutates both the 'handles'
and 'dmabufs' rb_trees without acquiring any mutex.

When multiple threads concurrently close GEM handles or interleave import
and close operations, the pointers and balance states of the rb_tree
nodes get corrupted. As a result, certain members are erased from one
tree but remain orphaned in the other. Upon process exit, the final
sanity check triggers the WARNING.

[    448.919314][T19739] ------------[ cut here ]------------
[    448.945387][T19739] WARNING: CPU: 0 PID: 19739 at drivers/gpu/drm/drm_prime.c:223 drm_prime_destroy_file_private+0x43/0x60
...
[    449.056535][T19739] Call Trace:
[    449.056544][T19739]  <TASK>
[    449.056553][T19739]  drm_file_free.part.0+0x805/0xcf0
[    449.056652][T19739]  drm_close_helper.isra.0+0x183/0x1f0
[    449.056677][T19739]  drm_release+0x1ab/0x360
[    449.056719][T19739]  __fput+0x402/0xb50
[    449.056783][T19739]  task_work_run+0x16b/0x260
[    449.056883][T19739]  exit_to_user_mode_loop+0xf9/0x130
[    449.056931][T19739]  do_syscall_64+0x424/0xfa0
[    449.056977][T19739]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    449.057268][T19739]  </TASK>
[    449.057295][T19739] Kernel panic - not syncing: kernel: panic_on_warn set ...

Fix this by acquiring the prime_fpriv->lock mutex around the rb_tree
lookup and erasure logic. To respect the locking rules and avoid potential
deadlocks with driver-specific memory cleanups, assign the target node to
a temporary pointer and defer the dma_buf_put() and kfree() operations
until after the mutex is safely dropped.

Fixes: ea2aa97ca37a ("drm/gem: Fix GEM handle release errors")
Cc: stable@vger.kernel.org
Signed-off-by: Mingyu Wang <25181214217@stu.xidian.edu.cn>
---
 drivers/gpu/drm/drm_prime.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 9b44c78cd77f..26319c638e0f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -190,6 +190,9 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				 uint32_t handle)
 {
 	struct rb_node *rb;
+	struct drm_prime_member *found = NULL;
+
+	mutex_lock(&prime_fpriv->lock);
 
 	rb = prime_fpriv->handles.rb_node;
 	while (rb) {
@@ -200,8 +203,7 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 			rb_erase(&member->handle_rb, &prime_fpriv->handles);
 			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
 
-			dma_buf_put(member->dma_buf);
-			kfree(member);
+			found = member;
 			break;
 		} else if (member->handle < handle) {
 			rb = rb->rb_right;
@@ -209,6 +211,13 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 			rb = rb->rb_left;
 		}
 	}
+	mutex_unlock(&prime_fpriv->lock);
+
+	/* Defer resource release outside the mutex to prevent deadlocks */
+	if (found) {
+		dma_buf_put(found->dma_buf);
+		kfree(found);
+	}
 }
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
-- 
2.34.1


