Return-Path: <linux-media+bounces-30178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E8A88420
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB70188CAA3
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED39A27584C;
	Mon, 14 Apr 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txO8bS0U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D3D2DEBAC;
	Mon, 14 Apr 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637550; cv=none; b=pgilc06JKz7Nwf/2hO+5ij9R01Sy3YlKfdC3L4EFXgqTM/BccM5xUJoo8KStanaf5nrWdmiT6ejpXlTtY90LiBBGV2avm49AtVpH1jB4HRazyY8H0hzEIHP0Kdp1VMAxj3FAr7hAYlHX99TZDUc7DscpNQmuYFuF7O3vIe6i9V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637550; c=relaxed/simple;
	bh=upAYoaIKfnFp1YqPIV0HEDCVf8HfkmFlgbEOGAyFOxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1F00PLYFy21LHSoBDcc5noEz/aOV1MWg0dJAimYh7acB1s1eJCB6aH2h5kgYyDWBQlLWlA5ZTP+wN7TXqh1AoXOogSyP0KLXlIIL+PhGDZv9YTXBo+XUQ6sDgx6iHnDZK+ZbF/+bDYwYXgGPPWaOoXSCR/q2WV0/piKibFd+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txO8bS0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F4FC4CEE2;
	Mon, 14 Apr 2025 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637549;
	bh=upAYoaIKfnFp1YqPIV0HEDCVf8HfkmFlgbEOGAyFOxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txO8bS0U2ja0qSKFP9not2bmF6L3p/E1hywzwYkETmFklK8+WXK7sYzfV8jqOuXBc
	 l14hyH4zApSIewGPcsO6j9q0KNFAzmae0Fe0ozl2GMqY+GvGKxn3qE1/w7EBRdlVTz
	 wGDI4YWoOJsnlURcTGmXe0YrWZ8ZYejeUD0InhuyGzFuHBlkJJYJreWvewQNL4oeWD
	 yi+i8vXWmoRbICXWrzCadrxioEFcKSonXpk0VNjYv3276dV7yZi6ZZfL1Ljg1eRmtN
	 zannv8vFie+2kHs6kttGXCs9o6h+rXs1TmSdb10bCR0ReTGjJbrAJEHgZFA4c0/T3U
	 Um7AM51+Ey9vQ==
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
Subject: [PATCH AUTOSEL 5.4 2/5] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:32:20 -0400
Message-Id: <20250414133223.681195-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133223.681195-1-sashal@kernel.org>
References: <20250414133223.681195-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.292
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
index ae42e98cf8350..dfb572282097b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -138,7 +138,7 @@ static long udmabuf_create(const struct udmabuf_create_list *head,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5


