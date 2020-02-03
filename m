Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AAC1509D5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 16:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727201AbgBCPdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 10:33:02 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44900 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726272AbgBCPdB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 10:33:01 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 062DC1698C8725ACC4FA;
        Mon,  3 Feb 2020 23:32:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 23:32:52 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Rob Herring <robh@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC:     YueHaibing <yuehaibing@huawei.com>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Date:   Mon, 3 Feb 2020 15:27:24 +0000
Message-ID: <20200203152724.42611-1-yuehaibing@huawei.com>
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

drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
 variable 'bo' set but not used [-Wunused-but-set-variable]

commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
involved this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7c36ec675b73..ccb8546a9342 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
 	}
 
 	if (job->bos) {
-		struct panfrost_gem_object *bo;
-
-		for (i = 0; i < job->bo_count; i++) {
-			bo = to_panfrost_bo(job->bos[i]);
+		for (i = 0; i < job->bo_count; i++)
 			drm_gem_object_put_unlocked(job->bos[i]);
-		}
 
 		kvfree(job->bos);
 	}



