Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1C038AEAC
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241924AbhETMn6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241868AbhETMnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:43:16 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1320C05648F
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:03 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v12so17385666wrq.6
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 05:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fcdvP1BzIl3x+PleFuz79GqrL71ya8Oj0cjWTPEe9qs=;
        b=S64+RsMhtnMW++KWmgbEqE74s+1Eun93Cetk185djJxdf9FR/w3NO0qeRSBTZAUFYU
         FB6nzj6Sxtn5klIAr4ywcIjV7hv3BgISoh2zt+tMge1UCEgmN1vWhrZoNVQeEy45T/Ql
         +0K2ZcIGbt24yqiLKYYl/cHvWnxeUjIKKWK5rvgnebNYyxCZ3Yy818gN69SCWXS7YJuO
         f+zvHzX9xgejdrJxFd8Fhs/Ct4LMGjtnM/i0KYu+XTmU+Uc09GxP0K+z5Ls8wHScKk3V
         7Jau3cb2J+9G22D/R9+h2iplsHPh+OlUNFAPPRAcC0rEi+tnIbZdVbSbjIr+xSmlbwTs
         SdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fcdvP1BzIl3x+PleFuz79GqrL71ya8Oj0cjWTPEe9qs=;
        b=decFQhyBdTP94LOEPWVJvYndgfMgCyg3fTpMDqnnuBnlnwqKiBUZcGCETysjv9gzTK
         Lx0mUfZDSi0ZMkR9Z1Ck1+oyaTQRJXW5lZlBJNn3U/Cc3vErouve3PsrxyZRect4SSlt
         FOgijK+TYSHkeklBKHedckvkd7h4EO/iLqS3+R9C6e1x7sXzD3CNL4qustq1elNuO0A+
         uehsMz+DL3BYFJ8/bp5ze8xYQuVCr22fC+zpZORUkfxziX7IoBrPoIuPhSPW065uUs4d
         MB0tQ/ZYw+zlWt5B09xcUUtrtpTh8EaGdNBBMTWt9yEs09VUkKh1VzXbo2Q9j9JqDkVH
         c2rg==
X-Gm-Message-State: AOAM532jPGwUYCYve+c+DdMSFHRIjuAcwhg3d7qJ47qWE0NbAV5iu6TZ
        aHDw006OnysDh+AJWhhUYVctKg==
X-Google-Smtp-Source: ABdhPJznQ+PN/ydUmSuB50IaUzPB6eOj2r2H+nAw3Wmuu+wHu51V6mwHuNY30Mxg+Z5y6k3sluHD0g==
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr3828637wrx.59.1621512182229;
        Thu, 20 May 2021 05:03:02 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:01 -0700 (PDT)
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
Subject: [PATCH 10/38] drm/amd/amdgpu/amdgpu_ids: Correct some function name disparity
Date:   Thu, 20 May 2021 13:02:20 +0100
Message-Id: <20210520120248.3464013-11-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:200: warning: expecting prototype for amdgpu_vm_grab_idle(). Prototype was for amdgpu_vmid_grab_idle() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:272: warning: expecting prototype for amdgpu_vm_grab_reserved(). Prototype was for amdgpu_vmid_grab_reserved() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:337: warning: expecting prototype for amdgpu_vm_grab_used(). Prototype was for amdgpu_vmid_grab_used() instead
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:410: warning: expecting prototype for amdgpu_vm_grab_id(). Prototype was for amdgpu_vmid_grab() instead

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b4971e90b98cf..c7f3aae23c625 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -183,7 +183,7 @@ bool amdgpu_vmid_had_gpu_reset(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_vm_grab_idle - grab idle VMID
+ * amdgpu_vmid_grab_idle - grab idle VMID
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
@@ -256,7 +256,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 }
 
 /**
- * amdgpu_vm_grab_reserved - try to assign reserved VMID
+ * amdgpu_vmid_grab_reserved - try to assign reserved VMID
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
@@ -325,7 +325,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 }
 
 /**
- * amdgpu_vm_grab_used - try to reuse a VMID
+ * amdgpu_vmid_grab_used - try to reuse a VMID
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
@@ -397,7 +397,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 }
 
 /**
- * amdgpu_vm_grab_id - allocate the next free VMID
+ * amdgpu_vmid_grab - allocate the next free VMID
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
-- 
2.31.1

