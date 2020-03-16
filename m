Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A472E186B1E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731173AbgCPMhk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:37:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731096AbgCPMhj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:37:39 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B22AA3B;
        Mon, 16 Mar 2020 13:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362257;
        bh=QVi3BemugcVIIrFpJiKOANRze8fyGTYcB8tkeHonmbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aqYN0H/GDTdOO9uVGCJJlG3xq0hD2ayr1h4DEP3Sn6KUsDOFyjWEEgSmV+zM/bxnD
         7Z/4m5w5xyETgovZwsTV9fpnU3Hc9YQ1+D4MO9KKMiuypZ9LswSQr5jr3yM0jcgrrU
         8kyhqEbC7D0pALwydEa3NGK1c3mgoOOWmfchtCZc=
Date:   Mon, 16 Mar 2020 14:37:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 11/16] media: ti-vpe: cal: program number of lines
 properly
Message-ID: <20200316123732.GD4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-11-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-11-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 13, 2020 at 01:41:16PM +0200, Tomi Valkeinen wrote:
> CAL_CSI2_CTX register has LINES field, which, according to the
> documentation, should be programmed to the number of lines transmitted
> by the camera. If the number of lines is unknown, it can be set to 0.
> The driver sets the field to 0 for some reason, even if we know the
> number of lines.
> 
> This patch sets the number of lines properly, which will allow the HW to
> discard extra lines (if the sensor would send such for some reason),
> and, according to documentation: "This leads to regular video timings
> and avoids potential artifacts".

And possibly buffer overflows !

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index b5fd90a1ec09..832f37ebad0d 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -961,8 +961,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
>  	set_field(&val, 0x1, CAL_CSI2_CTX_DT_MASK);
>  	/* Virtual Channel from the CSI2 sensor usually 0! */
>  	set_field(&val, ctx->virtual_channel, CAL_CSI2_CTX_VC_MASK);
> -	/* NUM_LINES_PER_FRAME => 0 means auto detect */
> -	set_field(&val, 0, CAL_CSI2_CTX_LINES_MASK);
> +	set_field(&val, ctx->v_fmt.fmt.pix.height, CAL_CSI2_CTX_LINES_MASK);
>  	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
>  	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
>  		  CAL_CSI2_CTX_PACK_MODE_MASK);

-- 
Regards,

Laurent Pinchart
