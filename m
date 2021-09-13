Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C23A408E15
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241990AbhIMNbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239984AbhIMNTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB85DC0613E5
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso1434404wme.0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
        b=ZdHYlTs0bEA+813Bp0u18Izy3By6RubkXsIkO/Xi8dKMbKpUbBs7SUF/bA9+CTMC9B
         xbeMxQVpC826j/BcBJ+n4KCdZbjM2kImV/isyK6D7m7myFUc2oTiU4ffKIcqIuqTQwIK
         2Nq6lMbkKRmB04b+whsc4jQamkC/TRPsU8tVCH5XYhwy8TE73NUfKkHpCzXZmM+D5EP3
         UbMmsioMGOOoDyr6oD2+Bck4EkaPzsg7xuR6LJv1IhEkBY4mDZCJ7Ox0hVS8exMx7czO
         n1NTA0xRIALoIF6PLPWMSHV4MUv3PS8innqNEOzmsxDRje2PcIIu1Y20yTgzIomQhrTE
         qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
        b=ghGXk5UijmQrAZPZpdGIS7kcDjkTicmrT7fkxqhpYRMZ+HX2N3/FV57TYjx0TsiDm0
         0bUkvkuMahq7LlZl2lSuCC/EI8Ppqk1E/BptefJYCTJQciN4yW2bjGEnRF1vyZt2oemV
         vQ2gPYXiugzxC5LbSPASlDfd0t/gOwsdd3zyWRWQI5gwOb9aKAFzrHXc3Tf/WZhuHtdd
         zAQteGwmzvUtkl31sKj9FqHmKv1kY25tNt2JogTWNe+Tfq83a+U+JrwKmbbhdTust9JX
         izx8qykwYCBmNP3menrEm02kvjdwz7k5CuAUyTM4Mc+5HtBX2/k2KCw8Dow1OEzXiDrV
         r4Kw==
X-Gm-Message-State: AOAM532rTX1Gr+he9hZPgHd4wpBtW0nLhUmNxNCqHYB+9QOh9e1j5YR3
        rqEAoFVgOmvsZdzBfNs8KgBEA68jKLFmcEK2
X-Google-Smtp-Source: ABdhPJwhNrr0b3Jh3FZojwbhr6K59kgjilNH2x7fotTq32lvYrYMSXrCJyfJ2JKkkE1CYaVZjjV4Og==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr7911060wme.104.1631539043442;
        Mon, 13 Sep 2021 06:17:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Mon, 13 Sep 2021 15:16:49 +0200
Message-Id: <20210913131707.45639-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..031ba20debb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(resv, &cursor, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

