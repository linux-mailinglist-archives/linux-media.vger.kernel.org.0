Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCF93622C8
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244594AbhDPOi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244425AbhDPOiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:21 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92715C061763
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j12so7533373edy.3
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H6lJM5vDlPCigZaMaZ137qXfyZxXCNgpbaNiX62r2Ss=;
        b=flSVCO6bULmEgKESUIhxGFuVTNcmVsqnwVrbn6m72srwUAYXKxBZS5Q/oDRhGv11DB
         v2a+c3zWguVvSFBphtnT73j9vAYOvHTNhi79odq04gfZLHYc8P+C4KTSZfBLdj8PyqNi
         BysQPAg5pgN8mANchtugw5z6tOHIVzKAx7bDEr8rmeH8ZQ8wjCv2lHbOIbX9jNKGxnLM
         ha5i5bwbGCMi3MrzIg5/rf/uHde9U+WFKoCGDBgH6kOx9yXAPH+LqQIFyTVIgV/dHEsc
         SyIsLANSeD5YaFr6F/3jY5GkhhiKLkX0scp2o5vzC6FMlIjMpnzTMnNQ3SCT8WDCRs+9
         AjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H6lJM5vDlPCigZaMaZ137qXfyZxXCNgpbaNiX62r2Ss=;
        b=Btwu3FtDJPi/PRpOXUBoyfMSsazLcairsaS+ExKq3EzSrqJBKrkrrz8igLsR5xirZn
         uFfjD7yV7028nHjw0aBpV665aRN8IfUm5q3qnXPFNTQCdq5K6/bOVZwOk1ndgMV6ZLyr
         rJ1wS0wafbEloaSP84444TsL674ImK9eCspG72jaBECfN5DsvZHTy9v56sixgnIfwV21
         //BsEK3IEjdiAuaVMpsCkms5zb++FKrOWbNx4WlROwttZZDutyRI4aRI+wnGGJ+umyHZ
         kV9x+GsbZNk0lFucBShhwQX0AX0x/ns2B4hPZXEuSdztDOqVrzi2UrvSGRhDTAVUGOY6
         eHnw==
X-Gm-Message-State: AOAM53203aPa71VTtEfAXX4zArrriyXZCtnc2fvuEaoWCyTdtF3Xa5+k
        0ViulSBdmjbRrzDTwpxeRWEWcg==
X-Google-Smtp-Source: ABdhPJyb4be2bRHCUASGhOYcF9QNbDlJuZvsy9N/XCm+mUih0S3RcBA88c3OyeoKleXaK17tAQDyYw==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr10607699edi.376.1618583874356;
        Fri, 16 Apr 2021 07:37:54 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:53 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 23/40] drm/ttm/ttm_bo: Fix incorrectly documented function 'ttm_bo_cleanup_refs'
Date:   Fri, 16 Apr 2021 15:37:08 +0100
Message-Id: <20210416143725.2769053-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_bo.c:293: warning: expecting prototype for function ttm_bo_cleanup_refs(). Prototype was for ttm_bo_cleanup_refs() instead

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cfd0b92923973..defec9487e1de 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -274,7 +274,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 }
 
 /**
- * function ttm_bo_cleanup_refs
+ * ttm_bo_cleanup_refs
  * If bo idle, remove from lru lists, and unref.
  * If not idle, block if possible.
  *
-- 
2.27.0

