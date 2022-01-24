Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B150F498059
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242908AbiAXNDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242898AbiAXNDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCED1C061401
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:41 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id k18so13452676wrg.11
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=d7GdV3zrFFYVKk31SMgh4ZYGFlJFqcDxuu45uUfdQqmIpu6BoD/+/68mq9J+1fTVme
         PL30RKTL/FL+RA+y/j4gc4axOLMkl1kPB7Nnhd7jqCA2Es2Kuqb5MbOL51/dhebD9dBE
         2iqeY0IPGfcMahD3j8CdmBvITrq4EdnC83Ljj75bpiN6f9zam9x2HtK8fKahWPyrpw5j
         GCWRZcCTJqVHbqy/QyKUvAlY8cNPQVjx3AuB/B2mnQsbjLqhPQQosBCQduhjQQ99sRmx
         7ZI+Npxk11LDL39q775wx1nKvklgsow9cilzlWln0mMBJBC5L43bn6rwFmqibzN981kX
         3eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=aevN9zzorPO50c19DBLLi1ZCzVlRknmRSQe6kEeKKPLXOJb6edPxKzp/qZcQvzdUg9
         1B0Y9JRKhH/94eUXQacyJyFwy95Tj49rc5Z4XY4Qtp+vcq3TLQfok+Wr/w0n6OM4QUkC
         8REcwMoTgoX9M+lD2wGMKJ/DRjXKq99ivUCndTLXm4ZMA3bAr1PR5Uqu1yg8ZOj8UMzX
         9gUaCm+XjQIrm4WV7SrYDWC4rjQ9uXFjBJinlU+w0sEZLgeK9eYYvU5gLWCYkfMVgQDB
         9QwwLp5QAPjVA2l5zKPhy44/Yd7wVrJVlLPUzN5UZHzM2MCXeKTWSJiibDL9HN7Ni9P4
         yYuw==
X-Gm-Message-State: AOAM532bZ84Rca5HUCAznB58j+ZMLur/iIm4deEEoKrFY2GgX8jFBy08
        kr38/f6jBYr1oO+TNVp+QpowW5yhBrc=
X-Google-Smtp-Source: ABdhPJxvdjWU3RM8A6b76whKwGja3Vlgl4pegYkdp0qNNsZaMEJtD/HoOG09RzcoyFzY95O1xToLfA==
X-Received: by 2002:adf:e112:: with SMTP id t18mr8103522wrz.293.1643029420441;
        Mon, 24 Jan 2022 05:03:40 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:40 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/amdgpu: use dma_fence_chain_contained
Date:   Mon, 24 Jan 2022 14:03:26 +0100
Message-Id: <20220124130328.2376-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

