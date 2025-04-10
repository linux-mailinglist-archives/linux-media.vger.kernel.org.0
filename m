Return-Path: <linux-media+bounces-29903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 528D2A83E9F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11FDC1B655E2
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81DB2580F9;
	Thu, 10 Apr 2025 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G99ccvzB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF063256C68;
	Thu, 10 Apr 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277094; cv=none; b=SEVZJE2jvRQZvzDsu5SYuJfW6XZGleMY7iz6jTt7J8BV5YT0ZcZqP8bcLDWuni3pES4ei42XGkBU1QVcHvww7maG0oWN39n6mbaJT2SHacMfAzBLci0E8QSRwFEkPKoIuyD/VtuuJ7PAA42blERD7WOADIAZjoO4ZrrRmG8HkQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277094; c=relaxed/simple;
	bh=3P7s4nXmSskx7iFVqJGduWVlN7qiQQvgN5d+ysuJyiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6WAKrGTQhobSbwfKVe+eojL5thobZYhWeDcK5DQNKAREktpqnOLqlab3q/14wjTcSbZEZRITWhy2SII7tED4n4154yKJLSwvTj9fyZcB78qjn5ppSEfhbspNTEUumN8QplueiXnIfOs6PCm55krSDaap1ekJV4+QUcO7eMV85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G99ccvzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF2DC4CEE9;
	Thu, 10 Apr 2025 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277093;
	bh=3P7s4nXmSskx7iFVqJGduWVlN7qiQQvgN5d+ysuJyiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G99ccvzBekwF9w28ZdrT3WI90UdaES2VHm6CttD7Z3rn10sY7nJBSVjBweaIBtSBz
	 du7leLWJhVQRElmAZ+QWxL6MM1c9xjK9xurwfHmTWf4rBsj4SrqH2xgHTtlAWZyc8m
	 R701q5aFobVxj/Mgn244Kus6EqysQ5ITd2sT8irG140N3vX3HC2pAOTTuWxHMfshsg
	 mBlu5qQIy6UZ2fNtBOwi3YTUReLyAvIVmGzdC9LflXh5eVQxd5cgvDDFITTV54rUbS
	 BJkuBdN6GqLzGBeGyrRlw1xTN/hy9hz7DywZyN0CAzHcpWBGAloL5P84pp2OYRwPf+
	 jhIt5jr10fNmA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
Date: Thu, 10 Apr 2025 11:24:17 +0200
Message-ID: <20250410092418.135258-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410092418.135258-2-phasta@kernel.org>
References: <20250410092418.135258-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nouveau currently relies on the assumption that dma_fences will only
ever get signaled through nouveau_fence_signal(), which takes care of
removing a signaled fence from the list nouveau_fence_chan.pending.

This self-imposed rule is violated in nouveau_fence_done(), where
dma_fence_is_signaled() (somewhat surprisingly, considering its name)
can signal the fence without removing it from the list. This enables
accesses to already signaled fences through the list, which is a bug.

In particular, it can race with nouveau_fence_context_kill(), which
would then attempt to set an error code on an already signaled fence,
which is illegal.

In nouveau_fence_done(), the call to nouveau_fence_update() already
ensures to signal all ready fences. Thus, the signaling potentially
performed by dma_fence_is_signaled() is actually not necessary.

Replace the call to dma_fence_is_signaled() with
nouveau_fence_base_is_signaled().

Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7cc84472cece..33535987d8ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 			nvif_event_block(&fctx->event);
 		spin_unlock_irqrestore(&fctx->lock, flags);
 	}
-	return dma_fence_is_signaled(&fence->base);
+	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
 }
 
 static long
-- 
2.48.1


