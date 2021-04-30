Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4556E36FE27
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 17:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhD3P5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 11:57:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2955 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhD3P5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 11:57:05 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWxfL00N1z72f4w;
        Fri, 30 Apr 2021 23:50:33 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 17:56:15 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 16:56:14 +0100
Date:   Fri, 30 Apr 2021 16:54:39 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 06/79] media: i2c: imx334: fix the pm runtime get
 logic
Message-ID: <20210430165439.0000712c@Huawei.com>
In-Reply-To: <10ec24ee3e3a33a4ca5c431fc19d3441d59136c3.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <10ec24ee3e3a33a4ca5c431fc19d3441d59136c3.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The PM runtime get logic is currently broken, as it checks if
> ret is zero instead of checking if it is an error code,
> as reported by Dan Carpenter.
> 
> While here, use the pm_runtime_resume_and_get() as added by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.

Perhaps also call out that a fail of pm_runtime_get_sync in current
code would potentially result in a spurious runtime_suspend() call
whereas using pm_runtime_resume_and_get() will call
pm_runtime_put_noidle()

> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/imx334.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 047aa7658d21..23f28606e570 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -717,9 +717,9 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
>  	}
>  
>  	if (enable) {
> -		ret = pm_runtime_get_sync(imx334->dev);
> -		if (ret)
> -			goto error_power_off;
> +		ret = pm_runtime_resume_and_get(imx334->dev);
> +		if (ret < 0)
> +			goto error_unlock;
>  
>  		ret = imx334_start_streaming(imx334);
>  		if (ret)
> @@ -737,6 +737,7 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
>  
>  error_power_off:
>  	pm_runtime_put(imx334->dev);
> +error_unlock:
>  	mutex_unlock(&imx334->mutex);
>  
>  	return ret;

