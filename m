Return-Path: <linux-media+bounces-33889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B7ACABD7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79C6189C89F
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380F91E7C06;
	Mon,  2 Jun 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEB5D/dy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C981E285A;
	Mon,  2 Jun 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857567; cv=none; b=OowaFfqVgQKDahfUngggoJyPKW+B+fUhM0B9pJFXzstpIkOuy7GaPdD4dE9+Q7qZXU4vv0rBvH5kCfLGlXFY2ixM5Mjd39FXE4GNgWy9aOgyLLAX6OMy8uBFq9xsTwAYh/dkYmjYmo1iaxm/1VZ5dlP77fChECGcMD3h9OlK70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857567; c=relaxed/simple;
	bh=xKAJzjvYD0wzY2znCqc8RFE5AqvMXOfzJVb9w1u3yrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPPmOUmWy8XEzSDH/hCza9zwQ9mghMEkRmlKkjHwwnqUvn0Z76qKjHrX7jhRxLDxunVEeVgbgbsjh8X3AloOr9Jer+qwmHKFH/NvK5tIELF2P519gDjgHPpyqQvX+z/ZK6/YqFOJqtr8+6w1VpjiC+dbMT8goTVMnAdEzluuoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEB5D/dy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD66C4CEF1;
	Mon,  2 Jun 2025 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748857567;
	bh=xKAJzjvYD0wzY2znCqc8RFE5AqvMXOfzJVb9w1u3yrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jEB5D/dyDD8gcZpOt7JbhGwhM1AugG3w3xrGXvAKboyqr4v0j6W9mBfeybuAcB6kF
	 4rT1Jqb1lI8mYv2a4Or/dq9CyVd8+IRbpOOAjYb5XT8R+xgopGqnnbBIRdP5pf03bb
	 2rusbxMdpoXAvrslt2Ib4U0ZrghBgNpWWoymJPoaDAaq+YVCcfpvUKmY+kqoZgB5JQ
	 Iu7fC32MdB1HR+dBHXa65JQEAlPR+xPL1r8CRo8MwWyrp3+Nb9dp9el+E4UJfZYxbH
	 umxs0v6ZLgHQ+1zrvGmr5Lx6esXShQWvWjKnOstHvpDSmI17Z3APFPSxT3CoCUI8iU
	 xaX2c3BdYjOTQ==
Message-ID: <8a77f74b-12aa-4aac-a3d3-4ec8be8d2cf3@kernel.org>
Date: Mon, 2 Jun 2025 11:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: uvcvideo: Do not enable camera during
 UVCIOC_CTRL_MAP32
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-6-d01581f9cc25@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-6-d01581f9cc25@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 28-May-25 19:58, Ricardo Ribalda wrote:
> The device does not need to be enabled to do this, it is merely an
> internal data operation.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 65c708b3fb1066bf2e8f12ab7cdf119452ad40f9..2c6f3cf6bcc3f116bbdb3383d9af7d5be9832537 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1224,10 +1224,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  	void __user *up = compat_ptr(arg);
>  	long ret;
>  
> -	ret = uvc_pm_get(handle->stream->dev);
> -	if (ret)
> -		return ret;
> -
>  	switch (cmd) {
>  	case UVCIOC_CTRL_MAP32:
>  		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
> @@ -1245,7 +1241,13 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  		ret = uvc_v4l2_get_xu_query(&karg.xqry, up);
>  		if (ret)
>  			break;
> +
> +		ret = uvc_pm_get(handle->stream->dev);
> +		if (ret)
> +			return ret;

The rest of the code here uses:

		if (ret)
			break;

as pattern, please also use that for the uvc_pm_get() error handling

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




>  		ret = uvc_xu_ctrl_query(handle->chain, &karg.xqry);
> +		uvc_pm_put(handle->stream->dev);
> +
>  		if (ret)
>  			break;
>  		ret = uvc_v4l2_put_xu_query(&karg.xqry, up);
> @@ -1258,8 +1260,6 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
>  		break;
>  	}
>  
> -	uvc_pm_put(handle->stream->dev);
> -
>  	return ret;
>  }
>  #endif
> 


