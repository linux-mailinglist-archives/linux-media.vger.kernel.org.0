Return-Path: <linux-media+bounces-21877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F351E9D70BB
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF4AFB2E74D
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5051E9066;
	Sun, 24 Nov 2024 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/Szq5YE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BB1E884B;
	Sun, 24 Nov 2024 12:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452614; cv=none; b=f7Kt9a+0wPloCvZkJD052/IemHJ15LXdqywUyyqe0C0AaLCQJfMYiG/+rEg9PUm9O8rqzNZZTJhhlfUCmNZgYgQ1KXkm1lt3HqlU9B8+Gr+uQjrIO5XTjCSqOZmSxn0KBzyToTKW06A8YfnR41flf1qekdW09m4NcMsyP4bECoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452614; c=relaxed/simple;
	bh=M5WD2k494xyUsiC68zqAVQ/NHf1e98of8/mQZQecSUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6cjAuSKHgxUq8nGk7fK99077Rs2iw7jFmGuQoQsm01GHj54mLwBypIUXA0eeGU+Hafo/X4GMLZZ0gTDTfQgJkcdL3x/A/Oh/+FTj9gL3Hopjp++2sHOUoQYhQuZ1wqnaUGen47vR8k9g+pcZTW4Pyoyf/3wCzMAK2LsAO+WT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/Szq5YE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE660C4CED3;
	Sun, 24 Nov 2024 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452613;
	bh=M5WD2k494xyUsiC68zqAVQ/NHf1e98of8/mQZQecSUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y/Szq5YECiTlOXXMY6J5XyWXHzy9iy/c66R1fMWcGr3wIykKbggipZmemLP/3O0Ny
	 J+IPOP+kxF+zVTz5ri5MpA1pBvkwL24ndJtB64lttr9Sf+Am6lnIIWKIEbwaW/KsL0
	 ElX0RoIEHMTC9wHQJzbw8seml05a1PcNDYpBAv9dI1a6grou9wn/PkK1BpLXctmfcr
	 koQXB0uwEenU3og0g/6y6QGz+LmRlbufdmOMwYpR8mxB4xjKof1A4qhMzJ9YLqvnqZ
	 Zt09MVrcYqdghB+4ZOf31fRNjEfSeO6XXkaNicoRBqqjpXJXV2AmE+z0Flx0pSWFtY
	 4T0d0pvSSJcaw==
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
Subject: [PATCH AUTOSEL 6.12 12/23] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:48:23 -0500
Message-ID: <20241124124919.3338752-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index b0523fc23506a..944be2571229f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2037,7 +2037,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -2047,12 +2050,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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


