Return-Path: <linux-media+bounces-42608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B0B59239
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50FB2164AD1
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB1C29B776;
	Tue, 16 Sep 2025 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="iAkofwVw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620391FC0ED;
	Tue, 16 Sep 2025 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015066; cv=pass; b=hR5e2geKHo70uEQOErSjLh6Rsw6IdCV7C+T1zRr26+VPn17RT5JbVTwmYtvJjCj/XDCgaoy1vhrqpCB8ymwyguRWGdFtI3TNEjMnBYAMjHuUV/Kl5JH+RhGy/NuPKK2Rbk52uxshS0kt+qJJjd+N08nJso2Uvx7S3sNRmfp8zeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015066; c=relaxed/simple;
	bh=UkZWILK+JDAs4j04OIqHn/mytGnhx9VYR5zccLHHIAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iETmkA9BXRGLaMg5mOtDbK/pWxL0CBqIb6D5khf195gByPV7BWv0/u0634s7tdvTQHyZTe96hBLipr3Ed7BqCQI6fg/HOfLt0DgL9b65BHrswjYSJ8EMXX5BwRPsAp8Dxt1X0Xz3vHs0MkGyHLCKu3D+LqBRJclg9NHl/VFFESc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=iAkofwVw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1758015027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g6fls8GpQFdJJPyn2BerMzHDaaltYp454eYLzT43Cl3hYaunv53ulpBxzd2zf8brKdIqfRJ18z3CNS7/uuslxP4w3OxLub0yh04coNNzQkt+UroO79VnUcDa0tLgS9JEpf+CzmEQX4tukcO5x+4poGC5xwHMdvXscmnCAHWCNns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758015027; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UkZWILK+JDAs4j04OIqHn/mytGnhx9VYR5zccLHHIAw=; 
	b=NPqS+DC2xqz9tx6skzBnfs9/piXDoU5PraVJi9PGCcXDw5I1edab4aepZ2WnfO7Ig660pH1Ln/8n1JkhgcncrYc9cKT4sjSx7NQOQIlJbbP4i19hoOkH5AR8hwP6bk8F4SP9ZcJb0kmUwb4rwRnJ6Xq6W3rH7NLJX+Cq/IiruPY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758015027;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UkZWILK+JDAs4j04OIqHn/mytGnhx9VYR5zccLHHIAw=;
	b=iAkofwVwvYWxN35eWDQYbLtMQHEW3Ayh0AdYskiOVW83Ky184bRoIjqvjkqDgmuB
	c88TJFdUgtOQB0tIbKsVtwf7B0BE9uzfwxLNQXhBiLlhI6BRLNu0kDRmyk7XXSOZHX7
	QFjd6wEm4ia9MCMkyq68jx3DYNwhJiTJmy/lj4js=
Received: by mx.zohomail.com with SMTPS id 1758015025274111.17127971304149;
	Tue, 16 Sep 2025 02:30:25 -0700 (PDT)
Message-ID: <0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com>
Date: Tue, 16 Sep 2025 11:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, robin.murphy@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-media@vger.kernel.org
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
 <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
 <20250915225806.GM882933@ziepe.ca> <aMkkYU-p2ouknnAc@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aMkkYU-p2ouknnAc@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/09/2025 à 10:48, Will Deacon a écrit :
> On Mon, Sep 15, 2025 at 07:58:06PM -0300, Jason Gunthorpe wrote:
>> On Sat, Sep 13, 2025 at 07:58:04AM +0200, Jörg Rödel wrote:
>>> [Adding Will back to Cc]
>>>
>>> On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
>>>> To me this rejection isn't about Benjamin's driver, all iommu seems to look
>>>> alike, so anyone else that would have sent new driver would have face the same
>>>> issue.
>>> This is about ignoring comments from one of the IOMMU maintainers. I am not
>>> going to merge a driver with open comments/objections[1] from Will (and a few
>>> others), so resolve this with him and get his Ack.
>> I would strongly object to trying to share map_pages, unmap_pages,
>> iova_to_phys, free and other iommu pt related functions in some
>> limited way instead of helping on the much more complete iommu pt
>> work. Which is what I said to Will, but for some reason he suggested
>> it anyhow.
> If the answer is to convert this to iommu pt, then so be it. My
> understanding was that was still premature at this stage but you know
> better than me.
>
> When I bothered to look at this driver side-by-side with the rockchip
> driver which, despite apparently being totally different IP (honest!),
> is *remarkably* similar, I summarised the similarity in the default
> domain ops:
>
> https://lore.kernel.org/all/aH5yR9CkYSJ4PaZV@willie-the-truck/
>
> But rather than respond to that, Benjamin just sent a new version. I
> was hoping for a bit more discussion...

Sorry if that had offend, you it wasn't the purpose.

Where you see similarities in the pattern I see lot of differences
everywhere that will required to duplicate the functions for each
hardware (locking schema, bit definition, power management, enable/disable).

Since the v6 I have fix lot of locking and pm_runtime issue and add a
function, needed by the video decoder, to flush the TLB.

My first attempt when writing Verisilicon driver was to add a variant
(like for rk iommu v2 I had already done) to Rockchip driver but mixing or
sharing structures or functions between Rockchip and Verisilicon is just a
nightmare because it requires to add "if else" everywhere.

Benjamin

>
>> Sorry, but it doesn't make sense to complain about duplication in
>> drivers and then not help advance one of the biggest projects to
>> actually concretely and comprehensively address that duplication.
> I don't think it needs to be one or the other. afaict, these drivers
> should share the default domain ops and if the page-table code is using
> iommu-pt then that's even better.
>
> Will

