Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E24D2C3108
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgKXToW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgKXToT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:19 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F532C061A4F
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:17 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id z7so7731211wrn.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
        b=OpNqFhKNSt+HIPPv/t65OGpW81kQdUziPNC7wzPn6N1uU+n91qp0/9HKjWKZYETyfc
         V5knlydZZ/sO9q6WaVzrlt4IywSYDcY1EnPjyk0ilr9JYGPi8KVLtsiBuUIfrHLDgmzY
         TJHVghNbiCNVrZHFz7pg29bfo13wGjJyfLfrf12gpLu9Btn+LKxA0hPsCakSHb8mbKWy
         9Mtn0PpQe3CoqS2o61k1dzAF0MtLjRTjXkBzQVOcc8PglXU2Pwe5U3/u/VKe8Hhgrl4o
         Rvgz7tuOCLl8Lxy+GkfzfSuyRwLmZ+Vrzw21iIvVkL2T6Cc5U2PqX73FisBNlz4iA5l8
         1o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
        b=k7z9vRk6NHfJH2LmO8bLGjS6Swcx8lq8yR5z3lwbszAl2/qmJPhoWLdlFgbx1VxVH8
         /P96zkKBQ4Om8YaUdriRrLrIOOgDGm+5Nc2nhvawvc2tZSZThyZ5JJzgHgh981VklB/2
         zM12cRZsHLLrQ6tTDAD9s5mnQ5zn10wUThBAY7Ppy3S1qc3c2p75+XGUoschy2bd/DWW
         FVl0Q2WPj7Z/OXtzQ0qBVta45YH8MT4bQEFTg+K71swvsxczGdYQw0f7rmDJUU2Vuttb
         H/QaI7i4rx6RZTjbOllXWo+lmygz4j8oMoYZV3hnVYrmOyiBWuXIa7KbogE3zKVQl0Ar
         GhSg==
X-Gm-Message-State: AOAM530+aFpK+rjUbRE4XpryAD0ip1Dg34SGHQzPbxt21ZqCvo3OA1KR
        jNP5SLCSuOsbELf3VbaSdu+w3A==
X-Google-Smtp-Source: ABdhPJwku9UPnqBk6ZnYV6+qVhkZ9W9TpjwXx4rfs7TBedVlnAzDXNW94dPSR58L2x2Eey/ASl1Ogg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr83754wrr.1.1606247056420;
        Tue, 24 Nov 2020 11:44:16 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:15 -0800 (PST)
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
Subject: [PATCH 14/40] drm/amd/amdgpu/gfx_v9_0: Make called-by-reference only function static
Date:   Tue, 24 Nov 2020 19:37:58 +0000
Message-Id: <20201124193824.1118741-15-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:2998:6: warning: no previous prototype for ‘gfx_v9_0_rlc_stop’ [-Wmissing-prototypes]

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
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 8a6c050cb6caf..eae81fc412556 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2995,7 +2995,7 @@ static void gfx_v9_0_init_pg(struct amdgpu_device *adev)
 	}
 }
 
-void gfx_v9_0_rlc_stop(struct amdgpu_device *adev)
+static void gfx_v9_0_rlc_stop(struct amdgpu_device *adev)
 {
 	WREG32_FIELD15(GC, 0, RLC_CNTL, RLC_ENABLE_F32, 0);
 	gfx_v9_0_enable_gui_idle_interrupt(adev, false);
-- 
2.25.1

