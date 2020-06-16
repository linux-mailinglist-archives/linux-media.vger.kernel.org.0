Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0041FA652
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 04:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgFPCN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 22:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgFPCNZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 22:13:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01661C061A0E;
        Mon, 15 Jun 2020 19:13:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F11AF9;
        Tue, 16 Jun 2020 04:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592273603;
        bh=c9mN9RfMTwPGD69RrgX8WFBSnjj4aqc+2Vr28AX2PdE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gJnOQ5uoyaBs9UPEVcaagx9xtnk+gB/KUFkA+uZnhCQlWlmfyb/zBI/7rs5vBKtaT
         T9Yg0zQHj6vRJyDFIeTqmHKhCs6Xyaup41/Qk6Qm4TrXZOzZ70ORtidUCo4Nr1Hb/4
         V0Ox9AmAaYPbY5/Mnfe+s+7tvcZVRpfSPY3WXplI=
Date:   Tue, 16 Jun 2020 05:13:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     wu000273@umn.edu
Cc:     kjlu@umn.edu,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Fix a reference count leak.
Message-ID: <20200616021301.GA29596@pendragon.ideasonboard.com>
References: <20200613223008.11720-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200613223008.11720-1-wu000273@umn.edu>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Qiushi,

Thank you for the patch.

On Sat, Jun 13, 2020 at 05:30:08PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.
> 
> Fixes: 90dedce9bc54 ("media: rcar-vin: add function to manipulate Gen3 chsel value")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>

This should be squashed with the other patch that you have sent for the
driver, with the exact same subject line. This being said, as commented
on your similar patch for the vsp1 driver, I'd rather see the problem
being fixed inside pm_runtime_get_sync().

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd036371..95bc9e0e8792 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1392,8 +1392,10 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(vin->dev);
>  		return ret;
> +	}
>  
>  	/* Make register writes take effect immediately. */
>  	vnmc = rvin_read(vin, VNMC_REG);

-- 
Regards,

Laurent Pinchart
