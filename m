Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C717136DDED
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 19:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbhD1RLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 13:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhD1RLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 13:11:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE841C061573;
        Wed, 28 Apr 2021 10:10:51 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 05A351F42B77
Message-ID: <00113d54d30be862195b736a5e5026eab8f6b5ec.camel@collabora.com>
Subject: Re: [PATCH v3 11/79] media: rga-buf: use pm_runtime_resume_and_get()
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Wed, 28 Apr 2021 14:10:41 -0300
In-Reply-To: <a9099f1ffc537e5f997cb260a175715892387c5a.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
         <a9099f1ffc537e5f997cb260a175715892387c5a.1619519080.git.mchehab+huawei@kernel.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-04-27 at 12:26 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sorry, I just replied to the wrong patch version.
Again:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 3 +--
>  drivers/media/platform/rockchip/rga/rga.c     | 4 +++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bf9a75b75083..81508ed5abf3 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,9 +79,8 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
>         struct rockchip_rga *rga = ctx->rga;
>         int ret;
>  
> -       ret = pm_runtime_get_sync(rga->dev);
> +       ret = pm_runtime_resume_and_get(rga->dev);
>         if (ret < 0) {
> -               pm_runtime_put_noidle(rga->dev);
>                 rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
>                 return ret;
>         }
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 9d122429706e..bf3fd71ec3af 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -866,7 +866,9 @@ static int rga_probe(struct platform_device *pdev)
>                 goto unreg_video_dev;
>         }
>  
> -       pm_runtime_get_sync(rga->dev);
> +       ret = pm_runtime_resume_and_get(rga->dev);
> +       if (ret < 0)
> +               goto unreg_video_dev;
>  
>         rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
>         rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;


