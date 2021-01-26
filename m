Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB78A30408C
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 15:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405902AbhAZOhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 09:37:50 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:48779 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391577AbhAZJwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 04:52:21 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0UMyf0qW_1611654680;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMyf0qW_1611654680)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 26 Jan 2021 17:51:33 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] drm/msm: remove redundant NULL check
Date:   Tue, 26 Jan 2021 17:51:19 +0800
Message-Id: <1611654679-102885-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix below warnings reported by coccicheck:
./drivers/gpu/drm/msm/msm_gem.c:991:3-9: WARNING: NULL check before some
freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9d10739..4f1f1a0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -987,8 +987,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
 		 */
-		if (msm_obj->pages)
-			kvfree(msm_obj->pages);
+		kvfree(msm_obj->pages);
 
 		put_iova_vmas(obj);
 
-- 
1.8.3.1

