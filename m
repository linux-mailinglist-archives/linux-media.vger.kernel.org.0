Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1983E36C182
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 11:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhD0JPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 05:15:23 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64870 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhD0JPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 05:15:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210427091438euoutp01c4d5d6717f78ced10970b98e4d1c47e6~5rDORNr0L2734427344euoutp01r
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 09:14:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210427091438euoutp01c4d5d6717f78ced10970b98e4d1c47e6~5rDORNr0L2734427344euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619514878;
        bh=ufhY3SEllLzKRUHv3sboI3d/+cn3OKREoE8yyxCXiMs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=jvIpsqrZCLQo5074MjgbQh1Q+B1qCtew2ZIy/h61TcWIGu1NIFYiFYd+j3+MaOfgy
         1dqcdoCyJmUB7RGwv3Lc6SXqz08BODQjtuofEA5t7zSWXKiOHRtElooOin/DeMlAIf
         N96hk+Swb9CVKEtwTxldVM+3g6obTYqJx1/ud7jE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427091438eucas1p1fe40a31de28d52789840bf7e2a617c13~5rDN4MW7y3207632076eucas1p15;
        Tue, 27 Apr 2021 09:14:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CD.07.09439.DF5D7806; Tue, 27
        Apr 2021 10:14:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210427091437eucas1p1247ffec745713833356779f8d9de9d64~5rDNRsdCk3208932089eucas1p1r;
        Tue, 27 Apr 2021 09:14:37 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210427091437eusmtrp2b3f14af180a72e3cd78262d2a4e3b0c4~5rDNQza841941219412eusmtrp2R;
        Tue, 27 Apr 2021 09:14:37 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-82-6087d5fd443d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.4C.08696.DF5D7806; Tue, 27
        Apr 2021 10:14:37 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210427091436eusmtip26155ce0f777f764e30565bd5f78c80fa~5rDMresLG1909919099eusmtip2M;
        Tue, 27 Apr 2021 09:14:36 +0000 (GMT)
Subject: Re: [PATCH 21/78] media: s5p-jpeg: fix pm_runtime_get_sync() usage
 count
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <d5509bf0-78b6-dde8-5925-ea07d78c7ece@samsung.com>
Date:   Tue, 27 Apr 2021 11:14:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <01560ba01a8e6ecb0e2e525e9b47a544c04f735c.1619191723.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUwTURDGfbvbdlvTZi2YDmDU1CtqKN6uQBDPNOIFNdHgQStuAKVguoJo
        YkAQVKRSlEgsRlC5rKjQWpSiYFBBxQNj6gVYSTFRhISCJihetOvBf7+Z+eZ93ySPxKVlPF8y
        LmEPo0vQxMv5IqKm6etT/x/2w+pZlzuD6IrKLkS3WasI2ux8waOf287w6ZwqK4++U/0Io7OK
        n/PpzkI7osvM37FQobLW2CFQHrrby1OaTUf5SktJqnLAPH49L1IUvIOJj0tmdAEhalGsqa8W
        393AS2kvEaehJ0Q2EpJAzYOeh5dQNhKRUqoCQbr5PcYVnxHU9OcLuGIAwYe+jn8r3+538N0s
        pcoR5NujOHYhsN30cbMXpYIsY5VH403Nh9fdRz2v4lQpBrn1ds+AT80G/b3jyM1iKgSqC8s9
        BgQ1BQpNnbibx1LR8NRpF3CaMfDgdJdHI6TUcNs25NnFKRm86SrCOJ4A13vP4G4zoHpIsGTo
        /6ReDq76TzjHXtDdfE3A8Tj4VVuEcQsZCHLq2gRcYUDgaC5GnCoI2p98G45NDltMh6u2AK69
        BBy5VsLdBkoCr3rHcCEkcKKmAOfaYjiSJeXUk2HIVIBx7AvHun4RBiQ3jjjNOOIc44hzjP99
        ixFhQjImidXGMOzcBGavgtVo2aSEGEV0otaMhr9Sy8/mLzdQRbdL0YgwEjUiIHG5t5hvy1RL
        xTs0+/YzusQoXVI8wzYiP5KQy8Q2a2WUlIrR7GF2McxuRvd3ipFC3zRs01ZLWOgtl3WLT8ab
        RJlf+JoFq1SREfV4SdngTMnFA6O2jZ25IjHPb8nFx3UN9xYVVV439DMnJXPeFhy8G/E1simv
        OnPpy8/z8oNYa/60j1bJ+XX6U/qzD1IMbPrqwUkKl8qh6xmccXb9MpcipDb3rTCwhgjU7F2c
        fC2ZwJ6V7iw6F/3lYATj5y82NLVQV8ItD1duWhC2yFvwgjZuuZneP9QQ3Cudnqlaqk169bGl
        z2vtLWeQNtDxvXmDTNQqysi2Z10YL5qWZi82smpVzObQd3gqv9W50n/dKJ+AhVWt82+XprS1
        1qVaRjc5wqL6+5wbJyoqt0+VptRDsHfLQLt+To6cYGM1s2fgOlbzGx+AxBC5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7p/r7YnGCyeKmqxYs0TRovbWzew
        WGx6fI3V4vKuOWwWPRu2sloc3niGyaJtwWU2i4ezrzJaLNv0h8mB02PnrLvsHi1H3rJ6bFrV
        yeaxeUm9x+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5
        mWWpRfp2CXoZqz7sZC7Yz1pxZwlvA+M5li5GTg4JAROJXyfusnUxcnEICSxllHjT287excgB
        lJCSmN+iBFEjLPHnWhdUzXtGiXnXz7CDJIQFgiXaZm1gA7FFBEwlbr7qZAIpYhZYziTxdvIq
        FoiOZ4wSV/d8A+tgEzCU6D3axwhi8wrYSWycvRzsDBYBVYnZqx4yg9iiAskSq39vZoWoEZQ4
        OfMJWA2nQILEgV2/wXqZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7zBEahWUjaZyFpmYWkZRaS
        lgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzEC43DbsZ9bdjCufPVR7xAjEwfjIUYJDmYl
        EV62Xa0JQrwpiZVVqUX58UWlOanFhxhNgf6ZyCwlmpwPTAR5JfGGZgamhiZmlgamlmbGSuK8
        JkfWxAsJpCeWpGanphakFsH0MXFwSjUwcTwpEM6TvTL/keFHA0+9YNvI039S71RcXSbcHmk1
        c338+3vvuxv5L6audD01b3a4ttBj/c0lm/LnPmsWmcZSfVr1yUmtzNxjbG+3ZBcfiNoorazW
        e+fIhcPCh274/MpONFF+9/Os+rZtF16Fir7Y7qi3+6CPzy8n01Wh4vVmAnWJQqVr9M4fuPby
        nNy5vuAT67Wa+qWjtDQ2tJgqPU/u2i1T3FSX9n7t+6dFK8JarX7MXqCo927W+81W2oyyAm3T
        M9Y9bF1/5BoT67EFk011Ihv/f15mJGa40qQ55/e063MaWt0PTlpQXVw8K1yM9VLEc2fTUp03
        sVn3+E/x3T50dddiG60NsUYXes1u8F7IVGIpzkg01GIuKk4EAK/uRYlMAwAA
X-CMS-MailID: 20210427091437eucas1p1247ffec745713833356779f8d9de9d64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210424064539eucas1p2f05b6e94d755623d4e70a21f0a681c94
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210424064539eucas1p2f05b6e94d755623d4e70a21f0a681c94
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064539eucas1p2f05b6e94d755623d4e70a21f0a681c94@eucas1p2.samsung.com>
        <01560ba01a8e6ecb0e2e525e9b47a544c04f735c.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.04.2021 08:44, Mauro Carvalho Chehab wrote:
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> replace it by the new pm_runtime_resume_and_get(), introduced by:

s/replace/Replace

> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.

Thank you for the patch. I'm not sure if that could cause any memory
leaks, for sure not optimal power handling for the device.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
