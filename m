Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3492A2B1C8E
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 14:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgKMNv4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 08:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgKMNuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:20 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36674C0617A7
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:20 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so9968227wrw.10
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a52ICVH+xE+6XFb27F1p5fPxl4mBgRlINo5mYgFGiGQ=;
        b=L05jL7z2ETjWI9KIsm7A5p4VGI9RsHiDec6sbmMFg65N8W/3J2fLj8Gize4e3TKmij
         HbeGEC+Jkb6BGQy9k6jMszJ5Q2Yv6A/poxxZ+HidxYyMzMaJkyj8FnFRzfP6acpRrLHs
         +lsvbVezKoAwn4Yc5OmFzXaVssxUlV/nlF/Lz9hJn2Ii2njVhZGF17dwmDo+jxrHzeGY
         sHe317SIWSifDtomdptySzHypaTbMJCwGEiP7Oork0h5OlGWH5SJS7aef0HgK+9xKWYX
         /JufKCuIU5fSvai1z4mdUsGZ+Yer6KWirS9w0tDtnpFWcMq0DvfiRETtkERwB6wqBr+L
         rW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a52ICVH+xE+6XFb27F1p5fPxl4mBgRlINo5mYgFGiGQ=;
        b=rwuoKpLujQwhQ+eo/QxEg9gvR+Pqya9uveZ8rfSv0v6m1NyXLs3G7EoS+fu+O7FBtm
         Mt0TBMK7sPHQp7p3J6G++r6r0Cp/LYeFyz4t1jNK+ZWT4ZyI/iXJ4uutvS9JLHb6IRc+
         L2+gK7WqhXKSVG8l21ZR2CSZjnR53fCR5gbU9vzNMsFhuMJg06UKrCQT6JNQDqeXYPxn
         hhHE94ENYwtjU5Q7eVtZuN5QhtXGHPiTalH9ubCob7+ZJQ4EVm+3oCFsZV6c6tnS+nVR
         0syg9DAz871OQ1+fsNDdREmmcA6pORXd1R/KBh0iJrLIyapnC8XT8K0EHUx+iv3j++ek
         HdmQ==
X-Gm-Message-State: AOAM530olWcliQlaKmyWjE/xDRUicQoX3hJr9M4nQ37pHq/E4WkVkCUG
        R34LE80IdrqIh9dESV0+9w3Flg==
X-Google-Smtp-Source: ABdhPJxoM/5L2V6PAjUnoUZECKaqTMYBE6srvcr6DjvjId68CnDWgP++QlPsk5O+bhjYDoqI3Gunvw==
X-Received: by 2002:adf:e983:: with SMTP id h3mr3474235wrm.382.1605275418913;
        Fri, 13 Nov 2020 05:50:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:18 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 30/40] drm/amd/amdgpu/amdgpu_vm_cpu: Fix 'amdgpu_vm_cpu_prepare()'s doc-rot
Date:   Fri, 13 Nov 2020 13:49:28 +0000
Message-Id: <20201113134938.4004947-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function parameter or member 'resv' not described in 'amdgpu_vm_cpu_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Function parameter or member 'sync_mode' not described in 'amdgpu_vm_cpu_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function parameter 'owner' description in 'amdgpu_vm_cpu_prepare'
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:50: warning: Excess function parameter 'exclusive' description in 'amdgpu_vm_cpu_prepare'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index 0786e7555554b..ac45d9c7a4e94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -38,8 +38,8 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo *table)
  * amdgpu_vm_cpu_prepare - prepare page table update with the CPU
  *
  * @p: see amdgpu_vm_update_params definition
- * @owner: owner we need to sync to
- * @exclusive: exclusive move fence we need to sync to
+ * @resv: reservation object with embedded fence
+ * @sync_mode: synchronization mode
  *
  * Returns:
  * Negativ errno, 0 for success.
-- 
2.25.1

