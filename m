Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70802B897C
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 02:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727342AbgKSBX5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 20:23:57 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:55415 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgKSBXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 20:23:54 -0500
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201119012352epoutp034699dd476aa0990123177d63c2821d82~IxDy-Hr640381803818epoutp03b
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 01:23:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201119012352epoutp034699dd476aa0990123177d63c2821d82~IxDy-Hr640381803818epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605749032;
        bh=LeXwRNKcehHWUG2cdfOqOVbePlLQRsG7q4c4w5O9DBo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vIgC+/bB2SsZYPQNAKz+UaYencBwyO4Vn91vCb+HDsqZZhyryyIi6EVsv+DBKHfX7
         v0pZB5aIZC53KmB0QVH5pFYtumTtsaDWHKAskokidmM3wiiBSXgPGZw+EhkLUSzX/u
         Vur2v9pxlw38NaTnrT6TQIP6+MknB+pUpwyioVoU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20201119012351epcas2p21508f0bcfb2b90afe2f956c8e62f590b~IxDyU4sfq1488314883epcas2p2j;
        Thu, 19 Nov 2020 01:23:51 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.182]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Cc2522LgqzMqYkr; Thu, 19 Nov
        2020 01:23:50 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        38.48.56312.429C5BF5; Thu, 19 Nov 2020 10:23:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20201119012348epcas2p25300933258a716781298cff068eb973a~IxDvaXDuZ2421724217epcas2p2G;
        Thu, 19 Nov 2020 01:23:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201119012348epsmtrp1199b2fe640195f011894329191b00ad4~IxDvZlY9P1094210942epsmtrp1D;
        Thu, 19 Nov 2020 01:23:48 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-e3-5fb5c924840f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.CE.08745.429C5BF5; Thu, 19 Nov 2020 10:23:48 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201119012348epsmtip14dd99af005e62d55fbb42664e57008a2~IxDvRS-JD1546815468epsmtip1f;
        Thu, 19 Nov 2020 01:23:48 +0000 (GMT)
Date:   Thu, 19 Nov 2020 10:16:14 +0900
From:   Hyesoo Yu <hyesoo.yu@samsung.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, john.stultz@linaro.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 3/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Message-ID: <20201119011614.GB136599@KEI>
MIME-Version: 1.0
In-Reply-To: <20201118090013.434-1-hdanton@sina.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmua7Kya3xBk/vm1rMWb+GzeLAz+cs
        Fmd+61pc3jWHzaJnw1ZWi3tr/rNaLPv6nt2B3WPTqk42j02fJrF73Lm2h83jxIzfLB6TXrh7
        fN4kF8AWlWOTkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZ
        A3SJkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafA0LBArzgxt7g0L10vOT/XytDA
        wMgUqDIhJ2PV+X/MBRc4K9bs/8jcwPiQvYuRk0NCwETiw9m5zF2MXBxCAjsYJbpPzGMCSQgJ
        fGKUuDNVHSLxmVGif+FRFpiOla2rGSESuxgltuzbywbhPGSU2Lz4GtAsDg4WAVWJo/+TQRrY
        BNQlTmxZxghiiwgoS3RemMUKUs8scIZRYuZRkHpODmEBd4lJnw6ygPTyCmhK7DttARLmFRCU
        ODnzCdhiTqDFyxbsYAUpERVQkXh1sB5kjIRAK4dE36lbrBDHuUjMfrUMyhaWeHV8C9SbUhIv
        +9ug7HKJsy2PWCGaWxglLk67ygaRMJaY9awd7FBmgUyJ3w2Pwe6RADr6yC0WiDCfRMfhv+wQ
        YV6JjjYhiE5lif3L5kHDR1Li0dp2qBM8JBq+H2GBBOh2RokFP8InMMrPQvLZLCTLIGwdiQW7
        P7HNAtrALCAtsfwfB4SpKbF+l/4CRtZVjGKpBcW56anFRgVGyFG9iRGcRrXcdjBOeftB7xAj
        EwfjIUYJDmYlEd61mlvjhXhTEiurUovy44tKc1KLDzGaAmNpIrOUaHI+MJHnlcQbmhqZmRlY
        mlqYmhlZKInzhq7sixcSSE8sSc1OTS1ILYLpY+LglGpgYmx/HiO69l789re8ZTlHn9TGuaz9
        m76y+La6d5HFquNMXd2VHgkbLPiN39yyflngMYPh6PTuTvFj1js9pttEzP3EdOro2p3CRte2
        aBZIOF7oapETN+19aCEUUfxQ+9pOpTlsPw7LfmyWaPx+6dp5np+Z/098ai3w/7M3mr/lUYpg
        8/28g3sXNdb06S1MObZwlrF3VVbU9LV95fzyl5smVn5d0lUnvu3Gm4gH6zawL3s362/Pmk9v
        X2eKfXmh49KveMXFIYmLwbmp6CD75mCWnKbPPksWXv6murV/52XP2KnNIvfEW4u5sjbGT3xf
        0CilLzBD4Lvc+Zw1GY/naNy4MtfsQ03vK3Who2cTuy7EKLEUZyQaajEXFScCAHpx/m8sBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSnK7Kya3xBt090hZz1q9hszjw8zmL
        xZnfuhaXd81hs+jZsJXV4t6a/6wWy76+Z3dg99i0qpPNY9OnSewed67tYfM4MeM3i8ekF+4e
        nzfJBbBFcdmkpOZklqUW6dslcGVsnvqRpaCXveLPw79sDYzbWbsYOTkkBEwkVrauZuxi5OIQ
        EtjBKDHx/RyohKTErM8nmSBsYYn7LUdYIYruM0pMX3acvYuRg4NFQFXi6P9kkBo2AXWJE1uW
        MYLYIgLKEp0XZoHVMwucY5RY/WsOWEJYwF1i0qeDLCC9vAKaEvtOW4CYQgLbGSXOMINU8AoI
        Spyc+YQFxGYW0JK48e8lE0gJs4C0xPJ/HCBhTqCTly3YwQoSFhVQkXh1sH4Co+AsJM2zkDTP
        QmhewMi8ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOAa0tHYw7ln1Qe8QIxMH4yFG
        CQ5mJRHetZpb44V4UxIrq1KL8uOLSnNSiw8xSnOwKInzfp21ME5IID2xJDU7NbUgtQgmy8TB
        KdXANHP9m+o/Dqtrhe6lMX/4E1n4z8yNc9eB+WZuKl/vt8p9f/Ncgz3k5syNG71UvunNPOj9
        R0Iv8thM9yusaRMWv3o587VE1Gl2XRehqbsc5ufwZnw6fWnlxPssqvzBF2YIusoFic/PXBP5
        +oZdd5wyk01GYJv8XVbPvA/y4ZWL7W5M7NqmoWLQ+nPVJ9Gcy3ElV2V5/WrTTUQVN3apNIrW
        uJ7kCq29vGYO36T+jbu7NPcKNAmw/iyQ5Sr7sD9xjstttl2X46Wd6jVWvFXRz0yYwzf/dKP2
        vSgx37MZ/g/cv+90E1zYrhg7Qa1vg3t41WH/zowXbernBF+u/Nn/cqVQ2b9jbSsWmpm+UX36
        x49RiaU4I9FQi7moOBEAn5Cc1vACAAA=
X-CMS-MailID: 20201119012348epcas2p25300933258a716781298cff068eb973a
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----4WYzU9ra2zsysXCCwV9o7Bet81fjsxgzse5jnxws3Y-xTz8o=_15f447_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201118090020epcas2p3244a130a7b02a42127213a0b99f90291
References: <20201117181935.3613581-1-minchan@kernel.org>
        <CGME20201118090020epcas2p3244a130a7b02a42127213a0b99f90291@epcas2p3.samsung.com>
        <20201118090013.434-1-hdanton@sina.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

------4WYzU9ra2zsysXCCwV9o7Bet81fjsxgzse5jnxws3Y-xTz8o=_15f447_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hello, Hillf danton.

On Wed, Nov 18, 2020 at 05:00:13PM +0800, Hillf Danton wrote:
> On Tue, 17 Nov 2020 10:19:34 -0800 Minchan Kim wrote:
> +
> +static int chunk_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> +{
> +	struct chunk_heap_buffer *buffer = dmabuf->priv;
> +	struct sg_table *table = &buffer->sg_table;
> +	unsigned long addr = vma->vm_start;
> +	struct sg_page_iter piter;
> +	int ret;
> +
> +	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> +		struct page *page = sg_page_iter_page(&piter);
> +
> +		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> +				      vma->vm_page_prot);
> +		if (ret)
> +			return ret;
> +		addr = PAGE_SIZE;
> 
> Typo?
> 		addr += PAGE_SIZE;
> 

Yes, It is typo. I will change it.

Thanks for your review.
Regards.

> +		if (addr >= vma->vm_end)
> +			return 0;
> +	}
> +	return 0;
> +}
> 

------4WYzU9ra2zsysXCCwV9o7Bet81fjsxgzse5jnxws3Y-xTz8o=_15f447_
Content-Type: text/plain; charset="utf-8"


------4WYzU9ra2zsysXCCwV9o7Bet81fjsxgzse5jnxws3Y-xTz8o=_15f447_--
