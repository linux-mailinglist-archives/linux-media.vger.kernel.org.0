Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C984752B2C
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 21:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjGMTr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 15:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjGMTrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 15:47:51 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AA32724
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689277670; x=1720813670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PSNuFJ2YvjV3jxMAZ+7/NMsIeHyXgIo7PD8ECkHz9l8=;
  b=llFuNBaPlM+IjVL0XStCafpsYiLqfCqbfWzNlCZ1s3mECk+B+dwrd13p
   JFccBS0jdQElXhEOEqqp9an+/mgpqsGE4Qy21TaXLw46iTo2Cy2UqZ7de
   JuBURc0KkRCrWHS460vgjD4MJU8kj/XgfivuoKb1N3ttlloovTURA5NDM
   3aZCty9siWIcqyPy4gAyBqkWdL2ypecnRCkP/CWundr+dZWiVqv9mmgwc
   2gogw5NyehwU49FtjaUyKSMTr/bVRDXyAqe8MykQArcLFuAxStzJTw/Qo
   yaVZ/s+wYR8VX3wr49CBGVRq6CIi+kvQoAESqwKJ67+PnvukWUcqN8Rjm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362765417"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="362765417"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 12:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787588936"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="787588936"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
  by fmsmga008.fm.intel.com with SMTP; 13 Jul 2023 12:47:46 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 13 Jul 2023 22:47:45 +0300
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-resv: Stop leaking on krealloc() failure
Date:   Thu, 13 Jul 2023 22:47:45 +0300
Message-Id: <20230713194745.1751-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently dma_resv_get_fences() will leak the previously
allocated array if the fence iteration got restarted and
the krealloc_array() fails.

Free the old array by hand, and make sure we still clear
the returned *fences so the caller won't end up accessing
freed memory. Some (but not all) of the callers of
dma_resv_get_fences() seem to still trawl through the
array even when dma_resv_get_fences() failed. And let's
zero out *num_fences as well for good measure.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index b6f71eb00866..38b4110378de 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -571,6 +571,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
+			struct dma_fence **new_fences;
 			unsigned int count;
 
 			while (*num_fences)
@@ -579,13 +580,17 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 			count = cursor.num_fences + 1;
 
 			/* Eventually re-allocate the array */
-			*fences = krealloc_array(*fences, count,
-						 sizeof(void *),
-						 GFP_KERNEL);
-			if (count && !*fences) {
+			new_fences = krealloc_array(*fences, count,
+						    sizeof(void *),
+						    GFP_KERNEL);
+			if (count && !new_fences) {
+				kfree(*fences);
+				*fences = NULL;
+				*num_fences = 0;
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
+			*fences = new_fences;
 		}
 
 		(*fences)[(*num_fences)++] = dma_fence_get(fence);
-- 
2.39.3

