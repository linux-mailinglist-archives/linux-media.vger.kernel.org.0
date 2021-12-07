Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FD246BB2A
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbhLGMh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236406AbhLGMh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:57 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5825FC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id c4so29116643wrd.9
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=QwBunLudp2fNnhqh0C3i8MGxJCiP4HIIJR+mb6SEKM/E/BZRboaVHzJMjzH1mU/KrC
         WB706L4RKisaLGsADGr+EGp6uLKpCXx9Coasat+wqpKYkyzoOEWPlC2gAjIQ+bgHykI0
         I1g9OLQdbNKdtkdtV2dpg+rv66lu7EehhAWfNuhrBlBF9XFeAu5l3xcho9vE/d0exYA7
         Vx9WmIbaRvlIow3dIkddGQ6fyU7ojmx4C9GwGOj60yaC/9aU3lzWrN1N1Wzg7+W9BQbs
         4JeAEL7CyInO20KsSUUcLziUDsjutmfXflX+S8RlpZPOEYsS4kUQnl95UtKEKj9VlACw
         ckyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
        b=bypji17Oe2Xp3/UOC4iL6Q98okppiSEAxcMz+zvdBQgkQGcXON7iCcgc8jjfiSItVy
         AJqyhlgQ5/ruOu1ukRdCREN1vfYsfLIFf8rhhTamZcWQ1uu8unNZvt6MZP8u/J1A42SY
         1uiuiCsLu5f4Sq0+VPnR1FKjlU8Uk7xCEscemlMB3HbkOQh/OpFmNX9jKtmOYCagSpg1
         EqzTU99iKq2SoU3ljrbcc0sf1F0aFSxUUnf28KePuz4jB6xUgQGi/W0yx3lBNe7VWg+4
         1eYJvEXqBCZ1PuQOXMUBicfJ64yG+Mfa4CxUrwmnxzLWJu8LfV2KsC0oUGIzEgvQKrX9
         miyw==
X-Gm-Message-State: AOAM53170MPi1pje8qRhjSmEaIlN+tNEq7H95LoAE1YmiNAFjMjpQLbx
        oXKIv6oCsgAREx8SIU65aX0=
X-Google-Smtp-Source: ABdhPJzwKHHcoAbsPn2oATffQ0unLZveUQ5OcXQeALH7NvSGcbQLiqMCCR2sb33IOf0mHKWheZOnBw==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr50950945wrs.537.1638880465980;
        Tue, 07 Dec 2021 04:34:25 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:25 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/24] drm/amdgpu: use dma_resv_for_each_fence for CS workaround
Date:   Tue,  7 Dec 2021 13:33:58 +0100
Message-Id: <20211207123411.167006-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

