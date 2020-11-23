Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB422C0467
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgKWLUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgKWLUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:20:15 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0068CC061A4D
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:20:14 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so18174324wrb.9
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7j4MAG3aMMAv+exH325swHGJEpjCRvoAo6+eP0jclY=;
        b=lNK83QJS2ndVONnSis4ixIX5b3SXdsncFYR912rIshpJ18Ac3nGF4AFjIcTh74QQTU
         WluvQPGONjU4NiFHaL4NTrNzC5IHdE3V0VQdNQ3pNKFyj11k+WjmlKX89yB5dimcFiov
         2f+MUMxY1HN5Z5LEbCTgklsEbN10IyQlYZBnA9RD3eqC9W6IzpjireyMxOiBAt9eA88J
         Zj84a3y/mcHqA778ECrH8x2HuPUV/EFDP3URDRVk9vBqYxtzvTbcm587B2X6oGYOp9FV
         L7vr57zATASuA1lLNskOEsiqrz50jCw1zFOMavSoUnLiKimFhQkVlXh0nOwOOG+ikK8b
         XalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7j4MAG3aMMAv+exH325swHGJEpjCRvoAo6+eP0jclY=;
        b=Bd+Ij3PWRqdfMpSp7lAOsJy86DcUMHIFHSer0gYsU8NyABrnJZ0heBsxPM/6YBruCv
         iRFqdVxD5nVR7jMmewNIvXdoqKINuCktOapUaCDX6Ezvyl2yvb+jUm4jVIodZA+OJgDl
         ZeIrNsCwnCEfmAwmZ8W5ZgcjRPMXTd4mIsote/gqHxWvgwEfFd92jcHbhcJCancx5GfP
         7o162wT/ihiYHaAhcI+bzamxkJT7hSxw0wpkalNCLm+qJz9imsTd95v2CeImdTO3Esxh
         iZQUbfRpXu2/vo8hc3/1wiiGacLNwHmWW2Hkwwerjv5hCVmxEPZZiI27+RkOW/Zko1LH
         +Ycw==
X-Gm-Message-State: AOAM5311A88pCtzZUy9mWJZPbb7wIqHkNP4q0khrZ8qcAxqLQxOMcRfd
        dyInnRTWQaHfCefWdU6CUCMyuA==
X-Google-Smtp-Source: ABdhPJzPAspljYVUUQw5F7zFIQt0YEnWI6OkhToahK3/SXM47FmrLku1L0vKnxwWd6+xB4+RbhoiJw==
X-Received: by 2002:a5d:6892:: with SMTP id h18mr30002591wru.49.1606130408851;
        Mon, 23 Nov 2020 03:20:08 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:20:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 33/40] drm/amd/amdgpu/cik_sdma: Add one and remove another function param description
Date:   Mon, 23 Nov 2020 11:19:12 +0000
Message-Id: <20201123111919.233376-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:282: warning: Function parameter or member 'flags' not described in 'cik_sdma_ring_emit_fence'
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:282: warning: Excess function parameter 'fence' description in 'cik_sdma_ring_emit_fence'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index f1e9966e7244e..28a64de8ae0e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -271,7 +271,7 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  * @ring: amdgpu ring pointer
  * @addr: address
  * @seq: sequence number
- * @fence: amdgpu fence object
+ * @flags: fence related flags
  *
  * Add a DMA fence packet to the ring to write
  * the fence seq number and DMA trap packet to generate
@@ -279,7 +279,7 @@ static void cik_sdma_ring_emit_hdp_flush(struct amdgpu_ring *ring)
  */
 static void cik_sdma_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
 				     unsigned flags)
-{
+  {
 	bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
 	/* write the fence */
 	amdgpu_ring_write(ring, SDMA_PACKET(SDMA_OPCODE_FENCE, 0, 0));
-- 
2.25.1

