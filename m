Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770552119CD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 03:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgGBBvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 21:51:18 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35902 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726735AbgGBBvR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 21:51:17 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id C942361FB4DC5C89F11F;
        Thu,  2 Jul 2020 09:51:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 09:51:07 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Alex Deucher <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <tianci.yin@amd.com>,
        <kraxel@redhat.com>, <Likun.Gao@amd.com>, <Felix.Kuehling@amd.com>,
        <jgg@ziepe.ca>, <Hawking.Zhang@amd.com>
CC:     YueHaibing <yuehaibing@huawei.com>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
Date:   Thu, 2 Jul 2020 01:55:52 +0000
Message-ID: <20200702015552.42377-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_init_mem_type':
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:81:24: warning:
 variable 'adev' set but not used [-Wunused-but-set-variable]
  struct amdgpu_device *adev;
                        ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index bb95627ad2cc..8199702d3354 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -78,10 +78,6 @@
 static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 				struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_device *adev;
-
-	adev = amdgpu_ttm_adev(bdev);
-
 	switch (type) {
 	case TTM_PL_SYSTEM:
 		/* System memory */





