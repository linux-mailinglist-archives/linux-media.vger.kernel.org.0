Return-Path: <linux-media+bounces-33327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C2AC326C
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 06:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C90031897E4D
	for <lists+linux-media@lfdr.de>; Sun, 25 May 2025 04:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DDB155C82;
	Sun, 25 May 2025 04:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPa07mHV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9B320F;
	Sun, 25 May 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748148942; cv=none; b=DkgM7MHmuRwIKzHtrvNfGMeK6cGRkvR9aR5gPabFWp5tw6chpLAt7E4+YJAqCffI5NjbYNiyDeRCWMNKFyW9gWHm8Jj9MA1gOyuqRnfeuSYiozaqwsmbgH7+3yfxazkrMlYDCew048ZML5GPpoYkjp7HFZdkvH3aFXbgaUc7ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748148942; c=relaxed/simple;
	bh=bWw6f1oPVGszDiKHtYyvEIzbYdNJsCK4FK7ugxSRdS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhkW+zxEmqiN9I3PImxaJUgnOs0idWGxHJBMpXZPrZL3E6Koe9WgAMPhFfcbxSm6h2zhSAd4t1NcK1XkpuvXy3qbraWz9X7NRMImrkZgdVfE2nfyw0SQ2uiiWgHFFnDLPrX/X/oWtAoi8eGcHRn9wGNIwWiTGBBfoMAeaewiGMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPa07mHV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDB5C4CEEA;
	Sun, 25 May 2025 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748148942;
	bh=bWw6f1oPVGszDiKHtYyvEIzbYdNJsCK4FK7ugxSRdS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPa07mHVn+W/bK57GWXsNpWjBZGxRWs4pJYLeXBiBaWmDWOYIiN0qM7KWnImn1lVc
	 T9Jw4t+7Mci12ZoQvQgv+wIHBksqyQId2xZQFXjg8wbIOR/pRoQTsHQ7iRh+I2z8yf
	 H8GEGqtwkRF66y5gBOgXqttPcULKwgUAzp4hkAW9YD80vMfWZE5wjPXP/ufwre9i9q
	 k3ybE0GCpZskmZSAnTmW4HPGUPtex47VOI6eg/+DfRryNqa87VqlkFQSXUQKwSzvAk
	 hXzHtMH/b6QZYFC4M3nD6fEb2PlML7AkoofNcvEbXDopEMPTbMUVIfhJHdZPsh5olW
	 y0BI/cqJ/giqw==
Message-ID: <1e18c066-dc4c-4f54-a784-8edbfdd7b5d0@kernel.org>
Date: Sun, 25 May 2025 06:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB
To: Olivia Wen <olivia.wen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, teddy.chen@mediatek.com,
 yunkec@chromium.org
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-3-olivia.wen@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250524115144.3832748-3-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/05/2025 13:49, Olivia Wen wrote:
> This patch adds support for the MT8188 Image System's Local Arbiter
> (LARB) in the device tree bindings. The LARB is a crucial component in
> MediaTek's ImgSys architecture, responsible for managing memory access
> and arbitration between various hardware modules.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++

Your patchset wasn't tested, so I won't do full review. Be sure you test
it prior sending. Few nits below:

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> new file mode 100644
> index 000000000000..d2966c64ddb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml

Filename equal to compatible.

> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,imgsys-larbs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LARB Information for MediaTek Camera Image System Hardware
> +
> +maintainers:
> +  - Olivia Wen <olivia.wen@mediatek.com>
> +
> +description:
> +  Detailed configuration for MediaTek Camera Image System's Local Arbiter
> +  (LARB) hardware integration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-imgsys-larbs
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 30

This cannot be flexible. List the items, unless it is somehow obvious.


> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2

These are useless.

> +
> +required:
> +  - compatible
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
> +
> +    imgsys-l11b {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        compatible = "mediatek,mt8188-imgsys-larb";
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Why?

> +        iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
> +             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,

Fix alignment.



Best regards,
Krzysztof

