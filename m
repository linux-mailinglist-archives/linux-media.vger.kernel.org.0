Return-Path: <linux-media+bounces-50547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66712D18208
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72254308C8F8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DF932D0CF;
	Tue, 13 Jan 2026 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVBYAwBZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A716E2DCBF8
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300908; cv=none; b=BjqrE55C2UMn+uErgj4eMB6+qIAfV/gD96dNi0QELEcLMJ3XkvjV9C/OFnwrZ2SOl0uRmETtyKfEibg8BhlDrGTzdxZcKFDYkG1yOwYRJzBDkxmU5dVuZ00uaCRoGjjeLxhVdPcO9uWzPJ44R4ztFq217ePaWN7xX8VbTbMqyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300908; c=relaxed/simple;
	bh=qCxGQQ8vuvflodeKSq+dNFzMMPQZ1XjSbAxSQfy1R6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQpXKQsb2rP2XGtcSabQqkt/HoOWtW7moLbGahztcKMUMSA7Vi5L3yJrYCqz6sNFpmlqh+zyMu/sZeuSe5nRspBSF5zFfEULv9W40l4hFDyTiBc8el1SCFqoUMgjOTpce3kA4LTojI4vsTlCwrNt/KtaKxFdWsqesUcdIaMAFdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVBYAwBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45807C16AAE;
	Tue, 13 Jan 2026 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300908;
	bh=qCxGQQ8vuvflodeKSq+dNFzMMPQZ1XjSbAxSQfy1R6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IVBYAwBZ+vMH2wbfgFdZbMUrVnCg1ABjPOKaB11LoFMmlj+ggK2/DdJoQGAgqjnmu
	 TrZgyO5TbyC1Jgh1SU7vKPjFKu7Q6h5uvxaPDj6l+YLHMrgU263rc3N7vvIAIbsKYw
	 n2s+neuM6gG0lsLJUBp1lBOzlNjkRKUHdFSOWkch4l/YbXWyspfVv3eI5VegNcjkll
	 mORMJcagnyCyhNgB6cHCdOmE6AJcGNANMsPWXSokwDwWRJrK5pV0soRp5sG9s1j2Gw
	 yPdsLVcLBPNU4kXQu6VOho10qZZE0UH01LC7FRbsbCj+BwtqAy2EaY0XiV9Rx4S3b3
	 ImhTJ8qaX1YWg==
Message-ID: <63c5c77a-f0f0-42ca-89fd-11b183f15ac6@kernel.org>
Date: Tue, 13 Jan 2026 11:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] media: i2c: ov01a10: Fix test-pattern disabling
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
 mehdi.djait@intel.com
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
 <20260112095949.3851-7-sakari.ailus@linux.intel.com>
 <419da2e9-1532-a39c-e4e6-dad0141e1002@linux.intel.com>
 <aWX-ykmED-tw3pdo@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aWX-ykmED-tw3pdo@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Jan-26 09:14, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thank you for the review!
> 
> On Tue, Jan 13, 2026 at 10:59:51AM +0800, Bingbu Cao wrote:
>> Sakari and Hans,
>>
>> On 1/12/26 5:59 PM, Sakari Ailus wrote:
>>> From: Hans de Goede <hansg@kernel.org>
>>>
>>> When the test-pattern control gets set to 0 (Disabled) 0 should be written
>>> to the test-pattern register, rather then doing nothing.
>>>
>>> Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>> Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
>>> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
>>> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>>  drivers/media/i2c/ov01a10.c | 11 ++++-------
>>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>>> index dd2b6d381175..3ad516e4d369 100644
>>> --- a/drivers/media/i2c/ov01a10.c
>>> +++ b/drivers/media/i2c/ov01a10.c
>>> @@ -249,9 +249,8 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
>>>  static const char * const ov01a10_test_pattern_menu[] = {
>>>  	"Disabled",
>>>  	"Color Bar",
>>> -	"Top-Bottom Darker Color Bar",
>>> -	"Right-Left Darker Color Bar",
>>> -	"Color Bar type 4",
>>> +	"Left-Right Darker Color Bar",
>>> +	"Bottom-Top Darker Color Bar",
>>>  };
>>>  
>>>  static const s64 link_freq_menu_items[] = {
>>> @@ -406,10 +405,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>>>  
>>>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>>>  {
>>> -	if (!pattern)
>>> -		return 0;
>>> -
>>> -	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
>>> +	if (pattern)
>>> +		pattern |= OV01A10_TEST_PATTERN_ENABLE;
>>>
>>
>> It should be 'pattern - 1', the pattern value for register start as 0.
> 
> I'll use:
> 
> 	if (pattern)
> 		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
> 
> 
> I already sent a PR so I'll add a new patch for this.

There is no need for this the v2 patch is correct,
copy paste of me reply to Bingbu's original review explaining things:

This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
deliberately in v2 because testing has shown that there is no difference
between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
"1 | OV01A10_TEST_PATTERN_ENABLE" to the register.

See the discussion here:

https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/

Regards,

Hans




