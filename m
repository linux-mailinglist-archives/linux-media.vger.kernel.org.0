Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CDA3622C7
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244581AbhDPOi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244306AbhDPOiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77762C06138F
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:51 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r12so42510709ejr.5
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXZ/aruuf/HDb1osSRlOCbptqW9LQNCh62l+8IzDShM=;
        b=nala5xvwW4MR5oUqd1Vd1iKc4vIyEJwpnl6RWKmmRlI6Autue0yAgs03YV3Gh8pRy4
         kQ4hQeBHdwy4OObwHv3Zc8vILSSbr7ywqZx40DdqQvNjkhibnACpJEeb081cQ7YBdTED
         QGWpeKx4AfyrhZBX0iCxe4a2kz6ZcrqZ8f/DWwUX9dvKHxa2apbWfWverpRtZpWGBZFv
         x5I5vVcbL3vY7l871W6ewNDm7yrxYYb3nJccs+QLYmiCHlER6RjIE+YWnO9pfXmZ5WKh
         c+3gNXB/0gw9wlMUuziI9QCqfgF776+08XI5QLAy5fkkeTpXCRf7kIU5dBUP4WWuWde5
         1jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXZ/aruuf/HDb1osSRlOCbptqW9LQNCh62l+8IzDShM=;
        b=qtTWxV3X51flXMXSv1cLSVCP7duxCmXL2I2nxwRVfVGU3CPT4MWQ62V9KW2CFCGFBM
         k8OMYoK3ORcGelWOpgVjcIFbwjQ3thlnbksjlBmPpEekVz7nqu2ke3F80JtETG/svmkR
         VaX7nzdVuSexTRfLOgHfus3Pd7tRPj23UY0RP1/s8HNlj18kTi+4j0e/IKgN63fqUfDi
         pT3FHZdhRnXqxm7EtIX3NlKBxu2ad7coTOm6d0gahP+m5BijFGjtfh+O8rwBBdaxikXr
         qKv5q9ahsIi/oxA+4NP0RdgWSTmejQDzczLFMJokmb0hQCWrHNRzfFtS1RdbUEt+Wg0O
         +4Yw==
X-Gm-Message-State: AOAM533WFMPYzN0F91eMTVeh3mtc08Sf7YutM8LJOJeE+vV5JMAnptRw
        kpFMhHLY8EUx3wRgQEeYdtEZhA==
X-Google-Smtp-Source: ABdhPJzMVYjB71yZ+la0ZUZ6dNZ79mUg8xL53xjArp5VNzBK2OTsFLdVpHquWHqf/cMoj1h10DZv2w==
X-Received: by 2002:a17:906:90d4:: with SMTP id v20mr8564697ejw.275.1618583870141;
        Fri, 16 Apr 2021 07:37:50 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:37:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <rob.clark@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/40] drm/omapdrm/omap_gem: Properly document omap_gem_dumb_map_offset()
Date:   Fri, 16 Apr 2021 15:37:04 +0100
Message-Id: <20210416143725.2769053-20-lee.jones@linaro.org>
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

 drivers/gpu/drm/omapdrm/omap_gem.c:619: warning: expecting prototype for omap_gem_dumb_map(). Prototype was for omap_gem_dumb_map_offset() instead

Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 38af6195d9593..27c71cded5d0a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -605,7 +605,7 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 
 /**
- * omap_gem_dumb_map	-	buffer mapping for dumb interface
+ * omap_gem_dumb_map_offset	-	buffer mapping for dumb interface
  * @file: our drm client file
  * @dev: drm device
  * @handle: GEM handle to the object (from dumb_create)
-- 
2.27.0

