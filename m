Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9771C2DB655
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 23:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgLOWJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 17:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbgLOWGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 17:06:06 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2648AC061793
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:26 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 11so15311776pfu.4
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
        b=rOu3z9tr+Uz2Jq7hQygYWUdSEXOtqllnYQZVQ7JZLP52v4jZtyPKuSCT0emQd928OS
         UXnG68BiLFVU5IQzQhttHl4AmSfyq4yDqbxhYhiij0OuDGBNjOHsxUQJOL2bjrjqpAA3
         uWLxYS3XwS/5mzazbiFvZa8vT/fuF5R7qmq50x7vmbOV2O0fmGldMo5W7lynABBr46/z
         bUU18S0qjd5J8Cj4Jmtk47WRhH5lFCVNVOcfyk1aUkZnOwqy1g+wjd+OoHh/xSMjOz4o
         YI4ePM8sxnDoE3XI1Dkz0kH4YFQI6OJrdUOOEzkWr32/V/3WusqocYedGiK/BTdQyysH
         iD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/gCsWuNpJqoaKmXUbqD2yoFjbhOP/NQNls4IpQYcF/Q=;
        b=jn/rhpYQEzxfnmPu8ineM+GobjyoHA6SfwAVeVJSeuOkQTBlVdunbEv6fvsTKIu1sO
         qhdFxM2A+OK2tGpG4/yFFLQOO7kJ6a+AP1a9NwlnNHrF3HQGiiQeqhtwcuKAD5A/u/MK
         9kM4sU0ks98/T3VdIg0sEQ7lrhPt0q6NHd6dZpi/WOY9y5HEckhUi0Hmd2qhTL1xIqZy
         Ut6Pybcd5WRWK76I1//1KYYM9ZevAE5hvXZ+gRWmsO5gSHVrPRb8xVBOt6jyg/C/WCwj
         RMEtvnZRQpdk5d3VDP7m3HpGcN2sgEvdmqPLxzsCVVwj3p/s7vlsMpQcICb/bpY5bKOl
         sMvw==
X-Gm-Message-State: AOAM530icHp6S3KqjKhARr6bLmL56j9mi7Ktz2a/aZR/RxxH8idsHB8g
        xoHv0wWOR7X5H+hE+N3mCXIHDA==
X-Google-Smtp-Source: ABdhPJy/bv/dpSXnrXAIXAKPU25FtDrutI9TAwJhbjpo2R/NbvcsZmowxwswu/mRJpZaOEHPVHm+Fg==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr30386525pgl.348.1608069925721;
        Tue, 15 Dec 2020 14:05:25 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id x15sm84146pfa.80.2020.12.15.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:05:24 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 1/3] dma-buf: system_heap: Make sure to return an error if we abort
Date:   Tue, 15 Dec 2020 22:05:19 +0000
Message-Id: <20201215220521.118318-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If we abort from the allocation due to a fatal_signal_pending(),
be sure we report an error so any return code paths don't trip
over the fact that the allocation didn't succeed.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Suggested-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..405351aad2a8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -363,8 +363,10 @@ static int system_heap_allocate(struct dma_heap *heap,
 		 * Avoid trying to allocate memory if the process
 		 * has been killed by SIGKILL
 		 */
-		if (fatal_signal_pending(current))
+		if (fatal_signal_pending(current)) {
+			ret = -EINTR;
 			goto free_buffer;
+		}
 
 		page = alloc_largest_available(size_remaining, max_order);
 		if (!page)
-- 
2.17.1

