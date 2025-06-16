Return-Path: <linux-media+bounces-34889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F83ADAC31
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CFDE1715EA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936D0273D95;
	Mon, 16 Jun 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eXO0ByPt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FFD202961;
	Mon, 16 Jun 2025 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067059; cv=none; b=VKYNUySELcv7fRdVZWu+tJdr/8SLpgesdUTysAF6eynAP3ws4Y6f3h8LgYpUSVmyRzIybMYAqzkU0MjnGALw21U+oFAnXpRICR54SUb+RKIW5UbDD/Ca8W58f2UK3vR4A4VZsqMX6amCRufR5XgUQfemry+XPZRCeCPs9R9v7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067059; c=relaxed/simple;
	bh=frCEfHv6OqR8dJTEQkdOVPGOQZWF4b5ktJXntVHwAyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGLb05hhzGGeX58S2L6kFnotQaIgiwjjoMb4ChswzUF4gxo+iiXpP1kFhWVJyJt05V+/+Te6ZbNHwSSmLy424McnJYCK3HZTfCaJnlWJxkxWN7tXS9vu6kPeWeWnCdEgJJ3oXiF1K0kOBwyX94XhTYKftd1EjcIMLoijKSPLQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eXO0ByPt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CC4EB2B;
	Mon, 16 Jun 2025 11:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750067043;
	bh=frCEfHv6OqR8dJTEQkdOVPGOQZWF4b5ktJXntVHwAyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXO0ByPtfq/px/hJ236rQxa5Xol7j2fy1L0qovishXZSYmeUMaBmXWFUSbfZMBUSo
	 c+BURUlmJBRbzw4r92ih+He3pZS1+00IsUtLulvqxUp3fNRU6Id80kFCvOUzaJTLau
	 6FKH+yioCPAqphN+cNcg/RrmjrxBYEt2+4VuXhf4=
Date: Mon, 16 Jun 2025 12:43:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Tao Q Tao <tao.q.tao@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: eUSB2 double isochronous bandwidth
 support
Message-ID: <20250616094359.GB32454@pendragon.ideasonboard.com>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
 <20250616093730.2569328-4-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616093730.2569328-4-mathias.nyman@linux.intel.com>

Hi Mathias,

Thank you for the patch.

On Mon, Jun 16, 2025 at 12:37:30PM +0300, Mathias Nyman wrote:
> From: Tao Q Tao <tao.q.tao@intel.com>
> 
> Add eUSB2 support to check total number of bytes, isochronous endpoint
> will transfer every service interval(SI).
> 
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a888f84208c6 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1906,6 +1906,11 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
>  	case USB_SPEED_SUPER:
>  	case USB_SPEED_SUPER_PLUS:
>  		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> +	case USB_SPEED_HIGH:
> +		psize = usb_endpoint_maxp(&ep->desc);
> +		if (psize == 0 && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +		fallthrough;

Instead of adding yet another case here, and eventually in a bunch of
other drivers, could we centralize retrieval of the maximum bpi value in
a helper function provided by the USB core ?

>  	default:
>  		psize = usb_endpoint_maxp(&ep->desc);
>  		psize *= usb_endpoint_maxp_mult(&ep->desc);

-- 
Regards,

Laurent Pinchart

