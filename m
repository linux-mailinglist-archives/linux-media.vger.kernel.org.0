Return-Path: <linux-media+bounces-37748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BAB05441
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DBC74E656B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98534274658;
	Tue, 15 Jul 2025 08:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp06NIga"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D984223DCF;
	Tue, 15 Jul 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567213; cv=none; b=uipDl7CY8+zmrNZR1Sb7bbL/l0Lwr6tIsgec4k1l4sUcC6YEEnKWZZbBM7M0rtk7K0m+EqUf0hcpLQr0jR9vNNDIpXrw91tXWfjZ6u9QIL1coKCYCWW2WOYGYR+yiexda14GhD3hZ5Sm+eI6dMsevqwjDaYWJLfvc+DZbToUnOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567213; c=relaxed/simple;
	bh=xHYP4ip+OpiKa4tdEU+AmTaiP0HRUYCPz8yov5wL8W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd1eHJ4/Odgx+9pisq+wcNFt+T92LI+X6EpNfiSREQhHW96rBP016jMD9lRBz/r1x9aC+3CG2hqpO3O7h7cyJif8A0qF79FFETF/4W2qNPQ96tZePE8yhU0QotheYUtsRRJiwsCqRIYfetCKOVsriiKNTqWV08aHX4oMprp9DSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp06NIga; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752567211; x=1784103211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHYP4ip+OpiKa4tdEU+AmTaiP0HRUYCPz8yov5wL8W0=;
  b=mp06NIga0zxUphYreSeFLQm2FZd81X1Ka7MIXPmUu/duyuGYJEToR0WG
   hC4oblFE+9iY+IDh8y79IZz+fzTxr/t0S8cjfWXLVJFwT2s9aSbcwNH8d
   bLCXoovceS5Z+eBeMczUY+Dev/ieKCKBGlYDLC8B7XetYtb85U5sX4aiO
   brfh1ksQGMzDl8edDJ4E1d7l9nzzKNrQ4mxOXcFbNbA65IJqkdjPvR6Ld
   QnSnPURbT+x6jFjufMhtPmmQutquAm1jjdEnSfng9pwATy6oAHaNI9c2U
   Rd+Y57wBP3lwk1QaPh7zga6A74xrPurYSQv9EvJFsDWgauZFDd4Aus3nG
   Q==;
X-CSE-ConnectionGUID: YWSawCErSpWYBf/Uf8KPbQ==
X-CSE-MsgGUID: yVFSw19dQJG/0BHx3Vk/1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57387738"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="57387738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:13:31 -0700
X-CSE-ConnectionGUID: OtAlGBf2Sg6rpGv2Dh0tfw==
X-CSE-MsgGUID: HrwmXV6STq2o8pqfkqMlrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156811430"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.145])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 01:13:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD6F011F870;
	Tue, 15 Jul 2025 11:13:25 +0300 (EEST)
Date: Tue, 15 Jul 2025 08:13:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <aHYNpTKsnzBwhl3w@kekkonen.localdomain>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
 <4ae4a0cf-8b63-4999-941d-011f00cdb5fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ae4a0cf-8b63-4999-941d-011f00cdb5fb@kernel.org>

Hi Hans,

Thank you for the review.

On Fri, Jul 11, 2025 at 03:44:21PM +0200, Hans de Goede wrote:
> Hi Sarari,
> 
> On 11-Jul-25 10:34 AM, Sakari Ailus wrote:
> > From: "Rai, Amardeep" <amardeep.rai@intel.com>
> > 
> > Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> > isochronous endpoints in a USB version independent way.
> 
> Nice, thank you for adding a generic helper for this.
> 
> > Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/linux/usb.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 68166718ab30..bd70bd5ca82d 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
> >  	}
> >  }
> >  
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
> > +		if (!usb_endpoint_maxp(&ep->desc) && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
> > +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> 
> Shouldn't there be a check here that ep->eusb2_isoc_ep_comp is filled?
> 
> Like how the USB_SPEED_SUPER_PLU code above checks
> USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)?
> 
> I know you check the bcdUSB, but in my experience that field sometimes
> contains made up numbers, so I was wondering if there is an extra check
> we can do here ?

In the case of eUSB2, there's no such flag as for the SuperSpeedPlus
Isochronous Endpoint Companion. The eUSB2 Isochronous Endpoint Companion
Descriptor is simply expected to be present on eUSB2 (bcdUSB check)
isochronous IN endpoints that support more than 3KB per microframe.

Also what the USB_SS_SSP_ISOC_COMP() macro returns actually dependens on
the device telling there's such a descriptor but it's still different from
the device actually providing one. But what would you do if the device
indicates it provides no SSP_ISOC_COMP descriptor but still does provide
one?

How about adding a flag (or maybe a bit field?) to tell which endpoint
descriptors have been actually filled in struct usb_host_endpoint? I might
do that as a separate patch on top...

I wonder what Mathias thinks, too.

-- 
Kind regards,

Sakari Ailus

