Return-Path: <linux-media+bounces-11403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C418C3FCA
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77CB81C21E62
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 11:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E55D14C5AF;
	Mon, 13 May 2024 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mTVa941V"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9C146A8B;
	Mon, 13 May 2024 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715599589; cv=none; b=Vhg6JYUELYKs6Lzx4xVuh3pzpzqFycVg50Slbet5wpNmP1avdXDOcXeEyLMzHzlvSW54WM3V+unJBBBBbQmn+jCFAdoOIjRkMf4IHPfSXBX06rJRwYJxe3t5mgIbDqj6/5lY+ObkHFLQhI2lqthMXP8g8z5ssrLbDc0t7gl+rFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715599589; c=relaxed/simple;
	bh=w6bXvTIiUpMD4wbwccXChfqc4hfumpC2Fp5Gf0Kx3Jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TEroiBp62BSpSsif/2elBxKeYprLZTIlC6ZK3cbZvCSH/pcVDQAc2k3gDcgHB0nJBIG0JKU9QDBj9KPWV0bYmlzQwhX/nXC24/W2tIPPUTJdeLDG4pzrxd6nmNBxqiDAsvPU3R5ByGgjpmpreGpCdVSBSprYyMkki1XHmPgXCRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mTVa941V; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44DBQ7LZ120561;
	Mon, 13 May 2024 06:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715599567;
	bh=eawYmx/H8bHfSzex1qDdS9vopfxAzhLAnG6LsubXIAc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mTVa941Vc+32qCU2A+G8gQGpQNJUVjif86p6HO5cP8Mjap69/1yYgiv2Hvg9CZwWI
	 aKdBkNh7SOV+wtWX55ixUTiFFM1wj59EUiCSGs4JxanKU4ySbxUM7WGJAGLXRiK+0l
	 sgqsnCoOrTwSe86OgZBWpV8Qt0XSJ18pD19cBJtA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44DBQ7gs029885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 May 2024 06:26:07 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 May 2024 06:26:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 May 2024 06:26:07 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44DBPxsB051978;
	Mon, 13 May 2024 06:25:59 -0500
Message-ID: <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
Date: Mon, 13 May 2024 16:55:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
        <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
 <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

On 13/05/24 14:29, Andy Shevchenko wrote:
> On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
>> On 10/05/24 20:45, Jani Nikula wrote:
> 
> [...]
> 
>>> Moreover, I think the naming of round_up() and round_down() should have
>>> reflected the fact that they operate on powers of 2. It's unfortunate
>>> that the difference to roundup() and rounddown() is just the underscore!
>>> That's just a trap.
>>>
>>> So let's perhaps not repeat the same with round_closest_up() and
>>> round_closest_down()?
>>
>> Yes the naming is inspired by existing macros i.e. round_up, round_down
>> (which round up/down to next pow of 2) and DIV_ROUND_CLOSEST (which
>> round the divided value to closest value) and there are already a lot of
>> users for these API's :
>>
>>   linux-next git:(heads/next-20240509) ✗ grep -nr round_up drivers | wc
>>     730    4261   74775
>>
>>   linux-next git:(heads/next-20240509) ✗ grep -nr round_down drivers | wc
>>     226    1293   22194
>>
>>  linux-next git:(heads/next-20240509) ✗ grep -nr DIV_ROUND_CLOSEST
>> drivers | wc
>>    1207    7461  111822
> 
> Side note, discover `git grep ...`: it's much much faster on Git index,
> than classic one on a working copy.
> 
>> so I thought to align with existing naming convention assuming
>> developers are already familiar with this.
>>
>> But if a wider consensus is to go with a newer naming convention then I
>> am open to it, although a challenge there would be to keep it short. For
>> e.g. this one is already 3 words, if we go with more explicit
>> "round_closest_up_pow_2" it looks quite long in my opinion :) .
> 
> You need properly name the macros. Again, round_up() / roundup() and
> roundup_pow_of_two() are three _different_ macros, and it's not clear
> why you can't use one of them in your case.
> 

I can't use any of these because these macros either round up or round down,
whereas I want to round to closest value for the argument specified by the
user, be it achieved either by rounding up or rounding down depending upon
whichever makes the answer closer to the user-specified argument.

To make it clear, I have already included the examples in the macro
description [2], copying it here, maybe I can put the same examples in the
commit message too to avoid confusions :

round_closest_up(17, 4) = 16
round_closest_up(15, 4) = 16
round_closest_up(14, 4) = 16

round_closest_down(17, 4) = 16
round_closest_down(15, 4) = 16
round_closest_down(14, 4) = 12

Coming back to naming, this is as per existing convention used for naming
round_up, round_down (notice the `_` being used for macros working with pow of
2) and DIV_ROUND_CLOSEST (notice the work `closest` used to specify the answer
to be nearest to specified value). Naming is a bit subjective, but I
personally don't think it is a good idea to go away with the existing naming
convention or go with longer names.

> The patch that changes those to a new one are doubtful to begin with.
> I.e. need a careful review on the arithmetics side of the change
> including HW capabilities of handling "closest" results.
> 

This is already tested from my side, in-fact I have posted some of the results
in cover-letter with these macros [1] :

Regarding hardware capabilities, it uses existing round_up, round_down macros
underneath which are optimized to handle pow of 2 after modifying the user
provided argument using addition/subtraction and division, so I don't think it
should generally a problem with the hardware.
And I see other macros DIV_ROUND_CLOSEST [3] already using similar operations
i.e. addition/subtraction and division so don't think it should be a problem
to keep similar other macros in the same file.

[1]:
https://gist.github.com/devarsht/de6f5142f678bb1a5338abfd9f814abd#file-v7_jpeg_encoder_crop_validation-L204
[2]: https://lore.kernel.org/all/20240509183952.4064331-1-devarsht@ti.com/
[3]: https://elixir.bootlin.com/linux/latest/source/include/linux/math.h#L86

Regards
Devarsh

