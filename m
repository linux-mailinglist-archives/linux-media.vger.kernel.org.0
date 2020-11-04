Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812622A7334
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 00:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387557AbgKDXwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 18:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733200AbgKDXwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 18:52:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDAAC0613CF;
        Wed,  4 Nov 2020 15:52:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C1CEB04;
        Thu,  5 Nov 2020 00:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604533930;
        bh=HeBPtwkKfdCuw+ixNJWWKnwgqcZWXRhxdmFr/Zdn46I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vCvoXPnPA5yySy2dFyBpPfZ3Pjp/Yagl2Cl3xrGwwR0EFabUCK2LSDaUnK8xlS2+s
         NcyzcadWZ7qMBzZDOz+sciLZBUnYTv0FGG80Bn884iEodWmD1pt2aylEG/IFmN9Fzl
         ewPkB8Ft8rFMO8QGfxj+Q8lqEbpOSc2ZfM96XZM4=
Date:   Thu, 5 Nov 2020 01:52:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: i2c: mt9p031: Remove redundant null check before
 clk_disable_unprepare
Message-ID: <20201104235209.GP29958@pendragon.ideasonboard.com>
References: <20201104092948.8560-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104092948.8560-1-vulab@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xu Wang,

Thank you for the patch.

On Wed, Nov 04, 2020 at 09:29:48AM +0000, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Sakari will pick this patch.

> ---
>  drivers/media/i2c/mt9p031.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index dc23b9ed510a..a633b934d93e 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -346,8 +346,7 @@ static void mt9p031_power_off(struct mt9p031 *mt9p031)
>  	regulator_bulk_disable(ARRAY_SIZE(mt9p031->regulators),
>  			       mt9p031->regulators);
>  
> -	if (mt9p031->clk)
> -		clk_disable_unprepare(mt9p031->clk);
> +	clk_disable_unprepare(mt9p031->clk);
>  }
>  
>  static int __mt9p031_set_power(struct mt9p031 *mt9p031, bool on)

-- 
Regards,

Laurent Pinchart
