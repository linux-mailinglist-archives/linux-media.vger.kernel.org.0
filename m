Return-Path: <linux-media+bounces-32194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA75AB2003
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 00:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4771B22B49
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715F7263F25;
	Fri,  9 May 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FQBfrlql"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49642262D0B
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830366; cv=none; b=pmLERM5O1CMkPZbz7GiVF+Amy4Ftgu67bJ4ASXUgQQ/s7Xyy5KykIFjv/WDWYQvPvJvxzSbdzXr6YFfrEwUjKxLuefZ0UGgfBaTYaC+pnKlDh/YDNwdbfe0OGIVCQripGchvxeXXY/0YFrTfOrKA+rsMe2YoAzo2xcCfU3DkPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830366; c=relaxed/simple;
	bh=dLJqH4hGaxZOCwhBsSEXqM1UoLa5lneUA5B9VAqlf8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN29jctUrChSmmYDKuxnNS19wnWEk1Ya5Krabgu03LdVvyGf3mqPUQ56co9IEhGUZLbxel5J9E4p6iRADZY/fq/pk1vAA13cUsd/tjm6iQ8/wLfLkz9bYKcrgB8RBZWSjLPbxQAgyUZKc+EymI93/tkEx/fbs/unxtImBpZL9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FQBfrlql; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 744B58BE;
	Sat, 10 May 2025 00:39:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746830350;
	bh=dLJqH4hGaxZOCwhBsSEXqM1UoLa5lneUA5B9VAqlf8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQBfrlql/OtbmkG8RMIPwcvP4g2qifbjMVlJyttSynZdqX90TdrShDe6/GPO9MC+q
	 td9rDd2vX4a8+9SaHaM+GZDCbN6XoosHAHALlbs/mIR2jEos1lWjA/BMPDdM27PY/L
	 63WGPacIpg7NioNI74ejstmpHqfxQcdvfNnQKjsw=
Date: Sat, 10 May 2025 00:39:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 08/13] media: mt9m114: Avoid a reset low spike during
 probe()
Message-ID: <20250509223914.GI19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-9-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-9-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:29PM +0200, Hans de Goede wrote:
> mt9m114_probe() requests the reset GPIO in output low state:
> 
> 	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> 
> and then almost immediately afterwards calls mt9m114_power_on() which does:
> 
> 		gpiod_set_value(sensor->reset, 1);
> 		fsleep(duration);
> 		gpiod_set_value(sensor->reset, 0);
> 
> which means that if the reset pin was high before this code runs that
> it will very briefly be driven low because of passing GPIOD_OUT_LOW when
> requesting the GPIO only to be driven high again possibly directly after
> that. Such a very brief driving low of the reset pin may put the chip in
> a confused state.
> 
> Request the GPIO in high (reset the chip) state instead to avoid this,
> turning the initial gpiod_set_value() in mt9m114_power_on() into a no-op.
> and the fsleep() ensures that it will stay high long enough to properly
> reset the chip.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9m114.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index be3e7bb44ad8..43efcbdf614e 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2412,7 +2412,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  		}
>  	}
>  
> -	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(sensor->reset)) {
>  		ret = PTR_ERR(sensor->reset);
>  		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");

-- 
Regards,

Laurent Pinchart

