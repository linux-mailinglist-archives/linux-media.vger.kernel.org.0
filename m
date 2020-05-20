Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BC71DB438
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 14:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgETMyo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 08:54:44 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40187 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgETMyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 08:54:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200520125441euoutp0100aa15d243482a6600e9cf94859becba~QvbuaJCYC0372903729euoutp012
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 12:54:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200520125441euoutp0100aa15d243482a6600e9cf94859becba~QvbuaJCYC0372903729euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589979281;
        bh=tI5Tz3jwy69CbvaLcGW1XkMaXVbgX6nnxFjydaxiPro=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=gSAZCYM2xENBhaEvkth7OHo+5ZJAXiu4TjgrBgyT4s0vZ+k2EgQFXrQm5hLMFgiCB
         XFxfvTRETuZyCCuw1m+TDzYwyi+BcJnsYLaZupe+XwDwf8AOWr8L31BYwsPhj+ZI5+
         Sr1Q1Gl0xqK7KfZU0c3F43hCXOcHaAPI3AS7wLhI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200520125441eucas1p2518704a415e86be1d3ebdd4d63e5f4dd~QvbuL68VZ1106011060eucas1p24;
        Wed, 20 May 2020 12:54:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 91.36.61286.19825CE5; Wed, 20
        May 2020 13:54:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200520125441eucas1p1188e037c9f8d1df14275319fe99148fa~Qvbt3pwZm2505325053eucas1p1c;
        Wed, 20 May 2020 12:54:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200520125441eusmtrp1e0e8ba6c2903278a92af16aac21461bf~Qvbt3GZuE2658726587eusmtrp1j;
        Wed, 20 May 2020 12:54:41 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-3f-5ec528910e21
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.AA.07950.19825CE5; Wed, 20
        May 2020 13:54:41 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200520125440eusmtip1a4daa457d392325b6f96004b88018d65~Qvbtcr6sm0783007830eusmtip1K;
        Wed, 20 May 2020 12:54:40 +0000 (GMT)
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <29a21e64-a63f-6721-c938-d713488767c1@samsung.com>
Date:   Wed, 20 May 2020 14:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87oTNY7GGcxeoW5xedccNoueDVtZ
        LZZt+sNksX7+LTaL42vDHVg9Nq3qZPO4c20Pm8fxG9uZPD5vkgtgieKySUnNySxLLdK3S+DK
        6PpzjqVgrWjFjRUzWRoYzwp2MXJySAiYSKy8fJ65i5GLQ0hgBaPEnqfnmSCcL4wS82fNYQOp
        EhL4zChx80UYTMfyyW8YIYqWM0osXvUUynkP1P7qGFAHB4ewgL7E2Rn2IHERgbuMEgfXX2IH
        6WYTMJToetsFNpVXwE7i1a/nzCD1LAKqEvdPF4CERQViJU4v3swIUSIocXLmExYQm1PASuL6
        +89MIDazgLxE89bZzBC2uMStJ/PBrpYQ6GeXWD71ATPEpS4SJ2d/Y4OwhSVeHd/CDmHLSJye
        3MMC0dDMKPHw3Fp2CKeHUeJy0wxGiCpriTvnfoF9wyygKbF+lz5E2FFi4tn57CBhCQE+iRtv
        BSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrgEdZqHRNO9nawTGBVnIXlzFpLXZiF5bRbC
        DQsYWVYxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEppjT/45/2sH49VLSIUYBDkYlHl4O
        gaNxQqyJZcWVuYcYJTiYlUR4F/IDhXhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliS
        mp2aWpBaBJNl4uCUamDcZ1lx0vuSqYSjo+X9S+8+6UpMNF3olvDzOG/X00PWKR9nxUe5hZTf
        mbG3nsU/plPPs/3/M2bTqRtyJ/FVH9hk1vcvSX1e0jXrQ0K3LlbMdmF7ym62/EhIOdNvlg9v
        Dr+V8/BNe2L42CnkLG/lr30Je2a6apwMk+fdudT0u2t0QrnOiv9rI52VWIozEg21mIuKEwHQ
        PMdELQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xu7oTNY7GGZx7zmNxedccNoueDVtZ
        LZZt+sNksX7+LTaL42vDHVg9Nq3qZPO4c20Pm8fxG9uZPD5vkgtgidKzKcovLUlVyMgvLrFV
        ija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL6PpzjqVgrWjFjRUzWRoYzwp2
        MXJySAiYSCyf/Iaxi5GLQ0hgKaPE9aPTWSESMhInpzVA2cISf651sUEUvWWUePL4FUsXIweH
        sIC+xNkZ9iA1IgL3GSXenjaBqLnOJPG/5TUzSIJNwFCi6y1IMycHr4CdxKtfz5lBelkEVCXu
        ny4ACYsKxEqsvtbKCFEiKHFy5hMWEJtTwEri+vvPTCA2s4CZxLzND5khbHmJ5q2zoWxxiVtP
        5jNNYBSchaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwdrYd+7ll
        B2PXu+BDjAIcjEo8vBwCR+OEWBPLiitzDzFKcDArifAu5AcK8aYkVlalFuXHF5XmpBYfYjQF
        +m0is5Rocj4wrvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTCe
        nxR/ObD2yat/Xy8kWp04/o3hwsMlUm4K345+OHz++3qNO05ctmpvF0c/vta9QIzl+B5XjU0V
        ymduvk1YmLMmWrdD4jpfi+erewEuRyUWpyuGxjRaTJSvWbHO6tNjsyiJ/d+EEhvKC6IMi/7y
        31jtoHtORUeqTYbt+A3BuOXe837fZ/sZ1dalxFKckWioxVxUnAgAn/N3w7MCAAA=
X-CMS-MailID: 20200520125441eucas1p1188e037c9f8d1df14275319fe99148fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
        <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
        <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
        <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com>
        <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
        <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 20.05.2020 14:43, Tomi Valkeinen wrote:
> On 20/05/2020 12:22, Marek Szyprowski wrote:
>> On 20.05.2020 11:18, Tomi Valkeinen wrote:
>>> On 20/05/2020 12:13, Marek Szyprowski wrote:
>>>> On 20.05.2020 11:00, Tomi Valkeinen wrote:
>>>>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
>>>>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
>>>>> at least some v4l2 platform drivers to break when freeing resources.
>>>>>
>>>>> E.g. drivers/media/platform/ti-vpe/cal.c uses
>>>>> vb2_dma_contig_set_max_seg_size() and
>>>>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
>>>>> similar pattern is seen in other drivers too.
>>>>>
>>>>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
>>>>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
>>>>> kfree the dma_params.
>>>>>
>>>>> I'm not sure what's the proper fix here. A flag somewhere to indicate
>>>>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
>>>>> vb2_dma_contig_clear_max_seg_size() must free?
>>>>>
>>>>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
>>>>> to always be there?
>>>>
>>>> Thanks for reporting this issue!
>>>>
>>>> Once the mentioned commit has been merged, the code should assume that
>>>> the platform devices does have a struct dma_params allocated, so the
>>>> proper fix is to alloc dma_params only if the bus is not a platform 
>>>> bus:
>>>>
>>>> if (!dev_is_platform(dev) && !dev->dma_parms) {
>>>>        dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>>>>
>>>> same check for the free path.
>>>
>>> There is also "amba: Initialize dma_parms for amba devices". And the
>>> commit message says PCI devices do this too.
>>>
>>> Guessing this based on the device type doesn't sound like a good idea
>>> to me.
>>
>> Indeed. Then replace the allocation with a simple check for NULL
>> dma_parms and return an error in such case. This should be enough for
>> v5.8. Later we can simply get rid of those helpers and inline setting
>> max segment size directly to the drivers.
>
> Is that valid either? Then we assume that dma_parms is always set up 
> by someone else. That's true for platform devices and apparently some 
> other devices, but is it true for all devices now?

# git grep vb2_dma_contig_set_max_seg_size | wc -l

18

I've checked all clients of the vb2_dma_contig_set_max_seg_size 
function. There are only 9 drivers, all of them are platform device 
drivers. We don't care about off-tree users, so the proposed approach is 
imho fine.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

