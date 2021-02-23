Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114C3322744
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 09:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhBWIzC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 03:55:02 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:40431 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231284AbhBWIzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 03:55:02 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UPLlkWh_1614070453;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UPLlkWh_1614070453)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Feb 2021 16:54:18 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     christian.koenig@amd.com
Cc:     ray.huang@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] drm/ttm/ttm_bo: make ttm_bo_glob_use_count static
Date:   Tue, 23 Feb 2021 16:54:12 +0800
Message-Id: <1614070452-91054-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning:

drivers/gpu/drm/ttm/ttm_bo.c:53:10: warning: symbol
'ttm_bo_glob_use_count' was not declared. Should it be static?

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b65f4b1..107dd13 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -50,7 +50,7 @@
  * ttm_global_mutex - protecting the global BO state
  */
 DEFINE_MUTEX(ttm_global_mutex);
-unsigned ttm_bo_glob_use_count;
+static unsigned ttm_bo_glob_use_count;
 struct ttm_bo_global ttm_bo_glob;
 EXPORT_SYMBOL(ttm_bo_glob);
 
-- 
1.8.3.1

