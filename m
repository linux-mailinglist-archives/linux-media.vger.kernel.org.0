Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64753FEC84
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhIBKzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbhIBKzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 06:55:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E480C061757;
        Thu,  2 Sep 2021 03:54:28 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A0645E;
        Thu,  2 Sep 2021 12:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630580066;
        bh=lCdeDpUD1dQO0LCEAhNuQFiGzSwF87Eu3scwphNrJcw=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=S7x23e5QYy9HOPrHStEBkEhXNtTCf5jYOV49yggoqZawguZVuYF7pQWreOlFXYBu8
         dS0iqnVY6d4YqG2V753PYnPtUvwcW4iW+YCrc5mRNuOOxctozl9rhd7uphkclSMIl/
         hioOcw5y29lUqU1MyowewXqC5sGvJ14T7bapzQIM=
Subject: Re: [PATCH] media: rcar_jpu: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210901055532.7429-1-caihuoqing@baidu.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f55b3276-a628-804f-b686-64dd0afcfab4@ideasonboard.com>
Date:   Thu, 2 Sep 2021 11:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055532.7429-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Cc linux-renesas-soc

On 01/09/2021 06:55, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/platform/rcar_jpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
> index f57158bf2b11..56bb464629ed 100644
> --- a/drivers/media/platform/rcar_jpu.c
> +++ b/drivers/media/platform/rcar_jpu.c
> @@ -1590,7 +1590,6 @@ MODULE_DEVICE_TABLE(of, jpu_dt_ids);
>  static int jpu_probe(struct platform_device *pdev)
>  {
>  	struct jpu *jpu;
> -	struct resource *res;
>  	int ret;
>  	unsigned int i;
>  
> @@ -1603,8 +1602,7 @@ static int jpu_probe(struct platform_device *pdev)
>  	jpu->dev = &pdev->dev;
>  
>  	/* memory-mapped registers */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	jpu->regs = devm_ioremap_resource(&pdev->dev, res);
> +	jpu->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(jpu->regs))
>  		return PTR_ERR(jpu->regs);
>  
> 

