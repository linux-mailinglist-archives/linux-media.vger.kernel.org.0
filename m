Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09474A976A
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358164AbiBDKEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358141AbiBDKEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:43 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BC7C06173E
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:43 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w20so8106046edc.1
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=Jz+HUiSG7XC9MjED/gcNv0zfCuUYFu9u04aTEsTpnY4EbHbkWKo9dESj6TOix/VqTZ
         a2WlPyfMfnWgCJDQKyGlhNmo1XcGuTynUbjhCrCLMvnyhcMFQA7EQgea2/zM5WfUtetv
         7LU75cwoXcDVBi0SEoMk18kcWX8gl0PfdBULxU7oeIYtgdu7YuYsMYiuaH6VOu+FnIAE
         tj5OSsML18o7A5+CgTltGSp/x1w7MO1OlrZpb+nc0nMwCZ7Y2gzG62hWXcZFAQsdDUHX
         QX5Cm+c6bL67tiep+HF5Fw14FBxfiTnkz52F+he6uyg/vKIVS6vepSKw4KE++z3lC9hw
         PDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=0VeAMwxuphFTvszXfpninx/522dmXZprkcRl00K4OU2uFTxCbQNn7y2XdAbZFg/FCK
         T7oYOEweZL+qx1spG+eTgz6iDSJ/o6LAIld2yE69NF9IZ0cKXVCDZJtBi5cteB0dhh/8
         FueBMm1pbExujAvUgtZfowapcOPkya1fK47IhLc7lz5weu+xJT7MHQ4peE3ngMkWsi6I
         OJWMIDOGXLKJMnZ4BPZIFfwlPaNktEpiEyQ0d7dHKZicoNqe2RzY7ZqFmCiC0VGliXXj
         ohb/oSeWXfWiy98KwDRqVv1ULEhm6BVe2VlBS48BH3B+jOdCeyS3U2ieJPvM0wNV3IzM
         OFRw==
X-Gm-Message-State: AOAM532lP7K06WAXQBP0jaZycm24UE0kT8blZKnY3VccOw5azRB/fsDc
        Kix1d9aGbPF4bo75xTQuoA0=
X-Google-Smtp-Source: ABdhPJyZWf/AMWiDhzdDt7PQoSdF8kB98XCNmcSmAiADBKdZzV3DJeepZ+hSzwe2wALWcX4P1fjOEw==
X-Received: by 2002:aa7:d944:: with SMTP id l4mr2239665eds.117.1643969082010;
        Fri, 04 Feb 2022 02:04:42 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:41 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: use dma_fence_chain_contained
Date:   Fri,  4 Feb 2022 11:04:29 +0100
Message-Id: <20220204100429.2049-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of manually extracting the fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index f7d8487799b2..40e06745fae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -261,10 +261,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 
 	dma_resv_for_each_fence(&cursor, resv, true, f) {
 		dma_fence_chain_for_each(f, f) {
-			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+			struct dma_fence *tmp = dma_fence_chain_contained(f);
 
-			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-						   chain->fence : f)) {
+			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
 				r = amdgpu_sync_fence(sync, f);
 				dma_fence_put(f);
 				if (r)
-- 
2.25.1

