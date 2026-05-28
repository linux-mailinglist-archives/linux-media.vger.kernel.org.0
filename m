Return-Path: <linux-media+bounces-62959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGBnDpxEGGoEiAgAu9opvQ
	(envelope-from <linux-media+bounces-62959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:35:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9A5F2CE1
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA1D13069CDB
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D063F4DC8;
	Thu, 28 May 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Vc/fRPeq"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F53F0AAD;
	Thu, 28 May 2026 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975092; cv=none; b=TnjnbO4wuoHBrCjf7Uyz1vA9PyB5cM4Tcb7qLH0fXgaB3FEp9ikyXPqrbkWQbgUcPTPCypMxlYtN6v605qR9qo5H09T4iEBV26TwqORZPR84P1OAKX9Kif6Mj/XqsCaCsFPsNPYCQiHMpPHumxXilXCO8745CEwYHOo99xfKXbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975092; c=relaxed/simple;
	bh=sRtj4tQK9MvxeV5XHot4VLQOgQYhWbGuVsDmKyyuse8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dZuIlkyFdYKxyjl6/fYimYTohNfghGew8NpBXBJC/yZGFcHCiE7EgUnzbzjnMNvIU0KgJ3uSPWrbMjSNqg3UzVTkFHUVU71Oj0c924+qEfK1fG1PHi5xYpDwst74eXV4x/qOpIJXWX10laZDTdgc4VG12RjmvrUda6U9onRFpms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Vc/fRPeq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8J
	+dUm9W37rXxgShjP2ChFk+3+g0TSrBqH/jssS5uR4=; b=Vc/fRPeqtFFv+FdT8R
	3yPCC3GKPUmoFXvYFbHkWnrzYLOSpRuEGoZZV3tRq/td2BTpk6ayTJxFsnYPTM53
	L0/6IcnNJLKyzF82Kf6Ob/gErvzvqCAZIIlgS/aRAKuZGJsC/d5xQn77L3ZVYJ3+
	PSjfvzRQQMrZyYuc7ddOWsB2I=
Received: from 163.com (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3v0M_QxhqpAnRFQ--.101S2;
	Thu, 28 May 2026 21:29:39 +0800 (CST)
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
	Mingyu Wang <25181214217@stu.xidian.edu.cn>
Subject: [PATCH v2] drm/prime: fix dangling dmabuf entries after handle release
Date: Thu, 28 May 2026 21:29:32 +0800
Message-Id: <20260528132932.1078483-1-w15303746062@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
References: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3v0M_QxhqpAnRFQ--.101S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyUWw1DCw43KFyDuFWDXFb_yoW5XFy3pr
	W3Wryqyr4vyF1Fga42y3WxXF93ua1fJFW7JFW7K39av34Yvr1fCryIyayIkrWUGr93XF4Y
	qF18JryYyF1j93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5EfOUUUUU=
X-CM-SenderInfo: jzrvjiatxuliiws6il2tof0z/xtbC5AOBZWoYQ0MN5gAA3a
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	TAGGED_FROM(0.00)[bounces-62959-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w15303746062@163.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,xidian.edu.cn:email]
X-Rspamd-Queue-Id: 42A9A5F2CE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mingyu Wang <25181214217@stu.xidian.edu.cn>

When a GEM handle already exists in the drm_prime_file_private, repeated
calls to DRM_IOCTL_PRIME_HANDLE_TO_FD can cause drm_prime_add_buf_handle()
to insert multiple entries with the same handle into the handles rb_tree.
Because the insertion walk moves left on equality, duplicate keys are
structurally accepted by the tree.

Later, when the handle is released via drm_gem_release() ->
drm_gem_object_release_handle() -> drm_prime_remove_buf_handle(), the
latter iterates the handles tree, removes the first matching node, and
breaks out of the loop. Any remaining duplicate nodes that share the
same handle are left orphaned in the dmabufs tree - they are no longer
reachable through the handles tree and are never freed.

When the drm file is finally closed, drm_prime_destroy_file_private()
triggers:

	WARN_ON(!RB_EMPTY_ROOT(&prime_fpriv->dmabufs));

because the dmabufs tree is still non-empty. With CONFIG_PANIC_ON_WARN
this becomes a kernel panic:

	------------[ cut here ]------------
	WARNING: CPU: 0 PID: 19739 at drivers/gpu/drm/drm_prime.c:223 drm_prime_destroy_file_private+0x43/0x60
	...
	Kernel panic - not syncing: kernel: panic_on_warn set ...

Fix this by restarting the lookup from the root of the handles tree
after each successful removal, so that all duplicate nodes for the given
handle are erased. The caller (drm_gem_object_release_handle) already
holds prime_fpriv->lock, so this does not change the locking strategy.

Signed-off-by: Mingyu Wang <25181214217@stu.xidian.edu.cn>
---
Changes in v2:
 - Drop the unnecessary mutex_lock addition, as the caller (drm_gem_object_release_handle) already holds the lock.
 - Rewrite the commit message to accurately reflect the root cause (duplicate handle insertions) rather than an assumed lack of synchronization.
 - Restart the rb_tree lookup from the root instead of breaking the loop to ensure all orphaned duplicate nodes are thoroughly removed.

 drivers/gpu/drm/drm_prime.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 9b44c78cd77f..dc28df1c6698 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -202,7 +202,10 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 
 			dma_buf_put(member->dma_buf);
 			kfree(member);
-			break;
+			/* Duplicate handles may exist; restart search from root
+			 * to guarantee removal of all matching entries.
+			 */
+			rb = prime_fpriv->handles.rb_node;
 		} else if (member->handle < handle) {
 			rb = rb->rb_right;
 		} else {
-- 
2.34.1


