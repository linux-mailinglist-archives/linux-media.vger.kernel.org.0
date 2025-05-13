Return-Path: <linux-media+bounces-32357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB02AB4D38
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4EC178CBF
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F194A1F1909;
	Tue, 13 May 2025 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jyLjX5f+"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E61EB19F
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122341; cv=none; b=HRPDBjIGPLlngnyH9ODMDCUUHCQ0JG8tPnvWCcEUJfsSKDwZoR+7wvfKqywiL+zmY83AnGCeLCPSM5sU4wfy9k2xZoOFWgjL/xRUbCWbOYEKslWbQFuncxqVZYOxu/KqHiKQOj6yFqLJD68PcHYuXzJws7CLRq5j3K5QH0iqESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122341; c=relaxed/simple;
	bh=lsDa0KVNC0AZcujajX3hqhZcO7pA3Rsdh7URxFTaYdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpcbAMjcs7B3uwmPl42RirhYc3SA4aIfjDDnALKmwrHOigJ6EzaezraLFY3nAe1pPpgLtf9Z6o4d2a8uGXGHFLWxJKGb+51x2mWlwUUY1BdwQNLbBvDLKm9C+iwzbM/BUJtQkSYWpRTCUKFyv6K5e9M4xjsG0T6ZgtC83OJ6TU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jyLjX5f+; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g3rpD6n1YiYsI0Pm9IK2h3p3UtZO2J250rvvrG+r9rE=; b=jyLjX5f+0VaKLSd9zC9LrxnnHv
	yDxhEqNjfK+h2bEotOgixVX15lFw7f9lbhP3U3voY8ntjAFeMZfyTlFEIhfITeztplmmorDLzuMDL
	8yyY/P21Il2Zbl8l0xtHnDajejSQauj8mexTZaeW/44etGLg10rHw/MMhGaBveF35O9zwtdPocGbA
	hSDu8l5JMnrME45E900iclYKR+d/8NNKaH6IKHSDLJ9lB57z2JW1eNcpfiwe1XAPuQdbQJFfCKwNg
	G6+JVxmBVbBPPWcpXP3PrEMnGlhPwY/cKW7dy3DsN3UzdufaB0Yagp2Cu7PzgZ/rdTfyA9GmjP531
	FFKoiWqQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEkF2-007Tv5-Ij; Tue, 13 May 2025 09:45:27 +0200
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
Subject: [RFC v3 04/10] sync_file: Use dma-fence driver and timeline name helpers
Date: Tue, 13 May 2025 08:45:07 +0100
Message-ID: <20250513074513.81727-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
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


