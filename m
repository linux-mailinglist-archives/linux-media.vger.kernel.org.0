Return-Path: <linux-media+bounces-41069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DAB3596E
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1EA172AD7
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 09:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71333218CD;
	Tue, 26 Aug 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="fTL3GjBl"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340B2F3624;
	Tue, 26 Aug 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202024; cv=pass; b=AsgMFbBkbkaaRJg82RJqhCrs7q6zVEXJ0ruA6GFwgwYnOk4uqXiXNZrbcwueFe/pAWh6UYSZE71SXd0YRWTjnJokLHfcyaD/gzth4vzfJyBNKNldspS7psXHkk9P1LRCFzidql7oHRTYrvIMjYE60BFd48JUYNkWpBmXvtJLQfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202024; c=relaxed/simple;
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2yXrkqi18s01NuYBDLhkIIcy6ve8LKp/B56NXEdEKpPUfeU/SQosdZiEOyXRxom6emO+yjc39s0gVml2iL5RFTtd9RMaMO5SO72e4rrwZrCr1/drVHbd6c5Kec4o1Ei/yHB+rllLMvGC9wIkQYSGTEtYka7TlYiE2CC1x+cX5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=fTL3GjBl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756201998; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X3ygrqwUSuwx6dHiIGUQtLF1gLG8fJGjuWMLZdLv54TwSfNdJyatQRzdOHwg8IQikXjAJdmXu2WqkEn1IZA+JnLYycuq0OynB3qzLDRc/t+X2pFpIXOAoF83H/2ieIJGXBdX72EbHm5guOqMpviXNO6BK2zU/9ELbPeEe1pyi8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756201998; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=; 
	b=NNnul6sK8D5SZXlwiOdk2Vo/2XiikXGdpMcK9jsQfThAUe78IoXcAFVswPcuX+vbd0O9b8k1xcXw9CWCkqJJOToJEBtxKviFge/LuvSpwCiMFXLX/qyCGA197jrsGey/MA0nAlXGlfdUpkFyJZl4oIsTvELgk4TJxsQ0gL4zcO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756201998;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=;
	b=fTL3GjBlvFAwIZNuysAvG47xhYwqyFQ1DdN7snGwnhGRKREejSWnp4NRUPxtrwC6
	7KTnFtpqBWhvVmVvz9hhmlF9hthuyMPDQnpDX8hY9cHYPtjGfr/N9OtCOEWjRm7ofmj
	0uUOyEhks8tNqzhWrXXScbIoOhM0h8Z4Ci6OCW18=
Received: by mx.zohomail.com with SMTPS id 1756201996213653.2470978174058;
	Tue, 26 Aug 2025 02:53:16 -0700 (PDT)
Message-ID: <002f164b-4296-428b-95ec-1ca10b979070@collabora.com>
Date: Tue, 26 Aug 2025 11:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: defconfig: enable Verisilicon IOMMU
To: Krzysztof Kozlowski <krzk@kernel.org>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 jgg@ziepe.ca, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-7-benjamin.gaignard@collabora.com>
 <b7869ddb-f44b-4d1f-a6c3-393a28d3cb00@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <b7869ddb-f44b-4d1f-a6c3-393a28d3cb00@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 26/08/2025 à 10:25, Krzysztof Kozlowski a écrit :
> On 25/08/2025 17:34, Benjamin Gaignard wrote:
>> Enable Verisilicon IOMMU used by RK3588 AV1 hardware codec.
> Qualcomm RK3588? This is defconfig for all platforms, so be specific
> which board uses it.

It is for rockchip rk3588 SoC.

Regards,
Benjamin

>
>
>
> Best regards,
> Krzysztof
>

