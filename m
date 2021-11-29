Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8892F46164F
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243561AbhK2NaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbhK2N2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:14 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FC9C09B072
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:24 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a9so36271093wrr.8
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=jIfLMHNOyiH6re4iFPVufnCfjZ8Ud/UjDFcuL3gUDJeKvCM3UbtrY8kJmmEmlsP5fV
         qlkSfwlaxZrJ+hCkSFVi/Id51YS65GNfGxlg7bw0kaRcDf7z9wWRCGWpm9nzwAXxXL+J
         no7IQqLrmVVIJ640E/VKVEF8UmEu2dn7tN+19wYQsgmbQKe+1YuP0xWowOHfgt4Ph/Tg
         R7QhEXs/XbU207fAX082CPBlQn+6j+5NUBqUpu2Q5vN24e4U6UIC4zvqjZiTzjrx/Gz9
         xtM2FG/o1ejpyR4pKBuaQY5WJZptHaHbTWteWv5yFjf60qykyI5582jbvDZ+UmNsUesC
         K5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=26c3hoHV7LL3pFRkqL66Ihxny4/6FC4BEetHGAheL+/dwow3o3hcOXyrU1lO2Cy9eo
         RelVycvj6TERKR9KuTss4+8orccKtr7uaN+AO2ryQS1AW8UNFclRjBAkJ2AGoEXj3KqH
         7Fu+ipTkypF6kS09mj3FDBiclDt//zGQ+vSQX0PV72WAAcNO/ZdXTmoXPYJjt9XrVUKM
         2mgyQzxiqSrJVcHfCmgiGCynT5aw4rWItW5tjcy222N1+EVdVmbjNSH54I58nyXzBy7J
         peRTWYTVlqxAc7J+cSYVOmYsQyKA96f584khTRl31RuIEFEO/1iePKBsCUWdG4DYws5y
         570A==
X-Gm-Message-State: AOAM532qMY2RfJSmLgyQIqsWAGbPXE3b/hTUEZBFWM5bFLhg+KIT88t0
        66VD8r+A/yscGByth8YwShA=
X-Google-Smtp-Source: ABdhPJzkgIuWSPb21nIZ1tZEj2iYSO3+RCOYkVkqHCgSj/4koXRSCMg5iIXTa5h0RyArWlxqmIB4ww==
X-Received: by 2002:a05:6000:1813:: with SMTP id m19mr32676183wrh.51.1638187637874;
        Mon, 29 Nov 2021 04:07:17 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:17 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/28] drm/amdgpu: use dma_resv_for_each_fence for CS workaround
Date:   Mon, 29 Nov 2021 13:06:46 +0100
Message-Id: <20211129120659.1815-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Get the write fence using dma_resv_for_each_fence instead of accessing
it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 53e407ea4c89..7facd614e50a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		struct dma_resv *resv = e->tv.bo->base.resv;
 		struct dma_fence_chain *chain = e->chain;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		if (!chain)
 			continue;
@@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
-				     dma_fence_get(p->fence), 1);
-
+		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+			break;
+		}
+		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

