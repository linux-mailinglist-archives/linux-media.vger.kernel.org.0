Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31461644BB
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgBSM7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:59:15 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41710 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgBSM7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:59:14 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so397933wrw.8
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 04:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=b9sG/TVUs3caIZcWR+Lmy0efYoTEJOYELaU+bfIHgUY=;
        b=BczVt1wh4yOLL+NES9v6gwV+e7nrjQnzp32Q0cvAzrgUlq1BHY/jBVFW6YH1lHaOS4
         kQ4Zfz2ihORvysfmVySDXrPoeD4x72TIQ5ofaNGJvGnsARiGsDT5Ep7S7k6x/m+UyluQ
         JtJZoUC/XOaTKOTStZ3iLES8rlQnaN1n6hz3yndLdtw7Y/Dg5VctpGIXCgXHYLr2O9qX
         7R6SIUs5YLI2IUFbkL5W9j6F8JI4sU2abcPGHYfXb6aOSv1oWMUXnfnV1FMBMfX2dQEB
         voxDApdjW6RG+5Uun8xrj8YKTrAk/Wku5hesyzb2/UaA0QUJyGtXufvpRy/IVH18KpYK
         flmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b9sG/TVUs3caIZcWR+Lmy0efYoTEJOYELaU+bfIHgUY=;
        b=sk46W9M/twex/7nrHpHzx41i1MOIr0xYztXTkqmL5nMAgcnHCDBUlZI1urK4FXhhNc
         b8XBo8tzZSvAPBULIVns50X1xsVpT+gylWs8yyqGR5ZJvxiKP0HDnbqfAAWOziJeXn4p
         PwpWOgPEs+dgAazL6GJzwDIICtkuIwsRKXVVqQXdoh74kkyZskzjbauS/HHbMiuDdg55
         nfbx6Uhv/c8EIHZZaQmBRDfJqWdXiP6BOHKkdJ3LADQaOx4zrc3lkJGtvIv5fKNqzojD
         IflBoojm7694Daj7qSLGMWwOOV1XGXBPN2cU2dkye0P5PkM5ja9JpYY8tVX0761Tp4g8
         7fbA==
X-Gm-Message-State: APjAAAWTT3+cvHLG3hSvtfcrd3800FoHrCqdDsuJzZkyhbRJSOMDEa9d
        E6pYO2kMTyV9hUq97PE+xFI=
X-Google-Smtp-Source: APXvYqwom957kiBmODyKGlAOBy2ygX5dnAzUraiYqWa6AE5CXwi1ie+woKdaH2fubFeTbqA1kvR3+A==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr34937028wrm.89.1582117152687;
        Wed, 19 Feb 2020 04:59:12 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
        by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 04:59:12 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Subject: [PATCH 2/7] drm/ttm: remove the backing store if no placement is given
Date:   Wed, 19 Feb 2020 13:59:05 +0100
Message-Id: <20200219125910.89147-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pipeline removal of the BOs backing store when no placement is given
during validation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 151edfd8de77..6d1e91be9c78 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1196,6 +1196,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	uint32_t new_flags;
 
 	dma_resv_assert_held(bo->base.resv);
+
+	/*
+	 * Remove the backing store if no placement is given.
+	 */
+	if (!placement->num_placement && !placement->num_busy_placement) {
+		ret = ttm_bo_pipeline_gutting(bo);
+		if (ret)
+			return ret;
+
+		return ttm_tt_create(bo, false);
+	}
+
 	/*
 	 * Check whether we need to move buffer.
 	 */
-- 
2.17.1

