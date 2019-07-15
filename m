Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F2068850
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 13:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbfGOLoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 07:44:23 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56113 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbfGOLoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 07:44:23 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190715114421euoutp02bdd8c5e7175f8168b237988c3f2e853f~xkf0S64GK0459004590euoutp02Z
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2019 11:44:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190715114421euoutp02bdd8c5e7175f8168b237988c3f2e853f~xkf0S64GK0459004590euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563191061;
        bh=AwKQQepnCnmb88Wi6ptLbfbyKlASrHTT4QV8bbPXfpI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=O0Vb5zf5wLDPDGFSBrUSu+KdIp6EYTOjjt2Q/s3PeP/nrfvHY59mr7dciwoht0go/
         Xyn8UH+40eP/jGFy/orUeg57TWaeFB4JStlZa/Sp8eiM0c4fItB7bguEidxewCmiwb
         vBFBO7pLrn+eCvrwilI9UpggCQ5Ahp70kkprEr8Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190715114421eucas1p213669de44f9e9b06b2c2b8f811ec8f91~xkfzqES9Y0781407814eucas1p2P;
        Mon, 15 Jul 2019 11:44:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 19.0D.04298.4176C2D5; Mon, 15
        Jul 2019 12:44:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190715114420eucas1p28a118f4655551e1030df35799f911ba9~xkfy6Cy9X1570915709eucas1p2x;
        Mon, 15 Jul 2019 11:44:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190715114420eusmtrp2ddfbc3b00f16264a6859da595d45c4f1~xkfyr9GIZ2170321703eusmtrp2d;
        Mon, 15 Jul 2019 11:44:20 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-5e-5d2c67149f4e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A0.88.04146.3176C2D5; Mon, 15
        Jul 2019 12:44:20 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190715114419eusmtip1f0fbf70115617422cab814a310162408~xkfySZ4Hw0464504645eusmtip15;
        Mon, 15 Jul 2019 11:44:19 +0000 (GMT)
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after
 dma_alloc_coherent
To:     Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <189ad2a0-c8ba-54f5-af34-5a0e8efee8fe@samsung.com>
Date:   Mon, 15 Jul 2019 13:44:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7djP87oi6TqxBkvWGFssO3WS1aL/8Wtm
        i/PnN7BbnG16w26x6fE1VovLu+awWfRs2MpqMeP8PiaLZZv+MDlweuycdZfdY9OqTjaPzUvq
        Pfq2rGL0+LxJLoA1issmJTUnsyy1SN8ugStj+fZzrAXtzBVN96axNjDuYupi5OCQEDCRuPbW
        rYuRi0NIYAWjRPP2/8wQzhdGiclzt7F3MXICOZ8ZJe5/FYdpOLfMG6JmOaPE8c2f2CGct4wS
        Z9oOMYM0CAskSvRM+8IEYosIaEt8PN0CNpVZ4AGTxIwPx9hAEmwChhK9R/sYQWxeATuJ6xv2
        gNksAqoSL86vA7NFBSIkTh2ZxwJRIyhxcuYTMJtTIFDiX+dzsOuYBcQlmr6sZIWw5SW2v50D
        doSEwCF2ick3eSBsF4lTz34yQdjCEq+Ob2GHsGUk/u+czwRynIRAM6NEz+7b7BDOBKCXjy9g
        hKiyljh8/CIryP/MApoS63fpQ4LCUeLKLRMIk0/ixltBiBP4JCZtm84MEeaV6GgTgpihIvF7
        1XSoC6Qkup/8Z5nAqDQLyWOzkDwzC8kzsxDWLmBkWcUonlpanJueWmyYl1quV5yYW1yal66X
        nJ+7iRGYkE7/O/5pB+PXS0mHGAU4GJV4eB1StGOFWBPLiitzDzFKcDArifDafgUK8aYkVlal
        FuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYFwetnhH8oqT5c8fqO9e
        OV2e+bKq3LFVEY7cerLT5hQdvxdxlk+qV/VD/Qn5jLVTJ/kHvY9Lr0pov1hoejjtWnDjt7Xe
        Easv7p35+1tpvsh0nhOTtY953udMSVPd3MjiuJJfaKnDdRm74Cv5HWEr3jvYqIfcqpiZeP3/
        Do4HYuePaao3TrsVn67EUpyRaKjFXFScCABuwyNCRAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7oi6TqxBk9OMlksO3WS1aL/8Wtm
        i/PnN7BbnG16w26x6fE1VovLu+awWfRs2MpqMeP8PqC6TX+YHDg9ds66y+6xaVUnm8fmJfUe
        fVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZ
        llqkb5egl7F8+znWgnbmiqZ701gbGHcxdTFycEgImEicW+bdxcjFISSwlFFiz+FOdoi4lMT8
        FqUuRk4gU1jiz7UuNoia14wSq06/YwdJCAskSvRM+8IEYosIaEt8PN3CDFLELPCISeJfz3d2
        iI4eJom7F54zg1SxCRhK9B7tYwSxeQXsJK5v2ANmswioSrw4vw7MFhWIkJh0bScLRI2gxMmZ
        T8BsToFAiX+dz8E2MwuoS/yZd4kZwhaXaPqykhXClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYF
        jCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAuNw27Gfm3cwXtoYfIhRgINRiYfXIUU7Vog1
        say4MvcQowQHs5IIr+1XoBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA1NEXkm8oamhuYWl
        obmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxhmXq1g439pfk2dV2FtdNOnFr+9e
        IomnZn87uXDWiolzvn4+f3bNyyuTzlpvsnz2R/zRrlUfNybumKm4c/rbo0oBrh6akVrfshoc
        b7V6T1kiocb/tSRi0wrJaU/lmaUP1pRFaa1M9njotu8/96/OffGbv26TyTqoEhx3eQ+bVQWj
        mnt4TMN+zu1KLMUZiYZazEXFiQAo7uLT2QIAAA==
X-CMS-MailID: 20190715114420eucas1p28a118f4655551e1030df35799f911ba9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd
References: <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
        <20190715031851.6890-1-huangfq.daxian@gmail.com>
        <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
        <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/15/19 11:43, Fuqian Huang wrote:
> Should I rewrite the commit log? Just mention that dma_alloc_coherent
> has already zeroed the memory and not to reference the commit?

I don't think it is really needed, since at hash 518a2f1925c3 dma_alloc_coherent() 
already zeroes the memory, so in fact all statements in your current commit 
message are true. 

-- 
Regards,
Sylwester
