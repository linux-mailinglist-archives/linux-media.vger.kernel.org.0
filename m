Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7674C422525
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbhJELjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbhJELjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:46 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C66AC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:56 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k7so36615469wrd.13
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=MGDBYBVBRIF5tkLroYs4QSOXNDSNWjfJaGAB9QDpbkKZi+RS8rrKCu9yA1Tl/Zl5dg
         09eM1Az7JST/cvi/c+3Y5+1dzjupxQLCBYYiBxp21YBigY19ewpDHXibkFA1Nl2N2mPh
         pXfNkwc8XaWiIaOPdcRm3UNsmsLRPsYd1Ky4bAIZk0Z04f0YGrb70ECCprwBZLqeGnvn
         IF3q6jPWo1bDSfp6tOw3g9eUW1j6az6VAWjWt4SpCZPB79JvI4cIGHSzwLoLaFd/wKcV
         D75E36cymcao1Q83muROaPE3bezcZOS8OJuiR74q1DLbPKvcm5ywWRIqPvAm5kJ0I/XG
         7QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=hWMdesioYcohbFK08pki1xGEDB3SH76Lp/CcGAzvqYdIWSDIZR8b/+KzJcD0CAKAGM
         mtj/IV35vbLBtuVbbUrUEOL0S8uKrAtxdq5TTc5w73Abt5khWt9edklw0dD/pWacMFo3
         ORacWFgZECy+DNxp/VScd8R+9o5NXEP4m/mxPSXPXItrWDTBgqU7mQ0/daVwjpjXg41H
         krdDj3UQWZoOF0xvMZExz2/wswiF/E+3JFE/fVgyaOS5HIgYc3xcGTFdEhUWxNkz3ht6
         7y1gw7oc11VCkLBCTJugsmZgDEm51mo98e0sDpk4ho4LpTUAyIY8YtGM8TJB6vWSbpzc
         rtNA==
X-Gm-Message-State: AOAM5307xLJW3pHFRwN7ocRp/p5+1F7SW8uMIwNtAAnaxsY2ayBJTkAv
        G9Q22b3p4KLnVGNuxY46qIW2VbH4b1Y=
X-Google-Smtp-Source: ABdhPJz9pWJsgAFYWQ2jNQrPeE30G4DtExsu0IfMB7AJIY+yMbGxzdmOuNmA26rfu72aBYfQtkaA5w==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr8277768wrh.46.1633433874962;
        Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/28] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Tue,  5 Oct 2021 13:37:25 +0200
Message-Id: <20211005113742.1101-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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
index 862eb3c1c4c5..f7d8487799b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_iter cursor;
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
+	dma_resv_for_each_fence(&cursor, resv, true, f) {
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

