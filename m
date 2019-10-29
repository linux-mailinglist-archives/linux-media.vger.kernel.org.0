Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E97AEE85E1
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 11:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfJ2Kk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 06:40:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53259 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfJ2Kk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 06:40:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id n7so1981557wmc.3
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2019 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JrtmnJD8rRoA4aU6RxbjoQ7ftgr4ATrOSLPRwD6iD7I=;
        b=IrsHzhrnBciJGRA3vcwXhL5uTgBSW7l03hLEhfoHyNB1ADGdSuQsA+09JtfHGuJIMC
         yfU2/CoIUdwdTIW1u2rPkTfQFzMi+sKJ9UgYF33GLmaB9VXUpdSZNhAEB8NprulFOfle
         QrxxZVwz6ww1gEr8NdiX4ABgltm6tICR+oEDz6gGBlclQZbjupE5LaCXDMxQ4dfmZQGC
         DV0U1oQjL3CzBZsG5p/n2t4xvzk9bYBiisOmp/g3ME/hKSNO1Q67wPbmn/wAVRWseZzV
         MuIfjSBMwBQzrojRad8AtQKeA/f45tqKyxvLveo7TtxVVN5uV++3hyBBwXZJ68eu+7vK
         TFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrtmnJD8rRoA4aU6RxbjoQ7ftgr4ATrOSLPRwD6iD7I=;
        b=Zr/qQ96Ml3tlT2S9smvqB4sT64w7PqZzDLTY6G31QpLz+8D6t8/c80XyRoSgo59v13
         y2exfID/OBR5OpIp/AXFsiCfZVR99DgyL3JU71nbYHAJW7B7mGb7kS0j1FMnCHgAMUHG
         xlKeEWf2TGGLwqfd4JGRbxP9pugw/fe3+Gwp3vJH+lERFvDlXXYiPfG67KzcZuJoHssV
         TpdnCkaDaRthO9GKIeguRjj6zfDdy4ww9GKJgt6H/QCcR/jsbmQEn5xGY4IJJchZgc+P
         NVA20dyqstAGsJsBMS1kg8OyGQoqOZaRuIaUxjgDVx7GCygJHtm57NXldLRGFvkGtqXy
         ROtg==
X-Gm-Message-State: APjAAAXfVjtzasg49niXkszUfEbo5aoHjK1YhvjJOdZ9baGx/FeQbu0Q
        RdCWjbB2W4+N/7yzyfhAWYw=
X-Google-Smtp-Source: APXvYqywd45SuZHc6tzGxan37IIvXllMU1fkjAN+J9Wuzvbw2vsvSsaL6CXVyAifdCs1CAlLtXsGfA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr3091142wmb.87.1572345654660;
        Tue, 29 Oct 2019 03:40:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5d9:7998:9ca6:452])
        by smtp.gmail.com with ESMTPSA id v10sm2910210wmg.48.2019.10.29.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 03:40:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date:   Tue, 29 Oct 2019 11:40:47 +0100
Message-Id: <20191029104049.9011-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029104049.9011-1-christian.koenig@amd.com>
References: <20191029104049.9011-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid that we ping/pong the buffers when we stop to pin DMA-buf
exports by using the allowed domains for exported buffers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 253158fc378f..0253e0889daf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -28,6 +28,7 @@
 #include <linux/file.h>
 #include <linux/pagemap.h>
 #include <linux/sync_file.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_syncobj.h>
@@ -414,7 +415,9 @@ static int amdgpu_cs_bo_validate(struct amdgpu_cs_parser *p,
 	/* Don't move this buffer if we have depleted our allowance
 	 * to move it. Don't move anything if the threshold is zero.
 	 */
-	if (p->bytes_moved < p->bytes_moved_threshold) {
+	if (p->bytes_moved < p->bytes_moved_threshold &&
+	    (!bo->tbo.base.dma_buf ||
+	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
 		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
 		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
 			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
-- 
2.17.1

