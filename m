Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F6236C4FB
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235489AbhD0LWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:22:20 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56904 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbhD0LWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:22:19 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210427112135euoutp02e48a3e9daaaaab5cbc26dbbb9c9fba4f~5syDymcPq1560915609euoutp02m
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 11:21:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210427112135euoutp02e48a3e9daaaaab5cbc26dbbb9c9fba4f~5syDymcPq1560915609euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619522495;
        bh=2YZn6o3y8BH3IKN5MJ2e/CSLk54m5sRY+yaEQo7nwww=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=jT675MYa+zjcNpqF7TCbNtcML6lETm4yrACeeL1Gp2AFITKhcnyrowLClDN3Hx1X9
         rFrwJ51PMgzRplELZTsMTnoP5MKI4kxyXU2dH4mc6QDErze/Re39V3pvN7jcXB9DlO
         CPE7Nx4QaqjkSe3sgm1/eYDVAkUmX2/xPHM6foNc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210427112134eucas1p245f66fe93e1dbeed80130c9bc482b074~5syDR9tey2817828178eucas1p2p;
        Tue, 27 Apr 2021 11:21:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 72.20.09452.EB3F7806; Tue, 27
        Apr 2021 12:21:34 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210427112133eucas1p2128f988e825385cc2b75d5c0aac0f1a8~5syClIf_n2818228182eucas1p2p;
        Tue, 27 Apr 2021 11:21:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210427112133eusmtrp14836b0b52e9f6471a30050b1ca3d06e6~5syCi6tX71945419454eusmtrp1h;
        Tue, 27 Apr 2021 11:21:33 +0000 (GMT)
X-AuditID: cbfec7f2-ab7ff700000024ec-d2-6087f3be64e9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 99.C5.08705.DB3F7806; Tue, 27
        Apr 2021 12:21:33 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210427112132eusmtip15c408780ca6f11ec5aaa3af97045764e~5syBwPg7F0375803758eusmtip1P;
        Tue, 27 Apr 2021 11:21:32 +0000 (GMT)
Subject: Re: [PATCH v3 06/79] media: exynos-gsc: don't resume at remove time
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <5aab0e11-6818-990b-f583-35036c1bb740@samsung.com>
Date:   Tue, 27 Apr 2021 13:21:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a561d9eb253076cbcb9debe5fcbd3c949d5023d2.1619519080.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7r7PrcnGCw4L2Wxc8MXdouLM++y
        WJw/v4HdYtPja6wWl3fNYbPo2bCV1WLG+X1MFoc3nmGyaFtwmc3i4eyrjBbLNv1hcuD22HF3
        CaNHy5G3rB6bVnWyeWxeUu/xeZOcx6mvn9kD2KK4bFJSczLLUov07RK4Mk7evs1UsJ2n4tWj
        FuYGxvVcXYycHBICJhLzFq9g7mLk4hASWMEo0fhmBguE84VRYmrDBjYI5zOjxJ2NrxlhWnYd
        +MkEkVjOKHHl5S92COcjo8SnmS2sIFXCAj4SX588ZQaxRQRMJW6+6mQCsZkFHjFJnJ0gC2Kz
        CRhK9B7tA5vKK2An8eLEXbB6FgFViffrl7CD2KICyRLnH19lh6gRlDg58wkLiM0pkCDRvmQV
        O8RMcYlbT+ZDzZeX2P52DthDEgLdnBKNt5vYIc52kTjcdZsJwhaWeHV8C1RcRuL05B4WiIZm
        Rome3bfZIZwJjBL3jy+Aetpa4s65X8DQ4ABaoSmxfpc+RNhR4tKiSUwgYQkBPokbbwUhjuCT
        mLRtOjNEmFeio00IolpF4veq6VAnSEl0P/nPMoFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4
        Nz212DAvtVyvODG3uDQvXS85P3cTIzBtnf53/NMOxrmvPuodYmTiYDzEKMHBrCTCy7arNUGI
        NyWxsiq1KD++qDQntfgQozQHi5I476rZa+KFBNITS1KzU1MLUotgskwcnFINTKEVHmc37KvN
        figcIPPx0vvKRk6DDXvnZUQa3Pqv2JMq+ab4AEP+F4EdOSbVEwoOC5qcD161fcXElDl+CtJy
        1xul5slssv9VxPFj88El6bNVJ/yTlVD1Tm55xzbtTPbZk1xq8wrecJTNU7LhORbr+6v5U2+j
        m3q4d+ePrY410yZe33qy4mdZ24TT2S2fpLS0yhMW5Ct2TOU+vcY70uXnYel027iS43ntW+fe
        3MH88v33HTeklaNkZpQ5bt2/cp7joaesnzgcmhYvnlE//cXPnswHFrsFNJSll+/et/PzvALm
        3QXNnQXvL3be/7z7bd2x1ih+BZmWP5ff/bWNTdR96n07beWHYl7XqRktS4zv7VRiKc5INNRi
        LipOBAC5P5SmygMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7p7P7cnGLzu1LTYueELu8XFmXdZ
        LM6f38BusenxNVaLy7vmsFn0bNjKajHj/D4mi8MbzzBZtC24zGbxcPZVRotlm/4wOXB77Li7
        hNGj5chbVo9NqzrZPDYvqff4vEnO49TXz+wBbFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYm
        lnqGxuaxVkamSvp2NimpOZllqUX6dgl6GSdv32Yq2M5T8epRC3MD43quLkZODgkBE4ldB34y
        dTFycQgJLGWU2Pang7GLkQMoISUxv0UJokZY4s+1LjaImveMEo837WIHSQgL+Eh8ffKUGcQW
        ETCVuPmqE2wQs8AzJolFF3dAdTxjlNjytJsVpIpNwFCi92gfI4jNK2An8eLEXbBuFgFViffr
        l4BNFRVIllj9ezMrRI2gxMmZT1hAbE6BBIn2JavAapgF1CX+zLvEDGGLS9x6Mp8JwpaX2P52
        DvMERqFZSNpnIWmZhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQLjdNuxn5t3
        MM579VHvECMTB+MhRgkOZiURXrZdrQlCvCmJlVWpRfnxRaU5qcWHGE2B/pnILCWanA9MFHkl
        8YZmBqaGJmaWBqaWZsZK4rxb566JFxJITyxJzU5NLUgtgulj4uCUamBqOzTnfNF1rQPRczZ/
        e1E6c4Fz1yO3+ZWvT0zcUd69L/DxmsprqntXbXEt/fe4zvHmesNvpdufvhLT696e5m3+R0zd
        j29GmM7V5mlmu77bl738s9Bg87wlbmXqgRyv9ftNjm85Zlvi68+W+uTlcqeG1tsel6etNmpi
        ET++Id/l+yadgNxtL4PXb/OvE16+/uHldJUGhuvxmwsPrDtv5tLHUuKRklbxgufH+7xLa4o3
        q2k57agyXbtEP2DbIp7DVXKKooVVOitev0jtfPh1OU8X72L9fNdtp/7UO7t/7K4r2XLw46ZT
        xxoiN96cPeXGsotGb27+fL6E/cQK+Zmyq7+UfbUsE7J7ppn48vXHg99Z7yqxFGckGmoxFxUn
        AgDm6e+lXAMAAA==
X-CMS-MailID: 20210427112133eucas1p2128f988e825385cc2b75d5c0aac0f1a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210427102744eucas1p208d6f3801db6b5180e7364efc0cd83d2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210427102744eucas1p208d6f3801db6b5180e7364efc0cd83d2
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
        <CGME20210427102744eucas1p208d6f3801db6b5180e7364efc0cd83d2@eucas1p2.samsung.com>
        <a561d9eb253076cbcb9debe5fcbd3c949d5023d2.1619519080.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.04.2021 12:25, Mauro Carvalho Chehab wrote:
> Calling pm_runtime_get_sync() at driver's removal time is not
> needed, as this will resume PM runtime. Also, the PM runtime
> code at pm_runtime_disable() already calls it, if it detects
> the need.
> 
> So, simplify the code by getting rid of that.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/exynos-gsc/gsc-core.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 9f41c2e7097a..70e86cdc1012 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -1210,8 +1210,6 @@ static int gsc_remove(struct platform_device *pdev)
>  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
>  	int i;
>  
> -	pm_runtime_get_sync(&pdev->dev);
> -
>  	gsc_unregister_m2m_device(gsc);
>  	v4l2_device_unregister(&gsc->v4l2_dev);
>  
> @@ -1219,7 +1217,6 @@ static int gsc_remove(struct platform_device *pdev)
>  	for (i = 0; i < gsc->num_clocks; i++)
>  		clk_disable_unprepare(gsc->clock[i]);
>  
> -	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

This will result in unbalanced clk_disable_unprepare() calls when 
the device is not runtime PM active at the time of gsc_remove() call. 
I think we need to first disable runtime PM for the device and then 
disable the clocks only when pm_runtime_status_suspended(&pdev->dev)
returns false.


Thanks,
Sylwester
