Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634662C3115
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgKXTpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgKXTog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:36 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5BFEC061A53
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:35 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i2so4502579wrs.4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eR2VWY/uBkZ8OQEHImWEeJT/rcGPCff8wPihf7Jld5M=;
        b=A1J4BPeeNT7yrkRrjaash/ObA12oqLXqva2RiCKNwn8pXH4B82hyrnDC1qOlAUehpo
         AdeJQMEynjujsKrEwnks4sBT37dmB/XAEt+e122O9CLyu93pqUl+AvuCanZAbhKsTBXr
         GudbMVWesoscbiJKMq7jlO/gjtgYXb1D5MaWGt6u0q8TMlv0poGqlRZ9+8wJ01IGRJib
         SiG4ihHTtFziZ72Q9xrA7c7d6XZWZVhthZ5Br7zuNU61Byxk38+icuwZHTLSenPdTwKp
         5GUPemDK4FAEPJMbT2fmdAgMTqijobz7+niz+E3Kcg6QW5AdLpye2o+AbBhjtl1sg+x5
         pl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eR2VWY/uBkZ8OQEHImWEeJT/rcGPCff8wPihf7Jld5M=;
        b=oL6suSkOIyCsF1QAigq6lwGk+vDPd/8/7yWqFmExECCWtFCRU4sYBFnsvYsvZCyolI
         eM70wuUMztMaB7dvlIyt+1J2zhzXPeAsxPTZX8BCjIrvKnnnn8Un9CXCMvjm2sj/GBED
         bDwNN7hgc+xGVRq6gYjgNTUj6Z6DZB+NG71AcsUT/yrgtqcqG3h1N8KnAJ6Mk+0/ynbP
         UlDZyTPit/CQfZAkdSEd0b5X1ZvpB79HFf9bAlPNDm1UWibwMYGqw9rvdgxTeDF37aeg
         w2Hh/sftvjE8WmZL74uoxZdDZODyqcjL7jrQ/N2q1rUe6rqkqQknRazMuLFZFQTdjJzW
         Fl+Q==
X-Gm-Message-State: AOAM533k50nMwsEdCBJBkAStGFNaKBiVjAoQYz0fUjZnYdpFcR3NcjJ3
        rLfC3Sbvyhf+YhaE29Uf6+VAlg==
X-Google-Smtp-Source: ABdhPJxlONImqsImoSyKBlbOvdessgEk2uRK+pugMfFusdmCcYTUJjt30D2TUP0G+2Gd5slDF0M9HQ==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr100154wrn.190.1606247074433;
        Tue, 24 Nov 2020 11:44:34 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:33 -0800 (PST)
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
Subject: [PATCH 28/40] drm/amd/amdgpu/gfx_v10_0: Make local function 'gfx_v10_0_rlc_stop()' static
Date:   Tue, 24 Nov 2020 19:38:12 +0000
Message-Id: <20201124193824.1118741-29-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:5008:6: warning: no previous prototype for ‘gfx_v10_0_rlc_stop’ [-Wmissing-prototypes]

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
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index d4760f4e269a1..9eb886ae5a35e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -5005,7 +5005,7 @@ static int gfx_v10_0_init_csb(struct amdgpu_device *adev)
 	return 0;
 }
 
-void gfx_v10_0_rlc_stop(struct amdgpu_device *adev)
+static void gfx_v10_0_rlc_stop(struct amdgpu_device *adev)
 {
 	u32 tmp = RREG32_SOC15(GC, 0, mmRLC_CNTL);
 
-- 
2.25.1

