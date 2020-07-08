Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A9218A57
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729919AbgGHOpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 10:45:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47319 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729899AbgGHOpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 10:45:34 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200708144532euoutp02c6ac876df1e242c879c7cfd9d7bb8782~fzjfmIPbH1968519685euoutp02U
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 14:45:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200708144532euoutp02c6ac876df1e242c879c7cfd9d7bb8782~fzjfmIPbH1968519685euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594219532;
        bh=YBwMR+1cTI/+5nGmGVzzQP31lKTZwJfbm6Wde/Ufl4A=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=PL5cI5quI6staJfHOmmKGhIaJO34dXKTXMQe6A2lZHo8sFXDG8u7zJvRkt+VBSlCs
         IwhBQ/9435Q8ni4H/kvNTqhtQBDTKX8NaV99fqbFV3YJrzm+MEHw7fEQ+Pr9on+2qr
         NEgK9HVKP/L3aoTMx3hIarOCbmR9W1/pHd86ElIw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200708144532eucas1p221e9f49e596935cc2446d90228401a3f~fzjfPTn_W1367413674eucas1p2C;
        Wed,  8 Jul 2020 14:45:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.11.06456.C0CD50F5; Wed,  8
        Jul 2020 15:45:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200708144531eucas1p282845354a7c2be8f70f4ef33a4d6bb1d~fzjej49pg1036510365eucas1p2i;
        Wed,  8 Jul 2020 14:45:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200708144531eusmtrp2ef4e5df9d1dadc6a8f4a07e032e94097~fzjejK8C_2076020760eusmtrp2O;
        Wed,  8 Jul 2020 14:45:31 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-5d-5f05dc0c78d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A5.70.06314.B0CD50F5; Wed,  8
        Jul 2020 15:45:31 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200708144530eusmtip2637227708c7bfcdd7c9c536e8be47371~fzjd7MV-g0039100391eusmtip2D;
        Wed,  8 Jul 2020 14:45:30 +0000 (GMT)
Subject: Re: [PATCH 01/11] media: exynos4-is: Remove static driver data for
 S5PV210 FIMC variants
To:     Jonathan Bakker <xc-racer2@live.ca>, kyungmin.park@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <9dae0088-e7ab-8d20-617d-7922d86f0d43@samsung.com>
Date:   Wed, 8 Jul 2020 16:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB06603A626BB6D54D11CB502CA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO+dsOw4nx2n5pmI5/ZOUt/xxIhOVfgwiEUoIRW3qQcVrO95D
        lBQ1L2v6Q1MMTeZai3BMnWaReE+Ws4zsomYwC69kXiKzNOdR8t/zPhfe9/n4SFzcyXMkE1Mz
        GHmqLFnCFxKG4S3TWetpXrT36CMhfde8hNPj4zoBPXZ7WUDrzZM8+m1PI5+u1HXy6HvjLzBa
        rf+D0W+qZ4hAK6lee4cvbVcVSFs+/iKkig4tkq7rXUJ54UL/OCY5MYuRewXcECboVWO89Fks
        Z7tOiRciFVaOrEig/ODloIZfjoSkmNIg0BWXI27YQFB7fwjjhnUEqxq14DAy87nmQHiIwPjA
        uC+IqR8IJndiLNiOioXabbPAYrKnijD4pqnnWwQ+5QNVQwpkwSIqAAa+LxEWTFDuYJjQ7PPH
        qChoW+jCOI8tjNbP7XusqEhoNw7iFoxTDvBprgnj8EnoWmnELcuAMghAv9iHuFMvwczzn3wO
        28HiSMdBBWfYfdqEcYEiBJXPpgTcoEQwO9J8kL4A06bfe2lyb8VpaOvx4uggaH2twCw0UDbw
        YcWWO8IGagx1OEeLoKxEzLndYVtbd/DYjlAxt0twWAom9TxfiVwbjtRsOFKt4Ui1hv83NCNC
        ixyYTDYlnmF9UplsT1aWwmamxnvGpqXo0d5nMu6MrHWjzYmYfkSRSGItUup40WKeLIvNTelH
        QOISe1HwmDFKLIqT5eYx8rRoeWYyw/YjJ5KQOIjOtSxEiql4WQaTxDDpjPxQxUgrx0LkHbGc
        SLeXDodnjJkHMqkCWzD15VweCMu+svb3lH/32vUTvfNq5abeN9C0FNiuKlw4vlW++PhWx8b7
        r/l+icVPQi+6+ay+CwlxFURIXaryztdX9970zTdOVkSWBZeuVm+WjLu0Jim01blXS7+EeXgo
        2VfNztfIMzlBXm6tq074lIRgE2Q+Hriclf0DXTCoDEgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7rcd1jjDe5flrDof/ya2eL8+Q3s
        Fmeb3rBbbHp8jdXi8q45bBY9G7ayWsw4v4/JYtmmP0wWFyfeZXHg9Ni0qpPNY/OSeo9FN3+w
        ePRtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7GpiVnWQvuM1X8nj6BuYFxCVMXIyeHhICJxN17k4BsLg4hgaWMEls//wJyOIAS
        UhLzW5QgaoQl/lzrYoOoec8osXzSbTaQhLBAssS034/ZQRIiAs1MEv+Xb2OBqLrLKNH9+BZY
        FZuAoUTv0T5GEJtXwE7i8PvXLCA2i4CKxLZLK8DiogJxEsu3zGeHqBGUODnzCVgNp0CsxObT
        R5hBbGYBdYk/8y5B2eISt57MZ4Kw5SW2v53DPIFRcBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc
        9NxiQ73ixNzi0rx0veT83E2MwIjbduzn5h2MlzYGH2IU4GBU4uF9sYk1Xog1say4MvcQowQH
        s5IIr9PZ03FCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MBnkl8YamhuYWlobmxubGZhZK
        4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhjVMu6LtLdk3ZvdECKTfDuKq5ihe82V1zd1T+x9
        MVn8V+qx/3aNXB0KTRMncrMYzGmQejRTqWXJiidc4cKHSu+8V9zKpXrO/hsbj8qN300XHukY
        Lch09eV5Z8CxOJPVoe755WX9b7atK1hbqJP6X6fjw50VYcvrbZ+x+N4I1+ZKEf3q+kjgYo4S
        S3FGoqEWc1FxIgAxbc5IzgIAAA==
X-CMS-MailID: 20200708144531eucas1p282845354a7c2be8f70f4ef33a4d6bb1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200426022721eucas1p1d5cbdc4946279aeff7d6c11f93a56f74
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200426022721eucas1p1d5cbdc4946279aeff7d6c11f93a56f74
References: <20200426022650.10355-1-xc-racer2@live.ca>
        <CGME20200426022721eucas1p1d5cbdc4946279aeff7d6c11f93a56f74@eucas1p1.samsung.com>
        <BN6PR04MB06603A626BB6D54D11CB502CA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.04.2020 04:26, Jonathan Bakker wrote:
> The S5PV210 platform only supports device tree based booting
> where the FIMC variant data is parsed directly from
> the device tree, hence the now unused static data can be removed.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
