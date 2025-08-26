Return-Path: <linux-media+bounces-41082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8FB35FBB
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1827B463150
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89E71A23A4;
	Tue, 26 Aug 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwJKbj+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04612CDA5;
	Tue, 26 Aug 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212663; cv=none; b=NbL4V/iypDaGJ/SRlBXoZ08V0oomkqw9TVSPkXGxM+JansHrh2leuzar0VrmWJPna/LRnnaGOmruvVQhsuhYe3IRCCuKp44pNmEKupCtWFQ4AD5UXURRE03Vstj24BHlOZV6nuTFlHdaCw30M8PehBSy/7nhZAiLs7qasoYp4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212663; c=relaxed/simple;
	bh=zj+DFmEcqIsOAarzNXBgnuuQXht6ZwkXRjqh87C22d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iemYhDR71wJhRQ1PxO+BC0pJIs0aloBpWUkw+B0uiikzJfMaaTZvS/V7yXQqsoO3cKTfuR7IKpAne/lln3ajjsbJ9xX+7cSiI7bYLjLlH8rSeH5gua4lhZHBSkpAc5zb10EPHGfVxpVUG64d/FY63eXHbD0LMR9pDKH5YbFsvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwJKbj+E; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756212662; x=1787748662;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zj+DFmEcqIsOAarzNXBgnuuQXht6ZwkXRjqh87C22d8=;
  b=RwJKbj+EePsWefUvbuXTckPapCtosHHjzQKRFCVxsz4LBajldA24kWvM
   Czuda31pOZrCZApw73pwKZrdSAB2SDyVRFAHa8dDE+IXzAHYlrlwj1z+f
   QP/ETQGVcdd3EB3rfukSdDQc6C19dxwinsnkW33gPHunqtq5X862Tn6nE
   m279U3eXm5P8rUD6TyvlyyrpyNY4/lBvVDMCFQHbKUlnlaBVa5osP0rUB
   SUyGwCrofIJERtkefqS6gz3YdNOlAgIMesr+ksJG1MWXpfl4yDbrAx0v/
   r3VjcvABqWugTPiGlHW0IuGLzteBEuFBO7nv3uwP3lyKDtmEEr8wz0lS8
   g==;
X-CSE-ConnectionGUID: attagigJQ5ipe1TKIfepcA==
X-CSE-MsgGUID: IBTKNb4HSICIwg/Q25xjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57645494"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57645494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:51:01 -0700
X-CSE-ConnectionGUID: nKgADdqsSFmRtn7vzN26XQ==
X-CSE-MsgGUID: /dlxNw5eTZ+7lGRFsnnRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169178606"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 05:50:58 -0700
Message-ID: <419e2484-53e9-456e-a78f-87a73ed042c1@linux.intel.com>
Date: Tue, 26 Aug 2025 15:50:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] usb: core: Parse eUSB2 companion descriptors for
 high speed devices only
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
 Kannappan R <r.kannappan@intel.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20250820143824.551777-1-sakari.ailus@linux.intel.com>
 <20250820143824.551777-3-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250820143824.551777-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.8.2025 17.38, Sakari Ailus wrote:
> Check that a device is a high-speed one before proceeding to parse the
> eUSB2 isochronous endpoint companion descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/usb/core/config.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index cda595b4014f..29fcbd6de482 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -507,7 +507,8 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>   	}
>   
>   	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
> -	if (bcdUSB == 0x0220 && !le16_to_cpu(d->wMaxPacketSize) &&
> +	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
> +	    !le16_to_cpu(d->wMaxPacketSize) &&
>   	    (usb_endpoint_xfer_isoc(d) || usb_endpoint_xfer_int(d)))
>   		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
>   							endpoint, buffer, size);

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>


