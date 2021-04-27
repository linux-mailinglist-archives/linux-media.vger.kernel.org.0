Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAE536C0B0
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 10:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234561AbhD0IS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 04:18:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15500 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhD0IS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 04:18:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210427081814euoutp01649cb59bdf17fde6fa627c044dbda2f1~5qR_yzwTH2941029410euoutp018
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 08:18:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210427081814euoutp01649cb59bdf17fde6fa627c044dbda2f1~5qR_yzwTH2941029410euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619511494;
        bh=rWw6Tw10qSxMP/aYL1ato5GIYt+P77hpHOeiD6gAOe0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=WBlFiPsl90XGq/EExu3kHadXmEuXUGwrVAUU/EdvxowaLecr0SfHuia68ZPGw0h+3
         sxElwlXMw15tY01FA8T6Z8CHT9Bdi25YW1e/J7eYQG5zs0A+nRO+uss1XN26DZudCY
         es5LXtmiRiqOk5fOj991AwO1+c2u4ueHIXzdg6kE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210427081814eucas1p1526248e463d4151ba0e4fa71e0ecbc75~5qR_XmA1X0352703527eucas1p1J;
        Tue, 27 Apr 2021 08:18:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.56.09444.6C8C7806; Tue, 27
        Apr 2021 09:18:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210427081813eucas1p2a3ca16a3a6cdddbf50276d28b4211489~5qR94-q731032210322eucas1p2V;
        Tue, 27 Apr 2021 08:18:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210427081813eusmtrp21a8ebea2b2405264cc341f90c17f54ae~5qR94Ou0X2209022090eusmtrp2X;
        Tue, 27 Apr 2021 08:18:13 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-64-6087c8c69b9e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 61.96.08705.5C8C7806; Tue, 27
        Apr 2021 09:18:13 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427081812eusmtip133f6b58731c3349de435b0e00a91b1ee~5qR9Fq63m1809918099eusmtip1Q;
        Tue, 27 Apr 2021 08:18:12 +0000 (GMT)
Subject: Re: [PATCH 58/78] media: exynos-gsc: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
Date:   Tue, 27 Apr 2021 10:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87rHTrQnGMw9y2qxc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KK4bFJSczLLUov07RK4Mr5fbmQsaOWrmLPl
        DlMD41vuLkZODgkBE4nd536xdTFycQgJrGCUmPLrDDuE84VRYv3Ue1DOZ0aJWZMesMO0nDq/
        hBkisZxRom/yGkYI5yOjxIwNx1hAqoQF/CU2PX7GCmKLCJhK3HzVyQRiMws8YpI4O0EWxGYT
        MJToPdrHCGLzCthJ/P3+D6yXRUBV4tzB3cwgtqhAssT5x1fZIWoEJU7OfAJWwymQIHFz8kIW
        iJniEreezIeaLy+x/e0csOskBNo5JWZ8O8wGcbaLxKmumUwQtrDEq+NboN6Rkfi/E6QZpKGZ
        UaJn9212CGcCo8T94wsYIaqsJe6Aw4kDaIWmxPpd+hBhR4m2CZPZQcISAnwSN94KQhzBJzFp
        23RmiDCvREebEES1isTvVdOhTpCS6H7yn2UCo9IsJK/NQvLOLCTvzELYu4CRZRWjeGppcW56
        arFRXmq5XnFibnFpXrpecn7uJkZg2jr97/iXHYzLX33UO8TIxMF4iFGCg1lJhJdtV2uCEG9K
        YmVValF+fFFpTmrxIUZpDhYlcd6kLWvihQTSE0tSs1NTC1KLYLJMHJxSDUzCnLPWfn2mXHNn
        TtqGAzelQ8LzNO6oTvHZHvlj8mS7Lf8vLD/rJM96gFlkH0fp38VrUqSKV197W3f9/b6dL6pM
        Ay9yFVjd2DNr188565ev+KDNzsf3tuC5W9LT1xuMFAVOfKu+uKL/q3/PbteFWlVxRpYJnN/m
        rRGR+3vf+8rOxumFk2X2TT693/ZqSc4tgwMCQSw+F3o3zi+fxvqllb+bR9GbbX1QyqMTyeuX
        7VpcPkli9oG25kS7d7LRTedCLT0P3/swU8JE/75f6MaHK4xPdvzhyjAxmZSapV7Mynt3+gKt
        1T+adNYvV5a/3nzl7u9bDV6SM7bI9Lta65v7v9pzWtlQVjo1Zo+gnU/HS8FIJZbijERDLeai
        4kQAH+1cY8oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7pHT7QnGNw/Lm+xc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxM
        LPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr5fbmQsaOWrmLPlDlMD41vuLkZODgkBE4lT55cw
        g9hCAksZJdZ8FOhi5ACKS0nMb1GCKBGW+HOti62LkQuo5D2jxMr2T2D1wgK+Eh9bf7CC2CIC
        phI3X3UygRQxCzxjklh0cQdUxzNGiRn7bzOBVLEJGEr0Hu1jBLF5Bewk/n7/xwJiswioSpw7
        uBtsqqhAssTq35tZIWoEJU7OfAJWwymQIHFz8kIwm1lAXeLPvEvMELa4xK0n85kgbHmJ7W/n
        ME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBKtx37uXkH
        47xXH/UOMTJxMB5ilOBgVhLhZdvVmiDEm5JYWZValB9fVJqTWnyI0RTon4nMUqLJ+cA0kVcS
        b2hmYGpoYmZpYGppZqwkzrt17pp4IYH0xJLU7NTUgtQimD4mDk6pBqY9we33zzHyFC5eYrQl
        95R+Zq9pjO6Gv62dghLHp1gf78yudzc6vJPHTuTY/El6789M3FZc9o/nzz3Oh0zqpUanb518
        fKG3on2Bx8u6Y/K8qxhezre4vv/Gl44Dd546pH3aIZ9muaf7jXJ07iarmyqtSd6hHx/FVbJY
        zbD837L90OYdvKfbLJm9bD2Cua//fuEqLMjvvvpz4nldnj0z5rxuV2xosog+2y3MlPmm/tHn
        Gc8zu6JLJr+5dlrgXe/q9ZVn3jwTvKIzSXGS2vrufaxL+JzmhP+4W7LB6d+zBRuXc2jJGlnt
        PxJ26eLi+9yPOxbXzVorJ5O855HW0fYbXAyO+keKZx6zr865t25R3eVUJZbijERDLeai4kQA
        5ySSN1sDAAA=
X-CMS-MailID: 20210427081813eucas1p2a3ca16a3a6cdddbf50276d28b4211489
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210424064556eucas1p1e89378837c377168c9782b4172e70482
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210424064556eucas1p1e89378837c377168c9782b4172e70482
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <CGME20210424064556eucas1p1e89378837c377168c9782b4172e70482@eucas1p1.samsung.com>
        <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.04.2021 08:45, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/exynos-gsc/gsc-core.c | 3 +--
>  drivers/media/platform/exynos-gsc/gsc-m2m.c  | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 9f41c2e7097a..9d5841194f6b 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -1210,7 +1210,7 @@ static int gsc_remove(struct platform_device *pdev)
>  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
>  	int i;
>  
> -	pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_resume_and_get(&pdev->dev);
>  
>  	gsc_unregister_m2m_device(gsc);
>  	v4l2_device_unregister(&gsc->v4l2_dev);
> @@ -1219,7 +1219,6 @@ static int gsc_remove(struct platform_device *pdev)
>  	for (i = 0; i < gsc->num_clocks; i++)
>  		clk_disable_unprepare(gsc->clock[i]);
>  
> -	pm_runtime_put_noidle(&pdev->dev);

If we do this then the device usage count will not get decremented
after the pm_runtime_resume_and_get() call above and after driver
unload/load cycle it will not be possible to suspend the device.
I wouldn't be changing anything in gsc_remove(), pm_runtime_get_sync()
works better in that case.

Regards,
Sylwester

>  	pm_runtime_disable(&pdev->dev);
>  
>  	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name
