Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7462AC6F7
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 22:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731385AbgKIVTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 16:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731358AbgKIVTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 16:19:32 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C342DC0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 13:19:31 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v5so956004wmh.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1sUvjuz6GhGo/eyfmlP/SOHCvkRA45s8OKsudAKYNE=;
        b=ONMp+BLP0pr8GPw4qGQ5ZafDFD+hKfVrwwI3l0QNlbUCStl/4v20Q2yKrVeUVieJ/1
         /EHEG++w11JWCuRkI6pVfbliwTpAMswOOxzKqHVOuq4dDrk74KHAaF458LgMN+/XKWAo
         SIcyz5tZ4bXs7cGR7YqPOFdKiJ0skIJ5jsFNhl7Ea5Q9szqmPq2TCH/UZxpjE3K9EV9h
         vp4QUfIDYNirEHinBWvHkQ7ZVv9RrznVs1023gtMY17oJIpvTUzdQtaJaPCJiVyVnn9g
         AX3v/5GkiAAnNlntob34lzgthtPjni35Do2nVDGWEYGZz7zDBJruQkiw8wHElCLheDdp
         LP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1sUvjuz6GhGo/eyfmlP/SOHCvkRA45s8OKsudAKYNE=;
        b=AqbQp5b4O+bDnJG/KetIyqyi3l50kxDr1BiGIFtNfGER7ftk5nP3Vr8PZJbtKeR75y
         si+dRI70uWUyJf1dfzcUgGP7ULkvJmrMThnWG06YfUhsqMKAElpag02609CZbi6ympCt
         sZ7q98ip8zdPtKgqfWwJVY47PXIDyaL70s93BHzThqB7FTghV3RVVTP/V6LIiC8cI6ps
         VDHv3PFqHHyRaBmZLVai+dXF/vWhTSVuiZO+UkxDc0xOIDoxpOegPvY/EB/5pnIHQJdJ
         QsGFY9XKH2tmwvxvCueVOLFOeb2g1VREK5BD3Tvay474whmImEcsOWF9us9D2EIBwTZl
         X8iw==
X-Gm-Message-State: AOAM53366RwKR2mAf9WkZEZ2Qsd0v/6Afi3PuUwez3beclEJNLFYLP6c
        e4sonZpiP/aVWxI02avvk273EH1hZiIv8O/j
X-Google-Smtp-Source: ABdhPJzHnjRnvLRbbyNs0pdXowVajS1XQ2JnHaXuKTaF/Vt1oT1OPIgR3k9xHsvdt2BWOG6GPb38iw==
X-Received: by 2002:a05:600c:2110:: with SMTP id u16mr1168189wml.4.1604956770543;
        Mon, 09 Nov 2020 13:19:30 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:19:29 -0800 (PST)
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
Subject: [PATCH 11/20] drm/radeon/r600: Strip out set but unused 'tmp' variables
Date:   Mon,  9 Nov 2020 21:18:46 +0000
Message-Id: <20201109211855.3340030-12-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/r600.c: In function ‘r600_pcie_gart_tlb_flush’:
 drivers/gpu/drm/radeon/r600.c:1083:7: warning: variable ‘tmp’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/radeon/r600.c: At top level:
 drivers/gpu/drm/radeon/r600.c: In function ‘r600_mmio_hdp_flush’:
 drivers/gpu/drm/radeon/r600.c:4393:7: warning: variable ‘tmp’ set but not used [-Wunused-but-set-variable]

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
 drivers/gpu/drm/radeon/r600.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index d9a33ca768f34..6e780b0109995 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -1080,7 +1080,6 @@ void r600_pcie_gart_tlb_flush(struct radeon_device *rdev)
 	if ((rdev->family >= CHIP_RV770) && (rdev->family <= CHIP_RV740) &&
 	    !(rdev->flags & RADEON_IS_AGP)) {
 		void __iomem *ptr = (void *)rdev->gart.ptr;
-		u32 tmp;
 
 		/* r7xx hw bug.  write to HDP_DEBUG1 followed by fb read
 		 * rather than write to HDP_REG_COHERENCY_FLUSH_CNTL
@@ -1088,7 +1087,7 @@ void r600_pcie_gart_tlb_flush(struct radeon_device *rdev)
 		 * method for them.
 		 */
 		WREG32(HDP_DEBUG1, 0);
-		tmp = readl((void __iomem *)ptr);
+		readl((void __iomem *)ptr);
 	} else
 		WREG32(R_005480_HDP_MEM_COHERENCY_FLUSH_CNTL, 0x1);
 
@@ -4390,10 +4389,9 @@ void r600_mmio_hdp_flush(struct radeon_device *rdev)
 	if ((rdev->family >= CHIP_RV770) && (rdev->family <= CHIP_RV740) &&
 	    rdev->vram_scratch.ptr && !(rdev->flags & RADEON_IS_AGP)) {
 		void __iomem *ptr = (void *)rdev->vram_scratch.ptr;
-		u32 tmp;
 
 		WREG32(HDP_DEBUG1, 0);
-		tmp = readl((void __iomem *)ptr);
+		readl((void __iomem *)ptr);
 	} else
 		WREG32(R_005480_HDP_MEM_COHERENCY_FLUSH_CNTL, 0x1);
 }
-- 
2.25.1

