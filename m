Return-Path: <linux-media+bounces-41083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30950B35FEA
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EDA846350C
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C039206F23;
	Tue, 26 Aug 2025 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiLR/uIy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50A91D88AC;
	Tue, 26 Aug 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212742; cv=none; b=thpg3dXPwSboDVJYTUYZuxx8zkxkvlqS32Or648+D36tk8eOXRylzFqbLt5G/Le5iNG3VEMGdKyi9at04O4Vzu5Qt6EOKXMKcEQe8lpKkdrgo/2804TkgCNwEOskmpD6s0EW3q0vh5M9W3u83jK2NwVTG02pub+knZa6Nk47CHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212742; c=relaxed/simple;
	bh=jKQ8wlA5ODW1/ODWVPaSF3IdPEr56cf1vSZzIQ/39Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpqtkZfXbwJhoLMh+NYvIRZY4HMfFx0rByf4+ewo43pyUUqNsGBhv8m1Ur8B8GVaB0joMHEIlw/5+EmsVt4YWz1BwwmAy5Fz3YP9h+T/kjCXLmh9ZaTd6umXMyRU/ydfzi/Xx5xLynZAwIBJVFuEHpAWWn3+wV2NkfeHK0ODRZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiLR/uIy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756212741; x=1787748741;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jKQ8wlA5ODW1/ODWVPaSF3IdPEr56cf1vSZzIQ/39Zc=;
  b=RiLR/uIyBxrCRgitVQTQ0/iAeNmr22Bw63uF67A+l9FVe32bqUUkuMxO
   bZmOS1equJ1jJTfewCF0RR/wo6OV3gKge71iC46JRkPtDdtLhypQa0YVB
   bpqB6rPZy7dK+1t/7HOaJ42b7tucIQySKsprf7NSH7JjVsYuwHfXCo2g8
   ZOic2W8wVUHcJvwUL2SrwjK+4I+8KgzuegwhpGNDfAnr/n/lulW8FvvHA
   76rox0UpACsBKJb4/SAFQ6E/aSW85EEFSOH+ksE1qdwm6molGFvXVajDE
   4C0FXbcDE43EGxyeBI8OlbFJzcaHdYda77RE4jzo1nnLZQJbuV9yD1WMJ
   Q==;
X-CSE-ConnectionGUID: L+Gon9LHTW2+3qX/MIzfbA==
X-CSE-MsgGUID: PFY8qcfSSpCYzkHbo6tPrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57645621"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57645621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:52:20 -0700
X-CSE-ConnectionGUID: JCG9rIQQQveEy0fTa9Ur7Q==
X-CSE-MsgGUID: pGQBuXM2SrqOvJnHypWAIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169178809"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 05:52:15 -0700
Message-ID: <723d1f0f-ca20-44d4-afa4-37420ed09c29@linux.intel.com>
Date: Tue, 26 Aug 2025 15:52:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] usb: core: eUSB2 companion descriptor is for isoc
 IN endpoints only
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-4-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> The eUSB2 isochronous double bandwidth endpoint descriptor is allowed for
> the isochronous IN endpoints, according to the ECN. Do not parse these
> descriptors if they are found in interrupt or OUT endpoints.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/usb/core/config.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 29fcbd6de482..baf5bc844b6f 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -508,8 +508,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>   
>   	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
>   	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
> -	    !le16_to_cpu(d->wMaxPacketSize) &&
> -	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
> +	    !le16_to_cpu(d->wMaxPacketSize) && usb_endpoint_is_isoc_in(d))
>   		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
>   							endpoint, buffer, size);
>   

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


