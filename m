Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167F82A818A
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731146AbgKEOw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731202AbgKEOwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 09:52:38 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F82BC0613D4
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 06:52:38 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w14so2084225wrs.9
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aFGC0ytSE2C9dt0H5Lm6tpZnXpH56uqHjPZdDctt26w=;
        b=wfiAsdlt6epXo2Z0lyQ2vFG5VIANzrYi7k+Kj7DSPrq0Wlu7lE/C7PyBaDtKnFt5W3
         ss6q9w+fsheDQAj9Qg22QH+HM8yU1kpflALNQwljtfRtDwIlCCGravQG8EHFfj/kpG1Y
         FEzypD0aYD9XfDVxFcUTqvOQu5NR5igeobiejNnTe3Idb/HE8ochjkpI+47Yygo0GaRN
         7aeAWTVLBX8UdQbRzfNLEcs84NSw+tI8FIqPamYKU2xJ2J2QG9/PsJHOthgrZI8DXhnq
         eYE1IUn/Dky5zKBZjcjsHDXk7MpSiXTc/WeaJzAxEQ2MrL3ItGYCnlcRVglXawLV2AxM
         0ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFGC0ytSE2C9dt0H5Lm6tpZnXpH56uqHjPZdDctt26w=;
        b=FwuRmk0pIGt/i4IsMzYCkGGg6kv7sW8/wUUXVnu3RkrFJuRHXozyNCyNLSSGmrrVba
         6jCVJ1V9KkXPSDPF1b/3Q0efHUrSqw+dcdACO/nNERURULbqWOhjkkbyAjHZCBN/qYGB
         ghfHzVGe3Io3cTKA0DcxAch3C/QP8MufkgH4ZcQTp/wot8GxoujCA+3STNlOP5JTUlk3
         d5FmYjAzA1JUrRb6PAMLAYkOwpuMDbOyRaD9ly0xVeuexG4MeY5I4jzr2nY9iJK6oazC
         QnCZ6OJ5oLdjNdlUG/cxm4Euy9JywFjXnvUDK6GIJKym/4ceTfrh5wcjLILzyRKYCtMm
         MYPQ==
X-Gm-Message-State: AOAM5333TC3ZDjWbUsk9gP1Eke7y6pz08lvkm8hZD1RHwmAQZgrtrtjY
        wyxkua+F2ny8BqqgPt8D8zNEWQ==
X-Google-Smtp-Source: ABdhPJzXmfpypPEGh1sjthrWtYAHtbC+T4FEWZkqUKOyrF6tmldqGj0XtFoQ6I7iSmVwj8o3PG+jxg==
X-Received: by 2002:adf:9150:: with SMTP id j74mr3668000wrj.57.1604587956920;
        Thu, 05 Nov 2020 06:52:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:36 -0800 (PST)
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
Subject: [PATCH 18/19] gpu: drm: amd: amdgpu: amdgpu: Mark global variables as __maybe_unused
Date:   Thu,  5 Nov 2020 14:45:16 +0000
Message-Id: <20201105144517.1826692-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These 3 variables are used in *some* sourcefiles which include
amdgpu.h, but not *all*.  This leads to a flurry of build warnings.

Fixes the following W=1 kernel build warning(s):

 from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
 drivers/gpu/drm/amd/amdgpu/amdgpu.h:198:19: warning: ‘no_system_mem_limit’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/amdgpu.h:197:19: warning: ‘debug_evictions’ defined but not used [-Wunused-const-variable=]
 drivers/gpu/drm/amd/amdgpu/amdgpu.h:196:18: warning: ‘sched_policy’ defined but not used [-Wunused-const-variable=]

 NB: Repeats ~650 times - snipped for brevity.

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
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 183b09d71b64a..5939753080056 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -193,9 +193,9 @@ extern int sched_policy;
 extern bool debug_evictions;
 extern bool no_system_mem_limit;
 #else
-static const int sched_policy = KFD_SCHED_POLICY_HWS;
-static const bool debug_evictions; /* = false */
-static const bool no_system_mem_limit;
+static const int __maybe_unused sched_policy = KFD_SCHED_POLICY_HWS;
+static const bool __maybe_unused debug_evictions; /* = false */
+static const bool __maybe_unused no_system_mem_limit;
 #endif
 
 extern int amdgpu_tmz;
-- 
2.25.1

