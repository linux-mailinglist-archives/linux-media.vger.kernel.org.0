Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA13622CD
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 16:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244578AbhDPOio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 10:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244306AbhDPOi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 10:38:26 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AE1C061760
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id m3so32537507edv.5
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q9QkHlwJDar64oIul6Zxhmqo4CTxwCRZxxTfk+OGqes=;
        b=eY+BehDOCCwJrQBgJvFkrLf60qYGNjp86LQ95v4aL7ItluI4Kc1SOgueUMBeL7xVO0
         HabFWzx1pws/L5MRCFq5LUoT5qfUy3s5FD/uSxeZFuyHKY3170WEz1Csbb4fSPaBDIqN
         oRoIS2YwYhl3F0P/wmetAgGaxJNwr8QMpvE56Jxb1rGkseV0sHdrWs1gzTSOL2x1NJS0
         Vj80LYVwo8lXzAojSa+aNSIeTjnQWOA9oP0WJp53MrM0/1L47DLNnl/6xm51fQAC1llu
         FYuAOZoo41nr91MY3qLkcrnWrr3xBTW/WLIuUjkwS7wdSBtV0LoR2GWHCg5gPjz2JP4q
         OdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q9QkHlwJDar64oIul6Zxhmqo4CTxwCRZxxTfk+OGqes=;
        b=VG6JyFOaMtyVAKpKbTJ/Pb6crLZs60gSFEil5sKxxm2EJ0lVwNAyPg+BKOaGJWHU5d
         FgBWMAMzaegSzGbqezTiTTYyaR/dujsh6WLKKDzVRR2Hp3rAANI2pimAIPpa9zYeGJa5
         mkGsaS62cmdJfeiXbyYTbEhpI76e3QsQkTo3Q6DFtKnO7/PA1kJBbUcmaSAsxbKtKj9a
         qu3NaDr6PO4NwiBcMF5c65ffinMsJWHqXfMXFFIKdMaGG/mYt9xvHIF57ryt2qthDCgM
         8L8m3s14eoQbV8Wq8Bt28gJxWun7IogVzGccg7G90+cvHGvPqwwXWu2ODcPzeruIJbm4
         ChSA==
X-Gm-Message-State: AOAM5336VKY1IXkyosk9G87ONsaHORdWcl5Vrmg5w7CIzM5wQWJXOsTM
        hBtoWASgF6Yh/yfaEpABv3qX2Q==
X-Google-Smtp-Source: ABdhPJyfwppiWNh6UNq5J0oc3JQa61CxtXjxBSY55rvdOBADEXG3x0lLiRIZS3Wa6Jra3UH/lva7pA==
X-Received: by 2002:a05:6402:cb3:: with SMTP id cn19mr2427916edb.206.1618583880589;
        Fri, 16 Apr 2021 07:38:00 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 07:38:00 -0700 (PDT)
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
Subject: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description for 'sched_score'
Date:   Fri, 16 Apr 2021 15:37:14 +0100
Message-Id: <20210416143725.2769053-30-lee.jones@linaro.org>
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

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:444: warning: Function parameter or member 'sched_score' not described in 'amdgpu_fence_driver_init_ring'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 47ea468596184..30772608eac6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -434,6 +434,7 @@ int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
  *
  * @ring: ring to init the fence driver on
  * @num_hw_submission: number of entries on the hardware queue
+ * @sched_score: optional score atomic shared with other schedulers
  *
  * Init the fence driver for the requested ring (all asics).
  * Helper function for amdgpu_fence_driver_init().
-- 
2.27.0

