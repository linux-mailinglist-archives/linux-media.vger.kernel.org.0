Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D91161683
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgBQPpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:45:17 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36604 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgBQPpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:45:17 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so18969777wma.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0lgm553hPYQaEJTHB0pb7QyRdRPovA2HobQYck8682M=;
        b=Y22XVDohmOnl5FXMZcCupBmCBI122LiSYuXqxGmQeNvaUMRZpnGIB7yZKfO9/LzEXE
         P1HqSSGAXbCY5QHt91RFhrL6bihgjvlakYrIemt5iODVd9bT0TldOfcmQk4GijRSv443
         ujQsvwuAzL1T2TRh8NWSgFwqbJKdiPj1yQZJf5CtU4frYO3w3IgNXzRtZSB9kdMGu3z1
         /RbclQw1ARvC6+YC06Fq3PXPu5tUROT+6QewkZJ/4jc0c6lGsLEHHqeXqfHZbshef4VU
         smV+8wz3cJ3Crw6bPGBgA5gRRcIK1fKRlXY08bt35mPKkhlNvKMjtH4ymXfiVqFaf8K4
         +vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0lgm553hPYQaEJTHB0pb7QyRdRPovA2HobQYck8682M=;
        b=BLjJFOJupYqvqUkfe2k56odmzdlYpUQrLjh/jMTfRLCWcM+MmYe1UFN56Q+d+bwfPW
         y/Fo4GtMfBKM77CUbQqbqmkcCAVe9kB1aYHwWzNHD/bEcdbs33i4XILZjHTV2XszYeOl
         DsTV+7qAZUuxaYbWJGjSepQFj8bKv0d3Hd9UoK7gqDYwCjsf27rUsnnHX2rk0/3A6cpS
         7YEWlVescgQxGLpsEqV+mq7Ea/xfdw/AupP4Hl+S5h3eH3GkYLLX+M+/mm8WMLYQtoKR
         MtctIwtWEgcfMNT1GjJ7RI8/tfHsFdttMAYlp+JW9XWkislfL2oUosU/z6djc9RHOnWN
         tR/A==
X-Gm-Message-State: APjAAAUzGNHTshB8qOKoFMSDZr4Av8NWoNoL8fQnh3xc+Hk6sQHuxAyi
        snWJxOIfH3whVu1uU2PwSxE=
X-Google-Smtp-Source: APXvYqx4l6rbr7zg8+Q0aB2D7gM+bBaUt6brScjkVXjxlESt7DIT1gRqivO7ISJOtqu8ZVJTqwPZgA==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr22586539wmj.59.1581954315652;
        Mon, 17 Feb 2020 07:45:15 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:180d:d2d6:6ff9:a6cb])
        by smtp.gmail.com with ESMTPSA id r6sm1372658wrq.92.2020.02.17.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:45:15 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 3/5] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date:   Mon, 17 Feb 2020 16:45:07 +0100
Message-Id: <20200217154509.2265-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217154509.2265-1-christian.koenig@amd.com>
References: <20200217154509.2265-1-christian.koenig@amd.com>
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
index 80ba6dfc54e2..d938d458e22d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -28,6 +28,7 @@
 #include <linux/file.h>
 #include <linux/pagemap.h>
 #include <linux/sync_file.h>
+#include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_syncobj.h>
@@ -417,7 +418,9 @@ static int amdgpu_cs_bo_validate(struct amdgpu_cs_parser *p,
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

