Return-Path: <linux-media+bounces-27295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63DA4B1EE
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7863D16A7F0
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 13:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FE11E7C27;
	Sun,  2 Mar 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R7fI0pbm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AA7E110;
	Sun,  2 Mar 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740923049; cv=none; b=XLJRBIu9PZNZVZ5rdU6vlTfvHzHHr3OE6bvKjssZ90/U/9ccMgXOWvh9WWyH9+uzrTWCqATSACyCkx0PV7J0wGkYFsXbwO9dZ0X1Ednq2dFkPxyZdxVul4jL5hU4IT/2Ll1mciHwelLifnQTaDFz9irnytcP8bLQW63bIO7aY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740923049; c=relaxed/simple;
	bh=ijJqsX094oAzcKC6qNn5UFL1rCjKCbm5n80uiOwv1x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIl1ef+ASNtMf9kz3PCp9efIXtvWXi7NQo07zkmcT3JJZ0Nu9L/jsfBG2xFAy6gk5hiImZWT1Fe9wIJYFb+7HXMQAQXwIToKa8CVHG5VgUrLnwO1cYoJRiqjN5M+D+7b8U2vLcMrrz02Ae/abV9bZ1UYkBw6mgiDxM7f2to7idE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R7fI0pbm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99A5E670;
	Sun,  2 Mar 2025 14:42:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740922955;
	bh=ijJqsX094oAzcKC6qNn5UFL1rCjKCbm5n80uiOwv1x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7fI0pbms6E00nz3SixQyO7waZlMioc29NTBDU6PakxEzxSoqUap0jT2RnHHVazy3
	 wKG0WM8UG5gcIrGEKes+CCPMJeEXEeKYjEIANtzP23+VzLbTXn7rsdcz1fXbv9tPSG
	 gFW+KYc7GDvMVwOe2EDvgwUNwkSG9dqBcpN4+MzU=
Date: Sun, 2 Mar 2025 15:43:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: vsp1: Clean FRE interrupt status
Message-ID: <20250302134348.GJ18557@pendragon.ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 09:19:42PM +0100, Jacopo Mondi wrote:
> The VSPX generates "FRame End" (FRE) interrutps, one for each
> buffer transferred to the ISP.
> 
> Even if the FRE interrupt is not enabled, it is reported as active
> in the interrupt status register.
> 
> Make sure to clean it when handling the interrupt.

This doesn't seem to match the code code.

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index d13e9b31aa7cff8610ea196ae4de88ab22e44e0f..17ace4c6844d19aaafc27e79f016cc05091372bf 100644
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
> 

-- 
Regards,

Laurent Pinchart

