Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFEE2B8976
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 02:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgKSBWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 20:22:18 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:13688 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgKSBWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 20:22:17 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201119012212epoutp01e34aef981369565101958dcedd1d22a3~IxCVnI0za2356923569epoutp01k
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 01:22:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201119012212epoutp01e34aef981369565101958dcedd1d22a3~IxCVnI0za2356923569epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605748932;
        bh=vxqE+p60fec9P3mU3BLH0tQzmAL5GHNAl/LHPKOkVRE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rVNLMNcsl4ORos8W9rYTBGnm3rBDlDmCJ5nubJwl/tuiOJf7rBGP1Y8Dehg8b3nkQ
         P9Sdi0jRbECS9kqki/FQygmhJ8tLzYTq5lQNXzEWrQtO0RTwouaBYXLhNey3aTrjr0
         6AyZ4+cH8Acp1SYehNmJZjAl6XwfTrdhW8ea8VXg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20201119012211epcas2p2bcea66fcc3261eaffc781f3c68c5d801~IxCU5qHRi1036710367epcas2p2K;
        Thu, 19 Nov 2020 01:22:11 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.191]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Cc2350myBzMqYlx; Thu, 19 Nov
        2020 01:22:09 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4A.87.56312.0C8C5BF5; Thu, 19 Nov 2020 10:22:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20201119012207epcas2p2435612fb5c51369269d6f65cb77a0df2~IxCRimgFO1274512745epcas2p2_;
        Thu, 19 Nov 2020 01:22:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201119012207epsmtrp27c3a348e03bf8dbef54889bd0a29ff30~IxCRhfuLu0211402114epsmtrp2g;
        Thu, 19 Nov 2020 01:22:07 +0000 (GMT)
X-AuditID: b6c32a46-1efff7000000dbf8-2f-5fb5c8c0329c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8E.52.13470.FB8C5BF5; Thu, 19 Nov 2020 10:22:07 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201119012207epsmtip112a09493bb13bce3911bee9aebd5ebfb~IxCRSNazB1393113931epsmtip1L;
        Thu, 19 Nov 2020 01:22:07 +0000 (GMT)
Date:   Thu, 19 Nov 2020 10:14:31 +0900
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
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
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Message-ID: <20201119011431.GA136599@KEI>
MIME-Version: 1.0
In-Reply-To: <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHvX3te4Wk5FHRXiFsWKwbzcC2WvZQ2CQiexG34dRtcRldR9/4
        VdqmLTLJxu9f45eOOTOBQVkUhBTLKh2IwqDyOzhAYH9MEClGFhUhIDBlwFoeS/jvc88533u+
        59xcNsJNx9zZMSo9pVXJlXzUmfnbHR9/37Yei0zUNcsmykxGlLD1DQJiZuIWi1g0vUKIio4/
        WMRc2jUGUZOfgRLLBhtC9K/4Ei9GJhnEcHMZShTUW1jEA+M6i6hanMWItcJ2QKzfbsKIvvEF
        jPjhngElStOKALHyTxl62I3MureKksZyIyAN5gTyxjUhaa79DiXN88UYmTczwiDH/ryNkj0/
        rTDJ+2tTCDnbOoqSRQ21gOw3dGDkgvm1cJczysBoSq6gtF6UKlKtiFFFBfHDTsqOyKT+IrGv
        OIB4m++lksdTQfyQ4+G+oTFK+8R8r7NyZYI9FC7X6fj73gnUqhP0lFe0WqcP4lMahVIjFmv8
        dPJ4XYIqyi9SHX9QLBJJpPbKL5TR84v1DM3NPV+3jlWCVJDvmQfYbIgfgOm9x/KAE5uLNwHY
        ZfowDzjbeR7A7sE+Jn1YAjBruht1VDkErQ8nAJ1oAXC4+SmDPkwC+MhsxRxVTFwAn1/MZDoY
        xd+APQ1VwMFu+Juw8srohgDBC1HY1GJDHInteAis+3Fho4iD+8AX+UaMZlfYe/nRxkVO+Alo
        GrSwHL534Hvgk/YUxz0QL3WC1pw5Fm0vBNbWX8do3g6fdDdssjtceN6yOUIivJtpY9HiTACH
        Lo1uJvbDksc5GyYQPAZeuZqL0Evyhh1/MemwC8y9s4rRYQ7MzebSSm/4e1U5k+Zd0FaXs2mH
        hPnWAia930wGHBpTXACvl2yZrGRLM5rfgoZb82iJvQOCe8DqNTaNPtDUvM8AWLVgJ6XRxUdR
        OolGsvWtzWDjMwhDm8DFmTk/K2CwgRVANsJ349T5WGRcjkJ+LonSqmXaBCWlswKp/Z2+R9x3
        RKrtv0mll4mlEn9/UYCUkPpLCD6Pc7qmSMbFo+R6Ko6iNJT2fx2D7eSeyuBNtibGrnYaXZe3
        4c2S5Om1kpGpb62v+C7KuuRLLy1OIlvA8ICWN30cOxiR75o+MMSLTXpYuVt7XXrq6mefTlkG
        BEhmkkA4nnpqMaC3OuLzlL9L9WdvBI4thyn2Ngq4ncJGsu+jlcc1BbyM2t40CJYygk+upH/Z
        5scW3OzVEJ2HInZ/nN7vcX/bhKkyb/FYx0COZ0PFs/3xxZz+LHbDzjPtR94fLzTcjfskeL2m
        hnfZ6n6g61Cx178V/aEFX1XUzuaYGj29Tz8LrE6Oe+CRfSJY4RceNSP8dbrv3fPvCY7+kkYu
        HX451Zq4N2wgO/xc3NPYtg++qdh1vviCT4pzedLP5VgZn6mLlouFiFYn/w84YYMTlQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsWy7bCSnO7+E1vjDSZfVLaYs34Nm8WjUxcY
        Ld7e381q8XX9L2aL+UfOsVp8aFzBZLGyu5nN4vuCR8wWZ37rWny58pDJ4vKuOWwWPRu2slrc
        W/Of1WLZ1/fsFv96DzJa/N+zg93i1N3P7BaTLy1gs5jd2Mdo8fvHHDYHEY/WS3/ZPNbMW8Po
        sWBTqcfmFVoem1Z1snls+jSJ3aPr7RUmjzvX9rB5nJjxm8Xj9r/HzB7v911l8+jbsorR48yC
        I+wenzfJBfBFcdmkpOZklqUW6dslcGV0XnnDWvBNsWLZpoMsDYwPpboYOTkkBEwk9j24zwhi
        CwnsZpR48zoAIi4pMevzSSYIW1jifssR1i5GLqCa+4wSG9ZNYANJsAioSryb0sICYrMJqEuc
        2LIMbJCIgIbEwiVXwZqZBaazSTyZEgFiCwu4SKyd+hmshldAU+JL9xp2iMUtTBLzHypAxAUl
        Ts58wgLRqyVx499LoDkcQLa0xPJ/HCBhToFAifUXtrKChEUFVCReHayfwCg4C0nzLCTNsxCa
        FzAyr2KUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECI5qLc0djNtXfdA7xMjEwXiIUYKD
        WUmEd63m1ngh3pTEyqrUovz4otKc1OJDjNIcLErivDcKF8YJCaQnlqRmp6YWpBbBZJk4OKUa
        mCJ93eXijq1YOs3h2Mrljh3TV20yPnWap/r9EdGMlTOeHmDvnx9qov7UbdJ3h6Jzlbb3fzb2
        vef80vHhgWycwxUGlYbXqzd7ilZMy7TJOxBgv6fglLraEvVn2/KsAv9NmNmZUGSy2b6dU3tB
        wnUPZ4f1q2LY9s+6Ksq1648uo/zdtyuVHJ94fbySlLdtqox4LOvse/LRN45sP3710tJ7rxMV
        Tpgt2fIoaNUF5zXTueee5XBb0/Jtk+7sGTq5lW8FXdXLdYxDSqczvihd1uO5KOf2W44d+UE7
        Fs9OLbkYxlc5Ibz/MGv4qv/GPbcqyhs+KfmmTnVZVpJg3NHT80LR7rDMur88nHemfg11rr/T
        d1CJpTgj0VCLuag4EQDGJSKfWQMAAA==
X-CMS-MailID: 20201119012207epcas2p2435612fb5c51369269d6f65cb77a0df2
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----ssuDwjI424S4bj7G2h_rfOynkSmBh2yLu.l-i02n6WtkeA-i=_15f3df_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201118030110epcas2p1105a09711ea2c123f19f413b32372764
References: <20201117181935.3613581-1-minchan@kernel.org>
        <20201117181935.3613581-5-minchan@kernel.org>
        <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
        <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

------ssuDwjI424S4bj7G2h_rfOynkSmBh2yLu.l-i02n6WtkeA-i=_15f3df_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 17, 2020 at 07:00:54PM -0800, John Stultz wrote:
> On Tue, Nov 17, 2020 at 10:19 AM Minchan Kim <minchan@kernel.org> wrote:
> >
> > From: Hyesoo Yu <hyesoo.yu@samsung.com>
> >
> > Document devicetree binding for chunk heap on dma heap framework
> >
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  .../bindings/dma-buf/chunk_heap.yaml          | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> > new file mode 100644
> > index 000000000000..f382bee02778
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma-buf/chunk_heap.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://protect2.fireeye.com/v1/url?k=9020a1f6-cfbb98fd-90212ab9-002590f5b904-5057bc6b174b6a8e&q=1&e=76ff8b54-517c-4389-81b9-fa1446ad08bf&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdma-buf%2Fchunk_heap.yaml%23
> > +$schema: https://protect2.fireeye.com/v1/url?k=876fa02f-d8f49924-876e2b60-002590f5b904-e220c9cf0d714704&q=1&e=76ff8b54-517c-4389-81b9-fa1446ad08bf&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: Device tree binding for chunk heap on DMA HEAP FRAMEWORK
> > +
> > +maintainers:
> > +  - Sumit Semwal <sumit.semwal@linaro.org>
> > +
> > +description: |
> > +  The chunk heap is backed by the Contiguous Memory Allocator (CMA) and
> > +  allocates the buffers that are made up to a list of fixed size chunks
> > +  taken from CMA. Chunk sizes are configurated when the heaps are created.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - dma_heap,chunk
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  alignment:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - memory-region
> > +  - alignment
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
> > +            compatible = "shared-dma-pool";
> > +            reusable;
> > +            size = <0x10000000>;
> > +        };
> > +    };
> > +
> > +    chunk_default_heap: chunk_default_heap {
> > +        compatible = "dma_heap,chunk";
> > +        memory-region = <&chunk_memory>;
> > +        alignment = <0x10000>;
> > +    };
> 
> 
> So I suspect Rob will push back on this as he has for other dt
> bindings related to ion/dmabuf heaps (I tried to push a similar
> solution to exporting multiple CMA areas via dmabuf heaps).
> 
> The proposal he seemed to like best was having an in-kernel function
> that a driver would call to initialize the heap (associated with the
> CMA region the driver is interested in). Similar to Kunihiko Hayashi's
> patch here:
>   - https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
> 
> The one sticking point for that patch (which I think is a good one),
> is that we don't have any in-tree users, so it couldn't be merged yet.
> 
> A similar approach might be good here, but again we probably need to
> have at least one in-tree user which could call such a registration
> function.
> 
> thanks
> -john
>

Thanks for your review.

The chunk heap is not considered for device-specific reserved memory and specific driver.
It is similar to system heap, but it only collects high-order pages by using specific cma-area for performance.

It is strange that there is in-tree user who registers chunk heap.
(Wouldn't it be strange for some users to register the system heap?)

Is there a reason to use dma-heap framework to add cma-area for specific device ?

Even if some in-tree users register dma-heap with cma-area, the buffers could be allocated in user-land and these could be shared among other devices.
For exclusive access, I guess, the device don't need to register dma-heap for cma area.

Please let me know if I misunderstood what you said.

Thanks,
Regards.

------ssuDwjI424S4bj7G2h_rfOynkSmBh2yLu.l-i02n6WtkeA-i=_15f3df_
Content-Type: text/plain; charset="utf-8"


------ssuDwjI424S4bj7G2h_rfOynkSmBh2yLu.l-i02n6WtkeA-i=_15f3df_--
