Return-Path: <linux-media+bounces-34912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E8ADB116
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ABA91888658
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E558292B4D;
	Mon, 16 Jun 2025 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCmB4lLy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A42E427E;
	Mon, 16 Jun 2025 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079182; cv=none; b=KpdFn4NastjOQ8ZIo7j6UWwLkK37qlLRiAKKzu9a62J6hycYRga1+6WHJ1qxMOE86wyeraCHriTkLShz2tmjo7nTzGvqdrSAd3AUv6F+wwl96TCkkHaXlCvRCbG1vSD3TFsm4kbfwqbjzeBWOokRRBstoCV5SZTF0/+H0Sz5fJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079182; c=relaxed/simple;
	bh=v37e3M4Zm2k6n1fyHgSCEZmIq9tiiJWNpQq+eCbJo6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVuNePkIkQXwGR9X1j/svxth0ZSz2qBPhdMns22bQOx+/t8JJC1DMV4PljgFgJgNZTCmOhE7KOxt3LC5txzrlyVMIqe5Vx+aKvCN/08nBvpwO5HCyPX+88nsQfv/xYE7MnjZZlr6TYMIXnzwwot1adL/5Y39gjz39Usa9XRXf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCmB4lLy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750079181; x=1781615181;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v37e3M4Zm2k6n1fyHgSCEZmIq9tiiJWNpQq+eCbJo6E=;
  b=CCmB4lLyNCKQZWJsgPkBSVGQD93NCmu4TvL+Dkwp3m35z7dhiordxp9x
   oWMQljhDAvdSqHq2CcZUGK1GQ+dlFUP5WDq16wINlcsmRR0EJg37Bi/hq
   uIz4kEMUcY9yM22g2q/jBS8NZzbVTCiuUTRj7WVoUgjYKa/nIoyji8jZd
   wtqj6lCXx/lDcmOSzXZhGb8UFZY3OqP0BbflxvI/jEZOja/LPRjoPYFHe
   JkknGNwapfUjgdAnzlaGexfuZuBC7Sl8JJBIiSG5ug3QE/YgIYd3cvPgZ
   Td4g1tTPwadjSRilgj5egrWqZLj/VVyu3gOtwVljH5bFi5a76cb4LQeLF
   w==;
X-CSE-ConnectionGUID: Z+wbwUNXQ6q2i499LshI2g==
X-CSE-MsgGUID: On8rXGwaQWGcuFHaUJX46Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39829683"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39829683"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 06:05:58 -0700
X-CSE-ConnectionGUID: MqFyVQ8XQl+cnkZHDjqx0g==
X-CSE-MsgGUID: vR7wmNhQRTS/WV2ELwD2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179363597"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2025 06:05:56 -0700
Message-ID: <7ab7cd9e-3100-4996-9357-5350e4c46824@linux.intel.com>
Date: Mon, 16 Jun 2025 16:05:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: uvcvideo: eUSB2 double isochronous bandwidth
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
 Tao Q Tao <tao.q.tao@intel.com>, Amardeep Rai <amardeep.rai@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
 <20250616093730.2569328-4-mathias.nyman@linux.intel.com>
 <20250616094359.GB32454@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250616094359.GB32454@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.6.2025 12.43, Laurent Pinchart wrote:
> Hi Mathias,
> 
> Thank you for the patch.
> 
> On Mon, Jun 16, 2025 at 12:37:30PM +0300, Mathias Nyman wrote:
>> From: Tao Q Tao <tao.q.tao@intel.com>
>>
>> Add eUSB2 support to check total number of bytes, isochronous endpoint
>> will transfer every service interval(SI).
>>
>> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
>> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
>> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/media/usb/uvc/uvc_video.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>> index e3567aeb0007..a888f84208c6 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -1906,6 +1906,11 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
>>   	case USB_SPEED_SUPER:
>>   	case USB_SPEED_SUPER_PLUS:
>>   		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
>> +	case USB_SPEED_HIGH:
>> +		psize = usb_endpoint_maxp(&ep->desc);
>> +		if (psize == 0 && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
>> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
>> +		fallthrough;
> 
> Instead of adding yet another case here, and eventually in a bunch of
> other drivers, could we centralize retrieval of the maximum bpi value in
> a helper function provided by the USB core ?

Sounds reasonable to me.
I'm not sure if any other drivers will need it as this feature seems to be made
specifically for integrated webcams, but things evolve.

Thanks
Mathias



