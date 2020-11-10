Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCA22ADF9F
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731968AbgKJTdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731810AbgKJTbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:38 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9960C0613D1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:37 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so4310293wmd.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+NA4KRLjKd0GRAbHJkCDNT0uCDdmE3g7EFp7CscWp0=;
        b=FsrKOA7++uCL4W3W0ttuyWVPqj3ihLBcI8pDZK10eyMbh5zUSeR/ifrfFkDq46rbJj
         lkIyU0y+cbkMa3eHjnE6JJUOqs+kGLYrr9Hm5jdIqgK5fDbBYb/r6EcU76Xu36UGgfGh
         6bXgjpOoJwEtttmmwz49YImkEslqTJqNxKj3UnGB9LraE1OWO/YUqo9vcg5A/KE42NXv
         Jx8ySu3mhi6eia/XzoH17mq2pfFdw/V2lkDTNH7gwUAjC89+oyOXL2CDNxE9YpGVyyDr
         yYSlAfRUP1C8PsqtJcu9QkEGFSJVLnaQ05Y3wfHCdd+HO61cXxE15+XtLUTAUhlzzJZW
         49SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+NA4KRLjKd0GRAbHJkCDNT0uCDdmE3g7EFp7CscWp0=;
        b=m2HWYduu3yqIX/Wyi/qO8goTSFNiqAD81fVIyR2Zk6IhF2CLtB88xfpwa4HM+9eXoY
         UnclnIi1K8jV9guxeYf+TLgPnHSWF+IvmVrnL1faWJEhGCZ37qU/Hh/vDU0xoSg5tjWn
         pkuDTu2nuRmN4nT/m7kTKB1FP3W+jZ6TmmXGpJNCjtVQrB7gBfnGI9/LchYiKdiLZW2Z
         rO6Qpt2fwxn4ZZVzAnbyeznOHfnngBLXjlZBZmoOn52/jtohlzm3nlXdjSmOyGFLoj05
         PFNzEa9H+IAzV5o10aQ27hUiDHIi02IRaUsNYsCN3EdD9t3J0gFSEsbvGUFsTlBtcZnA
         cClg==
X-Gm-Message-State: AOAM530LaYTX7EpTudWBZ/vbbyPV2ZA+j7UGsLGH1OE2vN9YfIIDuT3U
        F75JEngICRaCWLc2+/Zuq4Gvjg==
X-Google-Smtp-Source: ABdhPJyKq4mKCH/nqgkvIQYhpyL12zgD5LtXKaBkPg4GIUYYBIk9BwqQzypaSJMbpeQi+7UpQmEv3g==
X-Received: by 2002:a05:600c:21cc:: with SMTP id x12mr761167wmj.8.1605036696563;
        Tue, 10 Nov 2020 11:31:36 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:35 -0800 (PST)
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
Subject: [PATCH 16/30] drm/radeon/r100: Fix some kernel-doc formatting, misnaming and missing issues
Date:   Tue, 10 Nov 2020 19:30:58 +0000
Message-Id: <20201110193112.988999-17-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/r100.c:163: warning: Function parameter or member 'async' not described in 'r100_page_flip'
 drivers/gpu/drm/radeon/r100.c:848: warning: Function parameter or member 'rdev' not described in 'r100_ring_hdp_flush'
 drivers/gpu/drm/radeon/r100.c:848: warning: Function parameter or member 'ring' not described in 'r100_ring_hdp_flush'
 drivers/gpu/drm/radeon/r100.c:1425: warning: Function parameter or member 'p' not described in 'r100_cs_packet_parse_vline'
 drivers/gpu/drm/radeon/r100.c:1425: warning: Excess function parameter 'parser' description in 'r100_cs_packet_parse_vline'

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
 drivers/gpu/drm/radeon/r100.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 24c8db673931a..92075dedf2cb2 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -153,6 +153,7 @@ void r100_wait_for_vblank(struct radeon_device *rdev, int crtc)
  * @rdev: radeon_device pointer
  * @crtc_id: crtc to cleanup pageflip on
  * @crtc_base: new address of the crtc (GPU MC address)
+ * @async: unused
  *
  * Does the actual pageflip (r1xx-r4xx).
  * During vblank we take the crtc lock and wait for the update_pending
@@ -841,8 +842,8 @@ u32 r100_get_vblank_counter(struct radeon_device *rdev, int crtc)
 
 /**
  * r100_ring_hdp_flush - flush Host Data Path via the ring buffer
- * rdev: radeon device structure
- * ring: ring buffer struct for emitting packets
+ * @rdev: radeon device structure
+ * @ring: ring buffer struct for emitting packets
  */
 static void r100_ring_hdp_flush(struct radeon_device *rdev, struct radeon_ring *ring)
 {
@@ -1409,7 +1410,7 @@ int r100_cs_parse_packet0(struct radeon_cs_parser *p,
 
 /**
  * r100_cs_packet_next_vline() - parse userspace VLINE packet
- * @parser:		parser structure holding parsing context.
+ * @p:		parser structure holding parsing context.
  *
  * Userspace sends a special sequence for VLINE waits.
  * PACKET0 - VLINE_START_END + value
-- 
2.25.1

