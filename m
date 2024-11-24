Return-Path: <linux-media+bounces-21902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F59D7009
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39699162C41
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647A01E0DC3;
	Sun, 24 Nov 2024 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKMxdBf3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCD1BCA0D;
	Sun, 24 Nov 2024 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453069; cv=none; b=Cfhw1kYAcMkeYlNUYh9wurvIiwMG7r+NRIDFVsB8EKVY8shf6BIR1r+dNhoFo+xfmWx4Viw5Skr8UFfqUa/8m/CbzBiCG+AkYx/LXQV6WGC0Mdn5CYmwfkLcFdDGrk7uegQllsq50++Vc4g83XHEK9hw52/hpPvg5FJoDZffQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453069; c=relaxed/simple;
	bh=POP1vSSDgkXAcGLUjT2ZBOAAfNDLZJu04/l/hq7ylhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YC4NZQ2dsg2j7tUwhEiSqrD4iHX7sJzS33vc64BZFpjCF1lSl+V1ItE5Rjgk3U6cgOOw75N/OhJWmWOPbaiLQlpOVyxL9MBjWXmJp1o4Hw0UFnjkTq7QzkwcZEi8cuFs87HLsPOZbBynj6ZpsGSCc7tsU7s6YxQ22lzc5QIt/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKMxdBf3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0217AC4CECC;
	Sun, 24 Nov 2024 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453069;
	bh=POP1vSSDgkXAcGLUjT2ZBOAAfNDLZJu04/l/hq7ylhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKMxdBf3fNWO7oGlINOdh6BcAGCDwyjjFFXVpjoODKGTgGZPz87tm4VvOdmPyhHcr
	 Llbhm+wsxnidzZIISevdmLsyawSEADvqi5HWUN7WX+Z5z9pfnSSFGh9O6xorKXro5v
	 2OzDkKCQcBoAT0n9sQgF/q+BEOpVa1ZXARdVOq/X97DDABD5Yyxaa7yo+uTRBwl3vh
	 ZhC7ooKpLD8gXis2WxUTF80owQY4JqLoIwI6/iToTjGxaD7RhAFZmYK2j9v8KwGwjB
	 WhTgrkuraibXqDbZJef9MIvUhJyivH1BIYCT7cCJq8tkkZoW6AvVsBVGzMFTi0Ermp
	 S7OrzBF5H1hXw==
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
Subject: [PATCH AUTOSEL 5.10 3/6] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:57:05 -0500
Message-ID: <20241124125742.3341086-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125742.3341086-1-sashal@kernel.org>
References: <20241124125742.3341086-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
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
index 78ad2b278da4c..93eaff34d5e4d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1816,7 +1816,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -1826,12 +1829,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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


