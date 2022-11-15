Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5387E62A275
	for <lists+linux-media@lfdr.de>; Tue, 15 Nov 2022 21:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiKOUFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Nov 2022 15:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiKOUFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Nov 2022 15:05:49 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBC6C77A;
        Tue, 15 Nov 2022 12:05:47 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id l8so19004016ljh.13;
        Tue, 15 Nov 2022 12:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3n9eTzyovuImpyqmAEmozCytKhOiLUTsASX6dM4moQ=;
        b=SHSAvtomDRH42ON709sBLl59XSWVsQy34EfQhfVbSa08rIXrY84R4COytoYvMmr1D1
         e81p11b2gX1IxLp1Wk3EkpuupEzk/0g0oEX+s/Xo9NDE8m7Y/DrAO/I7u/1IQNqQ7brM
         z7GcVDKVktm0xwphBqywkq2JL0Sl/h/v9YrR/zfFOmyKDg1rGnrI3hYQTexcbuj67QiH
         2d7TPxNf1woM7AXMXa0qxMhpJl+sDCjl1+WpbKEPOB22Dkw3yERFVMZsq6xKyyzmvog9
         xMGJv7WgIGWmBi+2AlBz4d4c6vWTcA7c+xO9LI2oe1m94jw589WP/uY5i7EHwlS6RkEv
         Fr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3n9eTzyovuImpyqmAEmozCytKhOiLUTsASX6dM4moQ=;
        b=Lq1q8ORnzl5Ffx2u5NmyZ2smEv9Qo1pE8BK449OdaqBsRhlYe7ynCSNlhLTfMN8oFg
         2z53MXXAYs0X37fEDqT9q24eBWpZvviXgN7wgBD3benGy5nYZdfvt/hc17TUF2sWILZJ
         NX8w8KSBth4odZN4zcX3oWsowUu8jzs+0rkPl9MxW4/bdPusUVySS/RZ9ECHvdYnybEo
         P1IqfRYm7KGxxlV+EFry5Iqo9eyRP1DVej6eDbSP/KWJIVnIg+36Q9UdFv+RMKd92T2e
         my4fwKxRPpGhLvg+KSd7H888Ikv0+m6VZznlP2Q8G0/vedqDF9Z32Jo4VL4IMVCiRdIf
         0FhQ==
X-Gm-Message-State: ANoB5pngQaBh1x5o5IXbAbD0dxsEcdMGwGauRBrywtiTdNcJmst+pN1M
        uxexTv1TsFx7kzz3IaLNd6Y=
X-Google-Smtp-Source: AA0mqf5jt+shThPbnx0wtDVLw2x666FkmDvA0ANREZf/u2AiwQmmMNKF+SrjKK9g7V3hpCfvUArtew==
X-Received: by 2002:a2e:940a:0:b0:278:ecbe:ebba with SMTP id i10-20020a2e940a000000b00278ecbeebbamr6252965ljh.450.1668542745717;
        Tue, 15 Nov 2022 12:05:45 -0800 (PST)
Received: from localhost.localdomain ([78.133.163.249])
        by smtp.googlemail.com with ESMTPSA id h8-20020ac24da8000000b004ad5f5c2b28sm2308586lfe.119.2022.11.15.12.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:05:45 -0800 (PST)
From:   Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] udmabuf: add vmap and vunmap methods to udmabuf_ops
Date:   Tue, 15 Nov 2022 21:04:26 +0100
Message-Id: <20221115200426.4801-1-lukasz.wiecaszek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

The reason behind that patch is associated with videobuf2 subsystem
(or more genrally with v4l2 framework) and user created
dma buffers (udmabuf). In some circumstances
when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
wants to use dma_buf_vmap() method on the attached dma buffer.
As udmabuf does not have .vmap operation implemented,
such dma_buf_vmap() natually fails.

videobuf2_common: __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
videobuf2_common: __prepare_dmabuf: buffer for plane 0 changed
videobuf2_common: __prepare_dmabuf: failed to map dmabuf for plane 0
videobuf2_common: __buf_prepare: buffer preparation failed: -14

The patch itself seems to be strighforward.
It adds implementation of .vmap and .vunmap methods
to 'struct dma_buf_ops udmabuf_ops'.
.vmap method itself uses vm_map_ram() to map pages linearly
into the kernel virtual address space.
.vunmap removes mapping created earlier by .vmap.
All locking and 'vmapping counting' is done in dma_buf.c
so it seems to be redundant/unnecessary in .vmap/.vunmap.

Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
v1: https://lore.kernel.org/linux-media/202211120352.G7WPASoP-lkp@intel.com/T/#t
v2: https://lore.kernel.org/linux-media/20221114052944.GA7264@thinkpad-p72/T/#t

v2 -> v3: Added .vunmap to 'struct dma_buf_ops udmabuf_ops'
v1 -> v2: Patch prepared and tested against 6.1.0-rc2+

 drivers/dma-buf/udmabuf.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 283816fbd72f..740d6e426ee9 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -13,6 +13,8 @@
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
 #include <linux/hugetlb.h>
+#include <linux/vmalloc.h>
+#include <linux/iosys-map.h>
 
 static int list_limit = 1024;
 module_param(list_limit, int, 0644);
@@ -60,6 +62,30 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
+{
+	struct udmabuf *ubuf = buf->priv;
+	void *vaddr;
+
+	dma_resv_assert_held(buf->resv);
+
+	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
+	if (!vaddr)
+		return -EINVAL;
+
+	iosys_map_set_vaddr(map, vaddr);
+	return 0;
+}
+
+static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
+{
+	struct udmabuf *ubuf = buf->priv;
+
+	dma_resv_assert_held(buf->resv);
+
+	vm_unmap_ram(map->vaddr, ubuf->pagecount);
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
@@ -162,6 +188,8 @@ static const struct dma_buf_ops udmabuf_ops = {
 	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
 	.mmap		   = mmap_udmabuf,
+	.vmap		   = vmap_udmabuf,
+	.vunmap		   = vunmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
 };
-- 
2.25.1

