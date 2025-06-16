Return-Path: <linux-media+bounces-34940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584CADB41B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6290E1885CF4
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECCF20A5F5;
	Mon, 16 Jun 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exqkcegY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE71BC3F;
	Mon, 16 Jun 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084716; cv=none; b=ahL2ke2yjmfYUfsbokSWrIzq3KGRsc8AmCNOzNNU5OpS6cCuB8cS/MW69n7bIF4Q2vKZaDLqGn/aq6OMp+3yE5ucTqfUZOfzfA0iZI8aHCZsZO6xZuQf71aDu0ofMlkW+eRi1Bm2/JCyy5ItQ1wNGL5aI2KSh9Od8rs+pC9WcAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084716; c=relaxed/simple;
	bh=/B8FSd3Uau34QUMdkt+6mwLGvL84YtuejKwGuVYL1ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzTkdCdcABN1AVURxsLZBJWkO33j1xv7l+fNexKu2mea63ul4Jud11f7xNN1/1s5Y5k1vUbGF0armO+Ube1mbQoI5juWg0ucTU0vVtblWVgb9Xhxxhd0INTjC5bLq88D+3QRq/d63kv62P2i5v/rwB/zKMZL3x2pfTeYbKRSXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exqkcegY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC64C4CEEA;
	Mon, 16 Jun 2025 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750084716;
	bh=/B8FSd3Uau34QUMdkt+6mwLGvL84YtuejKwGuVYL1ZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=exqkcegYYED3EXr4O7fP3HnJh5vzpJKGf32T+jkidW0pzXfCxB7FPTe2OlAenqhbC
	 1p450Tr/MONUGzGhLtaflsLe7MO9xZ1yS4rKvldPJJRddDhoTe7slqRT8wh83sgbbK
	 +rNlDx86d1eMZNEnPcaQkRuIRnD3z4UvhDo0CNmPYZBhDyrf8Cd8CQjcmC3Cf/AdgK
	 FQ+Q0xxtTQzwQfqYBnl+TWuawffV/H8F2zUJxayZEV11pX82ZQ1xMn1pEKBk323EQx
	 1kFlP35+objUm7Wybzi/lbbX/xoHVjf7w41IfEaBhTSdsIJp9AGGnAUA6s70TboKCY
	 cPZxMmzoAl5YA==
Message-ID: <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
Date: Mon, 16 Jun 2025 16:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 4-Jun-25 14:16, Ricardo Ribalda wrote:
> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> MSXU_META quirk.
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
>  include/linux/usb/uvc.h              |  3 ++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -10,6 +10,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> +#include <linux/usb/uvc.h>
>  #include <linux/videodev2.h>
>  
>  #include <media/v4l2-ioctl.h>
> @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>  	.mmap = vb2_fop_mmap,
>  };
>  
> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> +
> +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
> +{
> +	struct uvc_entity *entity;
> +
> +	list_for_each_entry(entity, &dev->entities, list) {
> +		if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> +			return entity;
> +	}
> +
> +	return NULL;
> +}
> +
> +#define MSXU_CONTROL_METADATA 0x9
> +static int uvc_meta_detect_msxu(struct uvc_device *dev)
> +{
> +	u32 *data __free(kfree) = NULL;
> +	struct uvc_entity *entity;
> +	int ret;
> +
> +	entity = uvc_meta_find_msxu(dev);
> +	if (!entity)
> +		return 0;
> +
> +	/*
> +	 * USB requires buffers aligned in a special way, simplest way is to
> +	 * make sure that query_ctrl will work is to kmalloc() them.
> +	 */
> +	data = kmalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	/* Check if the metadata is already enabled. */
> +	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
> +			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +	if (ret)
> +		return 0;
> +
> +	if (*data) {
> +		dev->quirks |= UVC_QUIRK_MSXU_META;
> +		return 0;
> +	}
> +
> +	/*
> +	 * We have seen devices that require 1 to enable the metadata, others
> +	 * requiring a value != 1 and others requiring a value >1. Luckily for
> +	 * us, the value from GET_MAX seems to work all the time.
> +	 */
> +	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
> +			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +	if (ret || !*data)
> +		return 0;
> +
> +	/*
> +	 * If we can set MSXU_CONTROL_METADATA, the device will report
> +	 * metadata.
> +	 */
> +	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
> +			     MSXU_CONTROL_METADATA, data, sizeof(*data));
> +	if (!ret)
> +		dev->quirks |= UVC_QUIRK_MSXU_META;

Since we set the ctrl to enable MSXU fmt metadata here, this means that
cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
metadata mode at probe() time.

So even if cameras exist which support both metadata formats, since we
switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
the uvcvideo driver will only support 1 metadata fmt per camera.
Which is fine supporting more then 1 metadata fmt is not worth
the trouble IMHO.

This means that Laurent's remark on [PATCH v5 4/4]:

"I would prefer if you could instead add a metadata format field in the
uvc_device structure (I'd put it right after the info field, and while
at it you could move the quirks field to that section too). The metadata
format would be initialized from dev->info (when available) or set to
the UVC format, and overridden when the MSXU is detected."

is still relevant, which will also make patch 3/4 cleaner.

The idea is to (in patch 3/4):

1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
2. Keep the quirk and if the quirk is set override dev->meta_format to
   V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
   cameras which lack the MSXU_CONTROL_METADATA control.

Doing things this way avoids the need for the complexity added to
uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
be replacing dev->info->meta_format with dev->meta_format.

Regards,

Hans





> +
> +	return 0;
> +}
> +
>  int uvc_meta_register(struct uvc_streaming *stream)
>  {
>  	struct uvc_device *dev = stream->dev;
>  	struct video_device *vdev = &stream->meta.vdev;
>  	struct uvc_video_queue *queue = &stream->meta.queue;
> +	int ret;
> +
> +	ret = uvc_meta_detect_msxu(dev);
> +	if (ret)
> +		return ret;
>  
>  	stream->meta.format = V4L2_META_FMT_UVC;
>  
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -29,6 +29,9 @@
>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
>  	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>  	 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> +#define UVC_GUID_MSXU_1_5 \
> +	{0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> +	 0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>  
>  #define UVC_GUID_FORMAT_MJPEG \
>  	{ 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> 


