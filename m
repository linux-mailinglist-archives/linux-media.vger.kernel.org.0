Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B059D20F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732748AbfHZO5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:36 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50856 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732714AbfHZO5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:35 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so15788210wml.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QMED2fB1j8XW403akPNL5uWUyUywT4Cr7sKX6D8d33c=;
        b=vKMW8MnMsmIfZ3q9RKQsUCPDIpRVlAZxXdCi/c2/qL3oi4csrqjL8ztMO84wk7DCe2
         +K7m/jziO3Tihu4FxebbMkvnRsFCJZ1PKm0j36Pr9q9ILzVk/1bfl3mJqSZb0Lf1bwBB
         0ktVKalLn8qe2gfVWiT8kQHVoT21InWLu6Fr+a7pNoMRx77kUSpc+5zQzY73THiwhulH
         X3xHSGEiYXXTOY8RAMfoJgvfG57HmWqUzjPu8ob1xlAMDMSe2xwgjcnzzURDgBL3Ow4Y
         ovOaieDn9S6JqWBKjvky77NDLPhURbe2s9tIG9V3nlQkCPUsoVK5NyNJtRMudP464IGL
         y/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMED2fB1j8XW403akPNL5uWUyUywT4Cr7sKX6D8d33c=;
        b=Bd2N6lnRMw/RK9etpsAl7seWbWfmts4tbOph8kynlb/2cirD6iCh7kXB1FLRwn8Mtw
         FwvRTNF2n1HQ03YyubnYnoRNB5rImNXuZ0ryfmGMevhKBkK9aT3K5NJSv7bbvV25B5DP
         hPYMagHIaemNrFaKaqnQ9zT3jq0BcKKSU8M7WVzKT4HOJOjgb/wz9eEFGtR+6YUAWpaB
         yaQrdvBgq7m5NpCna/WqpaZRRMNB5BXGTArsitlJ1V4G6kkryqDBf+nsCBB7bAvq7RRM
         IK3/i7T6p7X+26BKmQPgGPnQ1lATB3A3bgibt34p2MKfKIEexglwHyg2xIyVMEcKqka1
         poYA==
X-Gm-Message-State: APjAAAVHVNFjYUU2h2tTis1l0ssqPZHcI/Rk3CL1wdlI/WiNbKODj9AT
        nxz3lOOIMd93uhAqDu7PS7M3M0sR
X-Google-Smtp-Source: APXvYqxWrDCpwp2XKLAqn17OsS4W4bwVW/axSxwYhqkhNORm2BfihpaM3ixcXbRJ4TtMdoZcfN+eGQ==
X-Received: by 2002:a05:600c:da:: with SMTP id u26mr15028676wmm.70.1566831454269;
        Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/9] dma-buf: fix dma_fence_array_signaled
Date:   Mon, 26 Aug 2019 16:57:23 +0200
Message-Id: <20190826145731.1725-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function is supposed to give a hint even if signaling is not enabled.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..52068ee5eb35 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -103,8 +103,18 @@ static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
+	int i, num_pending;
 
-	return atomic_read(&array->num_pending) <= 0;
+	num_pending = atomic_read(&array->num_pending);
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
+		return num_pending <= 0;
+
+	for (i = 0; i < array->num_fences; ++i)
+		if (dma_fence_is_signaled(array->fences[i]) &&
+		    --num_pending == 0)
+			return true;
+
+	return false;
 }
 
 static void dma_fence_array_release(struct dma_fence *fence)
-- 
2.17.1

