Return-Path: <linux-media+bounces-39088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C635BB1E448
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FC13B3B84
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6C725A34F;
	Fri,  8 Aug 2025 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJFCf1sk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF918223DE8;
	Fri,  8 Aug 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754641145; cv=none; b=iNBAfUUhromztgqzxisdq+A0XdLILEruF0JIrdrideHrzUtpjgkeibR0Z235wg+3GYuAsBWXAAcnpcbjQkw8y9fSNr1yX0wNhw2gNINuXw04dcDOHJlTHNZCoDD0+AAmiunGqwEweqz0E8H0ImP+fI/VQbyxoRUBtTWUAyAG8OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754641145; c=relaxed/simple;
	bh=dlaV0+CWtx9z9A5sbfTFh4QbrpHCLqzNsy6voTFomUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drSJVFptuD+3DkNQB4Nh4qRDxefEvEnvopWQM08PhktmYIePPzN1Co99vTLy67eYNazc67yju5r4o5eJ9JePblKA33b61mVtDqJ+Qto8DQaXKgmKM3Z0jkc7OneSnuJ91Ssk7U2THf5UJWgDnrDtavDM7UC6frk/5WmdoUT3d+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJFCf1sk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754641144; x=1786177144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dlaV0+CWtx9z9A5sbfTFh4QbrpHCLqzNsy6voTFomUA=;
  b=JJFCf1skKkTpbbVJh2lGNhhXZ+5nxFSXhTJSeYqiehkqJ3tdK4S1GfGu
   xGJ2Gj7mnJWnJ2+lIm5kolHP8JXajPKzY9Q33keUfiPCpZsr6OOF2xYnQ
   LCUSWns3Gym8NRFzgZ2EzXHVrp2d2KrkuiZDwv9U8CBfLTiAVVCHXoGiC
   QIUcKtVCzvJYVoqAO1CiChtazd7UwTyo/Y2L7sf/DLHh1cJk0tB0kJyaX
   GhJcSfi7ZuZqOsVV3qoEhhvbXJjZrNaPd1rBidQsYTn2vSU8/1jM6Wovq
   8wfhNjFkBEw4zALZXusfI8P1rgfKWpvZfw8zUI1RgHltnpJDCMEaW/IYX
   A==;
X-CSE-ConnectionGUID: KxSqgXx7TWmVWBuMiHnjbw==
X-CSE-MsgGUID: 73jTin6vRHiGG/YkM3NqQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56703584"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56703584"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 01:19:03 -0700
X-CSE-ConnectionGUID: +5NcaTMmQxafBeawkcpwaw==
X-CSE-MsgGUID: Uh5NYjTVRAqXA/KynwvHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169487458"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 01:19:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5115611FC45;
	Fri,  8 Aug 2025 11:18:58 +0300 (EEST)
Date: Fri, 8 Aug 2025 08:18:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aJWy8kBkdfqXyXnC@kekkonen.localdomain>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-4-sakari.ailus@linux.intel.com>
 <c8b96c39-ba49-4199-8895-5056efea5dac@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b96c39-ba49-4199-8895-5056efea5dac@rowland.harvard.edu>

Hi Alan,

Thanks for the review.

On Thu, Aug 07, 2025 at 11:19:15AM -0400, Alan Stern wrote:
> On Thu, Aug 07, 2025 at 08:53:54AM +0300, Sakari Ailus wrote:
> > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > 
> > Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> > isochronous endpoints in a USB version independent way.
> 
> Is "bpi" really a commonly recognized acronym?  Offhand, I wouldn't 
> guess that it stands for "bytes per interval".  Can you come up with a 
> more explicit name?

There's not a single canonical name for this as the information is derived
from different sources depending on the USB version. But yes, that's the
abbreviation. I used it because "bytes_per_interval" would be quite long.
"bpi" has also been used by the UVC driver (see the 4th patch).

> 
> > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> > ---
> >  include/linux/usb.h | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 535ac37198a1..da0f51dfe15f 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -2049,6 +2049,37 @@ static inline int usb_translate_errors(int error_code)
> >  	}
> >  }
> >  
> > +/**
> > + * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
> > + * @dev: The USB device
> > + * @ep: The endpoint
> > + *
> > + * Returns: the maximum number of bytes isochronous endpoint @endpoint can
> > + * transfer in during a service interval, or 0 for non-isochronous endpoints.
> > + */
> > +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> > +					    const struct usb_host_endpoint *ep)
> > +{
> > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > +		return 0;
> > +
> > +	switch (dev->speed) {
> > +	case USB_SPEED_SUPER_PLUS:
> > +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> > +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> > +		fallthrough;
> > +	case USB_SPEED_SUPER:
> > +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> > +	case USB_SPEED_HIGH:
> > +		if (ep->eusb2_isoc_ep_comp.bDescriptorType &&
> > +		    !usb_endpoint_maxp(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
> > +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> > +		fallthrough;
> > +	default:
> > +		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
> > +	}
> > +}
> 
> This function is complicated enough that it probably should not be an 
> inline routine.  Not unless it's used in only one place (in which case 
> why define it in a .h file?).

The single user currently (and probably will be for some time at least) is
the UVC driver but this code is better located in the USB tree. I'd keep it
this way until we have more users, unless Mathias can suggest where the
function should be located.

-- 
Kind regards,

Sakari Ailus

