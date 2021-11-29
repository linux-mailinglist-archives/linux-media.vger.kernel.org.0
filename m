Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF1B461651
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbhK2NaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbhK2N2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:17 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4690C09B073
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso16615567wml.1
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
        b=jevFp14fe/qtyapDl2L94QQ1SJX8LTYt3/+Rk4yVNJ3D2j5rmp+A8waLILQZZN8qma
         lpSd5jyBKq6/U5YB0uJt2bFs5rd+tzmIAdq34vOZV0VzBln/Xd9KeLJ2mwUMwehhm/UM
         oB4hERJvA5y/cggH8/Qs/BnimO8KVZW+3N9amUOAyc2lmiPsPbyrg0uRuK61mWnLeTJJ
         RGQGh7lgy6gFq6OqFrcb/5DP/vYw1xI6uRaOU/UxUH/uzJ0nAUVDyoldPUMSrpWzkQqt
         +b3y5OGU7wX8o3T6ub4a9aJunF4d6Kes/W69EwIZzrYW5YpdRudDZrs2CRzgN7kLWxUn
         zTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
        b=ncnxduu1zJcP4xPJZak3HJMOn+BE1HAQ6jBBpXNzHBseMSCeJT+/Sf/88FNZDOZfZf
         lmr5QJemYbiIoTyThfEal3xZqkYjrSyO60ppyhm4Xzx2FEq6VUgoiXeIi05WJepzZ9Q+
         EQhJSZryMuN+daamGiXVtcAzs3vW0Thf43417VW4HJUDURT0Ctsk1Jm09dgnYihiwkgi
         rLRobmDcTr5tBWEX3+mylDiXiM/JcPIePuf3crGz9Z2oNBoTIfiXPTJU7xouuJyTbi1g
         IYc2R+kFqzGDp4CB7DErjp5fJZDrTPeLkDyO1mXUw3rS6RFEaNHK89zm4k6TQ8OUBH0m
         JYOA==
X-Gm-Message-State: AOAM532GNhDxq+MvBlFiQNbnz/jKQFfOhrixSP0ZnrjeaHJrYk0w0Bv/
        NhYZbyn8igO4H/o0+pH6oi0=
X-Google-Smtp-Source: ABdhPJyrnR/81obxJKIzYMVAvUsSU+yK/bVJWztl2phcRNfRcgdST2eKpZZ6arJm8pKSG7JHstJPaQ==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr36603134wma.85.1638187643831;
        Mon, 29 Nov 2021 04:07:23 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:23 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/28] dma-buf: finally make dma_resv_excl_fence private
Date:   Mon, 29 Nov 2021 13:06:47 +0100
Message-Id: <20211129120659.1815-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should never touch this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 694716a3d66d..9acceabc9399 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -147,6 +147,23 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_excl_fence - return the object's exclusive fence
+ * @obj: the reservation object
+ *
+ * Returns the exclusive fence (if any). Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ *
+ * RETURNS
+ * The exclusive fence or NULL
+ */
+static inline struct dma_fence *
+dma_resv_excl_fence(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index cdfbbda6f600..40ac9d486f8f 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -412,23 +412,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
-/**
- * dma_resv_excl_fence - return the object's exclusive fence
- * @obj: the reservation object
- *
- * Returns the exclusive fence (if any). Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- *
- * RETURNS
- * The exclusive fence or NULL
- */
-static inline struct dma_fence *
-dma_resv_excl_fence(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

