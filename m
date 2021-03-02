Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA8A32A854
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580176AbhCBRab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445224AbhCBC5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 21:57:16 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15832C06178A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 18:56:36 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id ba1so11182530plb.1
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 18:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+IZNoE4E9l3eWMVT2Obt86H5jq5BW9DleHnD2g9iNvw=;
        b=ZxZq/smZVpC9WlNe4MDL4pHr/HTA8pP44i22GmGeqCqsuxStxJ4pS8cxERjZNkuZJv
         8ThxGCSXUkL8yTS3EGUx59IAQU79hIJHzEhVtZgCwJzx52YmlJnwYycZSCG6YihxCgp1
         izaFAkOo5+o+BgIGuJGfhK7cHViZ9bhCuDpSQWQXWEotbeWx5+54lYZ7tYs19GAjAnsj
         alU2a9xA68rEEvsHLTC178xs2Qu07kCF6dB/DdNVP/xGoZDAh3TMTyLjOtg/14rbwUDR
         7khnMT7o0YBRpOWwaNWaRCcFoONoegT8TGGUL2zx9WGRlys1kU0qhrA37BbmvamwGydq
         alPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+IZNoE4E9l3eWMVT2Obt86H5jq5BW9DleHnD2g9iNvw=;
        b=UD4XM5wFROYHNoHFUkE6Szkq2i6x2ym+50azbvPuACslGn8vczyhbNPTLr9eQLYdzU
         SVo7VMkJszgQxG6UiE9cc8qt1PxtL9VEHxdr6p/nwzOE6SK8VGSeS7v7syNIjw+JPiyb
         lyvv5XHpBizus/aay7QeS3spcl5yPcGjMmDQmJFHBzQG8XsK4pEkM+X7R/hTl5S5DaK7
         D67/Kvqdm2Vm5m/tU3176JUpv4JhAbl/nv0+yDGs6Cf+qkbxBxtT2jrmpBGMkNZVxemm
         K5JbM+9J2my4pIfCObz74DKnOiGxQclmjBavJ8nbN/TKNsX5tTxzjgKeTojb0j6QT3ln
         OmTw==
X-Gm-Message-State: AOAM5301f2dgLJUxd6hW19XBGy9QUJh1LF7ENGtzJjqiRtRVtCNhHleh
        BU6QYf9kr84EoF2EcW+bjnF/6w==
X-Google-Smtp-Source: ABdhPJyBS9U+6AtdKNABLhwXXCBgjsOObPODZW8Oq9QBLmZ5tZ2NDADOH8ib3q/xB0NcIvIbDYUzig==
X-Received: by 2002:a17:90b:3890:: with SMTP id mu16mr2014337pjb.9.1614653795608;
        Mon, 01 Mar 2021 18:56:35 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id r16sm18928400pfh.168.2021.03.01.18.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 18:56:35 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RESEND][PATCH v2 1/2] dma-buf: dma-heap: Provide accessor to get heap name
Date:   Tue,  2 Mar 2021 02:56:28 +0000
Message-Id: <20210302025629.2558215-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It can be useful to access the name for the heap,
so provide an accessor to do so.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Make sure to use "const char *" as Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/dma-buf/dma-heap.c | 12 ++++++++++++
 include/linux/dma-heap.h   |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 6b5db954569f..56bf5ad01ad5 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,18 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 	return heap->priv;
 }
 
+/**
+ * dma_heap_get_name() - get heap name
+ * @heap: DMA-Heap to retrieve private data for
+ *
+ * Returns:
+ * The char* for the heap name.
+ */
+const char *dma_heap_get_name(struct dma_heap *heap)
+{
+	return heap->name;
+}
+
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 5bc5c946af58..0c05561cad6e 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -50,6 +50,15 @@ struct dma_heap_export_info {
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
+/**
+ * dma_heap_get_name() - get heap name
+ * @heap: DMA-Heap to retrieve private data for
+ *
+ * Returns:
+ * The char* for the heap name.
+ */
+const char *dma_heap_get_name(struct dma_heap *heap);
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info:		information needed to register this heap
-- 
2.25.1

