Return-Path: <linux-media+bounces-21894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F09D703D
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACEEDB35744
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197C1190471;
	Sun, 24 Nov 2024 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBoe2HZc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AE18FC80;
	Sun, 24 Nov 2024 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452922; cv=none; b=joliY63/gddqox1fhLfyyxyofvJUjly7M40BkvbbUI+qcNARe6WN+ei80Y1SmCZ17+rZPNn20JF6GsDKtoi21zqGsNsv8vNOgOOz7YYgLgRuVWK5JhK4t+lvrONJKVNDCj6D+bYnPdBtyZoRsFhmNF/AZC1l4ylELTaeOUZQ1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452922; c=relaxed/simple;
	bh=OBanrmLoyFPcc1GRuxAE79bi2wgM2aC/cqeerinDC2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wf6aQe894n1FAKI/IQJgF5HAt6Ic1EruAxFB7EQqwmDG0xi/NcB4/MrSwnxTZocBrGoHtY2t0gvzFcuNZ3rT8R+cJdrTNfb7rCgBcLKKuQmhYMO2YR4/riCS9w0eAkB0lGCFM5wP09CT3mmIwQkXD25rzG3TbWptC0CIbhFp6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBoe2HZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE268C4CED3;
	Sun, 24 Nov 2024 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452921;
	bh=OBanrmLoyFPcc1GRuxAE79bi2wgM2aC/cqeerinDC2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBoe2HZck4oLUXtWVLE2vc+PRAn0DEdJV2ijuxeqG162b0kMp4sngoWJLYuJ7GEFM
	 yBCA9q93LbCYFy0DpslqjvaRVUas856ZttFXeoAbA3VpOZc0o1Y3jQjWwR+MHA447a
	 L4MMZ25DYe6SgrjB2JFKglgb8jWNf0Xs90MMJmDB6hJ6Xpy6xp87SysKQApPWBi4Ia
	 TXIQ6QilfTH/K8REiPphBj4zeRuN0ozUn0/oZwbX47PjueLKXQUNnwC8gCK1nN2gUT
	 LBpbLJV8HTagq8bgW7iiEA/znF+UJkE5tgW/CODH96HP/rD2lCXZnNzgBnCoAFmJ0l
	 4jANqspNSuBnA==
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
Subject: [PATCH AUTOSEL 6.1 3/9] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:54:17 -0500
Message-ID: <20241124125515.3340625-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125515.3340625-1-sashal@kernel.org>
References: <20241124125515.3340625-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index a50a1f0a7342c..006214dd9e35b 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1860,7 +1860,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -1870,12 +1873,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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


