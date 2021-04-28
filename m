Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA1A36DB9C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239793AbhD1P0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:47 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:57739 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240136AbhD1P0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:40 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210428152553euoutp0167c3594e2565e3de9fc048ed35ea2a7b~6Dwp5y34E0845708457euoutp01Q
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 15:25:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210428152553euoutp0167c3594e2565e3de9fc048ed35ea2a7b~6Dwp5y34E0845708457euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1619623553;
        bh=uM5vYpEohT1V4vZDFlN6eZEsDfMmLVomPhIFhi3kBjI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=NvhSXJQx0p+aJonaLf7ky66cqGP+hpIiXDFzkm92GHAOLuwjK3wymYmcIfpUClxa8
         5RLP/93/cwMK3yhEVwaE11JpiFPoKvSeKbg8+4C6c4r1X7VC9TJ+BzqITTf6K+gvM3
         YUbjyEDmZN3A/RjYKo38qWdE6PkkyYz4G4gcBxs4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210428152553eucas1p20ecc0af5c40ee3fb363ec3b9131c32cd~6DwpTz98S0230502305eucas1p2I;
        Wed, 28 Apr 2021 15:25:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 44.42.09444.08E79806; Wed, 28
        Apr 2021 16:25:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210428152552eucas1p25dceb5c828e242297a923d7342641cdc~6Dwo8VnFh1470014700eucas1p2I;
        Wed, 28 Apr 2021 15:25:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210428152552eusmtrp20c963d7cbee84f3ec835741e75be56d4~6Dwo7mZsX2817228172eusmtrp2B;
        Wed, 28 Apr 2021 15:25:52 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-f4-60897e80b533
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DB.C8.08696.08E79806; Wed, 28
        Apr 2021 16:25:52 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210428152551eusmtip1fa5b70a57b9b14d372b2630a8cee0ef3~6DwoQAkle0977209772eusmtip1u;
        Wed, 28 Apr 2021 15:25:51 +0000 (GMT)
Subject: Re: [PATCH v4 07/79] media: exynos-gsc: don't resume at remove time
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <138de070-a06c-654e-4912-d41f0cd658c2@samsung.com>
Date:   Wed, 28 Apr 2021 17:25:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <210a2eee928d2ae7aee65e177f20cfb3f00e29ee.1619621413.git.mchehab+huawei@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djP87oNdZ0JBm3rLS12bvjCbnFx5l0W
        i/PnN7BbbHp8jdXi8q45bBY9G7ayWsw4v4/J4vDGM0wWbQsus1k8nH2V0WLZpj9MDtweO+4u
        YfRoOfKW1WPTqk42j81L6j0+b5LzOPX1M3sAWxSXTUpqTmZZapG+XQJXxt3/G5kLvvBWTL29
        lK2B8Rh3FyMnh4SAicSi6d8Yuxi5OIQEVjBK9Ow8xQLhfGGUaHxzkx3C+cwosf/MehaYlvV3
        +6FaljNKnDx7kBXC+cgocfl+BxNIlbCAj8ScowcYQWwRAVOJm686weLMAo+YJM5OkAWx2QQM
        JXqP9oHV8ArYSSw6+R1oEAcHi4CqxPELUiBhUYFkifOPr7JDlAhKnJz5BOwIToEEiWWtS1kh
        RopL3HoyH2q8vMT2t3OYQe6REGjnlGjqamOFuNpFYvG9c4wQtrDEq+Nb2CFsGYn/O0GaQRqa
        gQGw+zY7hDOBUeL+8QVQHdYSd879YgO5jllAU2L9Ln2IsKPElX1fwY6WEOCTuPFWEOIIPolJ
        26YzQ4R5JTrahCCqVSR+r5rOBGFLSXQ/+c8ygVFpFpLXZiF5ZxaSd2Yh7F3AyLKKUTy1tDg3
        PbXYKC+1XK84Mbe4NC9dLzk/dxMjMGmd/nf8yw7G5a8+6h1iZOJgPMQowcGsJMLLtqs1QYg3
        JbGyKrUoP76oNCe1+BCjNAeLkjhv0pY18UIC6YklqdmpqQWpRTBZJg5OqQamwFf5XAdeh2vs
        49n99izz18ypBzpyni2xXR/xTdWzSSxm0irjU1pHLrFMF4pvU1644fuMR55Zhl0OwjEhCveX
        sPQs2LOpZYX/dKVP11vrZig8WrOb4Z3meQbNY6fWrWU+V+omM5M5f6KT78Xrpk8+tcrwV3k9
        OjnBeS3frMYJzXx9bT1d0sf29zvPrzu7OEik4MvvSZJip3ecTvld1V9Tdj9A6O4J7TKmd5qR
        k1t0k8tYBDzLDa+cvfEmU3rZwgUcpb+9pjySFFmafMAtO/1HiZydYrzjizkLov9kP15zTGfO
        nMzXlj6cUQwSnMcuveFoiUsJCPN+O7t30ztWpy8iH7m21d79UeBxMk3I5WOIEktxRqKhFnNR
        cSIA0fcLeskDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsVy+t/xu7oNdZ0JBstuKFrs3PCF3eLizLss
        FufPb2C32PT4GqvF5V1z2Cx6NmxltZhxfh+TxeGNZ5gs2hZcZrN4OPsqo8WyTX+YHLg9dtxd
        wujRcuQtq8emVZ1sHpuX1Ht83iTncerrZ/YAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMT
        Sz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jLv/NzIXfOGtmHp7KVsD4zHuLkZODgkBE4n1d/sZ
        uxi5OIQEljJKzLp8lb2LkQMoISUxv0UJokZY4s+1LjaImveMEot+/GYCSQgL+EjMOXqAEcQW
        ETCVuPmqkwmkiFngGZPEoos7oDqeMUq8XXiBFaSKTcBQovdoH1gHr4CdxKKT31lBtrEIqEoc
        vyAFEhYVSJZY/XszK0SJoMTJmU9YQGxOgQSJZa1LweLMAuoSf+ZdYoawxSVuPZnPBGHLS2x/
        O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiBUbrt2M8t
        OxhXvvqod4iRiYPxEKMEB7OSCC/brtYEId6UxMqq1KL8+KLSnNTiQ4ymQO9MZJYSTc4Hpom8
        knhDMwNTQxMzSwNTSzNjJXFekyNr4oUE0hNLUrNTUwtSi2D6mDg4pRqYjNMa20NzWhexb+0+
        vatG58E+QfZtUyQ+ffEreXT89s4/vDyePXV/94d9XRNikHp9S/2u1F7T8GV6v7j0M97lcu1o
        kLpR/iFnSsHEMkafLQvPneHUWN/4tPKjVabAmzq5jEd7OK5qtRo+5upQbQ47Ou3DIt3pRb6/
        cn7e+pztz70sSPX2u73VW79ZypuseXMge4HWsmPmske2bWpw26t6O9n+YeJDN+saT6l1h9kL
        pT/M4WR7cmunHbPEpvUCvLnTLxboXN3moHD0msWUjM85Te7cHD85b79/YX93Y5SoIFex/Rdd
        7knmPOXbQ6UsexZu/yq2kKlroWPVxFfPN16runeo75N1oIESH+P0HbOzlViKMxINtZiLihMB
        Qd+oQFsDAAA=
X-CMS-MailID: 20210428152552eucas1p25dceb5c828e242297a923d7342641cdc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210428145257eucas1p2152894daee2534dd26ced8df46456d72
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210428145257eucas1p2152894daee2534dd26ced8df46456d72
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <CGME20210428145257eucas1p2152894daee2534dd26ced8df46456d72@eucas1p2.samsung.com>
        <210a2eee928d2ae7aee65e177f20cfb3f00e29ee.1619621413.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.04.2021 16:51, Mauro Carvalho Chehab wrote:
> Calling pm_runtime_get_sync() at driver's removal time is not
> needed, as this will resume PM runtime. Also, the PM runtime
> code at pm_runtime_disable() already calls it, if it detects
> the need.
> 
> So, change the logic in order to disable PM runtime earlier.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thank you for correcting that.

> ---
>  drivers/media/platform/exynos-gsc/gsc-core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 9f41c2e7097a..8b943075c503 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -1210,18 +1210,19 @@ static int gsc_remove(struct platform_device *pdev)
>  	struct gsc_dev *gsc = platform_get_drvdata(pdev);
>  	int i;
>  
> -	pm_runtime_get_sync(&pdev->dev);
> -
>  	gsc_unregister_m2m_device(gsc);
>  	v4l2_device_unregister(&gsc->v4l2_dev);
>  
>  	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -	for (i = 0; i < gsc->num_clocks; i++)
> -		clk_disable_unprepare(gsc->clock[i]);
>  
> -	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(dev)) {

It should be &pdev->dev here rather than dev...

> +		for (i = 0; i < gsc->num_clocks; i++)
> +			clk_disable_unprepare(gsc->clock[i]);
> +	}
> +	pm_runtime_set_suspended(dev);

and here s/dev/&pdev->dev.

With above issues fixed,
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

>  	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>  	return 0;
>  }
 

Thanks,
Sylwester
