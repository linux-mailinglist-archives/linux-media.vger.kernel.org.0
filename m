Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 426EC41EA5F
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353401AbhJAKIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353441AbhJAKIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:10 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1E3C06177F
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v25so3996487wra.2
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
        b=UM9ChvMCzLT/g8BK9R+hJGTlCze07DoZNWDU6c6Ol7XK9CN8E7G/NDBOy68ZmnBWbL
         FdmoJfKtb08w1sd2JBTYvWIS/47VdayqpbgelyFBI8VQhyhsGjl/a6yquVUjPljiYqP4
         ixAz0EfAwK9ew0WXQzaGkhQ56HlqlR0NNEZr0drGUMyx622NRL5Wsmrh8OTAof2cY0tl
         fkvF4y2skFIQuVa4k7K6VSWsHJ+e7cRQ4FsFnBqPZsBrRBTuJrxEFskLK/q8yeyIs1Oe
         U+m+rJTYSf1ZI3mJIVd9Wn2lclW6D8aV9q8vdCy3YLgTzIRuqP1OuiR5+9lX36OceQid
         3bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
        b=xMyIQzxNaLtrzUTf6IYGVXMmZ74lHm6AIPC1Fvm5JON5y157HnvXn5Dq8VY8sQWdUU
         EVCnS7yKZn6oZ/11S6EwX/is/z+FtVxlFCKrA+I9N0NlrvdLOZX2edfbvoaNwd84j96/
         EMcKm03cxTFmRxHDGPNuR4IMIpkBGDBEXKZK867O2MtWo1c5r0GNU25UVoqTnidhYLrd
         Ql/4XUWVtJAUQNoo6sCWka3unaal5hlXlqpRN+LS0I02/SkbczsyLk+7o/SyMTfLLsPA
         +yvAtAQbmiYId6bbcjcTLFPfJX+I56lt4vQ/EqFXZeRguWe5yztZLslqDrjmZjit3zEd
         6+EQ==
X-Gm-Message-State: AOAM531PXikBYBJocE0efikzj4ttjhLRdMC8IHYbqHDR7KdQNdvuL/jw
        XawBWtNtmwQ+qtGwnIz0Q+A=
X-Google-Smtp-Source: ABdhPJyJUBOE+MiUZvzQD3ius4Snchh+gNRDbkZW1bywtXNIOwA7EWH6bn+BYDWERd9AhoOYOXe1TQ==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr11577197wri.150.1633082784866;
        Fri, 01 Oct 2021 03:06:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:24 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/28] drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
Date:   Fri,  1 Oct 2021 12:05:55 +0200
Message-Id: <20211001100610.2899-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to actually allocate an array of fences here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 6b15cad78de9..e42dd79ed6f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2090,30 +2090,14 @@ static void amdgpu_vm_free_mapping(struct amdgpu_device *adev,
 static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 {
 	struct dma_resv *resv = vm->root.bo->tbo.base.resv;
-	struct dma_fence *excl, **shared;
-	unsigned i, shared_count;
-	int r;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-	r = dma_resv_get_fences(resv, &excl, &shared_count, &shared);
-	if (r) {
-		/* Not enough memory to grab the fence list, as last resort
-		 * block for all the fences to complete.
-		 */
-		dma_resv_wait_timeout(resv, true, false,
-						    MAX_SCHEDULE_TIMEOUT);
-		return;
-	}
-
-	/* Add a callback for each fence in the reservation object */
-	amdgpu_vm_prt_get(adev);
-	amdgpu_vm_add_prt_cb(adev, excl);
-
-	for (i = 0; i < shared_count; ++i) {
+	dma_resv_for_each_fence(&cursor, resv, true, fence) {
+		/* Add a callback for each fence in the reservation object */
 		amdgpu_vm_prt_get(adev);
-		amdgpu_vm_add_prt_cb(adev, shared[i]);
+		amdgpu_vm_add_prt_cb(adev, fence);
 	}
-
-	kfree(shared);
 }
 
 /**
-- 
2.25.1

