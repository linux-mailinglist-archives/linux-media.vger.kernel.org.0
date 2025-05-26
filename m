Return-Path: <linux-media+bounces-33398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8050DAC40E0
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFEF1179F4B
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBD3204F99;
	Mon, 26 May 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j2hwryUs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893A433AC;
	Mon, 26 May 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268138; cv=none; b=Pyr4775B9Ut7tR/wmgsLyzfASUxHB+0zqdFmHW3LkHavQ6QATKSFSJWgl5rHRlcfJcjyttn3LiziOzYmvmCwepfdvOG4sfYT8j+k+l4EoYFiIkfgKl9a6J16ci5dLgHEEFIulAiTJgEoOcxY/beJOjV8M8CtcdcuAB/2IrdQQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268138; c=relaxed/simple;
	bh=WdVXmaqBcQU32NC2s1ps5OllpizGuxaNbTkCBQyQglY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgdyAAnR7qSOzoPMlDTycv6Ovv010TmjvqSxF36/psJolvED+xEvc0tZMKlsLzqlsI+ROdfjhZte5whCyC+RSbFunOiwySCOTknk0z7VTPeA8oJOWrYp0i6PGtFCjhfbDbbHJAI8y52Y3oFcuGdffXtlpJ91VncTEnLDnAxFzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j2hwryUs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 393F07E6;
	Mon, 26 May 2025 16:01:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748268110;
	bh=WdVXmaqBcQU32NC2s1ps5OllpizGuxaNbTkCBQyQglY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2hwryUssIWZKCMwUhyyxJC64fe5T29WaeP1JRIm9HxaKm/I40D5q43sgJ06oKSzh
	 JHnbOt0iL6oaNbgjqRpfHY3iTKrJRzE3o3zK/HgVmUZ/Ot/CHWXCRex1ZQ0mPoM8gh
	 00LM7/WnMDRQUe8ydk68ATqmDb0nEjLL7dc2H9S4=
Date: Mon, 26 May 2025 16:02:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
Message-ID: <20250526140209.GP17743@pendragon.ideasonboard.com>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404-uvc-meta-v5-4-f79974fc2d20@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Fri, Apr 04, 2025 at 06:37:37AM +0000, Ricardo Ribalda wrote:
> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
> MSXU_META quirk.

Ah, that's why you introduce a quirk in 3/4.

I would prefer if you could instead add a metadata format field in the
uvc_device structure (I'd put it right after the info field, and while
at it you could move the quirks field to that section too). The metadata
format would be initialized from dev->info (when available) or set to
the UVC format, and overridden when the MSXU is detected.

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 54 ++++++++++++++++++++++++++++++++++++
>  include/linux/usb/uvc.h              |  3 ++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index fe2678fc795d7fd5a64e8113199012f34c419176..776d280f34afad515594a873acf075acf0438304 100644
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
> @@ -187,11 +188,64 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>  	.mmap = vb2_fop_mmap,
>  };
>  
> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
> +
> +#define MSXU_CONTROL_METADATA 0x9
> +static int uvc_enable_msxu(struct uvc_device *dev)

uvc_meta_detect_msxu()

> +{
> +	u32 *data __free(kfree) = NULL;
> +	struct uvc_entity *entity;
> +
> +	list_for_each_entry(entity, &dev->entities, list) {
> +		int ret;
> +
> +		if (memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
> +			continue;
> +
> +		if (!data)
> +			data = kmalloc(sizeof(*data), GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +

A comment here to explain how the control operates would be useful.
Reading the code I assume that GET_MAX will indicate if the MS metadata
format is supported by reporting a value different than 0 (is it always
1, or can it take other values), and SET_CUR will enable metadata
generation. I suppose the first GET_CUR call catches the case where it
has already been enabled, are there also cameras where it can't be
disabled, and where SET_CUR would fail ?

> +		ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (ret)
> +			continue;

Can there be multiple MSXU instances, or can you break here (and below)
?

> +
> +		if (*data) {
> +			dev->quirks |= UVC_QUIRK_MSXU_META;
> +			return 0;
> +		}
> +
> +		ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (ret || !*data)
> +			continue;
> +
> +		ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id,
> +				     dev->intfnum, MSXU_CONTROL_METADATA,
> +				     data, sizeof(*data));
> +		if (!ret) {
> +			dev->quirks |= UVC_QUIRK_MSXU_META;
> +			return 0;
> +		}
> +	}
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
> +	ret = uvc_enable_msxu(dev);
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
> -- 
> 2.49.0.504.g3bcea36a83-goog
> 

-- 
Regards,

Laurent Pinchart

