Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B67373B52
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbhEEMez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:34:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3026 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbhEEMex (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:34:53 -0400
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwwQ3vwXz6yhy0;
        Wed,  5 May 2021 20:28:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:33:54 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:33:54 +0100
Date:   Wed, 5 May 2021 13:32:15 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 16/25] media: am437x: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210505133215.00005f4e@Huawei.com>
In-Reply-To: <8688555079cf30f5848bb020b5ecf0b0132b2c7e.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <8688555079cf30f5848bb020b5ecf0b0132b2c7e.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:42:06 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> While here, ensure that the driver will check if PM runtime
> resumed at vpfe_initialize_device().
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 6cdc77dda0e4..1c9cb9e05fdf 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -1021,7 +1021,9 @@ static int vpfe_initialize_device(struct vpfe_device *vpfe)
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_get_sync(vpfe->pdev);
> +	ret = pm_runtime_resume_and_get(vpfe->pdev);
> +	if (ret < 0)
> +		return ret;
>  
>  	vpfe_config_enable(&vpfe->ccdc, 1);
>  
> @@ -2443,7 +2445,11 @@ static int vpfe_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  
>  	/* for now just enable it here instead of waiting for the open */
> -	pm_runtime_get_sync(&pdev->dev);
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0) {
> +		vpfe_err(vpfe, "Unable to resume device.\n");
> +		goto probe_out_v4l2_unregister;
> +	}
>  
>  	vpfe_ccdc_config_defaults(ccdc);
>  
> @@ -2530,6 +2536,11 @@ static int vpfe_suspend(struct device *dev)
>  
>  	/* only do full suspend if streaming has started */
>  	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> +		/*
> +		 * ignore RPM resume errors here, as it is already too late.
> +		 * A check like that should happen earlier, either at
> +		 * open() or just before start streaming.
> +		 */
>  		pm_runtime_get_sync(dev);
>  		vpfe_config_enable(ccdc, 1);
>  

