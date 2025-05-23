Return-Path: <linux-media+bounces-33239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D8AC1EF4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13895A23F53
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AE1223DC3;
	Fri, 23 May 2025 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YYM1vCRs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480E130A73;
	Fri, 23 May 2025 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990432; cv=none; b=ld+fSrmMHtVJ7I5PX7P5rzeICwheJERnHdWrhs05PDDpZBm8uUfw7jZPM1EMU9eHJwBcCh+Tt1Ihs+5ejDfOyjGDgwkMzA4+j/dJcbdoRYKPsaa2M5WY6VvxDmiRcUSA75V80oO16xiGq/JnZTot+6HUA/cAVILMaTf2iJq+xq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990432; c=relaxed/simple;
	bh=2skipVabhvq0DjPGjYcShZRjy3pMMmks4S/ix75f9Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEm/i8Vo0gyjKcFUobN9AjnTHFKsFoneigcR6Kg7zFRig6/kFBpuoNLEc2MtkL8Q40fHLgiJAMYWPJZgCV9rNrxlFl9OkIGz4ZH3yM4brmAt9J0PYUDHnffF54+mCVmk3YxIpeLyw4SPda+xsrPWBuw3DwAXFTwQ9WPjOJX1oBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YYM1vCRs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06BA6346;
	Fri, 23 May 2025 10:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747990406;
	bh=2skipVabhvq0DjPGjYcShZRjy3pMMmks4S/ix75f9Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYM1vCRs/XuwbH9ZtsNUudKYrPM12ZJI0iIJ/+PMwxr2KUkR8CrSZUbs7JPXnoywE
	 hCExhdJ1dmwR9BtbbO/T8dDstzAuQgxh9R9af6G8dp1hNycID+YjBHVH/EGh3+B8bq
	 0ukGX8g5xDkWosQLm6yiEPjjwtb2CGwWzlRt/VSA=
Date: Fri, 23 May 2025 10:53:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
Message-ID: <20250523085341.GA7516@pendragon.ideasonboard.com>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
 <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>

Hi Ricardo,

On Fri, May 09, 2025 at 06:24:13PM +0000, Ricardo Ribalda wrote:
> Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
> clearing the handle. The only common code between the two cases is the
> lockdep_assert_held.
> 
> The code looks cleaner if we split these two usecases in two functions.

It does indeed. Thanks for pushing for this :-)

> We also take this opportunity to use pending_async_ctrls from ctrl where
> possible.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
>  	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>  
> -static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
> -			       struct uvc_fh *new_handle)
> +static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
>  {
> -	lockdep_assert_held(&handle->chain->ctrl_mutex);
> -
> -	if (new_handle) {
> -		int ret;
> +	int ret;
>  
> -		if (ctrl->handle)
> -			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> -					     "UVC non compliance: Setting an async control with a pending operation.");
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
>  
> -		if (new_handle == ctrl->handle)
> -			return 0;
> +	if (ctrl->handle) {
> +		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> +				     "UVC non compliance: Setting an async control with a pending operation.");
>  
> -		if (ctrl->handle) {
> -			WARN_ON(!ctrl->handle->pending_async_ctrls);
> -			if (ctrl->handle->pending_async_ctrls)
> -				ctrl->handle->pending_async_ctrls--;
> -			ctrl->handle = new_handle;
> -			handle->pending_async_ctrls++;
> +		if (ctrl->handle == handle)
>  			return 0;
> -		}
> -
> -		ret = uvc_pm_get(handle->chain->dev);
> -		if (ret)
> -			return ret;
>  
> -		ctrl->handle = new_handle;
> -		handle->pending_async_ctrls++;
> +		WARN_ON(!ctrl->handle->pending_async_ctrls);
> +		if (ctrl->handle->pending_async_ctrls)
> +			ctrl->handle->pending_async_ctrls--;
> +		ctrl->handle = handle;
> +		ctrl->handle->pending_async_ctrls++;
>  		return 0;
>  	}
>  
> +	ret = uvc_pm_get(handle->chain->dev);
> +	if (ret)
> +		return ret;
> +
> +	ctrl->handle = handle;
> +	ctrl->handle->pending_async_ctrls++;
> +	return 0;
> +}
> +
> +static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
> +				 struct uvc_control *ctrl)
> +{
> +	lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
>  	/* Cannot clear the handle for a control not owned by us.*/

While at it, I'll add a space before */ when applying.

>  	if (WARN_ON(ctrl->handle != handle))
>  		return -EINVAL;

But actually, as the caller guarantees that handle == ctrl->handle in
both call sites (renaming the function makes this clear), can we drop
the handle argument to this function ?

If that's fine with you, I'd like to also change the
uvc_ctrl_set_handle() function to pass the ctrl argument first.

>  
> -	ctrl->handle = NULL;
> -	if (WARN_ON(!handle->pending_async_ctrls))
> +	if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
> +		ctrl->handle = NULL;
>  		return -EINVAL;
> -	handle->pending_async_ctrls--;
> +	}
> +
> +	ctrl->handle->pending_async_ctrls--;
>  	uvc_pm_put(handle->chain->dev);

This will need to become

 	uvc_pm_put(ctrl->handle->chain->dev);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	ctrl->handle = NULL;
>  	return 0;
>  }
>  
> @@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>  
>  	handle = ctrl->handle;
>  	if (handle)
> -		uvc_ctrl_set_handle(handle, ctrl, NULL);
> +		uvc_ctrl_clear_handle(handle, ctrl);
>  
>  	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>  		s32 value;
> @@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		if (!rollback && handle && !ret &&
>  		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
> +			ret = uvc_ctrl_set_handle(handle, ctrl);
>  
>  		if (ret < 0 && !rollback) {
>  			if (err_ctrl)
> @@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
>  			if (entity->controls[i].handle != handle)
>  				continue;
> -			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> +			uvc_ctrl_clear_handle(handle, &entity->controls[i]);
>  		}
>  	}
>  

-- 
Regards,

Laurent Pinchart

