Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320EF3622D6
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244616AbhDPOi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244702AbhDPOih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:37 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEFAC061348
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u21so42487354ejo.13
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0J5Bxl7vhdML2GM3ovQErwfTec12UCEbn+lGIO9lAc=;
        b=Y9TWecd7BKcNNCyqA8M5xkHBbkrb0RLig/181L5KKhITa6WQrpLWHcWzAOUIpBbztH
         mfRFZYAaWiwyACw5lHpXyoD70Ly9TRr4SOMk5VawhA49+MUL7RyTRAajxJcDKndra2eH
         V4RfFTTeH2LlPtlHCKTk2r9xYprOHtVxqcZAqTx3FazjAI/9jOiGACuJN1F1+rFv/U1u
         E8PDt+mxyQaPN12boKUE0/+Sz3/u7luoqbIKEhu5RM1PsrE3aj8Zc7W4n1wcjHpJ5+xZ
         2s7FZNTpszGtEwl1ty0W7VtlLhxWznOCaALkgQwHeA7SDpHoiMfZyMB0Cyhuer6c5ThR
         h2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0J5Bxl7vhdML2GM3ovQErwfTec12UCEbn+lGIO9lAc=;
        b=s1827KGEK07qw7s5S5igCtM4A9wiwfbZ1rMq1+uZdkLuru3Mzd+/2cxTAiBwolYh+K
         S5Ls1tepFjDO8qXhVJ8V/wMzoeIYCKJ0wjTa/IVDmCwZ6NEb+vtNUh2Hfcqzl9K7p78O
         uzASk6mH0QbSj5U8IyyJXHSShVjwBfbSEE1vaa8oR/zvslLXFZqoL0FoghasygskRST8
         DLTAYuUApdXE8VTLMZm1owFE4CIHLTcMIihURlxh4VVS8flws025EmTUOABm9uYGawZU
         yJT+QWq6T8y09A/LzgMNmZJn19N4lMTEVHj/sBierBMDa8pz4IOot1zXeXHI9DXLgt9w
         xt9Q==
X-Gm-Message-State: AOAM533nkEe0k4lkj1S1HgXpT8DS3Zi9X/cs/qmYBVP5F9EMaSlQaqvo
        Tx7TbFMxWIvs5zyys/dQmLh0qg==
X-Google-Smtp-Source: ABdhPJwQfIUje2tlYBZv8vPpUeMPQ8VZakZYwR5uwBK9VUsCi0n8gtjtebQD5JAd2uGQhYmRaUFAPA==
X-Received: by 2002:a17:906:4119:: with SMTP id j25mr8642477ejk.459.1618583887046;
        Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 35/40] drm/amd/amdgpu/amdgpu_cs: Repair some function naming disparity
Date:   Fri, 16 Apr 2021 15:37:20 +0100
Message-Id: <20210416143725.2769053-36-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:685: warning: expecting prototype for cs_parser_fini(). Prototype was for amdgpu_cs_parser_fini() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1502: warning: expecting prototype for amdgpu_cs_wait_all_fence(). Prototype was for amdgpu_cs_wait_all_fences() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1656: warning: expecting prototype for amdgpu_cs_find_bo_va(). Prototype was for amdgpu_cs_find_mapping() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index b5c7669980458..90136f9dedd65 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -672,7 +672,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 }
 
 /**
- * cs_parser_fini() - clean parser states
+ * amdgpu_cs_parser_fini() - clean parser states
  * @parser:	parser structure holding parsing context.
  * @error:	error number
  * @backoff:	indicator to backoff the reservation
@@ -1488,7 +1488,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * amdgpu_cs_wait_all_fence - wait on all fences to signal
+ * amdgpu_cs_wait_all_fences - wait on all fences to signal
  *
  * @adev: amdgpu device
  * @filp: file private
@@ -1639,7 +1639,7 @@ int amdgpu_cs_wait_fences_ioctl(struct drm_device *dev, void *data,
 }
 
 /**
- * amdgpu_cs_find_bo_va - find bo_va for VM address
+ * amdgpu_cs_find_mapping - find bo_va for VM address
  *
  * @parser: command submission parser context
  * @addr: VM address
-- 
2.27.0

