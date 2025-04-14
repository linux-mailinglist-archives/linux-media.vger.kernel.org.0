Return-Path: <linux-media+bounces-30172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED7A88348
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF8A164DEF
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B3A2C1099;
	Mon, 14 Apr 2025 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdyEmnS9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C80C2BF3E2;
	Mon, 14 Apr 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637405; cv=none; b=IOarejiq9tLL/mNcqDtfKC2Tr0TndKQ8vWweQsAaW/Qt1lVue9uwmjhYm/rrdPHjPqts9R85I8c1HeMpTmMNeTsRrjPP64gB24x+4xs1EVScfyV995N2z6zUf42Uta23tyFhfjz7N4x9RlWBWiO277GH0Ctkx9Se/Qg02cVkaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637405; c=relaxed/simple;
	bh=bSdjzf03N5dkH1r6wALmuE4ALtyVK39xcb0mwy/hEwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjMfK48P5uLcLmLSUODSEagLZxrEpeh631n+T5pI81V9Ds9N7JX3aPWHkaKhOldqRcjhfWx4KK2SgOlZ25Nv5XPqlwo4+ZG6ebMQvU8yq4fpivtgoo+6cLeuH5YEK6OMlWGNmpOdqeQnUShBiLhJ6eQ7+X7QyUeE+EuSKrNIrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdyEmnS9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9674AC4CEE2;
	Mon, 14 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637405;
	bh=bSdjzf03N5dkH1r6wALmuE4ALtyVK39xcb0mwy/hEwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdyEmnS95zF/sd+/SjXX8/WuYXIfZiGn7p5vOt0GQHcqVacfiyw+n4YitYmUi1Cd4
	 B1l/3M5xykCIrLKkpl/OKdrN+EkEhZOdJMrBJLz6wXDf6ipTuWPHCTcsiz2Uja5Xog
	 h0DyPs6xTcXbqHIiKixa+PGEEWfK0LjjRknDjZLXqM0ou5rjFQ7Sw6/V8ZbCWj67Mt
	 46tq3Xy6dZb7MhtLpmNGtXeCC1GozlpnZV/JE9tuoRw9AJSryPIT/FboEP8dC/GLX5
	 9uChci2tSdK/nUu7Yue3pJEm+5uSaxRxIQpMCyxGFjv67EInYj4hZf4OEuQ7R00PjP
	 nZmRgbLIfQEhw==
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
Subject: [PATCH AUTOSEL 6.6 03/24] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Mon, 14 Apr 2025 09:29:36 -0400
Message-Id: <20250414132957.680250-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132957.680250-1-sashal@kernel.org>
References: <20250414132957.680250-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
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
index d1fcdd1f9aaed..373282beeb606 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -214,7 +214,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
 			goto err;
-- 
2.39.5


