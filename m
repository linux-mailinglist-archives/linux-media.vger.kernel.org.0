Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467402AFF4C
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgKLFcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7516 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbgKLBgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 20:36:11 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWkhC5cwrzhkVw;
        Thu, 12 Nov 2020 09:35:55 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 09:36:03 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH] drm/nouveau: Use vmemdup_user()
Date:   Thu, 12 Nov 2020 09:36:33 +0800
Message-ID: <1605144993-63932-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace alloc and copy with vmemdup_user()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 787d05e..df986d9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -591,14 +591,9 @@ u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
 
 	size *= nmemb;
 
-	mem = kvmalloc(size, GFP_KERNEL);
-	if (!mem)
-		return ERR_PTR(-ENOMEM);
-
-	if (copy_from_user(mem, userptr, size)) {
-		u_free(mem);
-		return ERR_PTR(-EFAULT);
-	}
+	mem = vmemdup_user(userptr, size);
+	if (IS_ERR(mem))
+		return ERR_CAST(mem);
 
 	return mem;
 }
-- 
2.7.4

