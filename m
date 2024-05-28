Return-Path: <linux-media+bounces-12082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9B8D198A
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 429071F23C61
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 11:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98F716D31F;
	Tue, 28 May 2024 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TmK2Z8ez"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73216C852;
	Tue, 28 May 2024 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716895922; cv=none; b=JWjUL34VDloE6IFs8hKlbI6EmJJi3PuWAGhvQ8ueqEHzKkvC4VgJg+i67RWKf20ejChRvMNXwMpin2XRh3XdL8zgT4zPzpm7wFbicIqKkEYke1C0R8mnoKgg2ekBqYuh+1m/gMF4vjbWbqV0ugP6qJmAU5xeWR97Gpn22u0sABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716895922; c=relaxed/simple;
	bh=s9zJsE3/1kg/YHUe1X0gPbq/JexKL+o52CjjXo5/REE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WYWQrJWO8Z4KcLsDTrWlTjodSxI6F8gP6SJmf4Q9mFNKWoByFmdclElDBrIbPo5eLxuKEhbOfS/+IDkTexBNVKJNyrsHQwsTRrM+1DusmjTYX+EqRyber1CngrBPq+x9NS4WwJMxolDT1Z0YqYpRwOqT9HH0CAmU4D7CGbppdmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TmK2Z8ez; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44SBVenp062222;
	Tue, 28 May 2024 06:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716895900;
	bh=VpSNru19mBz9l4/n9K1fomuoEtlk8IP8cCmAhFDqj9k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TmK2Z8ezSKCZDHjB/iSRmrlXraznKS7RMMA+qdqEiftotR/sCS9Vzjzc4zgo24O0s
	 h2JSxOhqLRvw3+8fYE1FAJ2tykEIoHb9RwtN/GyjQ8jrhMhuhk0epVj+Dk/W4bbQsA
	 ndHKMSvNYdQqNRncDgz+G+cgH4zgu1fDoe/BJOdQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44SBVect036639
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 May 2024 06:31:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 May 2024 06:31:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 May 2024 06:31:40 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44SBVVrb076827;
	Tue, 28 May 2024 06:31:32 -0500
Message-ID: <9c88bc47-35f0-86ed-2df7-dd83640d9997@ti.com>
Date: Tue, 28 May 2024 17:01:31 +0530
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
 <ZlTu_9orsuosNiGk@smile.fi.intel.com> <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 28/05/24 02:08, Andy Shevchenko wrote:
> On Mon, May 27, 2024 at 11:37:20PM +0300, Andy Shevchenko wrote:
>> On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:
> 
> ...
> 
>>> +MODULE_LICENSE("GPL");
>>
>> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().
> 
> And obviously + module.h in the inclusion block.
> 

The module.h is already included under include/kunit/test.h and that's the
reason compiler did not give any error. But I can still include it under
math.h for better readability as you suggested as anyway compiler will not
re-include if already included by another header file.

Also I see we were missing a dependency between math_kunit and kunit modules,
so adding a dependency there too.

Regards
Devarsh

