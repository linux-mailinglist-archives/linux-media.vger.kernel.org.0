Return-Path: <linux-media+bounces-49581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B2BCDEFDE
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 21:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FEBF3005A80
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 20:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB052FB998;
	Fri, 26 Dec 2025 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mFgL1FcN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA2225409
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781748; cv=none; b=uKYYyDEoZNcYBaFwTZRmwLdlfesICgGoEReRDmR9Pi6dQUkvlvalbd8G6Vqy1h2Aw3fVaM6D+5dlCPNLqdkHoCm/s0UjkD8g+7/on57jNlUvrEXuMWc319i54Xc2QsKLKg8keXTpPmelEovcN0J7KGwdIpKj8Kx9hNoxwdBlJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781748; c=relaxed/simple;
	bh=5qMSo5OK3GkQTfZ6aWLlYelTy9I7LjQaxfrYS+qHAEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lARrUPBHmVPgiDtTZz+sp2VyWzW9A1o0uk1VWtgaUQIDcKegfLuXOIY61Xj0BGZVnGeSfGzUOj2GaYHEydPWow2FFnBDytY7oKPUdebNimzo1mOqps/amNRUit+79VDaUMeNwWsEYyKJPk23b0Zdbxqg6SbRoTDlb52cuMKE5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mFgL1FcN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C72641D52;
	Fri, 26 Dec 2025 21:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766781724;
	bh=5qMSo5OK3GkQTfZ6aWLlYelTy9I7LjQaxfrYS+qHAEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFgL1FcNFMhD+hlefHztF/EWtUk5yIv8FswIvSWY27nMDKqIJ2FbObR3xYt3+xSPM
	 2jdbX1ucdCQuu9iyuz2cbObig+jndy5ec10osMhu7KAemUICllPHkRQRR5zPz8vYsJ
	 BdO937cV3DHGAT+RrelTJpIWyPKILsQON5Fy+zfs=
Date: Fri, 26 Dec 2025 22:42:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oliver Collyer <ovcollyer@mac.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Message-ID: <20251226204201.GA4094@pendragon.ideasonboard.com>
References: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
 <20251226065718.95504-1-ovcollyer@mac.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251226065718.95504-1-ovcollyer@mac.com>

Hi Oliver,

Thank you for the patch.

On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
> uvcvideo driver. This format is exposed by USB capture devices such as
> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.

Could you pelase provide the 'lsusb -v' output for that device ?

> P010 stores 10-bit Y and interleaved UV samples in 16-bit little-endian
> words, with data in the upper 10 bits and zeros in the lower 6 bits.
> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
> 
> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
> ("media: Add P010 video format").
> 
> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
> 
> Link: https://lore.kernel.org/linux-media/[email protected]/

Please fix your e-mail setup to avoid this.

> Link: https://github.com/awawa-dev/P010_for_V4L2
> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
> ---
>  drivers/media/common/uvc.c       | 4 ++++
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
>  include/linux/usb/uvc.h          | 3 +++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -109,6 +109,9 @@
>  #define UVC_GUID_FORMAT_M420 \
>  	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_P010 \
> +	{ 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> 
>  #define UVC_GUID_FORMAT_H264 \
>  	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_M420,
>  		.fcc		= V4L2_PIX_FMT_M420,
>  	},
> +	{
> +		.guid		= UVC_GUID_FORMAT_P010,
> +		.fcc		= V4L2_PIX_FMT_P010,
> +	},
>  	{
>  		.guid		= UVC_GUID_FORMAT_UYVY,
>  		.fcc		= V4L2_PIX_FMT_UYVY,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
>  	case V4L2_PIX_FMT_M420:
>  		return frame->wWidth;
> 
> +	case V4L2_PIX_FMT_P010:
> +		return frame->wWidth * 2;
> +
>  	default:
>  		return format->bpp * frame->wWidth / 8;
>  	}

-- 
Regards,

Laurent Pinchart

