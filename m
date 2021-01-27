Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5E30651B
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 21:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhA0U0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 15:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbhA0U0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 15:26:22 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A931C061756
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 12:25:41 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id l27so3086984qki.9
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 12:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZoBtRS8YOTJzu29qNFHhNioiABAFU8p2auHgs06phc=;
        b=dOg76lBVPdgpL3K73aYKg8S9kQsTuB3QhYLxcfe3hHPcoKGHrOFvkQQia+LkpUWZWb
         0UIi0DLfFKVMkuPiul/U7qPVKpWdv7lvmz0i9DXyH/ih3tJxljDye/cpDcIc9GI0zexo
         S+eAKL4OYxBDNi0rUvQiNCjudtuTDR0XWN6iyVWuzKXiZMxYHnonmBnrJ63QJ7yVO16a
         apfU0eyuMBOxkwtaArHphf7XOWX72sDIS8qKoheNOO19geIOJEe0pEdEOVCd2LjrdoyH
         Fw8LoVKhRxn919ILiOjY/WckYtg/hGwZXS9ZUQLeNT57uyhAIH6ybrrkNPmSclOMZOyS
         wGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZoBtRS8YOTJzu29qNFHhNioiABAFU8p2auHgs06phc=;
        b=AV+kVQ9Tk1VYQLCcGTF81tI9MLdl6CCR/lIAO9F1AwT//LFm8c+NJHAytTmQfUD9FQ
         FgQkSD9/p+g2nLEWyNhY7iaKJ6GgrbPCGy5z85xtBq0/kuJ0dmiTubH/3+I3ww3azOfc
         5AsAd4o7bylVseECE6AbPYwK5+xNaxLydqhE6v/hBpD/VJ9xMrH3yrauLwO8Vg1ogHb+
         bWkhnoNHBxAYhtsWw2rw4E2TEZ5U8vCJR7Up+kI4QCbL85DGvcuGi++bgIWHK6aJpav4
         bMz+tdFVMBn++FqW9918Ju+pp4COo71oS0Ap+h93tOQAh4/ztYI1Jhyqz8cYyA23KsDW
         uv+w==
X-Gm-Message-State: AOAM530Xmt2oMDWX5NrUl6sl+wWUFFuqh4Rsyl6cliD1layTzSNA/3NZ
        mydeUijQfWkulxcN4VFJg1q4Y+BiJWFsUKw9/M7YzQ==
X-Google-Smtp-Source: ABdhPJzrXGIOvM2o8iMF0bkxogCRV5D8LhWKGv10+6bJZ18hS+cdFs/W7ewbDbyxyJtymoETwoc1+36mu6cH94Vad+w=
X-Received: by 2002:a37:7003:: with SMTP id l3mr12574546qkc.467.1611779140267;
 Wed, 27 Jan 2021 12:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20210121175502.274391-1-minchan@kernel.org> <20210121175502.274391-4-minchan@kernel.org>
 <CALAqxLU3yU8e006G0W-mSBLogWAru6jOJcBbuH5wFHoi1JitPA@mail.gmail.com>
In-Reply-To: <CALAqxLU3yU8e006G0W-mSBLogWAru6jOJcBbuH5wFHoi1JitPA@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 27 Jan 2021 12:25:04 -0800
Message-ID: <CA+wgaPNoRm7GrUNm4wPV8BkWZT4KhqF5WHUb7f1U5Xz3zeSxGg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: reserved-memory: Make DMA-BUF CMA
 heap DT-configurable
To:     John Stultz <john.stultz@linaro.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 11:07 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jan 21, 2021 at 9:55 AM Minchan Kim <minchan@kernel.org> wrote:
> >  .../reserved-memory/dma_heap_chunk.yaml       | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> > new file mode 100644
> > index 000000000000..00db0ae6af61
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
> > @@ -0,0 +1,56 @@
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
> > +
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - dma_heap,chunk
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
>
> Hey Minchan,
>   Looking closer here, would it make more sense to document the "reg =
> <>" parameter here as well instead of just "size = <>"?
>
> That way the address of the region could be explicitly specified (for
> instance, to ensure the CMA region created is 32bit addressable). And
> more practically, trying to satisfy the base address alignment checks
> in the final patch when its set dynamically may require a fair amount
> of luck  - I couldn't manage it in my own testing on the hikey960 w/o
> resorting to reg=  :)
>
> It does look like the RESERVEDMEM_OF_DECLARE() logic already supports
> this, so it's likely just a matter of documenting it here?

Thank you John, yes, that makes sense. We will add the 'reg' parameter
as well when we send out the next version.

Regards,
Hridya

>
> thanks
> -john
