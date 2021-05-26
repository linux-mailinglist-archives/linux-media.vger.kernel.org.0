Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F32C3912CD
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 10:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhEZItb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 04:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbhEZItX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 04:49:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94EEC06138F
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:47:51 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n5-20020a1c72050000b0290192e1f9a7e1so31885wmc.2
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJer5W/toWhPsUhogBXg4zIXSRSHg7fRSySLo0mmvxU=;
        b=c4kUnaRXN1uSNT9CNqKjLxGgwMYV5KPLAkWSyqK5DOgFijFCdPEer5ag+RhVskDw8W
         xD5Wm1G3uhkJQFCh9CEozH8HaqWRsKb3lQa6A8QKchsv4XF45F0g4L4kIRz9YnJzeM6J
         R9O4BkOK8yTJg2L9Eh3RQJB2LisUZWeHoD0TKD7j6TAOWauUevORNcMzXlaLCANb+nWS
         vhmPGu+ZC+SIosHydMuuyePzdK5IqegCQydfd8NglfJf/fOqcywr3kvB2QvDWBTF3LPY
         XXV0kLgr0qrY8mZm+YmZwRmFB/vZoQRUvj0bOzwp3/0UAd60jYd5IU8l8stUaFHUn7kj
         YJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJer5W/toWhPsUhogBXg4zIXSRSHg7fRSySLo0mmvxU=;
        b=OX5Kzis29ni4eoOMFqVxDjGwqFEyOc2T4wYn731vE6tL8cnH5MiBolfnurp7RaoMiT
         J10feK19kp1oelaeZ1UvRCuYLShmCwxrDRThcHSvQnPaTWG10kBBRu/Z+RtRmNc+M16R
         S2lhnglAWwLLuun3hR+UJszVkLUq4pqYlcp9bsMt67E+vbAqOxxPRYMH9MDbjkPR/+Zs
         mzQxWoOsuqml9LrAC5XnjOuJf8ix+bkRDmGy0//CC9dpNALbzpJzA/IBK7TbW3+Is6Ik
         I1rdmCl/tFmXlJ+GSOUhsBPSqGdQj8LNPBdwg+hxIaJMiDd/z8uXN1qhRwFm9CNP6xPF
         EmGg==
X-Gm-Message-State: AOAM530KXU2Ll1WFs1ksvjPtN5HhjacvdR2sJNK1o8l4MsELHggOMuTB
        qoF4sQ48Rc5yJ3BxcnfjhtbEMw==
X-Google-Smtp-Source: ABdhPJwHBmPkTr0OwYKxXZYQj65BdllZ8Ja6Z0GE6xo0CnlLEphmyzg+9I2oJbQU8XCK/MwCALnPqg==
X-Received: by 2002:a1c:e284:: with SMTP id z126mr1717895wmg.108.1622018870506;
        Wed, 26 May 2021 01:47:50 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:47:50 -0700 (PDT)
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
Subject: [PATCH 19/34] drm/amd/amdgpu/amdgpu_device: Make local function static
Date:   Wed, 26 May 2021 09:47:11 +0100
Message-Id: <20210526084726.552052-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4624:6: warning: no previous prototype for ‘amdgpu_device_recheck_guilty_jobs’ [-Wmissing-prototypes]

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4a040f89ca5aa..f15e180762d2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4692,7 +4692,7 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
 	return 0;
 }
 
-void amdgpu_device_recheck_guilty_jobs(
+static void amdgpu_device_recheck_guilty_jobs(
 	struct amdgpu_device *adev, struct list_head *device_list_handle,
 	struct amdgpu_reset_context *reset_context)
 {
-- 
2.31.1

