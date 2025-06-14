Return-Path: <linux-media+bounces-34812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B2AD9FED
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 23:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E982174BF5
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 21:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D401F4703;
	Sat, 14 Jun 2025 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nfjICEDp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064AB7462;
	Sat, 14 Jun 2025 21:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749936751; cv=none; b=rlQOW0hkjzAYYARSLoVwiUFK/56PBT+282mNP6CGS3WGo0FSXtqMG+bNXfrUlJ+OmFHCss2eJPE5WCc43OFjKMgCyDbyWi2podtH+3mTFppJeG5oSdLnkjzCA4F2vX5RzX6u2/vaqxD4qI+v5ueG6x8LsCX0SDmol9e8Roy71ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749936751; c=relaxed/simple;
	bh=c7Xr1RrIFGE5wjzGDdsNevrNIjfIdMNqpuDBse36Yig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SttcZPI3kvW10UGSylvu/jFdNHyrjSNQWtyP6V7HLPb62EoNQwEoQIpF3w3v1LDBJ0sFTCWaVjzcmVDe4MfJ0pkIHqEAmOIRhEcrLzAoHNtXzXn8FHbCnFXudBRYDMPtX00Ihv0WhFs2wrt/ttHzDQkoGhk5km6jwJ5Noxkuq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nfjICEDp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 769D15B3;
	Sat, 14 Jun 2025 23:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749936737;
	bh=c7Xr1RrIFGE5wjzGDdsNevrNIjfIdMNqpuDBse36Yig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfjICEDpWKZ1geb9rv4DyhPhesthM5lyXX3xvFqEeHG2Jv6hn1GrvZWpOG1Fp8Xk8
	 Lpg+0YcOg5k+uGTAFVd3QgbEmKhR6glinhjuvVrNgERP/s54c04FBZDQnlUGldEd67
	 6kw9N79rLTrkw9pLc5VAST6pVihMczQpbijxIX8k=
Date: Sun, 15 Jun 2025 00:32:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rcar-vin: Check for correct capture interrupt
 event
Message-ID: <20250614213213.GM10542@pendragon.ideasonboard.com>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
 <20250614141545.2860860-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614141545.2860860-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Sat, Jun 14, 2025 at 04:15:44PM +0200, Niklas Söderlund wrote:
> Depending on if the capture session deals with fields or whole frames
> interrupts can be generated at an end of field, or end of frame event.
> The interrupt mask is setup to generate an interrupt on one of the two
> events depending on what is needed when the VIN is started. The end of
> field bit is set in both cases so controlling the mask that generates an
> interrupt have been enough to control the two use-cases.
> 
> Before extending the interrupt handler to deal with other types of
> interrupt events it is needs to extended to "capture complete" check for
> correct the use-case in operation. Without this the simplification in
> the handler can result in corrupted frames when the mask on what type of
> events can generate an interrupt generated can no longer be assumed to
> only be an "capture complete" event.
> 
> Which bit is checked matches which bit is enabled at configuration time
> as which event can generate an interrupt for "capture complete". There
> is no functional change.
> 
> While at it switch to use the BIT() macro to describe the bit positions
> for the interrupt functions.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index 585b8b3dcfd8..85e44a00e0fc 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -115,11 +115,12 @@
>  #define VNFC_S_FRAME		(1 << 0)
>  
>  /* Video n Interrupt Enable Register bits */
> -#define VNIE_FIE		(1 << 4)
> -#define VNIE_EFE		(1 << 1)
> +#define VNIE_FIE		BIT(4)
> +#define VNIE_EFE		BIT(1)
>  
>  /* Video n Interrupt Status Register bits */
> -#define VNINTS_FIS		(1 << 4)
> +#define VNINTS_FIS		BIT(4)
> +#define VNINTS_EFS		BIT(1)
>  
>  /* Video n Data Mode Register bits */
>  #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
> @@ -1034,7 +1035,7 @@ static void rvin_capture_stop(struct rvin_dev *vin)
>  static irqreturn_t rvin_irq(int irq, void *data)
>  {
>  	struct rvin_dev *vin = data;
> -	u32 status, vnms;
> +	u32 capture, status, vnms;
>  	int slot;
>  	unsigned int handled = 0;
>  	unsigned long flags;
> @@ -1049,7 +1050,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  	handled = 1;
>  
>  	/* Nothing to do if nothing was captured. */
> -	if (!(status & VNINTS_FIS))
> +	capture = vin->format.field == V4L2_FIELD_NONE ||
> +		vin->format.field == V4L2_FIELD_ALTERNATE ?
> +		VNINTS_FIS : VNINTS_EFS;

I would find

	capture = vin->format.field == V4L2_FIELD_NONE ||
		  vin->format.field == V4L2_FIELD_ALTERNATE
		? VNINTS_FIS : VNINTS_EFS;

easier to read, but it could be just me.

Do I read it correctly that you use the "Field Interrupt" with
V4L2_FIELD_NONE ? That seems a bit weird to me, but maybe I don't get
how the hardware operates.

> +	if (!(status & capture))
>  		goto done;
>  
>  	/* Nothing to do if not running. */

-- 
Regards,

Laurent Pinchart

