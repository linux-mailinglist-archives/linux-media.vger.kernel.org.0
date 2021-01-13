Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CB72F4123
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 02:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbhAMBWw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 20:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbhAMBWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 20:22:40 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415FAC061795;
        Tue, 12 Jan 2021 17:22:00 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id h10so201131pfo.9;
        Tue, 12 Jan 2021 17:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moLKqW8sUzdDe7Tu+bx0keAxg66CW63q9xlqRNBYrrA=;
        b=XUDwakez4EGE0+imMc50hGx3ds5QMmtB9M5WblPQvBHRhPN2royeIYKqS9ueWEaeMt
         70V/NvI6mYHZWxn4quFPSoW8gISButU43tslILdi4HOA+4x8p71KnIRyoIG6/6GPhOQJ
         +dmhxIzPBOsyt+vTmaNf/S9BbzfZS12Jw7bdccqgSk2Txk35XxW4u9ckwu9z31+FajDH
         ezWy+YqvNWsZbPtSKxF6mqZ29Flxm+bcg9xHOWYCGrpkM2yfXBHjrR0mY4CuaZAr81PZ
         5ePUpF69j4The4uiJitpef/JoIe48XGfF9t1oNFv+xGOYGdymXqc0bYHKDIYBG24ihhm
         kckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=moLKqW8sUzdDe7Tu+bx0keAxg66CW63q9xlqRNBYrrA=;
        b=jWxqrhd3n1GX1QWN1PuA4bDFoqX1V6pvhBtVPkf1cIaLanL1TD2gyNbMU3ArdfqCZd
         tox8ZrS/FTSLcl/8Alpwyibt4CMG8scwz7FmeChnLrD/AsQYLFL8W6qcB1e4OSOnLWE3
         5U4vOkjG28WtvjlnsNhc9WPLuxUkxTKV/wu9N5vI+vgsFRUTl9Jyfa65K29UfvTZVkft
         w1P8K1RXekVvxryZcCjCQwRwwywW5o2EXQ350E74K7zCCnSCl9XtZPkqihAIhR4cyPc6
         Y1kPs5ootrw0gwpEy+m5BHhdZvAJTRn/rBLXAR2ItWHWchzBnmMKtrV3FlWjgt9o/v7b
         3/TQ==
X-Gm-Message-State: AOAM533JeRdTgmr3uW6+uPG9HFaJArZVb+hEQgzCf4uzcr3+cZWxOZea
        N2ElKhsoBjIyj1Zxls5lXc4=
X-Google-Smtp-Source: ABdhPJx5ssWUpEIEIBeaTawSvCWhAJ4WrRqcd7JRRzO48BBfVLvjE9R4HsG7zK71sU4cpDiUxflR/w==
X-Received: by 2002:a63:cf56:: with SMTP id b22mr1900832pgj.16.1610500919879;
        Tue, 12 Jan 2021 17:21:59 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id b2sm355197pff.79.2021.01.12.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 17:21:59 -0800 (PST)
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
Subject: [PATCH v3 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA heap DT-configurable
Date:   Tue, 12 Jan 2021 17:21:42 -0800
Message-Id: <20210113012143.1201105-4-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113012143.1201105-1-minchan@kernel.org>
References: <20210113012143.1201105-1-minchan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hyesoo Yu <hyesoo.yu@samsung.com>

Document devicetree binding for chunk cma heap on dma heap framework.

The DMA chunk heap supports the bulk allocation of higher order pages.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Signed-off-by: Hridya Valsaraju <hridya@google.com>
Change-Id: I8fb231e5a8360e2d8f65947e155b12aa664dde01
---
 .../reserved-memory/dma_heap_chunk.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
new file mode 100644
index 000000000000..3e7fed5fb006
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
@@ -0,0 +1,58 @@
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
+
+
-- 
2.30.0.284.gd98b1dd5eaa7-goog

