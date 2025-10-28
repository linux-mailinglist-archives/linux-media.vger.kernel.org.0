Return-Path: <linux-media+bounces-45840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2FC15A3C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36D13AEB3E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F45D222562;
	Tue, 28 Oct 2025 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1Yk3uKu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993A13AD1C;
	Tue, 28 Oct 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666778; cv=none; b=pmVpITjDM3jsXyVmAT7xtIdKSfHKvxJLryv9zrao7flQsk614uhkYKbJLpS7fHaaXEinANN/lTPwl7d/zrZ7Vv5Hr85Br4U7FFSbra23EqraCP5yc9eDT0MNU+MJapa45QvqlCXN41szVxrJ3jJVI/NDvz8TqDzXSHEP5Y2NcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666778; c=relaxed/simple;
	bh=FmyANCV9+SVsaX4PV2PPlRqqhAr91iZA7dBivsBkX7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecsSeOAmQGc+23A2Ge3K8DFr9CG3ggfbLNAVvqNYvi2xWy/jLDfSbSK7Uhwrm1YO/gNgcbSwiRuh4ZrOWYBS3vF7T71hBG6F30sfLDNIFrHihRTts873MFGtIPJdjOeobRvdQLrVpc3FhgtrpBbUdi5HfUfZWbAx6Pb5E1GPD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1Yk3uKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9DDC4CEE7;
	Tue, 28 Oct 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761666777;
	bh=FmyANCV9+SVsaX4PV2PPlRqqhAr91iZA7dBivsBkX7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1Yk3uKuhyljBO+af1oe49BpY5yGnzvTNki4mYrUAvEoVoE7WayMfE4SOoTFphAQu
	 8TQ+V2upJ+gU4R1+WYeaG2wjB+/sxGc/oejskFBYjfgLwvjuC7xvw7NjsNnyr0YYxu
	 R8At99DmOD06Fxw1sbopqKAu0zb42ZVt8Vb5TddVhexIpM6acy+jOUuQMezhsDy8/6
	 ISKHKJG0lEePoLW1kUCLEFETQvTY6IzQVjX08kcfj8XyHs11IGyoLeBgaIHQhN+eQK
	 WuZv/Ek70ooMsbhIogmQfVkGPJIDInRy57HccomCBFJ55DGmHEqFWqqOEBM861lvuI
	 o1ioxv9dUTRbw==
Message-ID: <2bdea464-a75e-4be3-828c-5f2a7948715f@kernel.org>
Date: Tue, 28 Oct 2025 16:52:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-7-hansg@kernel.org>
 <rywqbh2ku7aexskohujwsiv7yzgn7lipgdqol3rqtkcvqrmn3q@c6oe7wc45hti>
 <8718bd8e-12b0-4c4e-9155-7e394f0d5a16@kernel.org>
 <jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Medhi,

On 28-Oct-25 4:38 PM, Mehdi Djait wrote:
> Hi Hans,
> 
> On Tue, Oct 28, 2025 at 03:38:28PM +0100, Hans de Goede wrote:
>> Hi Mehdi,
>>
>> Thank you for all the reviews and testing.
>>
>> On 28-Oct-25 1:08 PM, Mehdi Djait wrote:
>>> Hi Hans,
>>>
>>> Thank you for the patches!
>>>
>>> On Tue, Oct 14, 2025 at 07:40:14PM +0200, Hans de Goede wrote:
>>>> When the test-pattern control gets set to 0 (Disabled) 0 should be written
>>>> to the test-pattern register, rather then doing nothing.
>>>>
>>>
>>> A small question: Do you see any difference between test_pattern 1 and
>>> test_pattern 2 or I did not look hard enough at the screen ?
>>
>> IIRC the one has the colors fading (a bit) from left to right and
>> the other from top to bottom ?
> 
> I see:
> 1 and 2 are the same ?!
> 3 fading from left -> right
> 4 fading from top  ->  bottom

That might very well be correct. Unfortunately I no longer
have access to the Dell XPS 13 9320 I tested this on, so I cannot
confirm.

I think I should squash the following fix into this one:

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 6a1ab5fa70a2..1fe643cb1e6b 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -215,9 +215,8 @@ static const struct reg_sequence ov01a1s_regs[] = {
 static const char * const ov01a10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
+	"Left-Right Darker Color Bar",
 	"Top-Bottom Darker Color Bar",
-	"Right-Left Darker Color Bar",
-	"Color Bar type 4",
 };
 
 static const s64 link_freq_menu_items[] = {
@@ -318,7 +317,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 {
 	if (pattern)
-		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
+		pattern |= OV01A10_TEST_PATTERN_ENABLE;
 
 	return cci_write(ov01a10->regmap, OV01A10_REG_TEST_PATTERN, pattern,
 			 NULL);

This skips setting 0 as the pattern, since 0 is the same as 1,
removes the weird "Color Bar type 4" from the menu and fixes
the order of the 2 fading controls.

Can you give this a test ?

Regards,

Hans



