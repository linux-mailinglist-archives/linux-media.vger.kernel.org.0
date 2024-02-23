Return-Path: <linux-media+bounces-5756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99478860ED5
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 11:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A0A9B23883
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D1F5CDFD;
	Fri, 23 Feb 2024 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d59KXeQP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6735C5D485
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708682453; cv=none; b=OcIm3FRfXahJ1OED4nacwCFE+KK0llrvVng4f+q77WBR2g3BvggPf0m/35r+G9XowQAVlKdHSadsbT8KhxgkJ9lu63eB/4DE8OKx7iCllpfwlNIzAgm2GrPunaALxQP0e2hvGdqYbOz9Vq+nkJkmAY+pila1HY/PR2xQ4GiJYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708682453; c=relaxed/simple;
	bh=SOZva9wxwvpmKIx1N/82lghUnQkweBxMlENEamAiTIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSjVgu9Yi6UyXXKYgWV//oP+kfgx8kA4MxUckXCBQjtepfF4p04K3Pw7TvilqMw2Kd3q7vwVZ0pcGDWLEcVhMpWKVN5aQ65jMNATccFiZvtwp/KEdlQxggURynu/8RL/bzTauhC0mGSYbKqus65zmT+ZnTCXEs++/SkFJ14BWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d59KXeQP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934929B6;
	Fri, 23 Feb 2024 11:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708682440;
	bh=SOZva9wxwvpmKIx1N/82lghUnQkweBxMlENEamAiTIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d59KXeQPI9+aGhrx1uOhTYlpoUFerdSn8YnURc7I5AQ1Ho7eZvZINUzjWP+Q3q+s8
	 REe8vwJknONsBMckfa9i6h1lNRjIgdORYJ0H/9Z7nvmmwaY+yOBmPcolQ84I0bxQ32
	 mP7x9Ut6eYFwks6ILihgvzGNfnv++POlV5QLrtQM=
Date: Fri, 23 Feb 2024 12:00:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: mc: mark the media devnode as registered from
 the, start
Message-ID: <20240223100053.GJ31348@pendragon.ideasonboard.com>
References: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>

Hi Hans,

Thank you for the patch.

There's a typo in the, commit subject.

:-)

On Fri, Feb 23, 2024 at 09:46:19AM +0100, Hans Verkuil wrote:
> First the media device node was created, and if successful it was
> marked as 'registered'. This leaves a small race condition where
> an application can open the device node and get an error back
> because the 'registered' flag was not yet set.
> 
> Change the order: first set the 'registered' flag, then actually
> register the media device node. If that fails, then clear the flag.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This looks fine for now, so, with the extra comma removed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I however wonder if we couldn't get rid of the flag and delegate the
registration test to cdev.

> ---
>  drivers/media/mc/mc-devnode.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 7f67825c8757..318e267e798e 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -245,15 +245,14 @@ int __must_check media_devnode_register(struct media_device *mdev,
>  	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
> 
>  	/* Part 3: Add the media and char device */
> +	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
>  	if (ret < 0) {
> +		clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
>  		pr_err("%s: cdev_device_add failed\n", __func__);
>  		goto cdev_add_error;
>  	}
> 
> -	/* Part 4: Activate this minor. The char device can now be used. */
> -	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
> -
>  	return 0;
> 
>  cdev_add_error:

-- 
Regards,

Laurent Pinchart

