Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8534240403
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 11:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHJJbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 05:31:37 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46982 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgHJJbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 05:31:34 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200810093132euoutp0265f2941288dbda0189d036fe9bf71dc9~p3jwTNqbw0588005880euoutp02U
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 09:31:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200810093132euoutp0265f2941288dbda0189d036fe9bf71dc9~p3jwTNqbw0588005880euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1597051892;
        bh=fewrBoKQ2TfNzNkqjPXOMavPgLQV8gbWubkpvSRTAow=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dEb8bolt0xtsmAnQA8YWRgTjKDueIE7ib3ULHXAN1OgIlamspPJ59y8W48AH46Ewp
         ISm4Y6VXPR+6kLtrWkLne63QF9mC4n7HTvlAAVMW2hN1Sc23XZScGzdZAUS0uMomT1
         4K2KRvGICCfAL/ONRcjj15sTtyVMmd2JCVuGbBqQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200810093132eucas1p231e41422f5d762c6c133cf3fc5e99e40~p3jwGLY-G1567415674eucas1p2L;
        Mon, 10 Aug 2020 09:31:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B8.6B.06318.4F3113F5; Mon, 10
        Aug 2020 10:31:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200810093131eucas1p13b887da5b7e743876e2baed9046317ce~p3jvxRBkk0149201492eucas1p15;
        Mon, 10 Aug 2020 09:31:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200810093131eusmtrp2385e06f53d021b7bd290fc14371253c2~p3jvwf6q20409204092eusmtrp2_;
        Mon, 10 Aug 2020 09:31:31 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-b3-5f3113f49dde
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.33.06314.3F3113F5; Mon, 10
        Aug 2020 10:31:31 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200810093131eusmtip1b77c631b1978d34a4564687b81fc3c84~p3jvHt-662083820838eusmtip1k;
        Mon, 10 Aug 2020 09:31:31 +0000 (GMT)
Subject: Re: [PATCH v2] media: exynos4-is: Add missed check for
 pinctrl_lookup_state()
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <7ffcd1f8-91ba-ab9b-8a5e-98c206669666@samsung.com>
Date:   Mon, 10 Aug 2020 11:31:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200528064147.547158-1-hslester96@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9tx9XkuBl7sBuMQoy8peABRbLCFkT0sYycUw86U7c2NW+k
        aYS3VEy0pjARrVTStXSmiclkDRPTCCW8kOH64K3bNDBF83iU/PZ7n/f3f5/ngZfGpZ2kF61J
        TeP0qepkBSUmrO/WRn1XZIGqgNVSCVtnm8fZirlFnB0dNYvYkYIlEWuZmyDZT731FFtm7iLZ
        x6P9GPvUsoGddVP2GGdESktrMaV81ZSnLO9sRUqX5dhVMkocFs8lazI4vX94jDjRPFdM6ZbE
        mcubefloiy5BbjQwwbC4NIaVIDEtZZ4jeNGzRAqHFQQ/qu0i3pIyLgTVzbF7iYnZt7uJZwjm
        XN92E78QFN+roHhLxlwD53QJzrMn4w2u3h4RL+FMGwYvBzp2JIoJhIf2csSzhAkH489BgmeC
        OQl/+s0Yz4eYaOhyjGOC4wFDT5w7jhsTCvaPCyTPOCOHSacJE/g4dC/X43wzYGwiaJuqooS5
        L4Bzc4wQWAYLjk6RwEdgq8eECYFCBGVvpkTCoRLBF0cDEqxQmP7wd/sleruFD3T0+gvlCLCM
        DRF8GRh3+LzsIQzhDlXWWlwoS6DogVSwT8B6ay0msBeUOreISqQw7lvNuG8d4751jP/7NiCi
        Fcm5dENKAmcISuXu+BnUKYb01AS/OG2KBW3/peFNx+pr1L8Ra0MMjRQHJflHA1RSUp1hyEqx
        IaBxhafk3MhwtFQSr87K5vRalT49mTPY0GGaUMglQY3zN6VMgjqNu8VxOk6/d4vRbl75yKe9
        OyBkvEU2OaM7M5CsX9mQD2olv3Nmhxbzc76uevreLQoNs6/VtA/en7IGRxVGJCaYagraD7zP
        JbTW77rISxMXvTXkevej2y0xVfFXMuuSPOIsa97N2dlBl0ldZO5pv6RoXR+hStM1NDaZKHyl
        tyzJQTVfD+nLumGekWnOKwhDojrwFK43qP8BYzZqqEcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7qfhQ3jDX6vNbGYfegls0X/49fM
        FufPb2C3ONv0ht1i0+NrrBaXd81hs+jZsJXVYsb5fUwWyzb9YXLg9Ng56y67x6ZVnWwem5fU
        e/RtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7GhsedbAVvuCre/qtvYPzP0cXIySEhYCJx7cF+pi5GLg4hgaWMEr92PmTrYuQA
        SkhJzG9RgqgRlvhzrYsNouY9o8SV499YQRLCAhEST+50MYPYIgLqEp937WQHKWIWWM0ksWLR
        aqipfYwSGw/1gVWxCRhK9B7tYwSxeQXsJGZ9OMwCYrMIqEp827eBCcQWFYiTeNz7nxmiRlDi
        5MwnYDWcAtYSRy++AtvMDLTtz7xLzBC2uMStJ/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFp
        WcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwDrcd+7l5B+OljcGHGAU4GJV4eBtkDeKF
        WBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5wBSRVxJvaGpo
        bmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mDU6qBUfQHU/O/2xLWp5JUTATq2g9Z
        ehafdprx5miOvfyUU3PXxm+zddAonL2yXTj3vv35jk29s+Z6Gaxp/79wj59m3/FXXf8e2eb/
        j9tsdp7XNGYrP5+B8FX1SqHPdrVztE6UeHbxpqVbC3NpmpfPCdtx+WFiySHpHae7wrbsfSB0
        RETXjeHA+XMmSizFGYmGWsxFxYkA5+Bxo9kCAAA=
X-CMS-MailID: 20200810093131eucas1p13b887da5b7e743876e2baed9046317ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200528064613eucas1p268b1692ad11d7d2be863280be7d378c1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200528064613eucas1p268b1692ad11d7d2be863280be7d378c1
References: <CGME20200528064613eucas1p268b1692ad11d7d2be863280be7d378c1@eucas1p2.samsung.com>
        <20200528064147.547158-1-hslester96@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 28.05.2020 08:41, Chuhong Yuan wrote:
> fimc_md_get_pinctrl() misses a check for pinctrl_lookup_state().
> Add the missed check to fix it.
> 
> Fixes: 4163851f7b99 ("[media] s5p-fimc: Use pinctrl API for camera ports configuration]") 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Add fixes tag.
> 
>  drivers/media/platform/exynos4-is/media-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index 9aaf3b8060d5..9c31d950cddf 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -1270,6 +1270,9 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
>  
>  	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
>  					PINCTRL_STATE_IDLE);
> +	if (IS_ERR(pctl->state_idle))
> +		return PTR_ERR(pctl->state_idle);

Unfortunately this is not correct, with that change the driver currently 
fails to initialize. The "idle" pinctrl state is optional and might not 
be specified in DT, as explained in the DT binding documentation added
by the patch you mentioned in the "Fixes" tag.
Actually the "idle" state is now not used in any mainline dts, I will 
post a patch that removes related code in the driver.

-- 
Thanks,
Sylwester
