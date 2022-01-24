Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EB84979A3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbiAXHk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235988AbiAXHky (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:54 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F73C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:54 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s18so11831334wrv.7
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=mG9CH90QC3I0Kyzw5y97iSNP9PKE/WVtuooRunf7nd6IStTMUWHcpXD6CBgFSAzYcc
         4nj0LnYyS4DS6WNAo7pgQp0P5OrOeTPnFgfGBFyIUgGqW/n9Nml/4rP6hhxrvPVIOWzT
         9kCfjaCTyxQPQrTBwvJzzfSvZvbS4cLWCtyfIqFA8jYs/coBp6zCUlsv5gEuhNMgZM85
         yctcg1vjOhrNtMASAKrp/iVmKCwmE4RYU8CYLR6OmR9JLXG7+qd4pMVIyf82yn0OjWPg
         gcdEJntMlPDJLPBBIQ648UZr5CVOorNM/aGKcXOHOdRTKHhAHt+CBeGRGmFA3w/T88C7
         aJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
        b=NscfuOgXV1Y4QUufPT3IThUZCos489XZkq+gN6+b43tkVq2qLAEyCbMVISZc07yUBR
         VtMSFCnFQkEACg6kghGlj6Ixk/rkQJ5aecUmqsoGTsI0X+36idEdEhB+Dj72LtwNfb8V
         /m7Kv4wyfBYRDQTOhlyAU47hlTiylYVsEoLLTffuMLGEkOsAOjHjuML8VAUAo9/mW+Vh
         +MRJCpMiOHqrrXQhpSycsd7+cMVuDmaAp05BXLkCxeoAKJMhwHSkJBiUQ5gkFN+ZwkeF
         8HnKsFzJXVzz/HTd9enjZJNzqYiL7MmWy4vkLaj2kyAWJG9hEtbybKVuHPCnO6AXu9Hq
         0k1w==
X-Gm-Message-State: AOAM5305/0I2MIydzKaKcQbqS5XlR8Cptsq/vnF313uufu9tzj4Hvr9G
        3bo8o367ku5KBbKji/Fn5rI=
X-Google-Smtp-Source: ABdhPJwMln34ByUlknX94Kfn4e2Z9+KJmZUiiAPAAQbyVgCnwUNiQ9kwRWOqrhxswOPyncTsQLoDAw==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr13378665wrw.510.1643010052928;
        Sun, 23 Jan 2022 23:40:52 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:52 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] drm/amdgpu: use dma_fence_chain_contained
Date:   Mon, 24 Jan 2022 08:40:44 +0100
Message-Id: <20220124074046.4865-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

