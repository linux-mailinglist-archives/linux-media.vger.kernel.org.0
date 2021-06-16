Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C553A94F3
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhFPI3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhFPI3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:12 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C99C061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n20so1536232edv.8
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IVTqokzmJtH8YP62XhkCvu3HVJ/rLNfsAlMIAEY59CE=;
        b=EwEYNY4o/LxWqe7QhW3a60rhBvw/kRELesY+OsHJ+XaBjf0r6WAzYlVTjcdo3Q+M0B
         hlXIM9gJRkjGWtrSWXsIB1Y9niKXfnaCOZUVlw3phEEKG7nQDYXmmmN2Ucu9vqaHWEV7
         tWJ4gJwUSDTwiOoG/dQUHjc4hOFVi7cJ2h9TTcKLtXsUbxKE+zsrWj7tUT6UhK727GP9
         28UoI8wNQKRUSJQQm7gGpOGysujbsiyWzIbMJ3p5hqBn6Q9UK6gdq2tnSP0kBgNjwGRM
         jGN5xHkwvWTZXFhTHC3ye6Skxz67KYEhWjyqNJA1inGuvlzJo5C7CyopuppTDQvFj9ZZ
         skuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVTqokzmJtH8YP62XhkCvu3HVJ/rLNfsAlMIAEY59CE=;
        b=ntLaoOYV2J8SIQzhUIoY+KECe0kzWuWIPEajwxdOCR572ZXuKjz4PNJjxZDnfstJJl
         pWnG61lZJVorxKl/x3KwfQFPJZDflylRRMKHVkkijdG7fRhs+F9jtoTSE/Tn8u3MJchL
         tMGcO9cDWzkz/PTagL2CPMUJEWK1qujlXpCiRuFTJX3iqljvhJ6pfCnzQACKadgftfWC
         Ktvp5QUIIvPhxpO4k3lThPIK1gGH0XXD9lWgyDT+HQGmCMN4rMPjz4skuTVc7ecB4May
         HadZYzWRRZ254ZHf6B5KGG5Z5s7eS93qq+ty9JVZWykJYD1exFCB6QU3Miv+lesqVAhn
         cOzQ==
X-Gm-Message-State: AOAM530ZQ0BLaFX/P34UNQ/zABiB+1dSCe+S8fL+nJTxyWAhCled59Eq
        aVaVQHb2733+6ZaGYS0fWi7sWyVQgdg=
X-Google-Smtp-Source: ABdhPJx4sV239SQRT2vcbJ7VyXdlQJ8tWQ82/GMk1JT2JyYbq5iZo7gKx4+Rw7i+3JlO3ydX9xlE6w==
X-Received: by 2002:a05:6402:1644:: with SMTP id s4mr2774807edx.190.1623832024719;
        Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 7/7] drm/amdgpu: drop CS workaround adding the shared manually
Date:   Wed, 16 Jun 2021 10:26:55 +0200
Message-Id: <20210616082655.111001-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the workaround adding the shared fence manually in the CS.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 25655414e9c0..af8f5ff5f12c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1273,14 +1273,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		/*
 		 * Work around dma_resv shortcommings by wrapping up the
 		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence, but first add the submission as shared fence to make
-		 * sure that shared fences never signal before the exclusive
-		 * one.
+		 * fence.
 		 */
 		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
 				     dma_fence_get(p->fence), 1);
-
-		dma_resv_add_shared_fence(resv, p->fence);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

