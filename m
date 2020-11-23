Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED292C03FF
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgKWLT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728785AbgKWLT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:19:27 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1642AC061A4E
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:27 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d142so17513135wmd.4
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbI9YC4DXS8pP98pclydp8H5GArZ+B3FbUQc6S4IogU=;
        b=TgHaHacyuHyhuNT4t9k91sNsSIpxd1Xx/c4tP8EIQStq0UwNaFNTtzx1inmxtzd/z+
         hTIUk4QzPFZlQbN3JeRLYKzRVM5heFaIzctXY2wjwiJa75NUFDBbhz1kBpe+fkigDbqR
         +IYvmWC8XLoidiZJ9y0u7Id3jLiYI3c4OEm2Cp4JCnG46l7ptAU2mg4M2/q/bMY5Gweq
         N4vdC9Ke3ayBde0o6e+AOkdfsN28DA8WZnDsx+d5TpMNMR9uD8muxAiqbRl3vGK1KbMR
         dVqYtPckmZad/rzSqNT2T5r0Y7dp18r2rxnD6Lv+/8dR0Xg/iiHkNHoCoACfq47nfwwv
         giyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbI9YC4DXS8pP98pclydp8H5GArZ+B3FbUQc6S4IogU=;
        b=FlEJ7HpMPT1KWVAVH2wz4ETN3GnUUaMd7I1GXCx1e+yQ9oN6R3iv7xVykd9C9cLkwn
         AAgDYcLMvHJUZ3HdGDrNtQHLsRRTXTWHNYXLUKq5NHZ7LM/eK39ThCwayMlTPfJZ8ySM
         VztSt++X9beFSD4wv7b+HgUbe1x1KCblD+c4SU66hKX8XeMahIqkipT1YIdKGAD2552p
         dI9vRMYpk1bu4LJ0aymvRlIoV/T4OG+3jjVHVcHzf/kwAK4D0uorW8igX1loO7q1EaIO
         79prPxz3H88ihI9H9SLfyL5eJZ6CElbdHk15uQKnaHAVEHnUFISfwOUJL88NUdSgRraf
         PpsQ==
X-Gm-Message-State: AOAM533Kr40NqrVTXNqi3dMA9zmfj/E/0blR3oaZQvHC8wwZSCtK8VDL
        Ns4F58WUMcVoG+LUF7uPNn+IBw==
X-Google-Smtp-Source: ABdhPJwFYFQRxnQCZl5YpA7vvWLd+lmrE+Wk8kqNjr4QREmxfXWSgfeTDKTAIzecu4Uym4yvH8R31Q==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr23291836wmb.175.1606130365809;
        Mon, 23 Nov 2020 03:19:25 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:19:25 -0800 (PST)
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
Subject: [PATCH 02/40] drm/amd/amdgpu/amdgpu_ttm: Add description for 'page_flags'
Date:   Mon, 23 Nov 2020 11:18:41 +0000
Message-Id: <20201123111919.233376-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1214: warning: Function parameter or member 'page_flags' not described in 'amdgpu_ttm_tt_create'

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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5fcdd67e5a913..debbcef961dd5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1199,6 +1199,7 @@ static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
  * amdgpu_ttm_tt_create - Create a ttm_tt object for a given BO
  *
  * @bo: The buffer object to create a GTT ttm_tt object around
+ * @page_flags: Page flags to be added to the ttm_tt object
  *
  * Called by ttm_tt_create().
  */
-- 
2.25.1

