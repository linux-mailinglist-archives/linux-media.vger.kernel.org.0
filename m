Return-Path: <linux-media+bounces-35108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B34ADD574
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 18:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13ED619430AF
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2D12E9753;
	Tue, 17 Jun 2025 16:05:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315CB2F2346;
	Tue, 17 Jun 2025 16:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176303; cv=none; b=S/g14bFWkVLzh6VLGSAYA/+x2dgJLeVD4S3sN5EM1hpuYlGTle5Sv5mxXBAmu06C07PSEyuokmVjrENO55h/0lIC/crFtAvE7U5WtF2xooAyXleq832jBvkhQnLpERripOf9u/D8vreKcwC2QxdwQcqEl8XYAVAli0vQxvohZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176303; c=relaxed/simple;
	bh=AShrXstpxabo8piYDidsiIc4xCMvnXyyyySgGWqcjpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGSdn+yeNlm6fZToWxsHhd8Kz1pDCCkngej134fZqL8Fs82EWtsSbaA7Zc9l4OI/WkhIdbkcSTOyD2GlwQc/YlZVh00oYxUag3SawosBdDfYc7duKkz5Uei8CyfxCDKreJSsLejftQ/1XHW94dAClC9y7l06KNtnOpRIxnxylLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A5D2150C;
	Tue, 17 Jun 2025 09:04:40 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267763F58B;
	Tue, 17 Jun 2025 09:04:59 -0700 (PDT)
Message-ID: <77867c46-d868-4496-a1a3-45feb0bdd604@arm.com>
Date: Tue, 17 Jun 2025 17:04:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a
 frame
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-6-benjamin.gaignard@collabora.com>
 <20250617155822.GE1376515@ziepe.ca>
 <30a48107-8e98-42dd-a5a7-9c87c9eb538d@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <30a48107-8e98-42dd-a5a7-9c87c9eb538d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/06/2025 5:01 pm, Benjamin Gaignard wrote:
> 
> Le 17/06/2025 à 17:58, Jason Gunthorpe a écrit :
>> On Mon, Jun 16, 2025 at 04:55:53PM +0200, Benjamin Gaignard wrote:
>>> Flush the IOMMU mapping before decoding a frame to ensure that all 
>>> memory
>>> translations are properly applied.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>> This is a really big red flag.
>>
>> iommu translations are supposed to be controlled by the iommu driver
>> and should be flushed as part of the iommu map/unmap flows. It should
>> never be necessary to do something like this.
> 
> I have redone tests without this patch and the decode is perform correctly.
> I will drop it in the next version.
> I think I have fix the reference frame management in the driver so it 
> becomes
> useless.

If it turns out the hardware does require a TLBI to guarantee new 
mappings are visible, though, then the correct way is to implement the 
iotlb_sync_map op.

Thanks,
Robin.

