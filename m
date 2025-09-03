Return-Path: <linux-media+bounces-41693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42208B42282
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE02C1B22E49
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713DE30DD31;
	Wed,  3 Sep 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P99YDGze"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201B302CB6
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907625; cv=none; b=BA1c6ex+Ilis9HVGi2rZRVYYcr+HyxXFO5M+w9U8dCnzkNdGls4OJg1OBt/P/7fE56NphPXvCDSw6vDkwiOJ4cOMGHGGOcrHN7VB/Oboo5EQ0hIQoyxidTymGtIZ06kE+xWM7PymP5MvgIAnay9aADWbjNjKhoZq0kZyZzif2rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907625; c=relaxed/simple;
	bh=bFmghQqy0ghYY1JhEcf/0fnhaJ+a+WfZRmvEimGtVR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOH4eEuvisigjC8/rxDK20oB0K+lcAt+ePPgpSZlQUoX9YKOx094shjI9zsrrt2Uo3scEeYkX5FW3HMZI7WOKSmRF+xvnVtaDNIW+gpmS+LEo8SYye3fdDs8mDMG8YsXtC8MWPchdxU7vTk8an55f9hTjm/LbsblVJ2LK5ik/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P99YDGze; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF282842;
	Wed,  3 Sep 2025 15:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756907552;
	bh=bFmghQqy0ghYY1JhEcf/0fnhaJ+a+WfZRmvEimGtVR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P99YDGzecEtZddmvi+px/bL0P+VZ3LH/KH6JL4jkkEVT0ChI5qi6+8LWTUYM1ijxH
	 qVxunsu0agWs5SbbRoxwiT5RtjIkLs1TvRYkNP0lUYshU3suhsE6aZp9ul5H+9BHPa
	 dSKv9R7CxHfEObrgG7XRRS8ubC5ReY+j7dYlJ93w=
Date: Wed, 3 Sep 2025 15:53:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 05/66] media: v4l2-subdev: Extend
 VIDIOC_SUBDEV_S_ROUTING error codes
Message-ID: <20250903135320.GH3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-6-sakari.ailus@linux.intel.com>

Hi Sakari,

On Mon, Aug 25, 2025 at 12:50:06PM +0300, Sakari Ailus wrote:
> Return -ENXIO from routing configuration errors other than generic IOCTL
> argument validation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 2 +-
>  drivers/media/platform/raspberrypi/rp1-cfe/csi2.c       | 2 +-
>  drivers/media/v4l2-core/v4l2-subdev.c                   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index ede6cc74c023..3c26cfef93d1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -114,7 +114,7 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  				"invalid route from memory input (%u) to pipe %u\n",
>  				route->sink_pad,
>  				route->source_pad - xbar->num_sinks);
> -			return -EINVAL;
> +			return -ENXIO;
>  		}
>  	}
>  
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
> index 35c2ab1e2cd4..997b75aa5958 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
> @@ -492,7 +492,7 @@ static int csi2_set_routing(struct v4l2_subdev *sd,
>  		const struct v4l2_subdev_route *route = &routing->routes[i];
>  
>  		if (route->source_stream != 0)
> -			return -EINVAL;
> +			return -ENXIO;
>  	}
>  
>  	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1da953629010..8d4c484109fb 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2112,7 +2112,7 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>  {
>  	u32 *remote_pads = NULL;
>  	unsigned int i, j;
> -	int ret = -EINVAL;
> +	int ret = -ENXIO;
>  
>  	if (disallow & (V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
>  			V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING)) {

-- 
Regards,

Laurent Pinchart

