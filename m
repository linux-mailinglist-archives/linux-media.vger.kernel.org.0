Return-Path: <linux-media+bounces-25225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11408A1ABF5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 22:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF95C3AD02B
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 21:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008631CAA9D;
	Thu, 23 Jan 2025 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fik+yoRS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D41CEEA4;
	Thu, 23 Jan 2025 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668002; cv=none; b=OA4ts0fX2ClfEgVPRWXJRr3lQIAe/kon2nbI+6SgA548KIx1R74TnHDQIcZa7S0H+wTpwguo76nNBsPK+Aa9iJkNiLuju8GkIr7WfBqA43S1Hd+DLYvUGJXKIRAiQirb+RbujO/5DeBDbDWbTmpWswPgiDlM/f004duRcOaAGzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668002; c=relaxed/simple;
	bh=+mVLbiNXQsHaMaSE38NfKbb6p2ApuJNQ4P5kalK0aT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0HVqRhNiZV6RtqywmAmPWXGXne7oqxbFWHbOiL5Qcc2PaVgCUvElymu3GdcVblk3JpikQ2IHIwyTjzn1cdomxgYnPdZQXXbft+kWv8vIZbxsoZlBO5WKpHpkGyqMNe8cNQ6uvZdp/FCiuNFHWtTheBE5MDtafATiC5bq4AB87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fik+yoRS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E819D1F;
	Thu, 23 Jan 2025 22:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737667933;
	bh=+mVLbiNXQsHaMaSE38NfKbb6p2ApuJNQ4P5kalK0aT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fik+yoRSqqhRX1yemkp+aQARF3UaXNgkO0/UTHbNJsZkpZP/iUNiFhSUSEthE7n1S
	 a5cgl4rLJIbCiGdPnQaChB90WAmGQZFdbAde8m4lGF7Ggq/4emUFmfhNqpAbI4wSPp
	 /E8TfQ5DAQts9Hf/1vP7KDSupu20V6FBz7Nxf4Ic=
Date: Thu, 23 Jan 2025 23:33:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] media: vsp1: Enable FREE interrupt
Message-ID: <20250123213307.GB10642@pendragon.ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
 <20250123-v4h-iif-v1-2-7b4e5299939f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250123-v4h-iif-v1-2-7b4e5299939f@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

s/FREE/FRE/ in the subject line, as FREE stands for "FRameEnd Enable",
so the interrupt is FRE.

On Thu, Jan 23, 2025 at 06:04:03PM +0100, Jacopo Mondi wrote:
> Enable the "FrameEnd" interrupt to support the VSPX operations.
> 
> The frame completion interrupt signals that the transfer of
> the config buffer and image buffer to the ISP has completed.
> 
> Enable the interrupt source if the pipe has an IIF entity, such as
> in the VSPX case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index cbaad0ea0b73f90f3994bbdfb4304d2f71eabccd..5aa0751a896f8a58bd11128ccaa092c9596cdb5d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -69,7 +69,8 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  				i, wpf->entity.pipe->underrun_count);
>  		}
>  
> -		if (status & VI6_WPF_IRQ_STA_DFE) {
> +		if (status & VI6_WPF_IRQ_STA_DFE ||
> +		    status & VI6_WPF_IRQ_STA_FRE) {
>  			vsp1_pipeline_frame_end(wpf->entity.pipe);
>  			ret = IRQ_HANDLED;
>  		}
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index f176750ccd9847fdb8d51f7f51a6bd5092b70197..93a663f58a5930a3c7c40a96a30888d0b8ccb2ed 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -239,6 +239,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	const struct v4l2_mbus_framefmt *source_format;
>  	const struct v4l2_mbus_framefmt *sink_format;
>  	unsigned int index = wpf->entity.index;
> +	u32 irqmask = 0;

No need to initialize this to 0.

>  	unsigned int i;
>  	u32 outfmt = 0;
>  	u32 srcrpf = 0;
> @@ -312,9 +313,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_wpf_write(wpf, dlb, VI6_WPF_SRCRPF, srcrpf);
>  
>  	/* Enable interrupts. */
> +	irqmask = VI6_WPF_IRQ_ENB_DFEE | (pipe->iif ? VI6_WPF_IRQ_ENB_FREE : 0);

Do we need te DFE interrupt for VSPX ? If both DFE and FRE fire,
vsp1_pipeline_frame_end() will be called twice per frame, and that
doesn't sound like what you need. If DFE is not generated, I'd rather
not enable the interrupt, to be on the safe side.

Another option, which may be better, is to use the DFE interrupt. As far
as I understand, generation of the DFE interrupt is controlled by a bit
in the display list. Is there a reason you can't use that and need FRE ?

>  	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
> -	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
> -			   VI6_WPF_IRQ_ENB_DFEE);
> +	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index), irqmask);
>  
>  	/*
>  	 * Configure writeback for display pipelines (the wpf writeback flag is
> 

-- 
Regards,

Laurent Pinchart

