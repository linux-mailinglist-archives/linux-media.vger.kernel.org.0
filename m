Return-Path: <linux-media+bounces-37888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EEB07B4A
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 18:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29215582F62
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 16:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16D42F5466;
	Wed, 16 Jul 2025 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOwfSEmE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F2433AC;
	Wed, 16 Jul 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752683729; cv=none; b=USTbhUsh8buy8y05nnrbaWu+6dW1NGuWwnKgC8DbuZFMRAn64UmcRanKD29AhqFyOyVt/HqskQYs3nm2PhaFWZjgPPffSeAoYITt3ygvoGppOWw/qfHYnhkcNsGKXK+7JfobXOIE3oY+IbA5/kXuHQWlIjefu61dpY9OapbUEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752683729; c=relaxed/simple;
	bh=wKYXNfNFlYSsEzFHoBVVKENlvhX4Yr8nQs3M3eAprjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rkh6ZrTy1PL3tA89xpvfUyKUZb+N1AkIPRekDnUhyjo66RlsXWuEzUVXUtzVDhb2GK4abytOsBX2jw5lJCykcaO1KxTMRkndbICxcJ/HzEVepoIt8J7jAJI4YkDIzjxCD4m+0HRjw7RZr3vmekUKP4qZ0O3ei/kAnCW3FkniKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOwfSEmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF49C4CEE7;
	Wed, 16 Jul 2025 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752683728;
	bh=wKYXNfNFlYSsEzFHoBVVKENlvhX4Yr8nQs3M3eAprjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mOwfSEmE+QyO0CawO9Xlv9HhI5z8QB+FytojLywkbojaVWxY3hH7QennW72W/XhAd
	 MZbLUZ6IAU1rtjGpDCoMoTo4vSyfXS1L3FQi6brWvxHyumT6WHbQrmxq4MjLnEzfOD
	 GLYKpfk92HRj0Nnn2WR4OzLoaliBWDfOgcyOgPThbt72LtK3X4/h3VqGBq4gflKQgR
	 p9hGF0/gYc1m+Kmc+0erN00ihsrNFJp6Wk994whIPm2KIF9UngEXgp3cdXpYr3tj4D
	 1KObhZS3BPOP3QVMgQuY/wS+aHAPfaFjb/CP3coavsas5OGaxzECfjGrcnu0LNSsil
	 8XdwMqwPVPgKA==
Message-ID: <f8502b45-967d-4377-88a3-bbfb3decad95@kernel.org>
Date: Wed, 16 Jul 2025 18:35:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
 <4ae4a0cf-8b63-4999-941d-011f00cdb5fb@kernel.org>
 <aHYNpTKsnzBwhl3w@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aHYNpTKsnzBwhl3w@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 15-Jul-25 10:13 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the review.
> 
> On Fri, Jul 11, 2025 at 03:44:21PM +0200, Hans de Goede wrote:
>> Hi Sarari,
>>
>> On 11-Jul-25 10:34 AM, Sakari Ailus wrote:
>>> From: "Rai, Amardeep" <amardeep.rai@intel.com>
>>>
>>> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
>>> isochronous endpoints in a USB version independent way.
>>
>> Nice, thank you for adding a generic helper for this.
>>
>>> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  include/linux/usb.h | 22 ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>
>>> diff --git a/include/linux/usb.h b/include/linux/usb.h
>>> index 68166718ab30..bd70bd5ca82d 100644
>>> --- a/include/linux/usb.h
>>> +++ b/include/linux/usb.h
>>> @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
>>>  	}
>>>  }
>>>  
>>> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
>>> +					    const struct usb_host_endpoint *ep)
>>> +{
>>> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
>>> +		return 0;
>>> +
>>> +	switch (dev->speed) {
>>> +	case USB_SPEED_SUPER_PLUS:
>>> +		if (USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes))
>>> +			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
>>> +		fallthrough;
>>> +	case USB_SPEED_SUPER:
>>> +		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
>>> +	case USB_SPEED_HIGH:
>>> +		if (!usb_endpoint_maxp(&ep->desc) && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
>>> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
>>
>> Shouldn't there be a check here that ep->eusb2_isoc_ep_comp is filled?
>>
>> Like how the USB_SPEED_SUPER_PLU code above checks
>> USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)?
>>
>> I know you check the bcdUSB, but in my experience that field sometimes
>> contains made up numbers, so I was wondering if there is an extra check
>> we can do here ?
> 
> In the case of eUSB2, there's no such flag as for the SuperSpeedPlus
> Isochronous Endpoint Companion. The eUSB2 Isochronous Endpoint Companion
> Descriptor is simply expected to be present on eUSB2 (bcdUSB check)
> isochronous IN endpoints that support more than 3KB per microframe.
> 
> Also what the USB_SS_SSP_ISOC_COMP() macro returns actually dependens on
> the device telling there's such a descriptor but it's still different from
> the device actually providing one. But what would you do if the device
> indicates it provides no SSP_ISOC_COMP descriptor but still does provide
> one?
> 
> How about adding a flag (or maybe a bit field?) to tell which endpoint
> descriptors have been actually filled in struct usb_host_endpoint? I might
> do that as a separate patch on top...

Adding a bit-field with which endpoint descriptors have actually
been filled sounds like a good idea.

I also agree with doing that as a follow-up patch and moving forward with
this patch as is, so:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



