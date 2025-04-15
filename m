Return-Path: <linux-media+bounces-30240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C8A89DD8
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2BA177B99
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE2D29A3C0;
	Tue, 15 Apr 2025 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAeoNV51"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC32973AF;
	Tue, 15 Apr 2025 12:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719557; cv=none; b=pHstL1nGmTgNtb/9avasTxGLqVFCscBhXJ/tn3RccrTMUEHkud49O488Ii/tX/iCgfv56OE/HkH5AkiFTpStzukvMUR8BCCFNjZj5VluMisELCwZBiBg+MI+NH2kpZi9pfx8TQc27lOXW0KGjAE3T5ETf8u8oyAyJShO52ewEAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719557; c=relaxed/simple;
	bh=ExuwwuQWLzkJuGGpl9n1F27u16tfXGWUJL91Td9VQ/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1aGw+cJn7PsS7ord6teWOUOwoSmoOxXdCwoW5vQQALX2NTRIxA8DaSez7t+X7QkrK5A4RjB3+5NmXXwyFCG3HZbmR1D11MDgHH3PpA0763Prww6EiTLT6MkuwfHbbRCsPcg9mMqYP7qtKcuwdNcgAxhk/a+JqlfRo8hdDgfWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAeoNV51; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71888C4CEDD;
	Tue, 15 Apr 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744719556;
	bh=ExuwwuQWLzkJuGGpl9n1F27u16tfXGWUJL91Td9VQ/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAeoNV51pdhfYpi5SMPjAlS9s8O23JXovV8fv06NO08eoHRGlibgpic+MlVsAqeJc
	 MMwpxy35qteiXy3naYT2DqF7eAFZjrrhmV0fDHSDmyq0EjB4OEiDZ721GIgiBxV+LE
	 aIKwW+x+2Ns5RWixNq91VMPxsD3LRE0+5SVvmJsygLy1eCFyfX1tnX7xfOwKXCwm1K
	 /r0ktlz++7z1VRTtNiX5fBbTBBwwtPw01tgUa7iZ/1Nlv/nkWXHmSmIQzCZ2mkfaJ8
	 8pGc8XYasDthBwD0ohlAZjewKdGnW3t1nsZqPfH3pcysXEFP+vQed6MX2hwDbRdq1J
	 c6t1lm/y+laBg==
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
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 2/2] drm/nouveau: nouveau_fence: Standardize list iterations
Date: Tue, 15 Apr 2025 14:19:01 +0200
Message-ID: <20250415121900.55719-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415121900.55719-2-phasta@kernel.org>
References: <20250415121900.55719-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nouveau_fence.c iterates over lists in a non-canonical way. Since the
operations done are just basic for-each-loops, they should be written in
the standard form.

Use for_each_safe() instead of the custom loop iterations.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6ded8c2b6d3b..60d961b43488 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -84,11 +84,12 @@ void
 nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 {
 	struct nouveau_fence *fence;
+	struct list_head *pos, *tmp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&fctx->lock, flags);
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
+	list_for_each_safe(pos, tmp, &fctx->pending) {
+		fence = list_entry(pos, struct nouveau_fence, head);
 
 		if (error && !dma_fence_is_signaled_locked(&fence->base))
 			dma_fence_set_error(&fence->base, error);
@@ -131,11 +132,12 @@ static int
 nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
 	struct nouveau_fence *fence;
+	struct list_head *pos, *tmp;
 	int drop = 0;
 	u32 seq = fctx->read(chan);
 
-	while (!list_empty(&fctx->pending)) {
-		fence = list_entry(fctx->pending.next, typeof(*fence), head);
+	list_for_each_safe(pos, tmp, &fctx->pending) {
+		fence = list_entry(pos, struct nouveau_fence, head);
 
 		if ((int)(seq - fence->base.seqno) < 0)
 			break;
-- 
2.48.1


