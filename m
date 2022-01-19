Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B93493B51
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 14:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354883AbiASNnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 08:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354878AbiASNnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 08:43:46 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCADC06173F
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:45 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a18so11790462edj.7
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B/RyGnK1GOVV7mP2i6NUyL8dXTOp5mSU0ausD8jObPM=;
        b=pVinbeY9LHg95yEKahv8g20gbCh1BdN4nWVUNdHsg+Pi7vXMs7N2GB4+sLUsB4rsUg
         y/+M947KC1OlC3mGcqiIs8LRAHHVwr98JEqW6NRQw2F6Vy/1KJi07x/DFBPsb2QC+n/V
         V3FdSFUIqBfQNiY6aoimqXHksG39jj/AvaMF7Xt6hyubaqlKmNxlcVEvx3W2O6fT2q4X
         QT5eoUkU/xpo21Wveo2E3YK2AWcVVWrEdXeSDL62ggUKkKSB+tpmWyRDIbdpwptp8mhP
         NRrA0ef94fYDJRJgN5CHcL0SnLD/aNcyKCZFjdfLT2jkO146+Ty80EATuNp2RuHR81yF
         sQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B/RyGnK1GOVV7mP2i6NUyL8dXTOp5mSU0ausD8jObPM=;
        b=25cFNe06A/t0sTeqW4R3FYvxRi39LkwXbMcdzjcOC7mE37KidIeH9TPZkjhI3hjGW2
         ZelC9CPVg3NJyowMKcgalMJoiTRoKUNvqZ/ZLEr5q5o5In8+5qzYOFGpV1n2b/C8HpQt
         rU8Xp7nYuXX4d8NyISSEFSfKjSuLnS+wuUCuTNk/SZ6jzRk4T1f7+fuSOlC1avzfCMsv
         IvCasJNw51L3Er5XMmgZrXFKNlOjyUXVq/PQkanPSN5lPkRmVBGPjA9jAj+lqD0TRcoQ
         44IlywkkY0XjlYDQFYlSgkemif2WL8ZSrKpiPV9GobLLs9rCqTxHgYXq9hkSOwGhFi4A
         6nsw==
X-Gm-Message-State: AOAM533rkV/pVk8JWMAogA+YIYx4O2uABA5TeMYGPeyPcZFXNFUn+Cpu
        33X4kGDGU9YucjHNqQ2hm18=
X-Google-Smtp-Source: ABdhPJyRkjh8/psx0CRmEPXxOUN/B1pOuBL36LxzwXxNBKNTIJUgRDrIKqquQcrZosFF3bO3uS8Y/A==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr17658023wrp.295.1642599824450;
        Wed, 19 Jan 2022 05:43:44 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g15sm19733583wrm.2.2022.01.19.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:43:43 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/4] dma-buf: warn about containers in dma_resv object
Date:   Wed, 19 Jan 2022 14:43:39 +0100
Message-Id: <20220119134339.3102-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134339.3102-1-christian.koenig@amd.com>
References: <20220119134339.3102-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6dd9a40b55d4..e8a0c1d51da2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
+	 */
+	WARN_ON(dma_fence_is_container(fence));
+
 	fobj = dma_resv_shared_list(obj);
 	count = fobj->shared_count;
 
-- 
2.25.1

