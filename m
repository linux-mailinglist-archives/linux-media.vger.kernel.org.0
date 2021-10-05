Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7005F422527
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbhJELjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234430AbhJELjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:48 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED91C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:58 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v25so26044906wra.2
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
        b=LCvgpUtqtCFxZnEQNDktDxpTf4dbhSEuao8ulRT0SvsaoA8Q7G6vuvDJm0ATWn380e
         ph7rlM/02ybXRGIALicADHzImLyuITvggahikLgwr+WnchjLZJwwjNlcS/C7pYXMHLQa
         WJ5lDXq6iXbCeW4mD9We3x3wSLiofrbesUFcdlp5ss2j4Rf16009jjr+FVx9AII3lpeQ
         kNDlruJNyqqiaiEZLINludd1tkyIlWGWVKuW9KTJ9NHtVdeGbdPaVosnxC0edQS7WpE/
         YRlMmi7PwxaKCu/E/uVaRKMHz7b3NhVM9ZujvN2iNYiqJGCverCNmcllaEfuwiD9OkIX
         I6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQ++zZ5/yZpkHj9Fw3rhcDISIEh5bldO1ALOtoZPTbI=;
        b=DssHtIFH0f5c/mgCGrrFfiJZGRWVEq0txzULU2RYoj7qwd5J4wPRFOpliY6x82G/2O
         FYnB0pH+l4YMHKTR77Rj2OJEXLxgUZMEdmhTmaQoRyZ/Er54ulWKb8vj8qEKXNSMbw2u
         ascKKOqhSInMkzjSE/COQsNhURabqsC1i/kTHM1AweSEfMq0m63g07cPDY28puLKblJ8
         W1dDNM0/zsN6+FGROJ13AVl5BaZnrT7qmTC8C1oWeXZsJsHlLNViEKBJAmrlTgQW/jdu
         AC5JHe8AVvcILe449nprjL9QmO8n97DHCgLU5nsZDzWZqq2M8afLIIKrrYd+yJT81IBi
         0rXw==
X-Gm-Message-State: AOAM532WJ73eZ0XmbLJ0FaUzulCbWIp9dQ/z7At3FvTAObdHVN/VVFKz
        NAuiGIlR7Ma9M0TvOcYqY1o=
X-Google-Smtp-Source: ABdhPJwePTy3csOdl5nEHpPWGGqYgsw75JbeDEP7lumwo4i8kiGor/0gxjulTHy+w9OF8dVoRMX7rA==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr17313160wrb.259.1633433876888;
        Tue, 05 Oct 2021 04:37:56 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:56 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/28] drm/amdgpu: use new iterator in amdgpu_vm_prt_fini
Date:   Tue,  5 Oct 2021 13:37:27 +0200
Message-Id: <20211005113742.1101-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

