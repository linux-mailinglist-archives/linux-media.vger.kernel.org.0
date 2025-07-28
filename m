Return-Path: <linux-media+bounces-38596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE4B1445C
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 00:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0E818C24F7
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 22:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B9A2248B8;
	Mon, 28 Jul 2025 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtUdo9EC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7A1E4AB;
	Mon, 28 Jul 2025 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753741313; cv=none; b=bZJABLrZetYpjKNvvSGox8ryfnTf5A4ncG7tNkEO3RmTBP8Q6q2/9xxjagFPyBX7JO/8QIYOxhTizVlWqJPX6WdlPAZd6bzA10cOQziL/umN1v+O9GRhmXL866/SQG6EU5lBmljQR8PY4kzshdzImrnPH4Uyp7zUaAZw/S7wKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753741313; c=relaxed/simple;
	bh=FAvyqAwjVQrVisvFktnzBMxF4I8aeCcPbJFIZI3v1jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FijLIKDzb5o87vvSDMfHPE2NzIMA7lh+rBdPoVuw+mUwS+fKsYnCZR4jv6W+07gAxL+R9XLz5bL8rwfPRvrqvTF6zEpf/oN9ve+eRyWhRTSIiUY+tzmBQ7aLsgNZu08SwwdBBAFbuaH8PBMo7V68nlOcTIN3KNNrC499dnXLqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtUdo9EC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753741311; x=1785277311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FAvyqAwjVQrVisvFktnzBMxF4I8aeCcPbJFIZI3v1jY=;
  b=AtUdo9ECjq76MYnXRIOf/qo3t0pRNGxiSZMbkPXdz7MADPecbjXOAh03
   qGbFMaCzFPmmJhUb5xKYFN28Pd8y9XqV3io7olFtpMIwWZG5Q6cx4KnfU
   J6fX2QumCqX6URTuDf27xD57Ril0/DE82/s3i3dekfxuyXbtqes+Ef35V
   BWkRSUPWx3/Q6DXKpOdZ3ENCW7sC6SJoPqodeTG+IqvycX33u7iUb2a9l
   T2zHQclYyxUBxnfWJ3oVaNzln2jqpBcb0766Ojgx7Yy2xlnLWa6G15R0T
   vk0atCbdIkMkJWm4eDJBDFhqPYYIzFIk4Do3T/Cz80cFSs1gcMTQrpV9c
   Q==;
X-CSE-ConnectionGUID: gPw37YKIQOGuy368i+qDdg==
X-CSE-MsgGUID: mW4T8ZRPT1KMmLlzEj/y4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66272034"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66272034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 15:21:51 -0700
X-CSE-ConnectionGUID: PZsbSpSiTimNRiA24MXe6Q==
X-CSE-MsgGUID: zPAcBhK1RqKoO7B8y7QZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="199672228"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 15:21:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C220911FC49;
	Tue, 29 Jul 2025 01:21:45 +0300 (EEST)
Date: Mon, 28 Jul 2025 22:21:45 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aIf3-W1d_-Cn2Yt-@kekkonen.localdomain>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
 <4ae4a0cf-8b63-4999-941d-011f00cdb5fb@kernel.org>
 <aHYNpTKsnzBwhl3w@kekkonen.localdomain>
 <f8502b45-967d-4377-88a3-bbfb3decad95@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8502b45-967d-4377-88a3-bbfb3decad95@kernel.org>

Hi Hans,

On Wed, Jul 16, 2025 at 06:35:24PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 15-Jul-25 10:13 AM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thank you for the review.
> > 
> > On Fri, Jul 11, 2025 at 03:44:21PM +0200, Hans de Goede wrote:
> >> Hi Sarari,
> >>
> >> On 11-Jul-25 10:34 AM, Sakari Ailus wrote:
> >>> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> >>>
> >>> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> >>> isochronous endpoints in a USB version independent way.
> >>
> >> Nice, thank you for adding a generic helper for this.
> >>
> >>> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> >>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >>> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  include/linux/usb.h | 22 ++++++++++++++++++++++
> >>>  1 file changed, 22 insertions(+)
> >>>
> >>> diff --git a/include/linux/usb.h b/include/linux/usb.h
> >>> index 68166718ab30..bd70bd5ca82d 100644
> >>> --- a/include/linux/usb.h
> >>> +++ b/include/linux/usb.h
> >>> @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
> >>>  	}
> >>>  }
> >>>  
> >>> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> >>> +					    const struct usb_host_endpoint *ep)
> >>> +{
> >>> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> >>> +		return 0;
> >>> +
> >>> +	switch (dev->speed) {
> >>> +	case USB_SPEED_SUPER_PLUS:
> >>> +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> >>> +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> >>> +		fallthrough;
> >>> +	case USB_SPEED_SUPER:
> >>> +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> >>> +	case USB_SPEED_HIGH:
> >>> +		if (!usb_endpoint_maxp(&ep->desc) && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
> >>> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> >>
> >> Shouldn't there be a check here that ep->eusb2_isoc_ep_comp is filled?
> >>
> >> Like how the USB_SPEED_SUPER_PLU code above checks
> >> USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)?
> >>
> >> I know you check the bcdUSB, but in my experience that field sometimes
> >> contains made up numbers, so I was wondering if there is an extra check
> >> we can do here ?
> > 
> > In the case of eUSB2, there's no such flag as for the SuperSpeedPlus
> > Isochronous Endpoint Companion. The eUSB2 Isochronous Endpoint Companion
> > Descriptor is simply expected to be present on eUSB2 (bcdUSB check)
> > isochronous IN endpoints that support more than 3KB per microframe.
> > 
> > Also what the USB_SS_SSP_ISOC_COMP() macro returns actually dependens on
> > the device telling there's such a descriptor but it's still different from
> > the device actually providing one. But what would you do if the device
> > indicates it provides no SSP_ISOC_COMP descriptor but still does provide
> > one?
> > 
> > How about adding a flag (or maybe a bit field?) to tell which endpoint
> > descriptors have been actually filled in struct usb_host_endpoint? I might
> > do that as a separate patch on top...
> 
> Adding a bit-field with which endpoint descriptors have actually
> been filled sounds like a good idea.
> 
> I also agree with doing that as a follow-up patch and moving forward with
> this patch as is, so:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>

Thanks.

The descriptors appear to already have bDescriptorType field which can tell
the same -- it's non-zero for the valid ones. I think I'll use that instead
of adding new ones.

-- 
Regards,

Sakari Ailus

