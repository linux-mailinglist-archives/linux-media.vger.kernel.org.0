Return-Path: <linux-media+bounces-50636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E82D1C3F0
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 04:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B53273012DD9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 03:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD79184;
	Wed, 14 Jan 2026 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTPGWQZY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E402E62C8
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768361024; cv=none; b=TIKddpSxkbIn5juFW2Hgs3vI491c9WLLxHWoKqA/vdKXrMq6tNWDnixyFnogK6SeALAA6EVPn9NE+XHNo/yJLWSqHWivvZFKNz1ZCdWE7QLo1H3ASX7sVq8UGnRRclp6R1O7/dgGXmsS/ZgtUzjrKpHL2rHDGgz9YU5zdy/ra5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768361024; c=relaxed/simple;
	bh=xh53QhE+HNjo/BzmjzttISvlTiC6b9yIsZfgTbZfDOo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LABIzt2IAdjTB3mV715R38NMzn/hiljSghjL2zyWLRVvuTxFTegZdmPLbcDu32lJC5+rrQbAsJFQBszcN4RuQtr5+O648WvZRQWuWclXalz/t3XAtKdmzbj8Qzfr9U8Xh7BGEqfqg1JWwpeS0O/tUwe7Ag4h2pxH9hefItZ5mcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTPGWQZY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768361023; x=1799897023;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=xh53QhE+HNjo/BzmjzttISvlTiC6b9yIsZfgTbZfDOo=;
  b=PTPGWQZYtF81f2pHJ7S0BuZ8doeWt+/1/6bgGSSb4pV6+ZCjfwSiQDmZ
   M81/1Bw2L+uhUyWStrvqWACOX4B67kQUZ7q4N/Xn7xlhjjFPeQ9H42fbb
   3PC8REsw7fhGoPwGAHXobKSDShULcQz2qNEcZmpoaXyK8yB4owDB/JLtt
   X94ycZRcDHmdqFrGam/uRCBpsIn+/ZbDnsdJD7EGqAXHTMCjjanI6WJNY
   /Tg4jnYfCavwgKboMRvCSzdMG2R/t4FxS5BKW5l5ZxKDf9QnqbXsDvXno
   EUqR9ZgHixSx3/siT+iDtJ5m9Ln0Dstw/rjaq81nBHUSmkZ2y+i/1hriz
   g==;
X-CSE-ConnectionGUID: gI7XSnHrRLCFo+pB70Bsfw==
X-CSE-MsgGUID: C0nSI2PxT1iKewqyM97Jsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80766997"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80766997"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:23:42 -0800
X-CSE-ConnectionGUID: OCw+oD+vTYWS97q7jfj3fA==
X-CSE-MsgGUID: KSI1Bp4wR4iNwcZnwEeVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204195275"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:23:41 -0800
Subject: Re: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
To: Hans de Goede <hansg@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, mehdi.djait@intel.com
References: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
 <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <a6768fbf-9efb-9fbd-75c1-c6ed5710931c@linux.intel.com>
Date: Wed, 14 Jan 2026 11:13:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hans,

On 1/13/26 6:42 PM, Hans de Goede wrote:
> Hi,
> 
> On 13-Jan-26 09:25, Sakari Ailus wrote:
>> The test patterns of the test pattern menu control start from 1 whereas
>> register values start from 0. Fix this.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>> This goes on top of my recent ov01a10 series.
>>
>>  drivers/media/i2c/ov01a10.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>> index 3dbc77430e0e..0a66d8974974 100644
>> --- a/drivers/media/i2c/ov01a10.c
>> +++ b/drivers/media/i2c/ov01a10.c
>> @@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>>  {
>>  	if (pattern)
>> -		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>> +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> 
> Nack, copy paste of my reply to Bingbu's email where this change was requested:
> 
> This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
> deliberately c2 because testing has shown that there is no difference
> between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
> "1 | OV01A10_TEST_PATTERN_ENABLE" to the register.

Hans,

Thanks for the explanation.

From the specification, color bar type1 is not same type2, type1 is a
standard color bar, type2 is a top-bottom darker color bar, type3 is
right-left darker one.

Mehdi, did you confirm the description in specification is wrong?

> 
> See the discussion here:
> 
> https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/
> 
> Please drop this patch.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 

-- 
Best regards,
Bingbu Cao

