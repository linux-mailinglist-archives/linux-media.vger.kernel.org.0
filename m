Return-Path: <linux-media+bounces-34813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BFAD9FF1
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 23:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96263B2910
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 21:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9EC1F4E34;
	Sat, 14 Jun 2025 21:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tmwiXE9v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB47462;
	Sat, 14 Jun 2025 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749937008; cv=none; b=HuFhba1URnxE7DQ8fKjL2NWj3AAE6CiXKwICYD6j7S0mB+B2yLwy+0kp74Efkx4DC1j/TCn6/qcsmdyNPYrisSYQYyTqlSQlXdbQyHTmv05wO0K76TBcMtXp1ruxw2oAZ0Skj1IGUA52QsXQaOBXN7AM11e/mC1HZBtHGFzvnoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749937008; c=relaxed/simple;
	bh=19AIx2vJd2qqofzE7+LN1Q/t9umkB+UMkwyVaa3RVPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVePXZnl+bF6ZSoUeBfWqyYD3dZLNvjWYgmumacBIelJP31BKjqn6hHWn74HnzgoVcwvao20GsnMTrG86KlKWHzn8Du4AZhxEHROk0gj+3YXdasyHlpPvXa8RLtsAfiFjrFFgRtlh62LS4rWMWmCvpoC8KM/hYZiKZ0vVmRmmvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tmwiXE9v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FB015B3;
	Sat, 14 Jun 2025 23:36:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749936994;
	bh=19AIx2vJd2qqofzE7+LN1Q/t9umkB+UMkwyVaa3RVPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmwiXE9vIu3Tq9lWfhiUjYUBlVV6Dgh4vqY2lKG1EFWPbsnR6n1jH5WKL9xMFvac3
	 DgpBcGO7aMdyRA0F66xRovWShWiVusZXWM9K51/7iNSLBVlYmuUDTXJovHcGdCk7MA
	 fCjETq67bhq5UVFXwtRrHhppRGdkWknmrGhNBHLo=
Date: Sun, 15 Jun 2025 00:36:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rcar-vin: Generate FRAME_SYNC events
Message-ID: <20250614213629.GN10542@pendragon.ideasonboard.com>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
 <20250614141545.2860860-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614141545.2860860-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Sat, Jun 14, 2025 at 04:15:45PM +0200, Niklas Söderlund wrote:
> Enable the VSYNC Rising Edge Detection interrupt and generate a
> FRAME_SYNC event form it. The interrupt is available on all supported
> models of the VIN (Gen2, Gen3 and Gen4).
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/rcar-vin/rcar-dma.c  | 17 +++++++++++++++++
>  .../media/platform/renesas/rcar-vin/rcar-v4l2.c |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 85e44a00e0fc..a1ae9c9bccc7 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -14,6 +14,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/pm_runtime.h>
>  
> +#include <media/v4l2-event.h>
>  #include <media/videobuf2-dma-contig.h>
>  
>  #include "rcar-vin.h"
> @@ -115,10 +116,14 @@
>  #define VNFC_S_FRAME		(1 << 0)
>  
>  /* Video n Interrupt Enable Register bits */
> +#define VNIE_VFE		BIT(17)
> +#define VNIE_VRE		BIT(16)
>  #define VNIE_FIE		BIT(4)
>  #define VNIE_EFE		BIT(1)
>  
>  /* Video n Interrupt Status Register bits */
> +#define VNINTS_VFS		BIT(17)
> +#define VNINTS_VRS		BIT(16)
>  #define VNINTS_FIS		BIT(4)
>  #define VNINTS_EFS		BIT(1)
>  
> @@ -898,6 +903,8 @@ static int rvin_setup(struct rvin_dev *vin)
>  
>  	/* Progressive or interlaced mode */
>  	interrupts = progressive ? VNIE_FIE : VNIE_EFE;
> +	/* Enable VSYNC Rising Edge Detection. */
> +	interrupts |= VNIE_VRE;
>  
>  	/* Ack interrupts */
>  	rvin_write(vin, interrupts, VNINTS_REG);
> @@ -1049,6 +1056,16 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  	rvin_write(vin, status, VNINTS_REG);
>  	handled = 1;
>  
> +	/* Signal Start of Frame. */
> +	if (status & VNINTS_VRS) {
> +		struct v4l2_event event = {
> +			.type = V4L2_EVENT_FRAME_SYNC,
> +			.u.frame_sync.frame_sequence = vin->sequence,
> +		};
> +
> +		v4l2_event_queue(&vin->vdev, &event);
> +	}
> +
>  	/* Nothing to do if nothing was captured. */
>  	capture = vin->format.field == V4L2_FIELD_NONE ||
>  		vin->format.field == V4L2_FIELD_ALTERNATE ?
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index db091af57c19..6339de54b02b 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -734,6 +734,8 @@ static int rvin_subscribe_event(struct v4l2_fh *fh,
>  				const struct v4l2_event_subscription *sub)
>  {
>  	switch (sub->type) {
> +	case V4L2_EVENT_FRAME_SYNC:
> +		return v4l2_event_subscribe(fh, sub, 2, NULL);
>  	case V4L2_EVENT_SOURCE_CHANGE:
>  		return v4l2_event_subscribe(fh, sub, 4, NULL);
>  	}

-- 
Regards,

Laurent Pinchart

