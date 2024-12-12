Return-Path: <linux-media+bounces-23343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD169EF2B6
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFF9C17C91E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3E4231A38;
	Thu, 12 Dec 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W9HRBGFP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23540231A29;
	Thu, 12 Dec 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021049; cv=none; b=eb1VazQDaWeTjlrJhkQhPN1dRy7k7nOHphZvUTAH45lGj+u/+0MGI32TKD/IFENeou+pScRvd2EHDQjjquqnzVdTDUYG63q6u3hpV+FAbMjv+UhO2cG/Rp8pvN9hvn6YqBG62yJAMnZ2MMwR7KoC2rmhKO+yhYq7fo22CdTPnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021049; c=relaxed/simple;
	bh=2ubayNlvuMKrWihrpePf3YDoYhVpeZCwLIl69krSSXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7YQBxHI6yYOezT9XQBCvtfgmjb2657ob2m+GKb6NI+czsW0Ltj9cX+3yy+X/Y9P3VsxhhA1nbfaCn0WJBdlllspZDvZDt3KOxV61dM+3RADkWjaZznVsORvnebDEq99OZ1gMRyn0wFfVqJq30h50hZJCrtnBmrq0t9cHhdU184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W9HRBGFP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866E2C4CED0;
	Thu, 12 Dec 2024 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734021049;
	bh=2ubayNlvuMKrWihrpePf3YDoYhVpeZCwLIl69krSSXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9HRBGFP1fpMqbmKCmaWsHhBA3WfTqfgrunOdN9+j+ItJdgBtRWO2cXKD+FFMbQIo
	 /E3UV1cojKonGZIXklrUVdCr03K+qmqjQf0wDQtvD4GQKahHWnBLX80lBxQNdVeS0o
	 643Af0v/3EsYpA3tPOTTPKpZj3bdivdpvmEqvrwA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6.1 632/772] dma-fence: Fix reference leak on fence merge failure path
Date: Thu, 12 Dec 2024 15:59:37 +0100
Message-ID: <20241212144416.045269587@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144349.797589255@linuxfoundation.org>
References: <20241212144349.797589255@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit 949291c5314009b4f6e252391edbb40fdd5d5414 upstream.

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
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241115102153.1980-2-tursulin@igalia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
2.47.1




