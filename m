Return-Path: <linux-media+bounces-46136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C994DC28D33
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 11:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CD71890764
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA5257849;
	Sun,  2 Nov 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dSDyfnDM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE821B87C0;
	Sun,  2 Nov 2025 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762078903; cv=none; b=Lp6d40aacWe/pxs+feJfvI3skZzKlMQwRXxn43ZapygjGH9fpIQy71alV5/+OMz2Hf4SLs+OCxhudnvkJpvQ7ghvhfADg72qmvC2VY9TUfxShR1a6HjDpbcLGoGiDwTR0+eVaNtlvfQxR2I4idyWJgzuut7UI1ApNgKHw6wE0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762078903; c=relaxed/simple;
	bh=LJgqNKlXnbTn2nwhmAo0uBq+nd/8TaifNoIrXwXRu3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRVgqCRh2ovAJMPuSmG25tiEVMwRbNO1dlxrZvlADxO9ZqRUDMDJb54eOgKQUuLHAbvaQu1wv41I/syofDHiexdwZVqM1ETG6urlM7sQG5RW8zVNokRAupMW6GWY4fRhugj42+cCC0nUiXthlNL1bm9Gy3PPLmZ6Ahh4c01UjXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dSDyfnDM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A824E1F;
	Sun,  2 Nov 2025 11:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762078788;
	bh=LJgqNKlXnbTn2nwhmAo0uBq+nd/8TaifNoIrXwXRu3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSDyfnDM4Pr3G++u2RGJrJ1ylH6gyphihA1A+HxC+TKHaaqPMJwbwxQFHAeZyiCUs
	 NybTORHELmIeFo6kYui6Ws4oqz3Bbd3oedBu5eXayfu2Psdh8Lvb3KnBuhDOpUXDf+
	 qM9HlU6l/vgl/P/LXT7BJ+YLAm0zGOuaJOmyvX10=
Date: Sun, 2 Nov 2025 11:21:36 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 05/13] media: i2c: ov5647: Sensor should report RAW color
 space
Message-ID: <cbs2u2iimlnpp75leuzcxhh5qqx4ahulh5vwokgekumrxj6dzh@3c6ujsxwps2l>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-5-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-5-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:16PM +0530, Jai Luthra wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
>
> As this sensor captures RAW bayer frames, the colorspace should be
> V4L2_COLORSPACE_RAW instead of SRGB.
>
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/i2c/ov5647.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 8f11b5cbdc1658019e1340e641c7e6f398bff503..977b878b0d4b8cd5f39f510ebd8b33c9163f7da2 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -508,7 +508,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  	{
>  		.format = {
>  			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> -			.colorspace	= V4L2_COLORSPACE_SRGB,
> +			.colorspace	= V4L2_COLORSPACE_RAW,
>  			.field		= V4L2_FIELD_NONE,
>  			.width		= 2592,
>  			.height		= 1944
> @@ -529,7 +529,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  	{
>  		.format = {
>  			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> -			.colorspace	= V4L2_COLORSPACE_SRGB,
> +			.colorspace	= V4L2_COLORSPACE_RAW,
>  			.field		= V4L2_FIELD_NONE,
>  			.width		= 1920,
>  			.height		= 1080
> @@ -550,7 +550,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  	{
>  		.format = {
>  			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> -			.colorspace	= V4L2_COLORSPACE_SRGB,
> +			.colorspace	= V4L2_COLORSPACE_RAW,
>  			.field		= V4L2_FIELD_NONE,
>  			.width		= 1296,
>  			.height		= 972
> @@ -571,7 +571,7 @@ static const struct ov5647_mode ov5647_modes[] = {
>  	{
>  		.format = {
>  			.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
> -			.colorspace	= V4L2_COLORSPACE_SRGB,
> +			.colorspace	= V4L2_COLORSPACE_RAW,
>  			.field		= V4L2_FIELD_NONE,
>  			.width		= 640,
>  			.height		= 480
>
> --
> 2.51.0
>

