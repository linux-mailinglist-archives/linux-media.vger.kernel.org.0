Return-Path: <linux-media+bounces-26693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46366A4105B
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00E0A3A5592
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 17:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BE21474A0;
	Sun, 23 Feb 2025 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="abt8epAE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101668C11;
	Sun, 23 Feb 2025 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740330433; cv=none; b=r7tElcfLVHeDnk5jW9zPn2v/EPzSt3H7lUMpZdDS82NkLqak9Ju7sysoQpzbQsi8YdTwUaJCTUKsd/TEQ2s6uXhy5y7n8p/ZUe2SjWEK/nJfA/EJ9p/FEg0H0QFYJ0mj7nkiqZ7cJ+mxc4Vz6xEcIvWveFNz1bb913EkE89hw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740330433; c=relaxed/simple;
	bh=e6pbwpopftsLUFdsz6j5ITe8nazrWE3Vqkq6/xI5K20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnoyLUdGdf4UqpCgXmth1puQROFzgPXrg4ZnM7TpAYBIsutxB2sW5/JoyoRA7l9ciM9Su4LiVbNaKYgNWDlJitxVHEofSZqHzDgYxSDUica0ZqtdKY05M5kHBORSMHR7UaIxmrc/j+a8HOIYVff+/Ci5dE2mwIbXLIT6/u9Si/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=abt8epAE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92B4E4DC;
	Sun, 23 Feb 2025 18:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740330344;
	bh=e6pbwpopftsLUFdsz6j5ITe8nazrWE3Vqkq6/xI5K20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abt8epAEtKw1uzoxcvDqJmGqAJObIJyqiQlNOeMIcqqNDn/Pc/TQqG0keX0PSPpZC
	 0oMU/w74YvRGIs2JYtko9kh9SgTETRutAku+0EvixGWQteHhmDUvivTshspqkPOgve
	 MzMYG21q1k+4YLMAE7t9CNFCro5AIgUpDXQCPtk8=
Date: Sun, 23 Feb 2025 19:06:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH 1/3] media: uvcvideo: Return the number of processed
 controls
Message-ID: <20250223170653.GB2821@pendragon.ideasonboard.com>
References: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
 <20241210-uvc-data-backup-v1-1-77141e439cc3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-uvc-data-backup-v1-1-77141e439cc3@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Dec 10, 2024 at 10:22:22PM +0000, Ricardo Ribalda wrote:
> If we let know our callers that we have not done anything, they will be
> able to optimize their decisions.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")

This patch doesn't fix any issue by itself.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..7e2fc97c9f43 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1810,9 +1810,14 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  	return mutex_lock_interruptible(&chain->ctrl_mutex) ? -ERESTARTSYS : 0;
>  }
>  
> +/*
> + * Returns the number of uvc controls that have been correctly set, or a
> + * negative number if there has been an error.
> + */
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
>  {
> +	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	int ret;
> @@ -1847,6 +1852,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  		else
>  			ret = 0;
>  
> +		if (!ret)
> +			processed_ctrls++;
> +
>  		if (rollback || ret < 0)
>  			memcpy(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  			       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_BACKUP),
> @@ -1861,7 +1869,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  		}
>  	}
>  
> -	return 0;
> +	return processed_ctrls;
>  }
>  
>  static int uvc_ctrl_find_ctrl_idx(struct uvc_entity *entity,
> @@ -1910,7 +1918,7 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);

	ret = 0;

>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
> -	return ret;
> +	return ret < 0 ? ret : 0;

And keep 'return ret;'.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain,

-- 
Regards,

Laurent Pinchart

