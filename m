Return-Path: <linux-media+bounces-11378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BCB8C32EF
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 19:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B3E1F213F5
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 17:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C228B1BF38;
	Sat, 11 May 2024 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="leBQbhMF"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318F1CA80;
	Sat, 11 May 2024 17:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715448422; cv=none; b=idNn1x8b7p+6zABGsYkWKWhGOdUkV9fG9kLuSCWljZVnXaBBCuvNLoI1g456IO+F2JzYg+N1g4cZKI6Wwy9tbHYJ5yxK1fvurVndeVzITN1NQhUVLwPM9PQ5QoYRHh6anRD7+8vycEIZblDBI1M5ta4O1tuXIpsnX58wlfTx/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715448422; c=relaxed/simple;
	bh=vaVInwXwR/E0yMJbauCvVRv14QOu3xmBUd2260ucV5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rySg5ubE8fhR0e6FU06vbIKoacJoV8whUKMtrDc/d9pdNvLg0LmE1dAy+jWDZjicAOa5OuR41NXxh/BXMrrOWiOUGLi5X20y9nZiX+wpTuxkt/KMi5aHdN0WEV7JkP3Kw501RlKojn5TG8qWYGlNOrRQtvFb4GqWgQ1HnY+Mq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=leBQbhMF; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BHQg4Z027197;
	Sat, 11 May 2024 12:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715448402;
	bh=6K8Nz8BB11B/MMWfWwV1JBB5EmA0ZBK0yGA1FoNg3Dg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=leBQbhMFjAOfW+sqINXw6MXfsHCNBMTxzzaSDo+u411Je0bVsLGalDgDfZmjKPoUU
	 TvlGKYTMcCpfH9/dmKzUUBg3IwynDRwYm12ZctAWNNy5tARp9r0LK2pbkzN3/wVzcy
	 Y449/faFuo/sgya/ZDhIGzby+qXsSU/79+icgwks=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BHQgWG118711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 May 2024 12:26:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:26:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:26:42 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BHQVPB112101;
	Sat, 11 May 2024 12:26:32 -0500
Message-ID: <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
Date: Sat, 11 May 2024 22:56:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zj42vTpyH71TWeTk@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the quick review.

On 10/05/24 20:31, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
>> Add macros to round to nearest specified power of 2.
> 
> This is not what they are doing. For the above we already have macros defined.
> 

Sorry I did not understand this comment, if you are talking about
existing macros round_up & round_down they either round "up" and round
"down" to specified power of 2 as specified here [1].
whereas the macros introduced in this patch round to "nearest" specified
power of 2.

>> Two macros are added :
> 
> (Yes, after I wrapped to comment this line looks better on its own,
>  so whatever will be the first sentence, this line should be separated
>  from.)
> 

Agreed.

>> round_closest_up and round_closest_down which round up to nearest multiple
> 
> round_closest_up() and round_closest_down()
> 
> 
>> of 2 with a preference to round up or round down respectively if there are
>> two possible nearest values to the given number.
> 
> You should reformulate, because AFAICS there is the crucial difference
> from these and existing round_*_pow_of_two().
> 

In math.h, we already have round_up/round_down macros which rounded
up/down to next specified power of 2. Then we had the DIV_ROUND_CLOSEST
which used the suffix _CLOSEST to imply the meaning that divided value
will be rounded to nearest/closest int value either by rounding up or
rounding down.

So inspired from naming convention of this macros given developers are
already familiar with them, I used round_closest for specifying the
rounded value to nearest/closest value which can be achieved either by
rounding up/down. And I also wanted user to have finer control for the
scenarios where there are two possible nearest values :

For e.g round(160, 64) can be either 192 and 128 and both are 32 away
from 160.

And that's the reason I went ahead with two macros instead i.e
round_closest_up, round_closest_down so that developers can choose
exactly what they want.

Regards
Devarsh

