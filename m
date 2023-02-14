Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE25697086
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 23:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbjBNWPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 17:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbjBNWPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 17:15:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0F3311EB;
        Tue, 14 Feb 2023 14:15:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B1F63D7;
        Tue, 14 Feb 2023 23:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676412904;
        bh=J1heIFgOfnBY9Ez2Tc0IIwkTkEEqRtgyWxmHRaB+i2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mv6TvQ9rSZZk1SP1kZjeCETgtu2j8bTQr0KwJ//bDCfqcX3dG+3AfLsXyFaABK8Ba
         S9fct5l+FZilUTNNJXK1ahLz62NZwePbd7ehEbp9kwPhvuetP67Keb8AewdnNEhERN
         Yh9OanliD/Eu8crq2BR+RAWMEeLTNl4v0CS3TBMc=
Date:   Wed, 15 Feb 2023 00:15:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: renesas: vsp1: Add underrun debug print
Message-ID: <Y+wH59GVBf1J5u8X@pendragon.ideasonboard.com>
References: <20230214164223.184920-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230214164223.184920-1-tomi.valkeinen+renesas@ideasonboard.com>
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

On Tue, Feb 14, 2023 at 06:42:23PM +0200, Tomi Valkeinen wrote:
> Print underrun interrupts with ratelimited print.
> 
> Note that we don't enable the underrun interrupt. If we have underruns,
> we don't want to get flooded with interrupts about them. It's enough to
> see that an underrun happened at the end of a frame.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> 
> Changes in v3:
> - Reset underrun counter when enabling VSP
> 
> I have to say I'm not familiar enough with the VSP driver to say if
> these are the correct places where to reset the counters.

It's fine. We could factor it out to a clear function, but it's not
worth it if there's nothing else to factor out. It could be done later.

> There's also a
> possibility of a race, but my assumption is that we cannot get underrun
> interrupts for the WPF we are currently enabling.

It should be fine.

> Also, I realized the underrun counter could be moved to struct
> vsp1_rwpf, but as that's used also for RPF, I didn't do that change.

Another option would be to store it in the pipeline structure, as a
pipeline has one and only one WPF. What do you think ?

>  drivers/media/platform/renesas/vsp1/vsp1.h       |  2 ++
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c   |  3 +++
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c   | 11 ++++++++++-
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h  |  2 ++
>  drivers/media/platform/renesas/vsp1/vsp1_video.c |  3 +++
>  5 files changed, 20 insertions(+), 1 deletion(-)
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
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index c6f25200982c..e3b4e993787c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -710,6 +710,9 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>  		return 0;
>  	}
>  
> +	/* Reset the underrun counter */
> +	vsp1->underrun_count[pipe->output->entity.index] = 0;
> +
>  	drm_pipe->width = cfg->width;
>  	drm_pipe->height = cfg->height;
>  	pipe->interlaced = cfg->interlaced;
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
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index 544012fd1fe9..6eca2b9c8dee 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -1062,6 +1062,9 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
>  	if (ret < 0)
>  		goto err_stop;
>  
> +	/* Reset the underrun counter */
> +	video->vsp1->underrun_count[pipe->output->entity.index] = 0;
> +
>  	/* Start the queue. */
>  	ret = vb2_streamon(&video->queue, type);
>  	if (ret < 0)

-- 
Regards,

Laurent Pinchart
