Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E830380079
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 00:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhEMWjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 18:39:54 -0400
Received: from gloria.sntech.de ([185.11.138.130]:34054 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhEMWjy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 18:39:54 -0400
Received: from p5b127fd3.dip0.t-ipconnect.de ([91.18.127.211] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lhJyU-0007NB-NC; Fri, 14 May 2021 00:38:34 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/25] media: rockchip/rga: use pm_runtime_resume_and_get()
Date:   Fri, 14 May 2021 00:38:34 +0200
Message-ID: <14678575.uLZWGnKmhe@phil>
In-Reply-To: <ce18a4f9ca1bdcf4c68e77eaa410ec03a6ec8fe2.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org> <ce18a4f9ca1bdcf4c68e77eaa410ec03a6ec8fe2.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 6. Mai 2021, 17:25:45 CEST schrieb Mauro Carvalho Chehab:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 3 +--
>  drivers/media/platform/rockchip/rga/rga.c     | 4 +++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bf9a75b75083..81508ed5abf3 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -79,9 +79,8 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
>  	struct rockchip_rga *rga = ctx->rga;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(rga->dev);
> +	ret = pm_runtime_resume_and_get(rga->dev);
>  	if (ret < 0) {
> -		pm_runtime_put_noidle(rga->dev);
>  		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
>  		return ret;
>  	}

looks ok

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 9d122429706e..bf3fd71ec3af 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -866,7 +866,9 @@ static int rga_probe(struct platform_device *pdev)
>  		goto unreg_video_dev;
>  	}
>  
> -	pm_runtime_get_sync(rga->dev);
> +	ret = pm_runtime_resume_and_get(rga->dev);
> +	if (ret < 0)
> +		goto unreg_video_dev;
>  
>  	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
>  	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;

hmm, the whole error handling in rga_probe looks fishy to my untrained eyes.

But I guess the easiest will be to apply your patch first and then
investigate and clean up the non-matching alloc - releae calls, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



