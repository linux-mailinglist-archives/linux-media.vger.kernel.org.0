Return-Path: <linux-media+bounces-30175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539FA8841C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99B4580995
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AA425395B;
	Mon, 14 Apr 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWgOJJKT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBC2DA112;
	Mon, 14 Apr 2025 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637491; cv=none; b=UDcw9RaJc4PePXZyFhmMh2HTsYOV1MS0+iHcHMH+jbMlxIvaDTWqHJSsh5bmip483+8pyCyFt0birJHyLKvbMGH7rNNfjC+1DRJhdEZdD6QagSKoCSQBCoBn43xAR+Z+eZknL+mTjZJq8rm2UTm1lFxGvrUKWC3ll0p1eThVWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637491; c=relaxed/simple;
	bh=SRRtruO+5wCGygThqaBjgo4hqGGtgJoA5gdGoFLfgTE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwAQyYhulhzgPb/ENXDRJzTk6Hxpb/9L/c8TOeFa9GcntXTTRJJa5dsWY03H97NufQFYeP9LoIdO6whD8Q+tWTTz3tbWlkvc4e8RG/epIVNm6ASReg15t3DBPBBZrv5MfzW6Ml379XT55T4VPs5cFrKMNEq2uPCUnPJpW5TaNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWgOJJKT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FACC4CEE2;
	Mon, 14 Apr 2025 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637491;
	bh=SRRtruO+5wCGygThqaBjgo4hqGGtgJoA5gdGoFLfgTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWgOJJKTmVAfvwUd+XoBqV4t05PlllE10XINKOZa1bgV9XMixm3Ube51WTuDi2cQI
	 o07Hkfv0WcJJn7Zi0AqJg6MoiNUpIAy2KFeBdit8bBgFOXKCR1xPWKizs75hwrwwOM
	 WufqDTHrVifHEDjW9BmXT2km3Ykp1y029f0D6LjzD+td4j9p8h7j1k1n5Zp6/P6WnK
	 oarv7QPSVWsXOA6GPmKpPU043UnyU4IIjaYF6DzH+Oy8su6lgrGbrtwP7OxmEdHi/y
	 2HcwyUO1D8kGC9Qpq1xLjs5KishWgmhmDq0f2Q9RqkT8lMT+tZMNGKwyqHmx1bgfJx
	 dLmFIywDNxyLA==
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
Subject: [PATCH AUTOSEL 5.15 02/15] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:31:12 -0400
Message-Id: <20250414133126.680846-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133126.680846-1-sashal@kernel.org>
References: <20250414133126.680846-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.180
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
index a8094d57d2d06..84f7611c765b9 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -186,7 +186,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5


