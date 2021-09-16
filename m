Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F93440D8C3
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbhIPLcc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238299AbhIPLca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42373C061764
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:10 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q26so8906697wrc.7
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OelJOhuMSDpOCxseF7sOKocHejnff6bn9jvwNAWVN9c=;
        b=Iijq6Cm9Ej0SprjX1K9K5PvirqlrIaG6Y4k5CZcUa44rtXLi6ZhPbe1PQH4VWAwTmW
         mib7IISdNwrwpqo8C4wGcU/OMCxOvG/zhYKQJM0K2d0Zzt7nWqP05N9nIWatWhkwqmeN
         CtIs15zkBdLQJp/UlpAEIO9ouCgJueWdcdvkl9IT2Wl9OmUNmdyZlmJ7OJX8yzD5bk6O
         WNs98qv8SfYCauWiPIDihMRyKawOTr5Dbvv2RGaUb+m+9Z1zwliJC/vzOTCEtATuIBel
         DYYFKeUefV0Dv8y7Pr47mBHjXFVFfa9diSyRU77nnAD9beIqDCJ/VI3Nbg20SKqxdniu
         wRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OelJOhuMSDpOCxseF7sOKocHejnff6bn9jvwNAWVN9c=;
        b=A6YEM72izIhe/3fnKt/TZknQgts9b+jSr+ePW33Xgc1L7LhTFFgWARQex+z+XXgMGv
         8g5DzjM5yS6SKx4uBArj7VmQ3cTyafYMv7isKE6BEJagMIesttOqKOiA10Gd2gLNw3MT
         gPAaDHSM7Q2mLJvnpNWtSr6Hyb2ujAuY98Gka7FVTCBexPB1wCztL7qagSD5XRnOpYd4
         r780sDyy+55ZcnwodPHX6X5Ngf8Jyg4lQ7uszyAidDakJAJN+0fhygXzQnamxK9L6e51
         vstnKtWNOWBPBrKW1ZWP2Au5uZRx2EIDyGln2ClQ3MM23FI8P+9xyXkR0Wsgd0k1MbVK
         e/FA==
X-Gm-Message-State: AOAM5335oYf/dHbC/0nBVb2tHcdohlUHzisE4sCwjvBWHItAu2jfGCSx
        kRsdBz4lzt4svNuR7PvaKkg=
X-Google-Smtp-Source: ABdhPJyyjNUHgeRlxAAv+2S4iFRKdiR8A03xaRO6uw/CnwGHfvRgcRffoM7u+ZLJtG1P/cJT31/PRA==
X-Received: by 2002:a05:6000:184e:: with SMTP id c14mr3236805wri.301.1631791868953;
        Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date:   Thu, 16 Sep 2021 13:30:42 +0200
Message-Id: <20210916113042.3631-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Heureka, that's finally not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 6761512ba662..3e6ffba0af70 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -384,32 +384,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_get_excl_unlocked - get the reservation object's
- * exclusive fence, without lock held.
- * @obj: the reservation object
- *
- * If there is an exclusive fence, this atomically increments it's
- * reference count and returns it.
- *
- * RETURNS
- * The exclusive fence or NULL if none
- */
-static inline struct dma_fence *
-dma_resv_get_excl_unlocked(struct dma_resv *obj)
-{
-	struct dma_fence *fence;
-
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
-	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
-	rcu_read_unlock();
-
-	return fence;
-}
-
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
-- 
2.25.1

