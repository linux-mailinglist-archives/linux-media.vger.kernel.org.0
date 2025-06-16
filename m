Return-Path: <linux-media+bounces-34974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB67ADB59C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4388316EE41
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7B7265293;
	Mon, 16 Jun 2025 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+OTltT7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8354420FAA4;
	Mon, 16 Jun 2025 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088193; cv=none; b=UMmN5QOHtiv9h7RDIIjbCmI+0DbiJZSLWY0mH4PHqW8XQKpLUcnzYRQupZljToa7Ib4jG9KeR+2txBAsIii+gI00XYWQKomZGmXdy/KiiIVOvQBx4tgW64Fmzhpb9xumxq/GmAC8SEqyDIa7urbaXOqKjA6x4zOJfWAWU7rlmjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088193; c=relaxed/simple;
	bh=HvWianMNxzhDBBu8tDFFasJCyfBNJ2jO/PWb7duCtGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FI5Xi8K0C06ZIAFQZRX8XvWd/OpOqqG1xaXeJ4Fu52o62ppbkJ1YdHfkQ1bYvE7AfBFg1dtn5tiJIEUm/FqU+SX4VvKPRpfjOjauIhF78fRMv8TUOF9yQ+ii+v46iNUUj64n9bUYZTkvRt5qddLEWK7pyuZN9+eYuvGcUtuWDgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+OTltT7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750088191; x=1781624191;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HvWianMNxzhDBBu8tDFFasJCyfBNJ2jO/PWb7duCtGE=;
  b=D+OTltT7+vaPnaQ/6EVmNEsfbi2z3JD/Tq+E6R1nxu5+jTHb86KfDmNM
   G9zibCdzdaxVX84iaBM/PYlat7LSOagqSMTZDsWWlS7Pad/JTDpwEFhrv
   qiyBVLVw7vqsjuyEjrG8YxBAkO/NAW6dxvuEnxL0CtdTDyAuzl06MzOYT
   SqXrfQ6x5N1WtvwXO47eHKTwCJAzXx19RPGKLhx2MlMw+ITdzhWJDk1X2
   ltV+djc9Dl3omIfKs2Cd+0fj1TfOb3gl9DbvJUEww+TUqyYb9U/oLCNqB
   nNHCfmjPRYJTpkvf/EkUU0MR2mhgCLTz92VlFQfxw8fWozkv+KvBdt5nn
   A==;
X-CSE-ConnectionGUID: FEkrfd1uR0y8li7foj+I8g==
X-CSE-MsgGUID: 9zsxGlCJRZmoU0P4K1GpHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62889068"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="62889068"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 08:36:30 -0700
X-CSE-ConnectionGUID: 5Nq/5heVQoqe42BSD1Je/A==
X-CSE-MsgGUID: +VjjdCwMQmOX9yjpkl2b9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="153807373"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 08:36:27 -0700
Message-ID: <a02dc07c-6d6a-4f3a-af3f-a51ff50b172f@linux.intel.com>
Date: Mon, 16 Jun 2025 18:36:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] USB: core: support eUSB2 double bandwidth large isoc
 URB frames
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
 Amardeep Rai <amardeep.rai@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
 <20250616093730.2569328-3-mathias.nyman@linux.intel.com>
 <c82aa592-7904-44c1-b595-ede6eed14ee4@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c82aa592-7904-44c1-b595-ede6eed14ee4@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> @@ -434,7 +435,12 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
>>   		return -ENODEV;
>>   
>>   	max = usb_endpoint_maxp(&ep->desc);
>> -	if (max <= 0) {
>> +	is_eusb2_isoch_double = dev->speed == USB_SPEED_HIGH &&
>> +				xfertype == USB_ENDPOINT_XFER_ISOC &&
>> +				usb_endpoint_dir_in(&ep->desc) &&
>> +				le16_to_cpu(dev->descriptor.bcdUSB == 0x220) &&
>> +				le16_to_cpu(ep->desc.wMaxPacketSize == 0);
>> +	if (max < 0 || (max == 0 && !is_eusb2_isoch_double)) {
> 
> Minor point: It's impossible to have max < 0 here, because
> usb_endpoint_maxp() always returns a non-negative value (the return
> value is &'ed with 0x07ff).  That part of the test can be removed.
> 
> Alan Stern
> 

Thanks, will fix this for v2
-Mathias

