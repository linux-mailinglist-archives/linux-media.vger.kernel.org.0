Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64F169A217
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 00:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjBPXFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 18:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBPXFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 18:05:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217E64C6FB;
        Thu, 16 Feb 2023 15:05:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A36C2D8;
        Fri, 17 Feb 2023 00:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676588716;
        bh=4Qw7vjryAS5IStd5YguomToNBFCXaujK0w5Tl+O0dcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uayRIWdCTZ3bVs1iGroj9Xbbc1v0J9wc9zwzUb+iX/WI4ZZIhMaDJ1faAL5pzTUZo
         WZSWfY77igIjmNE89bAGRGVxY4pdBtRiPGophWa1ebi76Ha4U6Jb3o6rb1jSbE/d0o
         pfs03TY1M/0vq3i+EBh1EIM1R2URnG9fBUjOl1MI=
Date:   Fri, 17 Feb 2023 01:05:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] media: renesas: vsp1: Add underrun debug print
Message-ID: <Y+62q8UrPoyZ2wSj@pendragon.ideasonboard.com>
References: <20230216094115.151189-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230216094115.151189-1-tomi.valkeinen+renesas@ideasonboard.com>
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

On Thu, Feb 16, 2023 at 11:41:15AM +0200, Tomi Valkeinen wrote:
> Print underrun interrupts with ratelimited print.
> 
> Note that we don't enable the underrun interrupt. If we have underruns,
> we don't want to get flooded with interrupts about them. It's enough to
> see that an underrun happened at the end of a frame.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

again :-) I've taken the patch in my tree.

> ---
> Changes in v4:
> - Store underrun count in pipe
> 
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 +++
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 ++++++++++-
>  drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 ++
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 ++
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index c6f25200982c..5da1bc991750 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -710,6 +710,9 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>  		return 0;
>  	}
>  
> +	/* Reset the underrun counter */
> +	pipe->underrun_count = 0;
> +
>  	drm_pipe->width = cfg->width;
>  	drm_pipe->height = cfg->height;
>  	pipe->interlaced = cfg->interlaced;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 5710152d6511..ab8209e5b07a 100644
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
> +		if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
> +			wpf->entity.pipe->underrun_count++;
> +
> +			dev_warn_ratelimited(vsp1->dev,
> +				"Underrun occurred at WPF%u (total underruns %u)\n",
> +				i, wpf->entity.pipe->underrun_count);
> +		}
> +
>  		if (status & VI6_WPF_IRQ_STA_DFE) {
>  			vsp1_pipeline_frame_end(wpf->entity.pipe);
>  			ret = IRQ_HANDLED;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> index ae646c9ef337..674b5748d929 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -148,6 +148,8 @@ struct vsp1_pipeline {
>  	unsigned int partitions;
>  	struct vsp1_partition *partition;
>  	struct vsp1_partition *part_table;
> +
> +	u32 underrun_count;
>  };
>  
>  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
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
