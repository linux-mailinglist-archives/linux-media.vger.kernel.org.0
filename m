Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A661337398B
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbhEELhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:37:14 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3015 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhEELhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 07:37:12 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZvbK0QHrz6rlWH;
        Wed,  5 May 2021 19:28:13 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 13:36:15 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 12:36:14 +0100
Date:   Wed, 5 May 2021 12:34:35 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 09/25] media: hantro: do a PM resume earlier
Message-ID: <20210505123435.00002065@Huawei.com>
In-Reply-To: <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <82114a4bd9c7bc1188c6a7167a6e74bb3360961d.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:41:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The device_run() first enables the clock and then
> tries to resume PM runtime, checking for errors.
> 
> Well, if for some reason the pm_runtime can not resume,
> it would be better to detect it beforehand.
> 
> So, change the order inside device_run().
> 
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Does this move not result in a potential call of clk_bulk_disable() for clocks
that aren't enabled?

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 595e82a82728..4387edaa1d0d 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -152,13 +152,14 @@ static void device_run(void *priv)
>  	src = hantro_get_src_buf(ctx);
>  	dst = hantro_get_dst_buf(ctx);
>  
> -	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> -	if (ret)
> -		goto err_cancel_job;
>  	ret = pm_runtime_get_sync(ctx->dev->dev);
>  	if (ret < 0)
>  		goto err_cancel_job;
>  
> +	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
> +	if (ret)
> +		goto err_cancel_job;
> +
>  	v4l2_m2m_buf_copy_metadata(src, dst, true);
>  
>  	ctx->codec_ops->run(ctx);

