Return-Path: <linux-media+bounces-30176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA9A88441
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C683BF7A1
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592F9275845;
	Mon, 14 Apr 2025 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhRCVoRv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3D2DCB67;
	Mon, 14 Apr 2025 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637524; cv=none; b=DFIdHEnSXJJFO/ZgbTfmtiFgbbJO6v85wovtXugDLpNV4xSebySAvU9NOigiB+1D611nUMCdUlgcfl0tN2taC8NoDU52E1OLjl2dWvTScDHVp83q5IPCgy2jzc1L+jvCHwC0zuMJU7I46x05IED0IrGx3fykjgwD6kFwlFcV+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637524; c=relaxed/simple;
	bh=pwIExdFiYdxJXREBib34JoKBikEhRR4vg+205pXMkcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX8ChJZwCeu/CtHkG3ZHctl2M2i1SQuXITJrbyk5Rj3B6wGCc3C4kt8rdgX2cM4+fncHJo3RLwhvzjPSAdMjbO9lNC0Vi8IqK6JuGQkTWTRGODS0SBNdYkYX7m6kjqQB0r5viYQZFF7B3QNfXenz31vPEsrOWhp8b0qich7Tp2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhRCVoRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97702C4CEE2;
	Mon, 14 Apr 2025 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637524;
	bh=pwIExdFiYdxJXREBib34JoKBikEhRR4vg+205pXMkcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NhRCVoRvkOHJlk3f5GOTo+ylU9cg9r4TR/95ZHdhJDH7nucBPIgFWhZXPnzqQmQuy
	 oavzVT28K61wcHmOhndo6i03vGOHBfuSjdlq78wTdZrYkWUaNV8USHDVAbnU/wvedw
	 EdFrds5B715M9EEA/ac1woHDSI7QJBqF5IJQ3grcHxzVPbdg0LMXH6/LdDJ62dyXk5
	 PPX+chQUSi07bvcTGiAFllSwbPU89mOL8Tz9QrdcxF1+rkl03jOEYPQ8e7eMkieavY
	 QPD5ZnN3H1IrIzrlshMAuFDwHcFH8pJvmAUPMZvOog/YHPg7yoOiUBGOxH2KusNpJl
	 SH34Ev7i7ObnA==
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
Subject: [PATCH AUTOSEL 5.10 02/11] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:31:49 -0400
Message-Id: <20250414133158.681045-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133158.681045-1-sashal@kernel.org>
References: <20250414133158.681045-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.236
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
index 14b79458ac7f4..597a92438afc1 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -177,7 +177,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5


