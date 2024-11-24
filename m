Return-Path: <linux-media+bounces-21884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A919D6F90
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E622818A6
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27C51F4283;
	Sun, 24 Nov 2024 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh6BJ8vA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAA1F426F;
	Sun, 24 Nov 2024 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452719; cv=none; b=tgSFw5jMRDpD5k2i0fwehKBFGC0FnDLsNwReFXJOd70tTkJZo01+PNZxpZULXjWAujOkmYsoAIK+Jbe1ytpjPbG9J4pVvP9+GTlqL3B45H6kJXQyHStz6iYXYOykg8dsoCIZ1FPZRTXM9mJIuZqDgcuP6G2+ZT+I408gZG4lRzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452719; c=relaxed/simple;
	bh=7i21TRHleO8fbgbkI3BI22lruvEVHTpaYhB+fzrbJnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvoK4U3H0lneayVHrQLFF7M/5Uy/GuG9ZIOkIKJnjnPYeHUexCQSNCiDpMgcFUMsIX/1aycwJZ1A58dm+RoD82jMRU4YnDAx165KKyQffzWLOGrKDl2yFrSK95lApzIRsyspK07W1msmzgYfqw/s2jSrXTDu8jaLRpJ4RqOf69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh6BJ8vA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907FFC4CECC;
	Sun, 24 Nov 2024 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452718;
	bh=7i21TRHleO8fbgbkI3BI22lruvEVHTpaYhB+fzrbJnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wh6BJ8vAWqA3asDPO7ZAphHcOQXnFo1teYM/p6fwhw0dVyRiXFPRKXGJCWQxKiDZF
	 eUTnFRSe8v4Hdu9o81FD9oK/H1hL0ZylNbf5jdaw1nvCOj0ti87bk4ZhKhhFZ0mTtm
	 qmw4O1o6fEHbjpU3qMtw+Mr6WNQm5cYhfCkjg0Bj7YdF5GIGDVveUK436fanIGz8SA
	 CPKfRqGB6q3eo/6qAlgSkjYMCCouI2AtsxwjPqiX7rHRXBAytl09/D1lDUHwNSStvd
	 uR/11rThEkOvySmJL47VIbeYeutmNCfjIVXGNPC2jn+BRKcRUcxMyYV41lnBVql8AZ
	 dv45lxOnT0Neg==
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
Subject: [PATCH AUTOSEL 6.11 10/20] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:50:40 -0500
Message-ID: <20241124125124.3339648-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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
index 97605c2e25dac..47d73759f9f75 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2004,7 +2004,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -2014,12 +2017,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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


