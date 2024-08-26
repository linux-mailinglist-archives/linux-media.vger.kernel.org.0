Return-Path: <linux-media+bounces-16812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E795F297
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48743B208C7
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACAB184526;
	Mon, 26 Aug 2024 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sevHCyR2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168D86F31E;
	Mon, 26 Aug 2024 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678152; cv=none; b=X2S5iB6SIQzdOQs/MMkz2389SLydtEnnnXMLA7CVbUsnES7xh4tj+Us/VXbhN42eFzVOwcl4tJC8w+FO6nN3ELZtmJzDWSQokg40RImcy+4M/6zgNawVOpyj8y9I70lEBPu0v17fCKkh57sdSHO/mF+byKkO9kd9fc/3phjGWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678152; c=relaxed/simple;
	bh=bb6nGIfAVCIdUHwf4kLgFk0MoclwjEq5trmOQp1utw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv8IgHlDvUIhTM2yvKNbQq/F6qLzM0cvMzyMGJqEuJo6KUiIHI5rX8yHnXIYAyQKJ3SmsX8DYy/nUeVK/eWLKCr6Y9p3r+tvlhsqDDL/Qe1LUNMjSlMH8goD6j6KwgbYvAK2zX9jLeJsMgHRRZkhEE+8gRKNJs9YCPnpP6X65K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sevHCyR2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35368480;
	Mon, 26 Aug 2024 15:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724678083;
	bh=bb6nGIfAVCIdUHwf4kLgFk0MoclwjEq5trmOQp1utw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sevHCyR2IY2n8W06Q2nc+vNEDKxHR0Fl592KfN2Ir/9poJBaYRHZueLK4z+n9yuTv
	 6itsdBQyhHiOSM5ZKSG55DGkSzJ1r5AMqk+ABcKuxcB48SRkfm4HuXKRUKUKwtmlob
	 n6y0gLItq3AtnjbzjtZsab3HmnlSDfEo420v7L0g=
Date: Mon, 26 Aug 2024 16:15:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@iki.fi, demisrael@gmail.com,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] uvc: Add luma 16-bit interlaced pixel format
Message-ID: <20240826131545.GB11033@pendragon.ideasonboard.com>
References: <c7c24f3f6661e5a01aae4e7ef549801411f063cb.camel@intel.com>
 <a717a912035b0a0f82b2f35719cca0c5269e995f.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a717a912035b0a0f82b2f35719cca0c5269e995f.camel@intel.com>

Hi Dmitry,

Thank you for the patch.

The subject should start with "media: uvcvideo:". I'll update this
locally.

On Mon, Aug 26, 2024 at 04:05:04PM +0300, Dmitry Perchanov wrote:
> The formats added by this patch are:
> 
>         UVC_GUID_FORMAT_Y16I
> 
> Interlaced lumina format primary use in RealSense
> Depth cameras with stereo stream for left and right
> image sensors.
> 
> Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/common/uvc.c | 4 ++++
>  include/linux/usb/uvc.h    | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index c54c2268fee6..027498d37464 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -120,6 +120,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_Y12I,
>  		.fcc		= V4L2_PIX_FMT_Y12I,
>  	},
> +	{
> +		.guid		= UVC_GUID_FORMAT_Y16I,
> +		.fcc		= V4L2_PIX_FMT_Y16I,
> +	},
>  	{
>  		.guid		= UVC_GUID_FORMAT_Z16,
>  		.fcc		= V4L2_PIX_FMT_Z16,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 88d96095bcb1..1c16be20c966 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -118,6 +118,9 @@
>  #define UVC_GUID_FORMAT_Y12I \
>  	{ 'Y',  '1',  '2',  'I', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_Y16I \
> +	{ 'Y',  '1',  '6',  'I', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>  #define UVC_GUID_FORMAT_Z16 \
>  	{ 'Z',  '1',  '6',  ' ', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart

