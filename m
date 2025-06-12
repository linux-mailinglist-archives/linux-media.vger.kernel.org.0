Return-Path: <linux-media+bounces-34555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E702AD647E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFD617A8DA
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 00:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB61111CAF;
	Thu, 12 Jun 2025 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G+BMr91R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED4BA34;
	Thu, 12 Jun 2025 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688112; cv=none; b=QcbsD2px4xp64mxX7ZpcoISHoKvQMDlyE6bVzxto1qRelAr4i6CyBC1dtzat9LHrkP3TlHta8B8jrBErtnHNysizr4fM0dOBVn6nEivLMTc1x1OqqQPgGEpPwtJDkHB00Z3bHNq9wVFVP+qevU6F7Mie5a5P1M2lrGTbFT7AFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688112; c=relaxed/simple;
	bh=SiV6FRJeW3oHspT3JWMapU6pa8flZ/2/KdVjqgIdKcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOB5dBVwvsx6KBEXqGlHIIT4Xp0jrQUM87yT1CwF1mbKcPoLuc4Dbilju7KBRpD6+AQ0IIbYHoxTT48ZcGNQbD217Fk9Fd+msXSDnJSn/sFmazixP9mqTXVht4Zp9xSJhbzN9waPjpUj3KWbmNoE2JjmJn5PqJxMX+vIx68PwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G+BMr91R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A44F2EA0;
	Thu, 12 Jun 2025 02:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749688100;
	bh=SiV6FRJeW3oHspT3JWMapU6pa8flZ/2/KdVjqgIdKcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+BMr91RAU/P31po2/0HoO/zVoev8wW4dIlOUiKJtDVbd5pc2n6T71lo3OIHNQV+z
	 LUqi9zJLeFv34J394B0FLpcrsikw5cZxUMmC84t6nyKvuvxgi+/b1VelGSCH/5dcyS
	 E+PV2ORKn3KhNDykI7mHPOqpGfOl8S/p6wNWmpkc=
Date: Thu, 12 Jun 2025 03:28:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 12/12] media: rcar-vin: Fold event notifier into only
 user
Message-ID: <20250612002816.GD22977@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:06PM +0200, Niklas Söderlund wrote:
> With Gen2 converted to use the common media device there is only one
> caller left for the helper to notify a video device of an event, fold it
> in.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v4
> - Broken out from larger patch.
> ---
>  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 2bf94bd77c24..59b01cb0628a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
>  	video_unregister_device(&vin->vdev);
>  }
>  
> -static void rvin_notify_video_device(struct rvin_dev *vin,
> -				     unsigned int notification, void *arg)
> -{
> -	switch (notification) {
> -	case V4L2_DEVICE_NOTIFY_EVENT:
> -		v4l2_event_queue(&vin->vdev, arg);
> -		break;
> -	default:
> -		break;
> -	}
> -}
> -
>  static void rvin_notify(struct v4l2_subdev *sd,
>  			unsigned int notification, void *arg)
>  {
> @@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
>  		if (remote != sd)
>  			continue;
>  
> -		rvin_notify_video_device(vin, notification, arg);
> +		switch (notification) {
> +		case V4L2_DEVICE_NOTIFY_EVENT:
> +			v4l2_event_queue(&vin->vdev, arg);
> +			break;
> +		default:
> +			break;
> +		}

How about

		if (notification == V4L2_DEVICE_NOTIFY_EVENT)
			v4l2_event_queue(&vin->vdev, arg);

Unless you expect more notifications to be handled later ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	}
>  }
>  

-- 
Regards,

Laurent Pinchart

