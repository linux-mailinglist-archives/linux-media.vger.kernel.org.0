Return-Path: <linux-media+bounces-32363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55314AB4D3B
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FED177AE0
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6E31F3B98;
	Tue, 13 May 2025 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nJzzwRtj"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390531F2382
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122343; cv=none; b=YSTzTwHEPZC5wC72XaRBlu9N20iEyLKilhaY5imBZpQg5ig6ScqD14p5nP6bq1UPmjl+cxjBCej18cBGacIrpmHfGe6L1aa4txeQ7LGsZGruSIrBbZVITlb6GT04O5brJeA/C0zOEGWllUkvJmb6DkMsX5aufqxaT0jMUHQlyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122343; c=relaxed/simple;
	bh=yJBE/0qDD9ST41lYTH/1LCULg4ix2ROZ8UTAefBmQfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY5ZGAG+UOjZwKlBtyeCxJ+vVpTiN/QJ8rdcSJgxykTv9MlIR7m0iH0lnny4L8thSaWWzzgFpVfRN0yPtQh2fh46X8IyZ0CH+J70lY4pn3gaPvl9Yg4twN8KYJDRN471j0QUi7J5KDjZgS+qJ7NEZd7YgmovRb7lWjwUOtzQm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nJzzwRtj; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QAQu03T+0Cw7dpCbcuwxezen/s/XSrGtmte1ESndrNA=; b=nJzzwRtj5rV4zm2BpXSExInOyl
	o+FiA6T2ZBQBZoFyP9bdpBf+plLyFBsh6DtlQcaCevNGUUSxKZ2II6aBlcQiqALNTWX0jQ9c26Txm
	m4ZabxWLa2XvffNwzC66rHXryigcue+Q/koh/Bx7DeCiff+f7w8RsAgU1BCzpvatumBQVU1KQBp8i
	imXydBDHX/27eYLMER9jc1g4xr2vUa9GWYNNz8k+enWVPlG5opJGbHUWsYTdAp8hNxEl820KZEa40
	I4P4eRHmjhTL6qbHbssnUkiRrrpLxYPL2O8ULOpsIhKL73Eda7xJpHLg6To5RxLCTm8VAB5DHMTXI
	nANvQSUA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF5-007Tvi-M3; Tue, 13 May 2025 09:45:30 +0200
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
Subject: [RFC v3 08/10] sync_file: Protect access to driver and timeline name
Date: Tue, 13 May 2025 08:45:11 +0100
Message-ID: <20250513074513.81727-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/sync_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 212df4b849fe..ad87116baa24 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -136,11 +136,13 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
+		dma_fence_access_begin();
 		snprintf(buf, len, "%s-%s%llu-%lld",
 			 dma_fence_driver_name(fence),
 			 dma_fence_timeline_name(fence),
 			 fence->context,
 			 fence->seqno);
+		dma_fence_access_end();
 	}
 
 	return buf;
@@ -262,6 +264,8 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
+	dma_fence_access_begin();
+
 	strscpy(info->obj_name, dma_fence_timeline_name(fence),
 		sizeof(info->obj_name));
 	strscpy(info->driver_name, dma_fence_driver_name(fence),
@@ -273,6 +277,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 			ktime_to_ns(dma_fence_timestamp(fence)) :
 			ktime_set(0, 0);
 
+	dma_fence_access_end();
+
 	return info->status;
 }
 
-- 
2.48.0


