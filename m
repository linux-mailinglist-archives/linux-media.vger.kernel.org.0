Return-Path: <linux-media+bounces-36101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4F3AEB9EC
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1A8163691
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80302206AF;
	Fri, 27 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MX1+L2z/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C13234
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034830; cv=none; b=ZL++Ph9z3l0MM1lI3fgPqvlRFslT8WhaHgr2DaEUiGEOcS1LBMljpL90C7+83CsoC6c38t+GN91YLODF5q2vm5yVYCSkaUXIWfvcCzWC42MHJOc5a9EfmU+oPUmqjMjsq1qDc38qcL8WCYjqBImkPQIB3OhiryM74ig4i4eJqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034830; c=relaxed/simple;
	bh=rl9EYbyT0y9FYZdvewg/K/Xb4dTKsSavzm2Eb+vSW6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/+4tUBQbqmFK9A7KnDkAVPy6uZn9VvyyikyYdi6xmH/zuOOrJJ3QgOeHUHMQEJ40YZZolfMXdhL7CMdg8O0uHZI+xR9SLEbyRbk0pSWY/YZxR4sH/RYeQERKs62UOjo0qyp9AL8VWwoXSpGoBkPRZTZvRUjbgFnfErJ6QyfqpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MX1+L2z/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEB7C4CEE3;
	Fri, 27 Jun 2025 14:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751034829;
	bh=rl9EYbyT0y9FYZdvewg/K/Xb4dTKsSavzm2Eb+vSW6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MX1+L2z/28XVmVpF5DstGnjakJVc528PkdM9WvtoqKYVIQbM8yt3akGNma83UAkKX
	 tAbw+ghTVF6NT93pjKzpSdFUjV5FzNqMsoV0waYXmkDxcZnQHItKfTrLVD6HkPQIH4
	 EGHnnbBPVFifvxgsd+lCkQFjf1AH7NRRwd/0whglfFjPR4Cg8TxR19HVko7VSk5DFs
	 tTuP2wIFNKBjbBzPieuEb9mgur5P8RVhr4DRI5YN+C55QL7Ft5rewSEpgH6giYxiUL
	 yefwcwTeRP0ggWfoO63SB+22n4NhxCGKP3C9o/Lg4vbfYTtp8Gi4sD5THG7KgW8J4n
	 ekiRXklqqpSBg==
Message-ID: <40f968d7-2c88-4eb4-b9ce-604de03bf7be@kernel.org>
Date: Fri, 27 Jun 2025 16:33:46 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250603140557.GB12117@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 3-Jun-25 4:05 PM, Laurent Pinchart wrote:
> On Tue, Jun 03, 2025 at 03:29:42PM +0200, Hans de Goede wrote:
>> On 3-Jun-25 12:57 PM, Laurent Pinchart wrote:
>>> On Sat, May 31, 2025 at 06:31:38PM +0200, Hans de Goede wrote:
>>>> Before this change the driver used hardcoded PLL m, n and p values to
>>>> achieve a 48MHz pixclock when used with an external clock with a frequency
>>>> of 24 MHz.
>>>>
>>>> Use aptina_pll_calculate() to allow the driver to work with different
>>>> external clock frequencies. The m, n, and p values will be unchanged
>>>> with a 24 MHz extclk and this has also been tested with a 19.2 MHz
>>>> clock where m gets increased from 32 to 40.
>>>>
>>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>>> ---
>>>> Changes in v2:
>>>> - Add select VIDEO_APTINA_PLL to Kconfig
>>>> - Use correct aptina_pll_limits
>>>> ---
>>>>  drivers/media/i2c/Kconfig   |  1 +
>>>>  drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
>>>>  2 files changed, 40 insertions(+), 15 deletions(-)

...

>>>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>>>> index 5a7c45ce2169..e12c69dc9df0 100644
>>>> --- a/drivers/media/i2c/mt9m114.c
>>>> +++ b/drivers/media/i2c/mt9m114.c
>>>> @@ -31,6 +31,8 @@
>>>>  #include <media/v4l2-mediabus.h>
>>>>  #include <media/v4l2-subdev.h>
>>>>  
>>>> +#include "aptina-pll.h"
>>>> +
>>>>  /* Sysctl registers */
>>>>  #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
>>>>  #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)

...

>>>> @@ -2262,12 +2262,29 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
>>>>  
>>>>  static int mt9m114_clk_init(struct mt9m114 *sensor)
>>>>  {
>>>> +	static const struct aptina_pll_limits limits = {
>>>> +		.ext_clock_min = 6000000,
>>>> +		.ext_clock_max = 54000000,
>>>> +		/* int_clock_* limits are not documented taken from mt9p031.c */
>>>> +		.int_clock_min = 2000000,
>>>> +		.int_clock_max = 13500000,
>>>> +		/*
>>>> +		 * out_clock_min is not documented, taken from mt9p031.c.
>>>> +		 * out_clock_max is documented as 768MHz, but this leads to
>>>> +		 * different PLL settings then used by the vendor's drivers.
>>>
>>> s/then/than/
>>>
>>> Is that an issue though ? Does it prevent the sensor from working ?
>>
>> I did not try. It seems safer to just stick with the tested / proven
>> values from the older register-list based drivers?
> 
> Sometimes there are multiple options without any practical differences.
> I wouldn't necessarily assume we have to follow the hardcoded register
> values. Can you share the two PLL configurations ?
> 
>> Even if it does work on my single mt9m114 sensor, that hardly
>> constitutes testing on a representative sample.
> 
> This sensor is rather old and not widely used. If using the correct
> limits doesn't cause issues on platforms we can test, that's good enough
> for me. We can always address problems later if any arise.

Ok, so I've tried setting out_clock_max to 768MHz, but that results
in PLL setting which cause the sensor to fail to stream.

So this should be kept at 400, I'll update the comment to reflect
that the datasheet says 768 but that that does not work.

Regards,

Hans



> 
>>>> +		 */
>>>> +		.out_clock_min = 180000000,
>>>> +		.out_clock_max = 400000000,
>>>> +		.pix_clock_max = 48000000,
>>>> +		.n_min = 1,
>>>> +		.n_max = 64,
>>>> +		.m_min = 16,
>>>> +		.m_max = 192,
>>>> +		.p1_min = 1,
>>>> +		.p1_max = 64,
>>>> +	};
>>>>  	unsigned int pixrate;
>>>> -
>>>> -	/* Hardcode the PLL multiplier and dividers to default settings. */
>>>> -	sensor->pll.m = 32;
>>>> -	sensor->pll.n = 1;
>>>> -	sensor->pll.p = 7;
>>>> +	int ret;
>>>>  
>>>>  	/*
>>>>  	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
>>>> @@ -2287,8 +2304,15 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
>>>>  	}
>>>>  
>>>>  	/* Check if the PLL configuration fits the configured link frequency. */
>>>> +	sensor->pll.ext_clock = sensor->clk_freq;
>>>> +	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
>>>> +
>>>> +	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>>  	pixrate = sensor->clk_freq * sensor->pll.m
>>>> -		/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
>>>> +		/ (sensor->pll.n * sensor->pll.p1);
>>>>  	if (mt9m114_verify_link_frequency(sensor, pixrate) == 0) {
>>>>  		sensor->pixrate = pixrate;
>>>>  		sensor->bypass_pll = false;
> 


