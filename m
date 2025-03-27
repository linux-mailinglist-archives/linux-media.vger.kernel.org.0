Return-Path: <linux-media+bounces-28872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E7A73D9F
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 18:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0D3189EFAF
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 17:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4F821A444;
	Thu, 27 Mar 2025 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fYrIEQoD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59B1FF613;
	Thu, 27 Mar 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743098164; cv=none; b=YHgpVkVxiAQlLA3cbZ3x8rzeZ+fhtbcJNr8+0INWHRxm5s7K6KFCNew98QTQuL2/x8q1lXh2YA7dDHnJljqxeD9urlTNB1A0gWbHkvSdRrBlT39mXASwBJzPtvA6D0E0dZMpTIfxysObIE5915oKz5A+Hxn3iPODuCAp7jkGit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743098164; c=relaxed/simple;
	bh=KDebul7qD0PvlRzgHb72NktYh4aDUx/qmtucxysgutI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNAetCB06EWOBBxdVSKsRbUWHda7S3vIf4RPCkKnlZoLLwLkCK/1eYMp8Z421OOTxcZSfjQ/UDL1nvR13Llil6vmJNn/5Jf4qkOdOuP4gfZi0Uw2wI3x0tjebilUaJifgLpsIRpGL69gHbJPV0kP73Id/m+nwAV9G1ys+e6Slxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fYrIEQoD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 496BA446;
	Thu, 27 Mar 2025 18:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743098052;
	bh=KDebul7qD0PvlRzgHb72NktYh4aDUx/qmtucxysgutI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYrIEQoDsiaApEGaLVPiqrJ0/dGQOPElJebVUV2w3ssBKW5AHnypia6FpnYNwnkoJ
	 +XE2q5ARHjnBMmMs+EWdKiN5SRhW/Aih7LndgX7PbiiKD0+Bv94h0WKD6LssV86PBK
	 GnfSn7B3kLVJfOivJgFMyahzTe7WKkB8z2Sw5e9U=
Date: Thu, 27 Mar 2025 19:55:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v5 4/5] media: uvcvideo: Make power management granular
Message-ID: <20250327175538.GB11416@pendragon.ideasonboard.com>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
 <20250303-uvc-granpower-ng-v5-4-a3dfbe29fe91@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-uvc-granpower-ng-v5-4-a3dfbe29fe91@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 03, 2025 at 07:13:41PM +0000, Ricardo Ribalda wrote:
> Now that every ioctl takes care of their power management we can remove
> the "global" power management.
> 
> Despite its size, this is a relatively big change. We hope that there
> are no size effects of it. If there are some specific devices that
> miss-behave, we can add a small quirk for them.
> 
> This patch introduces a behavioral change for the uvc "trigger" button.
> Before the "trigger" button would work as long as userspace has opened
> /dev/videoX. Now it only works when the camera is actually streaming. We
> consider that this the most common (if not the only) usecase and
> therefore we do not think of this as a regression.

We'll see :-)

> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 1c9ac72be58a..6af93e00b304 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,7 +652,6 @@ static int uvc_v4l2_open(struct file *file)
>  {
>  	struct uvc_streaming *stream;
>  	struct uvc_fh *handle;
> -	int ret = 0;
>  
>  	stream = video_drvdata(file);
>  	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> @@ -662,12 +661,6 @@ static int uvc_v4l2_open(struct file *file)
>  	if (!handle)
>  		return -ENOMEM;
>  
> -	ret = uvc_pm_get(stream->dev);
> -	if (ret) {
> -		kfree(handle);
> -		return ret;
> -	}
> -
>  	v4l2_fh_init(&handle->vfh, &stream->vdev);
>  	v4l2_fh_add(&handle->vfh);
>  	handle->chain = stream->chain;
> @@ -701,7 +694,6 @@ static int uvc_v4l2_release(struct file *file)
>  	kfree(handle);
>  	file->private_data = NULL;
>  
> -	uvc_pm_put(stream->dev);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

