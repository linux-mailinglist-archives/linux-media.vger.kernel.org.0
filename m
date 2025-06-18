Return-Path: <linux-media+bounces-35163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FFADE82E
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 12:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D350189DAC0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 10:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B89C2857D8;
	Wed, 18 Jun 2025 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WzZKjFmJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489502857C7;
	Wed, 18 Jun 2025 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241374; cv=none; b=D3gBYZ/xlEwkoeYXIMKZb1PjE4fRWrP7+lkfoDjzfGK8at8zmtfkfaam/Ed6sJQ4wE8zz5pi0XztaL5mEua8s4D6uqPnSOJiic4jD+Zk6E6F2xghgMaD5CPQP/SwyxaX+gK4MgwYyQrtOFDQh9xvqQkRy0MhgBlRI9aZTMHCF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241374; c=relaxed/simple;
	bh=jua9bgGTa9ALV5qniMWzOFUsVcOcMltwgY91IkZmd1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuyNQiNfbCpD2TALsz5twoYWcCdpWLCHKw4uoa9oSLeZJKC9rtSFrjbsNjo+7bgdg7gv2LrdtRiJAhk+haCHXo9uHU6ts8AdgRZ4s60YXFsCIAxpSmBG5aNjObEOM5QhA4kHr5ezzkJgrK3GfXoEZBtkc/W9Tg2N5cPA0zGcNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WzZKjFmJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9DC5593;
	Wed, 18 Jun 2025 12:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750241358;
	bh=jua9bgGTa9ALV5qniMWzOFUsVcOcMltwgY91IkZmd1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzZKjFmJ9I3/Q/o3L06cxifW0OIYcEASLYOZVltQ6a+vnd0l+RbezWfzxNn5dOGRe
	 cMlzBZnlPfbK1kow2k9DTaiGQ2BME473n7ykPOoCMxgi6LpdOqjfzwc1ygG9ENNMU3
	 jXYnct36hpqmx7S3i4AkNOmVErQNKXKp1hzebhPc=
Date: Wed, 18 Jun 2025 13:09:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 1/2] media: renesas: rzg2l-cru: Simplify FIFO empty
 check
Message-ID: <20250618100914.GA10978@pendragon.ideasonboard.com>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Apr 29, 2025 at 10:16:08AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Collapse FIFO empty helper into a single return statement by removing the
> redundant `if (amnfifopntr_w == amnfifopntr_r_y) return true;` path. Make
> `rzg2l_fifo_empty()` directly return `amnfifopntr_w == amnfifopntr_r_y`
> to improve readability without changing behavior.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 067c6af14e95..3d0810b3c35e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
>  	amnfifopntr_r_y =
>  		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> -	if (amnfifopntr_w == amnfifopntr_r_y)
> -		return true;
>  
>  	return amnfifopntr_w == amnfifopntr_r_y;
>  }

-- 
Regards,

Laurent Pinchart

