Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F161509F2
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 16:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgBCPlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 10:41:13 -0500
Received: from foss.arm.com ([217.140.110.172]:54882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgBCPlN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 10:41:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC5E830E;
        Mon,  3 Feb 2020 07:41:12 -0800 (PST)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.195.32])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BA253F68E;
        Mon,  3 Feb 2020 07:41:11 -0800 (PST)
Date:   Mon, 3 Feb 2020 15:41:06 +0000
From:   Steven Price <steven.price@arm.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Rob Herring <robh@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-ID: <20200203154106.GA2114@arm.com>
References: <20200203152724.42611-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 03, 2020 at 03:27:24PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
> 
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I'm not sure how I didn't spot that before! Thanks for fixing it.

Note commit bdefca2d8dc0 is actually in v5.5 and not (yet) in
drm-misc-next.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 7c36ec675b73..ccb8546a9342 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
>  	}
>  
>  	if (job->bos) {
> -		struct panfrost_gem_object *bo;
> -
> -		for (i = 0; i < job->bo_count; i++) {
> -			bo = to_panfrost_bo(job->bos[i]);
> +		for (i = 0; i < job->bo_count; i++)
>  			drm_gem_object_put_unlocked(job->bos[i]);
> -		}
>  
>  		kvfree(job->bos);
>  	}
> 
> 
> 
