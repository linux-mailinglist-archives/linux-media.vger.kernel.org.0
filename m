Return-Path: <linux-media+bounces-21905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9309D700F
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64ED128426E
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175031FF5F3;
	Sun, 24 Nov 2024 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMAJT1zC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681861E1055;
	Sun, 24 Nov 2024 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453103; cv=none; b=BqA4IbtVuO1t+nTJHDsAH/uawVv520xIZ5yE4npmEAql646/SrsneximJPDRqm85jxtp1vJRdEV+j80rziCfq1CE0V9Pg4w79l5ky6E58CmZ3J4TPfICyt8vwbvMU+DdqwombXozZSO0XBOv0uIXUwULQArc303AaEE6H7K3Z1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453103; c=relaxed/simple;
	bh=2CHe93y33kDdot3HAX+BpljTtlOrJUgswR0tdfVnJwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjKQizFOLd9O+t3G/DI584LoaS1q0DcWoCPzqUhm2e2Qsjwu7ttmwiBVCJ51Py3cLokutrMWV/g78LcUeqWOescVEsBFsZJEamgkG7wPcQ4V4OEASDiXR81XGQJLSvW7sz+lvhEzsTccLz+1dCLGAU2hZisg5OlWOnT5dLN8SAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMAJT1zC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA250C4CED6;
	Sun, 24 Nov 2024 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453103;
	bh=2CHe93y33kDdot3HAX+BpljTtlOrJUgswR0tdfVnJwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMAJT1zCDTlZS8rHezbmpQeLF02LPn29ftEJwGVVdWpryKLDnd+ey8ZB2xEQHm/CZ
	 xqpGL42WizhRLWByq3S2pr0HGU6Oq+yrr2Ni3W3+ppVELjjhgYAqEAPH8drbWAFrzE
	 4LV3vMZ5cseuO8iRf+sAHtv0jy0CAKBTFpduR+8tGdAN4zSs1VinobMtbylwRFv6eg
	 WZkYzvCloPurKm0SIKpPSSyonaDWSlBqZGEbumvLEIUHhaozENUk6Yh4gC3WoHXFpe
	 v5jS7u2SRhBTZOFJ9ltnIfdRCTja52ZSacrIg50KbvbJrDJ9BqhEdXnfpSX91K6p+1
	 8UO7kWujMYWjg==
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
Subject: [PATCH AUTOSEL 5.4 2/5] media: vb2: use lock if wait_prepare/finish are NULL
Date: Sun, 24 Nov 2024 07:58:02 -0500
Message-ID: <20241124125817.3341248-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125817.3341248-1-sashal@kernel.org>
References: <20241124125817.3341248-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.286
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
index 98651c934d4e0..4db6a19ae341e 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1719,7 +1719,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
@@ -1729,12 +1732,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
 			dprintk(1, "sleep was interrupted\n");
 			return ret;
-- 
2.43.0


