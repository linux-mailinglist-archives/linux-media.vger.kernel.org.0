Return-Path: <linux-media+bounces-1664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BB8053E9
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3E1AB20C75
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBAB5B1EB;
	Tue,  5 Dec 2023 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q6OEmb5m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718D4D7;
	Tue,  5 Dec 2023 04:13:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 619B6844;
	Tue,  5 Dec 2023 13:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701778388;
	bh=0ZLr3kFQ/SRckdRD/WtVOMYCg8x0SdcGPUxWJlxbTSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6OEmb5m+LGJD4zSLWKgY92Ie7m6mdi0BK0wkagE6rqjc15tEFpTp2Alyi8NZdMc/
	 IVN84yY+f6rc2thMg75CK6Mh5IXgqRxFn6emZA2ubX4vWZgu70mWDQw38aBHKcntxp
	 mgTMuGzaeP9wD78HMIR1Zzmf8dhnZ2LhI6sYITNI=
Date: Tue, 5 Dec 2023 14:13:55 +0200
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
Subject: Re: [PATCH 4/4] media: rkisp1: Fix IRQ disable race issue
Message-ID: <20231205121355.GE17394@pendragon.ideasonboard.com>
References: <20231205-rkisp-irq-fix-v1-0-f4045c74ba45@ideasonboard.com>
 <20231205-rkisp-irq-fix-v1-4-f4045c74ba45@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205-rkisp-irq-fix-v1-4-f4045c74ba45@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 05, 2023 at 10:09:35AM +0200, Tomi Valkeinen wrote:
> In rkisp1_isp_stop() and rkisp1_csi_disable() the driver masks the
> interrupts and then apparently assumes that the interrupt handler won't
> be running, and proceeds in the stop procedure. This is not the case, as
> the interrupt handler can already be running, which would lead to the
> ISP being disabled while the interrupt handler handling a captured
> frame.
> 
> It is not clear to me if this problem causes a real issue, but shutting
> down the ISP while an interrupt handler is running sounds rather bad.

Agreed.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 14 +++++++++++++-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 20 +++++++++++++++++---
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> index f6b54654b435..f0cef766fc0c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> @@ -125,8 +125,20 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
>  	struct rkisp1_device *rkisp1 = csi->rkisp1;
>  	u32 val;
>  
> -	/* Mask and clear interrupts. */
> +	/* Mask MIPI interrupts. */
>  	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_IMSC, 0);
> +
> +	/* Flush posted writes */
> +	rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
> +
> +	/*
> +	 * Wait until the IRQ handler has ended. The IRQ handler may get called
> +	 * even after this, but it will return immediately as the MIPI
> +	 * interrupts have been masked.
> +	 */

This comment will need to be updated if patch 3/4 gets replaced by a
patch that drops IRQF_SHARED.

> +	synchronize_irq(rkisp1->irqs[RKISP1_IRQ_MIPI]);
> +
> +	/* Clear MIPI interrupt status */
>  	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_ICR, ~0);
>  
>  	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d6b8786661ad..a6dd497c884c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -364,11 +364,25 @@ static void rkisp1_isp_stop(struct rkisp1_isp *isp)
>  	 * ISP(mi) stop in mi frame end -> Stop ISP(mipi) ->
>  	 * Stop ISP(isp) ->wait for ISP isp off
>  	 */
> -	/* stop and clear MI and ISP interrupts */
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
> -	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
>  
> +	/* Mask MI and ISP interrupts */
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_IMSC, 0);
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_IMSC, 0);
> +
> +	/* Flush posted writes */
> +	rkisp1_read(rkisp1, RKISP1_CIF_MI_IMSC);
> +
> +	/*
> +	 * Wait until the IRQ handler has ended. The IRQ handler may get called
> +	 * even after this, but it will return immediately as the MI and ISP
> +	 * interrupts have been masked.
> +	 */

Same here.

> +	synchronize_irq(rkisp1->irqs[RKISP1_IRQ_ISP]);
> +	if (rkisp1->irqs[RKISP1_IRQ_ISP] != rkisp1->irqs[RKISP1_IRQ_MI])
> +		synchronize_irq(rkisp1->irqs[RKISP1_IRQ_MI]);

It would be nice if we could avoid the double synchronize_irq() for
platforms where RKISP1_IRQ_MIPI and RKISP1_IRQ_ISP are identical, but I
understand that would be difficult.

> +
> +	/* Clear MI and ISP interrupt status */
> +	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ICR, ~0);
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, ~0);
>  
>  	/* stop ISP */

-- 
Regards,

Laurent Pinchart

