Return-Path: <linux-media+bounces-50546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6FDD18199
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4238A30312CA
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EF5346E4A;
	Tue, 13 Jan 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dErgZa1A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C023195E5
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300835; cv=none; b=WMN/vHjECkgfDeBVNEpYj+1KKkRmCVx1reFxs+s6pCSM/lWVEFuwKDkc4z99XX0pLhAM2vee1E5ndFRqUzKG7D5UnAdOpCWcW96UjMnfutj+7CUMbPyV8WfFcv6HpN6XlR1SgTpJu4JAm3Yw2iMQFywwot2qSV8O3qJZiobExbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300835; c=relaxed/simple;
	bh=kcfT4PNs+E4pf4ACTb2k/DWNWoEIIRziqJPt2A9hc/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deZiFTIC/FmSk0iRne0WcL+51NDSImBEZ6q7/q8eIEygPgA/eJNLjzAa14tpZdwX8DqJAuZFzHmIhHK0cJc5NAADZ+DSSn/6NctylQUsAKSxhbfejw6+zZ12kuj9+T/3vbKjIRHgVpzgsZr0++6VtgFfYmyv5qUrb7Hpj08g8wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dErgZa1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED726C116C6;
	Tue, 13 Jan 2026 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300835;
	bh=kcfT4PNs+E4pf4ACTb2k/DWNWoEIIRziqJPt2A9hc/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dErgZa1AMmXfjqWlke+WNJvyHN+0u7ZOV8j2wKIchr+orki0/dlNRlXUS0hAYrBRk
	 3j9LxZmnJwzHqAXlbs0zw/IbphybUuPnnWLnTEyTRsQINDvGxpds1vhJrnpQ1orDj4
	 jtWjESJ4lzU7IZfKBPZcjbazIApdXdzSM7SOc2KsP25De1fwNwQHWWjkvNUd5lsXC1
	 XVo8rHKDfvDvnl7LnivlSk6c0/3lUNfvkP4xa/7czL9K67MQeAdkFaTy2+wP4nvXr7
	 +WAz3qzpRVJG2DcH8U0yJMumGm/NYTzKXCbFTICoxk0HauGI3yApw65cj59wbeAMfh
	 aUtCaYk1I8GUg==
Message-ID: <5741bbea-eb34-4547-a264-a6b96f8c9f38@kernel.org>
Date: Tue, 13 Jan 2026 11:40:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] media: i2c: ov01a10: Fix test-pattern disabling
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, mehdi.djait@intel.com
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-7-sakari.ailus@linux.intel.com>
 <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 13-Jan-26 03:59, Bingbu Cao wrote:
> Sakari and Hans,
> 
> On 1/12/26 5:59 PM, Sakari Ailus wrote:
>> From: Hans de Goede <hansg@kernel.org>
>>
>> When the test-pattern control gets set to 0 (Disabled) 0 should be written
>> to the test-pattern register, rather then doing nothing.
>>
>> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>  drivers/media/i2c/ov01a10.c | 11 ++++-------
>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>> index dd2b6d381175..3ad516e4d369 100644
>> --- a/drivers/media/i2c/ov01a10.c
>> +++ b/drivers/media/i2c/ov01a10.c
>> @@ -249,9 +249,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
>>  static const char * const ov01a10_test_pattern_menu[] = {
>>  	"Disabled",
>>  	"Color Bar",
>> -	"Top-Bottom Darker Color Bar",
>> -	"Right-Left Darker Color Bar",
>> -	"Color Bar type 4",
>> +	"Left-Right Darker Color Bar",
>> +	"Bottom-Top Darker Color Bar",
>>  };
>>  
>>  static const s64 link_freq_menu_items[] = {
>> @@ -406,10 +405,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>>  
>>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>>  {
>> -	if (!pattern)
>> -		return 0;
>> -
>> -	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
>> +	if (pattern)
>> +		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>>
> 
> It should be 'pattern - 1', the pattern value for register start as 0.

This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
deliberately c2 because testing has shown that there is no difference
between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
"1 | OV01A10_TEST_PATTERN_ENABLE" to the register.

See the discussion here:

https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/

Regards,

Hans



