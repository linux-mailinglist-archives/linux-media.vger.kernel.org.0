Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510ED2C313D
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgKXTqo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgKXToT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:19 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B206DC061A52
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:18 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id u12so23612093wrt.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FuE5YjSJzJI/M1RwfuDXt/n7B1wD8+1e0nH8PA2AEy4=;
        b=Rx9agVcbDlYfV56teggpfSalWJve64s1Kw/hncpiAqgMm+aBS0xzV7FVdksDeDAxMS
         w4qNTgYOtKMbhHzSZf0GbZUvDGQvQDp7kD6qQ4rEemO/k6ZAeeqDYqcnwFXuBwf9PRr5
         cUIn/3NZs26RM98dauvvAMtXZUrwXq0gSo3HwoZgola+LlDzmPIMm7EiDgjUJnn+J27Z
         +GI/Dj19rZ2ok377NBLKf7l1ChRWRIXgaUF3pxHFnpYBAkqqgxxnjPXrwRvW5Nz8nQLN
         YB0Ulv7R5eN07q87F5Bq/AFjwOJGcspCsh6I8HM01549N+/oNeF4yHumttUL5Tzr2YqZ
         N7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FuE5YjSJzJI/M1RwfuDXt/n7B1wD8+1e0nH8PA2AEy4=;
        b=HU8YayQ8eIO7+9n8qRZuOQfy8zJIOvnFHHVGgVjzdkkqiH3vff3YjxhK22Xx7T6NbM
         mFNk9PT92lNSsHHgIH4pQ95hb7p0AkK3ir/1fcaNceJAmnK3Zcw1LscnOUCOdd3qZWRp
         L2z5rx8SrgJtWebYN5fRmZnlFo+Mq3kJFOE6HYzKhkcYygNpwXu+WXw6PeI3vXWpJtWD
         aNu/lpgZr6nM4+Z5dnkkBtz7VieObZVkwAA1d4SBVWn0mcb3SqKQ5HvOZ1M7f99uDRN0
         tNtFnLFFsFJIBiucIN2G1Hkj3oXscCZ9LrHzz1Cg4o8F4B4PeUVA1peCfQc228DNyyB6
         vXkA==
X-Gm-Message-State: AOAM5310J1o8JVHXhJkWfXHLW6uh37797m+aUS7ONTAHWoN127PUzVBK
        OQCBJ0zzGApWsCq7duigCMdNUw==
X-Google-Smtp-Source: ABdhPJwDCyWQlpk/Iszt8GAowASRp1u6blUya1UNc8Kau6+NzQpXYMjrYXwTnerj7k4huU/Yw4IQUA==
X-Received: by 2002:adf:bd86:: with SMTP id l6mr65170wrh.205.1606247057491;
        Tue, 24 Nov 2020 11:44:17 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:16 -0800 (PST)
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
Subject: [PATCH 15/40] drm/amd/amdgpu/gfx_v8_0: Functions must follow directly after their headers
Date:   Tue, 24 Nov 2020 19:37:59 +0000
Message-Id: <20201124193824.1118741-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c:3698: warning: Excess function parameter 'adev' description in 'DEFAULT_SH_MEM_BASES'

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
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 5e6d15f44560a..9a905531f8377 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -3687,6 +3687,7 @@ static void gfx_v8_0_setup_rb(struct amdgpu_device *adev)
 	mutex_unlock(&adev->grbm_idx_mutex);
 }
 
+#define DEFAULT_SH_MEM_BASES	(0x6000)
 /**
  * gfx_v8_0_init_compute_vmid - gart enable
  *
@@ -3695,7 +3696,6 @@ static void gfx_v8_0_setup_rb(struct amdgpu_device *adev)
  * Initialize compute vmid sh_mem registers
  *
  */
-#define DEFAULT_SH_MEM_BASES	(0x6000)
 static void gfx_v8_0_init_compute_vmid(struct amdgpu_device *adev)
 {
 	int i;
-- 
2.25.1

