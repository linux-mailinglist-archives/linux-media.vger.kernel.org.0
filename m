Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6352F6B82
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 20:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbhANTuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 14:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbhANTuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 14:50:17 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EDEC0613C1
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 11:49:37 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id l14so2897499qvh.2
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 11:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zizu37IibkwemqdpaRibOtXAnbLUYIiJx9hqRg2s88=;
        b=lZuSvDEQF58ZhFUbCoGE7Z1jJ0Pgx9eBL7AutBdLexq9l7vgjFbNBQ/t/RJjUKnjHD
         7MsVYJMUFtuEZoGw1eSN4SXhmY5cjknh2f22PaDk8I/h5UtJUjzK1g/mh6q0eqnh7eyA
         s1ORXdVuLbiCUmtQ+vHj5qLyNfb+c0pPYuwRzWmrARQHJLuHYDqaJmYe6q3/SgrvD63l
         h9of/4WDTqdjE+op+7GXn+hQUqqnLfdxfpb8YSm0bqDkq1y4BVUdVdcOtDW0EE9VSAUa
         yw9Ji7vhJ5BNKZOEkYlz5NXRCmde9qsOCdo3PAREsrbZOMLm4pI2YDxbEecqQETmwYic
         nmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zizu37IibkwemqdpaRibOtXAnbLUYIiJx9hqRg2s88=;
        b=gb5ATup/8fIOi0nGs00E2rGzS3STsCYakFue+GBB6WW/dms0wUa4JZZDjJRY7ygfs4
         FB/MCFpUNhdSle4AuTKWpneqhlcDfVLTBqINs5w8GNyeWU2X2O2Vhiy5CzftUD8e8DgX
         2uok7MHvZLX6KBVnJGhCy7DnQgjaA0wFMTXvMjE2H5W8JvrkcQU/S+3+N9CG9YrNVXkw
         Z2AoAGwgwt6TjmBQQlo6yMFUXuUW07ZDgyHmd8/nsA0aikwbuDUuNgKqVDpMDl2D8X/h
         SSc/kUHnsPWGjAMLdh91hVl70Oh7TKevx05OYxqJMQfigMRo6PbC9cDhW8ExgbjGjdJ4
         uEkA==
X-Gm-Message-State: AOAM533RywNtzvQdKr76Qh4HhsMXhMpTURJrY6IT4No3OSTN60oSw++t
        6Xwbv8ph2k0Ny2/Qi6w49FAiPfP2weT5PcjS3WygJQ==
X-Google-Smtp-Source: ABdhPJxg5NPhOqA+7s9RwIlJJn5Yoqck0Iif3Unmra/z5l6l8oWvomlz3q0ZHTEDjMgJZhagYk2KBczrOl9d1bCcXus=
X-Received: by 2002:a0c:8203:: with SMTP id h3mr8726142qva.0.1610653776416;
 Thu, 14 Jan 2021 11:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20210113012143.1201105-1-minchan@kernel.org> <20210113012143.1201105-4-minchan@kernel.org>
 <20210114140138.GA2796092@robh.at.kernel.org>
In-Reply-To: <20210114140138.GA2796092@robh.at.kernel.org>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Thu, 14 Jan 2021 11:49:00 -0800
Message-ID: <CA+wgaPN3=1VOMmBUvHfvo7ePSuNUk9WJ2deSC37GYPmc2mdB-g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA
 heap DT-configurable
To:     Rob Herring <robh@kernel.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        mhocko@suse.com, Suren Baghdasaryan <surenb@google.com>,
        "pullip.cho" <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 6:01 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 12, 2021 at 05:21:42PM -0800, Minchan Kim wrote:
> > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> >
> > Document devicetree binding for chunk cma heap on dma heap framework.
> >
> > The DMA chunk heap supports the bulk allocation of higher order pages.
>
> Why do we need this? What does this do that CMA doesn't?
>
> With a CMA area I can believe a carve out is a common, OS independent
> thing. This looks too closely tied to some Linux thing to go into DT.

Hello Rob,

Thank you for the review!

The chunk heap's allocator also allocates from the CMA area. It is,
however, optimized to perform bulk allocation of higher order pages in
an efficient manner. For this purpose, the heap needs an exclusive CMA
area that will only be used for allocation by the heap. This is the
reason why we need to use the DT to create and configure a reserved
memory region for use by the chunk CMA heap driver. Since all
allocation from DMA-BUF heaps happen from the user-space, there is no
other appropriate device-driver that we can use to register the chunk
CMA heap and configure the reserved memory region for its use.

We have been following your guidance in [1] to bind the chunk CMA heap
driver directly to the reserved_memory region it will allocate from.
Is there an alternative that we are missing Rob?

[1]: https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d

The use-case that we have for the heap currently will allocate memory
from it from userspace and use the allocated memory to optimize
4K/8K HDR video playback with a secure DRM HW pipeline.

Thank you for all the help and review :)

Regards,
Hridya






>
> >
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > Change-Id: I8fb231e5a8360e2d8f65947e155b12aa664dde01
>
> Drop this.
>
> > ---
> >  .../reserved-memory/dma_heap_chunk.yaml       | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> > new file mode 100644
> > index 000000000000..3e7fed5fb006
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/dma_heap_chunk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
> > +
> > +description: |
> > +  The DMA chunk heap is backed by the Contiguous Memory Allocator (CMA) and
> > +  supports bulk allocation of fixed size pages.
> > +
> > +maintainers:
> > +  - Hyesoo Yu <hyesoo.yu@samsung.com>
> > +  - John Stultz <john.stultz@linaro.org>
> > +  - Minchan Kim <minchan@kernel.org>
> > +  - Hridya Valsaraju<hridya@google.com>
>
> space                  ^
>
> > +
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - dma_heap,chunk
>
> The format is <vendor>,<something> and 'dma_heap' is not a vendor.
>
> > +
> > +  chunk-order:
> > +    description: |
> > +            order of pages that will get allocated from the chunk DMA heap.
> > +    maxItems: 1
> > +
> > +  size:
> > +    maxItems: 1
> > +
> > +  alignment:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - size
> > +  - alignment
> > +  - chunk-order
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    reserved-memory {
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +
> > +        chunk_memory: chunk_memory {
> > +            compatible = "dma_heap,chunk";
> > +            size = <0x3000000>;
> > +            alignment = <0x0 0x00010000>;
> > +            chunk-order = <4>;
> > +        };
> > +    };
> > +
> > +
> > --
> > 2.30.0.284.gd98b1dd5eaa7-goog
> >
