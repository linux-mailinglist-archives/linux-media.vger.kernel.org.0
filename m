Return-Path: <linux-media+bounces-21898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85F9D6FF5
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60C57281F8B
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A621B3948;
	Sun, 24 Nov 2024 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4cIKxLE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70131B392D;
	Sun, 24 Nov 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453003; cv=none; b=SKxRbwwXCLKBTresTAH5qfkIX44RaC+hOfdhjxykHujdSlH9eAUStPAk6gYBCDQTvUMW1XbV3/fNKjGnsp/CXBQhfn5xgQZhU3GEfD9CVTcKaDMORKfMbCl8UskTBLnRKc5LKlMp0hBFpZnc5PMR9Gtk7Al0RRWck7fwfACA46c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453003; c=relaxed/simple;
	bh=tBkNIALKDUtR9fMPdpa1ZPjDlXrY+6hRLqGd1U6gmP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lc6LNqYAXqxTt/sgcYP0Gg98PiDFEan/gbBg44vdG6gbTFO3Z95F7v68BZ1fuiAne2KXk2k9RJYY8jzK7J3uUZVwzBx9YlfQ6mql3R3XTJHwOxTdt3g74rbmn3vAAzWIbN9G/WcNRYYeSB0Pr5g2kTCLCN7X74kMPGJ5LG3IOwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4cIKxLE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C08CC4CED1;
	Sun, 24 Nov 2024 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453003;
	bh=tBkNIALKDUtR9fMPdpa1ZPjDlXrY+6hRLqGd1U6gmP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4cIKxLEUo5/JI+D9bB1YfZWPaZ+6a8xWOt3waxsyyOMc/w2HefkwEROfLX/f/Lme
	 rgP+89ZEf55UUgIcgFrR/dn4IVwC92dyE0gaFf5w1aA7xq8UOrbssWXfcbIP36RB0Q
	 Eae/z4nSlWi0Y0qTrv0w5FUo7Qf0krHZxn/sPXSjOHDYN/YOiIAqvMRFI3dFRoCzr5
	 8PMzIVp1nPQm10S6BXSkr9/XJQ9yELdK6aINsKFAMMxLP/psvtfOriaX1PF+BLt9Zi
	 ZKxTenrSYTx0NHhugrCGDR+jge78xcF6EA9WQ0elaS/GUFYuromCcgVRL3iQpD3Ter
	 HU10/WXzXdfGg==
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
Subject: [PATCH AUTOSEL 5.15 3/7] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:55:48 -0500
Message-ID: <20241124125636.3340867-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125636.3340867-1-sashal@kernel.org>
References: <20241124125636.3340867-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
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
index b66e80e6924e5..2b74819e8a446 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1820,7 +1820,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -1830,12 +1833,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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


