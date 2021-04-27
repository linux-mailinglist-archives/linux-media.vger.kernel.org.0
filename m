Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA3236C856
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 17:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbhD0PJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 11:09:39 -0400
Received: from foss.arm.com ([217.140.110.172]:53850 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236710AbhD0PJi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 11:09:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B288931B;
        Tue, 27 Apr 2021 08:08:54 -0700 (PDT)
Received: from [10.57.61.101] (unknown [10.57.61.101])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053013F73B;
        Tue, 27 Apr 2021 08:08:52 -0700 (PDT)
Subject: Re: [PATCH v3 79/79] media: hantro: document the usage of
 pm_runtime_get_sync()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <02948673-9572-a570-d28e-03a7208f39e1@arm.com>
Date:   Tue, 27 Apr 2021 16:08:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <230f22170db7fa57b49cff4570cef15bf11b2ad5.1619519080.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-04-27 11:27, Mauro Carvalho Chehab wrote:
> Despite other *_get()/*_put() functions, where usage count is
> incremented only if not errors, the pm_runtime_get_sync() has
> a different behavior, incrementing the counter *even* on
> errors.
> 
> That's an error prone behavior, as people often forget to
> decrement the usage counter.
> 
> However, the hantro driver depends on this behavior, as it
> will decrement the usage_count unconditionally at the m2m
> job finish time, which makes sense.
> 
> So, intead of using the pm_runtime_resume_and_get() that
> would decrement the counter on error, keep the current
> API, but add a documentation explaining the rationale for
> keep using pm_runtime_get_sync().
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/staging/media/hantro/hantro_drv.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..96f940c1c85c 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -155,6 +155,13 @@ static void device_run(void *priv)
>   	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>   	if (ret)
>   		goto err_cancel_job;

..except this can also cause the same pm_runtime_put_autosuspend() call 
without even reaching the "matching" get below, so rather than some kind 
of cleverness it seems more like it's just broken :/

Robin.

> +
> +	/*
> +	 * The pm_runtime_get_sync() will increment dev->power.usage_count,
> +	 * even on errors. That's the expected behavior here, since the
> +	 * hantro_job_finish() function at the error handling code
> +	 * will internally call pm_runtime_put_autosuspend().
> +	 */
>   	ret = pm_runtime_get_sync(ctx->dev->dev);
>   	if (ret < 0)
>   		goto err_cancel_job;
> 
