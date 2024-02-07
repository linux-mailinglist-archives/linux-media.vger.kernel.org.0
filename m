Return-Path: <linux-media+bounces-4829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78884CD14
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D272F1C22A20
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588AE7E791;
	Wed,  7 Feb 2024 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BzmkemFv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B67E78C
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316985; cv=none; b=XfqrtotrE1Au7By9ZcOQBMFgvzpYRM4pFtu0OboCttPMOMZhZ50iu+WHYWu7APuuKDv2m80lsmutWFWtAf2MpptNmEssKZNSKjhUJMw75wjoU0iwmn8GUT/QGTVdBzeYwk7vo5irJecsjz2REORd57i5PonIZaE9M5T+lEzy1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316985; c=relaxed/simple;
	bh=v4prsJniOSNtQ8kWbS3fiFBMPWY6KG73TrI2C1HVu58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcWdoCQEaUSuwJmOTfOWlHKlxQtEPupOqvNjSG5E5do1SQfVMY7dYUbBimPpIKuqsGSo38Gy3uDJt8u3MJLVkDXJhH93W8CJgxocNexdm46ACSh0N9ZXobNvuyCY1a3I4/IcqaRhtJ9N9WQAOeVZSr72dIzbU78TiSfoKpavPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BzmkemFv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C67FA975;
	Wed,  7 Feb 2024 15:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707316898;
	bh=v4prsJniOSNtQ8kWbS3fiFBMPWY6KG73TrI2C1HVu58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzmkemFvU5apdc6d/walYErFfai6WSw+fWdQ4wBuHru39pMSZR7Tn1iBh9WDyR5Li
	 rds1aGDW0+F6qZY+ydjXtvUDalmWbLLv59WQEvqjeNwNU/MchfsGIO2QAzdULwanqW
	 WIbrDU5iqFxGJm9k+VlftTF6r8uZfFAw3TB/1EbM=
Date: Wed, 7 Feb 2024 16:43:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 24/29] media: Documentation: Document how Media device
 resources are released
Message-ID: <20240207144304.GU23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-25-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-25-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:08PM +0200, Sakari Ailus wrote:
> Document that after unregistering, Media device memory resources are
> released by the release() callback rather than by calling
> media_device_cleanup().
> 
> Also add that driver memory resources should be bound to the Media device,
> not V4L2 device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/mc-core.rst | 18 ++++++++++++++++--
>  include/media/media-device.h               |  6 ++++--
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> index 2456950ce8ff..346f67760671 100644
> --- a/Documentation/driver-api/media/mc-core.rst
> +++ b/Documentation/driver-api/media/mc-core.rst
> @@ -46,13 +46,27 @@ Drivers initialise media device instances by calling
>  :c:func:`media_device_init()`. After initialising a media device instance, it is
>  registered by calling :c:func:`__media_device_register()` via the macro
>  ``media_device_register()`` and unregistered by calling
> -:c:func:`media_device_unregister()`. An initialised media device must be
> -eventually cleaned up by calling :c:func:`media_device_cleanup()`.
> +:c:func:`media_device_unregister()`. The resources of an unregistered media

"of an unregistered media device" sounds weird here, I interpret it as
applying only to media devices that have never been registered.

> +device will be released by the ``release()`` callback of :c:type:`media_device`
> +ops, which will be called when the last user of the media device has released it
> +calling :c:func:`media_device_put()`.
> +
> +The ``release()`` callback is the way all the resources of the media device are
> +released once :c:func:`media_device_init()` has been called. This is also
> +relevant during device driver's probe function as the ``release()`` callback
> +will also have to be able to safely release the resources related to a partially
> +initialised media device.
>  
>  Note that it is not allowed to unregister a media device instance that was not
>  previously registered, or clean up a media device instance that was not
>  previously initialised.

Does this need an update, as we don't cleanup explicitly instead ?

>  
> +Media device and driver's per-device context
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Drivers should use the struct media_device_ops ``release()`` callback to release
> +their own resources and not e.g. that of the struct v4l2_device.
> +
>  Entities
>  ^^^^^^^^
>  
> diff --git a/include/media/media-device.h b/include/media/media-device.h
> index c6816be0eee8..98e1892f1b51 100644
> --- a/include/media/media-device.h
> +++ b/include/media/media-device.h
> @@ -250,8 +250,10 @@ void media_device_init(struct media_device *mdev);
>   *
>   * @mdev:	pointer to struct &media_device
>   *
> - * This function that will destroy the graph_mutex that is
> - * initialized in media_device_init().
> + * This function that will destroy the graph_mutex that is initialized in

While at it, s/that will/will/

> + * media_device_init(). Note that *only* drivers that do not manage releasing
> + * the memory of th media device itself call this function. This function is

s/of th/of the/

"that do not manage releasing the memory of the media device itself" is
hard to understand for someone who hasn't paid close attention to the
development of this series. This text needs improvements.

> + * thus effectively DEPRECATED.
>   */
>  void media_device_cleanup(struct media_device *mdev);
>  

-- 
Regards,

Laurent Pinchart

