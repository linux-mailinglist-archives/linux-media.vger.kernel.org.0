Return-Path: <linux-media+bounces-33016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63BABF3A3
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 14:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2141E3B932C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06158265CC2;
	Wed, 21 May 2025 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qeIWCdrO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFC26461B
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828971; cv=none; b=sxMosCBlbb4pirJcElgCQowWIXGYq+POp4QmxEl/Sq1Esc6106hNeiD+cg/tmxNwVCxWxC2Cxg9JB77ICvvw1Vjt4etSRqeOIgSBJ6KdvsiX0ghSpQAWaoVh5Rd3hFw3Z3pgfiJdcFbpoxtWvHtBPPzHgNqSreNWMawcJLNX3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828971; c=relaxed/simple;
	bh=13oo5VQs8BydmbGMbPAqvpqueQGS9W7JQsNSbl5mZHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LannEUYbph+6SBOi2MuYa3LR7aPH3qRxvk2mvEIlliDIiG9uwXgC7z+KTB5Lf+CKCqYyoM4vEfXu6NfkBCEk3ErNoDJw6/IthT824+IfG4//AVvLcxPVshsTvn7e74w+jaHSZRF+Z5bF9aqmRtN1bSWCixRViRheZxB6BNh+aDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qeIWCdrO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85CA96B5;
	Wed, 21 May 2025 14:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747828946;
	bh=13oo5VQs8BydmbGMbPAqvpqueQGS9W7JQsNSbl5mZHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeIWCdrOurugKiDZ0wlWBaFSLDUUL7WKU2VEBPtk7p6V8kgBYOY4vYysd5j+sioi7
	 xwUyWCFdfZ+tedgs2rgApqB4hrnn3yqfJ8l7h/PSKXybB7IN48Esyut/XLWsGEVqZC
	 rdp5JWnMly6Ta9rh9NGYOQo0LRUWNsPJlTPMuhHY=
Date: Wed, 21 May 2025 14:02:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] media: v4l2-ctrls: Don't reset handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <20250521120242.GJ12514@pendragon.ideasonboard.com>
References: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, May 08, 2025 at 07:08:52PM +0300, Sakari Ailus wrote:
> It's a common pattern in drivers to free the control handler's resources
> and then return the handler's error code on drivers' error handling paths.
> Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
> effectively indicating successful return to the caller.
> 
> There's no apparent need to touch the error field while releasing the
> control handler's resources and cleaning up stale pointers. Not touching
> the handler's error field is a more certain way to address this problem
> than changing all the users, in which case the pattern would be likely to
> re-emerge in new drivers.
> 
> Do just that, don't touch the control handler's error field in
> v4l2_ctrl_handler_free().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi all,
> 
> This is currently affecting the following drivers:
> 
> 	drivers/media/i2c/imx334.c
> 	drivers/media/i2c/imx335.c
> 	drivers/media/i2c/imx412.c
> 	drivers/media/i2c/ov2740.c
> 	drivers/media/i2c/ov5675.c
> 	drivers/media/i2c/ov9282.c
> 	drivers/media/pci/tw68/tw68-core.c
> 	drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> 	drivers/media/platform/samsung/s3c-camif/camif-capture.c
> 	drivers/media/platform/verisilicon/hantro_drv.c
> 	drivers/media/test-drivers/visl/visl-core.c
> 
> The fact that one of them is a test driver tells a lot. :-)
> 
> The patch is untested. If we agree to do this, the patch should probably
> be cc'd to stable, too.
> 
> - Sakari
> 
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 90d25329661e..932aedc26049 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	kvfree(hdl->buckets);
>  	hdl->buckets = NULL;
>  	hdl->cached = NULL;
> -	hdl->error = 0;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);

The function could even return hdl->error, in which case drivers could
do

	if (handler->error)
		return v4l2_ctrl_handler_free(handler);

Up to you. The change is good either way.

>  }

-- 
Regards,

Laurent Pinchart

