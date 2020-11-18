Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B112B747B
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 04:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgKRDBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 22:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgKRDBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 22:01:07 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDD8C061A48
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 19:01:06 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id g19so343857otp.13
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2020 19:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uJCOUcCa+QNGhT/ES7N0Gs1weA2TXULzhkEQY1X4Jo=;
        b=iudQYKUwAOK9crkiWJ66u2A1YGZCBlCwtJ7NMi11klrVKGT/dFCsGxSljVJDr7DJ0g
         lDpDgEUNZJYa9nmxUH6uwUeRo3AfV1WCViXiGu7wlPweAMbLV9FB7Fo5b+oHQQi1aigL
         MthZtLw/DcFUhqRbHbBYjcPvo9uIa7i3ztccA2IcPNjXwSZ/67Qwhs8pEX8j/HXeHvxw
         93df3wEp8sT1v3KNz39iAtv/5GK29Rvl2QwMK0WBKbuAsvVBBUxdzbuCEnY7WYezsKge
         0Eh0ekjpKLpbRF4mkuu4/ZplAcqUYubSLUEgxK6sY+vaYIVUs1y2KWD1SMzaLPnFOOzH
         t57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uJCOUcCa+QNGhT/ES7N0Gs1weA2TXULzhkEQY1X4Jo=;
        b=MLq1iVh8pXsRkNu5SEkQ5OGYwuzaWVgbrKpGMRZzP+RwZr1pqIu2emSJpo7sySIDoW
         1vkxO812/7+gACq6XwZcKYBsoIe1VA0wJvNQwtRREYm8sYebd1eBbjAeyc6GRogQ1wjF
         lfq+VjkBkkBK5iyNsGWWCr9hj+auKS/grn3tBb31bHtqClkM3W8zu2nwiH85aNmPiGUP
         5nnhl2JrVfoiLktTpAbenT5ZufX2bpuTzO1gBGs8ZdKZfchctrcRh5PFZ+G/rY0BPXHc
         r+T4kuK48coawE/vbmjXtLkgz6YBZ3w3pVomBMQQpphPJo8l0rw1Iuqum54R0/+Sw3O/
         BBbQ==
X-Gm-Message-State: AOAM533x3+KGOGRYKkUyGDIWk0OfrEyeojm5WvXUbw9iMsCt3/UF6fci
        zon4BECMSQAERh4WeXKSsuySk2OtXyAlS3dBxNTURA==
X-Google-Smtp-Source: ABdhPJzGGlEp/RY02FjhdSrOME5ixmXEwMqcM3Kp5XSh8B606VPzwVjQm4NMFjXTadyAYc+lrXxzVUAwYI5nu6c9VOY=
X-Received: by 2002:a05:6830:2415:: with SMTP id j21mr4976789ots.221.1605668466163;
 Tue, 17 Nov 2020 19:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20201117181935.3613581-1-minchan@kernel.org> <20201117181935.3613581-5-minchan@kernel.org>
In-Reply-To: <20201117181935.3613581-5-minchan@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 17 Nov 2020 19:00:54 -0800
Message-ID: <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Hyesoo Yu <hyesoo.yu@samsung.com>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 10:19 AM Minchan Kim <minchan@kernel.org> wrote:
>
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
>
> Document devicetree binding for chunk heap on dma heap framework
>
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  .../bindings/dma-buf/chunk_heap.yaml          | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> new file mode 100644
> index 000000000000..f382bee02778
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma-buf/chunk_heap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
> +
> +maintainers:
> +  - Sumit Semwal <sumit.semwal@linaro.org>
> +
> +description: |
> +  The chunk heap is backed by the Contiguous Memory Allocator (CMA) and
> +  allocates the buffers that are made up to a list of fixed size chunks
> +  taken from CMA. Chunk sizes are configurated when the heaps are created.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - dma_heap,chunk
> +
> +  memory-region:
> +    maxItems: 1
> +
> +  alignment:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - memory-region
> +  - alignment
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
> +            compatible = "shared-dma-pool";
> +            reusable;
> +            size = <0x10000000>;
> +        };
> +    };
> +
> +    chunk_default_heap: chunk_default_heap {
> +        compatible = "dma_heap,chunk";
> +        memory-region = <&chunk_memory>;
> +        alignment = <0x10000>;
> +    };


So I suspect Rob will push back on this as he has for other dt
bindings related to ion/dmabuf heaps (I tried to push a similar
solution to exporting multiple CMA areas via dmabuf heaps).

The proposal he seemed to like best was having an in-kernel function
that a driver would call to initialize the heap (associated with the
CMA region the driver is interested in). Similar to Kunihiko Hayashi's
patch here:
  - https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/

The one sticking point for that patch (which I think is a good one),
is that we don't have any in-tree users, so it couldn't be merged yet.

A similar approach might be good here, but again we probably need to
have at least one in-tree user which could call such a registration
function.

thanks
-john
