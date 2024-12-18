Return-Path: <linux-media+bounces-23744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC09F70C4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E3D16DE94
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 23:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E5F1FD7AC;
	Wed, 18 Dec 2024 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jF2CjRii"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249541FCD0F;
	Wed, 18 Dec 2024 23:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734564422; cv=none; b=pBnepnxCjd2zALrbiGwjs5dR5o/5p9xrvCyqy9W1RSQsd5GnwFf+Uf0o1gC+fxXNSlO8NXlE37TBUhiktiD7zXJILpuPq36MOly1zPpyaTZjudLj4KFjhfLazlfVGXUkK6hYk0HzdcI5IJVZOtbYnVmaCRCI9fJNdp+2f/vg/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734564422; c=relaxed/simple;
	bh=5X3i3H8x7f8KnbH5T91cphGYyqvcipLKUHTKUMvcpHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irTsde3IHvp23At2g9N5QElSvrrIQkx9OLyIySpSicTQuYgjKRDDhAHCw95FnBDuOQpkLrnHJ9wIcKsidxwAbyuoXI0OAvykss3OHizWydRFUoM3Egr7ovoTrBUEZZuf4ic4rdxrBWW65KpQoexM3XCsgN/+NaqGbI8CTXegd4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jF2CjRii; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28479163;
	Thu, 19 Dec 2024 00:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734564381;
	bh=5X3i3H8x7f8KnbH5T91cphGYyqvcipLKUHTKUMvcpHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jF2CjRiigtcwlmpK36dMGGwV1rlbR0CsQnWm9KNJAHmWVR+dd+mzGZU4ls9rexRI8
	 EoISrVDc7PapTBTqCe/LQdCUiaX4NdDLupFtWb5smATLrskhVjGbtwJb0U8OYiQXKQ
	 88ZIqnMxps17LUfposF9/4SWd6URnqt7+H+MaQi4=
Date: Thu, 19 Dec 2024 01:26:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Invert default value for nodrop
 module param
Message-ID: <20241218232656.GB5518@pendragon.ideasonboard.com>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
 <20241218-uvc-deprecate-v2-2-ab814139e983@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-uvc-deprecate-v2-2-ab814139e983@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Dec 18, 2024 at 09:39:09PM +0000, Ricardo Ribalda wrote:
> The module param `nodrop` defines what to do with frames that contain an
> error: drop them or sending them to userspace.
> 
> The default in the rest of the media subsystem is to return buffers with
> an error to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
> In UVC we drop buffers with errors by default.
> 
> Change the default behaviour of uvcvideo to match the rest of the
> drivers and maybe get rid of the module parameter in the future.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b3c8411dc05c..091145743872 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -32,7 +32,7 @@
>  
>  unsigned int uvc_clock_param = CLOCK_MONOTONIC;
>  unsigned int uvc_hw_timestamps_param;
> -unsigned int uvc_no_drop_param;
> +unsigned int uvc_no_drop_param = 1;
>  static unsigned int uvc_quirks_param = -1;
>  unsigned int uvc_dbg_param;
>  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;

-- 
Regards,

Laurent Pinchart

