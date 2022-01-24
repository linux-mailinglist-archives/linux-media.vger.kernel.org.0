Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707BB498054
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242891AbiAXNDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242886AbiAXNDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:39 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DA6C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w11so1308279wra.4
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=k4LocfeKqgCiOSb/bFkVIe+Ku658A7zBja842FU5zGdTH4NyJvvfBvfC1rpFFs/N9/
         Dz+5WYB/YSi4WC1+4LkgurAiJyl+Ru/4fkgqNb3xGwpZdaDJwD7gjOKTUwopixnAKqn4
         iSCVjbdzTeGr4092nLs7seeDslt4C2M6A7kFCdCvePJtVUcIhx+hFdOmVcEVrykssxmJ
         Beh7uRJ+R6fz4YBEwJlnyF7nk2PsAr2V2oc1+3P8wI58BHuzqHoBknI6IldOXNgAzr41
         hzBUWmho+twZ4l0H7oJUgIFpgP0rpopfmrHJkhaGpiMJFm9NaXimRQVpNtQ82+mf2OtL
         kUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=zDdgLI5X2tSn0D2nSowBszcHZMKbB22t/6cG/SRx4S2uldp6zmoYvk1hNb392Xknay
         YN0cRpJNNj149D/cCTxhltqAns1gCIChv44uIG5hOlCTT43MW8x+uuAeP0Zzx6/mRa+U
         uvxOwW5SzdsTj5koJviLmWPhCCR/ttMBvEKKe9YvziTsnLriwAlzvh1YyjrfQTTiCMH6
         2F55AXbZwA8G5JyKgeLvUdyA39l+1+Pn10aIlFKFfaU126+ppyTGIfpIfeV5s80l0flA
         HKaS7E3zkFAH8XNCLhcn0iyzJE1RuFWByyAc5BUuGkAfPBtOPJGn7wWI76niB8cfPMD1
         JphA==
X-Gm-Message-State: AOAM532MEHU5OIGffK+JvMs/xb9IEhnE8wmYZOB0+thPlZzPP2PopU4C
        vkA31Nnf2Img+QIFkjJtOPY=
X-Google-Smtp-Source: ABdhPJxQFRSIdOY815uMIjIuICHy/VNW3E4LthwsrDEXVnYnOzu387vE+YAzcwllAcmtblw8wKBGmA==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr5230197wru.613.1643029417626;
        Mon, 24 Jan 2022 05:03:37 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:37 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] dma-buf: warn about containers in dma_resv object
Date:   Mon, 24 Jan 2022 14:03:23 +0100
Message-Id: <20220124130328.2376-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

