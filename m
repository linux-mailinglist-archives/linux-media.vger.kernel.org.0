Return-Path: <linux-media+bounces-32571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80AAB834C
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8693ACED3
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE19297B86;
	Thu, 15 May 2025 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fppjdd1f"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1720CCE4
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302630; cv=none; b=iKq+5LnekLIWG5Y5nSFXTdvpxEW4n7tbYVcdl0bWj4jgDrzLEIaVxgwRB+pCEt/h3wN8OewKP2wXkz+BVrZaRwJNWe+PZKYXQkJC9CDTY6M+lu+xlQNioXvRjOWS23tjkC4ulxN7ajfdh8+dHupBpfFS4Mc7dFBg8vkQddfP8do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302630; c=relaxed/simple;
	bh=lsDa0KVNC0AZcujajX3hqhZcO7pA3Rsdh7URxFTaYdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqFKrnBco/v5tGPS2wv5MfbG8PEg1TqcfOKBgtLS821CYX8u29DTzfKgPnHo3u+wDRVcxMdWGPv+RaS8OIYVSohsV0pQHPOZEtvB8ZheaYYaEMI5lHnVbYp7qWn3g8Nrd98UeTuC2BFA/kzRI8aSEsWWue+TdRZnQb+5B3lJygY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fppjdd1f; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g3rpD6n1YiYsI0Pm9IK2h3p3UtZO2J250rvvrG+r9rE=; b=fppjdd1fI8b3W9Iv8AhYZbwvs8
	7DxQZvXCHIQnbRdmv4FSuYlcW6+ya/6e386D862vh9FGmb/anc+PXMj/yY/I23HiNFgfptnzXwSHr
	hlWcBtpLGiXSvWV6l2aUaE28qnkt1BNro/CmfhuNSVBTNsbyY31lG1lXpjsC5DGw70ljLCqlc3oWv
	xd+abaQqHCaf/xzf+UttHdAA9we0apiUpwTkSnOV8I2lKuWcXCP6WJoycssOWQEEKHDw9DruIc7HP
	VoVlMSmka8OEhdcvEG3VHkpQjZedh6SYmdGpigB7zlm36zhEiTjjynjwm2yGQpw/RSA30UC1DfBLe
	RMTnmyyQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uFV8R-008ZQv-8U; Thu, 15 May 2025 11:50:09 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
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
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 4/9] sync_file: Use dma-fence driver and timeline name helpers
Date: Thu, 15 May 2025 10:49:59 +0100
Message-ID: <20250515095004.28318-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Access the dma-fence internals via the previously added helpers.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
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


