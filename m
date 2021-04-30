Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254CC36FDAC
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhD3PXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:23:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2954 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhD3PXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:23:37 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWwnw2JLqz6xhhn;
        Fri, 30 Apr 2021 23:12:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 17:22:46 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 16:22:45 +0100
Date:   Fri, 30 Apr 2021 16:21:10 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Hans Verkuil" <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 01/79] media: venus: fix PM runtime logic at
 venus_sys_error_handler()
Message-ID: <20210430162110.000058e0@Huawei.com>
In-Reply-To: <6d463d21f0dd55c3d84db0458c7a5c4e0d7c5bc1.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <6d463d21f0dd55c3d84db0458c7a5c4e0d7c5bc1.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:22 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The venus_sys_error_handler() assumes that pm_runtime was
> able to resume, as it does things like:
> 
> 	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
> 		msleep(10);
> 
> Well, if, for whatever reason, this won't happen, the routine
> won't do what's expected. So, check for the returned error
> condition, warning if it returns an error.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 54bac7ec14c5..c80c27c87ccc 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -84,7 +84,11 @@ static void venus_sys_error_handler(struct work_struct *work)
>  			container_of(work, struct venus_core, work.work);
>  	int ret = 0;
>  
> -	pm_runtime_get_sync(core->dev);
> +	ret = pm_runtime_get_sync(core->dev);
> +	if (WARN_ON(ret < 0)) {
> +		pm_runtime_put_noidle(core->dev);
> +		return;
> +	}
>  
>  	hfi_core_deinit(core, true);
>  
> @@ -106,9 +110,13 @@ static void venus_sys_error_handler(struct work_struct *work)
>  
>  	hfi_reinit(core);
>  
> -	pm_runtime_get_sync(core->dev);
> +	ret = pm_runtime_get_sync(core->dev);
> +	if (WARN_ON(ret < 0)) {
> +		pm_runtime_put_noidle(core->dev);

mutex_unlock(&core->lock);
(the unlock is currently just below the enable_irq() in 5.12)


> +		return;
> +	}
>  
> -	ret |= venus_boot(core);
> +	ret = venus_boot(core);
>  	ret |= hfi_core_resume(core, true);
>  
>  	enable_irq(core->irq);

