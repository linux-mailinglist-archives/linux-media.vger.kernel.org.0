Return-Path: <linux-media+bounces-38181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365EB0C79D
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458D254056F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E432C2D94B9;
	Mon, 21 Jul 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXgc+hJa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD272617
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111790; cv=none; b=siUMorMENDyL7LFrqtq4DTr67+IcceEqVdxUr8VWnxeNUkhFNhu4Zm7xnF1K16DVUSkfv7qAtCvfINywf8LXxggq5YcYZQuJIuCS0dyIz+ZXF4YoBurZOzBNOQgYFZRYH8AberPDdvEbe1StBA0yuoe7ufPzEAedSWaH2f4WE7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111790; c=relaxed/simple;
	bh=2vQp/C1YEzqQQPr+FHuY7vVeHBDR1U5kgjkA1gJe9e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4QLDuFn/Tlsfzp0rNi/rXPakTFswrwu8nf7D+6ZSp6DIgk9AFtA3p0Hw/3S2JuXDbyXFSFTCIcQcIIswGxOC4YDDfaMGO9aGxemaoDCSWaIDzPOkJZCk2xkIwwg+42tAFqkx9dRYYgPmUou3MUVecyluHQIBVm4iBdTknb7gRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXgc+hJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B4CC4CEED;
	Mon, 21 Jul 2025 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111789;
	bh=2vQp/C1YEzqQQPr+FHuY7vVeHBDR1U5kgjkA1gJe9e8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BXgc+hJaE/9FInMNYNsDANsmxBIXBISRMU5anc5+kmHHF42p+UJ2YsQrTpc1nYkjT
	 zy/eR+XOhbRCGcrLbYJ8p/CMzWLs2NgMXT9oXatsARI+KIj8fVPmOQCcE562wGdud/
	 hWWaILUubV2N3KR3wT1RYFoRB8S3GnEjgUndzqpUGU0EgPa+tMWLzx8MqQkxLK3AN8
	 0pvAbyWXACNj1S3N+Kqd3hCfxoXEUqOISM3HzEoI7v3YcttY+Fu+UGiq/bcC5EbGug
	 hg+JcO93cZLZR1KjGmphq1HpVJuNrxq2nKey2411Ci/Dpak69/5ZDR7vTUNQuQiMZh
	 CA2lA0JhLkRCQ==
Message-ID: <cbfc4c5e-20fe-4e9e-8ca5-a5e7e7fa9cbf@kernel.org>
Date: Mon, 21 Jul 2025 17:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: uvcvideo: Move MSXU_CONTROL_METADATA
 definition to header
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
 <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jul-25 8:52 PM, Laurent Pinchart wrote:
> Move the MSXU_CONTROL_METADATA control definitino to the
> include/linux/usb/uvc.h header, alongside the corresponding XU GUID. Add
> a UVC_ prefix to avoid namespace clashes.
> 
> While at it, add the definition for the other controls for that
> extension unit, as defined in
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c |  9 ++++-----
>  include/linux/usb/uvc.h              | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 386b04a3a102..57f5455a726c 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -171,7 +171,6 @@ static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
>  	return NULL;
>  }
>  
> -#define MSXU_CONTROL_METADATA 0x9
>  static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  {
>  	u32 *data __free(kfree) = NULL;
> @@ -192,7 +191,7 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  
>  	/* Check if the metadata is already enabled. */
>  	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> -			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>  	if (ret)
>  		return 0;
>  
> @@ -207,16 +206,16 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>  	 * us, the value from GET_MAX seems to work all the time.
>  	 */
>  	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> -			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>  	if (ret || !*data)
>  		return 0;
>  
>  	/*
> -	 * If we can set MSXU_CONTROL_METADATA, the device will report
> +	 * If we can set UVC_MSXU_CONTROL_METADATA, the device will report
>  	 * metadata.
>  	 */
>  	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> -			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +			     UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>  	if (!ret)
>  		dev->quirks |= UVC_QUIRK_MSXU_META;
>  
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index ee19e9f915b8..72fff9463c88 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -33,6 +33,22 @@
>  	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>  	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>  
> +#define UVC_MSXU_CONTROL_FOCUS			0x01
> +#define UVC_MSXU_CONTROL_EXPOSURE		0x02
> +#define UVC_MSXU_CONTROL_EVCOMPENSATION		0x03
> +#define UVC_MSXU_CONTROL_WHITEBALANCE		0x04
> +#define UVC_MSXU_CONTROL_FACE_AUTHENTICATION	0x06
> +#define UVC_MSXU_CONTROL_CAMERA_EXTRINSICS	0x07
> +#define UVC_MSXU_CONTROL_CAMERA_INTRINSICS	0x08
> +#define UVC_MSXU_CONTROL_METADATA		0x09
> +#define UVC_MSXU_CONTROL_IR_TORCH		0x0a
> +#define UVC_MSXU_CONTROL_DIGITALWINDOW		0x0b
> +#define UVC_MSXU_CONTROL_DIGITALWINDOW_CONFIG	0x0c
> +#define UVC_MSXU_CONTROL_VIDEO_HDR		0x0d
> +#define UVC_MSXU_CONTROL_FRAMERATE_THROTTLE	0x0e
> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG	0x0f
> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2		0x10
> +
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}


