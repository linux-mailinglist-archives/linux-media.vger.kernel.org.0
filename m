Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB042F629E
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 15:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbhANOCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 09:02:25 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33162 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbhANOCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 09:02:25 -0500
Received: by mail-ot1-f53.google.com with SMTP id b24so5264453otj.0;
        Thu, 14 Jan 2021 06:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vmtwqRd+vOOs93CtJZXLHlLxZuc0mcM65taAtteZXlA=;
        b=hOc+4qoXzcULnot14ryYY8UAkVx3pbyThjZ1/WXmwaGobt2bWNzCk+imAt8CZgVGKm
         xF+NTRHX70J8HU+/BXapIIY+iCdxEqweNb+d1DxCxUfq9sLXfOWDAsjpQE6MyRyhBccH
         BWQqrQoQmHD95u+BXul+0mqXlSFu5zDRi3rtcYuNnzbc28UEFXruaSghyvOgvnRV9moD
         w446zKjW0aLbAQM0iDRP8xMjNF3LY6p8QvXvwPnovddV2a3MUf9hP0glCLu6VaSvk7KH
         deYu1zyJvtfnecRBAhRRrYQv04dKhi4OVRh6Mm4fILcSNZlc+UCw/02L1j3UyGSA0P5T
         4U1g==
X-Gm-Message-State: AOAM532ebI6Q4by3lraHAs4A98ABFeOclgjJ/245N8Ik1LAaKycGvUMW
        uC3VR0hd1PuBob2WGSGSCw==
X-Google-Smtp-Source: ABdhPJwA4xSmb7PKCcuU6wjuRg19ZNzvAwR2u8Pzf0moxRyQEWEjN27Dqi5u3i2wZ9eO5cK3Ls+Hmw==
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr4838190otq.125.1610632901192;
        Thu, 14 Jan 2021 06:01:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u141sm1036348oie.46.2021.01.14.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 06:01:40 -0800 (PST)
Received: (nullmailer pid 2811070 invoked by uid 1000);
        Thu, 14 Jan 2021 14:01:38 -0000
Date:   Thu, 14 Jan 2021 08:01:38 -0600
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
Subject: Re: [PATCH v3 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA
 heap DT-configurable
Message-ID: <20210114140138.GA2796092@robh.at.kernel.org>
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-4-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113012143.1201105-4-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 05:21:42PM -0800, Minchan Kim wrote:
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
> 
> Document devicetree binding for chunk cma heap on dma heap framework.
> 
> The DMA chunk heap supports the bulk allocation of higher order pages.

Why do we need this? What does this do that CMA doesn't?

With a CMA area I can believe a carve out is a common, OS independent 
thing. This looks too closely tied to some Linux thing to go into DT.

> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Change-Id: I8fb231e5a8360e2d8f65947e155b12aa664dde01

Drop this.

> ---
>  .../reserved-memory/dma_heap_chunk.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> new file mode 100644
> index 000000000000..3e7fed5fb006
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> @@ -0,0 +1,58 @@
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

space                  ^

> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dma_heap,chunk

The format is <vendor>,<something> and 'dma_heap' is not a vendor.

> +
> +  chunk-order:
> +    description: |
> +            order of pages that will get allocated from the chunk DMA heap.
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
> +
> +
> -- 
> 2.30.0.284.gd98b1dd5eaa7-goog
> 
