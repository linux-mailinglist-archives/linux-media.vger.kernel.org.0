Return-Path: <linux-media+bounces-11660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBC8C9EAF
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 16:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046271F220D7
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049CE13698A;
	Mon, 20 May 2024 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zg5m/EYe"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F35337F;
	Mon, 20 May 2024 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214919; cv=none; b=HfXghVzelYSTFmUBpjD59uBLiMUuQ1v3iW08ZudWFDOiCJfGez2rBQy2Hb3Ra60dIrNueUKSHV9OdQac7MIOddxVQIoCyU5I+jluNFSo5aSfSsazh4ac4m3r9N8YCOFsBdTX/3V154oaqYDFh1JwjwR7qixl8tg41Roq9i0wJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214919; c=relaxed/simple;
	bh=W8ut+XNbQ2V6AEIhii4Uzcp3qt/xqI/pHaxJswk+rZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NZ1wFfm7zkN5aI3mq2XnEybGlPH3jel5pUDb3ThatcBIJES2qYrR8Tugvc1oguFWf6vPvi+Z5zKhY8bVMk79E81ge9tj5B+5eE83sr0l95Kckfo5373290YvOyIrgVAyi4eo4W/BSxlVUbMfRmCyYhw9WiZyPWmvp/QcSJk7E4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Zg5m/EYe; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44KELX8Y090865;
	Mon, 20 May 2024 09:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716214893;
	bh=SkFgN9UwfacOpW7pnIR1XMF1buDzs5cFhviEj/eFykI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Zg5m/EYePT4COBPibcYNKHuApVYotWNtdx7jyQUacVYFhsP1FyMRIQqYvd4pWX3t/
	 O9iz0rUndYEzkkT9hsHbljGJrngJuE91+OjQPU45izy7KwJXpGL2jcO4w6M6Wz44qm
	 RvwKLQN+e3hxtzwAecI05FATGorJRjeog3y8KuWE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44KELX1U045568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 May 2024 09:21:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 May 2024 09:21:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 May 2024 09:21:32 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44KELOPC079538;
	Mon, 20 May 2024 09:21:25 -0500
Message-ID: <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
Date: Mon, 20 May 2024 19:51:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Daniel Latypov <dlatypov@google.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
        <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
        <davidgow@google.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
 <ZktAlza1zEke1eCx@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZktAlza1zEke1eCx@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 20/05/24 17:52, Andy Shevchenko wrote:
> On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
>> On 18/05/24 01:44, Andy Shevchenko wrote:
>>> On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:
> 
> [..]
> 

[..]
> Yes, and one should follow IWYU principle and not cargo cult or whatever
> arbitrary lists.
> 

Agreed.

>>>> +#include <linux/lcm.h>
>>>
>>> + math.h // obviously
>>> + module.h
>>>
>>>> +#include <linux/reciprocal_div.h>
>>>
>>> + types.h
>>
>> All the above headers are already included as part of kernel.h
> 
> Yes, that's why you should not use "proxy" headers.
> Have you read the top comment in the kernel.h?
> 

Yes, it says it is not recommended to include this inside another header file.
Although here we are adding it inside c file, but I can still try avoid it and
include only the required headers instead of kernel.h as you recommended.

Regards
Devarsh

