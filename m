Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DBB38FC78
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 10:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbhEYIRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 04:17:12 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:3940 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhEYIRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 04:17:12 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fq6Jd56pgzBwRf;
        Tue, 25 May 2021 16:12:49 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 16:15:41 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 16:15:40 +0800
From:   Baokun Li <libaokun1@huawei.com>
To:     <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>,
        <libaokun1@huawei.com>
Subject: [PATCH -next] drm/nouveau: Remove set but not used variable 'dev'
Date:   Tue, 25 May 2021 16:25:11 +0800
Message-ID: <20210525082511.580068-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_ttm_tt_populate':
drivers/gpu/drm/nouveau/nouveau_bo.c:1258:17: warning:
 variable ‘dev’ set but not used [-Wunused-but-set-variable]

drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_ttm_tt_unpopulate':
drivers/gpu/drm/nouveau/nouveau_bo.c:1281:17: warning:
 variable ‘dev’ set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7a2624c0ba4c..51f9a2e6532e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1254,7 +1254,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct ttm_tt *ttm_dma = (void *)ttm;
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (ttm_tt_is_populated(ttm))
@@ -1267,7 +1266,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
 	}
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
 }
@@ -1277,14 +1275,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
 			  struct ttm_tt *ttm)
 {
 	struct nouveau_drm *drm;
-	struct device *dev;
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (slave)
 		return;
 
 	drm = nouveau_bdev(bdev);
-	dev = drm->dev->dev;
 
 	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
 }
-- 
2.25.4

