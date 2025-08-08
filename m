Return-Path: <linux-media+bounces-39129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D9B1EB62
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 17:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105403AF4FE
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 15:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24CD28152F;
	Fri,  8 Aug 2025 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="u+b/fp+/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725141AF0A4
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666189; cv=none; b=ReF7uDgJf5m2cKCm7jUizqNMuvks1SwcwusSltj+jpDbMffjpjDAZqcRUGB6LMMiNYsg3/8NYSbp7hAFgP9bn+Y35rJVsL+uc0VNFUUp4//1KYltClAUv7MUxixIBFr986PYiKbeMRV8v7AvOZtqaTOef1wcHr1kEHbAWLeCFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666189; c=relaxed/simple;
	bh=C1eiOGMryBZEeuiqjGGSjLZkOUXz8Fls4NkvLRIQl9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDk0VaNTLYpAiO8Jo60ppLqK3E6+U+I4N5NjRbMjkMRdNk1qiEcGI7D+OfLbuj1qCOmNb0LxSs/DZLWdPhdCLdOwh7zl7i8DRH/akRJeV3MfuMTq3hFEs0ytNMY3pqN9iWzn9L61ftltZLLoHANjzBGpJ9QPZ2oki6pa6cVDCWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=u+b/fp+/; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e699c5b110so229456185a.1
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754666186; x=1755270986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrpLS7ub1/jTR9r0sHqDe6O2rdRMC0CZ7xVhxnjs+JM=;
        b=u+b/fp+/ImyiixtXL1O2ehIugMPxTfuAtZfOgGbCArT0riBNhW7o4d+rr6lhAa0u5k
         hlZbrU8pWWxZBTUI2iL64AwDp/ciGS23C0gVuFYfULDNKd0vPzOMbcdqZIUcPzVxEZqD
         cqZVvDdilkum2xIXZ60XC0r/AA5e+/+7+ROt9kMm30iK9wSviQvcjDhV9oZ/38L1yWkm
         wO+NJt/bXdEofrEfSkXzvWfoRzEVfa3npY3bTUl0teQNaQNcrqz33lUx6a01xXt+sfRX
         VOJWcrPF/uA6hSznYo4KhSB2rmuoMJ7dme69/7ryuBb25vtTboMGv/whBzfy2ErkPWAg
         +ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754666186; x=1755270986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrpLS7ub1/jTR9r0sHqDe6O2rdRMC0CZ7xVhxnjs+JM=;
        b=ZCAPqzFf+i6+4CCw/JU+ULWH6qjd6B2yJ3j5DmYEMXvfrnWcJyOWwh+Ie3r2LgzwY+
         Jx2ninJ4AhDI28OxfMJv58E5EM5oEYL6nIo3EI1j1ranFSjvzo1UYCAGbNhlDhN2tMmk
         Ed3xHRfL8HmaNEixvQhpt+yfrYDEpTGkPEe5A3UtEgizLM0b4Yx2aqkEdsi3tKZ82K5B
         g3OrYdTvEwfyeq2XSXRyjtSCCu7WH7skp6mR7j889myv7+vtDeMmNP1BJGJjRvG+GtvE
         dJ59Bm9rnwxpFwCO5fKre5mNMJFFWtJvrRwXPm/KGzfZSmafA0WIFP8tb8nYKECGxzWl
         3RMg==
X-Forwarded-Encrypted: i=1; AJvYcCVo2dhN9x/gAUI/PDfDZgv1C2arBicR/rihgYf1S6SNAWLmTaBLK59+8ZOIZvQvtj90/AJcmMCx6M+FXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZAN7Dmj8+AFWx5tQJjlhtAc4ly9MvJeHwuLNkwK5iA8sfWDI
	rlEE7yIu7AY3lAQRLx2EN44yzOIQ1NLstSdL55oX5Y9vhmY3kJngclu6dfwTIMmtJA==
X-Gm-Gg: ASbGncuSmXumQaJm8tZ2Ed6VO7SyanXxmOpd1UgfnDocYCr3QPu/Ls+PVXlazgA+8lk
	TX/A4ZWaSbamXU+8obx4UyMn7lIQzJFpuXCqAQfBuX6thJmVfJ3e4bSXMEjV1OfV8YCpz76y3Zh
	06ow4EzIccu9uTSTifIQIi+I6Bb6Pmmli3WchlCFG5AYeEzaWGXRPmZj7D/mMD86LkgPcC7XmAI
	mqMKX0BIFlNXQu9IocOdaQt3x9+E8D0FLztO3dfVaMG/Lqj2e+Gax2+e/ZPrmtZOjir7v6GFupC
	vmWjXqYPiX1uv4DfZw/vfSpCAw3pg2uD9aDzeRPdcOFdIN/GN9cYpDYkULXAPh6FlPUunF44Vyy
	iPbCE3veZkYMxTz5RnLypBjA=
X-Google-Smtp-Source: AGHT+IF1XOPyKtoNC3vsKguZwakNM71etjLmn6eawwJ32LG9xW1wZuBrRaRJ5g0hbwDNzEss8yQo7A==
X-Received: by 2002:a05:620a:4917:b0:7e8:1b9a:fd57 with SMTP id af79cd13be357-7e82d4ccdaamr321234185a.23.1754666186036;
        Fri, 08 Aug 2025 08:16:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594228sm1116344685a.11.2025.08.08.08.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 08:16:25 -0700 (PDT)
Date: Fri, 8 Aug 2025 11:16:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <5668be30-8b01-4e9a-8eb8-e9098de24e4e@rowland.harvard.edu>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-4-sakari.ailus@linux.intel.com>
 <c8b96c39-ba49-4199-8895-5056efea5dac@rowland.harvard.edu>
 <aJWy8kBkdfqXyXnC@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJWy8kBkdfqXyXnC@kekkonen.localdomain>

On Fri, Aug 08, 2025 at 08:18:58AM +0000, Sakari Ailus wrote:
> > >  
> > > +/**
> > > + * usb_endpoint_max_isoc_bpi - Get maximum isochronous transfer bytes per interval
> > > + * @dev: The USB device
> > > + * @ep: The endpoint
> > > + *
> > > + * Returns: the maximum number of bytes isochronous endpoint @endpoint can
> > > + * transfer in during a service interval, or 0 for non-isochronous endpoints.
> > > + */
> > > +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> > > +					    const struct usb_host_endpoint *ep)
> > > +{
> > > +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> > > +		return 0;
> > > +
> > > +	switch (dev->speed) {
> > > +	case USB_SPEED_SUPER_PLUS:
> > > +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
> > > +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> > > +		fallthrough;
> > > +	case USB_SPEED_SUPER:
> > > +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> > > +	case USB_SPEED_HIGH:
> > > +		if (ep->eusb2_isoc_ep_comp.bDescriptorType &&
> > > +		    !usb_endpoint_maxp(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
> > > +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> > > +		fallthrough;
> > > +	default:
> > > +		return usb_endpoint_maxp(&ep->desc) * usb_endpoint_maxp_mult(&ep->desc);
> > > +	}
> > > +}
> > 
> > This function is complicated enough that it probably should not be an 
> > inline routine.  Not unless it's used in only one place (in which case 
> > why define it in a .h file?).
> 
> The single user currently (and probably will be for some time at least) is
> the UVC driver but this code is better located in the USB tree. I'd keep it
> this way until we have more users, unless Mathias can suggest where the
> function should be located.

Okay.  But in the meantime, how about putting just a declaration for 
this function in include/linux/usb.h and putting the actual (non-inline) 
definition in drivers/usb/core/usb.c, or in drivers/usb/common/common.c 
if you think the function would be used in gadget-side drivers as well 
as host-side drivers?

Alan Stern

