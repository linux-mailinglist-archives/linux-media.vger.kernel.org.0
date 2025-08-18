Return-Path: <linux-media+bounces-40175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB4B2ACD1
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D2F81965850
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F8120B7ED;
	Mon, 18 Aug 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDhK59G7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E9238C33;
	Mon, 18 Aug 2025 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531029; cv=none; b=n1jQR19IDElGKmzCcNAGSLch1+TyhUpo3HTmeaAghCeXjZvgHs5/+YCI9ORKcg7lqMSYRN1vkr0Mz0W/8VTKixbn9EqsO71gQ3sleFhPLNeRqN5rTN9JZjcOPU6sw0yCkyEcx6nI5zzwQuZYDR8m7o5kHu8D8zoWw2L83RanPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531029; c=relaxed/simple;
	bh=PAs2zYadfrbseuYPwD0Hazw8SUYlBpAdgjoSnNNJ3Y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1YaFGAHDD4T8kfx1019zyO/jef04pL0U8USLphNHcwBareZAo0h1D+EM2fHp/rqA6fWErFkaFAGqJlt9jZhQMUuq+JUZAUNhDHcyfAi4/wpzAMAjz6xrUtYkoaV+dZ0VtULXDsohiwikt7od88LMAkU8tKZKqnL+ynFhegm+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDhK59G7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755531028; x=1787067028;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PAs2zYadfrbseuYPwD0Hazw8SUYlBpAdgjoSnNNJ3Y8=;
  b=NDhK59G7H1f9X1w734NI2YzTkAgnUCLlxogKFpRyQ1SXVyiQvjQdR+81
   MVy2XwPbfc4hHFqoaWMfGkQC09+uODsqioLol+qNki8dEJSitXheBgeek
   A6qdifMmGABtXQzpf1UL/Y3mYyr2W9eZTUnXyuqDrqsdaEaLnOzz69jMg
   /cd1Efwt/bSPjW42OVZy7lQeS0VzGOTE6evfl4RlK6ViWelw+oUaC1uRj
   r67+hhjsP75RC6E8hG9zR0vlPtaOeaT4SzlFs3VKyut8+dFBkHiFEiuae
   RMs3iTKu3I445gORikjQJ5Uyn+RNMj/UBFkNzjkum2r0oRV0bdBeRosYU
   g==;
X-CSE-ConnectionGUID: YCagSAT0R1iTjdiswZEsuA==
X-CSE-MsgGUID: 2x3j4BFpQNSbSaelnBvETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57685440"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57685440"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 08:30:27 -0700
X-CSE-ConnectionGUID: Cs3JZOZ+QTuZc0ySPR1+aA==
X-CSE-MsgGUID: +sHnTrqtQnicb2jz/9g5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167115940"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 08:30:24 -0700
Message-ID: <1096ce5c-ac0a-49e0-9030-31c87c71b3c0@linux.intel.com>
Date: Mon, 18 Aug 2025 18:30:23 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
 Amardeep Rai <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>,
 Alan Stern <stern@rowland.harvard.edu>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
 <20250812132445.3185026-2-sakari.ailus@linux.intel.com>
 <20250818115016.3611b910@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250818115016.3611b910@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.8.2025 12.50, Michał Pecio wrote:
> On Tue, 12 Aug 2025 16:24:42 +0300, Sakari Ailus wrote:
>> From: "Rai, Amardeep" <amardeep.rai@intel.com>
>>
>> Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
>> xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
>> ESIT Payload' to enable the double isochronous bandwidth endpoints.
>>
>> Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
>> endpoints even if hosts supporting Large ESIT Payload Capability should
>> normally ignore the mult field.
>>
>> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
>> Co-developed-by: Kannappan R <r.kannappan@intel.com>
>> Signed-off-by: Kannappan R <r.kannappan@intel.com>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-caps.h |  2 ++
>>   drivers/usb/host/xhci-mem.c  | 60 ++++++++++++++++++++++++++++--------
>>   drivers/usb/host/xhci-ring.c |  6 ++--
>>   drivers/usb/host/xhci.c      | 16 +++++++++-
>>   drivers/usb/host/xhci.h      | 19 ++++++++++++
>>   5 files changed, 87 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
>> index 4b8ff4815644..89bc83e4f1eb 100644
>> --- a/drivers/usb/host/xhci-caps.h
>> +++ b/drivers/usb/host/xhci-caps.h
>> @@ -89,3 +89,5 @@
>>   #define HCC2_GSC(p)             ((p) & (1 << 8))
>>   /* true: HC support Virtualization Based Trusted I/O Capability */
>>   #define HCC2_VTC(p)             ((p) & (1 << 9))
>> +/* true: HC support Double BW on a eUSB2 HS ISOC EP */
>> +#define HCC2_EUSB2_DIC(p)       ((p) & (1 << 11))
> 
> I guess this bit is not defined in the original xHCI 1.2 spec which
> predates BW doubling, any reference to where it is specified and what
> it means exactly?

USB 2.0 Double Isochronous IN Bandwidth Capability (DIC) – RO.
This bit when set to 1, indicates that the xHC supports the USB 2.0 Double Isochronous IN
Bandwidth Capability on a eUSB2 HS Isochronous Endpoint.
This feature is only applicable to a directly connected inbox native eUSB2 device.

The xHCI specification with this addition is on its way, we got permission from
author(s) to start upstreaming the code already.

> 
>> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
>> index 6680afa4f596..ea51434c80fa 100644
>> --- a/drivers/usb/host/xhci-mem.c
>> +++ b/drivers/usb/host/xhci-mem.c
>> @@ -1328,18 +1328,36 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
>>   	return interval;
>>   }
>>   
>> -/* The "Mult" field in the endpoint context is only set for SuperSpeed isoc eps.
>> +/*
>> + * xHCs without LEC use the "Mult" field in the endpoint context for SuperSpeed
>> + * isoc eps, and High speed isoc eps that support bandwidth doubling. Standard
>>    * High speed endpoint descriptors can define "the number of additional
>>    * transaction opportunities per microframe", but that goes in the Max Burst
>>    * endpoint context field.
>>    */
>> -static u32 xhci_get_endpoint_mult(struct usb_device *udev,
>> -		struct usb_host_endpoint *ep)
>> +static u32 xhci_get_endpoint_mult(struct xhci_hcd *xhci,
>> +				  struct usb_device *udev,
>> +				  struct usb_host_endpoint *ep)
>>   {
>> -	if (udev->speed < USB_SPEED_SUPER ||
>> -			!usb_endpoint_xfer_isoc(&ep->desc))
>> +	bool lec;
>> +
>> +	/* xHCI 1.1 with LEC set does not use mult field, except intel eUSB2 */
>> +	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
>> +
>> +	/* eUSB2 double isoc bw devices are the only USB2 devices using mult */
>> +	if (xhci_eusb2_is_isoc_bw_double(udev, ep)) {
>> +		if (!lec || xhci->quirks & XHCI_INTEL_HOST)
>> +			return 1;
>> +	}
>> +
>> +	/* Oherwise only isoc transfers on hosts without LEC uses mult field */
>> +	if (!usb_endpoint_xfer_isoc(&ep->desc) || lec)
>>   		return 0;
>> -	return ep->ss_ep_comp.bmAttributes;
>> +
>> +	if (udev->speed >= USB_SPEED_SUPER)
>> +		return ep->ss_ep_comp.bmAttributes;
>> +
>> +	return 0;
>>   }
> 
> That's a complicated control flow. I think it could just be:
>> +	/* SuperSpeed isoc transfers on hosts without LEC uses mult field */
>> +	if (udev->speed >= USB_SPEED_SUPER && usb_endpoint_xfer_isoc(&ep->desc) && !lec)
>> +		return ep->ss_ep_comp.bmAttributes;
>> +	return 0;

Possibly, not sure there's much difference, especially if you break that line at
80 columns

>> +/*
>> + * USB 2.0 specification, chapter 5.6.4 Isochronous Transfer Bus Access
>> + * Constraint. A high speed endpoint can move up to 3072 bytes per microframe
>> + * (or 192Mb/s).
>> + */
>> +#define MAX_ISOC_XFER_SIZE_HS  3072
>> +
>> +static inline bool xhci_eusb2_is_isoc_bw_double(struct usb_device *udev,
>> +						struct usb_host_endpoint *ep)
>> +{
>> +	return udev->speed == USB_SPEED_HIGH &&
>> +		usb_endpoint_is_isoc_in(&ep->desc) &&
>> +		le16_to_cpu(ep->desc.wMaxPacketSize) == 0 &&
>> +		le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval) >
>> +		MAX_ISOC_XFER_SIZE_HS;
>> +}
> 
> It looks like eUSB2v2 is another spec which uses this descriptor for
> larger isoc endpoints and this code might trigger on such devices once
> USB core learns to parse them.
> 

Could make sense to check that bcdUSB is 0x220 here to avoid that.

We could also check if ep->eusb2_isoc_ep_comp.bDescriptorType exists
like in PATCH 2/4, and could then remove the wMaxPacketSize == 0 check as
usb core descriptor parsing will already do that check for us, before copying
the descriptor.

The USB_SPEED_HIGH check could also be moved to descriptor parsing in usb core.
This way we could remove the speed check hare and from PATCH 2/3


> Would there be no issues with that? Or conversely, any chance that your
> code could be trivially modified to support full 2v2, and "bw doubling"
> removed from names and comments?

Proably not, eUSB2v2 may have some odd burst and mult fields while double
bandwidth has fixed values.

Thanks
Mathias

