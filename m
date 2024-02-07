Return-Path: <linux-media+bounces-4794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3429D84C81D
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 10:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661261C227D2
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 09:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA69E2555B;
	Wed,  7 Feb 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JEcSBYjP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463725561
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299847; cv=none; b=s12odw6wqB4YJmIVJ/WGN/8Thkf4VWg8t7sVgbF/0gbxTuEIlIpRDSsgOGBMaioPzgbaHE5n6BgBLjPguQJbRTclPayoqyzhAL97tu+a8wJUuSmUNZz4KQAeGJSwQ5tXfqP511/exGIZDmc5Y5DweSDv9OJvRbqsTKgihdK4O1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299847; c=relaxed/simple;
	bh=Hfrmzmhp1zseCB7xeJYCrfENICcAt/cYeQxau6UQm1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ3Hemi1RAKGTq19PdJ6PNIAx9TmfiUoUydN8IMtIsxjCp2B93Hz8jqI+mqzhuoTIbdiq7QzGALczuwR/mstPMx4oKyjW29VhKZkZFgOL0VktX6Uz5iD+0VZKvMRIdvWoVBnGCpPwVpHCAfEb9js8AX7nJfOLF9AgExXAzDbFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JEcSBYjP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 301F7975;
	Wed,  7 Feb 2024 10:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707299760;
	bh=Hfrmzmhp1zseCB7xeJYCrfENICcAt/cYeQxau6UQm1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEcSBYjPHm+jR9vabkR8z/c4IB1vpSStzMPm0QFnjOvsrxqnYHtnVlvgGPfm754YL
	 KxxgHoxLWyTmjjKIwsQWHJYyLSRmw4WBHPVtHf8Xj8EhRBH8cYVJFvgWBi4VIWhMpe
	 TUwwRHfO0UJ6RlRmPRqiB6GQGfvssAqPni6NR4Go=
Date: Wed, 7 Feb 2024 11:57:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 09/29] media: mc: Do not call cdev_device_del() if
 cdev_device_add() fails
Message-ID: <20240207095725.GF23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-10-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:36:53PM +0200, Sakari Ailus wrote:
> cdev_device_del() is the right function to remove a device when
> cdev_device_add() succeeds. If it does not, however, put_device() needs to
> be used instead. Fix this.

Where's the put_device() call ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/mc/mc-devnode.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index ce93ab9be676..7e22938dfd81 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -254,7 +254,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
>  
>  cdev_add_error:
>  	mutex_lock(&media_devnode_lock);
> -	cdev_device_del(&devnode->cdev, &devnode->dev);
>  	clear_bit(devnode->minor, media_devnode_nums);
>  	mutex_unlock(&media_devnode_lock);
>  

-- 
Regards,

Laurent Pinchart

