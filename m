Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1D6218A63
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 16:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgGHOrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 10:47:33 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47933 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgGHOrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 10:47:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708144731euoutp02ebd7336d18d766a60b09132590a71bfe~fzlOQbcyr1968519685euoutp02b
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 14:47:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708144731euoutp02ebd7336d18d766a60b09132590a71bfe~fzlOQbcyr1968519685euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594219651;
        bh=ViiMOJCBbxi2+iuATmMr1L9GKNGz+b2VRkUFLdZuwVE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=URJLugTZrUmDvs8hHiqT1itDeZekNe6q4NjF/J8kEBbmC0Fg3I7UBei1bEZDCIWRs
         3SR3JbVhNRpRWvRSYAaL55PO+hI5zwvLjHqGPLrlf2165Q6ab5k46CJqhmUTyJIOU8
         oZt+f+xMWCDDTE5SWGmp8Jwcaj5O2wuQAITeJ06c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200708144731eucas1p15efde121434a4e112648738aed977ac3~fzlN4B7hT2544125441eucas1p1J;
        Wed,  8 Jul 2020 14:47:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 82.61.06456.28CD50F5; Wed,  8
        Jul 2020 15:47:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200708144730eucas1p1234baf92046e1e94c313ad6741f7b484~fzlNhbqWl0490004900eucas1p1a;
        Wed,  8 Jul 2020 14:47:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200708144730eusmtrp1efab9edd034aea689db00aba672e4d03~fzlNgr4y71277812778eusmtrp1l;
        Wed,  8 Jul 2020 14:47:30 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-bc-5f05dc82398e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.B0.06314.28CD50F5; Wed,  8
        Jul 2020 15:47:30 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708144729eusmtip28f34d8d0eb54e08c36fc474fdd5c15ce~fzlMuFrDL3217032170eusmtip2i;
        Wed,  8 Jul 2020 14:47:29 +0000 (GMT)
Subject: Re: [PATCH 02/11] media: exynos4-is: Request syscon only if ISP
 writeback is present
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <8cf458a6-68b8-4fca-eb14-6db03bbdb3d9@samsung.com>
Date:   Wed, 8 Jul 2020 16:47:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djPc7pNd1jjDV5/M7fof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWq3b9YbS4OPEuiwOXx85Zd9k9Nq3q
        ZPPYvKTeY9HNHywefVtWMXp83iQXwBbFZZOSmpNZllqkb5fAldF0bwN7wSPmirdH1jI2ME5n
        7mLk5JAQMJE40bGQqYuRi0NIYAWjRMPrfmYI5wujRNO+81DOZ0aJC6eXssK0XG++wAqRWM4o
        8Wv3aqiqj4wSp3rvsYNUCQvES7y/+oEFJCEi0Mwk8WzFTDaQBLOAusSvUydYQGw2AUOJ3qN9
        jCA2r4CdxMt/N8DiLAIqEnveXASzRQXiJNa/3M4EUSMocXLmE7A4p0CsxMW9r5ggZopL3Hoy
        H8qWl9j+dg7YRRIC59glfjw+wARxt4vEs5bZUG8LS7w6voUdwpaROD25hwWioZlRomf3bXYI
        ZwKjxP3jCxghqqwl7pz7BfQCB9AKTYn1u/Qhwo4Saw9tZAQJSwjwSdx4KwhxBJ/EpG2gIAYJ
        80p0tAlBVKtI/F41HeocKYnuJ/9ZJjAqzULy2iwk78xC8s4shL0LGFlWMYqnlhbnpqcWG+al
        lusVJ+YWl+al6yXn525iBKar0/+Of9rB+PVS0iFGAQ5GJR7eCRtY44VYE8uKK3MPMUpwMCuJ
        8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUA6OD
        vSu3GVf+QcOyTX7TyxeovGsPXG+zubR24Rcxr5mzNx43rzmptpJzuj7jtFP+t0u+nyl+sTCY
        XSpM5sJRxqf870qqD785cltpTY+Q4fdNq2KXzNfv0y7q+R8el3PExznT4jqb1JwVdzo0eLdN
        bP6zUHnaLZOuzzzR76UWbtiRs6jI9sWcxKVKLMUZiYZazEXFiQDoH3M0UwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7pNd1jjDY5PVbHof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWq3b9YbS4OPEuiwOXx85Zd9k9Nq3q
        ZPPYvKTeY9HNHywefVtWMXp83iQXwBalZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwe
        a2VkqqRvZ5OSmpNZllqkb5egl9F0bwN7wSPmirdH1jI2ME5n7mLk5JAQMJG43nyBtYuRi0NI
        YCmjxJPt69m6GDmAElIS81uUIGqEJf5c62IDsYUE3jNKPD6qAmILC8RLvL/6gQWkV0SgmUni
        //JtLCAJZgF1iV+nTrBADL3LKNH7bCNYgk3AUKL3aB8jiM0rYCfx8t8NsDiLgIrEnjcXwWxR
        gTiJ5Vvms0PUCEqcnPkELM4pECtxce8rJpgFf+ZdYoawxSVuPZkPFZeX2P52DvMERqFZSNpn
        IWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjc9uxn5t3MF7aGHyIUYCD
        UYmH98Um1ngh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+
        MG3klcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgDJ3f9Y/lvOKp
        qtUTp1ms9VrMs4XxxW/tH1JpQhKr+VqZJ7hfClm2wop5udzR7pWC9aG73l/du7o+PmPShrPz
        r280uuNp8OZuYfNLzuccfgzpx+wbfly19Pk928U+fF5qQrEVW8Xq9Lj/1cd3L2mwPPVlud6R
        uUIKyZ1OvlsnGL8u/muZwK18RImlOCPRUIu5qDgRADhzcufjAgAA
X-CMS-MailID: 20200708144730eucas1p1234baf92046e1e94c313ad6741f7b484
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022729eucas1p1f2db1e439ed5b74b00c97ec4823f72ea
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022729eucas1p1f2db1e439ed5b74b00c97ec4823f72ea
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022729eucas1p1f2db1e439ed5b74b00c97ec4823f72ea@eucas1p1.samsung.com>
        <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> On FIMC variants which don't have writeback channel, there is no need to
> access system registers. This patch makes the driver request sysreg
> regmap conditionally depending on whether writeback is supported.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
