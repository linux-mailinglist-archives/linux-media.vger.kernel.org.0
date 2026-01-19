Return-Path: <linux-media+bounces-51038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 437CFD3A514
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAB5E309F047
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FAE356A1D;
	Mon, 19 Jan 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="IzMYIQ9x"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916FA2D12F5;
	Mon, 19 Jan 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818521; cv=pass; b=UtXvCdLrgkvBc1MkgxzAhEbz086CmXXpsEBc1UwqH17xXuMr2afrbs16D833Uz9OoDJyr+Rltm4dwvJb7GN18uIyQM7AY2PqDyydaiR8ZP3uzSoE8vWwUOFgdrPLJcZe5bOwy7H37AWIogwiSahLxZBSLUUJmyUGWMyMOzI2Qck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818521; c=relaxed/simple;
	bh=UHOcM8dCH3oMm/0168Hmp5M7ehoLPJvYL3gflDB1RII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UygcvxcjuO7F9org2GkFx0ljgN5ENG/xC1Vg06xREodxL3ilWaYOqBbb1XPcds6053OFRUHbOaBSvbsw6PHUjowSt6jtrMNHnk/miM5QQbVM9ig/di9TDlFnx0m4BhhvOr1tVmlEVSO5o67+/IU0TX8S+KXMT+Y8Er6kQ/nVutw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=IzMYIQ9x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768818497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c2+Oc9wLMk54ge9fXvqUDFJyAAT7ec7rGEzKziR5QaN+z1z+rYOLC4VTelqvmOGmxAWYdKRr6O6s6MNKpwLXDhlL5lcGObgtP0rdHil9Vb0BGdsnIs4YglM6IDmVEaxWfWUQUdSpnEvc+N1CvCq+b7wf0NJz67YVdzuQZegORwk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768818497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EsuevJkgsl5C8dp30TcVS68HeqiqukUtd3I4/TFexqc=; 
	b=PCpgNlj7n6I5+jp2Tf7Tr7dHfDi1tCAjsYDvdzMx5yFgbzZX6WT/h8sBwDUjW/hCqwYF0Ev65ozoN4kome1DuU0c3HYx8O/Q3KClOtdpMKpcdvH15iWcsAngNGweP3xIAGbiJSVfDmHKROVyhsDbXAFuGlYofF0jcARnDjD9J1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768818497;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EsuevJkgsl5C8dp30TcVS68HeqiqukUtd3I4/TFexqc=;
	b=IzMYIQ9xcILSyPL5IEgFBFGVo7j1D7ZBB9+pLkD8TJou1OhxL5m2aeY0mUG8sBsv
	Wv1ahwlZ/JxKsdyJ4LI5HiTSJL64r53/U8Kqgk1RJy/0aMnZ+lBkwQr9s8a6uXe7Fe1
	Ncr7UNildBZ9+LxfW3aXn6Ywt29jhDAL6JPF1W+g=
Received: by mx.zohomail.com with SMTPS id 1768818497079716.4924558723245;
	Mon, 19 Jan 2026 02:28:17 -0800 (PST)
Message-ID: <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>
Date: Mon, 19 Jan 2026 11:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 18/01/2026 à 10:41, Jörg Rödel a écrit :
> Benjamin,
>
> On Tue, Jan 13, 2026 at 04:10:51PM +0000, Will Deacon wrote:
>> I took another look at this to see whether it had changed significantly
>> from v6 when compared to the rockchip driver. Sadly, they still look
>> very similar to me and I continue to suspect that the hardware is a
>> derivative. I really don't understand why having a shared implementation
>> of the default domain ops is difficult or controversial. Have you tried
>> to write it?
> When updating for v12, can you please put an explanatory comment at the top of
> the file explaining the relationship of the IP this driver is for to the
> RockChip IOMMU and the rationale for having it as a separate driver? I want
> this part of the discussion documented in the code in case it comes up again.

Does the follow wording summarize the situation correctly for you if I put it
in header comment ?

  * This hardware block is using a 2 pages tables allocation structure.
  * That make very similar to Rockhip iommu hardware blocks but it has
  * it own driver because the registers offset and configuration bits
  * are completely different. An additional raison is that this hardware
  * has been developped by Verisilicon to be used by their hardware video
  * decoders and for a general purpose like Rockchip iommus.

Regards,
Benjamin

>
>
> -Joerg
>

