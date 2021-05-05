Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C00373B08
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhEEMXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:23:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3018 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhEEMW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:22:56 -0400
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwfc1vhcz6yhqR;
        Wed,  5 May 2021 20:16:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:21:56 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:21:55 +0100
Date:   Wed, 5 May 2021 13:20:16 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 23/25] media: exynos4-is: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505132016.000078b5@Huawei.com>
In-Reply-To: <f03a865ec3f35c995231121b981877fe2a8587b2.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <f03a865ec3f35c995231121b981877fe2a8587b2.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:42:13 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> 
> On some places, this is ok, but on others the usage count
> ended being unbalanced on failures.
> 
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> As a bonus, such function always return zero on success. So,
> some code can be simplified.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Might be nice to call out the two odd cases below.

> diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
> index 1aac167abb17..ebf39c856894 100644
> --- a/drivers/media/platform/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/exynos4-is/mipi-csis.c
> @@ -494,7 +494,7 @@ static int s5pcsis_s_power(struct v4l2_subdev *sd, int on)
>  	struct device *dev = &state->pdev->dev;
>  
>  	if (on)
> -		return pm_runtime_get_sync(dev);
> +		return pm_runtime_resume_and_get(dev);
>  
>  	return pm_runtime_put_sync(dev);
>  }
> @@ -509,11 +509,9 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	if (enable) {
>  		s5pcsis_clear_counters(state);
> -		ret = pm_runtime_get_sync(&state->pdev->dev);
> -		if (ret && ret != 1) {
Perhaps add something to the description on this less common case?

> -			pm_runtime_put_noidle(&state->pdev->dev);
> +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
> +		if (ret < 0)
>  			return ret;
> -		}
>  	}
>  
>  	mutex_lock(&state->lock);
> @@ -535,7 +533,7 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (!enable)
>  		pm_runtime_put(&state->pdev->dev);
>  
> -	return ret == 1 ? 0 : ret;
> +	return ret;
>  }
>  
>  static int s5pcsis_enum_mbus_code(struct v4l2_subdev *sd,

