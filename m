Return-Path: <linux-media+bounces-4793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0E84C811
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCC74B2458D
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 09:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5979122EE8;
	Wed,  7 Feb 2024 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aQqv+ONP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582222EE5
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299721; cv=none; b=FHYKPFw285ztTita6PIeApIp7X0lM0P/X88CLEMEjNTV8gfkHFyfBAatL5baiyuBimHsQmKPtvlFltKo6WyRqL4Rjbv0s6wGVfYqXi4Qxbw7EqP6VC2dbCJHqWGRatcD7y+VJsF019LgjZYw7kuMejXyrVmvviP30lw7/PhHAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299721; c=relaxed/simple;
	bh=ERCLvg/jdsJR/sNhaZgiyQVvTH+3n46Nkx/FMzbmgRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9lBbcIcQrfZfE6gxE3t3dMTwS1JxwOigK6wtmLexpULv7c5UUZIzhcsTIWi11YehFijJ7ShF5xZUff4F7wcxby2j57iyBUFzotyWSqWkptj/dlVsUCWeMJdlxiQFvHZIb36IbUCAEMQwggo+pewPBrgMnwbmRxhd4cBc9OVLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aQqv+ONP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C05A2975;
	Wed,  7 Feb 2024 10:53:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707299634;
	bh=ERCLvg/jdsJR/sNhaZgiyQVvTH+3n46Nkx/FMzbmgRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQqv+ONPhDCuc6ZvWAk0mCFKe1Ekyq6ibdBuYR/8TeI4DLVjAcRwDkL2uripp2YID
	 Nekl4IGvz4G36a4LfFEXw/W7FdXsKhMsnJQIEpgSSdx2jhvB5CYqIyIlZaeoz44apf
	 XYRvaznV3+ZM8kUdfXk7HHD7sBaDwGHXPEkStp+o=
Date: Wed, 7 Feb 2024 11:55:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 08/29] media: mc: Drop nop release callback
Message-ID: <20240207095520.GE23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-9-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:52PM +0200, Sakari Ailus wrote:
> The release callback is only used to print a debug message. Drop it. (It
> will be re-introduced later in a different form.)
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-device.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index d4553a3705f5..c0ea08a8fc31 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -566,11 +566,6 @@ static DEVICE_ATTR_RO(model);
>   * Registration/unregistration
>   */
>  
> -static void media_device_release(struct media_devnode *devnode)
> -{
> -	dev_dbg(devnode->parent, "Media device released\n");
> -}
> -
>  static void __media_device_unregister_entity(struct media_entity *entity)
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;
> @@ -718,7 +713,6 @@ int __must_check __media_device_register(struct media_device *mdev,
>  	/* Register the device node. */
>  	mdev->devnode.fops = &media_device_fops;
>  	mdev->devnode.parent = mdev->dev;
> -	mdev->devnode.release = media_device_release;
>  
>  	/* Set version 0 to indicate user-space that the graph is static */
>  	mdev->topology_version = 0;

-- 
Regards,

Laurent Pinchart

