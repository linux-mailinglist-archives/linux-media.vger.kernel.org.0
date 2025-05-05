Return-Path: <linux-media+bounces-31807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAEAAB7DC
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3431B465157
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A232307936;
	Tue,  6 May 2025 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="bgbd1O3j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E9309143;
	Mon,  5 May 2025 23:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488335; cv=none; b=m9TtmKobL1/Ed1utR+jz/b6gAA7FlqIcTiryiNUR13BOkrc8Y5vVpvmUOdKlI6Cr8/EizIzl6VB3CkXMF9ykorUapzZPdf/WkkmGIcoyqTOXltCVwg4ZurkIGJVajj8n1D6TsOeORP0J9YSeaeiF4E1fTjfCUXVV4hbmLyuX6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488335; c=relaxed/simple;
	bh=quSGELG0HeIl5AKELPWZnjtVeT/Ezd2dyM7s8RVhHRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJo/aYsNIbLBaLh1QEJ6GV2udvxboSEWjx7E23Wezu/oFzdQFUGYXGIf5aDtU+rc2gTB8GiPytkpd3D89HMkBXKjkEiCw3loYqa3HOJngnPr8iobqSyBmm2bdBzy4mbMPwoDmWhbFlOSIgEgm7QV3DPhXrDu59MVkVIMRDaf1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=bgbd1O3j; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=lCo9I6Au4Qw0PRMxPneld4MDJASeYRZgXLqoLGhgwwg=; b=bgbd1O3jU64aXN/N
	ABOzZODpeCKS7YOKc3qTa1duru2PO89DBQ7cP/GRlry78FXgci/CUD6tPye4bbF6SqwdNGtADjihP
	RTFTkr8ZY6dgiC/fMmtgKiCt7GD8NWBADc6AeNS1uPM1KrxNdo/CcCtkOpbaQDs+RwTq+YkV1HR1u
	E0zcEtMDmudw95IwP9uFqPmwlgN8vGXInc8mC0n4n4XD/pW04R+w45o5nvfbs8h43gCGRUH57MK7z
	NrXBOl0qCq1oUf1tZxCI/kwyG1yQVkrhrnlgCsqblz8lOsSLmsSYhyWP2hT0/PmfaxOxDq+kQ2gDT
	ziN8RTTMVDDPYT8aZQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uC5OR-001a7b-0l;
	Mon, 05 May 2025 23:38:39 +0000
From: linux@treblig.org
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] dma-buf/sw-sync: Remove unused debug code
Date: Tue,  6 May 2025 00:38:38 +0100
Message-ID: <20250505233838.105668-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

sync_file_debug_add() and sync_file_debug_remove() have been unused
since 2016's
commit d4cab38e153d ("staging/android: prepare sync_file for de-staging")

Remove them.

Since sync_file_debug_add was the only thing to add to
sync_file_list_head, the code that dumps it in part of
sync_info_debugfs_show can be removed, and the declaration of
the list and it's associated lock can be removed.
(The 'fences:\n...' marker in that debugfs file is left in
so as not to change the output)

That leaves the sync_print_sync_file() helper unused, and
is thus removed.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/dma-buf/sync_debug.c | 49 ------------------------------------
 drivers/dma-buf/sync_debug.h |  2 --
 2 files changed, 51 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 237bce21d1e7..a9c3312dc85d 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -12,8 +12,6 @@ static struct dentry *dbgfs;
 
 static LIST_HEAD(sync_timeline_list_head);
 static DEFINE_SPINLOCK(sync_timeline_list_lock);
-static LIST_HEAD(sync_file_list_head);
-static DEFINE_SPINLOCK(sync_file_list_lock);
 
 void sync_timeline_debug_add(struct sync_timeline *obj)
 {
@@ -33,24 +31,6 @@ void sync_timeline_debug_remove(struct sync_timeline *obj)
 	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
 }
 
-void sync_file_debug_add(struct sync_file *sync_file)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_file_list_lock, flags);
-	list_add_tail(&sync_file->sync_file_list, &sync_file_list_head);
-	spin_unlock_irqrestore(&sync_file_list_lock, flags);
-}
-
-void sync_file_debug_remove(struct sync_file *sync_file)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&sync_file_list_lock, flags);
-	list_del(&sync_file->sync_file_list);
-	spin_unlock_irqrestore(&sync_file_list_lock, flags);
-}
-
 static const char *sync_status_str(int status)
 {
 	if (status < 0)
@@ -118,26 +98,6 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
 	spin_unlock(&obj->lock);
 }
 
-static void sync_print_sync_file(struct seq_file *s,
-				  struct sync_file *sync_file)
-{
-	char buf[128];
-	int i;
-
-	seq_printf(s, "[%p] %s: %s\n", sync_file,
-		   sync_file_get_name(sync_file, buf, sizeof(buf)),
-		   sync_status_str(dma_fence_get_status(sync_file->fence)));
-
-	if (dma_fence_is_array(sync_file->fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
-
-		for (i = 0; i < array->num_fences; ++i)
-			sync_print_fence(s, array->fences[i], true);
-	} else {
-		sync_print_fence(s, sync_file->fence, true);
-	}
-}
-
 static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 {
 	struct list_head *pos;
@@ -157,15 +117,6 @@ static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "fences:\n--------------\n");
 
-	spin_lock_irq(&sync_file_list_lock);
-	list_for_each(pos, &sync_file_list_head) {
-		struct sync_file *sync_file =
-			container_of(pos, struct sync_file, sync_file_list);
-
-		sync_print_sync_file(s, sync_file);
-		seq_putc(s, '\n');
-	}
-	spin_unlock_irq(&sync_file_list_lock);
 	return 0;
 }
 
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index a1bdd62efccd..02af347293d0 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -68,7 +68,5 @@ extern const struct file_operations sw_sync_debugfs_fops;
 
 void sync_timeline_debug_add(struct sync_timeline *obj);
 void sync_timeline_debug_remove(struct sync_timeline *obj);
-void sync_file_debug_add(struct sync_file *fence);
-void sync_file_debug_remove(struct sync_file *fence);
 
 #endif /* _LINUX_SYNC_H */
-- 
2.49.0


