Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E7A2DB646
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 23:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgLOWGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 17:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729845AbgLOWGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 17:06:08 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD321C06179C
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:27 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id w1so555892pjc.0
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lf3OWtQTMarfh+qKkUU+h4c6HMQ0ofK4k7yhmGxtgVU=;
        b=p2xXtJcd1aUEKVCpL/yh2zHAnUKUnnWwn3KT6xcvB1fmMbzbubeWxt0UWpAi+SHPkn
         Da0r6htfgSPk5GT5zFUAvAj9HKR9J/Xch76+SmRleDTarKBdtiMk2hQKTvM2ii03hq0R
         KNe5XFm+uN9nHsrs/7fQbU9hUvdU3DtCbiAiwhRgzj3BW22qCPr9aYCowWWF0o7lmeHN
         +uogQn6HoNI5bOkFqfS5YsBABPcVWeaO+cM8PfuMoVcYTBSXwRPkxCrLVmsuC5+LeIz8
         GzNv13iEIXL2wrU8aqMcQJHQ4KKslM/A9tB8ab472EDm6JX7WFfZA7OLoEMeqNJ/NIEp
         iClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lf3OWtQTMarfh+qKkUU+h4c6HMQ0ofK4k7yhmGxtgVU=;
        b=FTuFX+TK0K88OZV6hAF6S6sBzdays9K9OzshJRr8qU5e1tx5uqMoCb5zf4cO2d+iNr
         7f5t2GwPd9qKSCKsRgAtWZehqKDWlDSVmqul7jNoZO1j+VCNqFeOQIBxZxk/cHhZXeEM
         WqIW1YjMGQioONXAOE38iK8szgjt9xHpdi4gOYXXh9xM9pPDD1QLoFCP7FuNcQlltubR
         rPCA5EZ4pAMppd7i969ELiy+SwY83VlJOg0+dVdby54AFn9liuRsd67xMpiYp6OIOKDL
         xfL8d+BAGbI2gutjOmFj8A9T980LdcujHjQuYgZAUMEHeubvqVE8P7S/LIaZSi3HbpL5
         PJKg==
X-Gm-Message-State: AOAM530YFBoweWiOgAtizLXGSi69uEpGk/5v1Y/ATbKTuMgppiVnSQgS
        QQyTB4ftV1LiDCnBTwXkPK9i8Q==
X-Google-Smtp-Source: ABdhPJyZFB1G/FH9A4ea1yRVC9wsxNuo+mlDEpj4WlbhDeCAewfVGAqiU5A0MycX/M2qOvrL95WZ2A==
X-Received: by 2002:a17:90b:50e:: with SMTP id r14mr679493pjz.90.1608069927363;
        Tue, 15 Dec 2020 14:05:27 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id x15sm84146pfa.80.2020.12.15.14.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 14:05:26 -0800 (PST)
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
Subject: [RFC][PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the vmap_cnt go negative
Date:   Tue, 15 Dec 2020 22:05:20 +0000
Message-Id: <20201215220521.118318-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215220521.118318-1-john.stultz@linaro.org>
References: <20201215220521.118318-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We shouldn't vunmap more then we vmap, but if we do, make
sure we complain loudly.

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
 drivers/dma-buf/heaps/cma_heap.c    | 1 +
 drivers/dma-buf/heaps/system_heap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 5e7c3436310c..877353e8014f 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -231,6 +231,7 @@ static void cma_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 
 	mutex_lock(&buffer->lock);
+	WARN_ON(buffer->vmap_cnt == 0);
 	if (!--buffer->vmap_cnt) {
 		vunmap(buffer->vaddr);
 		buffer->vaddr = NULL;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 405351aad2a8..2321c91891f6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -273,6 +273,7 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	struct system_heap_buffer *buffer = dmabuf->priv;
 
 	mutex_lock(&buffer->lock);
+	WARN_ON(buffer->vmap_cnt == 0);
 	if (!--buffer->vmap_cnt) {
 		vunmap(buffer->vaddr);
 		buffer->vaddr = NULL;
-- 
2.17.1

