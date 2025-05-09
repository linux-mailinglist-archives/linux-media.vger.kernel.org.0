Return-Path: <linux-media+bounces-32195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21687AB200A
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 00:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70BFA22809
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CDF263C74;
	Fri,  9 May 2025 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VHaVUZa6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5303262FFC
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 22:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830601; cv=none; b=GFA+Ih7NxfaZATrbUHhORKNglST9w+RyVpboTIZXhhgnC2M5RTgi2S60HCnqAv24sRYrdeFzqBK4olr/2gCSS/xYlEhz2Wttvs8MWV6QnVGikQkGpY6gg7Ds79sJqTtJiGQDrgmB5S3nwBJMdh4ld3RaGhknsRpp7oQQy1w0jAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830601; c=relaxed/simple;
	bh=jLXt81SJBTbw0/tw6/VEKmAKO1rZbTQthEvN8ngATgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ62P8Vqtdx7u1GvpovOHLvHJgt+/ACpAKqRQR4Olf1zqVkkTocnhkgDGGPYhlM/YP8GzfFmLWofVuRMrdWjnPh0dPCvGY/Tttbmlha3OM6nBi87/zDmln5aLNLpg6DXVgOEZ64Eo1hh3qZONBsXt/YyaTNu22Yo34F9b71dJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VHaVUZa6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4A268BE;
	Sat, 10 May 2025 00:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746830585;
	bh=jLXt81SJBTbw0/tw6/VEKmAKO1rZbTQthEvN8ngATgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHaVUZa6nQ2L3ynizL5BO9+DsHT/42xWRaB5z7Sf0EIhm1P6dLoARHS/TLg9pvPOW
	 ykseTYWwyqv66Kmh+A3J+gdD8Ec6DUGjsi5STiQH9Gq7CbatuoblAw+AxWFrzmrzFP
	 mJg5bb5dtq7A+Ea685ge0YLPW1IF7jh0HDyJLoiE=
Date: Sat, 10 May 2025 00:43:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 09/13] media: mt9m114: Put sensor in reset on power-down
Message-ID: <20250509224308.GJ19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-10-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-10-hdegoede@redhat.com>

Hi Hans,

On Sun, May 04, 2025 at 12:13:30PM +0200, Hans de Goede wrote:
> Put sensor back in reset on power-down.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 43efcbdf614e..fa7c2137c6ba 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2202,6 +2202,7 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
>  
>  static void mt9m114_power_off(struct mt9m114 *sensor)
>  {
> +	gpiod_set_value(sensor->reset, 1);

The sensor requires a delay of at least 10 EXTCLK cycles here.

>  	clk_disable_unprepare(sensor->clk);
>  	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
>  }

-- 
Regards,

Laurent Pinchart

