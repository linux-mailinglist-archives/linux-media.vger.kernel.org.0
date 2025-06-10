Return-Path: <linux-media+bounces-34465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32EAD3F59
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DCAA1BA0844
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31F724293F;
	Tue, 10 Jun 2025 16:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aQLU7iGq"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E465E239E72
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 16:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573776; cv=none; b=t9xajd8L4oOLPnn5J/BY9LjSfkyknwdLYzpngFDarLRdd78u3qrVXZgPwAz59mN7cJgqfG6feZo5qB3bOYh4zt0CHWygRJ2ey/n0T3Hk8OUg2EMhm4/G2hMdSKFwYSzUTe0SaDDp3LaUKY6JHYlbb+4Xl+tlbpuMCygeEoaroaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573776; c=relaxed/simple;
	bh=BlgpQV6vaF+BHGrnfgKf1PZg3oFZsr+7/VX7eWU8WVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAVQ35CJYoL06+gWTK2CrgN37+g4+bAyadlnwCUAlVEt6iOPJqp18TjwENyzozerkdQW9N2Iew+xUR3L5x7hbr7ICYJT4iV9UoysBsox6qJwumLVKMQtDKXe01SRA8gV08Uw1Zh1PHlcmjchS+qeGxAJYH4ZkdTNwS6QMzl+cRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aQLU7iGq; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7nS+u/PEde4yYVO+EK7GZCZWMo/dC0XiseKoZXaAa3U=; b=aQLU7iGq0qIpIWthT7ycWNT6MR
	TV3eqrYk+NmE9D5VwTl8a7NTeQwYTAclYhUonX3gtkwwVWAryXv2Xp5XSEWw94QqFVqAfHpA6xJQ6
	bXcO1HhsAHceZlZfVH0iBJpu1kTx70iS8kv3wHo2PY9MU2S1rop1CAgeD5ZjQLNJBSW6VH3Y9zb51
	7lhzFTSmszQxMtOqFe2qhTqcEB/ympOgRIcRE/pnELFIWdBEW5y1s3+xbK1xZg01HU3aYen8CRmSl
	BXG63+3WL0zVkaecEisymskcZzFaum20LItoaYk+6Z59/3eNAJeoeTJYf5aCpSdDOcFYG64ZHXIJT
	QHUr3Kyw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uP23W-001t9e-Bk; Tue, 10 Jun 2025 18:42:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 1/4] sync_file: Protect access to driver and timeline name
Date: Tue, 10 Jun 2025 17:42:23 +0100
Message-ID: <20250610164226.10817-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

This prepares the code for incoming dma-fence API changes which will start
asserting these accesses are done from a RCU locked section.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/sync_file.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 212df4b849fe..747e377fb954 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -135,12 +135,18 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 		strscpy(buf, sync_file->user_name, len);
 	} else {
 		struct dma_fence *fence = sync_file->fence;
+		const char __rcu *timeline;
+		const char __rcu *driver;
 
+		rcu_read_lock();
+		driver = dma_fence_driver_name(fence);
+		timeline = dma_fence_timeline_name(fence);
 		snprintf(buf, len, "%s-%s%llu-%lld",
-			 dma_fence_driver_name(fence),
-			 dma_fence_timeline_name(fence),
+			 rcu_dereference(driver),
+			 rcu_dereference(timeline),
 			 fence->context,
 			 fence->seqno);
+		rcu_read_unlock();
 	}
 
 	return buf;
@@ -262,9 +268,17 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
-	strscpy(info->obj_name, dma_fence_timeline_name(fence),
+	const char __rcu *timeline;
+	const char __rcu *driver;
+
+	rcu_read_lock();
+
+	driver = dma_fence_driver_name(fence);
+	timeline = dma_fence_timeline_name(fence);
+
+	strscpy(info->obj_name, rcu_dereference(timeline),
 		sizeof(info->obj_name));
-	strscpy(info->driver_name, dma_fence_driver_name(fence),
+	strscpy(info->driver_name, rcu_dereference(driver),
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
@@ -273,6 +287,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 			ktime_to_ns(dma_fence_timestamp(fence)) :
 			ktime_set(0, 0);
 
+	rcu_read_unlock();
+
 	return info->status;
 }
 
-- 
2.48.0


