Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A51685D9
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 11:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbfGOJA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 05:00:26 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55326 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729245AbfGOJA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 05:00:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190715090024euoutp02789b597c895051276a470d36eb9ff80a~xiQqzZRtw1320213202euoutp02E
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 09:00:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190715090024euoutp02789b597c895051276a470d36eb9ff80a~xiQqzZRtw1320213202euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563181224;
        bh=4Pc+fO1+/ZMl5J0ti/1yRmjXong6iDuRO9je3QCE9Q0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=u3ZMvk7jnxyJLVLbr/+tv1MzHMvram7blahiR5CjL73c+nCMzAGpq/VqSdAa+cBLz
         xynNOxsr1UPT+hvgwI6ob0cVPnl5LNxhSn5WP/awFnkqgTzgEb5DWIaQRzMMkDcMA2
         eX5DOSc1UTWVu+VeN3Tl7lfkwTadrzLZO5EyXrZI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190715090024eucas1p26e6f7a1817078948ccb0674890a12909~xiQqMM2wy1153111531eucas1p2e;
        Mon, 15 Jul 2019 09:00:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 05.B3.04325.7A04C2D5; Mon, 15
        Jul 2019 10:00:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd~xiQpaqaWs2765727657eucas1p2T;
        Mon, 15 Jul 2019 09:00:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190715090023eusmtrp1f100dd8f1e965e9836e58ab0e75d3a31~xiQpMgm-i2192721927eusmtrp1R;
        Mon, 15 Jul 2019 09:00:23 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-a4-5d2c40a78be5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.E3.04146.6A04C2D5; Mon, 15
        Jul 2019 10:00:22 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190715090022eusmtip2c2db709b559c4ac92afa9b8002fb0a03~xiQoxN0U10255602556eusmtip2U;
        Mon, 15 Jul 2019 09:00:22 +0000 (GMT)
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after
 dma_alloc_coherent
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
Date:   Mon, 15 Jul 2019 11:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715031851.6890-1-huangfq.daxian@gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djPc7rLHXRiDVbOMbBYduokq0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YXLg9Ng56y67x6ZVnWwem5fU
        e/RtWcXo8XmTXABrFJdNSmpOZllqkb5dAlfGmatXmAtmcVR0bXnD3MD4i62LkZNDQsBE4u71
        y6xdjFwcQgIrGCWWrrsO5XxhlNg6azUjhPOZUWLGvbeMMC2f1i5lg0gsZ5T4uPs3E4TzllFi
        cU8rK0iVsECiRM+0L0wgtoiAtsTH0y3MIEXMAquZJDYeWA+2nU3AUKL3aB/YWF4BO4kJzdtY
        QGwWAVWJXdP/g8VFBSIkTh2ZxwJRIyhxcuYTIJuDg1PAVuL+RwuQMLOAuETTl5WsELa8xPa3
        c8B2SQgcYpd4vegc1NkuEj29TSwQtrDEq+Nb2CFsGYnTk3tYIBqaGSV6dt9mh3AmMErcP74A
        qtta4vDxi6wgm5kFNCXW79IHMSUEHCWu3DKBMPkkbrwVhLiBT2LStunMEGFeiY42IYgZKhK/
        V01ngrClJLqf/GeZwKg0C8ljs5B8MwvJN7MQ1i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeu
        l5yfu4kRmJZO/zv+dQfjvj9JhxgFOBiVeHgdUrRjhVgTy4orcw8xSnAwK4nw2n4FCvGmJFZW
        pRblxxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamCUVkw/tnjF35jmrImr
        zCJEjQ8dqpgaqJNVe+NY1zJh4dq126yMtp6R1ln5/rqS0kw/3wX6r6ofb34bJsCXLGTRs0z6
        8vf+Q/GrTzyYcJaB60GA4zmG9EVNslaRr4oiry1eecn/QMLiO4o/U/WV9mz/81h57ob1p+b8
        V2tKW+H8cEbu6pvVCVNblViKMxINtZiLihMBUmnC3UcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsVy+t/xe7rLHHRiDRoOWFosO3WS1aL/8Wtm
        i/PnN7BbnG16w26x6fE1VovLu+awWfRs2MpqMeP8PiaLZZv+MDlweuycdZfdY9OqTjaPzUvq
        Pfq2rGL0+LxJLoA1Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUn
        syy1SN8uQS/jzNUrzAWzOCq6trxhbmD8xdbFyMkhIWAi8WntUiCbi0NIYCmjxNojk9i7GDmA
        ElIS81uUIGqEJf5c64Kqec0osX/HH1aQhLBAokTPtC9MILaIgLbEx9MtzCBFzAKrmSRWLFrN
        BDJISMBG4tgbLpAaNgFDid6jfYwgNq+AncSE5m0sIDaLgKrErun/weKiAhESk67tZIGoEZQ4
        OfMJC8gYTgFbifsfLUDCzALqEn/mXWKGsMUlmr6sZIWw5SW2v53DPIFRaBaS7llIWmYhaZmF
        pGUBI8sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwBjcduzn5h2MlzYGH2IU4GBU4uF1SNGO
        FWJNLCuuzD3EKMHBrCTCa/sVKMSbklhZlVqUH19UmpNafIjRFOi3icxSosn5wPSQVxJvaGpo
        bmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBkf/Ym/VskxWjrjHe2x/S4prB
        HL1gYVX77W1lG8r/KBp7VjFs23rlW1Rroeketabd53huBTU/XlU6LZfLJrT8/fyCSylWH+fq
        1AcWzaqI37lsu1r0hdoXAi/KNsatSE9ekTzre4jXgcVqlo9DX72PDNohJ/N3ddfD8oxP3BkT
        3nnvFsw+862nS4mlOCPRUIu5qDgRAKgQjlbXAgAA
X-CMS-MailID: 20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd
References: <20190715031851.6890-1-huangfq.daxian@gmail.com>
        <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/15/19 05:18, Fuqian Huang wrote:
> In commit 518a2f1925c3
> ("dma-mapping: zero memory returned from dma_alloc_*"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed

I can't see any changes in the above mentioned commit that would
make dma_alloc_coherent() (arm_coherent_dma_alloc()) zeroing its
returned memory. Maybe you need to add a reference to some other
instead?

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>

>  drivers/media/platform/exynos4-is/fimc-is.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
> index e043d55133a3..77633e356305 100644
> --- a/drivers/media/platform/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/exynos4-is/fimc-is.c
> @@ -341,7 +341,6 @@ static int fimc_is_alloc_cpu_memory(struct fimc_is *is)
>  		return -ENOMEM;
>  
>  	is->memory.size = FIMC_IS_CPU_MEM_SIZE;
> -	memset(is->memory.vaddr, 0, is->memory.size);
--
Thanks, 
Sylwester
