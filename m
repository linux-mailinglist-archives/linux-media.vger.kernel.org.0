Return-Path: <linux-media+bounces-15081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB1933D52
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 15:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87C3928344C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBA61802C9;
	Wed, 17 Jul 2024 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+7ZIT39"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87CF17F392;
	Wed, 17 Jul 2024 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721221469; cv=none; b=kmOcVoEn+QxIvYUjnldfCmDBWSfwaJuqeoIgjLClWuBzWkeKBblabBEbEY+cw1vcQhpLkbKReSSF+rFjvLk8HYnvhKRxcEDzEhLrdn7D2kyBADgMc0qCPun7XPOfh4kHlWI473uBg70ZDOkY1SRxzVlQ21YUDLa9JMueZ7pO3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721221469; c=relaxed/simple;
	bh=0nJG0B8tpwHicd3DA/yMLoYOmSIfLBiSn04eRLG4XiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AP1VzwSY7MDERNJk2tQk+5ECZkonb3h3/BsGdiL0aCgmPczn1fwjaAjXniBw6TUzDFlsY5U5MXAKFDtweAL/DzQ7E+tlbcNUYiGQFd6kvIv5Oqxg8PWFtsmtkd9xFOPbtNP8wmIJjhKLHoXwAcRviUuDsocFC/PFEcsoK4geUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+7ZIT39; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA9DC4AF09;
	Wed, 17 Jul 2024 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721221469;
	bh=0nJG0B8tpwHicd3DA/yMLoYOmSIfLBiSn04eRLG4XiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+7ZIT39Tx8+g2gc872i1IEZSV0sPsor98iZECH3GPjuIhJuQdbm0OYlRwKNCAdIy
	 tGi2JW00ym44ECKP+wnZDYza0aaNM9JoMwnnbvdgSFqhN7uE6+KtcpjvFhJpeBfs4V
	 NeoEAfOQk8u+zHRh9A47l2mZixp1hpIiLtUpVlQY7tx5T0Ba98VDvWUBw6WI/m8TTp
	 Vyx663Xt+59C+qRtH1gN9JlmkCM58H/PZBFpgyrZRUKklnPY5DNK4gdY88AI8E0RDg
	 ru97MNy56h6KCMCULO2CUME45ZFmuzHl39RhXu2XVNNxx5Rt4+vyYS8mr2wMzBTGJg
	 BJ2nY3Czf7kqw==
Message-ID: <44aa4f77-1f9e-47ec-a955-0dc991d8f6d1@kernel.org>
Date: Wed, 17 Jul 2024 15:04:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: add MT8188 AIE
To: 20220614094956 created <yelian.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
 <20240717125426.32660-2-yelian.wang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240717125426.32660-2-yelian.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/07/2024 14:41, 20220614094956 created wrote:
> From: Yelian Wang <yelian.wang@mediatek.com>
> 
> Add YAML device tree binding for MT8188 AIE.
> 
> Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek-aie.yaml          | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml

Filename matching compatible.

> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-aie.yaml b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
> new file mode 100644
> index 000000000000..300aef43e02b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: The AIE Unit of MediaTek Camera System

What is AIE?

> +
> +maintainers:
> +  - Yelian Wang <yelian.wang@mediatek.com>
> +
> +description:
> +  MediaTek AIE is the ISP unit in MediaTek SoC.


AIE is ISP? Say something more, including unwinding of the acronym.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8188-aie
> +      - enum:
> +          - mediatek,aie-hw3.1
> +          - mediatek,aie-hw3.0

Nope, you cannot have flexible fallbacks. Anyway, drop hardware
versions. Do you see them anywhere in other bindings? Use only SoC
compatible.


> +
> +  "#address-cells":
> +    const: 2

Why?


> +
> +  "#size-cells":
> +    const: 2

Why?

> +
> +  reg:
> +    maxItems: 2

You must list and describe items.


> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Must contain the local arbiters in the current SoCs, see
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +      for details.
> +
> +  iommus:
> +    maxItems: 4
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +    minItems: 4

Drop minItems.

List and describe the items instead.

> +
> +  clock-names:
> +    items:
> +      - const: IMG_IPE
> +      - const: IPE_FDVT
> +      - const: IPE_SMI_LARB12
> +      - const: IPE_TOP

Nope. Please use DTS coding style.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>

You do not use anything from this header.

> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +    #include <dt-bindings/power/mediatek,mt8188-power.h>
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +    aie: aie@15310000 {

Drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof


