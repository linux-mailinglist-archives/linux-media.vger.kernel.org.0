Return-Path: <linux-media+bounces-5748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A06D860D99
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 10:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7E7D2879B0
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147C21A28C;
	Fri, 23 Feb 2024 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNmL2GEH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F91A731
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708679348; cv=none; b=qBcD3QcyBNExrOSJiTlB8xX7YL9ohxiMI+1Pbj4P/PdmGtkvd28lSwzWwnMelaN51BLTmbvOBnIfSknSUdMnHuhYIXToP1q0d3CY86jOvBV0niTLM7y7MoDo3w6puHHkI5FiwF/lV1b2HyQ5QVciBfJptj2nQLwBn3lzLAodTyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708679348; c=relaxed/simple;
	bh=YcsBDJm5j/tzmq9V8UrCOaT0Bu1QcePSjrEsAXk3C1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGFGbhw7I2+aVg1MMU1QTpuNuppqJsof+4rqfdpuMVFYeNdop1cu9EhZf/t+bj8ndadzvjYb7eZFCd7oTDUPFUQnLe8eHv6rOJtMYhO6sJBjf6tz9aF/jnaLFlBWlR7SUY8zCdFR8vkza4vMGp0/IHNu71Kh9o2vHzkb7KuntXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNmL2GEH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708679347; x=1740215347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YcsBDJm5j/tzmq9V8UrCOaT0Bu1QcePSjrEsAXk3C1k=;
  b=PNmL2GEHO2uTLP/TETz4RDp3m/+SS7kSkXPyiJFjUJ+IXw69bBEmy5+i
   ejfiExp/Y6q2W+GQ3gZ5FuahRvoRiLIcKe9RSiZp7MAVSFlESoxy+Kelw
   UmGzFVraAknUDrrhBOS6FYWX8AKjpz7jBwKTBKtcxpntSooSwx65YNvWw
   tkkSwkGR7P/Uz2GfrJ69EeXecDT6vSZvz0JmOg2U09nOE5vGPe+klC9oz
   KHsga4Jy6Il/omrrMlwGXvwp2PtSKikQf+FIT60dWjAohcvTLtXUS2VHQ
   3J0MEwx1/6AgOPnRoKZ7ON1iY+MHqcMeNdiKoyzMf76oCzswpqslWI9UW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3489115"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3489115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:09:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6049291"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:09:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3536811F81D;
	Fri, 23 Feb 2024 11:09:02 +0200 (EET)
Date: Fri, 23 Feb 2024 09:09:02 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: mc: mark the media devnode as registered from
 the, start
Message-ID: <Zdhgrrg9W2KJpatz@kekkonen.localdomain>
References: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28a6f75-eb46-4d71-a919-b4c9c8e35124@xs4all.nl>

Hi Hans,

Thanks for the patch.

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

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

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
Kind regards,

Sakari Ailus

