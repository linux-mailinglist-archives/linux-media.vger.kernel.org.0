Return-Path: <linux-media+bounces-4800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36984C8FD
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0EC01C250A7
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B741757E;
	Wed,  7 Feb 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wLqQSdJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2411A27E
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303098; cv=none; b=fLgiuLyrxcs7y83/UrF04JEam3o1RarzIMbA6nxH/8nao3KzSvK9mCUjif2fhKVvgdJPXtYgc9A9BlHP2JH37s1dfjw89QjX5AH3tP/RbP1IUcCXI2hx2ZZvETDKOoOsUOXzlDO6/vUefk5NjW52tZLuVedvKrKysyPyQCz5wpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303098; c=relaxed/simple;
	bh=jFC41jbXoL3H5FbCs3WD2Wlh0RJVhr6oHM1xjvuF0ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PC7ea5AZWWboAE8utTw8jaXf9Onyon2Du0UJuvNaG9uhk4UWcjWNTM6DjQTYl8F1gBoi79AWBKgfF1cv9iMOjeOjD/EW9uuHYD7QiIUfXEpBSllmw+RlVntzAEaPQ2Sem/7WnWjh2bywD/QKzn4nvAKzGrnf7ZUacvhUTvuMmAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wLqQSdJ4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65CB5975;
	Wed,  7 Feb 2024 11:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707303011;
	bh=jFC41jbXoL3H5FbCs3WD2Wlh0RJVhr6oHM1xjvuF0ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wLqQSdJ4sVKxNKFM1e/x15ESiyUp/H/ndlwlQzEE7qDLp4XYI4dlWn5yh3WrDzrak
	 4Wts6Q1SP0YYhNI4IPTUoGkA2IYbec9Rk8MiQeU48SdYFOsfIBfkhmJNXa/ZuqqxGP
	 2+GJhSHJ4IWWdkGQ7Ed7J0bZsDsgrdo9eaH7m1lc=
Date: Wed, 7 Feb 2024 12:51:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 13/29] media: mc: Initialise media devnode in
 media_device_init()
Message-ID: <20240207105136.GJ23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-14-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-14-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:57PM +0200, Sakari Ailus wrote:
> Call media_devnode_init() from media_device_init(). This has the effect of
> creating a struct device for the media_devnode before it is registered,
> making it possible to obtain a reference to it for e.g. video devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-device.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index 44685ab6a450..e6ac9b066524 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -711,8 +711,8 @@ void media_device_init(struct media_device *mdev)
>  	mutex_init(&mdev->req_queue_mutex);
>  	mutex_init(&mdev->graph_mutex);
>  	ida_init(&mdev->entity_internal_idx);
> -
>  	atomic_set(&mdev->request_id, 0);

I would add a blank line here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	media_devnode_init(&mdev->devnode);
>  
>  	if (!*mdev->bus_info)
>  		media_set_bus_info(mdev->bus_info, sizeof(mdev->bus_info),
> @@ -729,6 +729,7 @@ void media_device_cleanup(struct media_device *mdev)
>  	media_graph_walk_cleanup(&mdev->pm_count_walk);
>  	mutex_destroy(&mdev->graph_mutex);
>  	mutex_destroy(&mdev->req_queue_mutex);
> +	put_device(&mdev->devnode.dev);
>  }
>  EXPORT_SYMBOL_GPL(media_device_cleanup);
>  
> @@ -744,26 +745,19 @@ int __must_check __media_device_register(struct media_device *mdev,
>  	/* Set version 0 to indicate user-space that the graph is static */
>  	mdev->topology_version = 0;
>  
> -	media_devnode_init(&mdev->devnode);
> -
>  	ret = media_devnode_register(&mdev->devnode, owner);
>  	if (ret < 0)
> -		goto out_put;
> +		return ret;
>  
>  	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
> -	if (ret < 0)
> -		goto out_unregister;
> +	if (ret < 0) {
> +		media_devnode_unregister(&mdev->devnode);
> +		return ret;
> +	}
>  
>  	dev_dbg(mdev->dev, "Media device registered\n");
>  
>  	return 0;
> -
> -out_unregister:
> -	media_devnode_unregister(&mdev->devnode);
> -out_put:
> -	put_device(&mdev->devnode.dev);
> -
> -	return ret;
>  }
>  EXPORT_SYMBOL_GPL(__media_device_register);
>  
> @@ -810,7 +804,6 @@ void media_device_unregister(struct media_device *mdev)
>  	device_remove_file(&mdev->devnode.dev, &dev_attr_model);
>  	dev_dbg(mdev->dev, "Media device unregistering\n");
>  	media_devnode_unregister(&mdev->devnode);
> -	put_device(&mdev->devnode.dev);
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister);
>  

-- 
Regards,

Laurent Pinchart

