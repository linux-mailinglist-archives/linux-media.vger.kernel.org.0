Return-Path: <linux-media+bounces-36155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31306AECA07
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 21:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557D96E0D82
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3208F287515;
	Sat, 28 Jun 2025 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jl+LhK9/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3B287270;
	Sat, 28 Jun 2025 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751138650; cv=none; b=Z77kBKkw3CkeNaBz3u4a3gRh3tlpD0Y7dlMnMTXjZWweOowOt0rPQYRNvaStux/Jlg2m1I1S5B+Ph/MhGSbODEt07BRN8L3lYGnd4OGb3KXb6TXlqmzAyfoYCapOqtb/9yFlL+B57GSMW4HqTSiC5I2coARxKctt6HwYcdGfJc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751138650; c=relaxed/simple;
	bh=Ek2LOhtKf+5FqLiZdfp4mmxJnFDeeSWIVbC+Mg0ivk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fRJVjw+apByIYJFDQJWazkjktoe4CDIuPDgDwFbcdhJq1Xg+tXNUZiNijPvhZqMyWHERk+keik4GCKTmZRybkiqI89X5hOOuAKM+xQSoXTxz11b3tv9MR4u4/xRyOm5VcBA7lJ8WTwFUGxJ/lOqxryT5X4PgTzoSjRDrNTcRKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jl+LhK9/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751138649; x=1782674649;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ek2LOhtKf+5FqLiZdfp4mmxJnFDeeSWIVbC+Mg0ivk4=;
  b=Jl+LhK9/oB6UwVTv1B39I1isqhEpYuk4aKgT9qA9zjLq2nZFtCJwIvNK
   QY+Gx48A43qFoIlO5SrJYrK8zdLRhGFIU0gXa0Yy2csj0zkvRcfe3xSd/
   HBeuPwtxBXNeZOjzomtgAnW5kNMNzwRuVj4DqxwEVdQaKoMxeXUYiVxnx
   i/PYWGt+cHFCWnR5L0Ay5P3yH4M+jjYXsGESb5/6Lo9mIIFdptxlhNCQy
   fpoubO6TrrAmXr8ieEAs7jX8FKiLX+qfPGpidXCfq1sLl5V/3AFwOOsQ8
   ouNJtef/EGNV+a66XLNuLK14xmT4iXc9F3ttA6pVVihOOHsHWQBgw5aCE
   g==;
X-CSE-ConnectionGUID: fc0xdWmLSvCXKcSkWDWWBg==
X-CSE-MsgGUID: yBb+FivdR9+8Il+KNtwWUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64769817"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64769817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:24:09 -0700
X-CSE-ConnectionGUID: fkyhn1+TSoCEV6oPbLbfvQ==
X-CSE-MsgGUID: +iTPhjcDQcK8LdoNy/Hu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153792135"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 12:24:03 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 2735944390;
	Sat, 28 Jun 2025 22:24:01 +0300 (EEST)
Message-ID: <44b71f16-edc5-46c3-96d1-53aceba537be@linux.intel.com>
Date: Sat, 28 Jun 2025 22:23:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Hao Yao
 <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
 <152051eb-7faa-4ff7-8e4f-14a12ff7c8cb@amd.com>
Content-Language: en-US
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <152051eb-7faa-4ff7-8e4f-14a12ff7c8cb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Pratap, Kieran,

On 6/17/25 02:46, Nirujogi, Pratap wrote:
> Hi Kieran,
> 
> Thank you for reviewing and sharing your feedback.
> 
> On 6/13/2025 7:02 AM, Kieran Bingham wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Quoting Hao Yao (2025-06-13 05:55:46)
>> I think it will highlight that werever possible - the code below should
>> be factored out to support the different configuration requirements.
>> Cleaning up the large tables of register addresses and making those
>> configurable functions for example configuring the link rate
>> independently would be really beneficial!
>>
>> That's precisely why we continually push for reducing the large
>> "undocumented register" tables in sensor drivers...
>>
> Yes, I agree, it is best to have documented settings and make 
> calculation for sensor modes instead of array of undocumented settings. 
> However the usual practice is that we send requirements to sensor vendor 
> and they provide us the settings array to be applied. May be we can try 
> to move PLL settings to different array but it is not always just the 
> PLL, there are a lot of undocumented settings which are in sync with PLL 
> and sometimes changing the PLL may result in misbehaviour of the sensor...
> 
> We will try to move PLL settings to separate array but cannot guarantee 
> changing these settings alone will make the sensor functional.

I did discuss this with Laurent as well and based on that I'd suggest 
the following split:

- power-on register list,
- external clock / link frequency specific list (often these are tied)
   and
- sensor mode

Which of these lists a particular register is written in isn't crucial 
at the moment, this can be always changed later on.

I'd leave the possible PLL calculator for later. Having more 
configurations is also useful for validating its function. A different 
PLL configuration from the original doesn't necessarily mean it would be 
wrong.

...

>>>> +     page = OV05C10_GET_PAGE_NUM(reg);
>>>> +     addr = OV05C10_GET_REG_ADDR(reg);
>>>> +     ov05c10_switch_page(ov05c10, page, &ret);
>>>> +     cci_write(ov05c10->regmap, addr, val, &ret);
>>>> +     if (err)
>>>> +             *err = ret;
>>>> +
>>>> +     return ret;
>>>> +}
>>
>> One of the main goals of CCI helpers was to avoid all of the custom
>> device accessors being duplicated in each driver, so I think extending
>> the CCI helpers to support page based accesses in some common way would
>> be beneficial.
>>
> Yes, I agree. We can take on this enhancement either now or in the 
> future, depending on the direction. We'll wait for Sakari's feedback to 
> determine the best way to proceed.

As Laurent suggested, keep the page-based helper macros/functions in 
this driver, we can generalise them later on as needed.

-- 
Kind regards,

Sakari Ailus


