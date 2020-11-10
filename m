Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C852E2ADFAE
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJTdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:33:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731775AbgKJTbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:36 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2919EC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:35 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id j7so6754058wrp.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5XOKsZA/efGGZlOKtpGd/v3CZQozhQA1lVakbps4Q9E=;
        b=He1zbyiMjWMGE0Hn/kJ/07B4HvpFF4l2fTCYTzQKm73uxkjgAjO49RrZRywLhDWfaH
         mwUj+LJz3HGK4QfSLcNaXCBytZS1llthv7u10eGTB373PipUwbEupelVcIq5Emg5XGDh
         Bcdhoy88TTDCPJeEjI9zrKilUdxFkSMMJtN7Pc9UPkc8pMoSvIPOi+Uoo7TKU96RG/FT
         2GAHytLMKR8eElYDMdfPYN5G7EMIy5w2B0a0ILkXtKkXEfgyzehz9JFZgpVbm9iCGsci
         Ov7rfylLaADoV7Jwk/GvUCXDXmaDoYOWHbOjRUzQqe1vqM5K679Kncl2/mopONbChafV
         qBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5XOKsZA/efGGZlOKtpGd/v3CZQozhQA1lVakbps4Q9E=;
        b=GtZ6L2wHFIPKMS2Hr44YKzKM2MKr6ebzhFZyKnfDuQzx1B/RbVN+4KrmIyPb9ofrL+
         0SI7L/dBQkJZLXBqLRFgmN7JFm5uIEyvEF6J6iyE8c/kHD9ppDUZ7Ij01NTGqbRlvDew
         SG3XZUwJV269uY5nYLIadbhAkOYHvk5R6nZw11OMNxJLiF6Eiie8cTdSFv1jirjY/tBR
         C7YNt6N+OyfxTCT3itlYOU1YxMFK07u/L9d3Ni8olSe2K9puONDsuYNmIfiTlJhRgmpt
         nT5o9dTw+kJik13LmpqmLqgXCoz6OwtOh2Acm4nuMSmKjkSdi1pU1Kya0WlzUZOvaA6d
         H8UA==
X-Gm-Message-State: AOAM533j/Yvg1YWG4Czqwi5+CgcyQfa/UUVp36eHvNgAQd0wRfADPtId
        c6d+nMIZgBQgq3JB3zykKeuCoA==
X-Google-Smtp-Source: ABdhPJxeAAo4Qn14VIx+iSnKxq73eLUxzVIPDWOXBuFMlEIUrORlJQbFdFaBUotDwNNiIK1H5ZjK6A==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr16338979wrw.89.1605036693922;
        Tue, 10 Nov 2020 11:31:33 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:33 -0800 (PST)
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
Subject: [PATCH 14/30] drm/radeon/evergreen_dma: Fix doc-rot of function parameter 'resv'
Date:   Tue, 10 Nov 2020 19:30:56 +0000
Message-Id: <20201110193112.988999-15-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/evergreen_dma.c:112: warning: Function parameter or member 'resv' not described in 'evergreen_copy_dma'
 drivers/gpu/drm/radeon/evergreen_dma.c:112: warning: Excess function parameter 'fence' description in 'evergreen_copy_dma'

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
 drivers/gpu/drm/radeon/evergreen_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_dma.c b/drivers/gpu/drm/radeon/evergreen_dma.c
index a46ee6c2099dd..767857d4a8c5c 100644
--- a/drivers/gpu/drm/radeon/evergreen_dma.c
+++ b/drivers/gpu/drm/radeon/evergreen_dma.c
@@ -98,7 +98,7 @@ void evergreen_dma_ring_ib_execute(struct radeon_device *rdev,
  * @src_offset: src GPU address
  * @dst_offset: dst GPU address
  * @num_gpu_pages: number of GPU pages to xfer
- * @fence: radeon fence object
+ * @resv: reservation object with embedded fence
  *
  * Copy GPU paging using the DMA engine (evergreen-cayman).
  * Used by the radeon ttm implementation to move pages if
-- 
2.25.1

