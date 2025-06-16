Return-Path: <linux-media+bounces-34977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4FADB5E7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8626A7ABBD8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB54283CBD;
	Mon, 16 Jun 2025 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="O00Z0Mng"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538A267713;
	Mon, 16 Jun 2025 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089081; cv=pass; b=NxlhIcnt1+T0WoboHIzqcbvvNbFcF72W8OdIU7gpVigf4sz5YU8gOrs2rGSBquOkFFzYNnfkZ2d99yLx38TZRfmQM/c+fNyNuX2g/KNqrXjl8fY8JlEkKa88GtxiUv4qPxTb8wRWUPWTibLKZlL9ZZZRqRZRozlZYK+g2bCmMnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089081; c=relaxed/simple;
	bh=LW6LRKly7A8iUbEbNuN5rTz2Cd6cxVcFdGxKG8bb1RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCNDmFGICNaUa7tbh7rOO5OoKFNE2x6JmtIib370LhQ0QDzZbnxUN/hbBGStk6mE8ZBPwYBj5B/MGp0h/YvswzUx/tyCiFCOtO5b+vSHFFi2f/KUXn6ZqUfHibibnaEAenyA6lWXvigY1pi8eEz6vVtNdDoy/NHI04vC39IqQZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=O00Z0Mng; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1750089056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CuDhxF78VIhhVcLLbtIDA2g0A3JRBwHgpImUgZeiW4qRpCpfJhMRtz9J7W9/puxsWBKS2acfafaaOewvv4xu4LVPozJ7XRFtOezMnAxj7ClBNDEEwJCQ0Ch+NjBHNxVysZS/2VczSP1P0vTDsE1lkxK3KyTiMGvcAXj1zlViM6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750089056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=170kxITiahI0WLlzh73GbaAad8nEI7X1qHMVlhx8xgg=; 
	b=hqKte0ENBFTvga3/nAdinwK6t+q6u3A5RAWGBNgVnX9QLBqT7VaAzL89uiBQzxJAVtYrpwnloyQGdNg2Q8Y7D9rjI8S+WLMgjmpLaxvUpGj7zar4BLkP56KNdtAIMcT6ldRRpJpG39V4tRI6nyjYBkdpmVyXS+zNiE6bsIpk8MA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750089056;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=170kxITiahI0WLlzh73GbaAad8nEI7X1qHMVlhx8xgg=;
	b=O00Z0MngrOahDkUAGWl2DFdJ+tJUMdAR2SM/vqPLM48emFpW6jWhyqfnh5pCpf1s
	+pT89k0SmwDB8LXI6AlbYd/0BdXSFRVUsz2T9jedNf4PMpibuiRBBn1r7LsFbMYe/qY
	+RmeU2GonGGrlMu9bQz7IfqYznSwDPBkLtiZwUeQ=
Received: by mx.zohomail.com with SMTPS id 1750089054716172.7304639178068;
	Mon, 16 Jun 2025 08:50:54 -0700 (PDT)
Message-ID: <2d251d7c-7906-4a66-9791-7f71e7a4b54d@collabora.com>
Date: Mon, 16 Jun 2025 17:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI
 IOMMU
To: Conor Dooley <conor@kernel.org>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-3-benjamin.gaignard@collabora.com>
 <20250616-winter-strict-db98f85db22d@spud>
 <5c971c09-c398-40a3-9ed5-ec38b6645e1d@collabora.com>
 <20250616-contempt-remix-5af2b7281cbd@spud>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250616-contempt-remix-5af2b7281cbd@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 16/06/2025 à 17:42, Conor Dooley a écrit :
> On Mon, Jun 16, 2025 at 05:30:44PM +0200, Benjamin Gaignard wrote:
>> Le 16/06/2025 à 17:14, Conor Dooley a écrit :
>>> On Mon, Jun 16, 2025 at 04:55:50PM +0200, Benjamin Gaignard wrote:
>>>> Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
>>>> in front of hardware encoder and decoder blocks on SoCs using Verisilicon IP,
>>>> such as the Rockchip RK3588.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> ---
>>>>    .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
>>>>    1 file changed, 71 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>> new file mode 100644
>>>> index 000000000000..acef855fc61d
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
>>>> @@ -0,0 +1,71 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Verisilicon IOMMU
>>>> +
>>>> +maintainers:
>>>> +  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> +
>>>> +description: |+
>>>> +  A Versilicon iommu translates io virtual addresses to physical addresses for
>>>> +  its associated video decoder.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - const: verisilicon,iommu
>>> You're missing a soc-specific compatible at the very least here, but is
>>> there really no versioning on the IP at all? I'd be surprised if
>>> verisilicon only produced exactly one version of an iommu IP.
>> I only aware this version of the iommu for the moment.
> "for the moment", yeah. Is there any information that could be used to
> version this available?

The hardware block isn't documented in the TRM so I don't know if there is a version
field or something like that.

>
>> Does adding verisilicon,rk3588-iommu sound good for you ?
> It'd be "rockchip,rk3588-iommu", but sure.

"rockchip,rk3588-iommu" is already use for other MMUs in rk3588.


