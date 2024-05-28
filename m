Return-Path: <linux-media+bounces-12081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD38D1950
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854D61C21978
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ECF16C84A;
	Tue, 28 May 2024 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wuGTpzYn"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D116C69F;
	Tue, 28 May 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895336; cv=none; b=cuWZVyJ2Bj20FovpDlCho/otdiMjp9/TOSaBRR05FNfohUqUg9YQAs6QbVgpPf9IMV3iqGVKYGq1W2QAjzuCt0bJW/LJmPuK0h0JkIgTlH7EG+21+gmlH/gzz93rByBZBnj6lJ8qPXzyFao7k4hC7LYY7kquFJH8A3p+nXGQHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895336; c=relaxed/simple;
	bh=GjmT2bEqMBnoTSgHTxCU0dHsFJxOjGlZl+fZ27D94Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lQHtjZ/iNPzykisr4S0tMD8jV2ln/evt74hWlGg2lec4aQwcsuuPRQ8mhD2x/aq6g/4nupHmwz3/6gQg1Qr8ElPbeCL1QbwxbRiMDI6A2vKfrHRDzk5Yhxkae57CU0kUNVJO6Nv7PBvPEaiZ5a23Pf57nb2d4kdcEnBWHumCt64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wuGTpzYn; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44SBLueP049633;
	Tue, 28 May 2024 06:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716895316;
	bh=LsFWexuqmOIvPySLRES2Xzrrtm5Z8axMJcdqDhRHPIU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wuGTpzYnhl01qto8/tnlANOM/r0jXRM08h9L6jT3vpx+HKPSyZFE91q9bj9aJFi8g
	 1HXCdhmat6FK/RzElvVGnhxo1Bsjcn/fPgXO/2Zlt0Ibpi0wtow5wW0i5HIQ+l5UhN
	 U9vh0FjduxBxcEhRqpI77VJv4YdAG4wDmtowNoyA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44SBLuU9046143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 May 2024 06:21:56 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 May 2024 06:21:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 May 2024 06:21:56 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44SBLkbg062841;
	Tue, 28 May 2024 06:21:47 -0500
Message-ID: <4a8cea8c-4575-bdd8-e8a8-634a2b267ff5@ti.com>
Date: Tue, 28 May 2024 16:51:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
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
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the review.

On 28/05/24 02:07, Andy Shevchenko wrote:

[..]
>> +#include <kunit/test.h>
>> +#include <linux/gcd.h>
>> +#include <linux/lcm.h>
> 
> + math.h (where abs()/DIV_ROUND_*()/etc come from?)
> I believe I mentioned that.
> 

I did compile and test this, so math.h was indirectly getting included via
some other header file already included but I would not rely on that and
include math.h separately as you suggested.

>> +#include <linux/reciprocal_div.h>
> 
> ...
> 
>> +MODULE_LICENSE("GPL");
> 
> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().
> 

Indeed, it gives below logs, let me add that too.
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/math_kunit.o


Regards
Devarsh

