Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354CE40F7C6
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244311AbhIQMhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244280AbhIQMhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:37:01 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E57FC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:39 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g16so14931025wrb.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=15+uJTFQ+0nCVkT4/mZ7IrPmRTAjcaW6IMKjQRnhGys=;
        b=GnEDY2QZZLVo3N6y/3h/jMG/Fl//rb8DWsmVdxMaNQCfKakz2pqp4y4QJfHGQZrlev
         DHCXwHbKJvJqven9s8MIZUTJh/hAYNA18hmlD9sDYep0iAfAWtY4onOhOVlfDOEiW26W
         eldwTPDvHkWwz74bKWWdLE+Oo1C+nwZgWH3J1W2485DT89bccoqn1Gp1N33chZm1WTAf
         rYlMbRmmWTlNlCBAl912AD+HuCKiyKb5bLfgTYMVxgLXr1vOTwL62BQwIz/kT8jtQk71
         bCNuiBb8aZqR6hDQIy5NHDVBiMUh+++jut+tYNZhALAE+ulGCo+sC1O/d1l6zjlMRCgl
         70Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15+uJTFQ+0nCVkT4/mZ7IrPmRTAjcaW6IMKjQRnhGys=;
        b=2+GUEb9LlmkHsvnIqo1Laot73hHgfGzOBk8285Y/6Ef2XTy7WBY5IhOdmSUlKaPr94
         z33M85WylbfxFzQdtROBikF02D2enV8FmXCP91NypiYTrQqp4jpKmYTyE7wvgNrnO3/B
         QrEkp5dueE7QLG59latWVTFXB2ec+39KwQvVuX+OPLTywr7iztQEcQUKCva7owW8C45z
         2Hc9BAf/nrIvQGq7+ktsoT96WFoI5fqnYLdH8isEbX3nTinW7iq/JIIl5IJD8QG3ZJE3
         c21SmVXujaDe6TnNeMVyJSOHobyyJ3gggqqj2eAt0440nwkffb7TsbJHNsmaJtUx16p0
         55mQ==
X-Gm-Message-State: AOAM531VZNJb/YeCtqrZ7f4+iWJnOeG6wxipJA2pIRq8XPaLGAVm5XnV
        8wnsTOfRE7H5Y7irjmpWhp0=
X-Google-Smtp-Source: ABdhPJzdTXHakNF50MDsYEldBoA37kWhAHaVU9uOM525IrV+75dybxQfkaNHiR6FU0vQleGYfhuaXA==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr12138630wro.109.1631882138177;
        Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date:   Fri, 17 Sep 2021 14:35:13 +0200
Message-Id: <20210917123513.1106-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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
index 8c968f8c9d33..f42ca254acb5 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -423,32 +423,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
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

