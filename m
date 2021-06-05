Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FDA39C44A
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 02:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhFEAWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 20:22:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:7642 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229853AbhFEAWp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 20:22:45 -0400
IronPort-SDR: Ln+yMKRXNzYycx761t2PCzBAR7kLiVcvBCTq8EcDYpZH+T/GRERSg2gqKtTNAPwjKXlq5jlSB8
 Sz1alwKD/z7A==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="265555669"
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="265555669"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 17:20:58 -0700
IronPort-SDR: CtqDjBcYidukEhlgPPtYwvyv3qllyOrBvMVR6VKC0Fb40ObDiAWBrY8WRvlTyJDUln9KbBhm2U
 3Ic1T8gwaNkg==
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="446862419"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 17:20:58 -0700
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix build due to missing export
Date:   Fri,  4 Jun 2021 17:20:07 -0700
Message-Id: <20210605002007.4153933-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
turned dma_resv_reset_shared_max() into a function when
CONFIG_DEBUG_MUTEXES is set, but forgot to export it. That resulted in a
broken build:

	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/vgem/vgem.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/i915/i915.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/ttm/ttm.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm.ko] undefined!
	ERROR: modpost: "dma_resv_reset_shared_max" [drivers/gpu/drm/drm_vram_helper.ko] undefined!
	make[1]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1

Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/dma-buf/dma-resv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 3964df438505..6132ba631991 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -226,6 +226,7 @@ void dma_resv_reset_shared_max(struct dma_resv *obj)
 		fence->shared_max = fence->shared_count;
 	}
 }
+EXPORT_SYMBOL(dma_resv_reset_shared_max);
 #endif
 
 /**
-- 
2.31.1

