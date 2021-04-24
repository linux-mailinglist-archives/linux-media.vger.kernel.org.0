Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FCA36A390
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 01:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhDXXYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 19:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhDXXYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 19:24:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87632C061574;
        Sat, 24 Apr 2021 16:24:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 65D6B1F40EE6
Message-ID: <780afdc9b263928ed378dfbd3eaa8a5509a59a35.camel@collabora.com>
Subject: Re: [PATCH 13/78] staging: media: hantro_drv: use
 pm_runtime_resume_and_get()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Sat, 24 Apr 2021 20:23:53 -0300
In-Reply-To: <0021158fb27035a56089683ee712fb3ed6f6032d.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
         <0021158fb27035a56089683ee712fb3ed6f6032d.1619191723.git.mchehab+huawei@kernel.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, 2021-04-24 at 08:44 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..3147dcbebeb9 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -155,7 +155,7 @@ static void device_run(void *priv)
>         ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
>         if (ret)
>                 goto err_cancel_job;
> -       ret = pm_runtime_get_sync(ctx->dev->dev);
> +       ret = pm_runtime_resume_and_get(ctx->dev->dev);
>         if (ret < 0)
>                 goto err_cancel_job;
>  

Seems this one needs a different fix: err_cancel_job
will call hantro_job_finish which has a pm_runtime put.

Thanks,
Ezequiel 

