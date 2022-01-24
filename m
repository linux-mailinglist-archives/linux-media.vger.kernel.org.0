Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B224979A0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241878AbiAXHkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241902AbiAXHkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:52 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DD1C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:51 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ba4so11802666wrb.4
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=bAyiVbeL0O/tXrVEJoufHk2hMCElT7PNsdTJZ4q1rRynh+wz81LxDxU2r01Iym6VVt
         sVaIcM92UfKeJDnXO1Rf5z9TcBW/Vk/SwAaEpaYkTSaEuuaHCorczWFU5dpVe3QpJvHm
         8zXVgegBY1i23LrTU+T4IeYqBE9fHWevOENAlblziqtjiZuR1bpy76Pc17hS0zZtwRLX
         AWzZKJgOMcDr5lf946FqoFkO8RrLddgwIys8pL6IrbBIZoxCcQ3fSJgYZZIONsCYPamM
         2H9wdS06v75M6zo3keQG/CY/o3fMpE9zYPSubQjmQ9a0Mft+ASlJAz5l0KsEYKE/D5pS
         G/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMvNPKP34hAKYGcpxJqq3LnQ/oLcKhJxLzf1TGkhp7o=;
        b=GdlcrRtzHKaUqDTxdPAcDNIskVCPHSad5yIeVBig3W90xIAtWl+79okdCIXO8Fl0eR
         CCmKhTf7BVMa4N9Pw4HIZN6EBfMujl7OD7xEILNXv1JtEaJ5wHs/BYf8v6hTkEPIz9AF
         PCJsWWrl3m3awsyyU2eTbQ7/lZ04BLAR88Ugu2KeeSwgWx6NFZv0zgVfdCVfTumNwZ31
         o8D4AT9hJLpM4Zu6MHRmB/dMHm5ibeJCKo4YGwPv7hCnbuh6Oi7OZOqZMtp9qEXwYAgN
         ymveg4SwCvzuX/v5JAOd83cbcir7HsrWQRXhWonFZVhsvxEg0nS4jkUu/J7koIAJtNpZ
         TcjQ==
X-Gm-Message-State: AOAM5329LUVACBR0T+tIP4lrv9FcGtZdJ4ViOdKLJNSVhFAjodwqk0Dv
        BV2Kpt8bOsmzqBHa1aSsQsg=
X-Google-Smtp-Source: ABdhPJy6f2RHhcqqgDM9WwFjE7EjUM8xU24oiTj68CEJVDxm+pU6cyKrOR36zVZu7Z9+3QZY9dF4Dg==
X-Received: by 2002:a05:6000:18a1:: with SMTP id b1mr5366493wri.608.1643010050406;
        Sun, 23 Jan 2022 23:40:50 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:50 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: warn about containers in dma_resv object
Date:   Mon, 24 Jan 2022 08:40:41 +0100
Message-Id: <20220124074046.4865-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

