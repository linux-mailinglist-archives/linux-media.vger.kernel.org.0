Return-Path: <linux-media+bounces-15359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC093D14C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 12:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868061F21924
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 10:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4566179659;
	Fri, 26 Jul 2024 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lWM+KOGG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AAA178372;
	Fri, 26 Jul 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721990598; cv=none; b=DPDM004ckjbJnLfoLDPmNN+fCXgTGCRFznP9JIokZ1FZSwOmmqkvvqGxTpXK0JpJoUzN6SgeOp9EAai4vAJweM5vT9iBTDwAVIjk9tjcnNBJjjQG/6hymAGu/Sr+5/An3iqdvj1eAkdUv/v7xsjDjCTLuGYxrpHL8JNnwzsbsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721990598; c=relaxed/simple;
	bh=WQFmG79EhIScc+XzbcVVVMczVqwHsRK96ZGwYc5NyTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A73K7Rk7Van+2ah47jNcskbxjvOjLzZ0unajBo/g1/vZbkXBgJh2ZgPWDF5IBuqTQe5BrpaY2lC0ExWosQ4ZSj9aJJRuYQ0KWUTug2upF+nMOniwUrTH82ZSXu1zg3ASt9BW8iZ/jRhHXms8Z3WgpBiHEGjXFVtI4/Sp44zO3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lWM+KOGG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65CF883F;
	Fri, 26 Jul 2024 12:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721990549;
	bh=WQFmG79EhIScc+XzbcVVVMczVqwHsRK96ZGwYc5NyTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWM+KOGG18eaLf/OntA2P8EygUe4gjlCQK20TvjRwAgYUWoozJ46HU17EldsN99y5
	 cERdJjuzeEs0pF5tObDY5SUdjJ3m2xPKe2vniidgy6TDny5FCU7cxMwN0fJO7YAmZr
	 xfgcS459EXTeljdZVooZHNHeQbs7kcNzsnRae4D0=
Date: Fri, 26 Jul 2024 13:42:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx-mipi-csis: avoid logging while holding
 spinlock
Message-ID: <20240726104255.GH14252@pendragon.ideasonboard.com>
References: <20240723060909.534584-1-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240723060909.534584-1-matthias.fend@emfend.at>

Hi Matthias,

Thank you for the patch.

On Tue, Jul 23, 2024 at 08:09:08AM +0200, Matthias Fend wrote:
> Refactor mipi_csis_log_counters() to prevent calling dev_info() while
> IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.

Should we add

Cc: stable@vger.kernel.org

to get this backported to stable kernels ?

> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..0c34d316ed29 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>  {
>  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
>  				: MIPI_CSIS_NUM_EVENTS - 8;
> +	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>  	unsigned long flags;
>  	unsigned int i;
>  
>  	spin_lock_irqsave(&csis->slock, flags);
> +	for (i = 0; i < num_events; ++i)
> +		counters[i] =  csis->events[i].counter;
> +	spin_unlock_irqrestore(&csis->slock, flags);
>  
>  	for (i = 0; i < num_events; ++i) {
> -		if (csis->events[i].counter > 0 || csis->debug.enable)
> +		if (counters[i] > 0 || csis->debug.enable)
>  			dev_info(csis->dev, "%s events: %d\n",
>  				 csis->events[i].name,
> -				 csis->events[i].counter);
> +				 counters[i]);

The last two lines now fit in a single line. No need for a v2, I'll
rewrap the code myself, and add the Cc line if you think that's a good
idea.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
> -	spin_unlock_irqrestore(&csis->slock, flags);
>  }
>  
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)

-- 
Regards,

Laurent Pinchart

