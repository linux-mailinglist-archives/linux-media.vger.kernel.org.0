Return-Path: <linux-media+bounces-37515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD85B01E19
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF69581262
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF052D661F;
	Fri, 11 Jul 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NF/gjBxY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBA52D3EDC;
	Fri, 11 Jul 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241466; cv=none; b=K481j30N+D8bx4+hO/S1J9FaCVdWx0mmFJePxdxih1Wfg3EAFR7vnp+21f0Z8GK+DrklpSSIbIakwNEQD9X/CQOJZvOCAbzHZOnHZ0eW8x/O86MmITbmwXhGYqcqWtK0m+Fjiau6MnzGzrqrMCyQfl75MvD9DqrBfiaUMCXljbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241466; c=relaxed/simple;
	bh=Lf/IG95WTp8moa2Ij3zuvILn4XRSAN4izGIcsF1xt3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byDUvUXwEmDWcsIgoKiTBLCzbDLxoa+pMMRvEZ2IgUX8gGZ9vo7m5GoPaD+uFPoOXk7r5+4/lu/ge4t0dT7PB/heuniiEFCJ6Ff7jD9ICocdE7BbbkCpeArTlt8NdiBjQNpNOq1nbapUrpPwgUK46EZdOC2npIkHDha04a+sTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF/gjBxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E83C4CEF0;
	Fri, 11 Jul 2025 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752241465;
	bh=Lf/IG95WTp8moa2Ij3zuvILn4XRSAN4izGIcsF1xt3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NF/gjBxYzqWAryXdCSx+BVaVXD+YyvLjuIK6tXk2Pu7/oKnGOnZOgvSgwXEeLuImx
	 MIipukm3/aD3bm8kApC1XKo7WBRZmZdtfrq5fUYGVClAwjGqjpzNuyZU/CBKclTC2f
	 W0fzubH8kAWugsLbiVwFHhfpJs1v0ls4kcAwOtWWneT/Mf2T5mtfpRCH2iTGK6yP82
	 EM65ykRYoT11Lv5yxRdnFe9J7rIPvLKavanlQFRJe0lf3mONIT0QOrbpnHVU4h3aDs
	 dcI++LJJjQxj+AXMu7niWoNJT+ZxMCQQkTiDVQSR6+mSugAsV3DosK4MyAfzcXVV8G
	 wyQT5HGlvqotA==
Message-ID: <4ae4a0cf-8b63-4999-941d-011f00cdb5fb@kernel.org>
Date: Fri, 11 Jul 2025 15:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sarari,

On 11-Jul-25 10:34 AM, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.

Nice, thank you for adding a generic helper for this.

> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/linux/usb.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 68166718ab30..bd70bd5ca82d 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
>  	}
>  }
>  
> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> +					    const struct usb_host_endpoint *ep)
> +{
> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> +		return 0;
> +
> +	switch (dev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> +		fallthrough;
> +	case USB_SPEED_SUPER:
> +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> +	case USB_SPEED_HIGH:
> +		if (!usb_endpoint_maxp(&ep->desc) && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);

Shouldn't there be a check here that ep->eusb2_isoc_ep_comp is filled?

Like how the USB_SPEED_SUPER_PLU code above checks
USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)?

I know you check the bcdUSB, but in my experience that field sometimes
contains made up numbers, so I was wondering if there is an extra check
we can do here ?

Regards,

Hans



> +		fallthrough;
> +	default:
> +		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
> +	}
> +}
> +
>  /* Events from the usb core */
>  #define USB_DEVICE_ADD		0x0001
>  #define USB_DEVICE_REMOVE	0x0002


