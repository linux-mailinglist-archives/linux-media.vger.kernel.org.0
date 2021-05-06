Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33E8375829
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 18:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbhEFQG0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 12:06:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbhEFQG0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 12:06:26 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F28A089D;
        Thu,  6 May 2021 18:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620317126;
        bh=2U1Dc9zab4QRWiNZr3/84dglVSbQJ3JHyXd0uu8J9wI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xb20e9iznVCNxcl2KfXL8EyVRKGxQycbZ81UG2VI4d49RcEFVhL3y3lt+mjyeB96g
         t/jwvg25Guo0iudQKeJbrhwzhkDDYkrar3V7NOknCdd90f6T0p+40y8F05HUMEbFY1
         6PDVywIVlbGIB2lXeg2O1qmcyQBMmlVsZulBWc6k=
Date:   Thu, 6 May 2021 19:05:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 16/25] media: rcar-fcp: use pm_runtime_resume_and_get()
Message-ID: <YJQTwXSoTGpqZUnF@pendragon.ideasonboard.com>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <256365d690c780e9e89cba369ebaac805f0ec256.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <256365d690c780e9e89cba369ebaac805f0ec256.1620314616.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Thu, May 06, 2021 at 05:25:54PM +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> As a bonus, pm_runtime_resume_and_get() always return 0 on success.
> So, the code can be simplified.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-fcp.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
> index 5c03318ae07b..a3a7afc03d7b 100644
> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c
> @@ -101,13 +101,7 @@ int rcar_fcp_enable(struct rcar_fcp_device *fcp)
>  	if (!fcp)
>  		return 0;
>  
> -	ret = pm_runtime_get_sync(fcp->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(fcp->dev);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return pm_runtime_resume_and_get(fcp->dev);
>  }
>  EXPORT_SYMBOL_GPL(rcar_fcp_enable);
>  

-- 
Regards,

Laurent Pinchart
