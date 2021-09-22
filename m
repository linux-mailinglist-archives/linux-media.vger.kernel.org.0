Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A896415394
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 00:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbhIVWtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 18:49:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60108 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhIVWtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 18:49:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85775E52;
        Thu, 23 Sep 2021 00:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632350861;
        bh=/JIfGkpHJEOWf70+fx28BF1bpVMNHC1Qx+yk5ONMQZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FoC+oxH6+XHWFhejlBZDMmfCUhMwh6uHdZ5u0HN4duv3Xd7LY4u7hGMjgn3SHuyCT
         jmGKay7MRcR1GDPc9FdVlryW3o9sS14wh0mFyHdfmxEOS6Xig4dpqXNyDEyU0yNTF6
         Rgaf1J3LhEuoe3NIKGyoOnkJBrY/q/k0co4cNWC8=
Date:   Thu, 23 Sep 2021 01:47:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YUuyjEibbug/Taal@pendragon.ideasonboard.com>
References: <20210901055709.8079-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901055709.8079-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Wed, Sep 01, 2021 at 01:57:08PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
