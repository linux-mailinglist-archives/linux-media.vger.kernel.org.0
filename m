Return-Path: <linux-media+bounces-50797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6FD24E2C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A089930BBA3E
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92053D76;
	Thu, 15 Jan 2026 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pBH/yS2o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55324399A4C;
	Thu, 15 Jan 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486195; cv=none; b=TL41kK8hmS0GvqIZ402ZeAxpsnJxMQrZ7kjjtgnOwCF/mKSjyll/IX7yOWN8AWR/ksGXOV/nrhspDiOf1xqrIH7BsaCnXqBGA7UVuRwUEbgEVL+BH94BqZneuVVYGl1BUd6W3emN9SqbwIXHzAeXu9YJfTrvQxOkXQ3+Fkgd9r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486195; c=relaxed/simple;
	bh=GTC36vTdPAshZLYx4ZAegbiajKqmkljFLkWWWrqoRMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZmlazrnh47Z0InQ8IOhnn73SiRTogK0pzbqKGHpdFTfcwvvvenZHgsBDMtzh/VpNEwgyBqgjQL36u0scpJvofY2voNVGCoc1ARxl8XHgZtOO+wE2zFp471L35dZWPK1Mp/ODTEvpOrkRq9gvQrZhGQsBzTMNUILkYyoW9yar4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pBH/yS2o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A04F17E6;
	Thu, 15 Jan 2026 15:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768486163;
	bh=GTC36vTdPAshZLYx4ZAegbiajKqmkljFLkWWWrqoRMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pBH/yS2oitcc3+GawCtwKOuVqmgBYuMUNtNiVGw9kzv9wReqFawvSVISZtVv4ORP/
	 WchTj78oh4CG9FP+dj80ygXvkhTZU5MlyBbSWRyNmLBgOosdPBEhe2W2YeCcM4e5Yt
	 6vIpJU9tk50YN72ZTEU7OE14mvwP+GChds+E4YLk=
Message-ID: <f2d4d945-4a11-4124-b8f6-5c78dac14f52@ideasonboard.com>
Date: Thu, 15 Jan 2026 14:09:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mali-c55: Fix NULL dev stream alert for
 tpg/rsz/isp sub-device
To: "jempty.liang" <imntjempty@163.com>, jacopo.mondi@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114015033.153793-1-imntjempty@163.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260114015033.153793-1-imntjempty@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jempty, thanks for the patch

On 14/01/2026 01:50, jempty.liang wrote:
> The subdevices registered by the Mali-C55 driver do not have their
> 'struct device *dev' member initialized. This is visibile when looking

s/visibile/visible

The commit header also needs correcting really, as it still suggests that fixing the printout is the 
goal. Perhaps something like "media: mali-c55: Initialise dev member for struct v4l2_subdev"?

With that:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> at debug message, as in example:
> 
> "(NULL device *): collect_streams: sub-device 'mali-c55 tpg' does not
>   support streams"
> 
> Fix this by initializing the *dev field for each subdevice registered
> by the Mali-C55 driver.
> 
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: jempty.liang <imntjempty@163.com>
> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 1 +
>   drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 1 +
>   drivers/media/platform/arm/mali-c55/mali-c55-tpg.c     | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..ce84aad9f1d5 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -610,6 +610,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
>   	sd->entity.ops = &mali_c55_isp_media_ops;
>   	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>   	sd->internal_ops = &mali_c55_isp_internal_ops;
> +	sd->dev = mali_c55->dev;
>   	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
>   
>   	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> index a8d739af74b6..c4f46651dcee 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> @@ -1070,6 +1070,7 @@ static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>   	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
>   	sd->internal_ops = &mali_c55_resizer_internal_ops;
> +	sd->dev = mali_c55->dev;
>   
>   	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
>   	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> index 1af5d2759a83..894f4cf377af 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
> @@ -370,6 +370,7 @@ int mali_c55_register_tpg(struct mali_c55 *mali_c55)
>   	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
>   	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>   	sd->internal_ops = &mali_c55_tpg_internal_ops;
> +	sd->dev = mali_c55->dev;
>   	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
>   
>   	pad->flags = MEDIA_PAD_FL_SOURCE;


