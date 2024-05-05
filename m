Return-Path: <linux-media+bounces-10813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF88BC3EF
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 23:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C202280FAD
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 21:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AB9763E2;
	Sun,  5 May 2024 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v5Y9xg6W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7212555B;
	Sun,  5 May 2024 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714943939; cv=none; b=eu7JPNQWITQPVU330frxsLeA2PHvPlKqtN5G9yyKPNWRFxQnTnm0TS3SoOmeQqq3gK3TQQiXSaDREgnHpx3NW8vbkXuaeUWLauuTKOK2bU6BYVcUOPkc10Z2puUn/Ir5Rl569X7UlTyVUzT+Z0JCmo22y6NZjvmvmliObmAMPDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714943939; c=relaxed/simple;
	bh=Yl2aGr8PkURRBS1ukodz3q9ZTdeJJwohtChPxYV91yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmjQVdDyGsI21k8I0cVduketbiwgUW6StsiQPOXto/MXaF864P/i1XVl71fb1YvGcQs0lmZCaDhLD497wzkPYmpCmBoGR1c5W8u/E9bg2BYhdEcZSNg/Wj5ui8g20zOxvEBe+75ZYfgSHBw9pLMvEJMck35f3BWbtgLfxXwnCfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v5Y9xg6W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6127563B;
	Sun,  5 May 2024 23:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714943935;
	bh=Yl2aGr8PkURRBS1ukodz3q9ZTdeJJwohtChPxYV91yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v5Y9xg6WrV21jhHlMuVJFnjdO6PD3SF3cnCegZ6428KRX9qCl4ce0RnYbDVlXicwd
	 BmbCn74s90vvrICjAyTcOjHbiwLh7yDdPHkYvw4LoaAHs2LFZyECIrdhFCd+tG4Kar
	 8ilwjM2TCnV5ab7hvXVpLuAL2+DnhEFpdCeUtkCQ=
Date: Mon, 6 May 2024 00:18:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/11] media: max9286: Fix enum_mbus_code
Message-ID: <20240505211848.GG23227@pendragon.ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-10-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503155127.105235-10-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, May 03, 2024 at 05:51:24PM +0200, Jacopo Mondi wrote:
> The max9286 driver supports multiple output formats but only a single
> one is reported through the .enum_mbus_code operation.
> 
> Fix that.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index d685d445cf23..5321238cad60 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -914,10 +914,10 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->pad || code->index > 0)
> +	if (code->pad || code->index >= ARRAY_SIZE(max9286_formats))
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
> +	code->code = max9286_formats[code->index].code;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

