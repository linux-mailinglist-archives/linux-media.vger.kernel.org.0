Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08203622CA
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244660AbhDPOig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244497AbhDPOiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:22 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907D8C06138E
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m3so32537109edv.5
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9TISBbCiRhBu677uKtWLY+O2n+9ENYFzE4E3l/7xu74=;
        b=WPFZRx2AOSEV7kKeL23SmikYGo6CGMuOXLlBxUeoNSKckHHvsWnzqy+JPsd3EzEUJn
         yy9JVK9GGo6jFgOv+QsgJukksMc8hJ3wnsoXPudyULwoeH0FV5yh6A2XrJYWmCi/AFh+
         GPCfWPJELgYoscWMFR7mdIppujI3OPj/XfbHtjhYZbPTtc8nlRgMEemRcijC76Q3GgDE
         LI+lqrTQ/RJHwQrsDFje7aHIH2nGuJL0YhAuhKQqDzB/EqhBqtBX5+SJ5gW+lD9WGey2
         RRyvf8tj+kggo9Y0DuIuB1LuDNaN4AF/yQKght+XeqMA/2ZhfsR88UWku5OG0QzaTfTt
         q0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9TISBbCiRhBu677uKtWLY+O2n+9ENYFzE4E3l/7xu74=;
        b=TVHZWMMFVZTidfG278alTj/PCj4O0Sc/Ypbe0NhvAOuYSmCPIM7XOQM+5srv6xHlrU
         aIJIadZPCrsWBI0vchIDc1YJFV0G+jhdeS/Ok/DfErwvlcGDxf3b2khlFcBAB/SzL3rF
         epkRDk1l1TChXTdAo1IiWY7829/eRCtKTdGhbri7bACP1zClEab2jdjNwSPq38WB6rAs
         ZQ0gOAgh5k9KYwTX8UoPW3517/qhJP0bJUKvDxpATQ/Z011DDJWvfVNxZ9WpYBqR8pzx
         JAPFBLDpHqD4RhEaRAVqRq9BbWkqRyZA5fDcsmUCY3/XDYIdPkTyZ5rsq4fH4Oeq9hFi
         Jtpg==
X-Gm-Message-State: AOAM532rWJilpGpsDOvUHKfDuQC3S6njpiNeAeFr61VY7Mb8LQlLL7pa
        bKTbp5nxxpVz7czV5qBWwfxgkQ==
X-Google-Smtp-Source: ABdhPJwaBHWHa3mmVDMl+qoKDnlJQf+hamKu6uJRFFXIt3+UT2zjv3ODxR5KwRlyUDvLklFhP3fIkw==
X-Received: by 2002:aa7:d587:: with SMTP id r7mr9354550edq.388.1618583875381;
        Fri, 16 Apr 2021 07:37:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 24/40] drm/scheduler/sched_entity: Fix some function name disparity
Date:   Fri, 16 Apr 2021 15:37:09 +0100
Message-Id: <20210416143725.2769053-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/scheduler/sched_entity.c:204: warning: expecting prototype for drm_sched_entity_kill_jobs(). Prototype was for drm_sched_entity_kill_jobs_cb() instead
 drivers/gpu/drm/scheduler/sched_entity.c:262: warning: expecting prototype for drm_sched_entity_cleanup(). Prototype was for drm_sched_entity_fini() instead
 drivers/gpu/drm/scheduler/sched_entity.c:305: warning: expecting prototype for drm_sched_entity_fini(). Prototype was for drm_sched_entity_destroy() instead

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f0790e9471d1a..0249c74501888 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -192,7 +192,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 EXPORT_SYMBOL(drm_sched_entity_flush);
 
 /**
- * drm_sched_entity_kill_jobs - helper for drm_sched_entity_kill_jobs
+ * drm_sched_entity_kill_jobs_cb - helper for drm_sched_entity_kill_jobs
  *
  * @f: signaled fence
  * @cb: our callback structure
@@ -250,7 +250,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 }
 
 /**
- * drm_sched_entity_cleanup - Destroy a context entity
+ * drm_sched_entity_fini - Destroy a context entity
  *
  * @entity: scheduler entity
  *
@@ -295,7 +295,7 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
 EXPORT_SYMBOL(drm_sched_entity_fini);
 
 /**
- * drm_sched_entity_fini - Destroy a context entity
+ * drm_sched_entity_destroy - Destroy a context entity
  *
  * @entity: scheduler entity
  *
-- 
2.27.0

