Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA22911CB1E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 11:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfLLKjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 05:39:42 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38435 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728589AbfLLKjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 05:39:42 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fLsgiYsLcGyJwfLshixjqv; Thu, 12 Dec 2019 11:39:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576147180; bh=KZ03RxcJQ7IpU9N7i9dUPkS6LtZ5asybaeAyewvmUuA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Q8Q0AP1/GpoSinBV4NfVIGCUhmhBF8NTjn37VVEeO2ZDq0Yb7yf8nIOiynqk058KR
         lrk9NuMgN4sVd0Rf27AhSxOeZG/Q6D/Iuw2tmG21MkZkjNH6OBhSx7eMzxwl48XrhX
         tBC4P3T8QK6bGOicO+cMvX47TjnVrOOD9CdOTmA62h3o8O1V+K4zP3w0Z/ACDum6zI
         /R2SgQztYTBbliovBfv6LSBgesh8uL9AfOvsBL65ydaHNZohbdWDGG4cIVa9fkNCUm
         uOQ97T0PoFyD+LWJNRsTOpFlkssAQZcnJr19k1lbArYzY/JMZPlCjKRv0uW/3T6nZD
         QdEWFHXfqnqjg==
Subject: Re: [PATCH] media: exynos4-is: add missed clk_disable_unprepare in
 remove
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191104154942.8935-1-hslester96@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <29590e4f-cb9e-c9ac-608c-b7b72c308d25@xs4all.nl>
Date:   Thu, 12 Dec 2019 11:39:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104154942.8935-1-hslester96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUG4uRitZeKdWfgazy03OKDZeNHpu/zYbU7lFqsLQVzvhPtSN/qHYwNYnsfJOOlWXm50QkhfippMYJWkrYp4MOJscB6J4SK8Cs0NwvTcuc/v8pjHghH
 3rp4xs6O2eaA8cPfpx6Akjfe2nqHEYxuVvOZYoHHzusAKe6HKk6FLOQ2v3v2IKr6P1o1nqCVncofmrbkzihr1RYriUzaNGLqR2w+jFvSIdgN7UOInfbaj/vp
 yFmuwi6OF3RwfM5wCha9XBquMsMj107D7fiFnum8jYOgLXl73cf9ELUjB6ZNEH/4jPBocuiQEc4A0+EWBt3eDm030U5EuE3eb6OT87QgQkOZfbhml9elZaN2
 j8875GcFSGC94GWExwwN43VejsTR2agiFtL04hx4wFfCDiBkIgyOhLA+gQgr7KsLlWEcVE/k5JwVlOhYxqAS4O6c42bWd4joATbXyh3ksSqSIGJwXkfaG5HR
 qtetCaA4v9RC5q/R9DJIYEkuzDO3rCETzSvDCSfEl3F/iwZvs+29WFPx8v9JrD1f9Df6QYvQgDMq96RbdpmZlFEf84To9rsJiByRLYsEdKCGebLRmvbl6+Fv
 Zfbif4gABZow32cfBxb6Ek1/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/4/19 4:49 PM, Chuhong Yuan wrote:
> This driver forgets to disable and unprepare clock when remove.
> Add a call to clk_disable_unprepare to fix it.

I'd like an Ack from Samsung before I apply this. I see this in the probe() in fimc-lite.c:

       if (!pm_runtime_enabled(dev)) {
                ret = clk_prepare_enable(fimc->clock);
                if (ret < 0)
                        goto err_sd;
        }

So is it right to always call clk_disable_unprepare in the remove()?

I suspect it is correct, but I would like someone else to take a look as well.

Regards,

	Hans

> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/platform/exynos4-is/fimc-lite.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index e87c6a09205b..6748bd96aada 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -1614,6 +1614,7 @@ static int fimc_lite_remove(struct platform_device *pdev)
>  	struct fimc_lite *fimc = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
>  
> +	clk_disable_unprepare(fimc->clock);
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(dev);
>  	fimc_lite_unregister_capture_subdev(fimc);
> 

