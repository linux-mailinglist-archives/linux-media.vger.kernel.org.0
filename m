Return-Path: <linux-media+bounces-7526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA9885F2A
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB45C1C23810
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5629313541D;
	Thu, 21 Mar 2024 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHWXzajY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1420B00
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040422; cv=none; b=gsVqHZ6mp88AjbuMXLz4baKmqMVBTn6LxbEYwhE2IIp91yhQeb79OPy2Ac8K9vp4W6BNxljSxKYiHhSGFm3y9HUEQp3hWkMsMhtQXTvZKfcwdelKpvlDGLsRtiZKSXivZZmtZRYdx3wH0ISS67V1DXw4EQzaAuPQIFYc3Bmc4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040422; c=relaxed/simple;
	bh=K7O/ajdHl21gwAO7ylcOdp2z1Uoi3dDfiOhFOsV3aYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GON8Ts5L4ruuynosmpUBLCm61cnW647jdE2rzJSnQNpjUSO2zMEgPRzzsg3aQVhX6ejnPxt59D7aHkj/GdZ6fNQ+5Hn4AKmQc636QNVOGmT8s0Ves9Hx2XoM1Jfwdc8MBqJXO3FX/jUt4DgQxETwhfajU8aMzUnbCDX6Rz4Ish4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHWXzajY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0A21672;
	Thu, 21 Mar 2024 17:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040391;
	bh=K7O/ajdHl21gwAO7ylcOdp2z1Uoi3dDfiOhFOsV3aYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wHWXzajYIo2RqncN4N7t2lfi0tpUL7Yq3arx1RzsxpQ4jYMhhmds9H11XLvhQCKZ2
	 dZKk25e2CC8GIocz2lJ+amHRfgKnQQb2DPfZEWDYkBE43YVMOQcxWoz7ZNJImoREWL
	 Uqtq3f1XyYLepjB0ya80dH6ZmpLGG/72c7agUUeY=
Date: Thu, 21 Mar 2024 19:00:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 38/38] media: ov2740: Add IMMUTABLE route flag
Message-ID: <20240321170016.GJ9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-39-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-39-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:16AM +0200, Sakari Ailus wrote:
> Add immutable route flag to the routing table.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Same comment as for patch 37/38.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov2740.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 7488b2535071..3e2585eb6ec9 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1150,12 +1150,14 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
>  			.sink_pad = OV2740_PAD_PIXEL,
>  			.source_pad = OV2740_PAD_SOURCE,
>  			.source_stream = OV2740_STREAM_PIXEL,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>  		}, {
>  			.sink_pad = OV2740_PAD_META,
>  			.source_pad = OV2740_PAD_SOURCE,
>  			.source_stream = OV2740_STREAM_META,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>  		},
>  	};
>  	struct v4l2_subdev_krouting routing = {

-- 
Regards,

Laurent Pinchart

