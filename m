Return-Path: <linux-media+bounces-45456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C42C04DF3
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7E2440521F
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A372EFDB2;
	Fri, 24 Oct 2025 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxp+Vwjx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACCF2EDD7A;
	Fri, 24 Oct 2025 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292266; cv=none; b=IBMnu+QTZIYmVrWUtU5LM+Yx3+mNrfksOcd/OOnb1im5BXtVHAcie9XRxZrCWcBrwM69fdOikSDSZLCM+4SOUApX4hQinFWtMfs0TfnMuEwwco4FL7i0GUusV0HrKK3f2dTZsyx03TXzaRwxkahI3Dix2NvK4PDxiVP8vR1dRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292266; c=relaxed/simple;
	bh=/eIIVwq/ALP8llik2NduZiThoe5CQyT9xK6kpQ9T/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OTwrQxWCM6g59SyVWtvFmA3NTweDYrFxq9PssivHvu9FO15lM2moibvds5CTcyMBtuk4ezOEEsKppAghJ8MsEZFE/X+QCFaqwaNo4MtPsQOVLO1crCqoP7M7iqTlRxd4JTADVKxQ6lpLSzX515pEEYDiTEqYKyD2eYIjwk3BMio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxp+Vwjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5A6C4CEF1;
	Fri, 24 Oct 2025 07:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761292266;
	bh=/eIIVwq/ALP8llik2NduZiThoe5CQyT9xK6kpQ9T/zk=;
	h=From:To:Cc:Subject:Date:From;
	b=dxp+Vwjxc0q/4xxNMbBSVe0wfjeBoUAgvvk4GO0J4BEjljt8FSBdlEzI27U7yFV7D
	 l3BgRq6oD7XxuKD72SAi6bNz3tno5IscDLL/U4Km4YAB2z67ipIpw2pYmWRiqS4BIO
	 2z2MZCMEjdaIk3VMY+t8V0wlDEZ4jfl7Sa7BH9gfAR+g15wWUFi3pLySqaQOsDpTCP
	 sszrCbwAeLwdsko+M8aW4srtjpR8pwObW3ffVdKGKFMmmFXW2yhB3rqsc8nofiH35X
	 s0n6KHJ98UhXLF1rEsUMB5ztgp82Oph7EaENA1V9WUjXbJ0PKTKbtd6l8x6O3Xv3mg
	 2Sq+UUqSeAgcQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
Date: Fri, 24 Oct 2025 09:50:18 +0200
Message-ID: <20251024075019.162351-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
support was added to said function, coupled with using the signaled bit
to detect whether the fence_ops might be gone already.

When implementing that a wrong string was set as a default return
parameter, indicating that every driver whose fence is already signalled
must be detached, which is frankly wrong.

Reported-by: Danilo Krummrich <dakr@kernel.org>
Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
When this was merged, it sadly slipped by me. I think this entire RCU
mechanism was / is an overengineered idea.

If we look at who actually uses dma_fence_driver_name() and
dma_fence_timeline_name() – functions from which the largest share of
the fence_ops vs. fence lifetime issue stems from – we discover that
there is a single user:

i915.

Isn't that driver even deprecated?

I think the better thing to do is: remove these functions alltogether,
or at least deprecate them. Then the only lifetime issue left so solve
is the callback functions.

P.
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..1875a0abebd3 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return fence->ops->get_driver_name(fence);
 	else
-		return "detached-driver";
+		return "driver-whose-fence-is-already-signalled";
 }
 EXPORT_SYMBOL(dma_fence_driver_name);
 
-- 
2.49.0


