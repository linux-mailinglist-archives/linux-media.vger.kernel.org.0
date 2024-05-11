Return-Path: <linux-media+bounces-11379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D288C32FA
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 19:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D9F0282232
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 17:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB5E1C693;
	Sat, 11 May 2024 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JJmAY7o4"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856C81BC57;
	Sat, 11 May 2024 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715449305; cv=none; b=uUAxh/CyfdpVZPmkRj9dLyAw9VvqNARR8kyxSs5PZi3JnGGEdOmaEMngZ0oPN73wA8wSvoHiHS/+roFT8OR9zGEzBzyvBAay2/qjMqFEXL0Of/6fGCo1mJ4dS7jW2Xb8BKOGl4gz1s5CLOqQWaVJ2AATAXJCoWWUiHAoteZAwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715449305; c=relaxed/simple;
	bh=6KRvLIQLEzzBK+9haokroz6XdoCynKq4pJiaIZPv1sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A66Lm25jc55BwXseOD8Ero+hf6/aI7gRe0BPcKwlgDQs5XK0ccax77n2MeRPNvFaW3MEGFtDZU/m5GeszTm4BVObKvB6I74TG8iZY2qcxRgJbBlg5iD6loo1xW7bV1ZJuHw79octhi+7uwE3NUQFqfiPQIadPuLBEtYO6h9gmKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JJmAY7o4; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BHfOVn046086;
	Sat, 11 May 2024 12:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715449284;
	bh=pw+ZLlwg2gEIAOR81RylenKik2gTI8uK/0afhU0qznI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JJmAY7o4ILxTILk9xDc/hAw5+rKI0inDe3EPepH4qYO9pFQDa6cURdbY3LiK7g+ph
	 TKVhquIVNyXeaqtHiYjxwhqjZfgjLYSS7xQ/MC3NmdEAWbf7Gkbl7lSsrk/L7Z4L1H
	 CyTxYAP91Q+Rkdfnalzkev+px1YvmgYFGGu86qFc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BHfOMP025733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 May 2024 12:41:24 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:41:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:41:24 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BHfEjI022895;
	Sat, 11 May 2024 12:41:15 -0500
Message-ID: <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
Date: Sat, 11 May 2024 23:11:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
To: Jani Nikula <jani.nikula@intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <adobriyan@gmail.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <87fruphf55.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jani,

Thanks for the quick review.

On 10/05/24 20:45, Jani Nikula wrote:

[...]
> Moreover, I think the naming of round_up() and round_down() should have
> reflected the fact that they operate on powers of 2. It's unfortunate
> that the difference to roundup() and rounddown() is just the underscore!
> That's just a trap.
> 
> So let's perhaps not repeat the same with round_closest_up() and
> round_closest_down()?
> 

Yes the naming is inspired by existing macros i.e. round_up, round_down
(which round up/down to next pow of 2) and DIV_ROUND_CLOSEST (which
round the divided value to closest value) and there are already a lot of
users for these API's :

  linux-next git:(heads/next-20240509) ✗ grep -nr round_up drivers | wc
    730    4261   74775

  linux-next git:(heads/next-20240509) ✗ grep -nr round_down drivers | wc
    226    1293   22194

 linux-next git:(heads/next-20240509) ✗ grep -nr DIV_ROUND_CLOSEST
drivers | wc
   1207    7461  111822


so I thought to align with existing naming convention assuming
developers are already familiar with this.

But if a wider consensus is to go with a newer naming convention then I
am open to it, although a challenge there would be to keep it short. For
e.g. this one is already 3 words, if we go with more explicit
"round_closest_up_pow_2" it looks quite long in my opinion :) .

Regards
Devarsh

