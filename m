Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D380E11DA26
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 00:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbfLLXm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 18:42:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLLXm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 18:42:28 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E677A2B;
        Fri, 13 Dec 2019 00:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576194146;
        bh=Zigp7SWN2m4H6YUkBIdGVKmC/isQiYmdYdZtzt8Jztk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RndbV6MA+dGWmvZ8wzqXHSiv1XkHg7/dIXqIHfZSjpsohZe7cAXRD4W7DRtNJD5gq
         TAoQleBsM/vUVrxVAWvJ4bd1I49mwSPfuqw8FZRBq3naYfcCwFG5mnizDN/yy62WUT
         icU0UJEstnAAbSa74Yss0oOgUmaBCzv4t9St5zs8=
Date:   Fri, 13 Dec 2019 01:42:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: omap3isp: add checks for devm_regulator_get
Message-ID: <20191212234216.GE4892@pendragon.ideasonboard.com>
References: <20191210091428.23448-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191210091428.23448-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chuhong,

(CC'ing Sakari Ailus)

Thank you for the patch.

On Tue, Dec 10, 2019 at 05:14:28PM +0800, Chuhong Yuan wrote:
> The driver misses checks for devm_regulator_get().
> Add checks to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/platform/omap3isp/isp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index 327c5716922a..ef3502182c3a 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -2312,7 +2312,16 @@ static int isp_probe(struct platform_device *pdev)
>  
>  	/* Regulators */
>  	isp->isp_csiphy1.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy1");
> +	if (IS_ERR(isp->isp_csiphy1.vdd)) {
> +		ret = PTR_ERR(isp->isp_csiphy1.vdd);
> +		goto error;
> +	}
> +
>  	isp->isp_csiphy2.vdd = devm_regulator_get(&pdev->dev, "vdd-csiphy2");
> +	if (IS_ERR(isp->isp_csiphy2.vdd)) {
> +		ret = PTR_ERR(isp->isp_csiphy2.vdd);
> +		goto error;
> +	}

Those regulators are currently checked at runtime in
omap3isp_csiphy_acquire(). The check is incorrect as it checks for NULL
while vdd would contain an ERR_PTR, so there's a real issue. However,
not all platforms support the CSI-2 receivers, and only omap3-n950.dts
and omap3-n9.dts provide the regulators. They thus need to be kept
optional.

Would you like to provide another patch that fixes the checks in
omap3isp_csiphy_acquire() ?

>  
>  	/* Clocks
>  	 *

-- 
Regards,

Laurent Pinchart
