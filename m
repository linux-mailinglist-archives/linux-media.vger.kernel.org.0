Return-Path: <linux-media+bounces-27396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EFA4C6C7
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35001895865
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF2D243399;
	Mon,  3 Mar 2025 16:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A4wqvR9H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB523AE67;
	Mon,  3 Mar 2025 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018284; cv=none; b=OhBs4u+Joftz3EPv9tmTJ7hRNCahdkVVm/8BchFCGSIjIntzyWTZfndD3SF6e0Em6qd5HdjVJPx8GIJ9NtKtz4QA9vmgLIua2i/OlazLU/lLDSzm+8uAJF8nmkfhfJBjaxsA/hb+xv7ylm6yZZO7z3DEVGS34DUmpb1xm5Al8iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018284; c=relaxed/simple;
	bh=PSFPs/IBq/TYvlszx6zOuUWtMjLdsbK2xz5G1UOnhFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaQuA2j0payDNnYOqLG/XYuHy3jiLxq+wylmUuyB1dfbNSW5xzjLe1fZSTkKgbLWcKwlQOpxYW6H2cEk1xxQzy5JtGRiOZ9fhIC1nl99yDQWiNnBXBKmggefN4nUB1XM7PrbEGnYmo0guvnzr2+KE5BtWXPFLanLiq/pZy+aPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A4wqvR9H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BB1022A;
	Mon,  3 Mar 2025 17:09:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741018189;
	bh=PSFPs/IBq/TYvlszx6zOuUWtMjLdsbK2xz5G1UOnhFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4wqvR9HiVAtXkFdUgZe5BIOFf1UoU4lPo3nBKQEPK96XSid93ZQpCY31G42y6cLC
	 xvDm+BdtLhklXtKnREfetEXzGi3Bv5VfF1MctTwUgfDOfBJllBJDxzZIUCGlNBoLVh
	 D0Q9cLyffCT3YSk3q+jr2kfazKdd9dYB4b6kB2dM=
Date: Mon, 3 Mar 2025 18:10:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
Message-ID: <20250303161059.GA23684@pendragon.ideasonboard.com>
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
 <20250303151346.GC32048@pendragon.ideasonboard.com>
 <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>

On Mon, Mar 03, 2025 at 04:43:50PM +0100, Hans de Goede wrote:
> On 3-Mar-25 16:13, Laurent Pinchart wrote:
> > On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
> >> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
> >>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> >>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> >>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> >>> V4L2_META_FMT_D4XX copies the whole metadata section.
> >>>
> >>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> >>> devices, but it is useful for any device where vendors include other
> >>> metadata, such as the one described by Microsoft:
> >>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >>>
> >>> This patch removes the UVC_INFO_META macro and enables
> >>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
> >>> to reflect the change.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>
> >> Thanks, patch looks good to me:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > I don't quite agree, sorry.
> > 
> > The reason why the current mechanism has been implemented this way is to
> > ensure we have documentation for the metadata format of devices that
> > expose metadata to userspace.
> > 
> > If you want to expose the MS metadata, you can create a new metadata
> > format for that, and enable it on devices that implement it.
> 
> Looking at the long list of quirks this removes just for the D4xx
> cameras I do not believe that having quirked based relaying of
> which metadata fmt is used to userspace is something which scales
> on the long term. Given the large amount of different UVC cameras
> I really think we should move the USB VID:PID -> metadata format
> mapping out of the kernel.

If we can find a solution to ensure the metadata format gets documented,
sure.

When it comes to the MS metadata format, if I recall correctly, Ricardo
said there's an XU with a known GUID to detect the metadata format. We
therefore wouldn't need quirks.

> I do agree that using V4L2_META_FMT_D4XX for every device is
> probably not the best idea. So my suggestion would be to add
> a new V4L2_META_FMT_CUSTOM metadata fmt and for index 1
> metadata fmt use V4L2_META_FMT_D4XX for the currently quirked
> cams and use V4L2_META_FMT_CUSTOM for other cameras.
> 
> This can then be combined with a udev-rule + hwdb to provide
> info of what V4L2_META_FMT_CUSTOM should be mapped to in userspace,
> moving further VID:PID -> extended-metadata fmt mappings out of
> the kernel.
> 
> >>> ---
> >>>  .../userspace-api/media/v4l/metafmt-d4xx.rst       | 19 +++--
> >>>  .../userspace-api/media/v4l/metafmt-uvc.rst        |  6 +-
> >>>  drivers/media/usb/uvc/uvc_driver.c                 | 83 ----------------------
> >>>  drivers/media/usb/uvc/uvc_metadata.c               | 15 ++--
> >>>  drivers/media/usb/uvc/uvcvideo.h                   |  1 -
> >>>  5 files changed, 23 insertions(+), 101 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> index 0686413b16b2..1b18ef056934 100644
> >>> --- a/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/metafmt-d4xx.rst
> >>> @@ -6,12 +6,23 @@
> >>>  V4L2_META_FMT_D4XX ('D4XX')
> >>>  *******************************
> >>>  
> >>> -Intel D4xx UVC Cameras Metadata
> >>> +UVC Full Payload Header Data (formerly known as Intel D4xx UVC Cameras
> >>> +Metadata).
> >>>  
> >>>  
> >>>  Description
> >>>  ===========
> >>>  
> >>> +V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> >>> +V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> >>> +payload header data. It was originally implemented for Intel D4xx cameras, and
> >>> +thus the name, but now it can be used by any UVC device, when userspace wants
> >>> +full access to the UVC Metadata.
> >>> +
> >>> +
> >>> +Intel D4xx Metadata
> >>> +===================
> >>> +
> >>>  Intel D4xx (D435, D455 and others) cameras include per-frame metadata in their UVC
> >>>  payload headers, following the Microsoft(R) UVC extension proposal [1_]. That
> >>>  means, that the private D4XX metadata, following the standard UVC header, is
> >>> @@ -21,10 +32,8 @@ types are MetadataId_CaptureStats (ID 3), MetadataId_CameraExtrinsics (ID 4),
> >>>  and MetadataId_CameraIntrinsics (ID 5). For their description see [1_]. This
> >>>  document describes proprietary metadata types, used by D4xx cameras.
> >>>  
> >>> -V4L2_META_FMT_D4XX buffers follow the metadata buffer layout of
> >>> -V4L2_META_FMT_UVC with the only difference, that it also includes proprietary
> >>> -payload header data. D4xx cameras use bulk transfers and only send one payload
> >>> -per frame, therefore their headers cannot be larger than 255 bytes.
> >>> +D4xx cameras use bulk transfers and only send one payload per frame, therefore
> >>> +their headers cannot be larger than 255 bytes.
> >>>  
> >>>  This document implements Intel Configuration version 3 [9_].
> >>>  
> >>> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> index 784346d14bbd..a3aae580e89e 100644
> >>> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> >>> @@ -6,7 +6,7 @@
> >>>  V4L2_META_FMT_UVC ('UVCH')
> >>>  *******************************
> >>>  
> >>> -UVC Payload Header Data
> >>> +UVC Partial Payload Header Data (formerly known as UVC Payload Header Data).
> >>>  
> >>>  
> >>>  Description
> >>> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> >>>          them
> >>>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> >>>      * - __u8 length;
> >>> -      - length of the rest of the block, including this field
> >>> +      - length of the rest of the block, including this field (please note that
> >>> +        regardless of this value, the driver will never copy more than 12
> >>> +        bytes).
> >>>      * - __u8 flags;
> >>>        - Flags, indicating presence of other standard UVC fields
> >>>      * - __u8 buf[];
> >>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >>> index deadbcea5e22..f19dcd4a7ac6 100644
> >>> --- a/drivers/media/usb/uvc/uvc_driver.c
> >>> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >>> @@ -2488,8 +2488,6 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> >>>  };
> >>>  
> >>>  #define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
> >>> -#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
> >>> -	{.meta_format = m}
> >>>  
> >>>  /*
> >>>   * The Logitech cameras listed below have their interface class set to
> >>> @@ -3107,87 +3105,6 @@ static const struct usb_device_id uvc_ids[] = {
> >>>  	  .bInterfaceSubClass	= 1,
> >>>  	  .bInterfaceProtocol	= 0,
> >>>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> >>> -	/* Intel D410/ASR depth camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0ad2,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D415/ASRC depth camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0ad3,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D430/AWG depth camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0ad4,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel RealSense D4M */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0b03,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D435/AWGC depth camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0b07,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D435i depth camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0b3a,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D405 Depth Camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0b5b,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D455 Depth Camera */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x0b5c,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>> -	/* Intel D421 Depth Module */
> >>> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> >>> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> >>> -	  .idVendor		= 0x8086,
> >>> -	  .idProduct		= 0x1155,
> >>> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> >>> -	  .bInterfaceSubClass	= 1,
> >>> -	  .bInterfaceProtocol	= 0,
> >>> -	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
> >>>  	/* Generic USB Video Class */
> >>>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
> >>>  	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
> >>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> >>> index 82de7781f5b6..5c44e6cdb83c 100644
> >>> --- a/drivers/media/usb/uvc/uvc_metadata.c
> >>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> >>> @@ -60,18 +60,16 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
> >>>  				    struct v4l2_format *format)
> >>>  {
> >>>  	struct v4l2_fh *vfh = file->private_data;
> >>> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> >>> -	struct uvc_device *dev = stream->dev;
> >>>  	struct v4l2_meta_format *fmt = &format->fmt.meta;
> >>> -	u32 fmeta = fmt->dataformat;
> >>> +	u32 fmeta = fmt->dataformat == V4L2_META_FMT_D4XX ?
> >>> +		    V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
> >>>  
> >>>  	if (format->type != vfh->vdev->queue->type)
> >>>  		return -EINVAL;
> >>>  
> >>>  	memset(fmt, 0, sizeof(*fmt));
> >>>  
> >>> -	fmt->dataformat = fmeta == dev->info->meta_format
> >>> -			? fmeta : V4L2_META_FMT_UVC;
> >>> +	fmt->dataformat = fmeta;
> >>>  	fmt->buffersize = UVC_METADATA_BUF_SIZE;
> >>>  
> >>>  	return 0;
> >>> @@ -110,19 +108,16 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
> >>>  				      struct v4l2_fmtdesc *fdesc)
> >>>  {
> >>>  	struct v4l2_fh *vfh = file->private_data;
> >>> -	struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
> >>> -	struct uvc_device *dev = stream->dev;
> >>>  	u32 index = fdesc->index;
> >>>  
> >>> -	if (fdesc->type != vfh->vdev->queue->type ||
> >>> -	    index > 1U || (index && !dev->info->meta_format))
> >>> +	if (fdesc->type != vfh->vdev->queue->type || index > 1U)
> >>>  		return -EINVAL;
> >>>  
> >>>  	memset(fdesc, 0, sizeof(*fdesc));
> >>>  
> >>>  	fdesc->type = vfh->vdev->queue->type;
> >>>  	fdesc->index = index;
> >>> -	fdesc->pixelformat = index ? dev->info->meta_format : V4L2_META_FMT_UVC;
> >>> +	fdesc->pixelformat = index ? V4L2_META_FMT_D4XX : V4L2_META_FMT_UVC;
> >>>  
> >>>  	return 0;
> >>>  }
> >>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>> index 5e388f05f3fc..cc2092ae9987 100644
> >>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>> @@ -534,7 +534,6 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
> >>>  
> >>>  struct uvc_device_info {
> >>>  	u32	quirks;
> >>> -	u32	meta_format;
> >>>  	u16	uvc_version;
> >>>  };
> >>>  
> >>>
> >>> ---
> >>> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
> >>> change-id: 20250226-uvc-metadata-2e7e445966de

-- 
Regards,

Laurent Pinchart

