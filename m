Return-Path: <linux-media+bounces-33878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCB0ACAAF7
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 10:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31AE73B0446
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 08:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541421DE3C3;
	Mon,  2 Jun 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlfwXMSw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CB219CC0E;
	Mon,  2 Jun 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854734; cv=none; b=Cxx4mEdoP0bhuIeYX3ZFEPprWPVlVCwt03fKH2rTMklnFiEZ1osBcJnya0iiNT7tKYxyL53eGqzFGgkjwOLYBhUQeI3wBYUcCcq1EpiVk2OCkhW5DGtNa4DwCi9Xx6YPTM8woFw33WT6JdjGQH3BeGUH4MqNrfTU4AnDYszLMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854734; c=relaxed/simple;
	bh=wuJ4IWrSGNF29Hamsf0y9auH7Uv1YoXxMEPBVPcCl4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPvAtKqejW4EkyyQIrQ+XmC4B8zAasefql6w1U1Heym3K7CIVrPukmHDG3vHJIu6Tvm5I2BvY43skvTVPtWSi5MB+GUVJ5CsjO0zZ6VYPIVZl3pG5eIfX6D1/Y1Lk1RPhUcKqiBZpcPNzXSbC384GYuDudz4X1jXpsERAdU9M+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlfwXMSw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3C0C4CEEB;
	Mon,  2 Jun 2025 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854734;
	bh=wuJ4IWrSGNF29Hamsf0y9auH7Uv1YoXxMEPBVPcCl4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WlfwXMSwDlLigKiMfY5Letb+Ts0es/7ka95Sicf/cELpQ7zuGrAAuLFJiz3NS9ZCo
	 KOH8XdfB2JQwyB7BoMxRaGuHYsMZf9+Zn/4qQjvKNL/tDOHHveDqWHos3IoelUC9nN
	 1E4p/r/5ZFCaLqP1k9sH2s2xsssTo049K+Ay+yal7u0fFwI9t55UKUjW0zE0zEL0bL
	 X9vP7/DU+wS3jZCCWG1uAehNvkNVuRW76b/n7/jaSDewa9JwhH3+EW/zMw9USbWf/+
	 o+YNGZTf2amG8VYNUC5hZ1P3H4FvOSjj9dfyRLXmGJDHZ/nXTxUTZpatioIp6IyR5/
	 2rZNsoBB70JuA==
Message-ID: <e1200c61-3a04-482b-a639-f7dd4c9ca717@kernel.org>
Date: Mon, 2 Jun 2025 10:58:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: uvcvideo: Turn on the camera if
 V4L2_EVENT_SUB_FL_SEND_INITIAL
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250528-uvc-grannular-invert-v1-0-d01581f9cc25@chromium.org>
 <20250528-uvc-grannular-invert-v1-5-d01581f9cc25@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250528-uvc-grannular-invert-v1-5-d01581f9cc25@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

Thank you for your patch.

On 28-May-25 19:58, Ricardo Ribalda wrote:
> If we subscribe to an event with V4L2_EVENT_SUB_FL_SEND_INITIAL, the
> driver needs to report back some values that require the camera to be
> powered on. But VIDIOC_SUBSCRIBE_EVENT is not part of the ioctls that
> turn on the camera.
> 
> We could unconditionally turn on the camera during
> VIDIOC_SUBSCRIBE_EVENT, but it is more efficient to turn it on only
> during V4L2_EVENT_SUB_FL_SEND_INITIAL, which we believe is not a common
> usecase.
> 
> Fixes: d1b618e79548 ("media: uvcvideo: Do not turn on the camera for some ioctls")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c526421943bb9841fb53dc5f8e9f93f02..a7b8f3ea01edd8157e0d8cc36351d511225f89d7 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2039,6 +2039,12 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
>  		s32 val = 0;
>  
> +		ret = uvc_pm_get(handle->chain->dev);
> +		if (ret) {
> +			list_del(&sev->node);

uvc_ctrl_add_event() holds chain->ctrl_mutex and the only consumer of
the ev_subs list "uvc_ctrl_send_event() also only gets called with
chain->ctrl_mutex held.

So instead of undoing the list_add_tail() here, it would be better
to just move the list_add_tail() call to below the
"if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) { ... }" block
(just above the done label).

This avoids the need for the list_del() here.

With that changed:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> +			goto done;
> +		}
> +
>  		if (uvc_ctrl_mapping_is_compound(mapping) ||
>  		    __uvc_ctrl_get(handle->chain, ctrl, mapping, &val) == 0)
>  			changes |= V4L2_EVENT_CTRL_CH_VALUE;
> @@ -2051,6 +2057,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
>  		 */
>  		sev->elems = elems;
>  		v4l2_event_queue_fh(sev->fh, &ev);
> +
> +		uvc_pm_put(handle->chain->dev);
>  	}
>  
>  done:
> 


