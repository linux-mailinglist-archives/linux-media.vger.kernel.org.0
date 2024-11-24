Return-Path: <linux-media+bounces-21890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75F9D720B
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D085BB33CD3
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968391F8939;
	Sun, 24 Nov 2024 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCls57iv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB071F892C;
	Sun, 24 Nov 2024 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452823; cv=none; b=XYzpMPbaWhBV/mwM6jZCrZ81hmOg+1WS7YCwwD90tHmDpexLcugQzl+JMNZfd3pvi1+AHHoJ1YxCLnoNzoFZ4QPuYH8nzlie0DeE6sZTDAmmnVXmE+uVKb1GvJqXZcXacehAbaTnAn0W5f7r0Ro+1tyw2zIXH7DxQylb9ShGpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452823; c=relaxed/simple;
	bh=WroBvZZCsQSPBIx/ZlFOahOoUGXAovN8VN/Q3Fi4RMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/Ddroq13Y8o/jJ6nh+Q65xLgcbDW3Xereznjik8stbuVmSPgPENQgWRpVkSp2NgRAg25lcF7jYL69CsU0xTNe8T0dTdP/JYrZwlIGOqvWbvPUx7JrSUSdZShAqJRqCt0VZqNUUXc+4ub7uYg9IJX5Ljw13uKG2BUiD8Otouvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCls57iv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00DCC4CECC;
	Sun, 24 Nov 2024 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452822;
	bh=WroBvZZCsQSPBIx/ZlFOahOoUGXAovN8VN/Q3Fi4RMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCls57iv4V4GNrTSuINDcOfBxZrMNOeOTs+O9rEsWONtNsiRP98eBVUaztv0QRjU0
	 NCt+uR1ryLsZBmBcYQpHA5qJ7pUm5tyg6nSsRCxJMbpjCRln7iYcCSqRerVxDrfnC8
	 PrD9Uphr1USfTXTtC58ARdbieOc09IKrH0AeMGtWW9AaMCe02Zb64pqj1TMDSy0HaU
	 KsuPx6aI/mJRr9VV7YzvY3/mCmHJg+c2aLmbEigeAr9e2zN6SR9ffa7SzIEUT/tag6
	 HG5QpG1MVr0oXA/N4ZDg5VeDpiOYmq1QoLGkmNNvIvxlCZy9rfQxXBNb9P5XwmPD5B
	 cM8RCJ/cgn4+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 07/16] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:52:25 -0500
Message-ID: <20241124125311.3340223-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 88785982a19daa765e30ab3a605680202cfaee4e ]

If the wait_prepare or wait_finish callback is set, then call it.
If it is NULL and the queue lock pointer is not NULL, then just
unlock/lock that mutex.

This allows simplifying drivers by dropping the wait_prepare and
wait_finish ops (and eventually the vb2_ops_wait_prepare/finish helpers).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29bfc2bf796b6..b86d4b2f5e132 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1846,7 +1846,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 		 * become ready or for streamoff. Driver's lock is released to
 		 * allow streamoff or qbuf to be called while waiting.
 		 */
-		call_void_qop(q, wait_prepare, q);
+		if (q->ops->wait_prepare)
+			call_void_qop(q, wait_prepare, q);
+		else if (q->lock)
+			mutex_unlock(q->lock);
 
 		/*
 		 * All locks have been released, it is safe to sleep now.
@@ -1856,12 +1859,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
 				!list_empty(&q->done_list) || !q->streaming ||
 				q->error);
 
+		if (q->ops->wait_finish)
+			call_void_qop(q, wait_finish, q);
+		else if (q->lock)
+			mutex_lock(q->lock);
+
+		q->waiting_in_dqbuf = 0;
 		/*
 		 * We need to reevaluate both conditions again after reacquiring
 		 * the locks or return an error if one occurred.
 		 */
-		call_void_qop(q, wait_finish, q);
-		q->waiting_in_dqbuf = 0;
 		if (ret) {
 			dprintk(q, 1, "sleep was interrupted\n");
 			return ret;
-- 
2.43.0


