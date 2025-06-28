Return-Path: <linux-media+bounces-36148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BAAEC65E
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 11:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A531D1731C7
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 09:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC732417C2;
	Sat, 28 Jun 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4/008Hr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA122127B
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751102846; cv=none; b=Y93/XpVJr5NicOlW3x4SIxy9odyO875MD0vcdzwWYBUsncmKjPPv5fjLncq13gtXL3I9+VAPvDLZJDHp4jVtUia3frZJ8qut+j0NmABTAj8Nw8rTgYijLgOmjEvGIdNIEctvAZBnT+XLCJygQShzHkfS7O9iXjr8jVI9ibk1rqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751102846; c=relaxed/simple;
	bh=0WKKG+tvSUfwGCdkD0UbRJ6Chet9cdb0LcwbVcPiF8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYWJ3ulq4doe+N1jrByS5Qo1eKha0/VENIgmYf3V94DWMVF/ZhJLOsrcCzXfXUoBEbfiOaUJp1v3EJwnYgUVk3vI7CDt+EnVBH+1uWeb6Xn8Ckdqgn196Dm1Yi0zsqkW7un6AyBMFFl/Tt71CKCN+UnCiwkMKxTAgSnGOrgrIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4/008Hr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED17AC4CEEE;
	Sat, 28 Jun 2025 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751102846;
	bh=0WKKG+tvSUfwGCdkD0UbRJ6Chet9cdb0LcwbVcPiF8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f4/008Hr1lFCK94/ixHlr/cBeSRFY8/eUp2bXPY8VQkCfzMtEKFVgRf4XKFO/09bq
	 xlPhIvWMgR1sUDjaBwSVqVRCXklek7CMqo3EXhLVv1GlSS7/N7//s+8epccJtOYtx3
	 OjV4mbbh1eDeC4yjlEeejnMZOS9K3qDkTOWpjA8Csh7JTt44SVj49napQulRiP3o8d
	 anR4iFvRcCGqlnqcJQogX5/922CuVAuH9x+2OjOfTBbUw036RX4UEKegzz4q8SKxKP
	 tJ2wTiTmBJ5Jzmqt7/i5dpXPFDaXZVo51V1uSvmsguV5sDb6palstBL7bVloT1y4y+
	 jvW+zwaWlERoQ==
Message-ID: <86d8d80e-8ce5-477e-be81-f8a46a021d5b@kernel.org>
Date: Sat, 28 Jun 2025 11:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get PLL
 values
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mathis Foerst <mathis.foerst@mt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-4-hansg@kernel.org>
 <20250603105712.GA27361@pendragon.ideasonboard.com>
 <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>
 <20250603140557.GB12117@pendragon.ideasonboard.com>
 <40f968d7-2c88-4eb4-b9ce-604de03bf7be@kernel.org>
 <20250627180639.GE24912@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250627180639.GE24912@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 27-Jun-25 8:06 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Jun 27, 2025 at 04:33:46PM +0200, Hans de Goede wrote:
>> On 3-Jun-25 4:05 PM, Laurent Pinchart wrote:
>>> On Tue, Jun 03, 2025 at 03:29:42PM +0200, Hans de Goede wrote:
>>>> On 3-Jun-25 12:57 PM, Laurent Pinchart wrote:
>>>>> On Sat, May 31, 2025 at 06:31:38PM +0200, Hans de Goede wrote:
>>>>>> Before this change the driver used hardcoded PLL m, n and p values to
>>>>>> achieve a 48MHz pixclock when used with an external clock with a frequency
>>>>>> of 24 MHz.
>>>>>>
>>>>>> Use aptina_pll_calculate() to allow the driver to work with different
>>>>>> external clock frequencies. The m, n, and p values will be unchanged
>>>>>> with a 24 MHz extclk and this has also been tested with a 19.2 MHz
>>>>>> clock where m gets increased from 32 to 40.
>>>>>>
>>>>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Add select VIDEO_APTINA_PLL to Kconfig
>>>>>> - Use correct aptina_pll_limits
>>>>>> ---
>>>>>>  drivers/media/i2c/Kconfig   |  1 +
>>>>>>  drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
>>>>>>  2 files changed, 40 insertions(+), 15 deletions(-)

...

>>>>>> @@ -2262,12 +2262,29 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
>>>>>>  
>>>>>>  static int mt9m114_clk_init(struct mt9m114 *sensor)
>>>>>>  {
>>>>>> +	static const struct aptina_pll_limits limits = {
>>>>>> +		.ext_clock_min = 6000000,
>>>>>> +		.ext_clock_max = 54000000,
>>>>>> +		/* int_clock_* limits are not documented taken from mt9p031.c */
>>>>>> +		.int_clock_min = 2000000,
>>>>>> +		.int_clock_max = 13500000,
>>>>>> +		/*
>>>>>> +		 * out_clock_min is not documented, taken from mt9p031.c.
>>>>>> +		 * out_clock_max is documented as 768MHz, but this leads to
>>>>>> +		 * different PLL settings then used by the vendor's drivers.
>>>>>
>>>>> s/then/than/
>>>>>
>>>>> Is that an issue though ? Does it prevent the sensor from working ?
>>>>
>>>> I did not try. It seems safer to just stick with the tested / proven
>>>> values from the older register-list based drivers?
>>>
>>> Sometimes there are multiple options without any practical differences.
>>> I wouldn't necessarily assume we have to follow the hardcoded register
>>> values. Can you share the two PLL configurations ?
>>>
>>>> Even if it does work on my single mt9m114 sensor, that hardly
>>>> constitutes testing on a representative sample.
>>>
>>> This sensor is rather old and not widely used. If using the correct
>>> limits doesn't cause issues on platforms we can test, that's good enough
>>> for me. We can always address problems later if any arise.
>>
>> Ok, so I've tried setting out_clock_max to 768MHz, but that results
>> in PLL setting which cause the sensor to fail to stream.
> 
> Thank you for testing.
> 
> Could you share the PLL configuration you obtain with the 400 MHz and
> 768 MHz limits ?

400 MHz out_clock_max, working setup:

[   40.136435] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
[   40.136453] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
[   40.136463] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 8
[   40.136473] mt9m114 i2c-INT33F0:00: PLL: N 2 M 40 P1 8

768 MHz non working setup:

[   28.388940] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
[   28.388955] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
[   28.388966] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 16
[   28.388976] mt9m114 i2c-INT33F0:00: PLL: N 2 M 80 P1 16

Regards,

Hans



