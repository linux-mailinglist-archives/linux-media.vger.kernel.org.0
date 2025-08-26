Return-Path: <linux-media+bounces-41081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66009B35FA2
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0983B3679
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B80842AA4;
	Tue, 26 Aug 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngDmSoLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14115537F8;
	Tue, 26 Aug 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212625; cv=none; b=KtT4AkDotEGY9rALUUHcmurVRx+H312v5ITUfb2+Hbpx5+dAQU0BEmyzAW5hzw1WPuHJqqmf9g2WiCdFZ0ZTDB7sYdcbWW/HF55WogItD/DAXbOJVVltSdotj6Hc7nf+alLL72PBYRoxT96LKtA15Aah28Y6ZEV95tXlTk/VM7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212625; c=relaxed/simple;
	bh=AEO8YFz5aL9IPPCHJS8uwkPwEu1jnh73C0nP3dgA0SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBGlvJwrH6A4aYxF1VpWKXDjq5lWO+GXtAxTJhhNWRl9U3+pfkTyjM4hkVlocagV0sAVF7I2Uvgkmb83IxkXVo3w8kfythUBh0pN13RY77RIjymAkM47OWVt35IyEZiMoMfzZqCLvrACS0FUpZYfNU42w+cRn8nzPw0SWUew70E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngDmSoLt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756212624; x=1787748624;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AEO8YFz5aL9IPPCHJS8uwkPwEu1jnh73C0nP3dgA0SU=;
  b=ngDmSoLtR/Tb1U7V/otQKwld8YXTJycpIkWF4oz3oZrlxQnrPjVnMsIe
   4POW6X7iX7y5jRmhDtmLM9Np3c9GTLF2TPykXGNxp1G1DiahCN/6B/PmP
   VLlge2XzoMpHNyzxV2GJjRe0Mr+QJgcs7YQ5KGm2xdiXf4/qbg2vNvwSy
   xQ1IDdxfDAufD6ixP03PamJOz8hwwF03NLmOni3pVMU73bVUyO8VxPBJX
   xaZVf9iG0fxv5a8Owyk/zwy4xbHXfayxLCpjjOzU7VTwxvrfwUGsVI0Bw
   G9UH1rtm8vfdRbtoGerENE0vZrzXlGEsMZnbm7Gtqx22tkX2Cm+acvQkx
   w==;
X-CSE-ConnectionGUID: 6voAMbSnQZKRYB5wBSu+sQ==
X-CSE-MsgGUID: iUB5S8XVTuizwXKVxU6G1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57645413"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57645413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:50:23 -0700
X-CSE-ConnectionGUID: NYGfQ1sQR/CcvNle4nchAg==
X-CSE-MsgGUID: GRBUfpUhSKmm7E1OwOFVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169178532"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 05:50:20 -0700
Message-ID: <c721597a-926f-4c33-846b-9a7119597e8a@linux.intel.com>
Date: Tue, 26 Aug 2025 15:50:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] usb: core: Use le16_to_cpu() to read __le16 value
 in usb_parse_endpoint()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> wMaxPacketSize field in struct usb_endpoint_descriptor is an __le16, use
> le16_to_cpu() to read it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/usb/core/config.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 42468bbeffd2..cda595b4014f 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -507,7 +507,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>   	}
>   
>   	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
> -	if (bcdUSB == 0x0220 && d->wMaxPacketSize == 0 &&
> +	if (bcdUSB == 0x0220 && !le16_to_cpu(d->wMaxPacketSize) &&
>   	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
>   		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
>   							endpoint, buffer, size);

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


