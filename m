Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABC03040B3
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 15:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391475AbhAZOnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 09:43:49 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:48103 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390386AbhAZJob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 04:44:31 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0UMxz7nf_1611654189;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0UMxz7nf_1611654189)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 26 Jan 2021 17:43:16 +0800
From:   Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To:     l.stach@pengutronix.de
Cc:     airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux+etnaviv@armlinux.org.uk,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] drm/gem: remove redundant NULL check
Date:   Tue, 26 Jan 2021 17:43:07 +0800
Message-Id: <1611654187-95651-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix below warnings reported by coccicheck:
./drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:80:2-8: WARNING: NULL
check before some freeing functions is not needed.
./drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:612:2-8: WARNING: NULL
check before some freeing functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 12 ++++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index d9bd832..c402d424 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -80,8 +80,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
 	 */
-	if (etnaviv_obj->pages)
-		kvfree(etnaviv_obj->pages);
+	kvfree(etnaviv_obj->pages);
 
 	drm_prime_gem_destroy(&etnaviv_obj->base, etnaviv_obj->sgt);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d05c359..bd0d66e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -612,14 +612,10 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 err_submit_cmds:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
-	if (stream)
-		kvfree(stream);
-	if (bos)
-		kvfree(bos);
-	if (relocs)
-		kvfree(relocs);
-	if (pmrs)
-		kvfree(pmrs);
+	kvfree(stream);
+	kvfree(bos);
+	kvfree(relocs);
+	kvfree(pmrs);
 
 	return ret;
 }
-- 
1.8.3.1

