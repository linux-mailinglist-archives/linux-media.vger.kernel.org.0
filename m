Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8762B0D23
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgKLTAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgKLTAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:00:50 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B50C0613D1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:00:49 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k2so7182234wrx.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
        b=XQ8aimgR1HOHqJ2EoM1hF1fe6bOlASD4cH6EaZzEzLElHkGP0nIeMXYy3UmjbOO0QO
         lZtt2yakhfBPc/rnh+qCiNyTMP6Nfyk1sESI1z81+HRE88i1PC2XvmL13rioypDBsjtu
         L7MnFhT07OyuWQI7jeyGOclyWrH5+nWo6BK/XX8WeEjWw4CcxDQt6qG2M5Rkwh20ZbNM
         2s4s/JydD02pWOrDjpGemlFW7UEenR1SS9v5dcqwmLRGPempPP4HLsA0baBy5i1rV9on
         ccRf9OiI1ntTuy+b0QqUb1vxTPnSHhOetJ9FJ8UL1gpUWA9TyUkReWUooC2/a51aidOr
         TNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GWKMq1DqVP98QcoNoXmklvrAILj+KoFN9Nw2d/Tqn0c=;
        b=Hz2OR9V/aNuJV/cOr91Ei2ZV5vx/D7QPkJl8pla+hM/E6bx40QtYtEV4pD2sVSuV6Y
         uCwA0Ck1i/vLJ0PjkdXp8fqPYUM9miRXxHIOdq9hzTonM5g9xwMGQ7naeIEuXCmUESr2
         TfQa9Vkj2XXE6rWmbm8Y4aO7CQJl7XBCAUZ9N5npbye6WFCt96thLx9OltH/yuEqGqWI
         HDloH0e376UDS8s9TEwqD5yu6NYKMgOuscVF2WOrdYxcy6lg29gnwb3qH9MfsCtzU3z+
         YI8/nYj5cp5wgY5bBEluFBAjYCYFWHu5754+F6p39sdGtaz+BdD550aRcpN4CWIbY/4z
         KMVw==
X-Gm-Message-State: AOAM531Jq58RrnNsOpbawCNcDGVAl1ADd4pc3Zfy3/T7cvju46/NYp6s
        EQ+0kD9XZ4kQxbl4CqIDlJ2eCg==
X-Google-Smtp-Source: ABdhPJwhzsVgAVaWzBvQEaXjElZKyqFVzX5Lr8qYHX0wE6B0MmSg0w8DqfbbSAyHCSTeiO0rfz/J5A==
X-Received: by 2002:adf:e787:: with SMTP id n7mr1161747wrm.153.1605207647964;
        Thu, 12 Nov 2020 11:00:47 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:00:47 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/30] drm/v3d/v3d_gem: Provide descriptions for 'v3d_lookup_bos's params
Date:   Thu, 12 Nov 2020 19:00:12 +0000
Message-Id: <20201112190039.2785914-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/v3d/v3d_gem.c:292: warning: Function parameter or member 'bo_handles' not described in 'v3d_lookup_bos'
 drivers/gpu/drm/v3d/v3d_gem.c:292: warning: Function parameter or member 'bo_count' not described in 'v3d_lookup_bos'

Cc: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 182c586525eb8..4eb3542269725 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -275,6 +275,8 @@ v3d_lock_bo_reservations(struct v3d_job *job,
  * @dev: DRM device
  * @file_priv: DRM file for this fd
  * @job: V3D job being set up
+ * @bo_handles: GEM handles
+ * @bo_count: Number of GEM handles passed in
  *
  * The command validator needs to reference BOs by their index within
  * the submitted job's BO list.  This does the validation of the job's
-- 
2.25.1

