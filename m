Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B6E38CED
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 16:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbfFGO0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 10:26:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38258 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbfFGO0Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 10:26:24 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 671CA2852B4;
        Fri,  7 Jun 2019 15:26:23 +0100 (BST)
Date:   Fri, 7 Jun 2019 16:26:19 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rockchip/vpu: remove an unnecessary NULL check
Message-ID: <20190607162619.06a3186d@collabora.com>
In-Reply-To: <20190607135609.GA16718@mwanda>
References: <20190607135609.GA16718@mwanda>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 7 Jun 2019 16:56:09 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Thus the address of "&ctx->dev->variant->codec_ops[codec_mode]"
> can't possibly be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> index 1b80a45df8fe..42f4eb0abc8a 100644
> --- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> +++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
> @@ -619,7 +619,7 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q,
>  
>  		vpu_debug(4, "Codec mode = %d\n", codec_mode);
>  		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
> -		if (ctx->codec_ops && ctx->codec_ops->init)
> +		if (ctx->codec_ops->init)
>  			ret = ctx->codec_ops->init(ctx);
>  	}
>  

