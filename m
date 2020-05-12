Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682D41CF0D7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbgELJAC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729243AbgELJAA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:00 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97998C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 01:59:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id m24so11242065wml.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLx974NIZMqcTtktEjSZjvXzGFT/sN3zaOFqis6ynJ4=;
        b=XMONIu5DP+HMrApNuuxLBjrSt037rXZt2ZOk8MGJnrPXZwZxjQNgepQNY5FaUlHKzp
         NnpLCK27EuKk1i4zc5dJBZgXUUO+sBRUwyP2QJzh8l+TxbAyY+2UG2eYiOM+AqnUuE2h
         cBEWsoEqk///Vn/WtO2wLLNhQxn15H9TRBZ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLx974NIZMqcTtktEjSZjvXzGFT/sN3zaOFqis6ynJ4=;
        b=ETZJoa+4uIEckhG10K/WIZodhNb5W+oQVnqla4vMgCUsQTymx4FH4SC6fVFYn3RVi/
         dQCAAMOkQJnY46+rVUmjIVhl7tHUhlOS9is0//8fLrjJAzA+WyBL67P0anXlB7xQR4Fh
         d5dfu/mwOef5weYsg3MxM6aOF38of2hiBsJHqs95e4DjVXnLKZQ36nYYwv3lCzZxZ5Kq
         RjxV+6ZnYxuWnSzpXU9H9ghmaw9Fpj9H5z1+4Ovf5WPkleP1+yLlRJff+D9ZmIfOkyG8
         1FRq+8ckk6Fgxxk5AJ0CVYrg5+9FCVv8tiQQmoIB1rhK9c2wzwPgMM/YW2SYpdDySRT4
         OwkA==
X-Gm-Message-State: AGi0PuY/qYFlhk/hzrYva60UKeiW6fQ6bHgT85rf7zm/n3i0P4bZXFgP
        L68ASY+Dx+yk2YkQbEJYS3hCFsY9fMM=
X-Google-Smtp-Source: APiQypLaGju2WZXVsNW4k3kb0cNDedDZi8kpgkf+bDmSvA+Y9bm9G0CROCbMCdeWzLKRHchbjRrBkQ==
X-Received: by 2002:a05:600c:2dda:: with SMTP id e26mr27240272wmh.42.1589273997304;
        Tue, 12 May 2020 01:59:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:59:56 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [RFC 01/17] dma-fence: add might_sleep annotation to _wait()
Date:   Tue, 12 May 2020 10:59:28 +0200
Message-Id: <20200512085944.222637-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

But only for non-zero timeout, to avoid false positives.

One question here is whether the might_sleep should be unconditional,
or only for real timeouts. I'm not sure, so went with the more
defensive option. But in the interest of locking down the cross-driver
dma_fence rules we might want to be more aggressive.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/dma-buf/dma-fence.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 052a41e2451c..6802125349fb 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -208,6 +208,9 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	if (WARN_ON(timeout < 0))
 		return -EINVAL;
 
+	if (timeout > 0)
+		might_sleep();
+
 	trace_dma_fence_wait_start(fence);
 	if (fence->ops->wait)
 		ret = fence->ops->wait(fence, intr, timeout);
-- 
2.26.2

