Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D319458D06
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 12:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhKVLLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 06:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbhKVLLk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 06:11:40 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5751FC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 03:08:33 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id h24so13562746pjq.2
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
        b=APqXzT+zadmpYq9XewB4Hxtxw2cFZymST7E4a8Ff9UdwuRgpWx9lTe53jJVda6Adu0
         KQO96VWw9lOKubLh15GUKl2EWg3hZ4kYQwOeqXIRENbzfM8e/bE4HOEM1vUApRpUmHZX
         HtuTHt/R+0RwD8/bQ2zy5/TXGRtZzjNxZZKe3mVv5liLwRC3jL1cwRDaJ7e9um/te3wh
         hlkH1Zm+Zs4lV0jPODxLw0ubCpIV9TDCGAOEjST4TsMv6GOAlX/5fcHMy5O5rBmjNyt8
         3UK+axs8zvTmpRSietmqLcjCO1SRGUHaxOpsajyPEGdygQlCX0OkPqgtm43URr7qGsIu
         qqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
        b=kZ91vlYR8XYmV72ZTkHxx+O+pn2bQ9WscNQaCPXAm8RgDsqRnQjGu4+9JTg439pCAU
         1FoEZB5OtOtt/pP+KPWCNyS4v8ZA77/B7dVKsZ7iCuMeVvHwXG/64QRG5yv8PhzvRRb+
         jI+9LDlJJs6Gadw8wMLaOiHX9Ht9+wm7qGHP7e7mTnFdQ8CnuPTe8d6N3E6F+4ihMo1B
         oyeIRej0h3a3KXkDqLPvB9w78OyK/lJH+GfekohhMJ6yp61CDZHNEoiV5RzNabpcLe9/
         CmHYY1mTFZJ50x7BJSbEMUkGv64qVG5JKoeR0vnF0T3YURnMmSdppsanmmNcUgKg9PEm
         79DA==
X-Gm-Message-State: AOAM530L6yOaLVQdhw1HY+67P7sf/ceGWFNb6sp8ZK0cg77pz+OXQpBX
        SBbJOHubs4Cpg3ESSOA/z00c1G+778HRuw==
X-Google-Smtp-Source: ABdhPJy9uqTeKGDE2WvyoBL+W3QZz3Y0/gkcwR4vQfRwPr0FI5APvxamrkxamDcP1aJbG1p46s9cEw==
X-Received: by 2002:a17:90a:5d8b:: with SMTP id t11mr29665906pji.8.1637579312795;
        Mon, 22 Nov 2021 03:08:32 -0800 (PST)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id h6sm9572816pfh.82.2021.11.22.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 03:08:32 -0800 (PST)
From:   Shunsuke Mie <mie@igel.co.jp>
To:     Zhu Yanjun <zyjzyj2000@gmail.com>
Cc:     Shunsuke Mie <mie@igel.co.jp>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jianxin Xiong <jianxin.xiong@intel.com>,
        Leon Romanovsky <leon@kernel.org>,
        Maor Gottlieb <maorg@nvidia.com>,
        Sean Hefty <sean.hefty@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
        etom@igel.co.jp
Subject: [RFC PATCH v4 1/2] RDMA/umem: Change for rdma devices has not dma device
Date:   Mon, 22 Nov 2021 20:08:16 +0900
Message-Id: <20211122110817.33319-2-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122110817.33319-1-mie@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current implementation requires a dma device for RDMA driver to use
dma-buf memory space as RDMA buffer. However, software RDMA drivers has
not dma device and copy RDMA data using CPU instead of hardware.

This patch changes to be hold a dma-buf on struct ib_umem_dmabuf. This
allows the software RDMA driver to map dma-buf memory for CPU memory
accessing.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
---
 drivers/infiniband/core/umem_dmabuf.c | 20 ++++++++++++++++----
 include/rdma/ib_umem.h                |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..ebbb0a259fd4 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -117,9 +117,6 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (check_add_overflow(offset, (unsigned long)size, &end))
 		return ret;
 
-	if (unlikely(!ops || !ops->move_notify))
-		return ret;
-
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf))
 		return ERR_CAST(dmabuf);
@@ -133,6 +130,8 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		goto out_release_dmabuf;
 	}
 
+	umem_dmabuf->dmabuf = dmabuf;
+
 	umem = &umem_dmabuf->umem;
 	umem->ibdev = device;
 	umem->length = size;
@@ -143,6 +142,13 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (!ib_umem_num_pages(umem))
 		goto out_free_umem;
 
+	/* Software RDMA drivers has not dma device. Just get dmabuf from fd */
+	if (!device->dma_device)
+		goto done;
+
+	if (unlikely(!ops || !ops->move_notify))
+		goto out_free_umem;
+
 	umem_dmabuf->attach = dma_buf_dynamic_attach(
 					dmabuf,
 					device->dma_device,
@@ -152,6 +158,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		ret = ERR_CAST(umem_dmabuf->attach);
 		goto out_free_umem;
 	}
+done:
 	return umem_dmabuf;
 
 out_free_umem:
@@ -165,13 +172,18 @@ EXPORT_SYMBOL(ib_umem_dmabuf_get);
 
 void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
 {
-	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+	struct dma_buf *dmabuf = umem_dmabuf->dmabuf;
+
+	if (!umem_dmabuf->attach)
+		goto free_dmabuf;
 
 	dma_resv_lock(dmabuf->resv, NULL);
 	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
 	dma_resv_unlock(dmabuf->resv);
 
 	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+
+free_dmabuf:
 	dma_buf_put(dmabuf);
 	kfree(umem_dmabuf);
 }
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 5ae9dff74dac..11c0cf7e0dd8 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -32,6 +32,7 @@ struct ib_umem {
 struct ib_umem_dmabuf {
 	struct ib_umem umem;
 	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
 	struct sg_table *sgt;
 	struct scatterlist *first_sg;
 	struct scatterlist *last_sg;
-- 
2.17.1

