Return-Path: <linux-media+bounces-42426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB99B54E26
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2422B3A6D4E
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28665309DC0;
	Fri, 12 Sep 2025 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="boIpsGXg"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21B2E8B90;
	Fri, 12 Sep 2025 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757680424; cv=pass; b=GBCSoq7eP+ZDMrYneeoGSlglhEQerU3MQ9dNPHVYrJSfHhZXfsZ9u753vDl6uKqeiEEkFLEwW8AJ3/3ZIXlcs2lmrBC6ws8zSBPXP4OHXqzFLAkvNrFurhUisNS1TOJ2XC4w+OMa4viHjUXMdd+ikLPSwYvZVydZQGwUpXDdzjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757680424; c=relaxed/simple;
	bh=gI2KfzM2aq/K9OsV2HIY4vUHjQHbykZZH3svP1jSZJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+lD3FR+TGR85Jl0SrBkr796xCiexOnoR8HqRDzH0jJ15W6cxhxvoN66BKB5uPlqdkeAGO6EeM8raRAAbJGH9Pz9690UK809FAZehi9DR+6AgJ694GBurcX52K1/82XQudd5I87oygRtiN1QupuzSC5xp821oYB29Lly2aA1xBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=boIpsGXg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757680393; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d9lx73cJ+3kbqYZ8pdZisBn1TYdH/TuEI9qHtLZVc0HiotwsWQwMUsygScWa/QCSnQDxrDWQdgrowkEpvxEVaPRwtGqoGt90P7eFUTt0rBxR43B8tFk0DCP02yq0s7o3S/xFBsV5yAQF0Cvj0KV6LCtV3pp487ju/iQaIqFu9uw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757680393; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6MSZWnj1jgR4thBvdLu3JU3z1ibbPCoj24oKf6RqCjE=; 
	b=CZLu6l3WO3PVuVjT/emEIylG9WJMo1+3F5CVysgk2x0zUx4eg4yvgKaZ3Szj1/W1vw2HUB92pdwaWEAQh70huS3eG3J7Gtade47mBZhzAHyZhBZ9neuWrOXSd1E+y7GEy4J+eNf+FJ4nXlF0kizicGGXFdegPR8vkp8z83ePE9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757680392;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6MSZWnj1jgR4thBvdLu3JU3z1ibbPCoj24oKf6RqCjE=;
	b=boIpsGXg6Oa36fHp704E35jAK+/U3XDz+CH4pbWZVUmBTzTFmmki+CCbcz/VW4Go
	/n3BtmkKJ5ZK9idA/tLZt43qcGWqzTZNVdpT6bplhRwhDf8RfCLubg5clkZEM7d8ie7
	eMXFLXVoWMeae2oo/2RUAV7YmGRWqFr1y97mOI+g=
Received: by mx.zohomail.com with SMTPS id 1757680390786230.58638870729078;
	Fri, 12 Sep 2025 05:33:10 -0700 (PDT)
Message-ID: <f009ff62-abbe-4305-91ca-9cc762ca4fb1@collabora.com>
Date: Fri, 12 Sep 2025 14:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 jgg@ziepe.ca, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 12/09/2025 à 13:47, Jörg Rödel a écrit :
> On Thu, Sep 11, 2025 at 05:57:13PM +0200, Benjamin Gaignard wrote:
>> The Verisilicon IOMMU hardware block can be found in combination
>> with Verisilicon hardware video codecs (encoders or decoders) on
>> different SoCs.
>> Enable it will allow us to use non contiguous memory allocators
>> for Verisilicon video codecs.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/iommu/Kconfig     |  11 +
>>   drivers/iommu/Makefile    |   1 +
>>   drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/vsi-iommu.h |  21 +
>>   4 files changed, 841 insertions(+)
>>   create mode 100644 drivers/iommu/vsi-iommu.c
>>   create mode 100644 include/linux/vsi-iommu.h
> This will not go in before Will Deacons comment about code duplication with the
> Rockchip driver is addressed.

It isn't the same hardware block, not from the same IP vendor and the bits set aren't the same.
pm_runtime, clock, spin_lock aren't managed differently.
The common point is they both use 2-level page table.

VSI iommu need an additional function to restore iommu context before decoding
each frame, rockchip doesn't need it.

Regards,
Benjamin

>
> 	Joerg

