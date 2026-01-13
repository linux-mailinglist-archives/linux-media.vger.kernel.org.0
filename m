Return-Path: <linux-media+bounces-50495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5FD167BE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 04:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B1D73034355
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 03:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8600313E07;
	Tue, 13 Jan 2026 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bV2Sl2Pn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA345315D2C
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274763; cv=none; b=okkZfLWVYCugREs/T0UTsg+udIzA9B8u5lbRa380zljkIPcZgwfjOAvHXspn0MYtoSnAn6xk0xDcSFLBQa2cixNmKtQ9Ve0dAb/zUgbxTV13KQRYU8uDPgN1uc9k+lT/Z5QisDx0o4gHOm799RczT2tDT5zZpAqveP28sNCFOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274763; c=relaxed/simple;
	bh=S0ybxr907oOx7LrFQUNLmUgAAcaI25o+uJESK8Msqg8=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dKJjfo4p8mCGoCI4nWxTKmEcSCwrL4xqdcF3rUfi6sywN0ZiNc8DiRVkdCMAmNF0JCDolZnaBO6oc0Uej8ZxAOI/Pwv5cjMvgKUQv8r7SjA0GIfuv2bf6thxZ6rS3sYuz4NdC6bABT4vTct3Lyy3oSQefUvcsnLrY6+LWE5btWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bV2Sl2Pn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768274762; x=1799810762;
  h=subject:from:to:references:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=S0ybxr907oOx7LrFQUNLmUgAAcaI25o+uJESK8Msqg8=;
  b=bV2Sl2PnSNGWygwrMGputSQeDaTyL9K2bekOKhoMjccY1UqJYgr6me/b
   RzopgeqVVEPUfXcAveLodBjslBoS7z6wfrMyJtabY9HE4a0rAedNo1na0
   sL4An5bekEBa0BKZrGqX0tzd2nMK6PVU/+HFZVveH7tVSpsittDbbh2l0
   G/BS/2yuVsBdXWGosDC7qM+ogc/Fe0hKdIaEKWkPmkvmwVlg2VjJB60E2
   BulpJR/G4BeEyhwtGuiLpik1sdEPb6kwgxhl3SwOJB37z/aOh+S8rNgza
   lNLkbTIYd5oePQZEHeEsiuR01SoXQUt9UuKaWhMgwUmKETQ+MtvkjBuaP
   Q==;
X-CSE-ConnectionGUID: UUgqsfcSR6qElugJBTAAzA==
X-CSE-MsgGUID: ZQoM8y5MSxePM+k3jhR3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69633432"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69633432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:26:01 -0800
X-CSE-ConnectionGUID: EPQDfkzeQTGVLqdVEJbN8w==
X-CSE-MsgGUID: pVqDfPd0TzWZ4Aez4+5tTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204554125"
Received: from ipu5-build.bj.intel.com (HELO [10.238.153.130]) ([10.238.153.130])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:26:00 -0800
Subject: Re: [PATCH v2] media: hi556: correct the test pattern configuration
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, hansg@kernel.org
References: <20250630090420.479790-1-bingbu.cao@intel.com>
 <8593dee9-8cab-8427-f25f-83086ef9a235@linux.intel.com>
Message-ID: <6914eee7-1e68-a7c1-1b0c-718d54ae3298@linux.intel.com>
Date: Tue, 13 Jan 2026 11:15:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8593dee9-8cab-8427-f25f-83086ef9a235@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

My mistake, I see it's already merged. :)

On 1/13/26 11:05 AM, Bingbu Cao wrote:
> Sakari,
> 
> It seems this patch was missing, could you help check?
> 
> On 6/30/25 5:04 PM, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Hynix hi556 support 8 test pattern modes:
>> hi556_test_pattern_menu[] = {
>> {
>> 	"Disabled",
>> 	"Solid Colour",
>> 	"100% Colour Bars",
>> 	"Fade To Grey Colour Bars",
>> 	"PN9",
>> 	"Gradient Horizontal",
>> 	"Gradient Vertical",
>> 	"Check Board",
>> 	"Slant Pattern",
>> }
>>
>> The test pattern is set by a 8-bit register according to the
>> specification.
>> +--------+-------------------------------+
>> | BIT[0] |  Solid color                  |
>> +--------+-------------------------------+
>> | BIT[1] |  Color bar                    |
>> +--------+-------------------------------+
>> | BIT[2] |  Fade to grey color bar       |
>> +--------+-------------------------------+
>> | BIT[3] |  PN9                          |
>> +--------+-------------------------------+
>> | BIT[4] |  Gradient horizontal          |
>> +--------+-------------------------------+
>> | BIT[5] |  Gradient vertical            |
>> +--------+-------------------------------+
>> | BIT[6] |  Check board                  |
>> +--------+-------------------------------+
>> | BIT[7] |  Slant pattern                |
>> +--------+-------------------------------+
>> Based on function above, current test pattern programming is wrong.
>> This patch fixes it by 'BIT(pattern - 1)'. If pattern is 0, driver
>> will disable the test pattern generation and set the pattern to 0.
>>
>> Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/i2c/hi556.c | 26 ++++++++++++++------------
>>  1 file changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
>> index aed258211b8a..dce78af444db 100644
>> --- a/drivers/media/i2c/hi556.c
>> +++ b/drivers/media/i2c/hi556.c
>> @@ -756,21 +756,23 @@ static int hi556_test_pattern(struct hi556 *hi556, u32 pattern)
>>  	int ret;
>>  	u32 val;
>>  
>> -	if (pattern) {
>> -		ret = hi556_read_reg(hi556, HI556_REG_ISP,
>> -				     HI556_REG_VALUE_08BIT, &val);
>> -		if (ret)
>> -			return ret;
>> +	ret = hi556_read_reg(hi556, HI556_REG_ISP,
>> +			     HI556_REG_VALUE_08BIT, &val);
>> +	if (ret)
>> +		return ret;
>>  
>> -		ret = hi556_write_reg(hi556, HI556_REG_ISP,
>> -				      HI556_REG_VALUE_08BIT,
>> -				      val | HI556_REG_ISP_TPG_EN);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	val = pattern ? (val | HI556_REG_ISP_TPG_EN) :
>> +		(val & ~HI556_REG_ISP_TPG_EN);
>> +
>> +	ret = hi556_write_reg(hi556, HI556_REG_ISP,
>> +			      HI556_REG_VALUE_08BIT, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val = pattern ? BIT(pattern - 1) : 0;
>>  
>>  	return hi556_write_reg(hi556, HI556_REG_TEST_PATTERN,
>> -			       HI556_REG_VALUE_08BIT, pattern);
>> +			       HI556_REG_VALUE_08BIT, val);
>>  }
>>  
>>  static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
>>
> 

-- 
Best regards,
Bingbu Cao

