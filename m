Return-Path: <linux-media+bounces-30746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4773A97850
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7A5118996AA
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6A925C826;
	Tue, 22 Apr 2025 21:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hJctLjgp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6225C806;
	Tue, 22 Apr 2025 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356404; cv=none; b=I3W7lQE5OWiKAE6nlXyYeAKeltGGAEplYcu8N/FCU7PgkFNxXWRIpjgzqS1OB6/oJSI1PZDbmbTAmz1BIamcm6uMAqdJVeKjzHNRK4CY1FCWx+6QXLI3ffVqQNz3/ezcl1lEzPnD4cGRg3QrmQWMc4f1cDkFcCnzd3YyP/AfYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356404; c=relaxed/simple;
	bh=62l8ycsRy5TYmENNU4ufXWIzRBqbCxMUi99ufS0ft7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVJng+9TqJavxzhS5uirLV/Yesk/YscNgCXjakyu5698+rrY1DknSkg2Jn05g55M+9WO+76VcbDNpxMKzUlwUAWKpzwOp+FEFFihrQ+r8lBU9aXKLfDeUNPJDFhlIkX+HbxZswcW5ERDlcQUssTFBHi92cU8SRuFGp1M5jl5bxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hJctLjgp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D515D2AC;
	Tue, 22 Apr 2025 23:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745356400;
	bh=62l8ycsRy5TYmENNU4ufXWIzRBqbCxMUi99ufS0ft7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJctLjgpt3hJjYiiucC0Fh0I0oC3ifSeojAzS3e8IqpyVwbHpsHnwbYtJZ8qITdu3
	 +l0XgoQX7/iXeUXpJJtjw+HH/L9jnYp34MUFXT4EE01Ojlu1gzz1+pcv8W0S6VczOv
	 1w8FETFNWPhWuT6IbDjLSrtXtaqPhY5n4Vl4SGGU=
Date: Wed, 23 Apr 2025 00:13:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
Message-ID: <20250422211318.GO17813@pendragon.ideasonboard.com>
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Feb 24, 2025 at 10:34:55AM +0000, Ricardo Ribalda wrote:
> If we wail to commit an entity, we need to restore the
> UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> control cache and the device would be out of sync.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7d074686eef4..89b946151b16 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
>  	if (entity == NULL)
>  		return 0;
> @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				dev->intfnum, ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> -		else
> -			ret = 0;
>  
>  		if (!ret)
>  			processed_ctrls++;
> @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0) {
> +		if (ret < 0 && !rollback) {
>  			if (err_ctrl)
>  				*err_ctrl = ctrl;
> -			return ret;
> +			/*
> +			 * If we fail to set a control, we need to rollback
> +			 * the next ones.
> +			 */
> +			rollback = 1;
>  		}
>  
>  		if (!rollback && handle &&
> @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
> +	if (ret)
> +		return ret;
> +
>  	return processed_ctrls;
>  }
>  
> @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_control *err_ctrl;
>  	struct uvc_entity *entity;
> -	int ret = 0;
> +	int ret_out = 0;
> +	int ret;
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  				ctrls->error_idx =
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
> -			goto done;
> +			/*
> +			 * When we fail to commit an entity, we need to
> +			 * restore the UVC_CTRL_DATA_BACKUP for all the
> +			 * controls in the other entities, otherwise our cache
> +			 * and the hardware will be out of sync.

The text can be reflowed to 80 columns.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			 */
> +			rollback = 1;
> +
> +			ret_out = ret;
>  		} else if (ret > 0 && !rollback) {
>  			uvc_ctrl_send_events(handle, entity,
>  					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	ret = 0;
> -done:
>  	mutex_unlock(&chain->ctrl_mutex);
> -	return ret;
> +	return ret_out;
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain,

-- 
Regards,

Laurent Pinchart

