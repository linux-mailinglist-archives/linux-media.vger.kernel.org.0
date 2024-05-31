Return-Path: <linux-media+bounces-12331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B028D5CF8
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1371C24367
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B4153BE8;
	Fri, 31 May 2024 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JFZF/qv5"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8177119;
	Fri, 31 May 2024 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144857; cv=none; b=CiocDelsMRFZurolQlcf8OVEBFL7mmVIZV/weh11abXXTPiVYZGuq+skzzFtWiSmuGtQJ4uF6T9TBUAswDL7Wsj0PnorKzhp6g5DIvqW9BUC4Xrf35f6wJKUhi3Zt0Hmoa+sjHZr5oaGb2BjnzXj7pjNNNRV2V78iypITCvxVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144857; c=relaxed/simple;
	bh=n53LUJiTyfPlPwjxPNjgOFz9J8C9aoVGy3fK0cOxpw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sapgZtJQBOU7O78bUf8u9wXBrRfwAHFZ5UA8igGIhj6AOutMDfnV+8NUIGz7baBwp7lAaLEU4GtQZGtXfVyNEBThjU8TGKrvbg8Vj39PuHjPaIxfyIpj/Fx17hasD0lbr1RYH437y2qJQ7bx7h/xrjsCf14OuLREGw7JqiR7seo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JFZF/qv5; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V8eaiQ062635;
	Fri, 31 May 2024 03:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717144836;
	bh=tIzkgTgvHmxlqsnNQ6szfWWdwYHm3PNqMyO61gH4JL8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JFZF/qv5UJv72ezgKb2LJ19CVdAuLnK2wEVdZW8z3uYShYOTl4y765u1lsYwKVhy1
	 Ydm5IPprz3zGMO/b2V8SXzMZUaNB2rlqphfNuL2/HjIkfGI6LStnAko1J099xzlYtj
	 hovfA7oHdP9katgYjS82DiYH0ws/corksUL20rg8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V8eaPZ086074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 03:40:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 03:40:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 03:40:36 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44V8eS16028924;
	Fri, 31 May 2024 03:40:29 -0500
Message-ID: <9b805bc2-02ea-8eec-8cb6-4fcd2cc0ba54@ti.com>
Date: Fri, 31 May 2024 14:10:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 08/11] lib: add basic KUnit test for lib/math
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
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171810.2764623-1-devarsht@ti.com>
 <ZljSJJtI-ADTUoc7@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZljSJJtI-ADTUoc7@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 31/05/24 00:53, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 10:48:10PM +0530, Devarsh Thakkar wrote:
>> From: Daniel Latypov <dlatypov@google.com>
>>
>> Add basic test coverage for files that don't require any config options:
>> * part of math.h (what seem to be the most commonly used macros)
>> * gcd.c
>> * lcm.c
>> * int_sqrt.c
>> * reciprocal_div.c
>> (Ignored int_pow.c since it's a simple textbook algorithm.)
>>
>> These tests aren't particularly interesting, but they
>> * provide short and simple examples of parameterized tests
>> * provide a place to add tests for any new files in this dir
>> * are written so adding new test cases to cover edge cases should be
>>   easy
>>   * looking at code coverage, we hit all the branches in the .c files
> 
> ...
> 
>> +#include <kunit/test.h>
>> +#include <linux/gcd.h>
>> +#include <linux/lcm.h>
>> +#include <linux/reciprocal_div.h>
> 
> Really, you ignored my comment a second (?) time? This is road to nowhere.
> You need to update the inclusion bloc in accordance with IWYU principle.
> I see a few headers are missing.
> 

Sorry I forgot to add those somehow. I will add module.h and math.h in v11.

Regards
Devarsh

