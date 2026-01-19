Return-Path: <linux-media+bounces-51012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA2D3A0B1
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 08:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3AF6305331F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF6B33890B;
	Mon, 19 Jan 2026 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="LZ53M/g2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F8296BA8;
	Mon, 19 Jan 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809152; cv=pass; b=g5jlCmIAbce56WIJPCci4yxtJlj3CfnSpSqhIFis9Y89HTvj4b9cMfwkZ+/ZceO2SyaGXccAPrDfpqAyhnesxHk7r/MfovO8MLJWBkVHAYS7MuHHVmjRa0H9GlCbbNpxuCd78jqPwRIfKkmcFR7W4rNJbUAySm7gfUy1zBLcMyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809152; c=relaxed/simple;
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qewbWcdDKcVOludAwmesp6DLFWpWGVXH2XGAQEohsYQ9PcHbhp0RjBhtSEbvLET6l6jwJ+w6uSnxNYHn+4sEg2gRPUveZv5Pgqk6ShuvlptPG0eBVixPg+prExzaNyhajQOQGWvPyiMwLgVmM8ptJI/PIqo+ogvpyLzIHKKFqH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=LZ53M/g2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768809116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mzO0Shua/4atpUZeelS+ZQgvhxd/sOj/CdGT2JvtNeMdrVbhkDqiCS9/tV7FnuOgtAzsXgyTW6M+6SNLwsDsYzWs40xNLw32yj/UTaxF4oZ1vAkndP2vw1tPY7HYFoRntFpdk+Dc1ozUeSOyAbUUqDa14TNU1nR+g4DTDNJSJRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768809116; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=; 
	b=Hg/H46awInmh+1qx1wTLEihLOvryH7prxxthG9krTpP3W0tQSKdVc7E6BYEUNGCMzGkQghlgShPPLUzjz1/Ne+k8E+x32Yeev159MNkb8bGycTxgxCrfIHr7IF4AnoFDVKeJCKubc+sPePuqGbupQKROO4PorFB52mtssMAiJgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768809116;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=;
	b=LZ53M/g2B/lEi3Cw4XEq9FXGeHNwxs2mhesW0QOopdjdonaDtdoNwyxYVDQyoI0b
	6BP6qBItIYHg9DTgr4WdGf/GFsAmbWXc7txbco0MHXDt7+DZQ95SrCATlZE4vgGrA01
	CUZRUw3KPoT6CERFiPBpj2qltx4GApoQblEaUIRU=
Received: by mx.zohomail.com with SMTPS id 1768809113865738.6117525224621;
	Sun, 18 Jan 2026 23:51:53 -0800 (PST)
Message-ID: <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>
Date: Mon, 19 Jan 2026 08:51:46 +0100
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

I have already send v12 where I have removed the useless function.

Regards,
Benjamin

>
>
> -Joerg
>

