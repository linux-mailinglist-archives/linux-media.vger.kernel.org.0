Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B78F3119E3
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 04:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhBFDWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 22:22:39 -0500
Received: from mail-yb1-f182.google.com ([209.85.219.182]:41990 "EHLO
        mail-yb1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbhBFDPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 22:15:11 -0500
Received: by mail-yb1-f182.google.com with SMTP id b187so8721054ybg.9;
        Fri, 05 Feb 2021 19:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A/9Ih9622NVTzrZPwCYg0qngEXggsHsaO2OKN20W6PE=;
        b=CfftJvEjfHC0NgoVCz928Q4tvUKaMf3r2cE8+sJW5eoiUo8z+pHVsHnrUHnw8miou/
         abj6+ulWDeSoJKt5pFQZr4ceJYv2+WMvTK9gz0wEYfIFFlXbs+ytiNcZ7N+tDwbSXfJj
         0ZDtd3dkImTElBL9qf4HX02A8wpV8tdvyMPjw0N18WnpE42nxF9p7zL+PiDVh8bzThSl
         Uz+zIwieOQ0FT1eiB09O6u/ZtZOcXQuw7byLuwcBfMkxJE3inUVdcji22IqA9vETH9Sv
         KoO1+Plo878rccXKdqycjqUAHhhcg7PZaQzWgM+U5ryvsjgUgcWYPwJs/o1VHoHpZ+cf
         9urg==
X-Gm-Message-State: AOAM530NFdzOREcL56BVUiuVNNpmRuMjRMPjEBVWAjpzvEcXllJfEMKJ
        0M6QIOOiLb0u/Yc+2A9U5OIvZULUJA==
X-Google-Smtp-Source: ABdhPJyOibYhklMZaYhw1NqTq4B3G/M82Lf2xbPpvAKKblvYXBpctsn3mrDEoKTpEDRl2i/3LBnClQ==
X-Received: by 2002:a9d:7699:: with SMTP id j25mr4952858otl.202.1612565757307;
        Fri, 05 Feb 2021 14:55:57 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q8sm1403961oth.65.2021.02.05.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 14:55:56 -0800 (PST)
Received: (nullmailer pid 3912199 invoked by uid 1000);
        Fri, 05 Feb 2021 22:55:54 -0000
Date:   Fri, 5 Feb 2021 16:55:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA
 heap DT-configurable
Message-ID: <20210205225554.GA3881594@robh.at.kernel.org>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-4-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-4-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 21, 2021 at 09:55:01AM -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> Document devicetree binding for chunk cma heap on dma heap framework.
> 
> The DMA chunk heap supports the bulk allocation of higher order pages.
> 
> The chunk heap's allocator allocates from the CMA area. It is optimized
> to perform bulk allocation of higher order pages in an efficient manner.
> For this purpose, the heap needs an exclusive CMA area that will only be
> used for allocation by the heap. This is the reason why we need to use
> the DT to create and configure a reserved memory region for use by the
> chunk CMA heap driver. Since all allocation from DMA-BUF heaps happen
> from the user-space, there is no other appropriate device-driver that
> we can use to register the chunk CMA heap and configure the reserved
> memory region for its use.

LWN tells me we don't need carve outs any more[1]: "CMA now relies on 
compaction and no longer uses a carved-out memory region."

So why do we need this?

[1] https://lwn.net/Articles/839216/

> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---
>  .../reserved-memory/dma_heap_chunk.yaml       | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> new file mode 100644
> index 000000000000..00db0ae6af61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/dma_heap_chunk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
> +
> +description: |
> +  The DMA chunk heap is backed by the Contiguous Memory Allocator (CMA) and
> +  supports bulk allocation of fixed size pages.
> +
> +maintainers:
> +  - Hyesoo Yu <hyesoo.yu@samsung.com>
> +  - John Stultz <john.stultz@linaro.org>
> +  - Minchan Kim <minchan@kernel.org>
> +  - Hridya Valsaraju<hridya@google.com>
> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dma_heap,chunk

Convention is vendor,thing and 'dma_heap' is not a vendor. Also, '-' is 
preferred over '_'.

> +
> +  chunk-order:
> +    description: |
> +            order of pages that will get allocated from the chunk DMA heap.

Page size depends on Linux configuration. And 'order' is very much a 
Linuxism.

> +    maxItems: 1
> +
> +  size:
> +    maxItems: 1
> +
> +  alignment:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - size
> +  - alignment
> +  - chunk-order
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        chunk_memory: chunk_memory {
> +            compatible = "dma_heap,chunk";
> +            size = <0x3000000>;
> +            alignment = <0x0 0x00010000>;
> +            chunk-order = <4>;
> +        };
> +    };
> -- 
> 2.30.0.296.g2bfb1c46d8-goog
> 
