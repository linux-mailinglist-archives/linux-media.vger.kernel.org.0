Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFBB36FE7B
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhD3Q33 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 30 Apr 2021 12:29:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2957 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhD3Q3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:29:23 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyFk0jGNz689rH;
        Sat,  1 May 2021 00:17:46 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:28:28 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:28:27 +0100
Date:   Fri, 30 Apr 2021 17:26:52 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 11/79] media: rcar_fdp1: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210430172652.00003c45@Huawei.com>
In-Reply-To: <6fb49df1ba7c80c2e6c51fb95322e025243ce36c.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <6fb49df1ba7c80c2e6c51fb95322e025243ce36c.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.52.124.90]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:51:32 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Also, right now, the driver is ignoring any troubles when
> trying to do PM resume. So, add the proper error handling
> for the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Refactor to move the error handling block to one place perhaps?

Also, I thin more cleanup is needed int he 
> ---
>  drivers/media/platform/rcar_fdp1.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index 01c1fbb97bf6..c32d237af618 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -2140,7 +2140,13 @@ static int fdp1_open(struct file *file)
>  	}
>  
>  	/* Perform any power management required */
> -	pm_runtime_get_sync(fdp1->dev);
> +	ret = pm_runtime_resume_and_get(fdp1->dev);
> +	if (ret < 0) {
> +		v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);

Next few lines repeated enough times that I'd suggest just pulling error handling out
to it's own path.

> +		v4l2_ctrl_handler_free(&ctx->hdl);
> +		kfree(ctx);
> +		goto done;
> +	}
>  
>  	v4l2_fh_add(&ctx->fh);
>  
> @@ -2351,7 +2357,9 @@ static int fdp1_probe(struct platform_device *pdev)
>  
>  	/* Power up the cells to read HW */
>  	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_get_sync(fdp1->dev);
> +	ret = pm_runtime_resume_and_get(fdp1->dev);

From a balance point of view, do you want to all pm_runtime_disable()
if this happens and also I'd guess you need to unregister the device
as done in other error paths in probe

The lack of balance between ordering in probe and remove before
your patch bothers me but I don't know the code well enough to tell
if there are any actual bugs there.


> +	if (ret < 0)
> +		return ret;
>  
>  	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
>  	switch (hw_version) {

