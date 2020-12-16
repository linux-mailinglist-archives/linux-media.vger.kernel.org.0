Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DB72DB7F3
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 01:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLPAuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 19:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgLPAuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 19:50:16 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C875DC0613D3
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 16:49:36 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id s21so15506287pfu.13
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 16:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKR4bPj+0an3d7yDezFmd6g6UgR/obAMB14Y7RLspck=;
        b=yq7gvFhVfsWJo+zmY4hoB9pnJ8uv4hOMEUXxPxzDyY6PT5gUiJ1INcEprFl4kAo2Pv
         QhBL52aN6JVteOJoWFo5AIGwb3EH7uM9OOnOVIFbLzfMjbk3txQg8ZCuyB4F8aQ1baYl
         002JC8jXKFq/zM4bR4nYghem24cu8Ux8/0kEU6Dwr79aEO83WV1+fIxhdJrBDX5FzJUT
         1ysRfgre6Vicnrou/JmjzMxM3JvKjZVNMUml9bk143Q775RStdJR5C61EcabGmOwIyRs
         skmq+rf145/CPRY3iAvBpzDZ2FzbnlE+h2FLn+SbPYxR3hhMrOAPtGQiohr0BcZl+sN7
         Uj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKR4bPj+0an3d7yDezFmd6g6UgR/obAMB14Y7RLspck=;
        b=HDs2a5wbmBH2RI6cKK0/QMCmcOBqedaKG9w/Keg214UZclBSWp7AOw5PgKPpTunaS+
         wdD7uY/ph/znfEGPTGfdJ4fX62dNhip1SIZ4c/g6VXO1y2/MflFy4j07YmXsSQqVa2e7
         DfWKw9jUMeuJ6EDwH++WU8NCrW1nH74+uwNmk38LwPV2qEw5vjF2fRfU6Yy9a5A5c8MU
         crWArFtAdA6Q/AaNEZ4W+EsCawVq+OuFH9sVU7zAn5NbzX67dVBUOEi0a0IzKi9sqWKu
         dOnl+Phxn0cwpwSoql5320vHIpMPiNxTFaugNoextG4alSqFY6uDxIap57glHxsUgrxZ
         aeQw==
X-Gm-Message-State: AOAM5317V1nseCQVZ6ceE6p2H5k8TgHWDs3MTMlnNqRkg4oc31PuxDeP
        VTta/NNdlFcowWTT4gFKy7kpjQ==
X-Google-Smtp-Source: ABdhPJyVbSdm2BRxuBQ11smLi/qlMz2NC4iswF5AXPde4Afv1/cEnbAlgSBqJzdKLY1agZLuKV0iLg==
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id n25-20020a62e5190000b0290197bcec7c0cmr30530762pff.63.1608079776360;
        Tue, 15 Dec 2020 16:49:36 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k14sm166322pfp.132.2020.12.15.16.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 16:49:35 -0800 (PST)
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
Subject: [PATCH] dma-buf: cma_heap: Include linux/vmalloc.h to fix build failures on MIPS
Date:   Wed, 16 Dec 2020 00:49:31 +0000
Message-Id: <20201216004931.113505-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215235334.GA227480@roeck-us.net>
References: <20201215235334.GA227480@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to include <linux/vmalloc.h> in order for MIPS to find
vmap(), as it doesn't otherwise get included there.

Without this patch, one can hit the following build error:
  drivers/dma-buf/heaps/cma_heap.c: In function 'cma_heap_do_vmap':
  drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'

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
Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 5e7c3436310c..3c4e34301172 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 
 
 struct cma_heap {
-- 
2.17.1

