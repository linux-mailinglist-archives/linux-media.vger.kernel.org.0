Return-Path: <linux-media+bounces-4799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02684C8EE
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC0928A25E
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AAA14F64;
	Wed,  7 Feb 2024 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4B9hAvw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94B17BAE
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707302864; cv=none; b=LcFmKofTc0vOaOIZGZh545UA2Uv5FiIRm7z+bwC9OzNQ6Q9VuF7tymgqMoYPLBfw+UJa+gt9PgoD9pUXpzja7dVs93UADHLOJd+C08q5pjlj9T3zqU3GpNG2l97SUB91Q+EElaUGnraawunxmZETZIDAd2ic//UDdaChfgE9rEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707302864; c=relaxed/simple;
	bh=hN5MSsHwEs0roqMSM+bKgSqYB5D/xNVn3gRBZPX0cYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O287zT6+usz++A5Vc/NPC1c2tpLssrcuL6xkoU80qWkAfGWJOtKbY31zOGkH5mgiHRUaVLvFzI6N/Y+Vza8q4LyQb5gEZkPX+xHKNQz/CBfwdriXOinHM0qCvFiU22i4CZt4dCDoKyWX3wEBpLIiYYeHAaYlcKXnXPa5bl4B8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4B9hAvw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C4CE975;
	Wed,  7 Feb 2024 11:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707302777;
	bh=hN5MSsHwEs0roqMSM+bKgSqYB5D/xNVn3gRBZPX0cYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4B9hAvwiyUqnhnhclsIbrtBnYRhtZC2WQkqhyDC9nbIkReriYUixatW7wm9bJEZL
	 xLpI7PgydSZsjt6tDsRCavYKl2nFXavXiYDDe/pgZRgh/JvGeD2Dp7xO9blWatPRyf
	 TZ+9N2WTVV+pkPxCpL8v04mKY2CphJdzTfQW3Cqk=
Date: Wed, 7 Feb 2024 12:47:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 12/29] media: mc: Shuffle functions around
Message-ID: <20240207104742.GI23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-13-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:56PM +0200, Sakari Ailus wrote:
> As the call paths of the functions in question will change, move them
> around in anticipation of that. No other changes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-device.c | 54 ++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index ebf037cd5f4a..44685ab6a450 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -673,6 +673,33 @@ void media_device_unregister_entity(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
>  
> +void media_device_register_entity_notify(struct media_device *mdev,
> +					struct media_entity_notify *nptr)
> +{
> +	mutex_lock(&mdev->graph_mutex);
> +	list_add_tail(&nptr->list, &mdev->entity_notify);
> +	mutex_unlock(&mdev->graph_mutex);
> +}
> +EXPORT_SYMBOL_GPL(media_device_register_entity_notify);
> +
> +/*
> + * Note: Should be called with mdev->lock held.
> + */
> +static void __media_device_unregister_entity_notify(struct media_device *mdev,
> +					struct media_entity_notify *nptr)
> +{
> +	list_del(&nptr->list);
> +}
> +
> +void media_device_unregister_entity_notify(struct media_device *mdev,
> +					struct media_entity_notify *nptr)
> +{
> +	mutex_lock(&mdev->graph_mutex);
> +	__media_device_unregister_entity_notify(mdev, nptr);
> +	mutex_unlock(&mdev->graph_mutex);
> +}
> +EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
> +
>  void media_device_init(struct media_device *mdev)
>  {
>  	INIT_LIST_HEAD(&mdev->entities);
> @@ -740,33 +767,6 @@ int __must_check __media_device_register(struct media_device *mdev,
>  }
>  EXPORT_SYMBOL_GPL(__media_device_register);
>  
> -void media_device_register_entity_notify(struct media_device *mdev,
> -					struct media_entity_notify *nptr)
> -{
> -	mutex_lock(&mdev->graph_mutex);
> -	list_add_tail(&nptr->list, &mdev->entity_notify);
> -	mutex_unlock(&mdev->graph_mutex);
> -}
> -EXPORT_SYMBOL_GPL(media_device_register_entity_notify);
> -
> -/*
> - * Note: Should be called with mdev->lock held.
> - */
> -static void __media_device_unregister_entity_notify(struct media_device *mdev,
> -					struct media_entity_notify *nptr)
> -{
> -	list_del(&nptr->list);
> -}
> -
> -void media_device_unregister_entity_notify(struct media_device *mdev,
> -					struct media_entity_notify *nptr)
> -{
> -	mutex_lock(&mdev->graph_mutex);
> -	__media_device_unregister_entity_notify(mdev, nptr);
> -	mutex_unlock(&mdev->graph_mutex);
> -}
> -EXPORT_SYMBOL_GPL(media_device_unregister_entity_notify);
> -
>  void media_device_unregister(struct media_device *mdev)
>  {
>  	struct media_entity *entity;

-- 
Regards,

Laurent Pinchart

