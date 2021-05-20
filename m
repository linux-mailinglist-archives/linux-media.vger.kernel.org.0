Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3AB38AEAE
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242617AbhETMoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237089AbhETMnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95568C056490
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:04 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a4so17423356wrr.2
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=erxm+Xcrd7+qygxkCLKKNU6rbI+w3lNDzPu8B/httcU=;
        b=OE1cmOeal6mPQ3zY2RJYNzLtzyM0CyRa/eBZHVQFbLPbo4XxFRKmFTfyjaRvKhOasA
         hsZjqbS+YYSXLp0jBQp9nvLozK2NuK4+EZXBYKlK/zb+ZI5ALEfDhcrouqo71EsiWyGl
         dpRYBbKFuPPVmDWnZFYucI6qPiXCOW2SI0++B+paB0abLzPN8pmtpqj9s8MZBLSLa1gF
         BOS1Y4mjTQipSdmTUML3II0zTQleLPhan2VJ4IaVPVI178JIN2NNaiQYqUFo4xEbJysy
         fCafIbHV0mLWXiEuaeESdDWjMqZIMKDL2IfpqSl0N6fhknVAhAmOTzgb1DAV0LKz/mT1
         XpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=erxm+Xcrd7+qygxkCLKKNU6rbI+w3lNDzPu8B/httcU=;
        b=iwIQY1dz4RSMKC+WVTYdDS0b7/p6pDCq0P2ZRCqyLJZfY6vdnwm9MMn1PLgnDlSZMv
         yI/8nVsiZP1XA9wM1fL4OUQ6adYGmH7w9PwZVN5/rKKebcRAt0vBrsWhLMR5jjmv+dYD
         YYqKWAnGEFhqyFW2y3o7B7t1daonxHXjiVl8ETULT5zaKx3C4fcGcib7XP7lyUlf7omf
         1IJrpSoU9oEUfF0Q3bipnTP/s0wrhDPOvV/79NXYynizUue/0hp0hAzqDaXZ6Degqjz5
         t0FCEq3967/7EjBJe2IX78aGoDxognT21BL25STenhO9mP+O7OT5XkIkh+f11jJrqy/e
         whyw==
X-Gm-Message-State: AOAM532ZWS3wXyqx8zcbj9q/3Yx2z/ipLdI+oNqH3DKY4ffYu1plKfk0
        XtbghiqDm2vOizlGdJdbtv7W+A==
X-Google-Smtp-Source: ABdhPJzC65qtzUVA+gIP2kmGgel53QLMcK/7hJnqDkaigOHVU54rfgzhY6XVPlH7o1hAbiiYYuUonw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4037179wrt.189.1621512183252;
        Thu, 20 May 2021 05:03:03 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:02 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/38] drm/amd/amdgpu/amdgpu_debugfs: Fix a couple of misnamed functions
Date:   Thu, 20 May 2021 13:02:21 +0100
Message-Id: <20210520120248.3464013-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1004: warning: expecting prototype for amdgpu_debugfs_regs_gfxoff_write(). Prototype was for amdgpu_debugfs_gfxoff_write() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1053: warning: expecting prototype for amdgpu_debugfs_regs_gfxoff_status(). Prototype was for amdgpu_debugfs_gfxoff_read() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index bcaf271b39bf5..a9bbb0034e1ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -990,7 +990,7 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file *f, char __user *buf,
 }
 
 /**
- * amdgpu_debugfs_regs_gfxoff_write - Enable/disable GFXOFF
+ * amdgpu_debugfs_gfxoff_write - Enable/disable GFXOFF
  *
  * @f: open file handle
  * @buf: User buffer to write data from
@@ -1041,7 +1041,7 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct file *f, const char __user *bu
 
 
 /**
- * amdgpu_debugfs_regs_gfxoff_status - read gfxoff status
+ * amdgpu_debugfs_gfxoff_read - read gfxoff status
  *
  * @f: open file handle
  * @buf: User buffer to store read data in
-- 
2.31.1

