Return-Path: <linux-media+bounces-4096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785528392BA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 16:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9761C276DC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5D75FEF2;
	Tue, 23 Jan 2024 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vR1k31XA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15DE5FDCB;
	Tue, 23 Jan 2024 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023829; cv=none; b=f6JGHET3S7VI47rI4WOnXtige2YPc5PLidHPhYKOvgaSxyox/EWrbMQIg2NfDh4532dkm6xzmtaX1jQX2Ki28/Hb3Ca3mSh5KuppL1KHRVjqs2zU3fh+cBQXk5VuSl/pI/uoUfxupasK4QUZwBFgy/XtGRYl2ANf1e90bR/Rm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023829; c=relaxed/simple;
	bh=WPxvO4o+10Rpl0rhjjz5b3LUsE0ZBubf0Ll+8tj4al8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k19l3clR9KrZmYR2b5oj5IZ9u59SI0sNu/O/Pv8D42U0QPOrMdj4uUQ6Zk+BFG5UfBuAGCoz9dcsU92hVq0kvCefGns27bMoY1WMmpUchnST1WpTzxANXpLabLJj2Zys64sJwMJ0eAY9RjjSzt4VOi/ZTJNqXOmmOi5Ngfj4FII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vR1k31XA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96BFC1B9A;
	Tue, 23 Jan 2024 16:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706023752;
	bh=WPxvO4o+10Rpl0rhjjz5b3LUsE0ZBubf0Ll+8tj4al8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vR1k31XAevMtxRto2/CFr0NLgGkZwazEkopDAAII31Z5qyy9dOzikBIBZmd1RtSJF
	 ztfgo7XCIupH8iFIBVbQoI2PCcoJnUGk+f0SoStVGQZmagLLv7gi7aFWnaZv6q6LmQ
	 JI1ioFN0FC85VBHnEzq3UBdflQbB4iDSaPavffbw=
Date: Tue, 23 Jan 2024 17:30:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay
 after D-PHY reset
Message-ID: <20240123153024.GQ10679@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240123115821.292787-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jan 23, 2024 at 11:58:19AM +0000, Biju Das wrote:
> As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that
> after DPHY reset, we need to wait for 1 msec or more before start
> receiving data from the sensor. So add a delay after pre_streamon().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 9f351a05893e..5468dc179de7 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corp.
>   */
>  
> +#include <linux/delay.h>
>  #include "rzg2l-cru.h"
>  
>  struct rzg2l_cru_ip_format {
> @@ -71,6 +72,8 @@ static int rzg2l_cru_ip_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (ret)
>  			return ret;
>  
> +		usleep_range(1000, 2000);
> +

What would you think of using

		fsleep(1000);

instead ?

With or without that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		ret = rzg2l_cru_start_image_processing(cru);
>  		if (ret) {
>  			v4l2_subdev_call(cru->ip.remote, video, post_streamoff);

-- 
Regards,

Laurent Pinchart

