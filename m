Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7985CBC
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731844AbfHHIZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:25:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51354 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731592AbfHHIZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:25:37 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95204CC;
        Thu,  8 Aug 2019 10:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565252735;
        bh=UUdh4ESKAP2JxL3iAj2D0dHjH7NuU8sy0e8sGDSf16E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHFFLCLT83Yw55Waj3o2paao9oRQn4ul5/eq6P5xaUfOj27+imrptHmH4VS6UuvN9
         faUxFfcwzBeSMH+AGZ99aVofsIKvDEb1n4I7nNNE4VkBvZx/qaCF8O3cvr6rnSYzSK
         ID+Qy5n2rDK953PzL2LtYdvl1dMk0u6ceMO0RlWI=
Date:   Thu, 8 Aug 2019 11:25:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] rcar-vin: Fix incorrect return statement in
 rvin_try_format()
Message-ID: <20190808082533.GC6055@pendragon.ideasonboard.com>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808011850.21219-2-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Aug 08, 2019 at 03:18:45AM +0200, Niklas Söderlund wrote:
> While refactoring code the return statement became corrupted, fix it by
> returning the correct return code.
> 
> Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 897e371389e77514 ("media: rcar-vin: simplify how formats are set and reset"
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index cfed0a2604133849..402b40fcf7184fde 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -239,7 +239,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  done:
>  	v4l2_subdev_free_pad_config(pad_cfg);
>  
> -	return 0;
> +	return ret;

If the v4l2_subdev_call() call above returns -ENOIOCTLCMD, which you
don't consider as an error, you will end up returning that error value
here. You should set ret to 0 before the done: label. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static int rvin_querycap(struct file *file, void *priv,

-- 
Regards,

Laurent Pinchart
