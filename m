Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AD12ADFB2
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbgKJTdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731407AbgKJTbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:31 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67512C0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:30 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 33so14003432wrl.7
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BMGz1Go+pEr1OAoO/uoDpgq9jEcR7kKbucOo/rEyug8=;
        b=oRjNGtc4H3+Om+51bGN+MLhDkMLLGJE4P9jCjdCKIl0vqVd9TW09aAjP68FcKpOe2I
         HxP90vSfbxnkJJ6RPe4Tj3qiXJd0s1E3HHlMaNVtDLYm8exe5AfqiCeJdHm9SBer0vJB
         xiVK+DwOIDPZqybrvsBcqJX5B6ANJ5QEM/AoUnIM6pyX9FMbYDuPD/iimPCqRNUX8cbT
         g+4Q+wGcAOdelme77sLR3z8woRPdo1jM//1XQTuSZsGs9gBUcj3W2gVsKohL291vpX9n
         /U9CHZN1HdaoV34HMDyVChxZJ1uDh+aBWSnVp7RAyjuDyxsJFyD/ikfXkF1Q0Ld3gaNy
         PHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BMGz1Go+pEr1OAoO/uoDpgq9jEcR7kKbucOo/rEyug8=;
        b=HtBRJtGUKsOcj7qsnSxmUjqtGk8ucbM9Qn5Yf/se/WlzK/BreOU7uVmuscmO1zjPSE
         aBuoEDhW8VbAvgeDdIoJZ//srTSuiGv+ltwarbW2US9a8xstl9/Uwq0KMD/wj+unEMDP
         j1tMqyeMbNul74E2i9eHQGflUoKcwo+uMP54KGeB65Xm6OOjvex3MGrum7FglYr+P0+W
         PAOp/tgLl51lGMsBhLXtygSM25kSX+EPARlMMJcQl/h3pTWBlXKTpAr81iVrxAWoiUhJ
         eMYsHVVxpYqAKi03CaVGTcFK17yti+59eScjWdOxv7hPWkzTMokFdxJF1RE+FJt17kIl
         qPug==
X-Gm-Message-State: AOAM531mpaDooDcRpZPyC+9U/ZANeraKUTov3xnYXea0dHXksuA5EQKm
        k2vMYhBaCP5L+bEvM8XbeHhvbQ==
X-Google-Smtp-Source: ABdhPJy7fVlERZR/Ulkk2Dh9kfxZcd/f1xzr/nIa9kuZd3t2A5+rQcsAtINaBuuwQNGJ0fH7Ig2oQw==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr863570wru.112.1605036689143;
        Tue, 10 Nov 2020 11:31:29 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:28 -0800 (PST)
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
Subject: [PATCH 10/30] drm/radeon/radeon_sync: Add description for function param 'rdev'
Date:   Tue, 10 Nov 2020 19:30:52 +0000
Message-Id: <20201110193112.988999-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_sync.c:92: warning: Function parameter or member 'rdev' not described in 'radeon_sync_resv'

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
 drivers/gpu/drm/radeon/radeon_sync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 55cc77a73c7b7..5d3302945076b 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -79,6 +79,7 @@ void radeon_sync_fence(struct radeon_sync *sync,
 /**
  * radeon_sync_resv - use the semaphores to sync to a reservation object
  *
+ * @rdev: radeon_device pointer
  * @sync: sync object to add fences from reservation object to
  * @resv: reservation object with embedded fence
  * @shared: true if we should only sync to the exclusive fence
-- 
2.25.1

