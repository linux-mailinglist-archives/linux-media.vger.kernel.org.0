Return-Path: <linux-media+bounces-22560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC629E2DEF
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B467B2BD7C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 20:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C872205E3F;
	Tue,  3 Dec 2024 20:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="per9G6Ph"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE112500D3;
	Tue,  3 Dec 2024 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733257317; cv=none; b=ui533W0OllDkFfO9j5cbIBZ4DPwa+yjmjcmPNfTaTF4ZSVlZz028dd0E3QsRdq4p36Agq+e52ofsEI6cYsgFQCajdN3i+kKokNTmuFhuEnyXLJ5U2pGOGt1f9hMwid8gwKIXkGQq2K8um43e0oC53Snyqe5V6TrWF6mtBmz7jSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733257317; c=relaxed/simple;
	bh=BiGlY2hWa0V4f0c4u85vO766gfI+6XOttfOkcSwCNoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG5qOMPWHPI4u1c0iiibOHdKhHZhg/VMKbxcLs//vJ+XATb35lefOzWOBT6gnTA92TmrTNldGp4U+K+onPpUKW5jIXEhjkNG4jFMuePndAJQJAzI4B6HVn3pd4s8PdjSEfTceiPglx8XYu1jAe0ws/VHKoNFSiOLgaMgu/SXqm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=per9G6Ph; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 930FA670;
	Tue,  3 Dec 2024 21:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733257283;
	bh=BiGlY2hWa0V4f0c4u85vO766gfI+6XOttfOkcSwCNoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=per9G6PhnE+7g9P8jEkN1wmVVciskxbhr/vguF3DPpwK/aqFSaQLa4V99/ZfduNnD
	 QGkEZhPWqe5Mkjs2lQWnEWfjkxOnYkXQ62F5wldfKPzYca0LoTJiFjDUVKz/6eqYrD
	 2bMW46JXqWYfknUsJ0JHN2ZrrwgMa+uYzmj71P9E=
Date: Tue, 3 Dec 2024 22:21:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: uvcvideo: Only save async fh if success
Message-ID: <20241203202139.GB5196@pendragon.ideasonboard.com>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-1-6658c1fe312b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202-uvc-fix-async-v5-1-6658c1fe312b@chromium.org>

On Mon, Dec 02, 2024 at 02:24:35PM +0000, Ricardo Ribalda wrote:
> Now we keep a reference to the active fh for any call to uvc_ctrl_set,
> regardless if it is an actual set or if it is a just a try or if the
> device refused the operation.
> 
> We should only keep the file handle if the device actually accepted
> applying the operation.
> 
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..9a80a7d8e73a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1811,7 +1811,10 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  }
>  
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> -	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
> +				  struct uvc_fh *handle,
> +				  struct uvc_entity *entity,
> +				  int rollback,
> +				  struct uvc_control **err_ctrl)
>  {
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> @@ -1859,6 +1862,10 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				*err_ctrl = ctrl;
>  			return ret;
>  		}
> +
> +		if (!rollback && handle &&
> +		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +			ctrl->handle = handle;
>  	}
>  
>  	return 0;
> @@ -1895,8 +1902,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> -		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
> -					     &err_ctrl);
> +		ret = uvc_ctrl_commit_entity(chain->dev, handle, entity,
> +					     rollback, &err_ctrl);
>  		if (ret < 0) {
>  			if (ctrls)
>  				ctrls->error_idx =
> @@ -2046,9 +2053,6 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	mapping->set(mapping, value,
>  		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>  
> -	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -		ctrl->handle = handle;
> -
>  	ctrl->dirty = 1;
>  	ctrl->modified = 1;
>  	return 0;
> @@ -2377,7 +2381,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			ctrl->dirty = 1;
>  		}
>  
> -		ret = uvc_ctrl_commit_entity(dev, entity, 0, NULL);
> +		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
>  		if (ret < 0)
>  			return ret;
>  	}

-- 
Regards,

Laurent Pinchart

