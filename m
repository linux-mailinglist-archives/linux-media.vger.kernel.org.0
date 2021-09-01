Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25743FD51A
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243075AbhIAIQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243005AbhIAIQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:16:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908EBC061575;
        Wed,  1 Sep 2021 01:15:38 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E1CF3D7;
        Wed,  1 Sep 2021 10:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630484135;
        bh=hJ0SsO3gUOJUFGUmE/5bd8sdDQdAUobtiS3lpxemB1U=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=v7v2nHlA9i2mq6ZcBsqC4xSPUrb+tjJn9wxutcOO18EF7ccHMiQiyleFbXLoiICiq
         +tBNF9gxCWlv9cN+i40yhR6D8ULgPzTjt53hJpEqcWOeXYEV6oaN6yNWsr4wOoX1Ng
         0v10G3Ly44tpYspMUtJDWmjhEmPSp+Y9VmZI+1l4=
Subject: Re: [PATCH] media: vsp1: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055709.8079-1-caihuoqing@baidu.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <8b184d7c-1e55-3227-c01a-41f45b3402b5@ideasonboard.com>
Date:   Wed, 1 Sep 2021 09:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055709.8079-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 06:57, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index de442d6c9926..8acd6d45d8d0 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -785,7 +785,6 @@ static int vsp1_probe(struct platform_device *pdev)
>  	struct vsp1_device *vsp1;
>  	struct device_node *fcp_node;
>  	struct resource *irq;
> -	struct resource *io;
>  	unsigned int i;
>  	int ret;
>  
> @@ -800,8 +799,7 @@ static int vsp1_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, vsp1);
>  
>  	/* I/O and IRQ resources (clock managed by the clock PM domain). */
> -	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	vsp1->mmio = devm_ioremap_resource(&pdev->dev, io);
> +	vsp1->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(vsp1->mmio))
>  		return PTR_ERR(vsp1->mmio);
>  
> 
