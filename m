Return-Path: <linux-media+bounces-30942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC5A9AE4F
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDAF69A1FE3
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F3C27C15E;
	Thu, 24 Apr 2025 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gK/tu3QV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924001E505;
	Thu, 24 Apr 2025 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499783; cv=none; b=mzjtZ2PRUfdTqsDgvpGxM8PoP5bXmJATdVdwgE6APbYD4bF0S4dx0E5vcQ8wAZSpLx3j3G3BJUz31OWD6v4KKMEIbNmdkOf5QHSdSogEmTvjZmX/Fsc67YUb0vnuCuCQdhV15K/liRq3dDU8Z0FEV/9GViMBdP5lB6biNdVLDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499783; c=relaxed/simple;
	bh=Jv152d6DpmPq+yu7DURcrVQPxWP449+mWWjGAEmRg0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X4N57MwebtxfPBDOFO91HTthqMMP8/Tq12CqcNaBJjGmXWtRyQQZzK5Yt5S4hyXVNzKyDbUG8gOcvRjwmljhtrDwaFJrlIrT8qXxRdcV/uy17rhT3Id+VKmBKmCYtHO3nU/zUVG9AjWe3t9PGhOcBMhaicQDqHXvoFZjotkGbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gK/tu3QV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE42C4CEE3;
	Thu, 24 Apr 2025 13:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745499783;
	bh=Jv152d6DpmPq+yu7DURcrVQPxWP449+mWWjGAEmRg0o=;
	h=From:To:Cc:Subject:Date:From;
	b=gK/tu3QVpGdNPadYesZICKORjzztkjuHbQbaySlcqCWvPU5OxijS2SEGYClIDuLaV
	 R901q8ITSPqjS9lQxaW20mXT7mfRRAYrV1Wc04DGT1FtX2gmQ17lJVqmUWjql72MY+
	 C8CpbEKZBhrpTsqPxHeu3pdGwa542YH/vZKeIAPrYKY9RN5hZb2x77XqIbuCj6BBcb
	 2ZMw7WT1gO5ZXJMb+zE7nT+FjZZHJ/DNEZNPFyoKtk6mDBBnyndiiPpqtgQBeockw5
	 +cpuNEi+lh2oINAt0JtiDLhp3a1kMCEDQ9Ajo2TSfjsar1D3vNHFAXrAPjKwd0B8yk
	 dEVZlGpuwIcPA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/4] drm/nouveau: Simplify nouveau_fence.c
Date: Thu, 24 Apr 2025 15:02:50 +0200
Message-ID: <20250424130254.42046-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just some minor attempts at improving the readability of
nouveau_fence.c

This series is based on this partially merged series: [1]

Feel free to drop single patches if they are not deemed worth the
effort.

P.

[1] https://lore.kernel.org/dri-devel/20250415121900.55719-3-phasta@kernel.org/

Philipp Stanner (4):
  drm/nouveau: nouveau_fence: Standardize list iterations
  drm/nouveau: Simplify calls to nvif_event_block()
  drm/nouveau: Simplify nouveau_fence_done()
  drm/nouveau: Check dma_fence in canonical way

 drivers/gpu/drm/nouveau/nouveau_fence.c | 72 +++++++++++--------------
 1 file changed, 30 insertions(+), 42 deletions(-)

-- 
2.48.1


