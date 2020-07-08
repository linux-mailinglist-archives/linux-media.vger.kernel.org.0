Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F205B218C37
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 17:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbgGHPtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 11:49:10 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55959 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbgGHPtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 11:49:08 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200708154906euoutp01076d69dad2b14a2fe006c8251624f1bd~f0a-htoUK1111411114euoutp01S
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 15:49:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200708154906euoutp01076d69dad2b14a2fe006c8251624f1bd~f0a-htoUK1111411114euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594223346;
        bh=e47WUtElI6NLP2XC8SW6uhTopwHfPoZ79ohPTaIjU74=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=ubQ7QgPR+WO2FCPoCTEljPo00kuEqPPs82Kd2zLYmW9kt8b2OA4FWpkshzJ+212RO
         J7oBchgTib4Ucr+vCibmZgVcOphiSkll5+zI5qnq9FOpEf+GiS+/OJ6ceBV90VLBHr
         3JZ8PcdqoPrYUIh4hZ7y66ArXlmlQfJM3iNK3gJo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708154906eucas1p2ecaf88c8a196c97367658706dce62c38~f0a-PSoVF2185821858eucas1p2p;
        Wed,  8 Jul 2020 15:49:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6B.5B.06318.2FAE50F5; Wed,  8
        Jul 2020 16:49:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200708154905eucas1p17c549a663b60afe6553a5e36fc79529f~f0a_6oCi41669116691eucas1p1N;
        Wed,  8 Jul 2020 15:49:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200708154905eusmtrp15917e249f0b245d805ba99b11c91db73~f0a_0Kl1h2084320843eusmtrp1Q;
        Wed,  8 Jul 2020 15:49:05 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-5f-5f05eaf2203f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.F7.06314.1FAE50F5; Wed,  8
        Jul 2020 16:49:05 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708154904eusmtip23d1da2cec441403b409b918e6dbcf5fa~f0a_JbAFp0494704947eusmtip2J;
        Wed,  8 Jul 2020 15:49:04 +0000 (GMT)
Subject: Re: [PATCH 09/11] media: exynos4-is: Remove unused struct member
 input_index
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <273bc27c-666c-3469-131a-b6663cd99913@samsung.com>
Date:   Wed, 8 Jul 2020 17:49:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRTte9s8l7HPUfGiZjUZqJRmJjwypMRgfvYjEMylKV9qOmrz1Fx+
        ZCmWuyY0OgrFpGWCKS83jCyFlHCZNpcWS1DLbUzToFQyx6fkv3PPOfe791w+llSItBMbE5/E
        a+PVcUrGkmrp/mM8/HOGjjgylctwxeOzJGc0Nsq4/htzMk4cH6K5d+1VDFfQ2Exz5cYOgnsg
        rhHcm9JR6qSFSqzLZVRPqq+pDB9+U6qipjqkWhJdz9Ahlici+biYFF7rHXDeMvrt5HVZ4ghK
        NXW7Z6JmlIcsWMDHoKyvks5DlqwC1yIYrv1CmgUFXkbQWekhCUsIdFN3iO2OrIVqQjI9RNA0
        clkyLSLIWRjceJZl7XAw6AZkZt4eZxHwrbaCMTcw2AcKXxZtjpbjAOisebyJKewGndmlmx4H
        HA4N062E5LGFVxUTlBlb4DAo7xjd9JDYET5O3CUkvBdaTVWkeRjgFhk8f7HKSJsGgdhTLpOw
        Hcz0NG1hF+gtK6CkhiwEBU8/yaSiBMHXnntbl/GHzwMrjDkOiT2god1bok9B8f1BmZkGbAMj
        JltpCRu43aIjJVoOt3IUktsNVut0W4dzgvyJdUrCKihr6SNL0H79jpj6HdH0O6Lp/+9wD1F1
        yJFPFjRRvOAbz1/1EtQaITk+yutigkZEGz+p92/PrzbUsXahC2EWKa3lUyIdoaDVKUKapgsB
        Syrt5YH9veEKeaQ6LZ3XJkRok+N4oQs5s5TSUe5rmA5T4Ch1Eh/L84m8dlslWAunTJQiWp0d
        DgkIPD1/bjQx+FAesrLLcBG8lCnpFTPCGLgOtc1Priwu+zmbdjfAmMFndWTfvHei6ZnHrL7J
        JReY4fz3RGixwfFAc216ao2bLmadzjLsCU7wy5gr9GRnHR4VXVr5EYrrx0rqs/sPfo/014a/
        DtrlHntzYtxaOH70ipISotU+nqRWUP8D8lqlfUUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7ofX7HGGyxerGbR//g1s8X58xvY
        Lc42vWG32PT4GqvF5V1z2Cx6NmxltZhxfh+TxbJNf5gsLk68y+LA6bFpVSebx+Yl9R6Lbv5g
        8ejbsorR4/MmuQDWKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
        zLLUIn27BL2MS08b2QtuMFa8PabRwLiVsYuRk0NCwESi+cMSJhBbSGApo8SeT0ldjBxAcSmJ
        +S1KECXCEn+udbF1MXIBlbxnlFjSNo0NpEZYIFxi+jl2kLiIQDOTxP/l21ggiu4ySrzY+5oF
        pJtNwFCi92gf2DJeATuJg0vXgdksAioSB1smsoHYogJxEsu3zGeHqBGUODnzCVgvp0CsxIx9
        d8FqmAXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGwVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz
        03OLDfWKE3OLS/PS9ZLzczcxAmNt27Gfm3cwXtoYfIhRgINRiYf3xSbWeCHWxLLiytxDjBIc
        zEoivE5nT8cJ8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wDeSVxBuaGppbWBqaG5sbm1ko
        ifN2CByMERJITyxJzU5NLUgtgulj4uCUamAUv2ycevXE8qsBjDM53D4nVMy5773jotSLX/sO
        bLJdlppyM7790uEYNuGgu/q1fIEhgvOS/pb+vl9p48z27vKupb1ZzIafMi4vW2FXKF24pi7j
        3rq4uH8lP+q4T1ddzJ759OXpnpWH/Zg7BWQyzy/98PLp1OubTM3Pbrjd4Rw+59Jsc6EiOaaD
        SizFGYmGWsxFxYkA/asPbssCAAA=
X-CMS-MailID: 20200708154905eucas1p17c549a663b60afe6553a5e36fc79529f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022746eucas1p1960766a3b9a7caee4e83afbb3d8c3e8c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022746eucas1p1960766a3b9a7caee4e83afbb3d8c3e8c
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022746eucas1p1960766a3b9a7caee4e83afbb3d8c3e8c@eucas1p1.samsung.com>
        <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> This is no longer used since the conversion to DT
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
