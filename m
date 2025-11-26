Return-Path: <linux-media+bounces-47759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABBC89FB4
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 14:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2CF33B2B0C
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 13:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4914329C47;
	Wed, 26 Nov 2025 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwtlcmIl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3826D4F9;
	Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764163228; cv=none; b=NaEnlDRbSt+pEoVekJshuLLQIMcSfJ3T9GTDen9Zg+DG12muJz7mNUHiUVuPfPVBsDczL5Adgdj4naPsVkMyoJECNc57Ylsmil1kpW5rbVUbz4ETJta8UNVjD3EB4p3oY6Ms05sR+cI2/jYl48YL1I5xJKkFwi4RU0Ual3al+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764163228; c=relaxed/simple;
	bh=UWZRmAEzkRqq5oGLP1a96kp5nn+UOgdKzQBXsbq4Mcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5Afq09ffDhECgCvmkfwymoVrNIKAHyd8exLlqgNTeJxHmMXMaNrFGqhKmdKLoAJi+flkuYVfVazLPB8OOy/T6tU8InJMS/5KyV8M2m+4mUmmi3Y76ElqkW5VwOpdV1TrMPzBYeNYaZg+i8WweFGjYhcJ3CBD75A2V8z6JQ1hU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwtlcmIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89199C116B1;
	Wed, 26 Nov 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764163227;
	bh=UWZRmAEzkRqq5oGLP1a96kp5nn+UOgdKzQBXsbq4Mcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TwtlcmIlc7KO7bkTPkzH6jVSl0c0R12kc6TX9T7fQ2Z88iPp6WbrfIkqrHVAY8oyV
	 sTD4ZtmpevXeOQ8otE8u/HMIAOCWUNURuiB8yFzWBH+4THH8FAGv6kXCTfUpp1Rfyj
	 3A/rYMsX0hPycQYG/bp+iKnWpoRPl5Djqyv0/6nj76SU4aGAPZHcOK8QiZv8ez9kJR
	 d0KFSmR0lj6gdUB2bU/9mwbdzzfYfNOZFrK+GhnugiPGBOmbHkEG5+KO7HCSxYj7ii
	 d1VDQ2ToDs0voceBmjaEJLdXGjuv3FR3ffa+lZW1Hez+8c7Z2WhjDyVnuGi0oS1VLD
	 Ui6T8oE/fHQVg==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 4/6] dma-buf: Don't misuse dma_fence_signal()
Date: Wed, 26 Nov 2025 14:19:13 +0100
Message-ID: <20251126131914.149445-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The return code of dma_fence_signal() is not really useful as there is
nothing reasonable to do if a fence was already signaled. That return
code shall be removed from the kernel.

Moreover, dma_fence_signal() should not be used to check whether fences
are signaled. That's what dma_fence_is_signaled() and
dma_fence_test_signaled_flag() exist for.

Replace the non-canonical usage of dma_fence_signal().

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/st-dma-fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 27a36045410b..9fc93859f36f 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -126,17 +126,14 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
-	if (dma_fence_signal(f)) {
-		pr_err("Fence reported being already signaled\n");
-		goto err_free;
-	}
+	dma_fence_signal(f);
 
 	if (!dma_fence_is_signaled(f)) {
 		pr_err("Fence not reporting signaled\n");
 		goto err_free;
 	}
 
-	if (!dma_fence_signal(f)) {
+	if (!dma_fence_test_signaled_flag(f)) {
 		pr_err("Fence reported not being already signaled\n");
 		goto err_free;
 	}
-- 
2.49.0


