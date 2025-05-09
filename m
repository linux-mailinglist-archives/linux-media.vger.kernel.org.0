Return-Path: <linux-media+bounces-32148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA92AB18CA
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3E2A2354D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA35822FF55;
	Fri,  9 May 2025 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hPfhe62J"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6281922DF96
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804865; cv=none; b=lmBrs13hcEqulwoR1TeALvaUqAT2pqr0UpEZQsmk5RMX6QinZNoJgcXYbWOFpdbMufaoj8SI2oVWaORtCLp+ktpm+KMopoEVvGJIRTkY9Wgx5poecypparzuFoU/ToOCOuXKuihBbALp52VBuC9lBUU4sNtMDMbczGfsLli3mHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804865; c=relaxed/simple;
	bh=cHCGi1Uoxz2nu7fUaQ1Fm/MwgMRizhxBOQg/QNjVyXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/GqStwz9zlhlm7L7pTdeMgdCWQ5npGfnn8GQMAOV/v4hbgt6x7CKJBfwCqoQudNnzBgvGB2CAmpF1LAtz8XZXDQoydxLCf0TLnj3lxJVCQaoaiHJ7LZOiSEok5RYg8SUYwg/mLAmbh8SRI/x2moRDgQ9QmwQVpyelVTBy7tiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hPfhe62J; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rOc2WSBQG8oN7Cu7NdxGahLu7I/n06aduKAV9FHA3FU=; b=hPfhe62JgW8OIj1kQMMiwLBtr3
	vNUUdPyur/bhoHTSTrtIr+HyyH1vCyhVu8dZ1seLX6C9SQ9B3zanvpombEDX/TADhLM9LclpjIOqG
	my5TgMfKj4tOXyVKqMnOoOAESMskYZrR4QNK5f8/7eJ0XWBV5JSq/tiAdAkTPTIMgapQdY8L7e3zV
	6IgqRuY/EC4kGcaNvRmRKFJHS8FezJlecn4TCjTiwgb5n0L2q40S5wAU7sGJlgfIEKSe7dPBjWkd0
	cB8uedmg4+sNq130YrE0LDWWqQDVSFbtEOe0TPpPz8cfq8pm+mswBCfoTKydtkJeuObSZOgisQBFG
	nh3SlsTw==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfL-005oFC-97; Fri, 09 May 2025 17:34:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 07/13] sync_file: Use dma-fence driver and timeline name helpers
Date: Fri,  9 May 2025 16:33:46 +0100
Message-ID: <20250509153352.7187-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Access the dma-fence internals via the previously added helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/sync_file.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index d9b1c1b2a72b..212df4b849fe 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -137,8 +137,8 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 		struct dma_fence *fence = sync_file->fence;
 
 		snprintf(buf, len, "%s-%s%llu-%lld",
-			 fence->ops->get_driver_name(fence),
-			 fence->ops->get_timeline_name(fence),
+			 dma_fence_driver_name(fence),
+			 dma_fence_timeline_name(fence),
 			 fence->context,
 			 fence->seqno);
 	}
@@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
-	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
+	strscpy(info->obj_name, dma_fence_timeline_name(fence),
 		sizeof(info->obj_name));
-	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
+	strscpy(info->driver_name, dma_fence_driver_name(fence),
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
-- 
2.48.0


