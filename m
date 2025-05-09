Return-Path: <linux-media+bounces-32193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E0AB1FFB
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 00:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01EE4C28C6
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 22:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96FE262FDB;
	Fri,  9 May 2025 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ONxx7CD/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65725F79A
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830302; cv=none; b=cm5fpQ4wOuEq+BYEDlTL3PnChC4ZGRMWnquIcc84pdoiIOF9Nj9M4zyocvZtfpeuM54GAdTOlW7OkYa3xci/IaGPhZ3Idr0LSL2IeKQ0hsM2SxbZEwHirbrAFpffpc0/hj/6OpYx38c6JEVYGNGqb0vhTHpJbk2/zV+yIzszKb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830302; c=relaxed/simple;
	bh=lmRh/aTkiKjzEs8l3oYXCtdVpsZt/IXZcICGHdhFnDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpTSATh+k8ffm5Jcu0gJtFlU3cXUynIPMzPyZRSXflWo6jF4B8pKwwHM4I9Fvv3hxscyhFtbVJLRpPiUPInOg68J/T1vBILIIVXh13j7/fJPYbdjGWBC1XHV+EmiBtvtUNDqRPIeQjz0HwXuxzn5k0BUCMC7QMfF5F4YMHEqhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ONxx7CD/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0908E8BE;
	Sat, 10 May 2025 00:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746830285;
	bh=lmRh/aTkiKjzEs8l3oYXCtdVpsZt/IXZcICGHdhFnDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONxx7CD/gzo6SLuYFannghSznR6AOS7xxyQjg8RD/r/o6rohgtF3LCpfHD6aGcPHu
	 Hh7WN9cU9fWaN/iFqF2BvvDNYlvysQE4ObDWBhkj9NP6f//n5pQlLcBsWMpjT+ZsFq
	 VY16i6KLnxfeY3qz41/ib25xH1WbPdiF9jKwjgaY=
Date: Sat, 10 May 2025 00:38:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults
 on pixel-array format changes
Message-ID: <20250509223808.GH19001@pendragon.ideasonboard.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
 <20250504101336.18748-8-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504101336.18748-8-hdegoede@redhat.com>

Hi Hans,

Thank you for the patch.

On Sun, May 04, 2025 at 12:13:28PM +0200, Hans de Goede wrote:
> Update hblank and vblank defaults when the pixel-array format changes,
> to maintain 30 fps on format changes.

I don't think this should be the kernel's responsibility to do so.
Sakari, any opinion ?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/mt9m114.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index ba8b7660f88a..be3e7bb44ad8 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -333,6 +333,10 @@
>  #define MT9M114_MIN_VBLANK				21
>  #define MT9M114_DEF_HBLANK				308
>  #define MT9M114_DEF_VBLANK				21
> +#define MT9M114_DEF_HTS					\
> +	(MT9M114_PIXEL_ARRAY_WIDTH + MT9M114_DEF_HBLANK)
> +#define MT9M114_DEF_VTS					\
> +	(MT9M114_PIXEL_ARRAY_HEIGHT + MT9M114_DEF_VBLANK)
>  
>  #define MT9M114_DEF_FRAME_RATE				30
>  #define MT9M114_MAX_FRAME_RATE				120
> @@ -1130,18 +1134,22 @@ static void mt9m114_pa_ctrl_update_exposure(struct mt9m114 *sensor, bool manual)
>  static void mt9m114_pa_ctrl_update_blanking(struct mt9m114 *sensor,
>  					    const struct v4l2_mbus_framefmt *format)
>  {
> -	unsigned int max_blank;
> +	unsigned int def_blank, max_blank;
>  
>  	/* Update the blanking controls ranges based on the output size. */
>  	max_blank = MT9M114_CAM_SENSOR_CFG_LINE_LENGTH_PCK_MAX
>  		  - format->width;
> +	def_blank = MT9M114_DEF_HTS - format->width;
>  	__v4l2_ctrl_modify_range(sensor->pa.hblank, MT9M114_MIN_HBLANK,
> -				 max_blank, 1, MT9M114_DEF_HBLANK);
> +				 max_blank, 1, def_blank);
> +	__v4l2_ctrl_s_ctrl(sensor->pa.hblank, def_blank);
>  
>  	max_blank = MT9M114_CAM_SENSOR_CFG_FRAME_LENGTH_LINES_MAX
>  		  - format->height;
> +	def_blank = MT9M114_DEF_VTS - format->height;
>  	__v4l2_ctrl_modify_range(sensor->pa.vblank, MT9M114_MIN_VBLANK,
> -				 max_blank, 1, MT9M114_DEF_VBLANK);
> +				 max_blank, 1, def_blank);
> +	__v4l2_ctrl_s_ctrl(sensor->pa.vblank, def_blank);
>  }
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart

