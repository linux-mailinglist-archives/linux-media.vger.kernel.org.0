Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C91A2D9D6C
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 18:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408435AbgLNRRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 12:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408436AbgLNRRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 12:17:10 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D922DC0613D3
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 09:16:29 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id y23so15993650wmi.1
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRN0z60un1ifSPLbySVjb7+rlXQHLXQ5MW3xHVZvsMM=;
        b=URqQYIJXeztX8BOCxtBMlauz1+Vynw9xFyndnNiXU0aLHkS9SuvL7+/CwyT17GWAIL
         d9ZYiNmkWt+rwFCve9O7Hyg8Pc4rT7DKTTmeVu/JJIQFC4pHDE2+BuZa9Dunn9W7JjVE
         +mOqu4hqxI8tbCzM5gJ3X8BJdllgPMez8y3GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRN0z60un1ifSPLbySVjb7+rlXQHLXQ5MW3xHVZvsMM=;
        b=HEKIFk0gj28dRXbnfkIImKG6qNhQ1hJM+TkizYkW1jMBmXdvvnvkJ2SiTcfiHKRa/K
         jkUuCXBzM0Qf0e9UnUpRKNTpGhsm4aOv52anSsbZYhNT2SS7VtuMUc/33c/9RAVHSg+V
         FbC3lSrq3fLyfuhWsxCm65kcedvVX+GtJvfD1Xrg3z5/Kx5kqvJhrbkR9AdE+39C4m0B
         426Wq2xY5fqQhlUGiFqaS2Xg2trT0NZZ0v4fw7FZuXsCfiX1kAfk/C2PTvR8nJ4Rqt20
         65yZM7wxbsRi35oCCXHHUdbM/XAJ59cS0w+d07u3aKB6CDtD71evjZ7d33b5SEhpbuJs
         HIVw==
X-Gm-Message-State: AOAM533fNQR9YW5W/zvzCKUb0GXccNR5BiPWri+uavl1nlM3bMs04NF5
        Eoc/8Q6CWhy0fGHcgZrsQ7sU7A==
X-Google-Smtp-Source: ABdhPJyGfZtDmUmapTM+sOrlmOBNqPBbHYPIUUmXhWR281DX6bsCafZ7lmMKmmEBZoTwqyWsC5MzCg==
X-Received: by 2002:a1c:e445:: with SMTP id b66mr29461172wmh.187.1607966188676;
        Mon, 14 Dec 2020 09:16:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q1sm31197005wrj.8.2020.12.14.09.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 09:16:27 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: begin/end_cpu might lock the dma_resv lock
Date:   Mon, 14 Dec 2020 18:16:22 +0100
Message-Id: <20201214171622.3868883-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
References: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At least amdgpu and i915 do, so lets just document this as the rule.

v2: Works better with less typos (intel-gfx-ci)

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/dma-buf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e1fa6c6f02c4..a0a02ef888da 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1118,6 +1118,8 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	if (WARN_ON(!dmabuf))
 		return -EINVAL;
 
+	might_lock(&dmabuf->resv->lock.base);
+
 	if (dmabuf->ops->begin_cpu_access)
 		ret = dmabuf->ops->begin_cpu_access(dmabuf, direction);
 
@@ -1151,6 +1153,8 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	WARN_ON(!dmabuf);
 
+	might_lock(&dmabuf->resv->lock.base);
+
 	if (dmabuf->ops->end_cpu_access)
 		ret = dmabuf->ops->end_cpu_access(dmabuf, direction);
 
-- 
2.29.2

