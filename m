Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04DD5605FD1
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 14:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiJTMNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 08:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiJTMNb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 08:13:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A244015B126
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id a67so29557788edf.12
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 05:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzSxYsG4b4l+I9q2QIs0U4YnHUtpdMnLVfBoeSrQrAc=;
        b=jIYrU7+t6O0+MOllWK+5mFCQMiOi/kRWuMhz3cY4alWWXmJLWcFMrHIqgYpApPm7rV
         w5gnQSyraFv6vlSxkrFxE/z6BH2AriwBL0nqbkLvB92duSwkVfBWFH6JxUAu1g5ugSV4
         SEkz6WhzGTTTKG82PHYo5d64WY6PyQU9xaUdmVqi45fnr5pqXYxvQN/m5uzUoTh8gQHB
         4e16i8/MIxm5Mcq/qeSjTxc2dXHtuDaB/PNaL7GYEQOBJp0E9Vb2xrpra+tWs5fqWogd
         yWC+B8e+1kIQYwycccp+zWvZRXO14+Gjwej51Ggu5qqmALXlRZZuU5D2zETpzsOR1R5S
         IS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzSxYsG4b4l+I9q2QIs0U4YnHUtpdMnLVfBoeSrQrAc=;
        b=FwfPNi5g2kisbwooOPaK88tqdd7i2JUcAMlp15o91Q+XC3unyVrCq5gTB14PjOn0zo
         Q/i7puz0mHy5tAXpyXYJCi+lvcHlhWm0nqThuEAxiErEv+2/GuPX+kDymLiTBqFPOots
         xgvTxVMUHGcyUqS3b+nQrQpwxotk7fv0qKwaKf7lWe03d6oAKYhU/1p09iwlY7tR6nZc
         mdRM2b2Geb5lMcfJ+6TA0w1wAPs882r02SBu7P/kV9o7vmFLV3fzCnSgsk9UsOapxc2t
         xVkPZGxM/oYmVE417voAh7zRSLZ/YP0p2V3+ZyEs4LOegnTOfd9HdYPqcq/iYAV/oNr8
         Vjng==
X-Gm-Message-State: ACrzQf1LmBKiKvHo4fpBdE8MZJBToPhhpLPaTU/FGxdWG99+W7JESuIo
        tmQ5OZwt7/nZmPBjyF6RvqE=
X-Google-Smtp-Source: AMsMyM7Tr0exJWZIHe2hajABmGUD0VYCZ5U27TZBF0a1r7poeOtlWKVajuBZT4re8KtHczrCmIgQ8Q==
X-Received: by 2002:aa7:de9a:0:b0:44d:8191:44c5 with SMTP id j26-20020aa7de9a000000b0044d819144c5mr11711686edv.232.1666268007265;
        Thu, 20 Oct 2022 05:13:27 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
        by smtp.gmail.com with ESMTPSA id s15-20020a05640217cf00b0045467008dd0sm12091979edy.35.2022.10.20.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 05:13:26 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 3/3] media: videobuf2: set dma_coherent flag for DMA-buf
Date:   Thu, 20 Oct 2022 14:13:16 +0200
Message-Id: <20221020121316.3946-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020121316.3946-1-christian.koenig@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a device is snooping the CPU cache we assume that all importers
must snoop the CPU cache as well.

Execpt for vmalloc allocations since those implement mmap() imports must
always snoop the cache or we will run into coherency problems.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 2 ++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 2 ++
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 555bd40fa472..57433310c55c 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
 #include <linux/module.h>
 #include <linux/refcount.h>
 #include <linux/scatterlist.h>
@@ -507,6 +508,7 @@ static struct dma_buf *vb2_dc_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
 
 	if (!buf->sgt_base)
 		buf->sgt_base = vb2_dc_get_base_sgt(buf);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 36981a5b5c53..dbdd753e4a39 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -10,6 +10,7 @@
  * the Free Software Foundation.
  */
 
+#include <linux/dma-map-ops.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/refcount.h>
@@ -522,6 +523,7 @@ static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = dev_is_dma_coherent(vb->vb2_queue->dev);
 
 	if (WARN_ON(!buf->dma_sgt))
 		return NULL;
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 41db707e43a4..0b6874733e86 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -341,6 +341,7 @@ static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
 	exp_info.size = buf->size;
 	exp_info.flags = flags;
 	exp_info.priv = buf;
+	exp_info.coherent = true;
 
 	if (WARN_ON(!buf->vaddr))
 		return NULL;
-- 
2.25.1

