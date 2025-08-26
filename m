Return-Path: <linux-media+bounces-41084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4057B36012
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3C197C1BCC
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896511F8ACA;
	Tue, 26 Aug 2025 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gspWcFav"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA77260F;
	Tue, 26 Aug 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212844; cv=none; b=MDbBC7mrH7vYacYbMTpj4gWIoS+IzHi7l8sBrRj4cdiZSKMaMaFUhv5jIMEao/tYgEw4LZcxBnVd8mwuV8eA7J8SD1Y3HJY6e0puncG0LFKT+VoVwYMHxIBOyJLagHIj01s/vXJXmIZRgjkVaZWvf+ISFO5mZAFUKa5gvQBwa2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212844; c=relaxed/simple;
	bh=HpiodcpC1SfTmUGzsLTmM7yrtvL4AfR0M9bLS4qJOpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YW2K7QzmiErUwbO0/8y57nv5dwDoYoJ9shZw1GM66+ys61NyGMoneqZtoZiEqID+A738vP+yXFFR9U/sxx5U8HAYOWCJ8t9wMJnm94+9fs/uSQszF9kmzdqyN2MGkW5MDh9MjGEkOUs6DQLVxUf59+C4xFy7O6g6/hQN6e2KlNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gspWcFav; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756212843; x=1787748843;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HpiodcpC1SfTmUGzsLTmM7yrtvL4AfR0M9bLS4qJOpM=;
  b=gspWcFav/eYAt4V4Qe0wrkyniDNvrSoW6//HsjXnAKN8dPhUGRtoUBns
   5qvtCRNQJ/rQrqewC6VOcUs+pA2TLVHgI5P6rCRLdZagNVA+7KxpHBxM6
   JALFhQbo9h59+dJFxPEora/qOc1zARJFsb5HaHA+3iAF2CsRIJnoTCgco
   WoaFP5JevjhmItUpGDAdBX40y6FdM8d+4RmYYJyhhFVdG4OQrHCbBO/Rp
   Ui9GcQZYCAN8KQBdCuQMoDcGvU+tSCEXoHJ7ihrc0a6etgHrTSKJYtf2I
   IkFYhfdgNp+XRrMkLAT+BFdjzmcEZoK+ntIsIhsBSQKSFgo1VtWaSD1VP
   Q==;
X-CSE-ConnectionGUID: +73eubdYRdGi13cJyud7KA==
X-CSE-MsgGUID: t9QyExeFQyqhS7HT6acfqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57645817"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57645817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:54:02 -0700
X-CSE-ConnectionGUID: LfKz+mFLT4aJi4Ycsc652A==
X-CSE-MsgGUID: r4BJ8lj+TwS62SMZ5sLCZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169179141"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 05:53:58 -0700
Message-ID: <c5ea54b3-8e2f-4efe-b515-bef480eca8f6@linux.intel.com>
Date: Tue, 26 Aug 2025 15:53:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] usb: core: Introduce
 usb_endpoint_is_hs_isoc_double()
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-7-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> Introduce usb_endpoint_is_hs_isoc_double() tell whether an endpoint
> conforms to USB 2.0 Isochronous Double IN Bandwidth ECN.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/usb/core/usb.c | 19 +++++++++++++++++++
>   include/linux/usb.h    |  3 +++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index ca9ff6ad8e73..939dc4aafb89 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -1139,6 +1139,25 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>   }
>   EXPORT_SYMBOL_GPL(usb_endpoint_max_periodic_payload);
>   
> +/**
> + * usb_endpoint_is_hs_isoc_double - Tell whether an endpoint uses USB 2
> + *                                  Isochronous Double IN Bandwidth
> + * @udev: The USB device
> + * @ep: The endpoint
> + *
> + * Returns: true if an endpoint @ep conforms to USB 2 Isochronous Double IN
> + * Bandwidth ECN, false otherwise.
> + */
> +bool usb_endpoint_is_hs_isoc_double(struct usb_device *udev,
> +				    const struct usb_host_endpoint *ep)
> +{
> +	return ep->eusb2_isoc_ep_comp.bDescriptorType &&
> +		le16_to_cpu(udev->descriptor.bcdUSB) == 0x220 &&
> +		usb_endpoint_is_isoc_in(&ep->desc) &&
> +		!le16_to_cpu(ep->desc.wMaxPacketSize);
> +}
> +EXPORT_SYMBOL_GPL(usb_endpoint_is_hs_isoc_double);
> +
>   /*
>    * Notifications of device and interface registration
>    */
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index e9cf2786d8bd..70ef00c42d22 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2042,6 +2042,9 @@ static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
>   u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>   				      const struct usb_host_endpoint *ep);
>   
> +bool usb_endpoint_is_hs_isoc_double(struct usb_device *udev,
> +				    const struct usb_host_endpoint *ep);
> +
>   /* translate USB error codes to codes user space understands */
>   static inline int usb_translate_errors(int error_code)
>   {

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


