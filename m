Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F5E408E27
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241083AbhIMNbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240035AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDABBC0613E8
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:27 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so5216909wmh.1
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=N1yh3KLMPT2mSLdGaNPMr4FcR2oS5TudmRGaIzNscK5H43U4M9/1H/Zjf1pdaepVW8
         mmP4W86H2+S2MuPhd6iRL1B1CF07HnuqLLDI4CkZPRL5M1O7HO/y7AaIsZbp3uShV/I3
         Zavhexb7l14JcmV5JgKo3j/16BkY6WUZZDf4Za2Uxi75ko8zgiy0arh4QncD/OfhJHk2
         c+6ml7UNDHKPzr48GZyzH+QzsHDwRk3HyQ4VubasIElM+5sfz3n3Scyla6SIqlKaA9Vz
         NMWd7qJBkaWGbrTW2pWQuf9M9CDkEzaRqkmdoVPQdoSm9SlcPHPvXoIH3G9BPmVCs/FF
         dbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=2jD1q9tBm5U2AtNncD1p/0sj0novLpT1rDppZxAhoWRmpEUk60sRqPk+TMwcDSGX0/
         d7afAIMMcpdZ0g8ZRrC5HTBhLxaCDBW+Lrc69DsPjcCLGb6qrZA8zgGH9ghI8HsUZGLA
         USpkU9hk/9qZVFglHEDXfLmqdZSJrx9wTl1tbNRPSE9wxPnl372lynCSgy2QzHcAS4Lr
         IdoDU0j5J8sORlF8tvnfjFGV092u9/CQCvTyio4eNslycVWUpmG/cEypNwGXJf8yoNR6
         lmDwpdKBx38p/B5dN9ZwFsyMYZjoYMiqBFB7m31fLpk3VQyxqxQUzhZjaxEK7DUmarUW
         nfHA==
X-Gm-Message-State: AOAM531wm6j7kjNlRdEg01JVDKrqA+g44PErouUUuKPNxWKS3cKvRUDq
        zzqESz6jqyqLG0wSNWMqhpU=
X-Google-Smtp-Source: ABdhPJzynpoOddBfRnKkBOAXF99mq6o+MV9PdUiMtxClU6QvSUdcyopeL7XqvPv6o1S/dqJefTgVHg==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr871983wme.51.1631539046477;
        Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date:   Mon, 13 Sep 2021 15:16:52 +0200
Message-Id: <20210913131707.45639-12-christian.koenig@amd.com>
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
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

