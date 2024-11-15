Return-Path: <linux-media+bounces-21458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FB9CDC7A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 11:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCCF11F23070
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA991B3943;
	Fri, 15 Nov 2024 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PHRk2kbX"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD571B219A;
	Fri, 15 Nov 2024 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666131; cv=none; b=riiDkZsydnFDN7iPgTSvf8BCBhSkrkbF2bUeqor8U8fPv3XQhvE0XSPCURDREDLHQsM5cfVagldOUntaaOPFuYhpUT99I4XTtRFMnU33U5AnJM7L+ncsUzj3x5C6++TSC+SjinZteowUba0TCuNBZ2SMOP+J4EnAd98QxTXY3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666131; c=relaxed/simple;
	bh=eJ+KWaIK23p1sUnyoPOD+xGcfqYdZB5u4tYg5N6y+4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GacKtFHUWv/jiSr9xUH/Vh/lshwNApWqQ0LIx0WUABIb+8sKAcwiGrVvs8hG4+qhLm0VwMIh4d1LmHeya9QpFT8mMkYZcwmMnpNWlnXkvMeQiwNaFFNisBVtJsawIboOl25u/D+2Fd39XV/H4q8pNyF4sjimEE8z+Afpjw2fGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PHRk2kbX; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2KNBYgktl52oWCVCDac2MxdPU0iGlTv9UYcQi5VUaNE=; b=PHRk2kbXuvckiGQhkU2L2KkDeA
	SSDTZkH7GwKylJVv6ZNj8WotPoiwR04Pa9xDkShcP7X4AZQj1K1JZUY14bf1u8K0wnphCT8A5tDmw
	ULdIlUqKBLupWt2LOGn7cfjb+BArX2OMPrNtlV+1lS/4sga6oyF0dCWk/0RSZ2f0AZOPenO4uTys2
	7oJf9rf2SUGiyPpYIgoMauiOSZ8SPkYbTVR4FrZndeQ2yB2GJ9iLMcUrpInfrFgGR80PoRNIz6BBx
	Zh+W6XbgDcQcB8lvnyDskmIgp2Q3KlgN8o1TyWQi8vDMnfdJquIW9OJUil4X41WGLbwjmU6h0neKg
	pEy3n3MA==;
Received: from [90.241.98.187] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tBtSe-007EAY-9T; Fri, 15 Nov 2024 11:21:56 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: [PATCH 1/5] dma-fence: Fix reference leak on fence merge failure path
Date: Fri, 15 Nov 2024 10:21:49 +0000
Message-ID: <20241115102153.1980-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241115102153.1980-1-tursulin@igalia.com>
References: <20241115102153.1980-1-tursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Release all fence references if the output dma-fence-array could not be
allocated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.0+
---
 drivers/dma-buf/dma-fence-unwrap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 628af51c81af..b19d0adf6086 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -164,6 +164,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 					dma_fence_context_alloc(1),
 					1, false);
 	if (!result) {
+		for (i = 0; i < count; i++)
+			dma_fence_put(array[i]);
 		tmp = NULL;
 		goto return_tmp;
 	}
-- 
2.46.0


