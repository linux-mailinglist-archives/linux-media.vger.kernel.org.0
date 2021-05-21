Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4B238C3D3
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 11:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhEUJwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 05:52:01 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:39275 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230186AbhEUJwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 05:52:00 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0UZaz--9_1621590630;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UZaz--9_1621590630)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 21 May 2021 17:50:36 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     alexander.deucher@amd.com
Cc:     christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
        daniel@ffwll.ch, sumit.semwal@linaro.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/amdgpu: Fix inconsistent indenting
Date:   Fri, 21 May 2021 17:50:28 +0800
Message-Id: <1621590628-75988-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Eliminate the follow smatch warning:

drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:449
sdma_v5_0_ring_emit_mem_sync() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 75d7310..c45e1b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -440,20 +440,19 @@ static void sdma_v5_0_ring_emit_ib(struct amdgpu_ring *ring,
  */
 static void sdma_v5_0_ring_emit_mem_sync(struct amdgpu_ring *ring)
 {
-    uint32_t gcr_cntl =
-		    SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
-			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
-			SDMA_GCR_GLI_INV(1);
+	uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
+			    SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
+			    SDMA_GCR_GLI_INV(1);
 
 	/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
 	amdgpu_ring_write(ring, SDMA_PKT_HEADER_OP(SDMA_OP_GCR_REQ));
 	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(0));
 	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_0(gcr_cntl) |
-			SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
+			  SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
 	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(0) |
-			SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
+			  SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
 	amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(0) |
-			SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
+			  SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
 }
 
 /**
-- 
1.8.3.1

