Return-Path: <linux-media+bounces-30173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F56A88382
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC68F16743C
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF222D29DF;
	Mon, 14 Apr 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brNgEwb2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD52D29CC;
	Mon, 14 Apr 2025 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637454; cv=none; b=RBiTHx1TS9kEcEaGVoU6HGgDdVNRdKQMaciWCutQSEAu+g4ZaI65a97jkY5upPskCtQaLThK1wy2c+jfcaI2exvMu79LXLjq9Bn5oJCC7VdPK6hErTmoXewP/4QEZzAgR8fQHD/t+wfsMfPIXO+1WTNQ6NQ6rUSW6WQhngDvLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637454; c=relaxed/simple;
	bh=c5JUs1HRSEIEFfoOIVFphwrjz9S7JRsO0j+g4xWdsgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKTXS2L5K4eR4DHYbZiWs92TmatnFGj9wmbIwF0yiTngMYEjBc6s/tdiKEAM++1RB9AI9LP1rj4h1c92UXeKtHpf3FZ1E8UESTnkGqqmajOFzLTwlK3Ckvuv4ZT5HBBO1sHlZz8QYRH8svWDlJ0igkfSOQooSJwF5gffHWJgECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brNgEwb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263F8C4CEE9;
	Mon, 14 Apr 2025 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637453;
	bh=c5JUs1HRSEIEFfoOIVFphwrjz9S7JRsO0j+g4xWdsgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brNgEwb21m3ttcWoIKD/g862mlc06jmuGtwgShLpsIs7tD0Yi3Yk2iz1M2OXERDXQ
	 vq4tHCXfVQZdb2LM82XpD2qNPOV0Plo9+mGkRXjxl1z7DMV0fOSrLiP6CERQCcZ3NP
	 oOXHIG+tQlGVqs4HORLNZYRI4SbfQZHzJ8K4gpYOYcNbikcDM9f1n3jrmKSdiTfNUc
	 YkdwXdE/oDyoXflxm0typZlkLilsg1hkP1WgkBE6418NSjeDFUwdo4tDfzoxb0EaMa
	 +oqxgGxWWnW0dcOJrtGWQbaa9+K0YN/UV4bHx8lhRxNVPFjNd2HBLXjZFFY1ACBiqF
	 D6mG06MS1Easg==
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
Subject: [PATCH AUTOSEL 6.1 02/17] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:30:33 -0400
Message-Id: <20250414133048.680608-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414133048.680608-1-sashal@kernel.org>
References: <20250414133048.680608-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.134
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
index ef99174d81ced..546bba502fbc1 100644
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


