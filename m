Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB7181A58
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgCKNwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:52:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35902 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbgCKNwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:52:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id g62so2235506wme.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BrBZ7BRIxlz8FrRAnyr/unjtGHr0zUbPTL3/EC4XXLw=;
        b=dS70QwaBALfXqGFh/hPS8VDcp5/7jII+D3MVVverNaHTK0+3xxLLx5wdKoel7HDXvH
         2arfrNFDrlq4xaO0fExSZFdqDXFqzM/swpL9Yh3vbc2a420rhI6Yf8H7uW/PYnHz0798
         Ub6jVwv4dTq8r3RDb5Z1Wu8tkx23tosGteiETYrR/esHHoiQouzpRG5TBWDMnZg4Xv0d
         JZ8lW2kXCthRwELDrGi5AdQyu8Cd3mvP682JoPMNBkIoX4wIy9WiC8H7psnVj99+7vgq
         1XQ5Oy2eNN+1260mvCQiVl9c8lRsZaa9vHb239GMQLVVtNFZOTD2lxsEDS2iijhG6Y1U
         4wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrBZ7BRIxlz8FrRAnyr/unjtGHr0zUbPTL3/EC4XXLw=;
        b=Wm+OO38E/Wku4lrFE7EretFRH90lF0nFG3zZJcYOJa9/5Mw6UcIccQlt9zW8k86rMg
         n1r8HV7ILzKyBwkWLvIS/T4m8upgBQw3XANeEtIzs8HHD0sqhiQNbTirmiL6I867FSte
         AnauTbB01SGMe7ta01A+VjbcoHA+tZNm7kZj4vgDSIigTmTnyi3YsDQpTUFM2pp+OPgj
         wVdm994UG1+z3M/LmjeId0BbLtnzpBT+rWttYyTtgZs4ErpHLLAsgVyOPkcBBHwEgrsY
         iAB8HxvwaG5szbawtJ0pZ4YxNoc0lj4x16YFrTXXWTrGZgSjQirpnb1bzlaqvbv3W8MO
         WWPw==
X-Gm-Message-State: ANhLgQ2EeIppu/zEhzNQ4FVlmHLNDnvXxGVszZqTHb+599JeA1EVm9th
        RJyIiIasFwos1s2NGuwuB74=
X-Google-Smtp-Source: ADFU+vsPAfdCms9K/oMpKj27gQSzAvyZZSi4wAa/XqnIbxORrNV6RGa/WoMb+HcXHpWWm6Gw162qsA==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr3752519wma.108.1583934725433;
        Wed, 11 Mar 2020 06:52:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
        by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 06:52:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Date:   Wed, 11 Mar 2020 14:51:56 +0100
Message-Id: <20200311135158.3310-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check if we can do peer2peer on the PCIe bus.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index aef12ee2f1e3..bbf67800c8a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -38,6 +38,7 @@
 #include <drm/amdgpu_drm.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence-array.h>
+#include <linux/pci-p2pdma.h>
 
 /**
  * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
@@ -179,6 +180,9 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	int r;
 
+	if (pci_p2pdma_distance_many(adev->pdev, &attach->dev, 1, true) < 0)
+		attach->peer2peer = false;
+
 	if (attach->dev->driver == adev->dev->driver)
 		return 0;
 
-- 
2.17.1

