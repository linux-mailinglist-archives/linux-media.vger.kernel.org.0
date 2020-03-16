Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B125C186B0E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731387AbgCPMgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:36:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35804 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731380AbgCPMgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:36:43 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 650E1A3B;
        Mon, 16 Mar 2020 13:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584362202;
        bh=dFPo2k/vajw5mEbxCwnTy7KzLJ4OMtz9L8sGvtr4HFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RK4QD2tx9kFDJqKjbAyOfcZx5W0GhX4VfuIlYduYzdTjAzaTx2vKdZIxwZUCRMyle
         vANwJnUDROpWVYMayz73Qla+wNWWTNIKPv+U4mIhT8cIpE5bfKa/qyWtPOrY65y5Se
         uUb2my01MMJ4jB+tgfz9uo57ImlrnOAS8rmNL/10=
Date:   Mon, 16 Mar 2020 14:36:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 10/16] media: ti-vpe: cal: fix dummy read to phy
Message-ID: <20200316123636.GC4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-10-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-10-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:15PM +0200, Tomi Valkeinen wrote:
> After ComplexIO reset, a dummy read to PHY is needed as per CAL spec to
> finish the reset. Currently the driver reads a ComplexIO register, not
> PHY register. Fix this.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 771ad7c14c96..b5fd90a1ec09 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -795,8 +795,8 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  		ctx->csi2_port,
>  		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
>  
> -	/* Dummy read to allow SCP to complete */
> -	val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
> +	/* Dummy read to allow SCP reset to complete */
> +	reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
>  
>  	/* 3.A. Program Phy Timing Parameters */
>  	csi2_phy_config(ctx);

-- 
Regards,

Laurent Pinchart
