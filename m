Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C4549799D
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241853AbiAXHkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241806AbiAXHku (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:50 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A209C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:50 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id n12-20020a05600c3b8c00b0034eb13edb8eso2001531wms.0
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
        b=JHN6/biYR6rsgSz3WyO//6PDm/q/8LQIvmA3YasHnIKZrFL3TjAcTmyMNuKT5Bi3/G
         7954P/l9i9zNlzCuS2wFA9Dh2+v9wc8Lf6uHKRMuF+9tJEpWb26Bdo14y8e9A4PehBn7
         WDJDCE5RvXOG+3OV4tlFEnGS7uFDdB68WtNYP4K6rDa/lS8RGlQ2OKmo9u5qMfY4kshp
         O3XPkzBTi5NXPmYW5gMRLVqAtc5sNbWAjJFq11XQURfuCZ3WvxoZ+OVlhtw086htTd+I
         MDyjnCvI+m7FyB0H0kudzDdLh+JMxhAypoklvualZoGpO1pJgIJXyB0S7jioNJhUZZtr
         eZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CoA+r1KF28F1CAMI7pwE9OjWnR4XEafI/kYvKFT/pwo=;
        b=4hpQUWsl6EdsbXUYv0NB4mwTMwjS4wjkdFjmJFINKRBRRXs3xvAH7Jmw28hb+Cb++k
         JcAhcI7D/q5EBzW57IZ1FDHqcFJ2VlU8dkR1Cphf3Wz64l/LjzWy2y1Ax61GRZEiFf50
         +9N13C6FNMg18FqGvDqll0XVgpYtceX3Yljclj4nBfYEjx+jAZk5XD8AgYbTNheLtOL7
         mWuqQYZXJ3f4sRiIDXNRdvWGIvvIR+BkReKpupF3wPf1loPcKglBsiXaSZnR6dHxFRel
         YVS7B/J64fxNseSAdFVNspxpkjeW+vtDL86tAF9NrUq93gt/RjIHijl/V7kxO1Zkavsj
         mbhQ==
X-Gm-Message-State: AOAM5337FFzd8OFm2ZOkO+ClzkJWmuQoMVDLE9D5ng41yT4+M2+Fz8I4
        VIxDFpGc8hTYKvUwXPzBvfM=
X-Google-Smtp-Source: ABdhPJzcv7lRZbMGhd+k7E1Cx+likm9kmGU8+1pG9V8vLBdZv+Wbt7kpy3IymkIZyESK+zh4ET2BFQ==
X-Received: by 2002:a05:600c:1da2:: with SMTP id p34mr611776wms.97.1643010048736;
        Sun, 23 Jan 2022 23:40:48 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:48 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: warn about dma_fence_array container rules v2
Date:   Mon, 24 Jan 2022 08:40:39 +0100
Message-Id: <20220124074046.4865-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

v2: fix comment style and typo in the warning pointed out by Thomas

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-array.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..cb1bacb5a42b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,20 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/*
+	 * dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (num_fences--)
+		WARN_ON(dma_fence_is_container(fences[num_fences]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

