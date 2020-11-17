Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628D02B6D21
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 19:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731312AbgKQST4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 13:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730534AbgKQSTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 13:19:55 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2577C0613CF;
        Tue, 17 Nov 2020 10:19:55 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f18so16563831pgi.8;
        Tue, 17 Nov 2020 10:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FbR8FBZ8v9oRIOK3rZ6XdWYjeIbKFf31XDvQwkSkmGg=;
        b=ONymwN4v702ZwagKvnMijNuBl6CFcG6m7iSi/X/p3JHQERk+7YhRRnwIsAQnzbzLrn
         JszoxS2Govb2yKO3jW7iuS6PpImRZPjbxPC21Stn1Pp+mYa+oRhcodUSyxKYBxWhanf8
         Nf6U1Bh38Ij8hrlEWj3tacl+yhlsE82tB3P1oHIv4MLpFGgFjSKIZUV69pDHusbBWt2U
         iCNCCHZWZj3ibUzIZP5mkcY03yF7ceeljrKL03zVouTD9zdw0lvKP//ukKZaVh52XC+e
         Wp4HWWtYV2F7XkuK13BPNKQhGkYONBSiE8gNSU1BiuWGXNBZZWxV6kmVVofoQu1slgvI
         Tluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=FbR8FBZ8v9oRIOK3rZ6XdWYjeIbKFf31XDvQwkSkmGg=;
        b=RJ3Klbw2ymcZDPDBMj5cKf0cdohx3E360G+pojgd4XWJjloDlr+QJjj7R9MWI9Hqz9
         whdAnLAjUv12y5HZMqLc7YYDx7JoC/XxdJ8/FEytU0S3E241D0wQJ9Ki61v/jv7PSfOn
         6bRj9e0rxlaA2s7yLJjD5PIYweu0BmXiVFZzZ4JDw6T4XIrPopbOeTh4qy/s+geHFnMY
         ZmS482/GD8Wy18o9ae+W+nQlhctBEMo5ZvRqyZtA282jXYpfvNC8vg67+5x5Y2MZn3Is
         PC18nhqco4LvCCtgcJ/0K8Cr9NWSy7ZzQ+t0wbEU73oEZ9hIe2JbOYxKsndJkf9He6WX
         zAKQ==
X-Gm-Message-State: AOAM5324katgqzXD7EEcj+c3xrykP9mjuMXo6JPvPSo6C8Yyv4q8PxWS
        4BqcaKsk+nJqSPsgXLkWxgU=
X-Google-Smtp-Source: ABdhPJx4cA1WlpSWJrNjJCeWkhFiCJNtehbF8opfuAbfGhq3jrdOy0v8F8YQec3puI0Q8HXVwmFOVg==
X-Received: by 2002:a62:d11b:0:b029:18b:b3e:95aa with SMTP id z27-20020a62d11b0000b029018b0b3e95aamr554667pfg.3.1605637195227;
        Tue, 17 Nov 2020 10:19:55 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id h8sm4302639pjc.54.2020.11.17.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 10:19:54 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Date:   Tue, 17 Nov 2020 10:19:35 -0800
Message-Id: <20201117181935.3613581-5-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201117181935.3613581-1-minchan@kernel.org>
References: <20201117181935.3613581-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

Document devicetree binding for chunk heap on dma heap framework

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 .../bindings/dma-buf/chunk_heap.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml

diff --git a/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
new file mode 100644
index 000000000000..f382bee02778
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma-buf/chunk_heap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
+
+maintainers:
+  - Sumit Semwal <sumit.semwal@linaro.org>
+
+description: |
+  The chunk heap is backed by the Contiguous Memory Allocator (CMA) and
+  allocates the buffers that are made up to a list of fixed size chunks
+  taken from CMA. Chunk sizes are configurated when the heaps are created.
+
+properties:
+  compatible:
+    enum:
+      - dma_heap,chunk
+
+  memory-region:
+    maxItems: 1
+
+  alignment:
+    maxItems: 1
+
+required:
+  - compatible
+  - memory-region
+  - alignment
+
+additionalProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        chunk_memory: chunk_memory {
+            compatible = "shared-dma-pool";
+            reusable;
+            size = <0x10000000>;
+        };
+    };
+
+    chunk_default_heap: chunk_default_heap {
+        compatible = "dma_heap,chunk";
+        memory-region = <&chunk_memory>;
+        alignment = <0x10000>;
+    };
-- 
2.29.2.299.gdc1121823c-goog

