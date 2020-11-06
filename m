Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A547A2A9F82
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 22:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgKFVux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 16:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbgKFVuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 16:50:06 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B495EC0613D2
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 13:50:04 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p19so1779612wmg.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=socaU7um35iwEdYbuZIG6DpwnbxHw+sI5ykPEkbUzts=;
        b=u2YdzXP+cI8hNzxPMwK6P2NcmDOFEzfBJQ1EpULD/0QTAzDAFswU3D9HeqnrXDaHgs
         Oy1MEtKUiI0ihnz/ecIt2Zgh/i8gi71GIO72wLjJAI/LL7YwzoMcf0+q+tmjnKo6QcuJ
         +Pey6urIMQgILLkxbg12Gxzk65TaqpK+n5BAvblzKUfHnkTnovij7Oz3MZsQst54SD4J
         nN9l+QaZBIpPJG2iHMDHMANkmJHJXM/PXJq3dYk1iUFhneAtRGIYLAUkr2iWoOZDT5V0
         /pv6XxQ+ZFkcmR/MEtxE2C/os+HjFieodE3x8YaO2IXZw4PxzJnvCd0D5EwooPWjpxl5
         FXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=socaU7um35iwEdYbuZIG6DpwnbxHw+sI5ykPEkbUzts=;
        b=FCK6G2LGdK3fTe5dk71fDEyqwl2lu7RejHEV8CMMK4iMOi1Gp8tENPuUlc9l9StZV+
         H4OGnjWH8RhDaSIZGaY7SKM9rvobwBwRgFNgPHxfBG67eUTS3aH5lCKFdtLAAFQR1oDe
         6wkxdQb+dOM7l9Woa39jSvdJJWMVOMLooP7ie/Qds1iFcja2ifLfQT9CXxvCOfuLCYmh
         3ZLH9/+n9YC/naU6vU0RLUsKB8sSDTWDRfHI5EdC79e9Oj+WY9SGlJKFnLhpIUrwyyAX
         WNn4YRPX7yOs3Kit3OpuoQEgtjAWk45KjFvTV2ddHSyWDrGI04a2nC4LCFfQUxoQOc1X
         VOSA==
X-Gm-Message-State: AOAM532O0Is48VVjYoBEwTOIRgTODjn4Z34EdhcyvLlTOdEEOwNYg6sV
        w1VPGVVpWGhd0v0PzXMjdvq7Gg==
X-Google-Smtp-Source: ABdhPJxf2Mvms/vp2uquszu6id9VkQjR791be6+7w0PjmFHlbmzZeAI2kpvTw7QIRDdYtY7cmrQZ9w==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr1644995wml.98.1604699403507;
        Fri, 06 Nov 2020 13:50:03 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:50:02 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <rob.clark@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/19] drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
Date:   Fri,  6 Nov 2020 21:49:38 +0000
Message-Id: <20201106214949.2042120-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/omapdrm/omap_gem.c:593: warning: Function parameter or member 'file' not described in 'omap_gem_dumb_create'
 drivers/gpu/drm/omapdrm/omap_gem.c:593: warning: Excess function parameter 'drm_file' description in 'omap_gem_dumb_create'
 drivers/gpu/drm/omapdrm/omap_gem.c:619: warning: Function parameter or member 'offset' not described in 'omap_gem_dumb_map_offset'

Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
 drivers/gpu/drm/omapdrm/omap_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index d8e09792793ab..0e5adfaae6455 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -580,7 +580,7 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
 
 /**
  * omap_gem_dumb_create	-	create a dumb buffer
- * @drm_file: our client file
+ * @file: our client file
  * @dev: our device
  * @args: the requested arguments copied from userspace
  *
@@ -610,6 +610,7 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
  * @file: our drm client file
  * @dev: drm device
  * @handle: GEM handle to the object (from dumb_create)
+ * @offset: memory map offset placeholder
  *
  * Do the necessary setup to allow the mapping of the frame buffer
  * into user memory. We don't have to do much here at the moment.
-- 
2.25.1

