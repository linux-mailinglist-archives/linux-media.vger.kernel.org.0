Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE233826C1
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 10:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhEQIXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 04:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:55064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230087AbhEQIXX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 04:23:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1809C610E9;
        Mon, 17 May 2021 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621239727;
        bh=58Gn/10SxvI87o4A0OIYhCYPlq3keF9eIzCKT5l+01I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KhpAhkz3DZddRWxXXVvH/v+9Xn4JgP8SP+a+oVVMzKmtwklGko8M3Er3WY10ODhKP
         84TSjvTai6Zc2PVvphxu7p01lHw9zvup4AuGepC1X0PCJz7LEBZrn5JhXJ32pu5HjF
         xov0tsTdNPVKmN9ftc1fJ2m6EQN2w9iWoVCXwxd71g6qMYQjSpYTHX5yX6umV5oWsI
         iXkWWVIf3DuwKO6nLi8VZ3wIseIK/j7o2piROKRzTNLXnjexmo0VzcFyCiMEx7Tv3P
         EesxKcvKJaW/AP4RPJ0geM5GQoJGot8i0oRSHTx/fOggXJP8N9xvYO/nSt13lSvSWj
         ytUTzNy3oVJkw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1liYVo-0003QV-2W; Mon, 17 May 2021 10:22:04 +0200
Date:   Mon, 17 May 2021 10:22:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] media: hantro: Fix PM reference leak in device_run()
Message-ID: <YKInrIMZYGI1VKdl@hovoldconsulting.com>
References: <20210517081516.1562794-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517081516.1562794-1-yukuai3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 04:15:16PM +0800, Yu Kuai wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index eea2009fa17b..7a6d3ef22096 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -160,7 +160,7 @@ static void device_run(void *priv)
>  	src = hantro_get_src_buf(ctx);
>  	dst = hantro_get_dst_buf(ctx);
>  
> -	ret = pm_runtime_get_sync(ctx->dev->dev);
> +	ret = pm_runtime_resume_and_get(ctx->dev->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_noidle(ctx->dev->dev);

This is clearly broken as there is no PM usage count leak here.

Please try to understand the code you're changing before submitting any
more patches based on "robot" feedback.

>  		goto err_cancel_job;

Johan
