Return-Path: <linux-media+bounces-35360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A43AE0A40
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 17:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD025A5CFE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2140221D98;
	Thu, 19 Jun 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o5uUQ+pf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4F221286
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346455; cv=none; b=HUe1MiY92nVjEK0/D7hYbQnlf1frhojFOtyYXy47zY1M2THmCzSLKeGZP7Wmrtv7j5Afl1fiZQeqnvH+igmv+Nc86p7kDPiaF21PtekPnT2V577dbgBT7erqmJAeed8lgUOm/pxHuhVNZOwqtNiIkqasXWHuWYACDhPz6keVetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346455; c=relaxed/simple;
	bh=6EfL+lYw6FzRb66VDTWOh27BGlXLhlKTjUN1rL2UTj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg7gt+ZS3HXuiABcdZerHMk5wfvNA2GJ74g3GszbVe2M6H52P3By9oa9zvpdnQhXvo6ZC+aYDGjYHBQpog74cBcsJuYBFfMUeUUkD678bQm4fuQW6NRzcgqbdqK1psOwqwFim4+y9LnXkgnSTSAPdAXSug19PtkJHWlbYEJeSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o5uUQ+pf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A724D346;
	Thu, 19 Jun 2025 17:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750346437;
	bh=6EfL+lYw6FzRb66VDTWOh27BGlXLhlKTjUN1rL2UTj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5uUQ+pfp5peNFejRkUgidVsBNsmPingIFq1QhdVsYQncSZc0GIbAliSWIe0GSjDo
	 2bqiXWJUYQGBxEi3Z0sP80iJNQuFEZRxH1IMYRa84tHyDe5xg1zsaOsCkWtPrLxn7b
	 ioDUbevbxgpyaS7k23xfJltCnrWoTOj+pyF/aRL4=
Date: Thu, 19 Jun 2025 18:20:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 05/13] media: v4l: Make media_entity_to_video_device()
 NULL-safe
Message-ID: <20250619152033.GG32166@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619081546.1582969-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Jun 19, 2025 at 11:15:38AM +0300, Sakari Ailus wrote:
> Make media_entity_to_video_device(NULL) return NULL, instead of an invalid
> pointer value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-dev.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 1b6222fab24e..069c2f14b473 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -313,10 +313,16 @@ struct video_device {
>   * media_entity_to_video_device - Returns a &struct video_device from
>   *	the &struct media_entity embedded on it.
>   *
> - * @__entity: pointer to &struct media_entity
> - */
> -#define media_entity_to_video_device(__entity) \
> -	container_of(__entity, struct video_device, entity)
> + * @__entity: pointer to &struct media_entity, may be NULL
> + */
> +#define media_entity_to_video_device(__entity)				\
> +	({								\
> +		typeof (__entity) __me_to_vdev_ent = __entity;		\
> +									\
> +		__me_to_vdev_ent ? container_of(__me_to_vdev_ent,	\
> +						struct video_device, entity) : \
> +			NULL;						\
> +	})

This makes the macro safer, it's a good idea. Wouldn't it be better
implemented as a container_of_null() (name to be bikeshedded) though ? I
don't think media_entity_to_video_device() is the only macro that could
benefit from this. It could even be integrated in container_of(), but I
fear that could introduce issues.

>  
>  /**
>   * to_video_device - Returns a &struct video_device from the

-- 
Regards,

Laurent Pinchart

