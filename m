Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7A156984E
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 04:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbiGGCpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 22:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGGCpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 22:45:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196542E6AA
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 19:45:52 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 605B9526;
        Thu,  7 Jul 2022 04:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657161950;
        bh=gPPSDHd3HNLDV5AXh3YFn765F/tVZFoYqB1vQyvW9bM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIHrI8MuqzvQAEMw6lG19lF0Q9NOyytrjgVOO3hcmLkQjvN+4uu+zxu3Ei/aYRJvo
         tlMIbzBirqjBOra0cnAmFhS/vdWDXwz9yJVCpBRJNA6KIpEPcZo22fgAzEzILczuX3
         Sq9RBtepUhsAcQyqa8z8R4A6YmhwfVGUta9SNWrY=
Date:   Thu, 7 Jul 2022 11:45:42 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 12/55] media: rkisp1: cap: Print debug message on
 failed link validation
Message-ID: <20220707024542.GG3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-13-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:30AM +0300, Laurent Pinchart wrote:
> When a link validation failure occurs, print a debug message to help
> diagnosing the cause.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Add missing \n
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 94819e6c23e2..fb14c8aa154c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  
>  	if (sd_fmt.format.height != cap->pix.fmt.height ||
>  	    sd_fmt.format.width != cap->pix.fmt.width ||
> -	    sd_fmt.format.code != fmt->mbus)
> +	    sd_fmt.format.code != fmt->mbus) {
> +		dev_dbg(cap->rkisp1->dev,
> +			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> +			link->source->entity->name, link->source->index,
> +			link->sink->entity->name, link->sink->index,
> +			sd_fmt.format.code, sd_fmt.format.width,
> +			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
> +			cap->pix.fmt.height);
>  		return -EPIPE;
> +	}
>  
>  	return 0;
>  }
