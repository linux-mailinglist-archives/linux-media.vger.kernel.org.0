Return-Path: <linux-media+bounces-47688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6231C848AF
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 11:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E8754E93F5
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 10:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D3311958;
	Tue, 25 Nov 2025 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NREo4+7n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B83112D5;
	Tue, 25 Nov 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067511; cv=none; b=eByx38cuxSdgLCObk2SFlXNJ9Av+iKk5uGMyt3H4YESxj8TtQxY6dQ54Xf/ytzLEzVcl8Cfxm8tsXEqzqbQoAQ7x0xXgiCGBNclkzUWOmkU/GbVP/SKqqAG98eiZWqZrPGsYB6lyHJMYZX9gvTZVt48xALHscHnQLPrt6RBzHmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067511; c=relaxed/simple;
	bh=b40CBQbpmrn39IDJo2j+aqddbwBINyUrJXie1Z8VPgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UErE2tkgAHnJ44apTar/WUcrzEql3UjrCX++FwjwrImWseZjXQNYYVlyLTb8p2V0xqMRBBQDK0doeHnNSsFG2XwmnAsJrlRXda2uf73Tb25GhrcH426QOXBydZZ2BkM9UKMQ3I7lsDfRwn/NhazBdY6dAMgfDze+FE2v/yKtdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NREo4+7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5ABBC16AAE;
	Tue, 25 Nov 2025 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764067510;
	bh=b40CBQbpmrn39IDJo2j+aqddbwBINyUrJXie1Z8VPgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NREo4+7nJdmXm9UvCZRXHEbHRMtgunXpdGbY/wtW3ueYDYKmwz/7e1H48GEes7T4y
	 wkZb6Mbn9a0TviyPBBPPHNOvQ3hyjrbMnYZczbw4qpTj8wVraIca5X0NSca0KR9tAw
	 Rt6twcam+j+JqJZzRSH5dUKOz1i3y16qvZXDyc/KTbuN1zbjtXdjirV/m+jJbOxNTo
	 4uSSMqgo5zO+Qq2E0MWgyMtHm8GoRE/B6fX7VROUSbp9rHM/O7sPQro18+7cDBPkLb
	 wji0k83/NgY+VXNXEhA2qHIjXyYYSlfytwFPHSO0x7FKeZTHwmZa9iGYnhTDkyxHC1
	 5FayGFZRLqxDw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] dma-buf/dma-fence: Unify return codes for signalled fences
Date: Tue, 25 Nov 2025 11:44:44 +0100
Message-ID: <20251125104443.82974-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125104443.82974-2-phasta@kernel.org>
References: <20251125104443.82974-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Almost all users of dma_fence_signal() ignore the return code which
would indicate that the fence was already signaled. The same return code
by dma_fence_add_callback() cannot be ignored, however, because it's
needed to detect races.

For an already signaled fence, dma_fence_signal() returns -EINVAL,
whereas dma_fence_add_callback() returns -ENOENT.

Unify the error codes by having dma_fence_signal() return -ENOENT, too.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3a48896ded62..09d97624e647 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -373,7 +373,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 	lockdep_assert_held(fence->lock);
 
 	if (unlikely(__dma_fence_is_signaled(fence)))
-		return -EINVAL;
+		return -ENOENT;
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
-- 
2.49.0


