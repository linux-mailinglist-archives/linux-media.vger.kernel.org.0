Return-Path: <linux-media+bounces-32181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5256AB1F15
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 23:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F901BA274F
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 21:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C6623BF91;
	Fri,  9 May 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aF3UM09S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E416D4E6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 21:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826271; cv=none; b=GbgyLcz2T7oGd8Ntpw0zcOYVEw26VRAKybbKVPhSftfrKiPM8nrtg2LmwLWbdN9NzxiNwKe7k2D3ExjkuijcOO9fmAbffjdRx0RRRbUMxN2xD0yqGWSio9v5yCBqSWiBnc1GVL6Ntzn/hVYhvcAB4boviK/L3+njGsVzQSsVTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826271; c=relaxed/simple;
	bh=GEzMDCsi1oI7ApPy3e6fY9+CcAZ7tEdt0lRxEIy5dGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItTjslu9dMdTgj3abFR36s2e2FFAv5on0jAftQasfI2nAjorq/lAq8sy6v0hiFS+vTBpWEeTF2W3LvoqpRrnjmKHXPu3b7btdgBRz2UG8vped213mn+lBAUwF1yy5DgZWyU8axpdv593EXgmGv6cgIkNNGeaaghEijQllmPodiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aF3UM09S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A68DD8DB;
	Fri,  9 May 2025 23:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746826255;
	bh=GEzMDCsi1oI7ApPy3e6fY9+CcAZ7tEdt0lRxEIy5dGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aF3UM09SLqT9kZS5zZogB39rv5Og1NodGK6PmQ0aG/99LOBex8JiJo4BP2jjZB9xw
	 xtHlOjDry8lTgbwYacX1Y7CM4Q1qWP1SHBGt39sYmnQRTuWOEJJosP15pP7uopI6BT
	 Ug48XcOk4Ou1tGXx+AA2Ui7z/QemlDe7A+Ae7EeY=
Date: Fri, 9 May 2025 23:30:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 06/13] media: mt9m114: Tweak default hblank and vblank
 for more accurate fps
Message-ID: <20250509213059.GF19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250504101336.18748-7-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:27PM +0200, Hans de Goede wrote:
> The PLL gets programmed to achieve a 48 MHz pixelclock, with the original

s/original/current/

> vblank + hblank defaults this results in a fps of:
> 
> 48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps
> 
> Tweak the defaults to get closer to 30 fps:
> 
> 48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps
> 
> This improves things from being 0.026 fps too low to 0.015 fps too high.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9m114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 52337c719e22..ba8b7660f88a 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -331,8 +331,8 @@
>   */
>  #define MT9M114_MIN_HBLANK				303
>  #define MT9M114_MIN_VBLANK				21
> -#define MT9M114_DEF_HBLANK				307
> -#define MT9M114_DEF_VBLANK				23
> +#define MT9M114_DEF_HBLANK				308
> +#define MT9M114_DEF_VBLANK				21
>  
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120

-- 
Regards,

Laurent Pinchart

