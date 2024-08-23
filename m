Return-Path: <linux-media+bounces-16674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC895D22B
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 17:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA8B6283609
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2555918BBAE;
	Fri, 23 Aug 2024 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="COLWxKwq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB21898E6;
	Fri, 23 Aug 2024 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428559; cv=none; b=EfvHtDSlIWYZmT3s2kKcRGCVrZWSGv/5fH7/EQNDeaxrwrETCeIDbrI6w8ZVwnYiF2i3xVN/5YLO9i7AbJMKJpJM7a+tRlddL58+xdvJ2ur4RZVKpOglPskbSr9UoZ1hX9Ljc4N25Or3ZkFaaAv4F21QJlhXX/VHcB+xyMpH9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428559; c=relaxed/simple;
	bh=j8rRZh/7vK2gSDNSUcMwzZv/glSVV+Vcun13cvEoLrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nzrpf4YPpYqPbeyQmXTtcS5mnpNpYh1pXAXNG6qyLq42tyB9bS3lWMNuKPSC6LDGUZU6q58//YK7XWvI1sa6OE7QvAPXNxqva6L/nUf+gIU5AGzJ77T3vWYCFfi6rs5Z2sXAGL8vFm/7RVLSQp0PgBACpjhUy/KCTGLPoB8Zfzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=COLWxKwq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B11A22D5;
	Fri, 23 Aug 2024 17:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724428492;
	bh=j8rRZh/7vK2gSDNSUcMwzZv/glSVV+Vcun13cvEoLrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COLWxKwqd8JpQbWo4Dl5eAB+s5k5CHV690jRFmECZqGgnikI6bOc1754VPxuFRF+/
	 1yPVhDkF5EmvOsJ4nAxGk1AllV2YAVx7+vFNjYqxOQ+zKdAOAg5W6HVgoCHFWTQT6F
	 79wC6SRas8VSLdCbt7a4tnuBaavTDka/3piduHUk=
Date: Fri, 23 Aug 2024 18:55:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] media: mt9p031: Drop CONFIG_OF ifdeffery
Message-ID: <20240823155554.GS26098@pendragon.ideasonboard.com>
References: <20230910160126.70122-1-biju.das.jz@bp.renesas.com>
 <20230910160126.70122-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230910160126.70122-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Sun, Sep 10, 2023 at 05:01:26PM +0100, Biju Das wrote:
> Drop of_match_ptr() from mt9p031_i2c_driver and get rid of ugly CONFIG_OF
> if check. This slightly increases the size of mt9p031_i2c_driver on non-OF
> system and shouldn't be an issue.
> 
> Add mod_devicetable.h include.
> 
> It also allows, in case if needed, to enumerate this device via ACPI with
> PRP0001 magic.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9p031.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 540cb519915c..91d5de5b95f0 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/log2.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -1222,7 +1223,6 @@ static const struct i2c_device_id mt9p031_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, mt9p031_id);
>  
> -#if IS_ENABLED(CONFIG_OF)
>  static const struct of_device_id mt9p031_of_match[] = {
>  	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
>  	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> @@ -1230,11 +1230,10 @@ static const struct of_device_id mt9p031_of_match[] = {
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9p031_of_match);
> -#endif
>  
>  static struct i2c_driver mt9p031_i2c_driver = {
>  	.driver = {
> -		.of_match_table = of_match_ptr(mt9p031_of_match),
> +		.of_match_table = mt9p031_of_match,
>  		.name = "mt9p031",
>  	},
>  	.probe          = mt9p031_probe,

-- 
Regards,

Laurent Pinchart

