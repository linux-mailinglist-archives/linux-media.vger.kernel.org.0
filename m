Return-Path: <linux-media+bounces-30168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FBA88271
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA9CB7A9D5B
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7D727A13B;
	Mon, 14 Apr 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMqg/MOf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591627A12B;
	Mon, 14 Apr 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637257; cv=none; b=UlURsy0p+Wg6cFBAnLNxd1Vw6kJoki/uYhFtVYXt+8Kwk2NO5SoFncUUbgOD6AgDHuG4gV2YUsw9RKb6Z6GjzSySATCVG+UOXdI+obdYg/aZZ5zBB7bDGHywGCrMEh7Tb5/dWLNSQsBtizf7SH31UHeR8PZinQhMyM2x5q3UuCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637257; c=relaxed/simple;
	bh=TsvvjU34ou6DeKBnAEaZf6xjk/wVJu2sGieu/mEr1vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQyQ3+835i+yOrp1x7VZ89aJxWvGrwd7qMBYyqJH8IfAmEssG2x+TD7M4Ju1VPRv7NMyTi+Rjzni0IgeXyPs6t2vSsjmEqigA9Hgvh6BY90ONKrVUFF/Fgr3NPrlwp6WmJfWF6sMKPlg1q9zTuNbxJrTNCYxhcnyHtMlLtzgG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMqg/MOf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C120C4CEE2;
	Mon, 14 Apr 2025 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637257;
	bh=TsvvjU34ou6DeKBnAEaZf6xjk/wVJu2sGieu/mEr1vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oMqg/MOf3Lo00KJvtKWWbFZDheN9yP2HK+OpYqI7R8SXt+pWU3AC6r1MdK0VaHNUm
	 wB+bZ7JUs1WQ7jrPJK8HrTr23Vip3CUo/ySzeTGXBmqbwJUODuYN8okrt3fcsZreFR
	 2UuWug76wUzP3SahaJOCZ6Iarv8h4VBxE5vJI04iokHUKGceodm0vLJx78v8dQ6wmP
	 /axJ9I7fgBro3iyUcDwoBliZBpjsu3m2wFSIto74BO/dgWMryPmsBG6Bm7saV0bs9Z
	 4yH7omRPby867GmIxULPBEx+CcGG0TcCuO4H9niyv7H1G6N7Vnab0fMMEpxFMI9NEg
	 VW+at8GvTpA6A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaogang Chen <xiaogang.chen@amd.com>,
	Xiaogang Chen <Xiaogang.Chen@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	kraxel@redhat.com,
	vivek.kasireddy@intel.com,
	sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.13 03/34] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:26:57 -0400
Message-Id: <20250414132729.679254-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.11
Content-Transfer-Encoding: 8bit

From: Xiaogang Chen <xiaogang.chen@amd.com>

[ Upstream commit 021ba7f1babd029e714d13a6bf2571b08af96d0f ]

by casting size_limit_mb to u64  when calculate pglimit.

Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250321164126.329638-1-xiaogang.chen@amd.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index cc7398cc17d67..e74e36a8ecda2 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -393,7 +393,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		pgoff_t subpgcnt;
 
-- 
2.39.5


