Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31E4D2AC700
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731742AbgKIVTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731702AbgKIVTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:48 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B5FC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:48 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id w24so931007wmi.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Un/LDNkdtYgdVjwGu3XY0AMRqx0e4C7tEIbE9voLUM=;
        b=krtpRYJ7mJUGfshUvedarUQRk839XAsX1wT12dXjV+G7bjHLBn+k/FCaHDeBwJ6zmR
         3e2WA9H9T5WGYWerXvnIdIlBKuOUi0/peBoe60omFIGgRa00EwPLs3UpTyrq9TGFYRY7
         cPCF25r0zM+iPp/uYSwZ/iAS8Oc5OLnKgP9gC7Kqrv0Nuy/dOka94U9QSbg60Dg4UrQk
         yYsmArQ6NE0XriEBZ5U9RjF3P6yr4ypMPN8vNWQRKc4YEEzLtkrSwLbKERomuMHFbFak
         iEDHJjsS0XIqmRZ2lUxemTSkEl12uzmk3qkW+gSEX64gIFbXq56QLJTS2aVCjo4dXf8t
         TngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Un/LDNkdtYgdVjwGu3XY0AMRqx0e4C7tEIbE9voLUM=;
        b=RpEJpn1a+mazl+0MUTRcmdMkRdinZM7WSyknu2wKiaiimzM5w1mRqJFUV9eRC6I8Ye
         hF9jsSy8JAH08Gu5eBILKBQypjV9w01xTMUh029WE/rcg1o0brIuKlcJeVw5gWg16oQD
         xFfpNxPOtxuRGx2nyFRjNrBRMEOrTpGW6DOnuK4n1SrhCEJMmVcdDKH+bxMkYFJ5MVOx
         dt7b7FCxrhYCmpRy6gqvOyUob5bZ+CATHvq5O1j1I9zCmz8viIYcSI8MGfGlgkv4plWj
         /CUCKOk+f0Is7hl8cPoLIKtEyX8kfqEUbOmdwKRs0gV1ozqDGmUO9c7SrH0Rss6llCE+
         2uTw==
X-Gm-Message-State: AOAM532rnEspG9FgehQrgUZq0SUqNld2HFHLRgXCeukW0xV0bD3sUua/
        3kvyHFjv0CzwnxR+Pq4b/XExWA==
X-Google-Smtp-Source: ABdhPJzQT+thyPpVYvbchZtc1JXpMg/qh1aMOeBb/tJzI2/gm4KhjdaY+QRcLCwdSVRehiKW3tVUSw==
X-Received: by 2002:a05:600c:2048:: with SMTP id p8mr1123112wmg.165.1604956786842;
        Mon, 09 Nov 2020 13:19:46 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:46 -0800 (PST)
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
Subject: [PATCH 19/20] drm/radeon/r600: Fix a misnamed parameter description and a formatting issue
Date:   Mon,  9 Nov 2020 21:18:54 +0000
Message-Id: <20201109211855.3340030-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/r600.c:2965: warning: Function parameter or member 'resv' not described in 'r600_copy_cpdma'
 drivers/gpu/drm/radeon/r600.c:2965: warning: Excess function parameter 'fence' description in 'r600_copy_cpdma'
 drivers/gpu/drm/radeon/r600.c:4382: warning: Function parameter or member 'rdev' not described in 'r600_mmio_hdp_flush'

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
 drivers/gpu/drm/radeon/r600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index 9587792503525..0a085b85f559d 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -2952,7 +2952,7 @@ bool r600_semaphore_ring_emit(struct radeon_device *rdev,
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @num_gpu_pages: number of GPU pages to xfer
- * @fence: radeon fence object
+ * @resv: DMA reservation object to manage fences
  *
  * Copy GPU paging using the CP DMA engine (r6xx+).
  * Used by the radeon ttm implementation to move pages if
@@ -4371,7 +4371,7 @@ int r600_debugfs_mc_info_init(struct radeon_device *rdev)
 
 /**
  * r600_mmio_hdp_flush - flush Host Data Path cache via MMIO
- * rdev: radeon device structure
+ * @rdev: radeon device structure
  *
  * Some R6XX/R7XX don't seem to take into account HDP flushes performed
  * through the ring buffer. This leads to corruption in rendering, see
-- 
2.25.1

