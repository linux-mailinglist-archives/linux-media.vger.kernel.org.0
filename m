Return-Path: <linux-media+bounces-31078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BCA9D0D0
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 20:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DAE14E246A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 18:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51C22192F3;
	Fri, 25 Apr 2025 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="al6VijCa"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC72040A8;
	Fri, 25 Apr 2025 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607064; cv=pass; b=fko4ZRLr5QADY26vEv0AUtD/5fzTIooGSwa+V+pCzhAf0F54bkRA5TGM54KDHUAv0Xwoxb+Qh70I7MwcV/Km/0nh9G0yFIum6fg+DXpqy4JWhEKukXlNXWxl7qZvckHKErUTje9o/T7i8BQLC+YPWP7i5RfJ5a6KuS4cNehmQyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607064; c=relaxed/simple;
	bh=WISNaajJfoVG+eHnKEldxVO6N2dbvZvArXO+fOqnRBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJfUS++sg259xieildaGPIEeQWKpz2PFBM7z69AFvUyP0pPl2UWvQ0sy5DHJIcNfOv6Ym6MQepFm4H658AzTRamVBGc6SUoSOJa4AzOOgE7r3imx/000ASmp7gHWTTxUFPjzr4szdL6WRWVwAyL5skEPTHDESmTcBPYxLOTtU8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=al6VijCa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745607031; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PZblNby2kNMGIbAGzDVzwLiumkkQhhxjcsBYLiOL8UD+2K2d0EtoWEFqnCouiiLqtOAvfl/Qhw+7qvmEi04zwvH3gzT7v2gRv8VmjCogvFNeLMBJA9qMiqWZ9iqG2AjXYrq96nDGb82ZUdbU5sz40HOAQBSt1rzPmRp5mVRpgZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745607031; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=87movGfsgkKvCCO2hsLlnVrga1A0glMJM4uj70IwRA4=; 
	b=PuySUUok4jjuwpyxKWK3hE0vMWd5hkFuzO4+h/W2NcDzZDa06IfMxzwR2msIDlSuqn5ozjBaeib3XBCLDGrI3Q44MRamBuvWlDqojZmyhpCBsZ8eOgHSq7w8c0qi2wq25CojDG9oak+IcTNcav/f1CUFKHQ6lMLyuFdeFAIe7kI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745607031;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=87movGfsgkKvCCO2hsLlnVrga1A0glMJM4uj70IwRA4=;
	b=al6VijCaLZB9Ojg/CKlBpPpTiL4L3l7bnLYNsd3XxABO+a0i9ArBlgH6/pNQgvmw
	i2wxG3w96SF06YXzw9QwprVhD2lASN8UGy+OqLVEwhlQAKGpgTbA2Q31tFVZDA2UHlZ
	53mE1YO5TJSM/79t3EN/Inuxk3Vm6KA0OhJHhhKQ=
Received: by mx.zohomail.com with SMTPS id 1745607028843569.4630920933195;
	Fri, 25 Apr 2025 11:50:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-rockchip@lists.infradead.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
Date: Fri, 25 Apr 2025 20:50:21 +0200
Message-ID: <14333638.uLZWGnKmhe@workhorse>
In-Reply-To: <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
References:
 <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 25 February 2025 08:55:47 Central European Summer Time Tomeu Vizoso wrote:
> Add the bindings for the Neural Processing Unit IP from Rockchip.
> 
> v2:
> - Adapt to new node structure (one node per core, each with its own
>   IOMMU)
> - Several misc. fixes from Sebastian Reichel
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a9f4aa7c1901362a3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Neural Processing Unit IP from Rockchip
> +
> +maintainers:
> +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +
> +description:
> +  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
> +  open source NVDLA IP.
> +
> +properties:
> +  $nodename:
> +    pattern: '^npu-core@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core-top
> +          - const: rockchip,rknn-core-top
> +      - items:
> +          - enum:
> +              - rockchip,rk3588-rknn-core
> +          - const: rockchip,rknn-core
> +
> +  reg:
> +    maxItems: 1

Hi Tomeu,

as you probably know, RK3576 has quite a similar NPU. This is why I'm currently
poking at this patch series. One of the differences I ran into was that the
IOMMU of each NPU core now sits within the reg address space range of the core
as described by the single reg item binding and assumed by the driver.

This seemed weird to me at first, since I would've guessed the cores would be
exactly the same, but I noticed that they kind of still are; the RK3588's NPU
also has a "hole" between 0x2000 and 0x2fff on each core, which is where RK3576
put its IOMMU.

This is some information I gleaned from the RK3588 TRM, specifically section
36.4.1 "Internal Address Mapping", which shows where each "part" of the NPU core
has its address space.

Right now we just represent this as a single reg item per core. I've played
with the idea of splitting this up into the distinct ranges the TRM lists and
giving each a reg-names entry, but this would require a major rework of the
driver from what I can tell, including to the auto-generated register header.

For now, my hack on RK3576 is to just ioremap the range defined by resource 
start to resource end inside rocket manually if I get -EBUSY trying to ioremap 
the resource proper. This is quite an ugly hack though, it means the IOMMU node 
still has its address overlapping with another node in the DT, and it also means 
we have an unavoidable error message printed into the kernel log. This is also
what the vendor driver seems to do.

What do you reckon is a reg setup in the binding that is both reasonable to
implement in the driver while accurately describing the hardware?

The RK3568, which uses a similar NPU design has the IOMMU at an offset of 0xb000 
from the core's start of PC, so probably after any core specifics but before the 
global registers if I hazard a guess.

For those without access to the TRM: splitting this up into multiple reg items
per core precisely the way the TRM does it would result in no less than 10 reg
items on RK3588, if I count correctly.

Kind regards,
Nicolas Frattaroli



