Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F4AD8D18
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 11:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404417AbfJPJ6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 05:58:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfJPJ6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 05:58:52 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFF5E43E;
        Wed, 16 Oct 2019 11:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571219930;
        bh=WcoU1rgkgfqck3Sixg1f5PWiV0VMExUEKXAuCwDKFlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pVj4hmDAfQUZ32V/hQgFbhsQSVDs5bKAe3nKkT2Zpmjt7bkGF9yascohgHlwmSQdu
         DgBXeW9qdQYvf1u0dvdke62X8RBvclto0p9mYDQuWe2Duulvh4v1ljjGwtWswjcmcY
         sJl5LJGL59qhrS9V5JmNbPkd6Pjp/7TqymSToksY=
Date:   Wed, 16 Oct 2019 12:58:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] staging: media: omap4iss: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191016095848.GC5175@pendragon.ideasonboard.com>
References: <20191016085136.22812-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191016085136.22812-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello YueHaibing,

Thank you for the patch.

The same fix has already been submitted a week ago, and I have sent a
pull request today that includes it. I'm afraid I thus can't take this
patch. The good news is that the change was good :-)

On Wed, Oct 16, 2019 at 04:51:36PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/omap4iss/iss.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index 1a966cb..6fb60b5 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -908,11 +908,7 @@ static int iss_map_mem_resource(struct platform_device *pdev,
>  				struct iss_device *iss,
>  				enum iss_mem_resources res)
>  {
> -	struct resource *mem;
> -
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, res);
> -
> -	iss->regs[res] = devm_ioremap_resource(iss->dev, mem);
> +	iss->regs[res] = devm_platform_ioremap_resource(pdev, res);
>  
>  	return PTR_ERR_OR_ZERO(iss->regs[res]);
>  }

-- 
Regards,

Laurent Pinchart
