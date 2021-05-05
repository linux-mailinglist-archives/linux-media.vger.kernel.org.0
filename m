Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617D3373B33
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbhEEM3v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:29:51 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3023 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhEEM3v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:29:51 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwm33Mzmz6rlcW;
        Wed,  5 May 2021 20:20:51 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:28:53 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:28:52 +0100
Date:   Wed, 5 May 2021 13:27:13 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 07/25] media: exynos-gsc: don't resume at remove time
Message-ID: <20210505132713.000000ba@Huawei.com>
In-Reply-To: <f90e4f9b1dbc71f2a598f057a93dffc69fa3850d.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <f90e4f9b1dbc71f2a598f057a93dffc69fa3850d.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 11:41:57 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Calling pm_runtime_get_sync() at driver's removal time is not
> needed, as this will resume PM runtime. Also, the PM runtime
> code at pm_runtime_disable() already calls it, if it detects
> the need.
> 
> So, change the logic in order to disable PM runtime earlier.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Seems sensible and a lot more along the lines of what I'd expect
to see than was originally here.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/exynos-gsc/gsc-core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 9f41c2e7097a..f49f3322f835 100644
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
>  
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		for (i = 0; i < gsc->num_clocks; i++)
> +			clk_disable_unprepare(gsc->clock[i]);
> +
> +	pm_runtime_set_suspended(&pdev->dev);
> +
>  	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>  	return 0;
>  }

