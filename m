Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94096204AD
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfEPL1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:27:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57394 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfEPL1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:27:30 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1181625AD69;
        Thu, 16 May 2019 21:27:28 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 06039E21EEB; Thu, 16 May 2019 13:27:26 +0200 (CEST)
Date:   Thu, 16 May 2019 13:27:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
Message-ID: <20190516112725.elkmbjjfiwiyp35b@verge.net.au>
References: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 16, 2019 at 02:35:38AM +0200, Niklas Söderlund wrote:
> Use the PTR_ERR_OR_ZERO() macro instead of construct:
> 
>     if (IS_ERR(foo))
>         return PTR_ERR(foo);
> 
>     return 0;
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 8f097e514900307f..c14af1b929dffd34 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1019,10 +1019,8 @@ static int rcsi2_probe_resources(struct rcar_csi2 *priv,
>  		return ret;
>  
>  	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);
> -	if (IS_ERR(priv->rstc))
> -		return PTR_ERR(priv->rstc);
>  
> -	return 0;
> +	return PTR_ERR_OR_ZERO(priv->rstc);
>  }
>  
>  static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
> -- 
> 2.21.0
> 
