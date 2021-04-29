Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB3E36E25B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 02:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhD2AID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 20:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhD2AID (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 20:08:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B76C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 17:07:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4445DDA8;
        Thu, 29 Apr 2021 02:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619654836;
        bh=g0SRrd6UJtNdkHO08mk/DFdLgI4FaTiNUmMjsBl5bxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZgzSVRGbHeM+bb5riXiwdYTTSMD+Gz+UXECG4PHcVx4uic4+5d0UKFHw1PA3/ANxj
         ew0vNEZtLPnZZyXxtDAkV84cd8GRFnGFD49mc4r+TloMr4Ar9T+DpNTrkBFJ5+89yu
         /+RFhMPmk+SlGWSTIpHSwaHK9mLF9435/HzYUwng=
Date:   Thu, 29 Apr 2021 03:07:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 18/28] media: ti-vpe: cal: add 'use_pix_proc' field
Message-ID: <YIn4rhvPFp0BEUHy@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-19-tomi.valkeinen@ideasonboard.com>
 <YHwtdPrlkpXeyDP6@pendragon.ideasonboard.com>
 <95b7e178-3448-e3b0-6fd7-93dfd932626b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <95b7e178-3448-e3b0-6fd7-93dfd932626b@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Apr 19, 2021 at 02:53:56PM +0300, Tomi Valkeinen wrote:
> On 18/04/2021 16:00, Laurent Pinchart wrote:
> > On Mon, Apr 12, 2021 at 02:34:47PM +0300, Tomi Valkeinen wrote:
> >> We already have functions to reserve and release a pix proc unit, but we
> >> always reserve such and the code expects the pix proc unit to be used.
> >>
> >> Add a new field, 'use_pix_proc', to indicate if the pix prox unit has
> >> been reserved and should be used. Use the flag to skip programming pix
> >> proc unit when not needed.
> >>
> >> Note that we still always set the use_pix_proc flag to true.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal.c | 10 +++++++---
> >>   drivers/media/platform/ti-vpe/cal.h |  2 ++
> >>   2 files changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> >> index e397f59d3bbc..a1d173bd4613 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.c
> >> +++ b/drivers/media/platform/ti-vpe/cal.c
> >> @@ -473,13 +473,15 @@ int cal_ctx_prepare(struct cal_ctx *ctx)
> >>   	}
> >>   
> >>   	ctx->pix_proc = ret;
> >> +	ctx->use_pix_proc = true;
> >>   
> >>   	return 0;
> >>   }
> >>   
> >>   void cal_ctx_unprepare(struct cal_ctx *ctx)
> >>   {
> >> -	cal_release_pix_proc(ctx->cal, ctx->pix_proc);
> >> +	if (ctx->use_pix_proc)
> >> +		cal_release_pix_proc(ctx->cal, ctx->pix_proc);
> >>   }
> >>   
> >>   void cal_ctx_start(struct cal_ctx *ctx)
> >> @@ -489,7 +491,8 @@ void cal_ctx_start(struct cal_ctx *ctx)
> >>   
> >>   	/* Configure the CSI-2, pixel processing and write DMA contexts. */
> >>   	cal_ctx_csi2_config(ctx);
> >> -	cal_ctx_pix_proc_config(ctx);
> >> +	if (ctx->use_pix_proc)
> >> +		cal_ctx_pix_proc_config(ctx);
> >>   	cal_ctx_wr_dma_config(ctx);
> >>   
> >>   	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
> >> @@ -530,7 +533,8 @@ void cal_ctx_stop(struct cal_ctx *ctx)
> >>   	cal_write(ctx->cal, CAL_CSI2_CTX(ctx->phy->instance, ctx->ppi_ctx), 0);
> >>   
> >>   	/* Disable pix proc */
> >> -	cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
> >> +	if (ctx->use_pix_proc)
> >> +		cal_write(ctx->cal, CAL_PIX_PROC(ctx->pix_proc), 0);
> >>   }
> >>   
> >>   /* ------------------------------------------------------------------
> >> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> >> index 01e05e46e48d..409b7276a1fa 100644
> >> --- a/drivers/media/platform/ti-vpe/cal.h
> >> +++ b/drivers/media/platform/ti-vpe/cal.h
> >> @@ -223,6 +223,8 @@ struct cal_ctx {
> >>   	u8			cport;
> >>   	u8			ppi_ctx;
> >>   	u8			pix_proc;
> >> +
> >> +	bool use_pix_proc;
> > 
> > Indentation ?
> > 
> > How about turning pix_proc to a signed value, and using -1 to indicate
> > it's not used ?
> 
> I considered that. But then, instead of "if (ctx->use_pix_proc)" I would 
> have "if (ctx->use_pix_proc >= 0)". I think the former is better. And 
> having a non-zero default value always makes me a bit uneasy.

I personally feel more uneasy when having a bool that qualifies whether
another field is valid or not :-) Probably because I then never know
what to set the other field to when setting the bool to false. It could
just be me, it doesn't matter much.

-- 
Regards,

Laurent Pinchart
