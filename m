Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE32436FEBC
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhD3QjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:39:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2961 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhD3QjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:39:12 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyT759fsz70gFd;
        Sat,  1 May 2021 00:27:39 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:38:21 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:38:21 +0100
Date:   Fri, 30 Apr 2021 17:36:46 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 14/79] media: am437x: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210430173646.00007de1@Huawei.com>
In-Reply-To: <13b31912c93b56426660106d673d3c1a5be63170.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <13b31912c93b56426660106d673d3c1a5be63170.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.124.90]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:51:35 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> While here, ensure that the driver will check if PM runtime
> resumed at vpfe_initialize_device().
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

resume and suspend carrying regardless needs a comment I think.
(see below)
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 22 +++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 6cdc77dda0e4..bced526f30f2 100644
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
> @@ -2527,10 +2533,11 @@ static int vpfe_suspend(struct device *dev)
>  {
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
> +	int ret;
>  
>  	/* only do full suspend if streaming has started */
>  	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> -		pm_runtime_get_sync(dev);
> +		ret = pm_runtime_resume_and_get(dev);

Carrying on when you know the resume failed, seems interesting enough to
deserve a comment in the code.  Not sure you can usefully do anything
but it seems likely a lot of the calls that follow will fail.


>  		vpfe_config_enable(ccdc, 1);
>  
>  		/* Save VPFE context */
> @@ -2541,7 +2548,8 @@ static int vpfe_suspend(struct device *dev)
>  		vpfe_config_enable(ccdc, 0);
>  
>  		/* Disable both master and slave clock */
> -		pm_runtime_put_sync(dev);
> +		if (ret >= 0)
> +			pm_runtime_put_sync(dev);
>  	}
>  
>  	/* Select sleep pin state */
> @@ -2583,18 +2591,20 @@ static int vpfe_resume(struct device *dev)
>  {
>  	struct vpfe_device *vpfe = dev_get_drvdata(dev);
>  	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
> +	int ret;
>  
>  	/* only do full resume if streaming has started */
>  	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
>  		/* Enable both master and slave clock */
> -		pm_runtime_get_sync(dev);
> +		ret = pm_runtime_resume_and_get(dev);
>  		vpfe_config_enable(ccdc, 1);
>  
>  		/* Restore VPFE context */
>  		vpfe_restore_context(ccdc);
>  
>  		vpfe_config_enable(ccdc, 0);
> -		pm_runtime_put_sync(dev);
> +		if (ret >= 0)
> +			pm_runtime_put_sync(dev);
>  	}
>  
>  	/* Select default pin state */

