Return-Path: <linux-media+bounces-30110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04696A87982
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554B0188E637
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51669259CA8;
	Mon, 14 Apr 2025 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kg+FfMXA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DA258CC8;
	Mon, 14 Apr 2025 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617309; cv=none; b=eaAfLFJ4X6oFDKaNhnwLKdsU8ZkbkOQXiMgvy7vVq5Eq7ad3GcExiAhG8PhG3AKuHMWRoihiGVb3ad/Rg9ym7Hp8C/uk0yFO+rIs4fwGca7UJaRSFgb3v+w0fssCwtUxAew3zrDwnOxbBwypW3+HsaKhVpqyYh86G/oi1Zo5XJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617309; c=relaxed/simple;
	bh=xsnF7CVJ4Ko3x3c2INcPktG1gVxse5px8EGejhzrggQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJyj3uYkI+2BxS4zBFYF1HMvCYOMtFF6p9wOaN/qkDRp0Xpilof+euy8b9tOJ1PAUpzc13VyX8to9n0fXKNvADBQkdTx0YnyUezEWN9RbzOZ14Kg7eIpfk2DsY+Ie0C7xRcPqn+EKB7sguqnLQw7jwRkIxvm5LX30nj5ZjK1Ioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kg+FfMXA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744617308; x=1776153308;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xsnF7CVJ4Ko3x3c2INcPktG1gVxse5px8EGejhzrggQ=;
  b=kg+FfMXAtwy+aLrAwn+xRxFGoKmwR4P/SSJeKvimPOWfjhPDB9dWhGUE
   OmQ1hxauCuKA3QVIdKmiZcugCpTMhce2vq96OfRRQITbW6HSKCslEb8O2
   lkxfhI/JXnHRsbDN8g058zrbhSRbiHfnjcD6rPbINx+MZU35EQCWsDsL2
   vbEiPXFExXpbCeFRD/2jSJqhhtiDrWyiYGYi7mocbxR1l3S9OcGU+Qlou
   sswc+v2PtOaL9LYvxSa1FD7R3vvwVLoc8jiLrbdCXAQ/kZ5+2Zrh5asHN
   e9xPxxvmNKkccGRt0HRe9jDxNuFSWwX3AlA5lcduYBsV+9bUil5qYQ8nJ
   A==;
X-CSE-ConnectionGUID: CifXPwnASqCmoFzaPOAq7w==
X-CSE-MsgGUID: GHcGlHjWS56DbqCwSsF1yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45784102"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45784102"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 00:55:03 -0700
X-CSE-ConnectionGUID: ZpzOKMB2Qj2bDLvOYQCdbg==
X-CSE-MsgGUID: nlMEeAImQre+0p6qZpAE3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134810551"
Received: from unknown (HELO [10.238.224.239]) ([10.238.224.239])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 00:55:01 -0700
Message-ID: <0315dcf6-3411-4a4a-bfe1-8a7cff53e672@linux.intel.com>
Date: Mon, 14 Apr 2025 15:54:58 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: i2c: change lt6911uxe irq_gpio name to
 "hpd"
To: Hans de Goede <hdegoede@redhat.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, andriy.shevchenko@linux.intel.com,
 u.kleine-koenig@baylibre.com, ricardo.ribalda@gmail.com,
 bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org, hao.yao@intel.com
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <20250411082357.392713-2-dongcheng.yan@intel.com>
 <3fd83bea-abd2-4d2c-b39e-20d3eb981a99@redhat.com>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <3fd83bea-abd2-4d2c-b39e-20d3eb981a99@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi hans,

On 4/11/2025 4:34 PM, Hans de Goede wrote:
> Hi,
> 
> On 11-Apr-25 10:23 AM, Dongcheng Yan wrote:
>> lt6911uxe is used in IPU6 / x86 platform, worked with an out-of-tree
>> int3472 patch and upstream intel/ipu6 before.
>> The upstream int3472 driver uses "hpd" instead of "readystat" now.
>> this patch updates the irq_gpio name to "hpd" accordingly, so that
>> mere users can now use the upstream version directly without relying
>> on out-of-tree int3472 pin support.
>>
>> The new name "hpd" (Hotplug Detect) aligns with common naming
>> conventions used in other drivers(like adv7604) and documentation.
>>
>> Fixes: e49563c3be09d4 ("media: i2c: add lt6911uxe hdmi bridge driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> 
> The commit message needs an extra sentence to explain that this change
> is ok to make since at the moment this driver is only used on ACPI
> platforms which will use the new "hpd" name and there are no devicetree
> bindings for this driver.
> 
Thanks for your great advice. I'll update commit message next patch.

Best Regard,
Dongcheng> Regards,
> 
> Hans
> 
> 
> 
>> ---
>>  drivers/media/i2c/lt6911uxe.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
>> index c5b40bb58a37..24857d683fcf 100644
>> --- a/drivers/media/i2c/lt6911uxe.c
>> +++ b/drivers/media/i2c/lt6911uxe.c
>> @@ -605,10 +605,10 @@ static int lt6911uxe_probe(struct i2c_client *client)
>>  		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
>>  				     "failed to get reset gpio\n");
>>  
>> -	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
>> +	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
>>  	if (IS_ERR(lt6911uxe->irq_gpio))
>>  		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
>> -				     "failed to get ready_stat gpio\n");
>> +				     "failed to get hpd gpio\n");
>>  
>>  	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
>>  	if (ret)
> 


