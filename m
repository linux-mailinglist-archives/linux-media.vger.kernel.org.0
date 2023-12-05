Return-Path: <linux-media+bounces-1663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB08053C1
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B6C51F2135B
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68245ABA1;
	Tue,  5 Dec 2023 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JS1atgLu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E21C3;
	Tue,  5 Dec 2023 04:04:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDE96844;
	Tue,  5 Dec 2023 13:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701777834;
	bh=rxY8uJX52+CDwxpiKj8J/NBwZBTNLXNQ86G0OAH3DTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JS1atgLuEi85qXwn7oAOOgu2q9O9ukqrUnmRGCbx8oav/6bJVIkhmdOa/YP6rtvvd
	 9eowlDRZhGm1zSzp9nM9Cp0O+qi8/sRP2Z2YYLejKlL+c2d+AHRcTv+T4aEfasAt8O
	 YLUb2HJWkmv7oEtavg2YBECM6wDa6cosGKH0eF+I=
Date: Tue, 5 Dec 2023 14:04:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	kieran.bingham@ideasonboard.com, umang.jain@ideasonboard.com,
	aford173@gmail.com, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: rkisp1: Fix IRQ handler return values
Message-ID: <20231205120441.GD17394@pendragon.ideasonboard.com>
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
 <20231205-rkisp-irq-fix-v1-2-f4045c74ba45@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205-rkisp-irq-fix-v1-2-f4045c74ba45@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 05, 2023 at 10:09:33AM +0200, Tomi Valkeinen wrote:
> The IRQ handler rkisp1_isr() calls sub-handlers, all of which returns an
> irqreturn_t value, but rkisp1_isr() ignores those values and always
> returns IRQ_HANDLED.
> 
> Fix this by collecting the return values, and returning IRQ_HANDLED or
> IRQ_NONE as appropriate.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 76f93614b4cf..1d60f4b8bd09 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -445,17 +445,27 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  
>  static irqreturn_t rkisp1_isr(int irq, void *ctx)
>  {
> +	irqreturn_t ret;

	irqreturn_t ret = IRQ_NONE;

> +
>  	/*
>  	 * Call rkisp1_capture_isr() first to handle the frame that
>  	 * potentially completed using the current frame_sequence number before
>  	 * it is potentially incremented by rkisp1_isp_isr() in the vertical
>  	 * sync.
>  	 */
> -	rkisp1_capture_isr(irq, ctx);
> -	rkisp1_isp_isr(irq, ctx);
> -	rkisp1_csi_isr(irq, ctx);
>  
> -	return IRQ_HANDLED;
> +	ret = IRQ_NONE;

And drop this.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	if (rkisp1_capture_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	if (rkisp1_isp_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	if (rkisp1_csi_isr(irq, ctx) == IRQ_HANDLED)
> +		ret = IRQ_HANDLED;
> +
> +	return ret;
>  }
>  
>  static const char * const px30_isp_clks[] = {

-- 
Regards,

Laurent Pinchart

