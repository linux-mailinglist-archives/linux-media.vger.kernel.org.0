Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2FE370008
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhD3R4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:56:18 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2977 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhD3R4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:56:18 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FX0FN6xJTz71fch;
        Sat,  1 May 2021 01:47:36 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 19:55:28 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 18:55:27 +0100
Date:   Fri, 30 Apr 2021 18:53:52 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 67/79] media: venus: vdec: use
 pm_runtime_resume_and_get()
Message-ID: <20210430185352.00003b27@Huawei.com>
In-Reply-To: <8541040c4b0830bb2c2f015b8c26c890baa5918a.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <8541040c4b0830bb2c2f015b8c26c890baa5918a.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:52:28 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index ddb7cd39424e..347e533ea673 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -568,7 +568,7 @@ static int vdec_pm_get(struct venus_inst *inst)
>  	int ret;
>  
>  	mutex_lock(&core->pm_lock);
> -	ret = pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
>  	mutex_unlock(&core->pm_lock);
>  
>  	return ret < 0 ? ret : 0;
Don't need this dance any more due to " Return 0 if the runtime PM usage counter of @dev has been
 * incremented or a negative error code otherwise."
return ret;

> @@ -601,7 +601,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
>  	mutex_lock(&core->pm_lock);
>  
>  	if (pm_runtime_suspended(dev)) {
> -		ret = pm_runtime_get_sync(dev);
> +		ret = pm_runtime_resume_and_get(dev);
>  		if (ret < 0)
>  			goto error;
>  

