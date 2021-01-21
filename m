Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859E22FF28D
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 18:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387457AbhAUR4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389311AbhAURzz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:55:55 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80484C0613ED;
        Thu, 21 Jan 2021 09:55:15 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id j12so2116039pjy.5;
        Thu, 21 Jan 2021 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8nQ7vZePLiBr4AwY3n+MiyEOXEnc2UqVALdrd2awxo=;
        b=PVpV8V+s0wyvXhKyAIPSie0XgUgDIJQGqojYz53hp4jmRi5GJwvTzVJiYzHzAwaxP+
         tL3Hf4oxKufPJomneZrTCnhcasC4lil6Di9IvP1gQCbW/ReneiTOrtnen2GYgi78QPWc
         2u0VLyN+agWRvFgsJ5WB4tYzDpmsIJayReSKTcHMWJQcPHPp26WBTd4P1BYW0qdHQoFa
         Uks8tfAiQ1qZS0ebe4lh2D1ZZp/1pgkbWiJr506XrVWNgSa0bFETsPheHdcNn+xvw0dg
         Gn4iNfhnMyCv0kU4oX8y6/jPKoygMjwET/5AzqQuB/IG3svfpXUEXSjyF1v2CiG96qR5
         rA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=K8nQ7vZePLiBr4AwY3n+MiyEOXEnc2UqVALdrd2awxo=;
        b=NtM7Vs8jqaSnCEnYqoo4xiZNcs0w0Wb1wUrX1nL4oINsOCS4e9ZudT8aMIKDrrH4bg
         kn4heMKX8H3d+lBU5lsV3yvQ264i3W68ip/hLQ4LjnPhYZdx9jbHAkoP90X2XqJLNK1y
         KtnQd5FGktLGZ+RNVWyM27Nmy8uS4c6S/7PMCJKufEwDKRlSFFFSAW33DNuYsEzYBYk1
         soeqGGNfI0iWW/jcL1CZRXr0PDXYDBqXiclqVNtY2caF7Vvvxfr0ZdnVlIV/RnJKWLgi
         EsRa5Wp2PAPMbnvUaCLDAuTPn/9iQzizQQ4DfHgb425Ie2JmT0fnheKGtc2bpYrMFq9F
         pZjQ==
X-Gm-Message-State: AOAM532RDL0JiCJFldC9IDIeDZQCVTU7CHjxm7EFlrKkAv0DUL8s4/QU
        kkCF+J2Glm5zt+bKu7dKELU=
X-Google-Smtp-Source: ABdhPJwoClfcVILfT+MG/hOAtpiA8kxG4mvryV2nmV2o6uqTe/csRvO9CeiR4QmEKb0A/Qe1bAhjgA==
X-Received: by 2002:a17:902:b496:b029:da:d356:be8c with SMTP id y22-20020a170902b496b02900dad356be8cmr854145plr.56.1611251715067;
        Thu, 21 Jan 2021 09:55:15 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id t2sm6897317pju.19.2021.01.21.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:55:14 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v4 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA heap DT-configurable
Date:   Thu, 21 Jan 2021 09:55:01 -0800
Message-Id: <20210121175502.274391-4-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210121175502.274391-1-minchan@kernel.org>
References: <20210121175502.274391-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

Document devicetree binding for chunk cma heap on dma heap framework.

The DMA chunk heap supports the bulk allocation of higher order pages.

The chunk heap's allocator allocates from the CMA area. It is optimized
to perform bulk allocation of higher order pages in an efficient manner.
For this purpose, the heap needs an exclusive CMA area that will only be
used for allocation by the heap. This is the reason why we need to use
the DT to create and configure a reserved memory region for use by the
chunk CMA heap driver. Since all allocation from DMA-BUF heaps happen
from the user-space, there is no other appropriate device-driver that
we can use to register the chunk CMA heap and configure the reserved
memory region for its use.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
---
 .../reserved-memory/dma_heap_chunk.yaml       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
new file mode 100644
index 000000000000..00db0ae6af61
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/dma_heap_chunk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
+
+description: |
+  The DMA chunk heap is backed by the Contiguous Memory Allocator (CMA) and
+  supports bulk allocation of fixed size pages.
+
+maintainers:
+  - Hyesoo Yu <hyesoo.yu@samsung.com>
+  - John Stultz <john.stultz@linaro.org>
+  - Minchan Kim <minchan@kernel.org>
+  - Hridya Valsaraju<hridya@google.com>
+
+
+properties:
+  compatible:
+    enum:
+      - dma_heap,chunk
+
+  chunk-order:
+    description: |
+            order of pages that will get allocated from the chunk DMA heap.
+    maxItems: 1
+
+  size:
+    maxItems: 1
+
+  alignment:
+    maxItems: 1
+
+required:
+  - compatible
+  - size
+  - alignment
+  - chunk-order
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
+            compatible = "dma_heap,chunk";
+            size = <0x3000000>;
+            alignment = <0x0 0x00010000>;
+            chunk-order = <4>;
+        };
+    };
-- 
2.30.0.296.g2bfb1c46d8-goog

