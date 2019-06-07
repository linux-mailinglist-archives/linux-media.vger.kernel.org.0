Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6B65389F6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 14:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbfFGMOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 08:14:47 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35279 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfFGMOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 08:14:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190607121445euoutp01dc0d155c1738869b1e65671a0a24debe~l6ZgVqg1n2526925269euoutp01B
        for <linux-media@vger.kernel.org>; Fri,  7 Jun 2019 12:14:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190607121445euoutp01dc0d155c1738869b1e65671a0a24debe~l6ZgVqg1n2526925269euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559909685;
        bh=3eR6rvI13jFzTBnluW86ZbHprvT/EErPu2sZ4zwOkZ0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ed3RIF3zDBFvZvnXEGv9jD90wfiTlQKe/liHvhYj+wG3mT6JlcfswasHzjDJJdqzu
         Fsm1IWtnZal0dqf1iHtHaJJYNJYz/xfGOvxAoiQ2zZ94HE3aqAYLmK3DTx/ukElv7x
         SFu6QDf80fvuwAe/hy6EJb1oebkA+kFurM8/s2y8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190607121444eucas1p26a68f70911e9feacab8570e9047917e4~l6Zf1FQBc1706417064eucas1p2o;
        Fri,  7 Jun 2019 12:14:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 1F.E8.04377.4355AFC5; Fri,  7
        Jun 2019 13:14:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190607121443eucas1p1a097c2e10acadf198c499fdea9447182~l6Zeh-PRK2287122871eucas1p1w;
        Fri,  7 Jun 2019 12:14:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607121443eusmtrp129c9a4ac6eed5afc0ba3216a9c4dc01b~l6ZeSgNWh2550725507eusmtrp1i;
        Fri,  7 Jun 2019 12:14:43 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-45-5cfa55340ede
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D6.96.04146.3355AFC5; Fri,  7
        Jun 2019 13:14:43 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607121442eusmtip1485bce220e688d5299128b562133d43e~l6Zd_uhvc1286812868eusmtip1E;
        Fri,  7 Jun 2019 12:14:42 +0000 (GMT)
Subject: Re: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR
 memory
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e674539f-6b40-7b54-90bd-d1ed96ea5f55@samsung.com>
Date:   Fri, 7 Jun 2019 14:14:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djPc7omob9iDF5dV7A4NfkZk0XnxCXs
        Fj0btrJafNryjcnic+s/NgdWj9kNF1k8ZnfMZPWYdzLQ4/MmOY9TXz+zB7BGcdmkpOZklqUW
        6dslcGWcnjWRpaCBp+L5iedMDYyHOLsYOTkkBEwkmvc9ZOpi5OIQEljBKPHv3gIo5wujxMHd
        k9hBqoQEPjNKvGkshum4/Po4M0TRckaJXzfaWSCct4wSjR0XmECqhAUCJe7NuMUKYosIxEqs
        WPSFEaSIWaCbUWL9rAVgCTYBQ4mut11sIDavgJ3E9/3fGEFsFgEViTN73rKA2KICMRJf919l
        hqgRlDg58wlYnFPAVuLP1pNgvcwC8hLb385hhrDFJW49mQ/2g4TAInaJ3q9/WCDudpF4trWd
        GcIWlnh1fAs7hC0jcXpyDwtEQzOjxMNza9khnB5GictNMxghqqwlDh+/CHQ2B9AKTYn1u/Qh
        wo4Sf/YeZAcJSwjwSdx4KwhxBJ/EpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQvDYL
        yTuzkLwzC2HvAkaWVYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIEJ5/S/4192MO76k3SI
        UYCDUYmH14HhZ4wQa2JZcWXuIUYJDmYlEd6yCz9ihHhTEiurUovy44tKc1KLDzFKc7AoifNW
        MzyIFhJITyxJzU5NLUgtgskycXBKNTAaZQSG+Bw365s4X+KnpPThQ+Ktr5UeF/2OYrdpz+Ju
        2XFiquPxUqd/ehGfY542NCcwHvabfWFZ9f1Jn5brnpa4cf9V96HQ1wa32i6mCT3c2OKecpN7
        8Z27M+fu+xu5vNd+e2h3z/yvNsVCLqZTPHbptpYpSm1qlz+3I7d4p/WzpTtt5PybNV4rsRRn
        JBpqMRcVJwIAkxmZTzQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xu7rGob9iDHo2slqcmvyMyaJz4hJ2
        i54NW1ktPm35xmTxufUfmwOrx+yGiywesztmsnrMOxno8XmTnMepr5/ZA1ij9GyK8ktLUhUy
        8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJOz5rIUtDAU/H8xHOm
        BsZDnF2MnBwSAiYSl18fZ+5i5OIQEljKKLHgWxM7REJG4uS0BlYIW1jiz7UuNoii14wSd29f
        ZwRJCAsEStybcQusSEQgVqJrxX+wImaBbkaJow33wYqEBH4wSrx9XQRiswkYSnS9BZnEycEr
        YCfxff83sBoWARWJM3vesoDYogIxEn2NK1ggagQlTs58AmZzCthK/Nl6EqyXWcBMYt7mh8wQ
        trzE9rdzoGxxiVtP5jNNYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10v
        OT93EyMwwrYd+7l5B+OljcGHGAU4GJV4eB0YfsYIsSaWFVfmHmKU4GBWEuEtu/AjRog3JbGy
        KrUoP76oNCe1+BCjKdBzE5mlRJPzgdGfVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7
        NbUgtQimj4mDU6qBceYPEbYkTuuEFZ+5P5VO1DzrVsZTc9pbzSqjhr2OTS6m1Cryxlf1fdJy
        P5wuXTYMeiS5Yn3eT5ZPUpfb8vbfN7DpXVN6lX+294PUD93xX/cIJ9fmzN60//xagfmXWm+G
        v1Xxi//+4SN3uY/wvym2vEvWcbSfeRp6WuVTnLFwhvla5U/dH7b3KbEUZyQaajEXFScCAI9Y
        r/bGAgAA
X-CMS-MailID: 20190607121443eucas1p1a097c2e10acadf198c499fdea9447182
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190607120150epcas3p34178a04f712c89b013a263264cf2184f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190607120150epcas3p34178a04f712c89b013a263264cf2184f
References: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
        <20190607111634.GA7593@pendragon.ideasonboard.com>
        <CGME20190607120150epcas3p34178a04f712c89b013a263264cf2184f@epcas3p3.samsung.com>
        <cb129a47-e114-6841-44cc-ec34ffa562c7@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 2019-06-07 14:01, Hans Verkuil wrote:
> On 6/7/19 1:16 PM, Laurent Pinchart wrote:
>> Hi Hans,
>>
>> Thank you for the patch.
>>
>> On Fri, Jun 07, 2019 at 10:45:31AM +0200, Hans Verkuil wrote:
>>> The __prepare_userptr() function made the incorrect assumption that if the
>>> same user pointer was used as the last one for which memory was acquired, then
>>> there was no need to re-acquire the memory. This assumption was never properly
>>> tested, and after doing that it became clear that this was in fact wrong.
>> Could you explain in the commit message why the assumption is not
>> correct ?
> You can free the memory, then allocate it again and you can get the same pointer,
> even though it is not necessarily using the same physical pages for the memory
> that the kernel is still using for it.
>
> Worse, you can free the memory, then allocate only half the memory you need and
> get back the same pointer. vb2 wouldn't notice this. And it seems to work (since
> the original mapping still remains), but this can corrupt userspace memory
> causing the application to crash. It's not quite clear to me how the memory can
> get corrupted. I don't know enough of those low-level mm internals to understand
> the sequence of events.
>
> I have test code for v4l2-compliance available if someone wants to test this.

I'm interested, I would really like to know what happens in the mm 
subsystem in such case.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

