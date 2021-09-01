Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2A63FE547
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 00:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245276AbhIAWKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 18:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhIAWKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 18:10:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995A0C061575;
        Wed,  1 Sep 2021 15:09:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38F94340;
        Thu,  2 Sep 2021 00:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630534154;
        bh=F9fPuOKBc56QfixHGw2D7/gcoS/6ATrxXzfntuIGcF8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X6+ofViUI0zQiP5XA/5dbDiwRNRa30p++ggAhOccNH2F8bRltnO6Vze9sg7hiRMUK
         DC9JQz865VSPcGue7Ok3uzf3knub+s/moh54MK1sEHbNNGBYFHvVUzgqYL3qnpaAFs
         opdtFMJtljxtagAFBej5gcWr//adKbD9l/xfYc2A=
Date:   Thu, 2 Sep 2021 01:08:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Fix WPF macro names
Message-ID: <YS/5+iNKQsuRFvPJ@pendragon.ideasonboard.com>
References: <20210618161041.444987-1-kieran.bingham@ideasonboard.com>
 <YMzIGSYHrYV2tTQ7@pendragon.ideasonboard.com>
 <3e68b84d-c8c5-9518-b5a6-c7a98adc7ef0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e68b84d-c8c5-9518-b5a6-c7a98adc7ef0@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Sep 01, 2021 at 11:06:00PM +0100, Kieran Bingham wrote:
> On 18/06/2021 17:21, Laurent Pinchart wrote:
> > On Fri, Jun 18, 2021 at 05:10:41PM +0100, Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> The WPF IRQ enable and status macros have been incorrectly named WFP.
> >> Fix them accordingly, and update all uses of the macros.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Wow, and all this time it has escaped our eyes.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Feel free to push. Oh, wait... I'm too used to libcamera :-)
> 
> Has this been collected anywhere?

It has now.

> I don't see it progressing.
> 
> >> ---
> >>  drivers/media/platform/vsp1/vsp1_drv.c  | 4 ++--
> >>  drivers/media/platform/vsp1/vsp1_regs.h | 8 ++++----
> >>  drivers/media/platform/vsp1/vsp1_wpf.c  | 2 +-
> >>  3 files changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> >> index de442d6c9926..1018786d0437 100644
> >> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> >> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> >> @@ -44,7 +44,7 @@
> >>  
> >>  static irqreturn_t vsp1_irq_handler(int irq, void *data)
> >>  {
> >> -	u32 mask = VI6_WFP_IRQ_STA_DFE | VI6_WFP_IRQ_STA_FRE;
> >> +	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
> >>  	struct vsp1_device *vsp1 = data;
> >>  	irqreturn_t ret = IRQ_NONE;
> >>  	unsigned int i;
> >> @@ -59,7 +59,7 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
> >>  		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
> >>  		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
> >>  
> >> -		if (status & VI6_WFP_IRQ_STA_DFE) {
> >> +		if (status & VI6_WPF_IRQ_STA_DFE) {
> >>  			vsp1_pipeline_frame_end(wpf->entity.pipe);
> >>  			ret = IRQ_HANDLED;
> >>  		}
> >> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> >> index fe3130db1fa2..97942436868c 100644
> >> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> >> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> >> @@ -32,12 +32,12 @@
> >>  #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
> >>  
> >>  #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
> >> -#define VI6_WFP_IRQ_ENB_DFEE		BIT(1)
> >> -#define VI6_WFP_IRQ_ENB_FREE		BIT(0)
> >> +#define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
> >> +#define VI6_WPF_IRQ_ENB_FREE		BIT(0)
> >>  
> >>  #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
> >> -#define VI6_WFP_IRQ_STA_DFE		BIT(1)
> >> -#define VI6_WFP_IRQ_STA_FRE		BIT(0)
> >> +#define VI6_WPF_IRQ_STA_DFE		BIT(1)
> >> +#define VI6_WPF_IRQ_STA_FRE		BIT(0)
> >>  
> >>  #define VI6_DISP_IRQ_ENB(n)		(0x0078 + (n) * 60)
> >>  #define VI6_DISP_IRQ_ENB_DSTE		BIT(8)
> >> diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
> >> index 208498fa6ed7..94e91d7bb56c 100644
> >> --- a/drivers/media/platform/vsp1/vsp1_wpf.c
> >> +++ b/drivers/media/platform/vsp1/vsp1_wpf.c
> >> @@ -342,7 +342,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
> >>  	/* Enable interrupts. */
> >>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
> >>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
> >> -			   VI6_WFP_IRQ_ENB_DFEE);
> >> +			   VI6_WPF_IRQ_ENB_DFEE);
> >>  
> >>  	/*
> >>  	 * Configure writeback for display pipelines (the wpf writeback flag is

-- 
Regards,

Laurent Pinchart
