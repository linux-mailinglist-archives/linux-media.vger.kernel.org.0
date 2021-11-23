Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0754B45A535
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237806AbhKWOYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB17C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:22 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l16so1311189wrp.11
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JsZbCHHc39IwzipI/I2HHPgu845k5tKZQFQyhwuStgA=;
        b=IX0TjWXBUPhObIl0cCO8dd0jzSFtS894HIT0F0Z2KMoXPbPouWGDfaIF9A90NJvHIG
         pG8AReYdr0nH8qXNW/1LkNgroSUdWQMSCqVKUr9tE9juMhxaCvlmJd2UxRqUpqScC4a3
         S5j+/n4i1Lvpo7g4EnUHWXWwoh3sn3FfYbFoc5QVtysddljxokR8se+z2dnur3rJsO5P
         rMQ+sv8zYIOURRTl97xDQkAb9syxslZW+OSAwCQaDzg5ZIxDxD18wbhNTF6sjoZzLd4a
         QSifb5ykd7eS9CdVSflB/q5lkoLI7s9FUfLrX0uy0bkAbrrufZq4PiQjJWfUIBXHnwuf
         eeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsZbCHHc39IwzipI/I2HHPgu845k5tKZQFQyhwuStgA=;
        b=Xvqvpfn1ZuFrBI6yDDszBvRS8lX5caZWA9bQYjpEIHr977ZhlxINrlj5AzITZhTaxa
         aLr95zPvQngsxX6NiINMgxp0tOiUX4wSWLtPA2hTy983Dtpc8a/XD6lUCV/V5CQ981hV
         8Vldb9RgCHzh3L6aMY8EJPKM+utNviG3R+KwQx09hFsI3ZxMwZoJc2AMfhURkoSvwxS9
         m5hapGovo9oqiTGRmd8vwro+ZzaJrM+nuIxAAakfG8K3g9Hw6MPkbtSK58xZ1thTDJYN
         3AEBScIPYCaWMRxyhXODMWtcMcEcNSssX6Q4mhx2HtjEEImXi6HRJfdh7NQCv9HDSPt6
         /YaA==
X-Gm-Message-State: AOAM531xmyq9uwDk6y3ZSbTYa9LNmtixX+6mTaKLifMXTZDU1BcOCWY0
        y++ql5+WHNe35Dc8jDOS8ps=
X-Google-Smtp-Source: ABdhPJz/nc1WFMdvHu4CFDHPlz97bSqoSpO6wUDq9ZW9KJvprUNgLFbMxPH8+ZwGrMQkSi2yRX9w9A==
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr7948234wrd.206.1637677281357;
        Tue, 23 Nov 2021 06:21:21 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:21 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/26] dma-buf: make fence mandatory for dma_resv_add_excl_fence
Date:   Tue, 23 Nov 2021 15:20:48 +0100
Message-Id: <20211123142111.3885-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
that that this frees up the fences is simply abuse of the internals of
the dma_resv object.

Rework how pruning fences works and make the fence parameter mandatory.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 39 ++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f6499e87963c..e627a4274ff6 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -96,6 +96,34 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	kfree_rcu(list, rcu);
 }
 
+/**
+ * dma_resv_list_prune - drop all signaled fences
+ * @list: list to check for signaled fences
+ * @obj: dma_resv object for lockdep
+ *
+ * Replace all the signaled fences with the stub fence to free them up.
+ */
+static void dma_resv_list_prune(struct dma_resv_list *list,
+				struct dma_resv *obj)
+{
+	unsigned int i;
+
+	if (!list)
+		return;
+
+	for (i = 0; i < list->shared_count; ++i) {
+		struct dma_fence *fence;
+
+		fence = rcu_dereference_protected(list->shared[i],
+						  dma_resv_held(obj));
+		if (!dma_fence_is_signaled(fence))
+			continue;
+
+		RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
+		dma_fence_put(fence);
+	}
+}
+
 /**
  * dma_resv_init - initialize a reservation object
  * @obj: the reservation object
@@ -305,8 +333,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	if (old)
 		i = old->shared_count;
 
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
@@ -334,8 +361,12 @@ void dma_resv_prune(struct dma_resv *obj)
 {
 	dma_resv_assert_held(obj);
 
-	if (dma_resv_test_signaled(obj, true))
-		dma_resv_add_excl_fence(obj, NULL);
+	write_seqcount_begin(&obj->seq);
+	if (obj->fence_excl && dma_fence_is_signaled(obj->fence_excl))
+		dma_fence_put(rcu_replace_pointer(obj->fence_excl, NULL,
+						  dma_resv_held(obj)));
+	dma_resv_list_prune(dma_resv_shared_list(obj), obj);
+	write_seqcount_end(&obj->seq);
 }
 EXPORT_SYMBOL(dma_resv_prune_unlocked);
 
-- 
2.25.1

