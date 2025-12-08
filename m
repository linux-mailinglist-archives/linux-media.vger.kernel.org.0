Return-Path: <linux-media+bounces-48393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CFCCACF88
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABCB3049B15
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5698313293;
	Mon,  8 Dec 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTcSHui8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AA26F2BC;
	Mon,  8 Dec 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192644; cv=none; b=SWmxcHEZPdJq3gNOkdj+4Nr02L858gb8EHBXaSTunthOC4Xc/Zgg7FwmkZimmIE/GkkDHJ+qX5FUh1P7inZi8TsC7v0aakUvHmkMk54y7K1C65VJuzSWHmt5L/TbdWCTtKaXOqT7Fc/budjFpb2qgAPIAHquSjcmGKxYcEgwldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192644; c=relaxed/simple;
	bh=KtiMXHJh3DbH72E44rdVV48QnYHAuTBc6+cg6He4i2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLAQjm+nL7p1qoyOVJ7VzIXxqfIECVk2kRC1bhFc+BTkLY0vxX9lxWnsb45liUHKsfzpdpNPRcZlP0/Gla1DcrS+j6lV1A42Q9PELukxHxz4vxRfazF71pvS+sUeDTZpi9qxSHp00EpqRyurCOHanOrsKrmPyvl/l7pO2PYejeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTcSHui8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA0AC4CEF1;
	Mon,  8 Dec 2025 11:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765192644;
	bh=KtiMXHJh3DbH72E44rdVV48QnYHAuTBc6+cg6He4i2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GTcSHui8ZALxrlcF1MdNvZetfPhnqCB+SqIOYdzIK8OZN7wXNVyF24xf3ciC3m502
	 EwF0qAUIMY0qoTlQhJSIOUPmqq5eTqZ7HoADE+vpkioxKOKp3nCovG7k+8sXPcgJk3
	 fkob5xQkhRx1lIy9L7rCG7ecmYUnOKH9cHCeE875nHvIE7EhZKvtt9gJyU0p8/lS5S
	 GUArhMfbr9VVdTU1KdotBmo+LLcKeYKiLWUAnaAVsiTRH6DzA+iK3PqCB0KQfwzLz4
	 H1mgOoYT4PoMtht/OFxyFocdwS1RcFmDtqnjrsASC968FAgVUZXsG3JseXF2SeOAj+
	 gSgyjVzL49bsg==
Message-ID: <f7cbf5ab-7564-4c81-84c9-b38b09e977f9@kernel.org>
Date: Mon, 8 Dec 2025 12:17:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
> control.
> 
> This mapping is usually created by the uvcdynctrl userspace utility. We
> would like to get the mappings into the driver instead.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
>  drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
> --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> @@ -109,6 +109,8 @@ IOCTL reference
>  UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> +**This IOCTL is deprecated and will be eventually removed**
> +
>  Argument: struct uvc_xu_control_mapping
>  
>  **Description**:
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
>  	switch (cmd) {
>  	/* Dynamic controls. */
>  	case UVCIOC_CTRL_MAP:
> +		pr_warn_once("uvcvideo: " DEPRECATED
> +			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
>  		return uvc_ioctl_xu_ctrl_map(chain, arg);
>  
>  	case UVCIOC_CTRL_QUERY:

Deprecating and then removing this is going to be a long slow process.

I was thinking that rather then remove it we would keep accepting the ioctl but instead
of calling uvc_ioctl_xu_ctrl_map() we would simply return 0. E.g. change the above to:

  	case UVCIOC_CTRL_MAP:
		pr_warn_once("uvcvideo: " DEPRECATED
			     "UVCIOC_CTRL_MAP ioctl will eventually be ignored.\n");
  		return uvc_ioctl_xu_ctrl_map(chain, arg);

And then say in one year after a kernel with the above is released change it to:

  	case UVCIOC_CTRL_MAP:
		pr_warn_once("uvcvideo: " DEPRECATED
			     "UVCIOC_CTRL_MAP ioctls are ignored.\n");
  		return 0;


I think removing it in 1 year is too soon, but ignoring it is ok. This does mean
that people will loose the custom v4l2-ctrls for which patch 2/6 is not adding
mappings into the driver in 1 year after a kernel with the warning is released...

I'm not 100% sure about this plan, so please let me know what you think. For
outright deprecation warning + full removal I think we need to wait at least
2 years after shipping a kernel with the deprecation warning.

Regards,

Hans



