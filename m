Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6497069685A
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 16:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjBNPpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 10:45:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbjBNPpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 10:45:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCC22A99A;
        Tue, 14 Feb 2023 07:45:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B08343D7;
        Tue, 14 Feb 2023 16:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676389534;
        bh=iuPf+rutfurGD9FFO60QvBd9H+HGCwLihBIEK9WDQIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FnmoEkjfVj+fJp5QEXZ8cYJVCyYq+3OPj5dcn05FAlgFe8GPijMW3mrg0qz3xX6ga
         4/BSdRbVcIsQO5FwHznP9GPRxGd8oOCYk8X+XdnSGOpJepCPKCuEj3K0rWK9OYJg1l
         2UqACIGeZhCzJXcx96syiX2cUQ6WmB9Gw5F+Whig=
Date:   Tue, 14 Feb 2023 17:45:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: renesas: vsp1: Add underrun debug print
Message-ID: <Y+usnmP0lklJ7k3T@pendragon.ideasonboard.com>
References: <20230214153412.154821-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230214153412.154821-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Feb 14, 2023 at 05:34:12PM +0200, Tomi Valkeinen wrote:
> Print underrun interrupts with ratelimited print.
> 
> Note that we don't enable the underrun interrupt. If we have underruns,
> we don't want to get flooded with interrupts about them. It's enough to
> see that an underrun happened at the end of a frame.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> 
> Changes in v2:
> - Add underrun count
> 
>  drivers/media/platform/renesas/vsp1/vsp1.h      |  2 ++
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 ++++++++++-
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 ++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
> index 2f6f0c6ae555..9eb023f4fee8 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> @@ -107,6 +107,8 @@ struct vsp1_device {
>  	struct media_entity_operations media_ops;
>  
>  	struct vsp1_drm *drm;
> +
> +	u32 underrun_count[VSP1_MAX_WPF];
>  };
>  
>  int vsp1_device_get(struct vsp1_device *vsp1);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 5710152d6511..f9be0fda1659 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -45,7 +45,8 @@
>  
>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  {
> -	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
> +	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
> +		   VI6_WPF_IRQ_STA_UND;
>  	struct vsp1_device *vsp1 = data;
>  	irqreturn_t ret = IRQ_NONE;
>  	unsigned int i;
> @@ -60,6 +61,14 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>  		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
>  
> +		if (status & VI6_WPF_IRQ_STA_UND) {
> +			vsp1->underrun_count[i]++;
> +
> +			dev_warn_ratelimited(vsp1->dev,
> +				"Underrun occurred at WPF%u (total underruns %u)\n",
> +				i, vsp1->underrun_count[i]);
> +		}

Looks good, but could we also reset the underrun counters when starting
the VSP ? With that, I'll be happy with the patch.

> +
>  		if (status & VI6_WPF_IRQ_STA_DFE) {
>  			vsp1_pipeline_frame_end(wpf->entity.pipe);
>  			ret = IRQ_HANDLED;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index d94343ae57a1..7eca82e0ba7e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -32,10 +32,12 @@
>  #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
>  
>  #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
> +#define VI6_WPF_IRQ_ENB_UNDE		BIT(16)
>  #define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
>  #define VI6_WPF_IRQ_ENB_FREE		BIT(0)
>  
>  #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
> +#define VI6_WPF_IRQ_STA_UND		BIT(16)
>  #define VI6_WPF_IRQ_STA_DFE		BIT(1)
>  #define VI6_WPF_IRQ_STA_FRE		BIT(0)
>  

-- 
Regards,

Laurent Pinchart
