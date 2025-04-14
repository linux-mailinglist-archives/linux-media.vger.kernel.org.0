Return-Path: <linux-media+bounces-30166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F831A881FE
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 295E61898052
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCA02472B3;
	Mon, 14 Apr 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGCmOwGi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41B247280;
	Mon, 14 Apr 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637180; cv=none; b=hOdhrtCC+ndymoESiVBTPLptapXTbRqlDDbjM7jgy6SmlYc8iMyzKOlLLhPPt3a5fmmAbMo0Qeedm60VLArC882u/XwQuTybtjlcdDwCpLUrmY9hnFvf/BmIwB5CjJUYYpiOQ9TOCl+ARBZeumJaGXe7lIKR88YHx4nGYTxpnps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637180; c=relaxed/simple;
	bh=TsvvjU34ou6DeKBnAEaZf6xjk/wVJu2sGieu/mEr1vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkxP4lJJ4YVRijxM/BvzUYz3QvhHPvWTH9WMdmxoA1i2QpPHF6E0I/6XOdWzfM9RYLOS4MoqpSdxkdEaPZ//vwGbAoRf8xTws3YSHZBf8U/bebgwLyCRBcBImVjS0y6RojWzPhKqcRg745KvA7L2wQquBT4HVvoFV7zcAcYUed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGCmOwGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ECDC4CEEB;
	Mon, 14 Apr 2025 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637178;
	bh=TsvvjU34ou6DeKBnAEaZf6xjk/wVJu2sGieu/mEr1vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGCmOwGiudfQ5/3NNQ5aNd6+B8nkT/bqwedQWP+NuBSSQRkjSYS7COmYhfiFS7nc1
	 eztfXm6mlqIQ1u72XVGEhyCSGcDMEWWL9z7FYUyzOjEYSC6z2quaj5TvyY27w2TIpn
	 AYek6uQk8KIdEBfC+tSLCIi+tT5mK/AzhP80hVzBbvLbcYDaTBDeNZ6ZX35dN8AXS0
	 hKILfWXKkqjm8DZ4MYfvPhBE+BhGaNPyrQq0fSPyq6wqUviUlFRoi/hUJ1VMr06xvD
	 IbgBkCsf5fNU9KTdo9rGGx/QiZT3vgA5ULtis60312MFBhoT3dcCRj96oK2lwXCk0/
	 7b78mFGHPuKTg==
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
Subject: [PATCH AUTOSEL 6.14 03/34] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:25:39 -0400
Message-Id: <20250414132610.677644-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
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


