Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0791AA24D
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 14:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370566AbgDOMxM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 08:53:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2897459AbgDOLm2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 07:42:28 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A658B206A2;
        Wed, 15 Apr 2020 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586950948;
        bh=3pmT4YkkfBFRhMwn/QUKY+tcN3RpzhDBpm4ueWUO//A=;
        h=From:To:Cc:Subject:Date:From;
        b=GwYxppomtrCAvpbE32ftrhXu3Vwu6r8FcNMWqigRWTQ48rAz7rBsa7URTm0u9FcNE
         pM6Bvz8bvCc9fAqAn6X/DCobW4oGDPoqMftGhNAolJkYhjC87MBPR0UnwbOSb0fciT
         3wQkL6gjHvO0kySaS/XfrdEZFBDjagJXuX1rxq4w=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     xinhui pan <xinhui.pan@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 5.5 001/106] drm/ttm: flush the fence on the bo after we individualize the reservation object
Date:   Wed, 15 Apr 2020 07:40:41 -0400
Message-Id: <20200415114226.13103-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit 1bbcf69e42fe7fd49b6f4339c970729d0e343753 ]

As we move the ttm_bo_individualize_resv() upwards, we need flush the
copied fence too. Otherwise the driver keeps waiting for fence.

run&Kill kfdtest, then perf top.

  25.53%  [ttm]                     [k] ttm_bo_delayed_delete
  24.29%  [kernel]                  [k] dma_resv_test_signaled_rcu
  19.72%  [kernel]                  [k] ww_mutex_lock

Fix: 378e2d5b("drm/ttm: fix ttm_bo_cleanup_refs_or_queue once more")
Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/series/72339/
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 8d91b0428af1b..1494aebb81284 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -499,8 +499,10 @@ static void ttm_bo_cleanup_refs_or_queue(struct ttm_buffer_object *bo)
 
 		dma_resv_unlock(bo->base.resv);
 	}
-	if (bo->base.resv != &bo->base._resv)
+	if (bo->base.resv != &bo->base._resv) {
+		ttm_bo_flush_all_fences(bo);
 		dma_resv_unlock(&bo->base._resv);
+	}
 
 error:
 	kref_get(&bo->list_kref);
-- 
2.20.1

