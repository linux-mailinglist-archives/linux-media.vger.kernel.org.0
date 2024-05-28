Return-Path: <linux-media+bounces-12079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F4E8D18A3
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD90A289D5E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABAF16B728;
	Tue, 28 May 2024 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XSl0VC+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F9F17C7F;
	Tue, 28 May 2024 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716892383; cv=none; b=u55uTCFMQJUR0sP12huBdLq+orx6/NXle0ESVc6ioNnQSh9t5sRwHTtPkox1csS+PxP++xgMYlU8CGvRow+VfiLXvKiGFS2cO5A9xNP35w8pKoz4yc42EB2J6n7g4na72MjUWstFOojIVQ+SLDodGirKYK6LDMG5zrTX/Qop+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716892383; c=relaxed/simple;
	bh=kJszahZmfi51bW87cVG6RHvXrE/UgDhUeaaij8xzOac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sRi9VKo3rNv1TtIy5GXu4ktwAf1ad0uJq0GgkLkorLAhBzl2aosA3sZydgchBAeBvBI/FzGN5hV9K/X24pg0hif1Dq2cXgINLsghlDW2DfdNNGMfeGYvSpYb1C11fiHVe1EIjFTBJDrGh4yDRMSCThs93HsiXK9aaGp2sxSVSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XSl0VC+Y; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44SAWeAJ016018;
	Tue, 28 May 2024 05:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716892360;
	bh=fhM8umhhiFzOsQ7NzwP9rqG6fzIi2j17UUh3XrA9av4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XSl0VC+Yfi+BjJdSXwgKkRbMPnFl8ZZzczn/3EpXy35kecRoYRg9rq/hOlqHaNGMo
	 mM/F77gLUPG0lC4/TCkbvtH1QrRfLe/HiLUrof7efeosumfH7Xc7CqoRSGoojwEVAU
	 w8ckzDWUiLp18RSvJlaLKQUqYpe7asoJgCTXXcI4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44SAWewA017903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 May 2024 05:32:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 May 2024 05:32:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 May 2024 05:32:40 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44SAWVsL025055;
	Tue, 28 May 2024 05:32:32 -0500
Message-ID: <86f9ed66-c58e-0b2d-dd2b-4372ff26a3c3@ti.com>
Date: Tue, 28 May 2024 16:02:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 06/10] math.h: Add macros for rounding to closest value
Content-Language: en-US
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
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180856.1124470-1-devarsht@ti.com>
 <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the review.

On 28/05/24 02:02, Andy Shevchenko wrote:
> On Sun, May 26, 2024 at 11:38:56PM +0530, Devarsh Thakkar wrote:
...

>> +/**
>> + * round_closest_up - round closest to be multiple of specified value (which is
>> + *                    power of 2) with preference to rounding up
>> +
> 
> Not that big deal, but missing '*' here. Personally I would not even put
> a blank line between Summary and Field Descriptions.
> 

My bad. Yes I would remove the blank line here. This is picked up as warning
from kernel-doc too.

>> + * @x: the value to round
>> + * @y: multiple to round closest to (must be a power of 2)
>> + *
>> + * Rounds @x to closest multiple of @y (which must be a power of 2).
>> + * The value can be either rounded up or rounded down depending upon rounded
>> + * value's closeness to the specified value. If there are two closest possible
>> + * values, i.e. the difference between the specified value and it's rounded up
>> + * and rounded down values is same then preference is given to rounded up
>> + * value.
>> + *
>> + * To perform arbitrary rounding to closest value (not multiple of 2), use
>> + * roundclosest().
>> + *
>> + * Examples :
> 
> What is this suppose to be rendered to?
> 

The file math.h is not rendered as part of kernel-doc right now. I can put
this under Documentation/core-api/kernel-api.rst perhaps I can create a new
section as below:

Rounding, absolute diff and 32bit division macros
-------------------------------------------------

under the section:
CRC and Math Functions in Linux

===============================

is that okay ?

>> + * round_closest_up(17, 4) = 16
>> + * round_closest_up(15, 4) = 16
>> + * round_closest_up(14, 4) = 16
> 
> Btw, is kernel-doc validator happy about all kernel docs you added?
> 

Yes, except the aforementioned blank line.

Regards
Devarsh

